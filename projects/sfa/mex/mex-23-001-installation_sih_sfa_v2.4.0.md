# Manuel de mise en exploitation SUMARiS v2.4.0

Objectif : le document liste les étapes de migration, pour réaliser le passage en v2.4.0

> Auteur: Benoit LAVENIER, Ludovic PECQUOT
> Date création : 27/06/2023
> Mise à jour : 30/06/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # Activer les extractions
  sumaris.extraction.enabled=true
  sumaris.extraction.product.enable=true
  #sumaris.extraction.map.enable=false
  sumaris.extraction.map.center.latLng=-4.621457, 55.456329'
  sumaris.extraction.map.center.zoom=6
  sumaris.extraction.accessNotSelfExtraction.role=ADMIN
  
  # Enumerations
  sumaris.enumeration.Pmfm.SEX.id=171
  sumaris.enumeration.Pmfm.LENGTH_CARAPACE_MM.id=157
  sumaris.enumeration.Unit.MM.id=21
  sumaris.enumeration.Unit.CM.id=17
  sumaris.enumeration.Unit.KG.id=14
  ```

- [ ] Ajout d'un ProgramProperty, sur le programme LOGBOOK-SEA-CUCUMBER :
  ```sql
  -- Enable generic extraction format
  insert into PROGRAM_PROPERTY (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, PROGRAM_FK) values (PROGRAM_PROPERTY_SEQ.nextval, 'sumaris.extraction.formats', 'PMFM_TRIP', sysdate, systimestamp, 12);
  ```

- [ ] Ajout d'un ProgramProperty, sur le programme LOGBOOK-LOBSTER :
  ```sql
  -- Enable Batch denormalization
  insert into PROGRAM_PROPERTY (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, PROGRAM_FK) values (PROGRAM_PROPERTY_SEQ.nextval, 'sumaris.trip.extraction.batch.denormalization.enable', 'true', sysdate, systimestamp, 11);
  -- Enable generic extraction format
  insert into PROGRAM_PROPERTY (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, PROGRAM_FK) values (PROGRAM_PROPERTY_SEQ.nextval, 'sumaris.extraction.formats', 'PMFM_TRIP', sysdate, systimestamp, 11);
  ```

## Schéma SIH2_ADAGIO_DBA

- [ ] Ajout des droits d'accès sur DENORMALIZED_BATCH, DENORMALIZED_BATCH_SORT_VAL et DENORMALIZED_BATCH_SORT_VA_SEQ 
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VA_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.DENORMALIZED_BATCH to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VAL to SIH2_ADAGIO_DBA_SUMARIS_MAP; 
  ```

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- [ ] Mises à jour diverses, sur des vues existantes :
  * [ ] Ajouter des synomymes DENORMALIZED_BATCH et DENORMALIZED_BATCH_SORT_VA_SEQ
  ```
  create or replace synonym DENORMALIZED_BATCH FOR SIH2_ADAGIO_DBA.DENORMALIZED_BATCH;
  create or replace synonym DENORMALIZED_BATCH_SORT_VA_SEQ FOR SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VA_SEQ;
  ```
  * [ ] Ajouter de la vue DENORMALIZED_BATCH_SORT_VAL (+ trigger)
  ```sql oracle
  create or replace view SIH2_ADAGIO_DBA_SUMARIS_MAP.DENORMALIZED_BATCH_SORT_VAL as
  select
      SV.ID,
      SV.RANK_ORDER,
      SV.IS_INHERITED,
      SV.NUMERICAL_VALUE,
      SV.QUALITATIVE_VALUE_FK,
      SV.PMFM_FK,
      SV.UNIT_FK,
      P.ID as PARAMETER_FK,
      SV.BATCH_FK,
      SV.ALPHANUMERICAL_VALUE
  from SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VAL SV
           inner join SIH2_ADAGIO_DBA.PARAMETER P on P.CODE = SV.PARAMETER_FK;
  
  create or replace trigger SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_DENORMALIZED_BATCH_SORT_VAL
      instead of insert or update
      on SIH2_ADAGIO_DBA_SUMARIS_MAP.DENORMALIZED_BATCH_SORT_VAL
      for each row
  begin
      case
          WHEN INSERTING THEN
              insert into SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VAL(
                  ID,RANK_ORDER,IS_INHERITED,NUMERICAL_VALUE,QUALITATIVE_VALUE_FK,PMFM_FK,UNIT_FK,PARAMETER_FK,BATCH_FK,ALPHANUMERICAL_VALUE)
              select :new.ID,:new.RANK_ORDER,:new.IS_INHERITED,:new.NUMERICAL_VALUE,:new.QUALITATIVE_VALUE_FK,:new.PMFM_FK,:new.UNIT_FK,P.CODE,:new.BATCH_FK,:new.ALPHANUMERICAL_VALUE
              from SIH2_ADAGIO_DBA.PARAMETER P
              where P.ID = :new.PARAMETER_FK;
          WHEN UPDATING THEN
              update SIH2_ADAGIO_DBA.DENORMALIZED_BATCH_SORT_VAL SV set
                                                                        SV.ID=:new.ID,SV.RANK_ORDER=:new.RANK_ORDER,SV.IS_INHERITED=:new.IS_INHERITED,SV.NUMERICAL_VALUE=:new.NUMERICAL_VALUE,SV.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK,SV.PMFM_FK=:new.PMFM_FK,SV.UNIT_FK=:new.UNIT_FK,
                                                                        PARAMETER_FK=(SELECT CODE FROM SIH2_ADAGIO_DBA.PARAMETER WHERE ID=:new.PARAMETER_FK),BATCH_FK=:new.BATCH_FK,ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE
              where SV.ID = :new.ID;
          end case;
  end;
  /
  ```

- [ ] Correction du paramètre CARAPACE_LENGTH
  ```sql oracle
  update PARAMETER set IS_ALPHANUMERIC=0, IS_BOOLEAN=0, IS_QUALITATIVE=0, IS_DATE=0, IS_CALCULATED=1 WHERE LABEL='LENGTH_CARAPACE';
  commit;
  ```
  
- [ ] Correction des données de lots utilisant CARAPACE_LENGTH
  ```sql oracle
  update SORTING_MEASUREMENT_B set NUMERICAL_VALUE=TO_NUMBER(REPLACE(ALPHANUMERICAL_VALUE, '.', ',')) WHERE PMFM_FK=157 AND ALPHANUMERICAL_VALUE IS NOT NULL;
  commit;
  ```

- [ ] Recompiler les éventuels triggers du schéma SIH2_ADAGIO_DBA_SUMARIS_MAP en erreur.