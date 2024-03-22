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

- TODO

## Mise à jour du programme SIH-OBSMER

- TODO