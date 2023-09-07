# Manuel de mise en exploitation d'Imagine v2.5.3

Objectif : le document liste Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.5.3

Liste des tickets réalisés : 
- https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/458/
- https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/370#note_126575

> Auteur: Maxime DEMAREST
> Date création : 07/09/2023
> Mise à jour : 07/09/2023

## Mise a jours du programme SIH-OBSBIO

- [ ] Mettre à jour les PMFM Stratégie du programme `SIH-OBSBIO` : ajouter les paramètre AGE quant le paramètre absent, mais qu'il y a une fraction
  **TODO : Demander si le l'ID pour le programe `SIH-OBSBIO` est bien `SIH-OBSBIO` ?**
```sql
UPDATE FROM PMFM_STRATEGY SET PARAMETER_FK = 'AGE' WHERE 
  STRATEGY_FK IN (SELECT STRATEGY.ID FROM STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO')
  AND FRACTION_FK IS NOT NULL AND PARAMETER_FK IS NULL;
```

- [ ] Supprimer les anciens PMFM Stratégies qui n'ont que le paramétre `AGE` et pas de fraction
  **TODO : Demander si le l'ID pour le paramètre `AGE` est bien `AGE` ?**
```sql
DELETE FROM PMFM_STRATEGY WHERE
 STRATEGY_FK IN (SELECT STRATEGY.ID FROM STRATEGY WHERE PROGRAM_FK = 'SIH-OBSBIO')
 AND PARAMETER_FK = 'AGE' AND FRACTION_FK IS NULL;
```