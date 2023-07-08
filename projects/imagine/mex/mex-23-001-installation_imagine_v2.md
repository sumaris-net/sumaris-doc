# Manuel de mise en exploitation d'Imagine (v2.5.1)

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.5.1

Liste des tickets réalisés : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/370#note_126575

> Auteur: Benoit LAVENIER
> Date création : 04/07/2023
> Mise à jour : 07/07/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # Pas de nouvelle option
  ```

- [ ] Ajout d'une option pour activer l'accès direct aux échantillonnages :
  ```sql
  insert into SOFTWARE_PROPERTY (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, SOFTWARE_FK) values (SOFTWARE_PROPERTY_SEQ.nextval, 'sumaris.observedLocation.landings.tab.enable', 'true', sysdate, systimestamp);  
  ```

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

RAS