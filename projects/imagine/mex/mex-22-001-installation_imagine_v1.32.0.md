# Manuel de mise en exploitation d'Imagine v1.32.0

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v1.32.0

> Auteur: Benoit LAVENIER
> Date : Novembre 2022

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  sumaris.persistence.sample.hashOptimization=true
  sumaris.persistence.bash.hashOptimization=true
  sumaris.persistence.physicalGear.hashOptimization=true
  sumaris.persistence.adagio.optimization=true
  sumaris.persistence.adagio.schema=SIH2_ADAGIO_DBA
  ```

- [ ] (Optionnel) pour limiter la taille du pool de connection Oracle
  ```properties
  sumaris.persistence.sample.hashOptimization=true
  sumaris.persistence.bash.hashOptimization=true
  sumaris.persistence.physicalGear.hashOptimization=true
  sumaris.persistence.adagio.optimization=true
  sumaris.persistence.adagio.schema=SIH2_ADAGIO_DBA
  ```

- [ ] Correction dans SOFTWARE_PROPERTY :
  ```sql
  update SOFTWARE_PROPERTY set name='MENU.OCCASIONS' where label='sumaris.observedLocation.name';
  update SOFTWARE_PROPERTY set label='sumaris.extraction.enabled' where label='sumaris.extraction.enable';  # Ajout d'un 'd' à la fin
  ```

- [ ] Ajout d'un ProgramProperty, sur le programme SIH-OBSBIO :
  ```sql
  insert into PROGRAM_PROPERTY (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, PROGRAM_FK) values (PROGRAM_PROPERTY_SEQ.nextval, 'sumaris.program.strategy.department.enable', 'true', sysdate, systimestamp, 101);
  ```

## Schéma SIH2_ADAGIO_DBA

- [ ] Ajout d'un index sur SAMPLE_MEASUREMENT (PMFM_FK, ALPHANUMERICAL_VALUE) :
  ```sql
  create index IX_SAMPLE_MEAS_ALPHA_NUM on SAMPLE_MEASUREMENT (PMFM_FK, ALPHANUMERICAL_VALUE) tablespace SIH2_ADAGIO_MES_INDEX; 
  ```

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- [ ] Mises à jour diverses, sur des vues existantes :
  * [ ] Ajouter PMFM.PRECISION (existe dans la table Adagio sous-jacente)
  * [ ] Ajouter PMFM.DETECTION_THRESHOLD (existe dans la table Adagio sous-jacente)
  * [ ] Ajouter  `null as PHYSICAL_GEAR.PARENT_PHYSICAL_GEAR_FK` (colonne non existante dans Adagio, mais pas utilisée par Imagine)
  * [ ] Ajouter la colonne PHYSICAL_GEAR.HASH => nouvelle table pour gérer ce hash, et ajout de la colonne dans la vue. Cf le schéma de validation
- [ ] Nouvelle vue ORDER_TYPE :
  ```sql
  create or replace view order_type as
  select id,
       comments,
       null as creation_date,
       description,
       null as label,
       name,
       object_type_fk,
       status_fk,
       update_date
  from SIH2_ADAGIO_DBA.order_type;
  /
  ```

- [ ] Mise à jour de la table USER_EVENT
  ```sql
  alter table USER_EVENT add READ_DATE TIMESTAMP;
  alter table USER_EVENT add SOURCE VARCHAR2(50);
  alter table USER_EVENT add EVENT_LEVEL VARCHAR2(50);
  CREATE INDEX USER_EVENT_SOURCE_IDX ON USER_EVENT(SOURCE) TABLESPACE SIH2_ADAGIO_DBA_SUMARIS_INDEX;
  CREATE INDEX USER_EVENT_RECIPIENT_IDX ON USER_EVENT(RECIPIENT) TABLESPACE SIH2_ADAGIO_DBA_SUMARIS_INDEX;
  ```

- [ ] Mise à jour de la vue VESSEL_FEATURES
  ```sql
  create or replace view VESSEL_FEATURES as
  select VF.ID,
         VF.START_DATE_TIME as START_DATE,
         VF.END_DATE_TIME as END_DATE,
         VF.NAME,
         VF.EXTERIOR_MARKING,
         VF.ADMINISTRATIVE_POWER,
         VF.GROSS_TONNAGE_GT,
         VF.GROSS_TONNAGE_GRT,
         VF.LOA as LENGTH_OVER_ALL,
         --VF.LBP,
         VF.CONSTRUCTION_YEAR,
         VF.IRCS,
         VF.AUXILIARY_POWER,
         --VF.HAS_VMS,
         --VF.IS_FPC,
         null as COMMENTS,
         null as CONTROL_DATE,
         null as CREATION_DATE,
         null as VALIDATION_DATE,
         null as QUALIFICATION_DATE,
         null as QUALIFICATION_COMMENTS,
         VF.UPDATE_DATE,
         V.ID as VESSEL_FK,
         VF.BASE_PORT_LOCATION_FK,
         VF.HULL_MATERIAL_QV_FK,
         null as RECORDER_DEPARTMENT_FK,
         null as RECORDER_PERSON_FK,
         0 as QUALITY_FLAG_FK
  from SIH2_ADAGIO_DBA.VESSEL_FEATURES VF
           inner join SIH2_ADAGIO_DBA.M_VESSEL V on VF.VESSEL_FK = V.CODE;
  /
  ```

- [ ] Mise à jour de la vue IMAGE_ATTACHMENT
  ```sql
  create or replace  view IMAGE_ATTACHMENT as
  select ID,
         COMMENTS,
         PATH,
         null as CONTENT,
         null as CONTENT_TYPE,
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
  /  
  ```

- [ ] Mise à jour de la vue ROUND_WEIGHT_CONVERSION: ajout de la colonne ORIGIN_ITEM_TYPE_FK (déjà existante dans Adagio)
  <details>
    <summary>SQL</summary>
  
    ```sql
    create or replace view ROUND_WEIGHT_CONVERSION as
    select ID,
           COMMENTS,
           CONVERSION_COEFFICIENT,
           null as CREATION_DATE,
           DESCRIPTION,
           START_DATE,
           END_DATE,
           UPDATE_DATE,
           DRESSING_FK,
           PRESERVING_FK,
           LOCATION_FK,
           TAXON_GROUP_FK,
           ORIGIN_ITEM_TYPE_FK,
           1 as STATUS_FK
    from SIH2_ADAGIO_DBA.ROUND_WEIGHT_CONVERSION RWC;
    /
    ```  
  </details>

- [ ] Ajout de la vue `WEIGHT_LENGTH_CONVERSION` (lecture seule)
  ```sql
  create or replace view WEIGHT_LENGTH_CONVERSION as
  select WLC.ID as ID,
         START_MONTH,
         END_MONTH,
         LOCATION_FK,
         SEX_QUALITATIVE_VALUE_FK,
         REFERENCE_TAXON_FK,
         YEAR,
         LENGTH_UNIT_FK,
         CONVERSION_COEFFICIENT_A,
         CONVERSION_COEFFICIENT_B,
         UPDATE_DATE,
         DESCRIPTION,
         MP.ID as LENGTH_PARAMETER_FK,
         cast(STATUS_FK as number(10)) as STATUS_FK ,
         null as COMMENTS,
         null as CREATION_DATE,
         null as ORIGIN_ITEM_TYPE_FK
  from SIH2_ADAGIO_DBA.weight_length_conversion WLC
    inner join SIH2_ADAGIO_DBA.M_PARAMETER MP on MP.CODE=WLC.LENGTH_PARAMETER_FK;
  /
  ```

- [ ] Correction du trigger sur la vue SAMPLE :
  ```sql oracle
  create or replace trigger TR_SAMPLE
      instead of insert or update or delete
      on SAMPLE
      for each row
  begin
      case
          WHEN INSERTING THEN
              -- SAMPLE itself
              insert into SIH2_ADAGIO_DBA.SAMPLE(ID, LABEL, INDIVIDUAL_COUNT, SAMPLE_DATE, SAMPLE_SIZE, COMMENTS, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE,
                                                PARENT_SAMPLE_FK, SIZE_UNIT_FK, MATRIX_FK, RECORDER_PERSON_FK, RECORDER_DEPARTMENT_FK, PROGRAM_FK, REFERENCE_TAXON_FK, TAXON_GROUP_FK, BATCH_FK, FISHING_OPERATION_FK, QUALITY_FLAG_FK)
              select :new.ID, :new.LABEL, :new.INDIVIDUAL_COUNT, :new.SAMPLE_DATE, :new.SAMPLE_SIZE, :new.COMMENTS, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.UPDATE_DATE,
                     :new.PARENT_SAMPLE_FK, :new.SIZE_UNIT_FK, :new.MATRIX_FK, :new.RECORDER_PERSON_FK, :new.RECORDER_DEPARTMENT_FK, MP.CODE, :new.REFERENCE_TAXON_FK, :new.TAXON_GROUP_FK, :new.BATCH_FK, :new.OPERATION_FK, :new.QUALITY_FLAG_FK
              from SIH2_ADAGIO_DBA.M_PROGRAM MP
              where MP.ID = :new.PROGRAM_FK;
              -- M_SAMPLE (map columns of SAMPLE for sumaris)
              insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_SAMPLE(ID, HASH, RANK_ORDER, LANDING_FK)
              values (:new.ID, :new.HASH, :new.RANK_ORDER, :new.LANDING_FK);
          WHEN UPDATING THEN
              -- SAMPLE itself
              update SIH2_ADAGIO_DBA.SAMPLE S set S.LABEL=:new.LABEL, S.INDIVIDUAL_COUNT=:new.INDIVIDUAL_COUNT, S.SAMPLE_DATE=:new.SAMPLE_DATE, S.SAMPLE_SIZE=:new.SAMPLE_SIZE, S.COMMENTS=:new.COMMENTS, S.CREATION_DATE=:new.CREATION_DATE,
                                               S.CONTROL_DATE=:new.CONTROL_DATE, S.VALIDATION_DATE=:new.VALIDATION_DATE, S.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, S.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, S.UPDATE_DATE=:new.UPDATE_DATE,
                                               S.PARENT_SAMPLE_FK=:new.PARENT_SAMPLE_FK, S.SIZE_UNIT_FK=:new.SIZE_UNIT_FK, S.MATRIX_FK=:new.MATRIX_FK, S.RECORDER_PERSON_FK=:new.RECORDER_PERSON_FK, S.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK,
                                               S.REFERENCE_TAXON_FK=:new.REFERENCE_TAXON_FK, S.TAXON_GROUP_FK=:new.TAXON_GROUP_FK, S.BATCH_FK=:new.BATCH_FK, S.FISHING_OPERATION_FK=:new.OPERATION_FK, S.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                               S.PROGRAM_FK = (select MP.CODE from SIH2_ADAGIO_DBA.M_PROGRAM MP where MP.ID=:new.PROGRAM_FK)
              where S.ID = :new.ID;
              -- M_SAMPLE update if row exists
              update M_SAMPLE MS set MS.HASH=:new.HASH, MS.RANK_ORDER=:new.RANK_ORDER, MS.LANDING_FK=:new.LANDING_FK
              where MS.ID = :new.ID;
              -- M_SAMPLE insert if row not exists
              if (SQL%ROWCOUNT = 0) then
                  insert into M_SAMPLE (ID, HASH, RANK_ORDER, LANDING_FK)
                  values (:new.ID, :new.HASH, :new.RANK_ORDER, :new.LANDING_FK);
              end if;
          WHEN DELETING THEN
              delete from SIH2_ADAGIO_DBA.SAMPLE S where S.ID=:old.ID;
              delete from M_SAMPLE MS where MS.ID=:old.ID;
          end case;
  end;
  /
  ```
