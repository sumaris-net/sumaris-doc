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

- Modification `ACTIVITY_CALENDAR`

- grants sur `PROGRAM2PERSON`
  ```sql
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.PROGRAM2PERSON to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.PROGRAM_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM2LOCATION_CLASSIF`
  ```sql
grant SELECT,INSERT,DELETE on SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Appliquer les [manuels d'exploitation d'Imagine](../../imagine/mex) (v2.8)

- Mise à jour de la vue `IMAGE_ATTACHMENT`

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

- Création du trigger `TR_VESSEL_USE_MEASUREMENT`

  ```sql
  create or replace trigger TR_VESSEL_USE_MEASUREMENT
     instead of insert or update or delete
     on VESSEL_USE_MEASUREMENT
  begin
    case
          WHEN INSERTING THEN
             -- VESSEL_USE_MEASUREMENT itself
             insert into SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, QUALITY_FLAG_FK,
                                                                 DEPARTMENT_FK, PMFM_FK, QUALITATIVE_VALUE_FK, VESSEL_USE_FEATURES_FK)
             select :new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.QUALITY_FLAG_FK,
                                                                 :new.RECORDER_DEPARTMENT_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, VUF.ID
             from SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF
             where VUF.OPERATION_FK = :new.OPERATION_FK or VUF.FISHING_TRIP_FK = :new.TRIP_FK;
             -- M_VESSEL_USE_MEASUREMENT (map columns of VESSEL_USE_MEASUREMENT for sumaris)
             insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_VESSEL_USE_MEASUREMENT(ID, RANK_ORDER)
             values (:new.ID, :new.RANK_ORDER);
          WHEN UPDATING THEN
             -- VESSEL_USE_MEASUREMENT itself
             update SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE,
                                                                 M.CONTROL_DATE=:new.CONTROL_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                                 M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK
             where M.ID = :new.ID;
             -- M_VESSEL_USE_MEASUREMENT update if row exists
             update M_VESSEL_USE_MEASUREMENT MVUM set MVUM.RANK_ORDER=:new.RANK_ORDER
             where MVUM.ID = :new.ID;
             -- M_VESSEL_USE_MEASUREMENT insert if row not exists
             insert into M_VESSEL_USE_MEASUREMENT (ID, RANK_ORDER)
                          select VUM.ID, :new.RANK_ORDER from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM where VUM.ID = :new.ID and not exists (select * from M_VESSEL_USE_MEASUREMENT MVUM where MVUM.ID = :new.ID);
          WHEN DELETING THEN
             delete from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM where VUM.ID=:old.ID;
             delete from M_VESSEL_USE_MEASUREMENT MVUM where MVUM.ID=:old.ID;
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

- Ajout du trigger `TR_PROGRAM2PERSON`
```sql
  create or replace trigger TR_PROGRAM2PERSON
    instead of insert or update or delete
    on PROGRAM2PERSON
  begin
    case
      WHEN INSERTING THEN
        insert into SIH2_ADAGIO_DBA.PROGRAM2PERSON(ID,PROGRAM_FK,LOCATION_FK,PROGRAM_PRIVILEGE_FK,PERSON_FK,REFERENCE_PERSON_FK,UPDATE_DATE)
        select :new.ID, P.CODE, :new.LOCATION_FK, :new.PROGRAM_PRIVILEGE_FK, :new.PERSON_FK, :new.REFERENCE_PERSON_FK, :new.UPDATE_DATE
        from SIH2_ADAGIO_DBA.M_PROGRAM P
        where P.ID = :new.PROGRAM_FK;
      WHEN UPDATING THEN
        update SIH2_ADAGIO_DBA.PROGRAM2PERSON P2P set P2P.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID = :new.PROGRAM_FK),
                                                      P2P.LOCATION_FK = :new.LOCATION_FK, P2P.PROGRAM_PRIVILEGE_FK = :new.PROGRAM_PRIVILEGE_FK,
                                                      P2P.PERSON_FK = :new.PERSON_FK, P2P.REFERENCE_PERSON_FK = :new.REFERENCE_PERSON_FK,
                                                      P2P.UPDATE_DATE = :new.UPDATE_DATE
        where P2P.ID = :new.ID;
      WHEN DELETING THEN
        delete from SIH2_ADAGIO_DBA.PROGRAM2PERSON P2P where P2P.ID=:old.ID;
    end case;
  end;
- ```

- Modification du synonyme `M_PROGRAM_SEQ` en `PROGRAM_SEQ`
  ```sql
  create or replace synonym PROGRAM_SEQ for SIH2_ADAGIO_DBA.M_PROGRAM_SEQ;
-```

- Modification du trigger `TR_PROGRAM`
  ```sql
  create or replace trigger TR_PROGRAM
    instead of insert or update
    on PROGRAM
  begin
    case
      WHEN INSERTING THEN
        insert into SIH2_ADAGIO_DBA.PROGRAM(CODE, NAME, DESCRIPTION, CREATION_DATE, UPDATE_DATE, TAXON_GROUP_TYPE_FK, GEAR_CLASSIFICATION_FK)
        select :new.LABEL, :new.NAME, :new.DESCRIPTION, :new.CREATION_DATE, :new.UPDATE_DATE, TGT.CODE, :new.GEAR_CLASSIFICATION_FK
        from SIH2_ADAGIO_DBA.M_TAXON_GROUP_TYPE TGT
        where TGT.ID = :new.TAXON_GROUP_TYPE_FK;  
      WHEN UPDATING THEN
        -- PROGRAM itself
        update SIH2_ADAGIO_DBA.PROGRAM P set P.NAME=:new.NAME, P.DESCRIPTION=:new.DESCRIPTION, P.CREATION_DATE=:new.CREATION_DATE, P.UPDATE_DATE=:new.UPDATE_DATE, P.TAXON_GROUP_TYPE_FK=:new.TAXON_GROUP_TYPE_FK, P.GEAR_CLASSIFICATION_FK=:new.GEAR_CLASSIFICATION_FK
        where P.CODE = (select CODE from SIH2_ADAGIO_DBA.M_PROGRAM where ID=:new.ID);
    end case;
  end;
-```

- Création du trigger `TR_PROGRAM2LOCATION_CLASSIF`
  ```sql
    create or replace trigger TR_PROGRAM2LOCATION_CLASSIF
      instead of insert or delete
      on PROGRAM2LOCATION_CLASSIF
    begin
      case
        WHEN INSERTING THEN
          insert into SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF(PROGRAM_FK, LOCATION_CLASSIFICATION_FK)
          select P.CODE, :new.LOCATION_CLASSIFICATION_FK
          from SIH2_ADAGIO_DBA.M_PROGRAM P
          where P.ID = :new.PROGRAM_FK;
        WHEN DELETING THEN
          delete from SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF where PROGRAM_FK=(select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID = :old.PROGRAM_FK) and LOCATION_CLASSIFICATION_FK=:old.LOCATION_CLASSIFICATION_FK;
      end case;
  end;
-```

## Mise à jour du programme SIH-OBSMER

- Ajouter les options de programmes : 

```properties
# Activer les rapports de marée (formulaires terrain et restitution aux professionnels)
sumaris.trip.report.enable=true
sumaris.trip.report.type= /* TODO */
```