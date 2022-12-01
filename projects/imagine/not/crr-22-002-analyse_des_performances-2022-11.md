# Analyse des performances d'Imagine

> Date: Novembre 2022

Le but de ce document est :
- D'analyser les temps d'execution longs, constatés sur Imagine, à l'Ifremer (base de préprod) 
- De maquetter des pistes d'améliorations

Et le cas échéant :
- De lister les impacts sur les outils existants du SIH (Outils d'admin, Allegro, etc.)
- De proposer un planning de mise en oeuvre des pistes retenues 

## Analyses des temps d'execution

### Calcul de l'effort réalisé
- Description  : Requete executée depuis le tableau des lignes de plan, ou d'un débarquement 
- Temps : **15 secondes** (pour 20 stratégies - tableau des lignes de plan)  
- Temps : **15 secondes** (pour 1 stratégie - écran débarquement)
- Origine du problème :
  - Explain plan: full scan sur SAMPLE 
  - La vue SAMPLE utilise deux jointures (vers M_PROGRAM et PROGRAM) qui empêche l'utilisation des indexes sur la table réelle SAMPLE  
  
- Solution n°1 : Ne plus lier SAMPLE à PROGRAM 
  - Dans SUMARiS : Supprimer complètement SAMPLE.PROGRAM_FK (en réalité, cette colonne n'est pas utile, car il ya toujours une tête de grappe au dessus).
  - Dans ADAGIO : 
    - Vérifier si toutes les données de SAMPLE utilise une tête de grappe
    - Si oui, passer SAMPLE.PROGRAM_FK en nullable, afin de pouvoir retirer le mapping dans la vue SUMARiS 
 
- Solution n°2 : Modifier la requete SUMARiS 
  - Dans le SQL, utilisé directement SIH2_ADAGIO_DBA.SAMPLE et non plus la vue
  - Impacts : Extraction SUMARiS (code conditionnel suivant une variable de configuration) 

<details>
    <summary>SQL</summary>
```sql
SELECT DISTINCT
    UPPER('SM') "RECORD_TYPE",
    ST.PROJECT "PROJECT",
    ST.STRATEGY "STRATEGY",
    APP.START_DATE "START_DATE",
    APP.END_DATE "END_DATE",
    APP.ACQUISITION_NUMBER "EXPECTED_EFFORT",
    count(distinct SM.ID) "REALIZED_EFFORT",
    count(distinct L.ID) "LANDING_COUNT",
    ST.PROGRAM_ID "PROGRAM_ID",
    ST.STRATEGY_ID "STRATEGY_ID"
FROM
    EXT_ST_956997758 ST
        LEFT OUTER JOIN APPLIED_STRATEGY APS ON APS.STRATEGY_FK = ST.STRATEGY_ID
        LEFT OUTER JOIN APPLIED_PERIOD APP ON APP.APPLIED_STRATEGY_FK = APS.ID
        LEFT OUTER JOIN LANDING L ON L.PROGRAM_FK = ST.PROGRAM_ID
        AND L.LANDING_DATE_TIME >= APP.START_DATE
        AND L.LANDING_DATE_TIME < APP.END_DATE + INTERVAL '1' DAY
        AND EXISTS (
                                             SELECT 1 FROM LANDING_MEASUREMENT LM
                                             WHERE LM.LANDING_FK = L.ID
                                               AND LM.PMFM_FK = 2867
                                               AND LM.ALPHANUMERICAL_VALUE = ST.STRATEGY
                                         )
        LEFT OUTER JOIN TRIP FT ON FT.ID = L.TRIP_FK
        LEFT OUTER JOIN OPERATION O ON O.TRIP_FK = FT.ID
        LEFT OUTER JOIN SAMPLE S ON S.OPERATION_FK = O.ID
        LEFT OUTER JOIN SAMPLE_MEASUREMENT SM ON SM.SAMPLE_FK = S.ID AND SM.PMFM_FK = 1435
GROUP BY
    ST.PROJECT, ST.STRATEGY,
    APP.START_DATE, APP.END_DATE, APP.ACQUISITION_NUMBER,
    ST.PROGRAM_ID, ST.STRATEGY_ID;
```
</details>

### Vérification de l'unicité d'un code de prélèvement
- Description: requête executée à chaque enregistrement sur SAMPLE, pour vérifier l'unicité du code de préèvement
- Temps : 9s (par SAMPLE). Soit 7.5min pour 50 SAMPLE

<details>
<summary>SQL</summary>
```sql
select sample0_.id                     as id1_92_,
       sample0_.batch_fk               as batch_fk15_92_,
       sample0_.comments               as comments2_92_,
       sample0_.control_date           as control_date3_92_,
       sample0_.creation_date          as creation_date4_92_,
       sample0_.hash                   as hash5_92_,
       sample0_.individual_count       as individual_count6_92_,
       sample0_.label                  as label7_92_,
       sample0_.landing_fk             as landing_fk16_92_,
       sample0_.matrix_fk              as matrix_fk17_92_,
       sample0_.operation_fk           as operation_fk18_92_,
       sample0_.parent_sample_fk       as parent_sample_fk19_92_,
       sample0_.program_fk             as program_fk20_92_,
       sample0_.qualification_comments as qualification_comm8_92_,
       sample0_.qualification_date     as qualification_date9_92_,
       sample0_.quality_flag_fk        as quality_flag_fk21_92_,
       sample0_.rank_order             as rank_order10_92_,
       sample0_.recorder_department_fk as recorder_departme22_92_,
       sample0_.recorder_person_fk     as recorder_person_f23_92_,
       sample0_.reference_taxon_fk     as reference_taxon_f24_92_,
       sample0_.sample_date            as sample_date11_92_,
       sample0_.sample_size            as sample_size12_92_,
       sample0_.size_unit_fk           as size_unit_fk25_92_,
       sample0_.taxon_group_fk         as taxon_group_fk26_92_,
       sample0_.update_date            as update_date13_92_,
       sample0_.validation_date        as validation_date14_92_
from sih2_adagio_dba_sumaris_map.sample sample0_
         inner join sih2_adagio_dba_sumaris_map.sample_measurement measuremen1_ on sample0_.id = measuremen1_.sample_fk
where measuremen1_.pmfm_fk = 1435
  and measuremen1_.alphanumerical_value = '22PLEUPLA002-0330'
order by sample0_.rank_order asc;
```
</details>

- Solution n°1 : création d'un index sur (PMFM_FK, ALPHANUMERICAL_VALUE)
  - Nouveau temps : 79ms
  ```sql
  create index IX_SAMPLE_MEAS_ALPHA_NUM on SAMPLE_MEASUREMENT (PMFM_FK, ALPHANUMERICAL_VALUE); 
  ```

- Solution n°1 : remplacer par un seul `count()` pour tous les samples (plutot qu'un par sample) 
  - Nouveau temps : 9s
- Solution n°2 : remplacer par un SQL optimisée pour Adagio (sans passer par les vues)
  - Nouveau temps: pas d'amélioration sans l'index
 
#### Récupération du groupe opération indéfinie, d'un LANDING

- Description: requête effectuée à chaque lecture/écriture de LANDING, pour constituer le métier principal et la zone de pêche
- Temps: 500ms, plusieurs fois pour chaque lecture/écriture d'une grappe 'LANDING
- Solution n°1 : 
  - Ajouter un cache (par tripId) de quelques secondes, car l'opération indéfinie ne varie pas pour une même marée.
  - Penser à vider lors d'une mise à jour des groupes opérations indéfinies (exemple: quand les métiers sont mis à jour)

<details>
<summary>SQL</summary>
```sql
select min(operation0_.id) as col_0_0_ from sih2_adagio_dba_sumaris_map.operation operation0_ inner join sih2_adagio_dba_sumaris_map.trip trip1_ on operation0_.trip_fk=trip1_.id where trip1_.id=? and operation0_.start_date_time=trip1_.departure_date_time and operation0_.end_date_time=trip1_.return_date_time
```
</details>

#### Récupération du navire

- Description : Lecture d'un navire, d'un LANDING 
- Temps : 

<details>
    <summary>SQL</summary>
```sql
select *
from (select distinct vesselfeat0_.id                       as id1_126_0_,
                      vessel1_.id                           as id1_125_1_,
                      vesselregi2_.id                       as id1_131_2_,
                      vesselfeat0_.administrative_power     as administrative_pow2_126_0_,
                      vesselfeat0_.auxiliary_power          as auxiliary_power3_126_0_,
                      vesselfeat0_.base_port_location_fk    as base_port_locatio20_126_0_,
                      vesselfeat0_.comments                 as comments4_126_0_,
                      vesselfeat0_.construction_year        as construction_year5_126_0_,
                      vesselfeat0_.control_date             as control_date6_126_0_,
                      vesselfeat0_.creation_date            as creation_date7_126_0_,
                      vesselfeat0_.end_date                 as end_date8_126_0_,
                      vesselfeat0_.exterior_marking         as exterior_marking9_126_0_,
                      vesselfeat0_.gross_tonnage_grt        as gross_tonnage_grt10_126_0_,
                      vesselfeat0_.gross_tonnage_gt         as gross_tonnage_gt11_126_0_,
                      vesselfeat0_.hull_material_qv_fk      as hull_material_qv_21_126_0_,
                      vesselfeat0_.ircs                     as ircs12_126_0_,
                      vesselfeat0_.length_over_all          as length_over_all13_126_0_,
                      vesselfeat0_.name                     as name14_126_0_,
                      vesselfeat0_.qualification_comments   as qualification_com15_126_0_,
                      vesselfeat0_.qualification_date       as qualification_dat16_126_0_,
                      vesselfeat0_.quality_flag_fk          as quality_flag_fk22_126_0_,
                      vesselfeat0_.recorder_department_fk   as recorder_departme23_126_0_,
                      vesselfeat0_.recorder_person_fk       as recorder_person_f24_126_0_,
                      vesselfeat0_.start_date               as start_date17_126_0_,
                      vesselfeat0_.update_date              as update_date18_126_0_,
                      vesselfeat0_.validation_date          as validation_date19_126_0_,
                      vesselfeat0_.vessel_fk                as vessel_fk25_126_0_,
                      vessel1_.comments                     as comments2_125_1_,
                      vessel1_.control_date                 as control_date3_125_1_,
                      vessel1_.creation_date                as creation_date4_125_1_,
                      vessel1_.program_fk                   as program_fk9_125_1_,
                      vessel1_.qualification_comments       as qualification_comm5_125_1_,
                      vessel1_.qualification_date           as qualification_date6_125_1_,
                      vessel1_.quality_flag_fk              as quality_flag_fk10_125_1_,
                      vessel1_.recorder_department_fk       as recorder_departme11_125_1_,
                      vessel1_.recorder_person_fk           as recorder_person_f12_125_1_,
                      vessel1_.status_fk                    as status_fk13_125_1_,
                      vessel1_.update_date                  as update_date7_125_1_,
                      vessel1_.validation_date              as validation_date8_125_1_,
                      vessel1_.vessel_type_fk               as vessel_type_fk14_125_1_,
                      vesselregi2_.end_date                 as end_date2_131_2_,
                      vesselregi2_.int_registration_code    as int_registration_c3_131_2_,
                      vesselregi2_.quality_flag_fk          as quality_flag_fk7_131_2_,
                      vesselregi2_.rank_order               as rank_order4_131_2_,
                      vesselregi2_.registration_code        as registration_code5_131_2_,
                      vesselregi2_.registration_location_fk as registration_locat8_131_2_,
                      vesselregi2_.start_date               as start_date6_131_2_,
                      vesselregi2_.vessel_fk                as vessel_fk9_131_2_
      from sih2_adagio_dba_sumaris_map.vessel_features vesselfeat0_
               inner join sih2_adagio_dba_sumaris_map.vessel vessel1_ on vesselfeat0_.vessel_fk = vessel1_.id
               left outer join sih2_adagio_dba_sumaris_map.vessel_registration_period vesselregi2_
                               on vessel1_.id = vesselregi2_.vessel_fk
      where vesselfeat0_.vessel_fk = ?
        and nvl(vesselfeat0_.end_date, date'2100-01-01') >= ?
        and nvl(vesselregi2_.end_date, date'2100-01-01') >= ?
      order by vesselfeat0_.start_date desc)
where rownum <= ?;
```
</details>


#### Récupération des opérations d'une maréé (non indefinie)

<details>
    <summary>SQL</summary>

```sql
select operation0_.id as id1_47_, operation0_.comments as comments2_47_, operation0_.control_date as control_date3_47_, operation0_.end_date_time as end_date_time4_47_, operation0_.fishing_end_date_time as fishing_end_date_t5_47_, operation0_.fishing_start_date_time as fishing_start_date6_47_, operation0_.has_catch as has_catch7_47_, operation0_.metier_fk as metier_fk13_47_, operation0_.operation_fk as operation_fk14_47_, operation0_.physical_gear_fk as physical_gear_fk15_47_, operation0_.qualification_comments as qualification_comm8_47_, operation0_.qualification_date as qualification_date9_47_, operation0_.quality_flag_fk as quality_flag_fk16_47_, operation0_.rank_order_on_period as rank_order_on_per10_47_, operation0_.recorder_department_fk as recorder_departme17_47_, operation0_.start_date_time as start_date_time11_47_, operation0_.trip_fk as trip_fk18_47_, operation0_.update_date as update_date12_47_ from sih2_adagio_dba_sumaris_map.operation operation0_ cross join sih2_adagio_dba_sumaris_map.trip trip1_ where operation0_.trip_fk=trip1_.id and operation0_.trip_fk=? and operation0_.start_date_time<>trip1_.departure_date_time order by operation0_.rank_order_on_period asc
```
</details>

#### Trigger de mise à jour de SAMPLE

- Description: Lors d'une mise à jour sur la vue SAMPLE, on ne sait pas encore si une ligne correspondane existe ou non dans M_SAMPLE.
  il est donc fait un update, puis un insert si la ligne n'existait pas
   
<details>
  <summary>SQL</summary>

  ```oraclesqlplus 
   --- (...)
   
   -- M_SAMPLE update if row exists
    update M_SAMPLE MS set MS.HASH=:new.HASH, MS.RANK_ORDER=:new.RANK_ORDER, MS.LANDING_FK=:new.LANDING_FK
    where MS.ID = :new.ID;
    -- M_SAMPLE insert if row not exists
    insert into M_SAMPLE (ID, HASH, RANK_ORDER, LANDING_FK)
    select S.ID, :new.HASH, :new.RANK_ORDER, :new.LANDING_FK from SIH2_ADAGIO_DBA.SAMPLE S where S.ID = :new.ID and not exists (select * from M_SAMPLE MS where  MS.ID = :new.ID);
    
    --- (...)
   ```  
</details>

- Solution n°1 : utiliser un `merge` Oracle.
- Solution n°2 : tester le retour de la commande UPDATE (`SQL%rowcount`): si nombre de ligne affectée == 0 => faire l'insert

  <details>
    <summary>New SQL</summary>
  
    ```sql 
      -- M_SAMPLE update if row exists
      update M_SAMPLE MS set MS.HASH=:new.HASH, MS.RANK_ORDER=:new.RANK_ORDER, MS.LANDING_FK=:new.LANDING_FK
      where MS.ID = :new.ID;
      -- M_SAMPLE insert if row not exists
      if (SQL%ROWCOUNT = 0) then
          insert into M_SAMPLE (ID, HASH, RANK_ORDER, LANDING_FK)
          values (:new.ID, :new.HASH, :new.RANK_ORDER, :new.LANDING_FK);
      end if;
    ```  
  </details>