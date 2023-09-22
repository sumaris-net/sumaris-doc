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

- [ ] Mettre à jour les PMFM_STRATEGY : Utiliser le paramètre AGE plutot que le PMFM age
  ```sql
  UPDATE SIH2_ADAGIO_DBA.PMFM_STRATEGY 
    SET PARAMETER_FK = 'AGE' 
  WHERE
    PARAMETER_FK IS NULL 
    AND (
        (FRACTION_FK IS NOT NULL AND PMFM_FK IS NULL)
        OR (FRACTION_FK IS NULL AND PMFM_FK = (SELECT ID FROM SIH2_ADAGIO_DBA.PMFM WHERE PARAMETER_FK='AGE'))
    )
    AND STRATEGY_FK IN (SELECT STRATEGY.ID FROM SIH2_ADAGIO_DBA.STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO');
  ```

- [ ] Mise à jour des UPDATE_DATE des stratégies impactées :
  ```sql
  UPDATE SIH2_ADAGIO_DBA.STRATEGY 
    SET UPDATE_DATE=systimestamp
  WHERE
    EXISTS (SELECT * FROM SIH2_ADAGIO_DBA.PMFM_STRATEGY WHERE PARAMETER_FK = 'AGE')    
    AND PROGRAM_FK = 'SIH-OBSBIO';
  ```
