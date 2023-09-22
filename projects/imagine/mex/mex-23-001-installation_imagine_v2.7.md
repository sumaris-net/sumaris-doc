# Manuel de mise en exploitation d'Imagine v2.7

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.7

Liste des tickets réalisés : 
- [#458](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/458) - Recette Imagine 2.5.1
- [#370](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/370#note_126575) - Tickets à traiter Imagine (Priorité 0 et 1 de la note du 02/06/2023) 

> Auteur: Maxime DEMAREST, Benoit LAVENIER
> Date création : 07/09/2023
> Mise à jour : 18/09/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # pas de nouvelle option
  ```


## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- [ ] Mise à jour de la vue TRIP, pour ajouter la colonne SCIENTIFIC_CRUISE_FK
  ```sql oracle
  TODO
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
    MV.ID as VESSEL_FK,
    MP.ID AS PROGRAM_FK  
  from SIH2_ADAGIO_DBA.SCIENTIFIC_CRUISE SC
  inner join SIH2_ADAGIO_DBA.M_VESSEL MV on SC.VESSEL_FK = MV.CODE
  inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on SC.PROGRAM_FK = MP.CODE;
  /
  ```

## Mise a jours du programme SIH-OBSBIO


- [ ] Ajouter M_PMFM_STRATEGY.PARAMETER_FK
  ```sql
  ALTER TABLE M_PMFM_STRATEGY ADD (PARAMETER_FK NUMBER(10));
  ```

- [ ] Mettre à jour la vue PMFM_STRATEGY
  ```sql
  create or replace view PMFM_STRATEGY as
  select PS.ID,
         PS.ACQUISITION_NUMBER,
         MPS.DEFAULT_VALUE,
         PS.IS_MANDATORY,
         PS.MIN_VALUE,
         PS.MAX_VALUE,
         PS.RANK_ORDER,
         AL.ID as ACQUISITION_LEVEL_FK,
         PS.PMFM_FK,
         PS.STRATEGY_FK,
         PS.FRACTION_FK,
         MPS.PARAMETER_FK,
         null as MATRIX_FK,
         null as METHOD_FK
  from SIH2_ADAGIO_DBA.PMFM_STRATEGY PS
  inner join SIH2_ADAGIO_DBA.M_ACQUISITION_LEVEL AL on PS.ACQUISITION_LEVEL_FK = AL.CODE
  left outer join SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY MPS on PS.ID = MPS.ID;
  /
  
  create or replace trigger TR_PMFM_STRATEGY
      instead of insert or update or delete
      on PMFM_STRATEGY
  begin
      case
          WHEN INSERTING THEN
              -- PMFM_STRATEGY itself
              insert into SIH2_ADAGIO_DBA.PMFM_STRATEGY(ID, ACQUISITION_NUMBER, RANK_ORDER, IS_MANDATORY, MIN_VALUE, MAX_VALUE, PMFM_FK, ACQUISITION_LEVEL_FK, STRATEGY_FK, FRACTION_FK)
              select :new.ID, :new.ACQUISITION_NUMBER, :new.RANK_ORDER, :new.IS_MANDATORY, :new.MIN_VALUE, :new.MAX_VALUE, :new.PMFM_FK, AL.CODE, :new.STRATEGY_FK, :new.FRACTION_FK
              from SIH2_ADAGIO_DBA.M_ACQUISITION_LEVEL AL
              where AL.ID = :new.ACQUISITION_LEVEL_FK;
              -- M_PMFM_STRATEGY (map columns of PMFM_STRATEGY for sumaris)
              insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_PMFM_STRATEGY(ID, DEFAULT_VALUE, PARAMETER_FK)
              values (:new.ID, :new.DEFAULT_VALUE, :new.PARAMETER_FK);
          WHEN UPDATING THEN
              -- PMFM_STRATEGY itself
              update SIH2_ADAGIO_DBA.PMFM_STRATEGY PS set PS.ACQUISITION_NUMBER=:new.ACQUISITION_NUMBER, PS.RANK_ORDER=:new.RANK_ORDER, PS.IS_MANDATORY=:new.IS_MANDATORY, PS.MIN_VALUE=:new.MIN_VALUE, PS.MAX_VALUE=:new.MAX_VALUE, PS.PMFM_FK=:new.PMFM_FK, PS.FRACTION_FK=:new.FRACTION_FK, PS.STRATEGY_FK=:new.STRATEGY_FK, PS.ACQUISITION_LEVEL_FK = (select L.CODE from SIH2_ADAGIO_DBA.M_ACQUISITION_LEVEL L where L.ID = :new.ACQUISITION_LEVEL_FK)
              where PS.ID = :new.ID;
              -- M_PMFM_STRATEGY update if row exists
              update M_PMFM_STRATEGY MPS set MPS.DEFAULT_VALUE=:new.DEFAULT_VALUE, MPS.PARAMETER_FK=:new.PARAMETER_FK
              where MPS.ID = :new.ID;
              -- M_PMFM_STRATEGY insert if row not exists
              insert into M_PMFM_STRATEGY(ID, DEFAULT_VALUE, PARAMETER_FK)
              select PS.ID, :new.DEFAULT_VALUE, :new.PARAMETER_FK from SIH2_ADAGIO_DBA.PMFM_STRATEGY PS where PS.ID = :new.ID and not exists (select * from M_PMFM_STRATEGY MPS where  MPS.ID = :new.ID);
          WHEN DELETING THEN
              delete from SIH2_ADAGIO_DBA.PMFM_STRATEGY PS where PS.ID = :old.ID;
              delete from M_PMFM_STRATEGY MPS where MPS.ID = :old.ID;
          end case;
  end;
  /
  ```
  
- [ ] Mettre à jour les PMFM_STRATEGY : Utiliser le paramètre AGE plutot que le PMFM age
  ```sql
  UPDATE PMFM_STRATEGY ST
    SET ST.PARAMETER_FK = (select ID from SIH2_ADAGIO_DBA.M_PARAMETER where CODE = 'AGE')
  WHERE
    ST.PARAMETER_FK IS NULL
    AND (
        (FRACTION_FK IS NOT NULL AND PMFM_FK IS NULL)
        OR (FRACTION_FK IS NULL AND PMFM_FK in (SELECT ID FROM SIH2_ADAGIO_DBA.PMFM WHERE PARAMETER_FK='AGE'))
    )
    AND STRATEGY_FK IN (SELECT STRATEGY.ID FROM SIH2_ADAGIO_DBA.STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO')
  ```

- [ ] Mise à jour des UPDATE_DATE des stratégies impactées :
  ```sql
  UPDATE SIH2_ADAGIO_DBA.STRATEGY 
    SET UPDATE_DATE=systimestamp
  WHERE
    EXISTS (SELECT * FROM SIH2_ADAGIO_DBA.PMFM_STRATEGY WHERE PARAMETER_FK = 'AGE')    
    AND PROGRAM_FK = 'SIH-OBSBIO';
  ```

- [ ] Suppression des lignes PMFM_STRATEGY redondante : 
  - TODO supprimer les lignes ayant un PMFM_FK=AGE, alors qu'il existe des PMFM_STRATEGY avec parameter_fk 'AGE' et une fraction_K) 