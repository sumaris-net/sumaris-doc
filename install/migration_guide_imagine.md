# Migration Guide for SIH-Imagine

## Install v1.31

- Mise à jour des vues SUMARIS_MAP :
    * Ajouter PMFM.PRECISION (existe dans la table Adagio sous-jacente)
    * Ajouter PMFM.DETECTION_THRESHOLD (existe dans la table Adagio sous-jacente)
    * Ajouter  `null as PHYSICAL_GEAR.PARENT_PHYSICAL_GEAR_FK` (colonne non existante dans Adagio, mais pas utilisée par Imagine)
    * Ajouter la colonne PHYSICAL_GEAR.HASH => nouvelle table pour gérer ce hash, et ajout de la colonne dans la vue. Cf le schéma de validation
- Nouvelle vue ORDER_TYPE :
```
create or replace view order_type as
select id,
     comments,
     null as creation_date,
     description,
     null as label,
     name,
     object_type_fk,
     status_fk,
     update_date
from SIH2_ADAGIO_DBA.order_type;
```

- Correction dans SOFTWARE_PROPERTY :

```sql
update SOFTWARE_PROPERTY set name='MENU.OCCASIONS' where label='sumaris.observedLocation.name';
update SOFTWARE_PROPERTY set label='sumaris.extraction.enabled' where label='sumaris.extraction.enable';  # Ajout d'un 'd' à la fin
```

- Fichier de configuration :
```properties
sumaris.persistence.sample.hashOptimization=true
sumaris.persistence.bash.hashOptimization=true
sumaris.persistence.physicalGear.hashOptimization=true
```
- Ajout d'un ProgramProperty, sur le programme SIH-OBSBIO :
```properties
sumaris.program.strategy.department.enable=true 
```

## Install v2.0

### Schema SIH2_ADAGIO_DBA_SUMARIS_MAP

```sql
alter table USER_EVENT add READ_DATE TIMESTAMP;
alter table USER_EVENT add SOURCE VARCHAR(50);
alter table USER_EVENT add EVENT_LEVEL VARCHAR(50);
CREATE INDEX USER_EVENT_SOURCE_IDX ON USER_EVENT(SOURCE) TABLESPACE SIH2_ADAGIO_DBA_SUMARIS_INDEX;
CREATE INDEX USER_EVENT_RECIPIENT_IDX ON USER_EVENT(RECIPIENT) TABLESPACE SIH2_ADAGIO_DBA_SUMARIS_INDEX;
```

```sql
create or replace view VESSEL_FEATURES as
select VF.ID,
       VF.START_DATE_TIME as START_DATE,
       VF.END_DATE_TIME as END_DATE,
       VF.NAME,
       VF.EXTERIOR_MARKING,
       VF.ADMINISTRATIVE_POWER,
       VF.GROSS_TONNAGE_GT,
       VF.GROSS_TONNAGE_GRT,
       VF.LOA as LENGTH_OVER_ALL,
       --VF.LBP,
       VF.CONSTRUCTION_YEAR,
       VF.IRCS,
       VF.AUXILIARY_POWER,
       --VF.HAS_VMS,
       --VF.IS_FPC,
       null as COMMENTS,
       null as CONTROL_DATE,
       null as CREATION_DATE,
       null as VALIDATION_DATE,
       null as QUALIFICATION_DATE,
       null as QUALIFICATION_COMMENTS,
       VF.UPDATE_DATE,
       V.ID as VESSEL_FK,
       VF.BASE_PORT_LOCATION_FK,
       VF.HULL_MATERIAL_QV_FK,
       null as RECORDER_DEPARTMENT_FK,
       null as RECORDER_PERSON_FK,
       0 as QUALITY_FLAG_FK
from SIH2_ADAGIO_DBA.VESSEL_FEATURES VF
         inner join SIH2_ADAGIO_DBA.M_VESSEL V on VF.VESSEL_FK = V.CODE;

create or replace  view IMAGE_ATTACHMENT as
select ID,
       COMMENTS,
       PATH,
       null as CONTENT,
       null as CONTENT_TYPE,
       PHOTO_DATE as DATE_TIME,
       null as CREATION_DATE,
       null as CONTROL_DATE,
       VALIDATION_DATE,
       QUALIFICATION_DATE,
       QUALIFICATION_COMMENTS,
       UPDATE_DATE,
       cast(QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK,
       DEPARTMENT_FK as RECORDER_DEPARTMENT_FK,
       OBJECT_ID,
       OBJECT_TYPE_FK,
       null as RECORDER_PERSON_FK
from SIH2_ADAGIO_DBA.PHOTO P
/

``