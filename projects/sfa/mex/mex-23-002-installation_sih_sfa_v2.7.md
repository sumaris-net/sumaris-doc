# Manuel de mise en exploitation d'Imagine v2.7

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.7

> Auteur: Benoit LAVENIER
> Date création : 18/09/2023
> Mise à jour : 18/09/2023

## Configuration du Pod

RAS

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- [ ] Mise à jour de la vue TRIP, pour ajouter la colonne SCIENTIFIC_CRUISE_FK
  ```sql oracle
  create or replace view TRIP as
  select FT.ID,
         FT.COMMENTS,
         FT.DEPARTURE_DATE_TIME,
         FT.RETURN_DATE_TIME,
         FT.CONTROL_DATE,
         FT.VALIDATION_DATE,
         FT.QUALIFICATION_DATE,
         FT.QUALIFICATION_COMMENTS,
         FT.CREATION_DATE,
         FT.UPDATE_DATE,
         FT.DEPARTURE_LOCATION_FK,
         FT.RETURN_LOCATION_FK,
         V.ID as VESSEL_FK,
         P.ID as PROGRAM_FK,
         FT.RECORDER_DEPARTMENT_FK,
         FT.RECORDER_PERSON_FK,
         FT.SCIENTIFIC_CRUISE_FK,
         cast(FT.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK
  from SIH2_ADAGIO_DBA.FISHING_TRIP FT
  inner join SIH2_ADAGIO_DBA.VESSEL V on FT.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.PROGRAM P on FT.PROGRAM_FK = P.CODE;
  /
  create or replace trigger TR_TRIP
      instead of insert or update or delete
      on TRIP
  begin
      case
          WHEN INSERTING THEN
              if :new.ID is null then
                  raise_application_error(-20000, 'TRIP.ID must be not null');
              end if;
              -- FISHING_TRIP itself
              insert into SIH2_ADAGIO_DBA.FISHING_TRIP(ID, DEPARTURE_DATE_TIME, RETURN_DATE_TIME, COMMENTS, CREATION_DATE, CONTROL_DATE, VALIDATION_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, UPDATE_DATE, RECORDER_PERSON_FK, RECORDER_DEPARTMENT_FK,
                                                      VESSEL_FK, QUALITY_FLAG_FK, PROGRAM_FK, DEPARTURE_LOCATION_FK, RETURN_LOCATION_FK, SCIENTIFIC_CRUISE_FK)
              select :new.ID, :new.DEPARTURE_DATE_TIME, :new.RETURN_DATE_TIME, :new.COMMENTS, :new.CREATION_DATE, :new.CONTROL_DATE, :new.VALIDATION_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.UPDATE_DATE, :new.RECORDER_PERSON_FK,
                     :new.RECORDER_DEPARTMENT_FK, V.CODE, :new.QUALITY_FLAG_FK, P.CODE, :new.DEPARTURE_LOCATION_FK, :new.RETURN_LOCATION_FK, :new.SCIENTIFIC_CRUISE_FK
              from SIH2_ADAGIO_DBA.PROGRAM P, SIH2_ADAGIO_DBA.VESSEL V
              where P.ID = :new.PROGRAM_FK and V.ID = :new.VESSEL_FK;
              -- VESSEL_USE_FEATURES
              insert into SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES(START_DATE, END_DATE, CREATION_DATE, UPDATE_DATE, VESSEL_FK, PROGRAM_FK, IS_ACTIVE, FISHING_TRIP_FK) -- ID is computed by SIH2_ADAGIO_DBA.TR_VESSEL_USE_FEATURES_ID
              select :new.DEPARTURE_DATE_TIME, :new.RETURN_DATE_TIME, :new.CREATION_DATE, :new.UPDATE_DATE, V.CODE, P.CODE, 1, :new.ID
              from SIH2_ADAGIO_DBA.PROGRAM P, SIH2_ADAGIO_DBA.VESSEL V
              where P.ID = :new.PROGRAM_FK and V.ID = :new.VESSEL_FK;
          WHEN UPDATING THEN
              -- FISHING_TRIP itself
              update SIH2_ADAGIO_DBA.FISHING_TRIP T set T.DEPARTURE_DATE_TIME=:new.DEPARTURE_DATE_TIME, T.RETURN_DATE_TIME=:new.RETURN_DATE_TIME, T.COMMENTS=:new.COMMENTS, T.CREATION_DATE=:new.CREATION_DATE, T.CONTROL_DATE=:new.CONTROL_DATE,
                                          T.VALIDATION_DATE=:new.VALIDATION_DATE, T.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, T.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, T.UPDATE_DATE=:new.UPDATE_DATE, T.RECORDER_PERSON_FK=:new.RECORDER_PERSON_FK,
                                          T.RECORDER_DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, T.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK, T.DEPARTURE_LOCATION_FK=:new.DEPARTURE_LOCATION_FK, T.RETURN_LOCATION_FK=:new.RETURN_LOCATION_FK,
                                          T.SCIENTIFIC_CRUISE_FK=:new.SCIENTIFIC_CRUISE_FK
                                          T.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.PROGRAM P where P.ID=:new.PROGRAM_FK),
                                          T.VESSEL_FK = (select V.CODE from SIH2_ADAGIO_DBA.VESSEL V where V.ID=:new.VESSEL_FK)
              where T.ID = :new.ID;
              -- VESSEL_USE_FEATURES
              update SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES F set F.START_DATE=:new.DEPARTURE_DATE_TIME, F.END_DATE=:new.RETURN_DATE_TIME, F.CREATION_DATE=:new.CREATION_DATE, F.CONTROL_DATE=:new.CONTROL_DATE, F.VALIDATION_DATE=:new.VALIDATION_DATE,
                                                            F.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, F.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, F.UPDATE_DATE=:new.UPDATE_DATE, F.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                            F.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.PROGRAM P where P.ID=:new.PROGRAM_FK), F.VESSEL_FK = (select V.CODE from SIH2_ADAGIO_DBA.VESSEL V where V.ID=:new.VESSEL_FK)
              where F.FISHING_TRIP_FK = :new.ID;
          WHEN DELETING THEN
              update SIH2_ADAGIO_DBA.LANDING L set L.FISHING_TRIP_FK = null where L.FISHING_TRIP_FK = :old.ID;
              delete from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM where VUM.VESSEL_USE_FEATURES_FK = (select VUF.ID from SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF where VUF.FISHING_TRIP_FK = :old.ID);
              delete from SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF where VUF.FISHING_TRIP_FK = :old.ID;
              delete from SIH2_ADAGIO_DBA.FISHING_TRIP FT where FT.ID = :old.ID;
          end case;
  end;
  ```

- [ ] Création de la vue SCIENTIFIC_CRUISE
  ```sql oracle
  create or replace view SCIENTIFIC_CRUISE as
  select SC.ID,
         SC.NAME,
         SC.REFERENCE,
         SC.COMMENTS,
         SC.DEPARTURE_DATE_TIME,
         SC.RETURN_DATE_TIME,
         SC.CREATION_DATE,
         SC.UPDATE_DATE,
         SC.RECORDER_DEPARTMENT_FK,
         SC.RECORDER_PERSON_FK,
         SC.MANAGER_PERSON_FK,
         V.ID as VESSEL_FK,
         P.ID AS PROGRAM_FK  
  from SIH2_ADAGIO_DBA.SCIENTIFIC_CRUISE SC
  inner join SIH2_ADAGIO_DBA.VESSEL V on SC.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.PROGRAM P on SC.PROGRAM_FK = P.CODE;
  /
  ```
