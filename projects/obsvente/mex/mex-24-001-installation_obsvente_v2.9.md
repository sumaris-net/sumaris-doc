# Manuel de mise en exploitation d'ObsVente v2.9

> Auteur: Benoit LAVENIER
> Date création : 20/03/2024
> Mise à jour : 20/03/2024

Appliquer les [manuels d'exploitation common](../../common/mex) (v2.9)

Appliquer les [manuels d'exploitation ObsMer](../../obsmer/mex) (v2.9)

Liste des tickets réalisés :
- TODO

## Configuration du Pod

- Nouvelles options dans le fichier de configuration :
```properties
# Enumerations > PMFM fonctionnels
sumaris.enumeration.Pmfm.HAS_PETS.id=<id du PMFM "Présence de PETS ? (Booléen)">
sumaris.enumeration.Pmfm.IS_OBSERVED.id=<id du PMFM "Espèce observé ? (Booléen)">
sumaris.enumeration.Pmfm.NON_OBSERVATION_REASON.id=<id du PMFM "Raison de non observations">
# Enumerations > PMFM techniques
sumaris.enumeration.Pmfm.SALE_TYPE_ID.id=<id du PMFM "Type de vente (id)">
sumaris.enumeration.Pmfm.SPECIES_LIST_ORIGIN.id=<id du PMFM "Origine de la liste des espèce (PETS/Tirage au sort)">
sumaris.enumeration.Pmfm.TAXON_GROUP_ID.id=<id du PMFM "Espèce commerciales (id)">
# Enumerations > Valeurs qualitatives fonctionnels
sumaris.enumeration.QualitativeValue.SPECIES_LIST_ORIGIN_PETS.id=<id de la valeur qualitative "PETS" du PMFM "Origine de la liste des espèces">
sumaris.enumeration.QualitativeValue.SPECIES_LIST_ORIGIN_RANDOM.id=<id de la valeur qualitative "Tirage au sort" du PMFM "Origine de la liste des espèces">
# navire inconnu
sumaris.data.vessel.unknown.id=<ID navire inconnu>
sumaris.enumeration.Vessel.UNKNOWN.id=<ID navire inconnu>
```

## Schéma SIH2_ADAGIO_DBA

- Update `PROGRAM_PROPERTY`
  ```sql
    update PROGRAM_PROPERTY set label='sumaris.observedLocation.landings.autoFill' where label='sumaris.observedLocation.landing.autoFill';
  ```

- Définition de PMFM en booléen
  ```sql
  update m_parameter set is_boolean = 1 where CODE in ('IS_OBSERVED','PRESALE_AVAILABLE', 'PETS', 'UNCERTAIN_SPECIES');
  ```

- Création de PMFMs
  - Fiche Mantis : https://forge.ifremer.fr/mantis/view.php?id=65277
  - Script SQL de création des PMFMS : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/sql/oracle/create-pmfm.sql

- Création des options de stratégie
  - db-changelog : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle/db-changelog-4.4.0.xml?ref_type=heads

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Création du synonyme `OBSERVED_LOCATION_FEATURES_SEQ`
  ```sql
  create or replace synonym OBSERVED_LOCATION_FEATURES_SEQ for SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES_SEQ;
  ```

- Modification du trigger `TR_OBS_LOCATION_MEAS`
  ```sql
    create or replace trigger TR_OBS_LOCATION_MEAS
        instead of insert or update or delete
        on OBSERVED_LOCATION_MEASUREMENT
    declare
        l_obs_loc_feat_fk NUMBER(10) := NULL;
    begin
        case
            WHEN inserting THEN 
                BEGIN
                    -- select sur OBSERVED_LOCATION_FEATURES avec OBSERVED_LOCATION_FK
                    select ID into l_obs_loc_feat_fk from SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES where OBSERVED_LOCATION_FK = :new.OBSERVED_LOCATION_FK;
                EXCEPTION WHEN NO_DATA_FOUND THEN
                    l_obs_loc_feat_fk := -1;
                END;
                -- Si null, insertion dans OBSERVED_LOCATION_FEATURE avec un nexval (séquence de OBSERVED_LOCATION_FEATURES_SEQ)
                if (l_obs_loc_feat_fk = -1) then
                    select SIH2_ADAGIO_DBA_SUMARIS_MAP.OBSERVED_LOCATION_FEATURES_SEQ.nextval into l_obs_loc_feat_fk from dual;
                    insert into SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES(ID, START_DATE, CREATION_DATE, RANK_ORDER, OBSERVED_LOCATION_FK, QUALITY_FLAG_FK, PROGRAM_FK, VESSEL_TYPE_FK)
                    select l_obs_loc_feat_fk, OL.START_DATE_TIME, sysdate, 1, :new.OBSERVED_LOCATION_FK, 1, OL.PROGRAM_FK, 1 from SIH2_ADAGIO_DBA.OBSERVED_LOCATION OL where OL.ID = :new.OBSERVED_LOCATION_FK;
                end if;

            -- OBSERVED_LOCATION_MEASUREMENT itself
            insert into SIH2_ADAGIO_DBA.OBSERVED_LOCATION_MEASUREMENT(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, QUALITY_FLAG_FK,
                                                                     DEPARTMENT_FK, PMFM_FK, QUALITATIVE_VALUE_FK, OBSERVED_LOCATION_FEATURES_FK)
            values (:new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.QUALITY_FLAG_FK,
                                                                     :new.RECORDER_DEPARTMENT_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, l_obs_loc_feat_fk);



            -- M_OBS_LOCATION_MEAS (map columns of OBSERVED_LOCATION_MEASUREMENT for sumaris)
            insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_OBS_LOCATION_MEAS(ID, OBSERVED_LOCATION_FK, RANK_ORDER)
            values (:new.ID, :new.OBSERVED_LOCATION_FK, :new.RANK_ORDER);
        WHEN UPDATING THEN
            select ID into l_obs_loc_feat_fk from SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES where OBSERVED_LOCATION_FK = :new.OBSERVED_LOCATION_FK;
            -- select sur OBSERVED_LOCATION_FEATURES avec OBSERVED_LOCATION_FK
            -- A utiliser dans l'update
            -- OBSERVED_LOCATION_MEASUREMENT itself
            update SIH2_ADAGIO_DBA.OBSERVED_LOCATION_MEASUREMENT M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE,M.CONTROL_DATE=:new.CONTROL_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS,
                                                                      M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK, M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK, M.OBSERVED_LOCATION_FEATURES_FK = l_obs_loc_feat_fk
            where M.ID = :new.ID;
            -- M_OBS_LOCATION_MEAS update if row exists
            update M_OBS_LOCATION_MEAS MOLM set MOLM.RANK_ORDER=:new.RANK_ORDER
            where MOLM.ID = :new.ID;
            -- M_OBS_LOCATION_MEAS insert if row not exists
            insert into M_OBS_LOCATION_MEAS (ID, OBSERVED_LOCATION_FK, RANK_ORDER)
            select OLM.ID, :new.OBSERVED_LOCATION_FK, :new.RANK_ORDER from SIH2_ADAGIO_DBA.OBSERVED_LOCATION_MEASUREMENT OLM where OLM.ID = :new.ID and not exists (select * from M_OBS_LOCATION_MEAS MOLM where  MOLM.ID = :new.ID);
        WHEN DELETING THEN
            delete from SIH2_ADAGIO_DBA.OBSERVED_LOCATION_MEASUREMENT OLM where OLM.ID=:old.ID;
            delete from M_OBS_LOCATION_MEAS MOLM where MOLM.ID=:old.ID;
        end case;
    end;
  ```

- Modification du trigger `TR_OBSERVED_LOCATION`
  ```sql
    create or replace trigger TR_OBSERVED_LOCATION
      instead of insert or update or delete
      on OBSERVED_LOCATION
    begin
      case
        WHEN INSERTING THEN
          insert into SIH2_ADAGIO_DBA.OBSERVED_LOCATION(ID, START_DATE_TIME, END_DATE_TIME, COMMENTS, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, CREATION_DATE, UPDATE_DATE, RECORDER_PERSON_FK, RECORDER_DEPARTMENT_FK, LOCATION_FK, QUALITY_FLAG_FK, SAMPLING_STRATA_FK, PROGRAM_FK)
          select :new.ID, :new.START_DATE_TIME, :new.END_DATE_TIME, :new.COMMENTS, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.CREATION_DATE, :new.UPDATE_DATE, :new.RECORDER_PERSON_FK, :new.RECORDER_DEPARTMENT_FK, :new.LOCATION_FK,
                 :new.QUALITY_FLAG_FK, :new.SAMPLING_STRATA_FK, MP.CODE
          from SIH2_ADAGIO_DBA.M_PROGRAM MP
          where MP.ID = :new.PROGRAM_FK;
        WHEN UPDATING THEN
          update SIH2_ADAGIO_DBA.OBSERVED_LOCATION OL set OL.START_DATE_TIME=:new.START_DATE_TIME, OL.END_DATE_TIME=:new.END_DATE_TIME, OL.COMMENTS=:new.COMMENTS, OL.CONTROL_DATE=:new.CONTROL_DATE, OL.VALIDATION_DATE=:new.VALIDATION_DATE, OL.QUALIFICATION_DATE=:new.QUALIFICATION_DATE,
          OL.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, OL.CREATION_DATE=:new.CREATION_DATE, OL.UPDATE_DATE=:new.UPDATE_DATE, OL.RECORDER_PERSON_FK=:new.RECORDER_PERSON_FK, OL.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK,
          OL.LOCATION_FK=:new.LOCATION_FK, OL.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
          OL.SAMPLING_STRATA_FK=:new.SAMPLING_STRATA_FK,
          OL.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID=:new.PROGRAM_FK)
          where OL.ID = :new.ID;
        WHEN DELETING THEN
          delete from SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES OLF where OLF.OBSERVED_LOCATION_FK = :old.ID;
          delete from SIH2_ADAGIO_DBA.OBSERVED_LOCATION OL where OL.ID=:old.ID;
      end case;
    end;
  -```

- Modification du trigger `TR_OBSERVED_LOCATION`
  ```sql
     create or replace TRIGGER TR_LANDING
        instead of insert or update or delete
           on LANDING
             begin
              case
                WHEN INSERTING THEN
                   insert into SIH2_ADAGIO_DBA.LANDING(ID, LANDING_DATE_TIME, RANK_ORDER, COMMENTS, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE, LANDING_LOCATION_FK, FISHING_TRIP_FK, RECORDER_DEPARTMENT_FK,
                                                       PROGRAM_FK, VESSEL_FK, QUALITY_FLAG_FK, RECORDER_PERSON_FK, OBSERVED_LOCATION_FK)
                   select :new.ID, :new.LANDING_DATE_TIME, :new.RANK_ORDER, :new.COMMENTS, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.UPDATE_DATE, :new.LANDING_LOCATION_FK,
                          :new.TRIP_FK, :new.RECORDER_DEPARTMENT_FK, P.CODE, V.CODE, :new.QUALITY_FLAG_FK, :new.RECORDER_PERSON_FK, :new.OBSERVED_LOCATION_FK
                   from SIH2_ADAGIO_DBA.M_PROGRAM P, SIH2_ADAGIO_DBA.M_VESSEL V
                   where P.ID = :new.PROGRAM_FK and V.ID = :new.VESSEL_FK;
                WHEN UPDATING THEN
                   update SIH2_ADAGIO_DBA.LANDING L set L.LANDING_DATE_TIME=:new.LANDING_DATE_TIME, L.RANK_ORDER=:new.RANK_ORDER, L.COMMENTS=:new.COMMENTS, L.CREATION_DATE=:new.CREATION_DATE, L.CONTROL_DATE=:new.CONTROL_DATE, L.VALIDATION_DATE=:new.VALIDATION_DATE,
                                                        L.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, L.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, L.UPDATE_DATE=:new.UPDATE_DATE, L.LANDING_LOCATION_FK=:new.LANDING_LOCATION_FK, L.FISHING_TRIP_FK=:new.TRIP_FK,
                                                        L.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, L.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK, L.RECORDER_PERSON_FK=:new.RECORDER_PERSON_FK, L.OBSERVED_LOCATION_FK=:new.OBSERVED_LOCATION_FK,
                                                        L.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID=:new.PROGRAM_FK), L.VESSEL_FK = (select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID=:new.VESSEL_FK)
                   where L.ID = :new.ID;
                WHEN DELETING THEN
                   delete from SIH2_ADAGIO_DBA.LANDING L where L.ID=:old.ID;
              end case;
             end;
-```

- Modification de la vue `BATCH`
  ```sql
  create or replace view BATCH as
    select
      B.ID,
      B.COMMENTS,
      B.EXHAUSTIVE_INVENTORY,
      MB.HASH,
      B.INDIVIDUAL_COUNT,
      B.SUBGROUP_COUNT,
      case when B.LABEL='0' then 'CATCH_BATCH' else B.LABEL end as LABEL,
      B.RANK_ORDER,
      B.SAMPLING_RATIO,
      B.SAMPLING_RATIO_TEXT,
      --IS_CATCH_BATCH, managed by trigger
      B.CONTROL_DATE,
      --B.VALIDATION_DATE,
      B.QUALIFICATION_DATE,
      B.QUALIFICATION_COMMENTS,
      B.UPDATE_DATE,
      O.ID OPERATION_FK,
      S.ID as SALE_FK,
      B.PARENT_BATCH_FK,
      B.QUALITY_FLAG_FK,
      MB.RECORDER_DEPARTMENT_FK,
      B.REFERENCE_TAXON_FK,
      B.TAXON_GROUP_FK
  from SIH2_ADAGIO_DBA.BATCH B
    left outer join SIH2_ADAGIO_DBA.OPERATION O on O.CATCH_BATCH_FK = NVL(B.ROOT_BATCH_FK, B.ID)
    left outer join SIH2_ADAGIO_DBA.SALE S on S.CATCH_BATCH_FK = NVL(B.ROOT_BATCH_FK, B.ID)
    left outer join SIH2_ADAGIO_DBA_SUMARIS_MAP.M_BATCH MB on B.ID = MB.ID;
-```

- Modification du trigger `TR_BATCH`
  ```sql
    create or replace trigger TR_BATCH
      instead of insert or update or delete
        on BATCH
          begin
            case
              WHEN INSERTING THEN
                if :new.ID is null then
                  raise_application_error(-20000, 'BATCH.ID must be not null');
                end if;
                -- BATCH itself
                insert into SIH2_ADAGIO_DBA.BATCH(ID, IS_CATCH_BATCH, RANK_ORDER, LABEL, INDIVIDUAL_COUNT, SUBGROUP_COUNT, EXHAUSTIVE_INVENTORY, CHILD_BATCHS_REPLICATION, COMMENTS,
                                                  PARENT_BATCH_FK, SAMPLING_RATIO, SAMPLING_RATIO_TEXT, TAXON_GROUP_FK, REFERENCE_TAXON_FK,
                                                  CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE, QUALITY_FLAG_FK)
                values (:new.ID, case when :new.PARENT_BATCH_FK is null then 1 else 0 end, :new.RANK_ORDER, case when :new.LABEL='CATCH_BATCH' then '0' else :new.LABEL end,
                        :new.INDIVIDUAL_COUNT, :new.SUBGROUP_COUNT, coalesce(:new.EXHAUSTIVE_INVENTORY,0), 0, :new.COMMENTS, :new.PARENT_BATCH_FK, :new.SAMPLING_RATIO, :new.SAMPLING_RATIO_TEXT,
                        :new.TAXON_GROUP_FK, :new.REFERENCE_TAXON_FK,
                        :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.UPDATE_DATE, :new.QUALITY_FLAG_FK);
                if (:new.PARENT_BATCH_FK is null) then
                  -- update OPERATION if root batch
                    update SIH2_ADAGIO_DBA.OPERATION O set O.CATCH_BATCH_FK = :new.ID where O.ID = :new.OPERATION_FK;
                  -- update SALE if root batch
                    update SIH2_ADAGIO_DBA.SALE S set S.CATCH_BATCH_FK = :new.ID where S.ID = :new.SALE_FK;
                else
                  -- update ROOT_BATCH_FK
                    update SIH2_ADAGIO_DBA.BATCH B set B.ROOT_BATCH_FK = (select RB.ID from SIH2_ADAGIO_DBA.BATCH RB where RB.IS_CATCH_BATCH = 1 connect by prior RB.PARENT_BATCH_FK = RB.ID start with RB.ID = :new.ID)
                    where B.ID = :new.ID;
                end if;
                  -- M_BATCH (map columns of BATCH for sumaris)
                    insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_BATCH(ID, HASH, RECORDER_DEPARTMENT_FK)
                    values (:new.ID, :new.HASH, :new.RECORDER_DEPARTMENT_FK);
              WHEN UPDATING THEN
                -- BATCH itself
                  update SIH2_ADAGIO_DBA.BATCH B set B.RANK_ORDER=:new.RANK_ORDER, B.INDIVIDUAL_COUNT=:new.INDIVIDUAL_COUNT, B.SUBGROUP_COUNT=:new.SUBGROUP_COUNT,
                                                     B.EXHAUSTIVE_INVENTORY=coalesce(:new.EXHAUSTIVE_INVENTORY,0), B.COMMENTS=:new.COMMENTS,
                                                     B.PARENT_BATCH_FK=:new.PARENT_BATCH_FK, B.SAMPLING_RATIO=:new.SAMPLING_RATIO, B.SAMPLING_RATIO_TEXT=:new.SAMPLING_RATIO_TEXT,
                                                     B.TAXON_GROUP_FK=:new.TAXON_GROUP_FK, B.REFERENCE_TAXON_FK=:new.REFERENCE_TAXON_FK,
                                                     B.CONTROL_DATE=:new.CONTROL_DATE, B.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, B.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS,
                                                     B.UPDATE_DATE=:new.UPDATE_DATE, B.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                     B.IS_CATCH_BATCH = case when :new.PARENT_BATCH_FK is null then 1 else 0 end,
                                                     B.LABEL = case when :new.LABEL='CATCH_BATCH' then '0' else :new.LABEL end
                  where B.ID = :new.ID;
                    if (:new.PARENT_BATCH_FK is null) then
                      -- update OPERATION.CATCH_BATCH_FK if this batch is root
                        update SIH2_ADAGIO_DBA.OPERATION O set O.CATCH_BATCH_FK = :new.ID where O.ID = :new.OPERATION_FK;
                      -- update SALE.CATCH_BATCH_FK if this batch is root
                        update SIH2_ADAGIO_DBA.SALE S set S.CATCH_BATCH_FK = :new.ID where S.ID = :new.SALE_FK;
                    else
                      -- update ROOT_BATCH_FK
                        update SIH2_ADAGIO_DBA.BATCH B set B.ROOT_BATCH_FK = (select RB.ID from SIH2_ADAGIO_DBA.BATCH RB where RB.IS_CATCH_BATCH = 1 connect by prior RB.PARENT_BATCH_FK = RB.ID start with RB.ID = :new.ID)
                        where B.ID = :new.ID;
                    end if;
                    -- M_BATCH update if row exists
                      update M_BATCH MB set MB.HASH=:new.HASH, MB.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK
                      where MB.ID = :new.ID;
                    -- M_BATCH insert if row not exists
                      insert into M_BATCH (ID, HASH, RECORDER_DEPARTMENT_FK)
                      select B.ID, :new.HASH, :new.RECORDER_DEPARTMENT_FK from SIH2_ADAGIO_DBA.BATCH B where B.ID = :new.ID and not exists (select * from M_BATCH MB where  MB.ID = :new.ID);
                WHEN DELETING THEN
                  -- update OPERATION link
                  if (:old.PARENT_BATCH_FK is null) then
                    update SIH2_ADAGIO_DBA.OPERATION O set O.CATCH_BATCH_FK = null where O.ID = :old.OPERATION_FK;
                    update SIH2_ADAGIO_DBA.SALE S set S.CATCH_BATCH_FK = null where S.ID = :old.SALE_FK;
                  end if;
                  -- BATCH itself
                  delete from SIH2_ADAGIO_DBA.BATCH B where B.ID = :old.ID;
                  -- M_BATCH (map columns of BATCH for sumaris)
                  delete from SIH2_ADAGIO_DBA_SUMARIS_MAP.M_BATCH MB where MB.ID = :old.ID;
            end case;
          end;
-```

## Mise à jour du programme SIH-OBSVENTE

### Options pour le programme SIH-OBSVENTE

#### `sumaris.landing.rows.divider.pmfmId`
```properties 
sumaris.landing.rows.divider.pmfmId=3274
```
```sql
insert into program_property (id, label, name, program_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.landing.rows.divider.pmfmId', 3274, 80 , 1, sysdate);
```


#### `sumaris.data.strategy.resolution`
```properties 
sumaris.data.strategy.resolution=spatio-temporal
```
```sql
UPDATE PROGRAM_PROPERTY SET NAME='spatio-temporal'
WHERE LABEL='sumaris.data.strategy.resolution'
AND PROGRAM_FK='SIH-OBSVENTE';
```

#### `sumaris.trip.operation.batch.taxonGroup.enable`
```properties 
sumaris.trip.operation.batch.taxonGroup.enable=false
```
```sql
insert into program_property (id, label, name, program_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.trip.operation.batch.taxonGroup.enable', 'false', 80 , 1, sysdate);
```

### Stratégie "Métropole" (STRATEGY_PROPERTY)

#### Création de la stratégie "Métropole"
Création d'une stratégie avec Code = 'OBSVENTES-2024'

#### Options de la stratégie "Métropole"
```sql
insert into strategy_property (id, label, name, strategy_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.observedLocation.landings.autoFill', 'true', (select id from strategy where name='OBSVENTES-2024') , 1, sysdate)
```

#### Associations pour la résolution spatio-temporelle de la stratégie
```sql
INSERT INTO APPLIED_STRATEGY (STRATEGY_FK, LOCATION_FK) VALUES ((SELECT ID FROM STRATEGY WHERE NAME='OBSVENTES-2024'), 401);
TODO à développer
```

TODO : récupérer l'ID suite à l'insertion dans APPLIED_STRATEGY
```sql
INSERT INTO APPLIED_PERIOD (APPLIED_STRATEGY_FK, START_DATE, END_DATE) VALUES (TODO, '2023-11-01', '2025-12-01');
```

#### Protocole de collecte Métropole (PMFM_STRATEGY)

| Niveau d'acquisition        | Ordre | PSFM                                                                 | Oblig ? |
|----------------------------|-------|----------------------------------------------------------------------|---------|
| Lieu observé               | 1     | Disponibilité de la pré-vente - vente - totale - Observation par un observateur | Non     |
| Lieu observé               | 2     | Présence de PETS - vente - totale - Observation par un observateur           | Oui     |
| Débarquement (non observé) | 1     | Observée ? - vente - totale - Observation par un observateur                 | Oui     |
| Débarquement (non observé) | 2     | Raison de non observation - vente - totale - Observation par un observateur  | Oui     |
| Débarquement (non observé) | 3     | Espèce commerciale - vente - totale - Observation par un observateur (aucune)| Oui     |
| Débarquement (non observé) | 4     | Origine de l'espèce observée - vente - totale - Observation par un observateur | Oui     |
| Vente (non observée)       | 1     | Code du prélèvement - individu - totale - Inconnue                            | Non     |
| Marée et vente observées   | 1     | Poids - produit/lot - totale - Mesure par un observateur (kg)  | Non    |
| Marée et vente observées   | 2     | Poids - produit/lot - totale - Estimation par un observateur (kg)  | Non    |
| Marée et vente observées   | 3     | Poids déterminé par calcul - produit/lot - totale - Inconnue (kg)  | Non    |
| Marée et vente observées   | 4     | Catégorie de tri terrain - produit/lot - totale - Observation par un observateur    | Non     |
| Marée et vente observées   | 5     | Catégorie UE - produit/lot - totale - Observation par un observateur     | Non     |
| Marée et vente observées   | 6     | Etat  - produit/lot - totale - Diffusion par une Halle à marée  | Oui    |
| Marée et vente observées   | 7     | Présentation - produit/lot - totale - Observation par un observateur  | Oui    |
| Marée et vente observées   | 8     | Identification espèce à confirmer - vente - totale - Observation par un observateur  | Non    |
| Marée et vente observées   | 9     | Poids déterminé par calcul - produit/lot - totale - Calcul par relation taille/poids (kg)  | Non    |
| Mesure individuelle de capture- Sumaris | 1 | Sexe - produit/lot - totale - Observation par un observateur | Non |
| Mesure individuelle de capture- Sumaris | 2 | Longueur totale (LT) - individu - totale - Mesure au cm par un observateur (cm) | Oui |
| Mesure individuelle de capture- Sumaris | 3 | Poids - produit/lot - totale - Calcul observateur par RTP (kg) | Non |

### Stratégie "Outre-Mer" (STRATEGY_PROPERTY)

#### Création de la stratégie "Outre-Mer"
Création d'une stratégie avec Code = 'OBSVENTES-2024-OM'

#### Options de la stratégie "Outre-Mer"
```sql
insert into strategy_property (id, label, name, strategy_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.observedLocation.landings.autoFill', 'true', (select id from strategy where name='OBSVENTES-2024-OM') , 1, sysdate)
```

#### Associations pour la résolution spatio-temporelle de la stratégie

TODO

#### Protocole de collecte Outre-Mer (PMFM_STRATEGY)

| Niveau d'acquisition        | Ordre | PSFM                                                                 | Oblig ? |
|----------------------------|-------|----------------------------------------------------------------------|---------|
| Lieu observé               | 1     | Disponibilité de la pré-vente - vente - totale - Observation par un observateur | Non     |
| Débarquement (non observé) | 1     | Espèce commerciale - vente - totale - Observation par un observateur (aucune)| Oui     |

### Espèces PETS et Tirage au sort

#### PETS
```sql
INSERT INTO TAXON_GROUP_STRATEGY (TAXON_GROUP_FK, STRATEGY_FK, PRIORITY_LEVEL) VALUES (3611, (SELECT ID FROM STRATEGY WHERE NAME='OBSVENTES-2024'), 0);
```

#### Tirage au sort
```sql
INSERT INTO TAXON_GROUP_STRATEGY (TAXON_GROUP_FK, STRATEGY_FK, PRIORITY_LEVEL) VALUES (3069, (SELECT ID FROM STRATEGY WHERE NAME='OBSVENTES-2024'), 1);
```