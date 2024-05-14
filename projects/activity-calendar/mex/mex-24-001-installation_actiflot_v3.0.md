# Manuel de mise en exploitation des calendrier d'activité v3.0

Objectif : le document liste les étapes de migration, pour réaliser le passage 
des calendriers d'activité en SUMARiS v3.0

Liste des tickets réalisés :
- 

> Auteur: Benoit LAVENIER
> Date création : 20/03/2024
> Mise à jour : 20/03/2024

## Configuration du Pod

RAS  

## Schéma SIH2_ADAGIO_DBA

- Modification `ACTIVITY_CALENDAR` :
  - Nouvelle colonne `ECONOMIC_SURVEY` (cf [changelog Liquibase Adagio-core](https://gitlab.ifremer.fr/sih/adagio/adagio/-/tree/feature/sumaris-obsmer/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle?ref_type=heads) (branche `feature/sumaris-obsmer`))

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

## Mise à jour du programme SIH-OBSMER

- TODO