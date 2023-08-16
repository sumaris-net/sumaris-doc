# Analyse des performances d'Imagine

> Date: 01 décembre 2022
> Auteur: Benoit LAVENIER

Le but de ce document est :
- D'analyser les temps d'execution longs, constatés sur Imagine, à l'Ifremer (base de préprod) 
- De maquetter des pistes d'améliorations

Et le cas échéant :
- De lister les impacts sur les outils existants du SIH (Outils d'admin, Allegro, etc.)
- De proposer un planning de mise en oeuvre des pistes retenues 

## Résumé

Chargement d'un LANDING :

- [x] Calcul de l'effort réalisé
- [x] Récupération du groupe opération indéfinie, d'un LANDING
- [ ] Récupération du navire d'un LANDING

Sauvegarde d'un LANDING :

- [x] Vérification de l'unicité d'un code de prélèvement
- [x] Trigger de mise à jour de SAMPLE
- [x] Lecture du landing, inutile après une sauvegarde
- [x] Récupération des groupes d'opération d'une marée
- [ ] Comptage d'un nombre de navires
- [x] Lecture des autres marées du même navire 

Suppression d'un LANDING
- [x] Sélection des ventes escomptées de la marée

Suppression d'un OBSERVED_LOCATION (sortie)
- [x] Comptage des SAMPLE saisis

## Performances au chargement

### Calcul de l'effort réalisé
- Description  : Requete executée depuis le tableau des lignes de plan, ou d'un débarquement 
- Temps : 
  - **15 secondes** (pour 20 stratégies - tableau des lignes de plan)  
  - ~ **15 secondes** (pour 1 stratégie - écran débarquement)
- Origine du problème :
  - Explain plan: full scan sur SAMPLE 
  - La vue SAMPLE utilise deux jointures (vers M_PROGRAM et PROGRAM) qui empêche l'utilisation des indexes sur la table réelle SAMPLE  
 
- Solution : Modifier la requete SUMARiS 
  - Dans le SQL, utilisé directement SIH2_ADAGIO_DBA.SAMPLE et non plus la vue
  - Impacts : Extraction SUMARiS (code conditionnel suivant une variable de configuration) 
  - Nouveau temps : 
    - 450ms (pour 20 stratégies)
    - 370ms (pour 1 stratégie)
  
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
        AND L.LANDING_DATE_TIME &gt;= APP.START_DATE
        AND L.LANDING_DATE_TIME &lt; APP.END_DATE + INTERVAL '1' DAY
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


### Récupération du groupe opération indéfinie, d'un LANDING

- Description: requête effectuée à chaque lecture/écriture de LANDING, pour constituer le métier principal et la zone de pêche
- Temps: 500ms, plusieurs fois pour chaque lecture/écriture d'une grappe 'LANDING
- Solution n°1 :
  - Ajouter un cache (par tripId) de quelques secondes, car l'opération indéfinie ne varie pas pour une même marée.
  - Penser à vider lors d'une mise à jour des groupes opérations indéfinies (exemple: quand les métiers sont mis à jour)
  - Nouveau temps : 500ms (1 une seule fois)

<details>
<summary>SQL</summary>
```sql
select min(operation0_.id) as col_0_0_ from sih2_adagio_dba_sumaris_map.operation operation0_ inner join sih2_adagio_dba_sumaris_map.trip trip1_ on operation0_.trip_fk=trip1_.id where trip1_.id=? and operation0_.start_date_time=trip1_.departure_date_time and operation0_.end_date_time=trip1_.return_date_time
```
</details>


### Récupération du navire d'un LANDING

- Description : Lecture d'un navire, d'un LANDING
- Temps : 126ms (par Landing)
- Solution :

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
where rownum &lt;= ?;
```
</details>


## Performances de sauvegarde

### Vérification de l'unicité d'un code de prélèvement
- Description: requête executée à chaque enregistrement sur SAMPLE, pour vérifier l'unicité du code de préèvement
- Temps : 9s (par SAMPLE). Soit 7.5min pour 50 SAMPLE
- Solution n°1 : création d'un index sur (PMFM_FK, ALPHANUMERICAL_VALUE)
  - Nouveau temps : 79ms
  ```sql
  create index IX_SAMPLE_MEAS_ALPHA_NUM on SAMPLE_MEASUREMENT (PMFM_FK, ALPHANUMERICAL_VALUE); 
  ```

- Solution n°2 : remplacer par un seul `count()` pour tous les samples (plutot qu'un par sample)
  NOTE: pas d'amélioration sans l'index de la solution 1
  - Nouveau temps : 
    - 10s (pour 115 tag_id)
    - 181ms (pour 1 tag_id)
  
- Solution n°3 : remplacer par un SQL optimisée pour Adagio (sans passer par les vues)
  NOTE: pas d'amélioration sans l'index de la solution 1 
  - Nouveau temps: 
    - 7s (pour 80 tag_id)
    - 181ms (pour 1 tag_id)

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


### Trigger de mise à jour de SAMPLE

- Description: Lors d'une mise à jour sur la vue SAMPLE, on ne sait pas encore si une ligne correspondane existe ou non dans M_SAMPLE.
  il est donc fait un update, puis un insert si la ligne n'existait pas
- Temps: non mesuré

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

- Solution n°1 : tester le retour de la commande UPDATE (`SQL%rowcount`): si nombre de ligne affectée == 0 => faire l'insert
  - Nouveau temps: non mesuré

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

- Solution n°2 : utiliser un `merge` Oracle.


### Lecture du landing, inutile après une sauvegarde

- Description : Lecture du landing, avec les observers
  Lors de la sauvegarde d'un Landing, le Pod cherche à valoriser la propriété `landing.trip.landing` alors qu'il est déjà chargé.
- Temps : 400ms pour un débarquement
- Solution : Remplir la propriété attendu avec le Landing sauvegardé
  - Nouveau Temps: nul

<details>
  <summary>SQL</summary>

  ```sql
  select landing0_.id                     as id1_28_0_,
         landing0_.comments               as comments2_28_0_,
         landing0_.control_date           as control_date3_28_0_,
         landing0_.creation_date          as creation_date4_28_0_,
         landing0_.landing_date_time      as landing_date_time5_28_0_,
         landing0_.landing_location_fk    as landing_location_11_28_0_,
         landing0_.observed_location_fk   as observed_location12_28_0_,
         landing0_.program_fk             as program_fk13_28_0_,
         landing0_.qualification_comments as qualification_comm6_28_0_,
         landing0_.qualification_date     as qualification_date7_28_0_,
         landing0_.quality_flag_fk        as quality_flag_fk14_28_0_,
         landing0_.rank_order             as rank_order8_28_0_,
         landing0_.recorder_department_fk as recorder_departme15_28_0_,
         landing0_.recorder_person_fk     as recorder_person_f16_28_0_,
         landing0_.trip_fk                as trip_fk17_28_0_,
         landing0_.update_date            as update_date9_28_0_,
         landing0_.validation_date        as validation_date10_28_0_,
         landing0_.vessel_fk              as vessel_fk18_28_0_,
         location1_.id                    as id1_31_1_,
         location1_.bathymetry            as bathymetry2_31_1_,
         location1_.comments              as comments3_31_1_,
         location1_.creation_date         as creation_date4_31_1_,
         location1_.daylight_saving_time  as daylight_saving_ti5_31_1_,
         location1_.description           as description6_31_1_,
         location1_.label                 as label7_31_1_,
         location1_.location_level_fk     as location_level_fk11_31_1_,
         location1_.name                  as name8_31_1_,
         location1_.status_fk             as status_fk12_31_1_,
         location1_.update_date           as update_date9_31_1_,
         location1_.ut_format             as ut_format10_31_1_,
         location1_.validity_status_fk    as validity_status_f13_31_1_,
         observers2_.landing_fk           as landing_fk1_29_2_,
         person3_.id                      as person_fk2_29_2_,
         person3_.id                      as id1_58_3_,
         person3_.avatar_fk               as avatar_fk11_58_3_,
         person3_.creation_date           as creation_date2_58_3_,
         person3_.department_fk           as department_fk12_58_3_,
         person3_.email                   as email3_58_3_,
         person3_.email_md5               as email_md4_58_3_,
         person3_.first_name              as first_name5_58_3_,
         person3_.last_name               as last_name6_58_3_,
         person3_.pubkey                  as pubkey7_58_3_,
         person3_.status_fk               as status_fk13_58_3_,
         person3_.update_date             as update_date8_58_3_,
         person3_.username                as username9_58_3_,
         person3_.username_extranet       as username_extranet10_58_3_,
         userprofil4_.person_fk           as person_fk1_59_4_,
         userprofil5_.id                  as user_profile_fk2_59_4_,
         userprofil5_.id                  as id1_121_5_,
         userprofil5_.creation_date       as creation_date2_121_5_,
         userprofil5_.label               as label3_121_5_,
         userprofil5_.name                as name4_121_5_,
         userprofil5_.status_fk           as status_fk6_121_5_,
         userprofil5_.update_date         as update_date5_121_5_
  from sih2_adagio_dba_sumaris_map.landing landing0_
         inner join sih2_adagio_dba_sumaris_map.location location1_ on landing0_.landing_location_fk = location1_.id
         left outer join sih2_adagio_dba_sumaris_map.landing2observer_person observers2_
                         on landing0_.id = observers2_.landing_fk
         left outer join sih2_adagio_dba_sumaris_map.person person3_ on observers2_.person_fk = person3_.id
         left outer join sih2_adagio_dba_sumaris_map.person2user_profile userprofil4_
                         on person3_.id = userprofil4_.person_fk
         left outer join sih2_adagio_dba_sumaris_map.user_profile userprofil5_
                         on userprofil4_.user_profile_fk = userprofil5_.id
  where landing0_.id = ?
  ```
</details>

### Récupération des groupes d'opération d'une marée
- Description: Après une sauvegarde de Landing, le Pod cherche à valoriser `landing.trip.operationGroups`.
- Solution : empêcher la valorisation du champ, en renseignant une liste vide plutot que `undefined`

<details>
    <summary>SQL</summary>

```sql
select operation0_.id as id1_47_, operation0_.comments as comments2_47_, operation0_.control_date as control_date3_47_, operation0_.end_date_time as end_date_time4_47_, operation0_.fishing_end_date_time as fishing_end_date_t5_47_, operation0_.fishing_start_date_time as fishing_start_date6_47_, operation0_.has_catch as has_catch7_47_, operation0_.metier_fk as metier_fk13_47_, operation0_.operation_fk as operation_fk14_47_, operation0_.physical_gear_fk as physical_gear_fk15_47_, operation0_.qualification_comments as qualification_comm8_47_, operation0_.qualification_date as qualification_date9_47_, operation0_.quality_flag_fk as quality_flag_fk16_47_, operation0_.rank_order_on_period as rank_order_on_per10_47_, operation0_.recorder_department_fk as recorder_departme17_47_, operation0_.start_date_time as start_date_time11_47_, operation0_.trip_fk as trip_fk18_47_, operation0_.update_date as update_date12_47_ from sih2_adagio_dba_sumaris_map.operation operation0_ cross join sih2_adagio_dba_sumaris_map.trip trip1_ where operation0_.trip_fk=trip1_.id and operation0_.trip_fk=? and operation0_.start_date_time<>trip1_.departure_date_time order by operation0_.rank_order_on_period asc
```
</details>

### Comptage d'un nombre de navires

- Description : TODO - analyser à quel endroit cela est nécessaire
- Temps : TODO 
- Solution : TODO

<details>
  <summary>SQL</summary>

  ```sql
  select count(vesselfeat0_.id) as col_0_0_
  from sih2_adagio_dba_sumaris_map.vessel_features vesselfeat0_
         left outer join sih2_adagio_dba_sumaris_map.vessel vessel1_ on vesselfeat0_.vessel_fk = vessel1_.id
         left outer join sih2_adagio_dba_sumaris_map.vessel_registration_period vesselregi2_
                         on vessel1_.id = vesselregi2_.vessel_fk
  where vesselfeat0_.vessel_fk = ?
    and nvl(vesselfeat0_.end_date, date '2100-01-01') >= ?
    and nvl(vesselregi2_.end_date, date '2100-01-01') >= ?
  ```  
</details>

### Lecture des autres marées du même navire

- Description : Requête servant à prévenir l'erreur de contrainte d'unicité sur FISHING_TRIP, pour la même date.
  La requête utilise une plage de date. L'explain plan montre l'utilisation de l'index `IX_FISHING_TRIP_V2` qui semble très longue. 
- Temps : 13s
- Solution : 
  - Retirer le filtrage sur les dates, pour filtrer plutot sur LANDING.OBSERVED_LOCATION_FK.
  - Nouveau temps: 8ms

<details>
  <summary>SQL</summary>

  ```sql
  select trip0_.id                        as id1_115_0_,
         program1_.id                     as id1_74_1_,
         location2_.id                    as id1_31_2_,
         location3_.id                    as id1_31_3_,
         trip0_.comments                  as comments2_115_0_,
         trip0_.control_date              as control_date3_115_0_,
         trip0_.creation_date             as creation_date4_115_0_,
         trip0_.departure_date_time       as departure_date_tim5_115_0_,
         trip0_.departure_location_fk     as departure_locatio11_115_0_,
         trip0_.program_fk                as program_fk12_115_0_,
         trip0_.qualification_comments    as qualification_comm6_115_0_,
         trip0_.qualification_date        as qualification_date7_115_0_,
         trip0_.quality_flag_fk           as quality_flag_fk13_115_0_,
         trip0_.recorder_department_fk    as recorder_departme14_115_0_,
         trip0_.recorder_person_fk        as recorder_person_f15_115_0_,
         trip0_.return_date_time          as return_date_time8_115_0_,
         trip0_.return_location_fk        as return_location_f16_115_0_,
         trip0_.update_date               as update_date9_115_0_,
         trip0_.validation_date           as validation_date10_115_0_,
         trip0_.vessel_fk                 as vessel_fk17_115_0_,
         program1_.comments               as comments2_74_1_,
         program1_.creation_date          as creation_date3_74_1_,
         program1_.description            as description4_74_1_,
         program1_.gear_classification_fk as gear_classificatio8_74_1_,
         program1_.label                  as label5_74_1_,
         program1_.name                   as name6_74_1_,
         program1_.status_fk              as status_fk9_74_1_,
         program1_.taxon_group_type_fk    as taxon_group_type_10_74_1_,
         program1_.update_date            as update_date7_74_1_,
         location2_.bathymetry            as bathymetry2_31_2_,
         location2_.comments              as comments3_31_2_,
         location2_.creation_date         as creation_date4_31_2_,
         location2_.daylight_saving_time  as daylight_saving_ti5_31_2_,
         location2_.description           as description6_31_2_,
         location2_.label                 as label7_31_2_,
         location2_.location_level_fk     as location_level_fk11_31_2_,
         location2_.name                  as name8_31_2_,
         location2_.status_fk             as status_fk12_31_2_,
         location2_.update_date           as update_date9_31_2_,
         location2_.ut_format             as ut_format10_31_2_,
         location2_.validity_status_fk    as validity_status_f13_31_2_,
         location3_.bathymetry            as bathymetry2_31_3_,
         location3_.comments              as comments3_31_3_,
         location3_.creation_date         as creation_date4_31_3_,
         location3_.daylight_saving_time  as daylight_saving_ti5_31_3_,
         location3_.description           as description6_31_3_,
         location3_.label                 as label7_31_3_,
         location3_.location_level_fk     as location_level_fk11_31_3_,
         location3_.name                  as name8_31_3_,
         location3_.status_fk             as status_fk12_31_3_,
         location3_.update_date           as update_date9_31_3_,
         location3_.ut_format             as ut_format10_31_3_,
         location3_.validity_status_fk    as validity_status_f13_31_3_
      from sih2_adagio_dba_sumaris_map.trip trip0_
         left outer join sih2_adagio_dba_sumaris_map.program program1_ on trip0_.program_fk = program1_.id
         left outer join sih2_adagio_dba_sumaris_map.location location2_
                         on trip0_.departure_location_fk = location2_.id
         left outer join sih2_adagio_dba_sumaris_map.location location3_
                         on trip0_.return_location_fk = location3_.id
      where (trip0_.program_fk in (101 /*SIH-OBSBIO*/))
         and trip0_.return_date_time >= TO_DATE('2022-09-28 00:01:00', 'YYYY-MM-DD HH24:MI:SS')
         and trip0_.departure_date_time <= TO_DATE('2022-09-27 23:59:00', 'YYYY-MM-DD HH24:MI:SS')
         and trip0_.vessel_fk = 300470
      order by trip0_.id asc;
  ```  
</details>

## Performances à la suppression

### Sélection des ventes escomptées de la marée

- Description : Lors d'une suppression d'un débarquement, la marée correspondante est supprimée en cascade.
  Les ventes escomptées (EXPECTED_SALE) à supprimées son d'abord sélectionnées, avant d'être également supprimée.
- Explain plan: lan'alyse montre que les index sur EXPECTED_SALE ne SONT PAS utilisée. La raison est que la vue EXPECTED_SALE utilise un `coleasce()`.
- Temps : 11s 426ms
- Solution : 
  - Retirer le `coleasce()` de la vue EXPECTED_SALE
  - Nouveau temps : 10ms

<details>
  <summary>SQL</summary>

  ```sql
  select expectedsa0_.trip_fk            as trip_fk6_9_0_,
         expectedsa0_.id                 as id1_9_0_,
         expectedsa0_.id                 as id1_9_1_,
         expectedsa0_.landing_fk         as landing_fk3_9_1_,
         expectedsa0_.sale_date          as sale_date2_9_1_,
         expectedsa0_.sale_location_fk   as sale_location_fk4_9_1_,
         expectedsa0_.sale_type_fk       as sale_type_fk5_9_1_,
         expectedsa0_.trip_fk            as trip_fk6_9_1_,
         location1_.id                   as id1_31_2_,
         location1_.bathymetry           as bathymetry2_31_2_,
         location1_.comments             as comments3_31_2_,
         location1_.creation_date        as creation_date4_31_2_,
         location1_.daylight_saving_time as daylight_saving_ti5_31_2_,
         location1_.description          as description6_31_2_,
         location1_.label                as label7_31_2_,
         location1_.location_level_fk    as location_level_fk11_31_2_,
         location1_.name                 as name8_31_2_,
         location1_.status_fk            as status_fk12_31_2_,
         location1_.update_date          as update_date9_31_2_,
         location1_.ut_format            as ut_format10_31_2_,
         location1_.validity_status_fk   as validity_status_f13_31_2_,
         saletype2_.id                   as id1_91_3_,
         saletype2_.comments             as comments2_91_3_,
         saletype2_.creation_date        as creation_date3_91_3_,
         saletype2_.description          as description4_91_3_,
         saletype2_.label                as label5_91_3_,
         saletype2_.name                 as name6_91_3_,
         saletype2_.status_fk            as status_fk8_91_3_,
         saletype2_.update_date          as update_date7_91_3_
  from sih2_adagio_dba_sumaris_map.expected_sale expectedsa0_
         inner join sih2_adagio_dba_sumaris_map.location location1_ on expectedsa0_.sale_location_fk = location1_.id
         inner join sih2_adagio_dba_sumaris_map.sale_type saletype2_ on expectedsa0_.sale_type_fk = saletype2_.id
  where expectedsa0_.trip_fk = 20795087
  ```
</details>

## Suppression d'un OBSERVED_LOCATION

### Comptage des SAMPLE saisis

- Description: la requete SQL de comptage ne prenais en compte que le lien SAMPLE -> LANDING -> OBSERVED_LOCATION
  Il manque le lien vis OPERATION, utilisé par Imagine.
- Temps : 8ms
- Solution : 
  - Ajouter la jointure vers OPERATION et TRIP
  - Nouveau temps: 291ms 
    /!\ après optimisation de la requête, il reste un FULL SCAN sur `M_SAMPLE`.
    Pour être rapide, il faudrait intégrer les colonnes de la vue `M_SAMPLE` dans `SIH2_ADAGIO_DBA.SAMPLE` 

## Actions restantes 

- Correctif sur SAMPLE.LABEL
  > j'ai trouvé un bug de remplissage de SAMPLE.LABEL (value "null#1", "null#2", etc.). Puis je faire un correctif ans les data SAMPLE SIH-OBSBIO ? 
  > (normalement on devrait avoir "SAMPLE#1", "SAMPLE#2)

- Correctif sur SAMPLE.RANK_ORDER: 
  > Le rankOrder n'est pas remplie, alors que le modèle SUMARIS l'exige. A cause d'un problème coté APP, résolu depuis. 
  > Puis je remplir cette colonne dans les données SIH-OBSBIO ?
  > En attendant, j'ai appliqué un contournement, en calculant un rankOrder quand cela est nécessaire, au chargement des SAMPLE

- Navires : indexation ElasticSearch
  > Est-ce possible d'avoir accès à un cluster EslasticSearch (de préprod ou de test) chez vous ?
  > Si oui, il me faudrait les paramètres de connexion (et les droits pour gérer des index et mappings pour Imagine) 
  > Je voudrais en effet indexer les tables navires, pour y faire les recherches dans les listes déroulantes plus rapidement. 
