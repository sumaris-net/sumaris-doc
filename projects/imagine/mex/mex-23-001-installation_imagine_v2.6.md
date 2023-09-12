# Manuel de mise en exploitation d'Imagine v2.6

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.6

Liste des tickets réalisés : 
- https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/458/
- https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/370#note_126575

> Auteur: Maxime DEMAREST
> Date création : 07/09/2023
> Mise à jour : 11/09/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # pas de nouvelle option
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