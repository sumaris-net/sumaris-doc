# Manuel de mise en exploitation d'Imagine v2.8

Objectif : le document liste les étapes de migration, pour réaliser le passage d'Imagine en v2.8

Liste des tickets réalisés : 
- TODO

> Auteur: Benoit LAVENIER
> Date création : 26/09/2023
> Mise à jour : 26/09/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties
  # TODO: sumaris.enumeration.AcquisitionLevel.xxx.id
  sumaris.enumeration.AcquisitionLevel.TRIP.label=OBSERVED_FISHING_TRIP
  sumaris.enumeration.AcquisitionLevel.PHYSICAL_GEAR.label=OBSERVED_FISHING_TRIP_PHYSICAL_GEAR
  sumaris.enumeration.AcquisitionLevel.OPERATION.label=OPERATION
  ```

- [ ] Renommer les options suivantes dans le fichier de configuration :
  ```properties
  # --- sumaris.enumeration.LocationLevel.xxxx.id
  # ICES_SUB_AREA -> SUB_AREA_ICES
  sumaris.enumeration.LocationLevel.SUB_AREA_ICES.id=...
  
  # ICES_DIVISION => DIVISION_ICES
  sumaris.enumeration.LocationLevel.DIVISION_ICES.id=...

  # ICES_RECTANGLE -> RECTANGLE_ICES
  sumaris.enumeration.LocationLevel.RECTANGLE_ICES.id=...
  
  # GFCM_RECTANGLE (ou RECTANGLE_CGPM_GFCM) -> RECTANGLE_GFCM
  sumaris.enumeration.LocationLevel.RECTANGLE_GFCM.id=...
  ```
  > A noter qu'il est normal que les LOCATION_LEVEL.LABEL restent avec les anciens noms: cela ne pose pas de problème, 
  > car ici on ne renomme que les variables d'enumration, mais pas le contenu de la BDD. 

- [ ] Renommer les options suivantes dans SOFTWARE_PROPERTY
  ```sql
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.SUB_AREA_ICES.id' where label='sumaris.enumeration.LocationLevel.ICES_SUB_AREA.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.DIVISION_ICES.id' where label='sumaris.enumeration.LocationLevel.ICES_DIVISION.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.SUB_DIVISION_ICES.id' where label='sumaris.enumeration.LocationLevel.ICES_SUB_DIVISION.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.RECTANGLE_ICES.id' where label='sumaris.enumeration.LocationLevel.ICES_RECTANGLE.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.SUB_AREA_GFCM.id' where label='sumaris.enumeration.LocationLevel.GFCM_SUB_AREA.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.DIVISION_GFCM.id' where label='sumaris.enumeration.LocationLevel.GFCM_DIVISION.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.SUB_DIVISION_GFCM.id' where label='sumaris.enumeration.LocationLevel.GFCM_SUB_DIVISION.id';
  update SOFTWARE_PROPERTY set label='sumaris.enumeration.LocationLevel.RECTANGLE_GFCM.id' where label IN ('sumaris.enumeration.LocationLevel.RECTANGLE_CGPM_GFCM.id', 'sumaris.enumeration.LocationLevel.GFCM_RECTANGLE.id');
  ```

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

RAS
  
## Mise a jours du programme SIH-OBSMER

RAS