# Manuel de mise en exploitation d'ObsMer v2.9


Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.8

Liste des tickets réalisés :
- 

> Auteur: Benoit LAVENIER
> Date création : 26/09/2023
> Mise à jour : 26/09/2023

## Configuration du Pod

RAS  

## Schéma SIH2_ADAGIO_DBA

- Modification de PSFM : 
  - PSFM `PRODUCT_DESTINATION` : il manque `Obligation à débarquer`
  - Pour la capture accidentelle il faut un PSFM supplémentaire (ex: `état de remise à l'eau`)




- grants sur `SORTING_MEASUREMENT_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

### Creation d'un navire temporaire ? - A vérifier
- grants sur `VESSEL_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.VESSEL_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `M_VESSEL_REG_PERIOD_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.M_VESSEL_REG_PERIOD_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- Ajout de niveaux d'acquisition sur `ACQUISITION_LEVEL`
  ```sql
    insert into ACQUISITION_LEVEL (CODE, NAME) values ('SORTING_BATCH','Marée et vente observées - Sumaris');
    insert into ACQUISITION_LEVEL (CODE, NAME) values ('CATCH_BATCH','Capture - Sumaris');
    insert into ACQUISITION_LEVEL (CODE, NAME) values ('SORTING_BATCH_INDIVIDUAL','Mesure individuelle de capture- Sumaris');    
-```

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Appliquer les [manuels d'exploitation d'Imagine](../../imagine/mex) (v2.8)

- Mise à jour de la vue `IMAGE_ATTACHMENT`
  ```sql
  CREATE OR REPLACE FORCE VIEW "SIH2_ADAGIO_DBA_SUMARIS_MAP"."IMAGE_ATTACHMENT" ("ID", "COMMENTS", "PATH", "CONTENT", "CONTENT_TYPE", "DATE_TIME", "CREATION_DATE", "CONTROL_DATE", "VALIDATION_DATE", "QUALIFICATION_DATE", "QUALIFICATION_COMMENTS", "UPDATE_DATE", "QUALITY_FLAG_FK", "RECORDER_DEPARTMENT_FK", "OBJECT_ID", "OBJECT_TYPE_FK", "RECORDER_PERSON_FK") AS
  select ID,
  COMMENTS,
  PATH,
  CONTENT,
  CONTENT_TYPE,
  PHOTO_DATE as DATE_TIME,
  null as CREATION_DATE,
  null as CONTROL_DATE,
  VALIDATION_DATE,
  QUALIFICATION_DATE,
  QUALIFICATION_COMMENTS,
  UPDATE_DATE,
  cast(QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK,
  DEPARTMENT_FK as RECORDER_DEPARTMENT_FK,
  OBJECT_ID,
  OBJECT_TYPE_FK,
  null as RECORDER_PERSON_FK
  from SIH2_ADAGIO_DBA.PHOTO P;
-```

- Ajout du trigger `TR_IMAGE_ATTACHMENT`
  ```sql
  create or replace trigger TR_IMAGE_ATTACHMENT
    instead of insert or delete
      on IMAGE_ATTACHMENT
        begin
          case
            WHEN INSERTING THEN
              insert into SIH2_ADAGIO_DBA.PHOTO(ID, OBJECT_ID, COMMENTS, PATH, PHOTO_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE, OBJECT_TYPE_FK, QUALITY_FLAG_FK, PHOTO_TYPE_FK, DEPARTMENT_FK, CONTENT, CONTENT_TYPE)
              values (:new.ID, 0, :new.COMMENTS, '/tmp', :new.DATE_TIME, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.UPDATE_DATE, (select mot.code from SIH2_ADAGIO_DBA.m_object_type mot where mot.id = :new.OBJECT_TYPE_FK), :new.QUALITY_FLAG_FK, 'UNK', :new.RECORDER_DEPARTMENT_FK, :new.CONTENT, :new.CONTENT_TYPE);
            WHEN DELETING THEN
              delete SIH2_ADAGIO_DBA.PHOTO P where P.ID=:old.ID;
          end case;
        end;
-```

- Ajout de la vue `DENORMALIZED_SAMPLING_STRATA`
  ```sql
  create or replace view DENORMALIZED_SAMPLING_STRATA as
  select
  DSS.ID,
  DSS.LABEL,
  null as NAME,
  DSS.START_DATE,
  DSS.END_DATE,
  DSS.DESCRIPTION,
  DSS.COMMENTS,
  DSS.OBSERVATION_LOCATION_COMMENTS,
  DSS.SAMPLING_STRATEGY,
  DSS.TAXON_GROUP_NAME,
  DSS.SAMPLING_SCHEME_LABEL,
  DSS.SAMPLING_SCHEME_NAME,
  DSS.SAMPLING_SCHEME_DESCRIPTION,
  DSS.GEAR_MESH_RANGE,
  DSS.VESSEL_LENGTH_RANGE,
  DSS.METIER,
  DSS.AREA_NAME,
  DSS.SUB_AREA_LOCATION_IDS,
  DSS.PERSON_FK,
  DSS.OBSERVATION_LOCATION_FK,
  MP.ID AS PROGRAM_FK,
  DSS.DEPARTMENT_FK,
  null as CREATION_DATE,
  DSS.UPDATE_DATE,
  DSS.STATUS_FK
  from SIH2_ADAGIO_DBA.DENORMALIZED_SAMPLING_STRATA DSS
  inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on DSS.PROGRAM_FK = MP.CODE;
;
-```

- Modification de la vue `SALE`
  ```sql
  create or replace view SALE as
  select S.ID,
  S.SALE_START_DATE as START_DATE_TIME,
  S.SALE_END_DATE as END_DATE_TIME,
  S.SALE_LOCATION_FK,
  S.SALE_TYPE_FK,
  S.COMMENTS,
  S.CREATION_DATE,
  S.CONTROL_DATE,
  S.VALIDATION_DATE,
  S.QUALIFICATION_DATE,
  S.QUALIFICATION_COMMENTS,
  cast(S.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK,
  S.UPDATE_DATE,
  V.ID as VESSEL_FK,
  P.ID as PROGRAM_FK,
  S.FISHING_TRIP_FK as TRIP_FK,
  S.LANDING_FK,
  null as OBSERVED_LOCATION_FK, -- For compatibility with SUMARiS < v2.9.x
  S.RECORDER_DEPARTMENT_FK,
  S.RECORDER_PERSON_FK
  from SIH2_ADAGIO_DBA.SALE S
  inner join SIH2_ADAGIO_DBA.M_VESSEL V on S.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.M_PROGRAM P on S.PROGRAM_FK = P.CODE
;
- ```

- Modification du trigger `TR_SALE`
  ```sql
  create or replace trigger TR_SALE
     instead of insert or update or delete
     on SALE
  begin
     case
          WHEN INSERTING THEN
             if :new.ID is null then
                raise_application_error(-20000, 'SALE.ID must be not null');
             end if;
            -- todo: validate default IS_OBSERVED=1
            insert into SIH2_ADAGIO_DBA.SALE(ID, IS_OBSERVED, SALE_START_DATE, SALE_END_DATE, COMMENTS, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS,
                                             UPDATE_DATE, SALE_LOCATION_FK, SALE_TYPE_FK, FISHING_TRIP_FK, LANDING_FK, RECORDER_DEPARTMENT_FK, RECORDER_PERSON_FK, QUALITY_FLAG_FK, VESSEL_FK, PROGRAM_FK)
            select :new.ID, 1, :new.START_DATE_TIME, :new.END_DATE_TIME, :new.COMMENTS, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS,
                                             :new.UPDATE_DATE, :new.SALE_LOCATION_FK, :new.SALE_TYPE_FK, :new.TRIP_FK, :new.LANDING_FK, :new.RECORDER_DEPARTMENT_FK, :new.RECORDER_PERSON_FK, :new.QUALITY_FLAG_FK, V.CODE, P.CODE
            from SIH2_ADAGIO_DBA.M_PROGRAM P, SIH2_ADAGIO_DBA.M_VESSEL V
            where P.ID = :new.PROGRAM_FK and V.ID = :new.VESSEL_FK;
          WHEN UPDATING THEN
            update SIH2_ADAGIO_DBA.SALE S set S.SALE_START_DATE=:new.START_DATE_TIME, S.SALE_END_DATE=:new.END_DATE_TIME, S.COMMENTS=:new.COMMENTS, S.CREATION_DATE=:new.CREATION_DATE,
                                          S.CONTROL_DATE=:new.CONTROL_DATE, S.VALIDATION_DATE=:new.VALIDATION_DATE, S.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, S.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS,
                                          S.UPDATE_DATE=:new.UPDATE_DATE, S.SALE_LOCATION_FK=:new.SALE_LOCATION_FK, S.SALE_TYPE_FK=:new.SALE_TYPE_FK, S.FISHING_TRIP_FK=:new.TRIP_FK, S.LANDING_FK=:new.LANDING_FK,
                                          S.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, S.RECORDER_PERSON_FK=:new.RECORDER_PERSON_FK, S.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                          S.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID=:new.PROGRAM_FK), S.VESSEL_FK = (select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID=:new.VESSEL_FK)
            where S.ID = :new.ID;
          WHEN DELETING THEN
            delete from SIH2_ADAGIO_DBA.SALE S where S.ID=:old.ID;
     end case;
  end;
- ```


- Modification du trigger `TR_PHYSICAL_GEAR`
```sql
  create or replace trigger TR_PHYSICAL_GEAR
    instead of insert or update or delete
    on PHYSICAL_GEAR
  begin
    case
      WHEN INSERTING THEN
          insert into SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES(ID, RANK_ORDER, START_DATE, END_DATE, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE, VESSEL_FK, PROGRAM_FK, FISHING_TRIP_FK, GEAR_FK, QUALITY_FLAG_FK)
          select :new.ID, :new.RANK_ORDER, FT.DEPARTURE_DATE_TIME, FT.RETURN_DATE_TIME, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.COMMENTS, :new.UPDATE_DATE, FT.VESSEL_FK, FT.PROGRAM_FK, FT.ID, :new.GEAR_FK,
                  :new.QUALITY_FLAG_FK
          from SIH2_ADAGIO_DBA.FISHING_TRIP FT
              where FT.ID = :new.TRIP_FK;
      WHEN UPDATING THEN
          if :old.PROGRAM_FK != :new.PROGRAM_FK or :old.TRIP_FK != :new.TRIP_FK then
            raise_application_error(-20000, 'PHYSICAL_GEAR.PROGRAM_FK and TRIP_FK are unmodifiable');
          end if;
          update SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES F set F.RANK_ORDER=:new.RANK_ORDER, F.CREATION_DATE=:new.CREATION_DATE, F.CONTROL_DATE=:new.CONTROL_DATE, F.VALIDATION_DATE=:new.VALIDATION_DATE, F.QUALIFICATION_DATE=:new.QUALIFICATION_DATE,
                                                              F.QUALIFICATION_COMMENTS=:new.COMMENTS, F.UPDATE_DATE=:new.UPDATE_DATE, F.GEAR_FK=:new.GEAR_FK, F.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK
          where F.ID = :new.ID;
      WHEN DELETING THEN
          delete from SIH2_ADAGIO_DBA.FISHING_TRIP FT where FT.ID=:old.ID;
    end case;
  end;
- ```

- Modification du synonyme `SORTING_MEASUREMENT_SEQ` en `SORTING_MEASUREMENT_B_SEQ`
  ```sql
    create or replace synonym SORTING_MEASUREMENT_B_SEQ for SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_SEQ;
- ```
  
- Modification du synonyme `SORTING_MEASUREMENT_SEQ` en `SORTING_MEASUREMENT_P_SEQ`
  ```sql
    create or replace synonym SORTING_MEASUREMENT_P_SEQ for SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_SEQ;
- ```

### Creation d'un navire temporaire ? - A vérifier
- Création du synonyme `VESSEL_SEQ`
  ```sql
  create or replace synonym VESSEL_SEQ for SIH2_ADAGIO_DBA.VESSEL_SEQ;
-```

- Création du synonyme `M_VESSEL_REG_PERIOD_SEQ`
  ```sql
  create or replace synonym VESSEL_REGISTRATION_PERIOD_SEQ for SIH2_ADAGIO_DBA.M_VESSEL_REG_PERIOD_SEQ;
-```
  


- Modification du trigger `TR_SORTING_MEASUREMENT_B`
  ```sql
    create or replace trigger TR_SORTING_MEASUREMENT_B
      instead of insert or update or delete
      on SORTING_MEASUREMENT_B
    begin
      case
        WHEN INSERTING THEN
          -- SORTING_MEASUREMENT_B itself
          insert into SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_B(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, RANK_ORDER, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, DEPARTMENT_FK, QUALITY_FLAG_FK,
                                                            PMFM_FK, QUALITATIVE_VALUE_FK, SORTING_BATCH_FK)
          values (:new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.RANK_ORDER, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.RECORDER_DEPARTMENT_FK,
                  :new.QUALITY_FLAG_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, :new.BATCH_FK);
          -- M_SORTING_MEASUREMENT_B (map columns of M_SORTING_MEASUREMENT_B for sumaris)
          insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_SORTING_MEASUREMENT_B(ID, RANK_ORDER)
          values (:new.ID, :new.RANK_ORDER);
        WHEN UPDATING THEN
          -- SORTING_MEASUREMENT_B itself
          update SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_B M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE, M.RANK_ORDER=:new.RANK_ORDER,
                                                             M.CONTROL_DATE=:new.CONTROL_DATE, M.VALIDATION_DATE=:new.VALIDATION_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS,
                                                             M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK
          where M.ID = :new.ID;
          -- M_SORTING_MEASUREMENT_B update if row exits
          update M_SORTING_MEASUREMENT_B MSM set MSM.RANK_ORDER=:new.RANK_ORDER
          where MSM.ID = :new.ID; 
          -- M_SORTING_MEASUREMENT_B insert if row not exists
          insert into M_SORTING_MEASUREMENT_B (ID, RANK_ORDER)
          select SM.ID, :new.RANK_ORDER from SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_B SM where SM.ID = :new.ID and not exists (select * from M_SORTING_MEASUREMENT_B MSM where  MSM.ID = :new.ID);
        WHEN DELETING THEN
          delete from SIH2_ADAGIO_DBA.SORTING_MEASUREMENT_B SMB where SMB.ID=:old.ID;
          delete from M_SORTING_MEASUREMENT_B MSMB where MSMB.ID=:old.ID;
      end case;
    end;
-```

- Modification de la vue `METHOD`
  ```sql
      create or replace view METHOD as
        select ID,
        null as COMMENTS,
        CREATION_DATE,
        DESCRIPTION,
        null as IS_CALCULATED,
        null as IS_ESTIMATED,
        null as LABEL,
        NAME,
        UPDATE_DATE,
        cast(M.STATUS_FK as number(10)) as STATUS_FK
      from SIH2_ADAGIO_DBA.METHOD M;
-```


- Modification de la vue `PMFM`
  ```sql
    create or replace view PMFM as
      select P.ID,
      P.CREATION_DATE,
      MP.LABEL,
      P.MAXIMUM_NUMBER_DECIMALS,
      P.SIGNIF_FIGURES_NUMBER,
      P.MIN_VALUE,
      P.MAX_VALUE,
      P.DEFAULT_VALUE,
      P.UPDATE_DATE,
      P.PRECISION,
      P.DETECTION_THRESHOLD,
      MPA.ID as PARAMETER_FK,
      P.MATRIX_FK,
      P.FRACTION_FK,
    P.METHOD_FK,
    P.UNIT_FK,
    cast(P.STATUS_FK as number(10)) as STATUS_FK
  from SIH2_ADAGIO_DBA.PMFM P
    inner join SIH2_ADAGIO_DBA.M_PARAMETER MPA on P.PARAMETER_FK = MPA.CODE
    left outer join M_PMFM MP on MP.ID = P.ID;
-```


## Mise à jour du programme SIH-OBSMER

- Ajouter les options de programmes : 

```properties
# Activer les rapports de marée (formulaires terrain et restitution aux professionnels)
sumaris.trip.report.enable=true
sumaris.trip.report.type= /* TODO */
# Espèces cible = espèces métier national
sumaris.trip.operation.metier.taxonGroupType.ids=3
```