# Manuel de mise en exploitation des calendrier d'activité v3.0

Objectif : le document liste les étapes de migration, pour réaliser le passage 
des calendriers d'activité en SUMARiS v3.0

Liste des tickets réalisés :
- 

> Auteur: Benoit LAVENIER
> Date création : 20/03/2024
> Mise à jour : 20/03/2024

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
```properties
# Empêcher la modification des droits d'accès d'un programme (gérer par Adagio-admin) 
sumaris.program.privilege.readonly=true
sumaris.enumeration.Pmfm.SURVEY_QUALIFICATION.id=<Id du PMFM dans ACTIFLOT> # 623 ou 1445 ?
sumaris.enumeration.Pmfm.SURVEY_RELIABILITY.id=681
sumaris.enumeration.QualitativeValue.SURVEY_QUALIFICATION_DIRECT.id=965

```

```requete sql
insert into program_property (id, label, name, program_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.program.privilege.readonly', 'true', 52 , 1, sysdate);
```

## Schéma SIH2_ADAGIO_DBA

- Modification `ACTIVITY_CALENDAR` :
  - Nouvelle colonne `ECONOMIC_SURVEY` (cf [changelog Liquibase Adagio-core](https://gitlab.ifremer.fr/sih/adagio/adagio/-/tree/feature/sumaris-obsmer/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle?ref_type=heads) (branche `feature/sumaris-obsmer`))

- grants sur `PHOTO`
  ```sql
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.PHOTO to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- nouvelles colonnes sur `PHOTO`
  ```sql
  alter table SIH2_ADAGIO_DBA.PHOTO  add column CONTENT CLOB;
  alter table SIH2_ADAGIO_DBA.PHOTO  add column CONTENT_TYPE varchar2(100);
-```

- Ajout de grant sur `ACTIVITY_CALENDAR` :
  ```sql
    grant SELECT on SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- nouvelles colonnes `HASH` sur `VESSEL_USE_FEATURES`, `GEAR_USE_FEATURES` et `GEAR_PHYSICAL_FEATURES`
  ```sql
  alter table SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES add column HASH NUMBER(10);
  alter table SIH2_ADAGIO_DBA.GEAR_USE_FEATURES add column HASH NUMBER(10);
  alter table SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES add column HASH NUMBER(10);
-```

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Appliquer les [manuels d'exploitation d'ObsMer](../../imagine/mex) (v2.9)

- Ajout de la vue `ACTIVITY_CALENDAR`
  ```sql
  CREATE OR REPLACE VIEW ACTIVITY_CALENDAR AS
  SELECT
  AC.ID,
  AC.YEAR,
  AC.DIRECT_SURVEY_INVESTIGATION,
  AC.ECONOMIC_SURVEY,
  AC.COMMENTS,
  AC.CREATION_DATE,
  AC.CONTROL_DATE,
  AC.VALIDATION_DATE,
  AC.QUALIFICATION_DATE,
  AC.QUALIFICATION_COMMENTS,
  AC.UPDATE_DATE,
  AC.SURVEY_QUALIFICATION_FK,
  AC.RECORDER_PERSON_FK,
  V.ID AS VESSEL_FK,
  MP.ID AS PROGRAM_FK,
  AC.RECORDER_DEPARTMENT_FK,
  AC.QUALITY_FLAG_FK
  FROM SIH2_ADAGIO_DBA.ACTIVITY_CALENDAR AC
  INNER JOIN SIH2_ADAGIO_DBA.M_VESSEL V ON AC.VESSEL_FK = V.CODE
  INNER JOIN SIH2_ADAGIO_DBA.M_PROGRAM MP ON AC.PROGRAM_FK = MP.CODE
  ;
-``` 

- Ajout de la vue `VESSEL_USE_FEATURES`
  ```sql
  CREATE OR REPLACE VIEW vessel_use_features AS
  select VUF.id,
  VUF.activity_calendar_fk,
  VUF.base_port_location_fk,
  null as comments,
  VUF.control_date,
  VUF.creation_date,
  VUF.daily_activity_calendar_fk,
  VUF.end_date,
  VUF.is_active,
  MP.ID as program_fk,
  VUF.qualification_comments,
  VUF.qualification_date,
  VUF.quality_flag_fk,
  VUF.start_date,
  VUF.update_date,
  VUF.hash,
  V.ID as vessel_fk
  from SIH2_ADAGIO_DBA.vessel_use_features VUF
  inner join SIH2_ADAGIO_DBA.M_VESSEL V on VUF.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on VUF.PROGRAM_FK = MP.CODE
  ;
-```

- Ajout de la vue `GEAR_USE_FEATURES`
  ```sql
  CREATE OR REPLACE VIEW gear_use_features AS
  select GUF.id,
  GUF.activity_calendar_fk,
  null as comments,
  GUF.control_date,
  GUF.creation_date,
  GUF.daily_activity_calendar_fk,
  GUF.end_date,
  GUF.gear_fk,
  GUF.metier_fk,
  GUF.other_gear_fk,
  MP.ID as program_fk,
  GUF.qualification_comments,
  GUF.qualification_date,
  GUF.quality_flag_fk,
  GUF.rank_order,
  GUF.start_date,
  GUF.update_date,
  GUF.validation_date,
  GUF.hash,
  V.ID as vessel_fk
  from SIH2_ADAGIO_DBA.gear_use_features GUF
  inner join SIH2_ADAGIO_DBA.M_VESSEL V on GUF.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on GUF.PROGRAM_FK = MP.CODE
  ;
-```

- Mise à jour de la vue `GEAR_USE_MEASUREMENT`
  ```sql
  create or replace view GEAR_USE_MEASUREMENT as
  select GUM.ID,
  null as COMMENTS,
  GUM.NUMERICAL_VALUE,
  GUM.ALPHANUMERICAL_VALUE,
  GUM.DIGIT_COUNT,
  GUM.PRECISION_VALUE,
  MGUM.RANK_ORDER,
  GUM.CONTROL_DATE,
  GUM.VALIDATION_DATE,
  GUM.QUALIFICATION_DATE,
  GUM.QUALIFICATION_COMMENTS,
  null as UPDATE_DATE,
  GUM.PMFM_FK,
  GUF.OPERATION_FK, -- 1 GEAR_USE_FEATURES créé en meme temps que l'OPERATION
  GUM.QUALITATIVE_VALUE_FK,
  GUM.DEPARTMENT_FK as RECORDER_DEPARTMENT_FK,
  cast(GUM.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK,
  GUM.GEAR_USE_FEATURES_FK
  from SIH2_ADAGIO_DBA.GEAR_USE_MEASUREMENT GUM
  inner join SIH2_ADAGIO_DBA.GEAR_USE_FEATURES GUF on GUM.GEAR_USE_FEATURES_FK = GUF.ID
  left outer join SIH2_ADAGIO_DBA_SUMARIS_MAP.M_GEAR_USE_MEASUREMENT MGUM on GUM.ID = MGUM.ID
;
-```

- Ajout de la vue `GEAR_USE_FEATURES_ORIGIN`
  ```sql
  create or replace view gear_use_features_origin AS
  select GUFO.GEAR_USE_FEATURES_FK as GEAR_USE_FEATURES_FK,
  P.ID as PROGRAM_FK,
  AL.ID as ACQUISITION_LEVEL_FK
  from SIH2_ADAGIO_DBA.gear_use_features_origin GUFO
  inner join SIH2_ADAGIO_DBA.M_ACQUISITION_LEVEL AL on GUFO.ACQUISITION_LEVEL_FK = AL.ID
  inner join SIH2_ADAGIO_DBA.M_PROGRAM P on GUFO.PROGRAM_FK = P.ID
;
-```  

- Ajout du synonyme `ACTIVITY_CALENDAR_SEQ`
  ```sql
  create or replace synonym ACTIVITY_CALENDAR_SEQ for SIH2_ADAGIO_DBA.ACTIVITY_CALENDAR_SEQ
;
-```

- Modification du trigger `TR_VESSEL_USE_FEATURES`
  ```sql
    create or replace trigger TR_VESSEL_USE_FEATURES
      instead of delete or update
      on VESSEL_USE_FEATURES
      begin
        case
          WHEN UPDATING THEN
            update SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF set VUF.activity_calendar_fk=:new.activity_calendar_fk, VUF.base_port_location_fk=:new.base_port_location_fk,
                                                               VUF.control_date=:new.control_date, VUF.creation_date=:new.creation_date, VUF.daily_activity_calendar_fk=:new.daily_activity_calendar_fk, VUF.end_date=:new.end_date, VUF.is_active=:new.is_active,
                                                               VUF.program_fk=(select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID =:new.PROGRAM_FK),
                                                               VUF.qualification_comments=:new.qualification_comments, VUF.qualification_date=:new.qualification_date, VUF.quality_flag_fk=:new.quality_flag_fk, VUF.start_date=:new.start_date, VUF.update_date=:new.update_date,
                                                               VUF.vessel_fk=(select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID =:new.VESSEL_FK)
            where id=:new.id;
          WHEN DELETING THEN
            delete from SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF where VUF.ID=:old.ID;
        end case;
      end;
-```

- Modification du trigger `TR_GEAR_USE_FEATURES`
  ```sql
  create or replace trigger TR_GEAR_USE_FEATURES
    instead of delete or update or insert
      on GEAR_USE_FEATURES
        begin
          case
        WHEN INSERTING THEN
             insert into SIH2_ADAGIO_DBA.GEAR_USE_FEATURES(ID, activity_calendar_fk, control_date, creation_date, daily_activity_calendar_fk, end_date, gear_fk,metier_fk,other_gear_fk,program_fk,qualification_comments,
                                                           qualification_date, quality_flag_fk, rank_order, start_date, update_date, validation_date, vessel_fk)
             values (:new.ID, :new.activity_calendar_fk, :new.control_date,:new.creation_date,:new.daily_activity_calendar_fk,:new.end_date, :new.gear_fk,:new.metier_fk,:new.other_gear_fk, (select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID =:new.PROGRAM_FK),
                     :new.qualification_comments, :new.qualification_date, :new.quality_flag_fk, :new.rank_order, :new.start_date, :new.update_date, :new.validation_date, (select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID =:new.VESSEL_FK));
            WHEN UPDATING THEN
              update SIH2_ADAGIO_DBA.GEAR_USE_FEATURES GUF set GUF.activity_calendar_fk=:new.activity_calendar_fk, GUF.control_date=:new.control_date, GUF.creation_date=:new.creation_date,GUF.daily_activity_calendar_fk=:new.daily_activity_calendar_fk,
                                                               GUF.end_date=:new.end_date, GUF.gear_fk=:new.gear_fk, GUF.metier_fk=:new.metier_fk, GUF.other_gear_fk=:new.other_gear_fk,
                                                               GUF.program_fk=(select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID =:new.PROGRAM_FK),
                                                               GUF.qualification_comments=:new.qualification_comments, GUF.qualification_date=:new.qualification_date, GUF.quality_flag_fk=:new.quality_flag_fk, GUF.rank_order=:new.rank_order, GUF.start_date=:new.start_date,
                                                               GUF.update_date=:new.update_date, GUF.validation_date=:new.validation_date,
                                                               GUF.vessel_fk=(select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID =:new.VESSEL_FK)
              where id=:new.id;
            WHEN DELETING THEN
              delete from SIH2_ADAGIO_DBA.GEAR_USE_FEATURES GUF where GUF.ID=:old.ID;
          end case;
        end;
-```

- Modification du trigger `TR_GEAR_USE_MEASUREMENT`
  ```sql
  create or replace trigger TR_GEAR_USE_MEASUREMENT
    instead of insert or update or delete
      on GEAR_USE_MEASUREMENT
        begin
          case
            WHEN INSERTING THEN
              -- GEAR_USE_MEASUREMENT itself
                insert into SIH2_ADAGIO_DBA.GEAR_USE_MEASUREMENT(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, QUALITY_FLAG_FK,
                  DEPARTMENT_FK, PMFM_FK, QUALITATIVE_VALUE_FK, GEAR_USE_FEATURES_FK)
                  select :new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.QUALITY_FLAG_FK,
                         :new.RECORDER_DEPARTMENT_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, GUF.ID
                  from SIH2_ADAGIO_DBA.GEAR_USE_FEATURES GUF
                  where GUF.OPERATION_FK = :new.OPERATION_FK;
                -- M_GEAR_USE_MEASUREMENT (map columns of GEAR_USE_MEASUREMENT for sumaris)
                insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_GEAR_USE_MEASUREMENT(ID, RANK_ORDER)
                values (:new.ID, :new.RANK_ORDER);
            WHEN UPDATING THEN
              -- GEAR_USE_MEASUREMENT itself
              update SIH2_ADAGIO_DBA.GEAR_USE_MEASUREMENT M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE,
                                                                M.CONTROL_DATE=:new.CONTROL_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                                M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK
              where M.ID = :new.ID;
              -- M_GEAR_USE_MEASUREMENT update if condition
              update M_GEAR_USE_MEASUREMENT MGUM set MGUM.RANK_ORDER=:new.RANK_ORDER
              where MGUM.ID = :new.ID;
              -- M_GEAR_USE_MEASUREMENT insert if condition
              insert into M_GEAR_USE_MEASUREMENT (ID, RANK_ORDER)
              select :new.ID, :new.RANK_ORDER from SIH2_ADAGIO_DBA.GEAR_USE_MEASUREMENT GUM where GUM.ID = :new.ID and not exists (select * from M_GEAR_USE_MEASUREMENT MGUM where  MGUM.ID = :new.ID);
            WHEN DELETING THEN
              delete from SIH2_ADAGIO_DBA.GEAR_USE_MEASUREMENT GUM where GUM.ID=:old.ID;
              delete from M_GEAR_USE_MEASUREMENT MGUM where MGUM.ID=:old.ID;
          end case;
        end;
-```


- Ajout de la vue `GEAR_PHYSICAL_FEATURES`
  ```sql
    create or replace view GEAR_PHYSICAL_FEATURES as
    select GPG.ID,
    GPG.START_DATE,
    GPG.END_DATE,
    GPG.CREATION_DATE,
    GPG.CONTROL_DATE,
    GPG.VALIDATION_DATE,
    GPG.QUALIFICATION_DATE,
    GPG.QUALIFICATION_COMMENTS,
    GPG.UPDATE_DATE,
    V.ID as vessel_fk,
    cast(GPG.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK,
    MP.ID as program_fk,
    GPG.PHYSICAL_GEAR_SURVEY_FK,
    GPG.FISHING_TRIP_FK,
    GPG.GEAR_FK,
    GPG.RANK_ORDER,
    GPG.OTHER_GEAR_FK,
    GPG.ACTIVITY_CALENDAR_FK,
    GPG.METIER_FK,
    null as COMMENTS,
    GPG.hash,
    FROM SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES GPG
    inner join SIH2_ADAGIO_DBA.M_VESSEL V on GPG.VESSEL_FK = V.CODE
    inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on GPG.PROGRAM_FK = MP.CODE
  ;
-```

- Ajout du trigger `TR_GEAR_PHYSICAL_FEATURES`
  ```sql
    create or replace trigger TR_GEAR_PHYSICAL_FEATURES
      instead of insert or update or delete
        on GEAR_PHYSICAL_FEATURES
          begin
            case
              WHEN INSERTING THEN
                -- GEAR_PHYSICAL_FEATURES itself
                insert into SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES(ID, START_DATE, END_DATE, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, PHYSICAL_GEAR_SURVEY_FK, QUALITY_FLAG_FK,
                                                                   FISHING_TRIP_FK, GEAR_FK, RANK_ORDER, OTHER_GEAR_FK, ACTIVITY_CALENDAR_FK, METIER_FK, HASH, PROGRAM_FK, VESSEL_FK)
                values (:new.ID, :new.START_DATE, :new.END_DATE, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.PHYSICAL_GEAR_SURVEY_FK, :new.QUALITY_FLAG_FK,
                        :new.FISHING_TRIP_FK, :new.GEAR_FK, :new.RANK_ORDER, :new.OTHER_GEAR_FK, :new.ACTIVITY_CALENDAR_FK, :new.METIER_FK, :new.HASH, (select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID =:new.PROGRAM_FK), (select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID =:new.VESSEL_FK));

              WHEN UPDATING THEN
                -- GEAR_PHYSICAL_MEASUREMENT itself
                update SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES G set G.ID = :new.ID, G.START_DATE = :new.START_DATE, G.END_DATE = :new.END_DATE, G.CREATION_DATE = :new.CREATION_DATE, G.CONTROL_DATE = :new.CONTROL_DATE, G.VALIDATION_DATE = :new.VALIDATION_DATE, G.QUALIFICATION_DATE = :new.QUALIFICATION_DATE, G.QUALIFICATION_COMMENTS = :new.QUALIFICATION_COMMENTS, G.PHYSICAL_GEAR_SURVEY_FK = :new.PHYSICAL_GEAR_SURVEY_FK, G.QUALITY_FLAG_FK = :new.QUALITY_FLAG_FK,
                                                                    G.FISHING_TRIP_FK = :new.FISHING_TRIP_FK, G.GEAR_FK = :new.GEAR_FK, G.RANK_ORDER = :new.RANK_ORDER, G.OTHER_GEAR_FK = :new.OTHER_GEAR_FK, G.ACTIVITY_CALENDAR_FK = :new.ACTIVITY_CALENDAR_FK, G.METIER_FK = :new.METIER_FK, G.HASH = :new.HASH, G.PROGRAM_FK = (select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID =:new.PROGRAM_FK), G.VESSEL_FK = (select V.CODE from SIH2_ADAGIO_DBA.M_VESSEL V where V.ID =:new.VESSEL_FK)
                where G.ID = :new.ID;

              WHEN DELETING THEN
                delete from SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES GPF where GPF.ID=:old.ID;
            end case;
          end;
-```

- Ajout de la vue `GEAR_PHYSICAL_MEASUREMENT`
  ```sql
    create or replace view GEAR_PHYSICAL_MEASUREMENT as
    select GPM.ID,
    null as COMMENTS,
    GPM.NUMERICAL_VALUE,
    GPM.ALPHANUMERICAL_VALUE,
    GPM.DIGIT_COUNT,
    GPM.PRECISION_VALUE,
    MGPM.RANK_ORDER,
    GPM.CONTROL_DATE,
    GPM.QUALIFICATION_DATE,
    GPM.QUALIFICATION_COMMENTS,
    null as UPDATE_DATE,
    GPM.PMFM_FK,
    GPM.GEAR_PHYSICAL_FEATURES_FK,
    GPM.QUALITATIVE_VALUE_FK,
    GPM.DEPARTMENT_FK as RECORDER_DEPARTMENT_FK,
    cast(GPM.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK
    from SIH2_ADAGIO_DBA.GEAR_PHYSICAL_MEASUREMENT GPM
    left outer join SIH2_ADAGIO_DBA_SUMARIS_MAP.M_GEAR_PHYSICAL_MEASUREMENT MGPM on GPM.ID = MGPM.ID;
-```

- Ajout du trigger `TR_GEAR_PHYSICAL_MEASUREMENT`
  ```sql
    create or replace trigger TR_GEAR_PHYSICAL_MEASUREMENT
      instead of insert or update or delete
        on GEAR_PHYSICAL_MEASUREMENT
          begin
            case
              WHEN INSERTING THEN
                -- GEAR_PHYSICAL_MEASUREMENT itself
                insert into SIH2_ADAGIO_DBA.GEAR_PHYSICAL_MEASUREMENT(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, QUALITY_FLAG_FK,
                                                                      DEPARTMENT_FK, PMFM_FK, QUALITATIVE_VALUE_FK, GEAR_PHYSICAL_FEATURES_FK)
                values (:new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.QUALITY_FLAG_FK,
                        :new.RECORDER_DEPARTMENT_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, :new.GEAR_PHYSICAL_FEATURES_FK);
                -- M_GEAR_PHYSICAL_MEASUREMENT (map columns of GEAR_PHYSICAL_MEASUREMENT for sumaris)
                insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_GEAR_PHYSICAL_MEASUREMENT(ID, RANK_ORDER)
                values (:new.ID, :new.RANK_ORDER);
              WHEN UPDATING THEN
                -- GEAR_PHYSICAL_MEASUREMENT itself
                update SIH2_ADAGIO_DBA.GEAR_PHYSICAL_MEASUREMENT M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE,
                                                                       M.CONTROL_DATE=:new.CONTROL_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                                       M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK
                where M.ID = :new.ID;
                -- M_GEAR_PHYSICAL_MEASUREMENT update if row exists
                update M_GEAR_PHYSICAL_MEASUREMENT MGPM set MGPM.RANK_ORDER=:new.RANK_ORDER
                where MGPM.ID = :new.ID;
                -- M_GEAR_PHYSICAL_MEASUREMENT insert if row not exists
                insert into M_GEAR_PHYSICAL_MEASUREMENT (ID, RANK_ORDER)
                select GPM.ID, :new.RANK_ORDER from SIH2_ADAGIO_DBA.GEAR_PHYSICAL_MEASUREMENT GPM where GPM.ID = :new.ID and not exists (select * from M_GEAR_PHYSICAL_MEASUREMENT MGPM where  MGPM.ID = :new.ID);
                WHEN DELETING THEN
                  delete from SIH2_ADAGIO_DBA.GEAR_PHYSICAL_MEASUREMENT GPM where GPM.ID=:old.ID;
                  delete from M_GEAR_PHYSICAL_MEASUREMENT MGPM where MGPM.ID=:old.ID;
            end case;
          end;
-```

- Ajout de la vue `GEAR_PHYSICAL_FEATURES_ORIGIN`
  ```sql
    create or replace view GEAR_PHYSICAL_FEATURES_ORIGIN as
      select GPFO.GEAR_PHYSICAL_FEATURES_FK,
        MP.ID as PROGRAM_FK,
        GPFO.ACQUISITION_LEVEL_FK
      FROM SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES_ORIGIN GPFO
      inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on GPFO.PROGRAM_FK = MP.CODE;
-```

- Ajout de synonme sur `GEAR_PHYSICAL_FEATURES_SEQ`
  ```sql
create or replace synonym GEAR_PHYSICAL_FEATURES_SEQ for SIH2_ADAGIO_DBA.GEAR_PHYSICAL_FEATURES_SEQ;
-```

## Mise à jour du programme SIH-ACTIFLOT

- TODO