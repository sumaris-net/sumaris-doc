# Manuel de mise en exploitation d'ObsMer v2.9


Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.8

Liste des tickets réalisés :
- 

> Auteur: Benoit LAVENIER
> Date création : 26/09/2023
> Mise à jour : 26/09/2023

## Configuration du Pod

RAS  

## Schéma SIH2_ADAGIO_DBA

Modification de PSFM : 
- PSFM `PRODUCT_DESTINATION` : il manque `Obligation à débarquer`
- Pour la capture accidentelle il faut un PSFM supplémentaire (ex: `état de remise à l'eau`)

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Appliquer les [manuels d'exploitation d'Imagine](../../imagine/mex) (v2.8)

- Mise à jour de la vue `IMAGE_ATTACHMENT`

- 

## Mise à jour du programme SIH-OBSMER

- TODO