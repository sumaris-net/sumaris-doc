# Manuel de mise en exploitation d'Imagine version ??

Objectif : le document liste les étapes de migration, pour réaliser la mise en production

Liste des tickets réalisés : 
- [#499](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/499) - [Obs. Individuelle - sorties] Modification champ Date
- [#500](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/500) - [Ligne de plan] Invalid value of AppliedPeriode.endDate

> Auteur: Benoit LAVENIER
> Date création : 13/12/2023
> Mise à jour : 13/12/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # TODO
  ```

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

RAS
  
## Mise à jour du programme SIH-OBSBIO

RAS


## Mise à jour des données SIH-OBSBIO

- Correction des `AppliedPeriod.endDate` en remplaçant `23:59:59` par `00:00:00` (cf ticket [#500](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/500)): 
  ```sql
  UPDATE APPLIED_PERIOD
  SET END_DATE = TRUNC(END_DATE)
  WHERE END_DATE <> TRUNC(END_DATE)
  AND APPLIED_STRATEGY_FK in (
    select APS.ID 
    from APPLIED_STRATEGY APS 
    inner join STRATEGY on STRATEGY.ID = APS.STRATEGY_FK 
    where STRATEGY.PROGRAM_FK=:programId -- ID du program 'SIH-OBSBIO'
  );
- ``` 