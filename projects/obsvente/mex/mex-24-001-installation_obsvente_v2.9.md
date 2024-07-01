# Manuel de mise en exploitation d'ObsVente v2.9

> Auteur: Benoit LAVENIER
> Date création : 20/03/2024
> Mise à jour : 20/03/2024

Appliquer les [manuels d'exploitation ObsMer](../../obsmer/mex) (v2.9)

Liste des tickets réalisés :
- TODO

## Configuration du Pod

Enumerations 

```properties
# PMFM fonctionnels
sumaris.enumeration.Pmfm.HAS_PETS.id=<id du PMFM "Présence de PETS ? (Booléen)">
sumaris.enumeration.Pmfm.IS_OBSERVED.id=<id du PMFM "Espèce observé ? (Booléen)">
sumaris.enumeration.Pmfm.NON_OBSERVATION_REASON.id=<id du PMFM "Raison de non observations">
# PMFM techniques
sumaris.enumeration.Pmfm.SALE_TYPE_ID.id=<id du PMFM "Type de vente (id)">
sumaris.enumeration.Pmfm.SPECIES_LIST_ORIGIN.id=<id du PMFM "Origine de la liste des espèce (PETS/Tirage au sort)">
sumaris.enumeration.Pmfm.PMFM_TAXON_GROUP_ID.id=<id du PMFM "Espèce commerciales (id)">
sumaris.data.vessel.unknwon.id=<ID navire inconnu>

```

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Création du synonyme `OBSERVED_LOCATION_FEATURES_SEQ`
  ```sql
    create or replace synonym OBSERVED_LOCATION_FEATURES_SEQ for SIH2_ADAGIO_DBA.OBSERVED_LOCATION_FEATURES_SEQ;
-```

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
  ```

## Mise à jour du programme SIH-OBSVENTE

- TODO

- Options pour la stratégie "Métropole" (STRATEGY_PROPERTY) 

```properties
sumaris.observedLocation.landing.autoFill=true
```

- Options pour la stratégie "Outre-Mer" (STRATEGY_PROPERTY)
```properties
sumaris.observedLocation.landing.autoFill=false
```
