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
         V.ID as VESSEL_FK,
         P.ID AS PROGRAM_FK  
  from SIH2_ADAGIO_DBA.SCIENTIFIC_CRUISE SC
  inner join SIH2_ADAGIO_DBA.VESSEL V on SC.VESSEL_FK = V.CODE
  inner join SIH2_ADAGIO_DBA.PROGRAM P on SC.PROGRAM_FK = P.CODE;
  /
  ```

## Mise a jours du programme SIH-OBSBIO

- [ ] Mettre à jour les PMFM_STRATEGY : ajouter le paramètre AGE lorsqu'il y a qu'une fraction, mais pas de pmfm ni de paramètre
  ```sql
  UPDATE FROM PMFM_STRATEGY 
    SET PARAMETER_FK = 'AGE' 
  WHERE
    PARAMETER_FK IS NULL AND PMFM_FK IS NULL
    AND FRACTION_FK IS NOT NULL
    AND STRATEGY_FK IN (SELECT STRATEGY.ID FROM STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO');
  ```

- [ ] Supprimer les anciennes ligne PMFM_STRATEGY qui n'ont que le PMFM `AGE` et pas de fraction
  ```sql
  DELETE FROM PMFM_STRATEGY 
  WHERE   
    PMFM_FK IN (SELECT ID FROM PMFM WHERE PARAMETER_FK='AGE')  
    AND FRACTION_FK IS NULL
    AND STRATEGY_FK IN (SELECT STRATEGY.ID FROM STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO');
  ```

- [ ] Mise à jour des UPDATE_DATE des stratégies impactées :
  ```sql
  UPDATE STRATEGY set UPDATE_DATE=systimestamp
  WHERE
    EXISTS (SELECT * FROM PMFM_STRATEGY WHERE PARAMETER_FK = 'AGE' AND FRACTION_FK IS NOT NULL)    
    AND PROGRAM_FK = 'SIH-OBSBIO';
  ```
