# Manuel de mise en exploitation communs v2.9 aux volets ActiFLot, ObsVentes, ObsMer

> Auteur: Vincent Fachéro
> Date création : 03/09/2024
> Mise à jour : 03/09/2024

## Nouvelles options dans le fichier de configuration :
```properties
# Empêcher la modification des droits d'accès d'un programme (gérer par Adagio-admin) 
sumaris.program.privilege.readonly=true

# Déclaration de l'URL de l'app
sumaris.app.url=http://sumaris-app.isival.ifremer.fr

# LDAP extranet
spring.security.ldap.baseDn=ou=ficheannuaireextranet
spring.security.ldap.url=ldap://ldape.ifremer.fr/ou=extranet,dc=ifremer,dc=fr
```

## Schéma SIH2_ADAGIO_DBA

- Adagio : changelogs
  - Passer le changelog Oracle d'Adagio [db-changelog-4.3.0.xml](https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle/db-changelog-4.3.0.xml)
    - Nouvelle table ACTIVITY_CALENDAR2PERSON
    - Nouvelle colonne ACTIVITY_CALENDAR.ECONOMIC_SURVEY
    - Nouvelles colonnes HASH dans VESSEL_USE_FEATURES, GEAR_USE_FEATURES, GEAR_PHYSICAL_FEATURES
  - Passer le changelog Oracle Ifremer d'Adagio [db-changelog-4.3.0.xml](https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle/ifremer/db-changelog-4.3.0.xml)
    - Nouvelle colonne M_PARAMETER.IS_BOOLEAN
  - Passer le changelog Oracle d'Adagio [db-changelog-4.3.1.xml](https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle/db-changelog-4.3.1.xml) 
    - Zones de compétence pour la régionalisation
  - Passer le changelog Oracle d'Adagio [db-changelog-4.3.2.xml](https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/develop/core/src/main/resources/fr/ifremer/adagio/core/db/changelog/oracle/db-changelog-4.3.2.xml)
    - Zones de compétence et niveaux associés pour la régionalisation

- Adagio : Mise à jour du référentiel
  - Régionalisation : Mantis [66247](https://forge.ifremer.fr/mantis/view.php?id=66247)
    - Jouer le script SQL

  
- Ajout de droits sur `SIH2_ADAGIO_DBA.person`
  ```sql
  grant REFERENCES on sih2_adagio_dba.person to sih2_adagio_dba_sumaris_map;
  ```
- Ajout de droits sur `SIH2_ADAGIO_DBA.department`
  ```sql
  grant REFERENCES on sih2_adagio_dba.department to sih2_adagio_dba_sumaris_map;
  ``` 
- **!!! Ne pas exécuter pour la MEP** : Ajout de droits sur `SIH2_ADAGIO_DBA.STRATEGY_PROPERTY`
  ```sql
  --grant select on SIH2_ADAGIO_DBA.STRATEGY_PROPERTY to sih2_adagio_dba_sumaris_map;
  ```
- Ajout dans la table `PROGRAM_PROPERTY`
  ```sql
  insert into program_property (id, label, name, program_fk, status_fk, creation_date) values (program_property_seq.nextval, 'sumaris.program.privilege.readonly', 'true', 52 , 1, sysdate);
  ```

- Modification de la table `M_PARAMETER`
  ```sql
  alter table m_parameter add is_boolean number(1);
  alter table m_parameter add is_date number(1);
-```

- Nouvelle entrée dans la table `PROCESSING_TYPE` : `VESSEL_SNAPSHOTS_INDEXATION`

  ```sql
  INSERT INTO PROCESSING_TYPE (CODE, DESCRIPTION, STATUS_FK) values ('VESSEL_SNAPSHOTS_INDEXATION', 'Traitement d''indexation des navires dans ElastiSearch', 1);
  ```


- grants sur `PROGRAM2PERSON`
  ```sql
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.PROGRAM2PERSON to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM`
  ```sql
  grant SELECT,INSERT, UPDATE on SIH2_ADAGIO_DBA.PROGRAM to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `M_PROGRAM`
  ```sql
  grant SELECT,INSERT on SIH2_ADAGIO_DBA.M_PROGRAM to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `M_TAXON_GROUP_TYPE `
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.M_TAXON_GROUP_TYPE to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- **!!! La séquence n'existe pas** : grants sur `PROGRAM_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.PROGRAM_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `VESSEL_USE_FEATURES_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM2LOCATION_CLASSIF`
  ```sql
  grant SELECT,INSERT,DELETE on SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `STRATEGY`
  ```sql
  grant REFERENCES on SIH2_ADAGIO_DBA.STRATEGY to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  -```

- grants sur la REGIONALISATION
  ```sql
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.EXPERTISE_AREA2LOCATION_LEVEL to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT on SIH2_ADAGIO_DBA.EXPERTISE_AREA_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.EXPERTISE_AREA to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.EXPERTISE_AREA2LOCATION to SIH2_ADAGIO_DBA_SUMARIS_MAP;
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.EXPERTISE_AREA2LOCATION_LEVEL to SIH2_ADAGIO_DBA_SUMARIS_MAP;  
-```


- Trigger sur `TR_PROGRAM_ID`
  ```sql
      create or replace TRIGGER TR_PROGRAM_ID
        before insert or delete on PROGRAM
        for each row
  	    declare
		  l_code VARCHAR2(40) := NULL;
        begin
          case
            WHEN INSERTING THEN
              BEGIN                
                select CODE into l_code from M_PROGRAM where CODE = :new.CODE;
                EXCEPTION WHEN NO_DATA_FOUND THEN
                  insert into M_PROGRAM(CODE,ID) values (:new.CODE, M_PROGRAM_SEQ.nextval);
                END;
            WHEN DELETING THEN
              delete from M_PROGRAM P where P.CODE=:old.CODE;
          end case;
      end;
-```

  ## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

- Création de la séquence `NAMED_FILTER_SEQ`
  ```sql
  CREATE SEQUENCE SIH2_ADAGIO_DBA_SUMARIS_MAP.NAMED_FILTER_SEQ;
-```

- Création de la table `NAMED_FILTER`
  ```sql
  CREATE TABLE sih2_adagio_dba_sumaris_map.named_filter (
    id                     NUMBER(10) NOT NULL,
    name                   VARCHAR2(100) NOT NULL,
    entity_name            VARCHAR2(50) NOT NULL,
    content                CLOB NOT NULL,
    recorder_person_fk     NUMBER(10),
    recorder_department_fk NUMBER(10),
    update_date            TIMESTAMP NOT NULL,
    creation_date          TIMESTAMP NOT NULL,
    CONSTRAINT named_filter_pk PRIMARY KEY ( id )
  )TABLESPACE "SIH2_ADAGIO_DBA_SUMARIS_DATA";

  ALTER TABLE sih2_adagio_dba_sumaris_map.named_filter
  ADD CONSTRAINT named_filter_recor_person_fkc FOREIGN KEY ( recorder_person_fk )
  REFERENCES sih2_adagio_dba.person ( id );

  ALTER TABLE sih2_adagio_dba_sumaris_map.named_filter
  ADD CONSTRAINT named_filter_recor_depart_fkc FOREIGN KEY ( recorder_department_fk )
  REFERENCES sih2_adagio_dba.department ( id );
-```

- Ajout de la vue `PARAMETER`
  ```sql
  create or replace view PARAMETER as
      select MP.ID,
      P.CODE as LABEL,
      P.COMMENTS,
      P.CREATION_DATE,
      P.DESCRIPTION,
      P.IS_ALPHANUMERIC,
      MP.IS_BOOLEAN,
      MP.IS_DATE,
      P.IS_QUALITATIVE,
      P.NAME,
      P.PARAMETER_GROUP_FK,
      P.UPDATE_DATE,
      cast(P.STATUS_FK as number(10)) as STATUS_FK
      from SIH2_ADAGIO_DBA.PARAMETER P
      inner join SIH2_ADAGIO_DBA.M_PARAMETER MP on P.CODE = MP.CODE;
-```

- Ajout de la vue `PROGRAM`
  ```sql
  CREATE OR REPLACE FORCE VIEW "SIH2_ADAGIO_DBA_SUMARIS_MAP"."PROGRAM" ("ID", "COMMENTS", "CREATION_DATE", "DESCRIPTION", "LABEL", "NAME", "UPDATE_DATE", "TAXON_GROUP_TYPE_FK", "GEAR_CLASSIFICATION_FK", "STATUS_FK") AS 
      select MP.ID,
      null as COMMENTS,
      P.CREATION_DATE,
      P.DESCRIPTION,
      P.CODE as LABEL,
      P.NAME,
      P.UPDATE_DATE,
      TGT.ID as TAXON_GROUP_TYPE_FK,
      P.GEAR_CLASSIFICATION_FK,
      1 as STATUS_FK
      from SIH2_ADAGIO_DBA.PROGRAM P
      inner join SIH2_ADAGIO_DBA.M_PROGRAM MP on P.code = MP.code
      inner join SIH2_ADAGIO_DBA.M_TAXON_GROUP_TYPE TGT on P.TAXON_GROUP_TYPE_FK = TGT.CODE;
-```


- Modification du trigger `TR_PROGRAM`
  ```sql
    create or replace trigger TR_PROGRAM
      instead of insert or update
      on PROGRAM
    begin
      case
        WHEN INSERTING THEN
          if (:new.ID is not null) then
            insert into SIH2_ADAGIO_DBA.M_PROGRAM(CODE,ID) values (:new.LABEL, :new.ID);
          end if;

          insert into SIH2_ADAGIO_DBA.PROGRAM(CODE, NAME, DESCRIPTION, CREATION_DATE, UPDATE_DATE, TAXON_GROUP_TYPE_FK, GEAR_CLASSIFICATION_FK)
          select :new.LABEL, :new.NAME, :new.DESCRIPTION, :new.CREATION_DATE, :new.UPDATE_DATE, TGT.CODE, :new.GEAR_CLASSIFICATION_FK
          from SIH2_ADAGIO_DBA.M_TAXON_GROUP_TYPE TGT
          where TGT.ID = :new.TAXON_GROUP_TYPE_FK;
       WHEN UPDATING THEN
           -- PROGRAM itself		   
           update SIH2_ADAGIO_DBA.PROGRAM P set P.NAME=:new.NAME, P.DESCRIPTION=:new.DESCRIPTION, P.CREATION_DATE=:new.CREATION_DATE, P.UPDATE_DATE=:new.UPDATE_DATE, 
           P.TAXON_GROUP_TYPE_FK=(select CODE from SIH2_ADAGIO_DBA.M_TAXON_GROUP_TYPE where ID = :new.TAXON_GROUP_TYPE_FK), P.GEAR_CLASSIFICATION_FK=:new.GEAR_CLASSIFICATION_FK
           where P.CODE = :new.LABEL;
       end case;
end;
-```

- Création du trigger `TR_PROGRAM2LOCATION_CLASSIF`
  ```sql
    create or replace trigger TR_PROGRAM2LOCATION_CLASSIF
      instead of insert or delete
      on PROGRAM2LOCATION_CLASSIF
    begin
      case
        WHEN INSERTING THEN
          insert into SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF(PROGRAM_FK, LOCATION_CLASSIFICATION_FK)
          select P.CODE, :new.LOCATION_CLASSIFICATION_FK
          from SIH2_ADAGIO_DBA.M_PROGRAM P
          where P.ID = :new.PROGRAM_FK;
        WHEN DELETING THEN
          delete from SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF where PROGRAM_FK=(select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID = :old.PROGRAM_FK) and LOCATION_CLASSIFICATION_FK=:old.LOCATION_CLASSIFICATION_FK;
      end case;
  end;
-```

- Ajout du trigger `TR_PROGRAM2PERSON`
```sql
  create or replace trigger TR_PROGRAM2PERSON
    instead of insert or update or delete
    on PROGRAM2PERSON
  begin
    case
      WHEN INSERTING THEN
        insert into SIH2_ADAGIO_DBA.PROGRAM2PERSON(ID,PROGRAM_FK,LOCATION_FK,PROGRAM_PRIVILEGE_FK,PERSON_FK,REFERENCE_PERSON_FK,UPDATE_DATE)
        select :new.ID, P.CODE, :new.LOCATION_FK, :new.PROGRAM_PRIVILEGE_FK, :new.PERSON_FK, :new.REFERENCE_PERSON_FK, :new.UPDATE_DATE
        from SIH2_ADAGIO_DBA.M_PROGRAM P
        where P.ID = :new.PROGRAM_FK;
      WHEN UPDATING THEN
        update SIH2_ADAGIO_DBA.PROGRAM2PERSON P2P set P2P.PROGRAM_FK = (select P.CODE from SIH2_ADAGIO_DBA.M_PROGRAM P where P.ID = :new.PROGRAM_FK),
                                                      P2P.LOCATION_FK = :new.LOCATION_FK, P2P.PROGRAM_PRIVILEGE_FK = :new.PROGRAM_PRIVILEGE_FK,
                                                      P2P.PERSON_FK = :new.PERSON_FK, P2P.REFERENCE_PERSON_FK = :new.REFERENCE_PERSON_FK,
                                                      P2P.UPDATE_DATE = :new.UPDATE_DATE
        where P2P.ID = :new.ID;
      WHEN DELETING THEN
        delete from SIH2_ADAGIO_DBA.PROGRAM2PERSON P2P where P2P.ID=:old.ID;
    end case;
  end;
- ```

- Modification de la vue `VESSEL_USE_MEASUREMENT`
  ```sql
    create or replace view VESSEL_USE_MEASUREMENT as
      select VUM.ID,
             null as COMMENTS,
             VUM.NUMERICAL_VALUE,
             VUM.ALPHANUMERICAL_VALUE,
             VUM.DIGIT_COUNT,
             VUM.PRECISION_VALUE,
             MVUM.RANK_ORDER,
             VUM.CONTROL_DATE,
             VUM.VALIDATION_DATE,
             VUM.QUALIFICATION_DATE,
             VUM.QUALIFICATION_COMMENTS,
             null as UPDATE_DATE,
             VUM.PMFM_FK,
             VUF.FISHING_TRIP_FK as TRIP_FK, -- 1 VESSEL_USE_FEATURES créé en meme temps que le TRIP
             VUF.OPERATION_FK, -- 1 VESSEL_USE_FEATURES créé en meme temps que l'OPERATION
             VUM.VESSEL_USE_FEATURES_FK,
             VUM.QUALITATIVE_VALUE_FK,
             VUM.DEPARTMENT_FK as RECORDER_DEPARTMENT_FK,
             cast(VUM.QUALITY_FLAG_FK as number(10)) as QUALITY_FLAG_FK
      from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM
      inner join SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF on VUM.VESSEL_USE_FEATURES_FK = VUF.ID
      left outer join SIH2_ADAGIO_DBA_SUMARIS_MAP.M_VESSEL_USE_MEASUREMENT MVUM on VUM.ID = MVUM.ID;  
  ```

- Création du trigger `TR_VESSEL_USE_MEASUREMENT`
  ```sql
  create or replace trigger TR_VESSEL_USE_MEASUREMENT
     instead of insert or update or delete
     on VESSEL_USE_MEASUREMENT
  begin
    case
          WHEN INSERTING THEN
             -- VESSEL_USE_MEASUREMENT itself
             insert into SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT(ID, NUMERICAL_VALUE, ALPHANUMERICAL_VALUE, DIGIT_COUNT, PRECISION_VALUE, CONTROL_DATE, QUALIFICATION_DATE, QUALIFICATION_COMMENTS, QUALITY_FLAG_FK,
                                                                 DEPARTMENT_FK, PMFM_FK, QUALITATIVE_VALUE_FK, VESSEL_USE_FEATURES_FK)
             select :new.ID, :new.NUMERICAL_VALUE, :new.ALPHANUMERICAL_VALUE, :new.DIGIT_COUNT, :new.PRECISION_VALUE, :new.CONTROL_DATE, :new.QUALIFICATION_DATE, :new.QUALIFICATION_COMMENTS, :new.QUALITY_FLAG_FK,
                                                                 :new.RECORDER_DEPARTMENT_FK, :new.PMFM_FK, :new.QUALITATIVE_VALUE_FK, VUF.ID
             from SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES VUF
             where VUF.OPERATION_FK = :new.OPERATION_FK or VUF.FISHING_TRIP_FK = :new.TRIP_FK or VUF.ID = :new.VESSEL_USE_FEATURES_FK;
             -- M_VESSEL_USE_MEASUREMENT (map columns of VESSEL_USE_MEASUREMENT for sumaris)
             insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.M_VESSEL_USE_MEASUREMENT(ID, RANK_ORDER)
             values (:new.ID, :new.RANK_ORDER);
          WHEN UPDATING THEN
             -- VESSEL_USE_MEASUREMENT itself
             update SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT M set M.NUMERICAL_VALUE=:new.NUMERICAL_VALUE, M.ALPHANUMERICAL_VALUE=:new.ALPHANUMERICAL_VALUE, M.DIGIT_COUNT=:new.DIGIT_COUNT, M.PRECISION_VALUE=:new.PRECISION_VALUE,
                                                                 M.CONTROL_DATE=:new.CONTROL_DATE, M.QUALIFICATION_DATE=:new.QUALIFICATION_DATE, M.QUALIFICATION_COMMENTS=:new.QUALIFICATION_COMMENTS, M.QUALITY_FLAG_FK=:new.QUALITY_FLAG_FK,
                                                                 M.DEPARTMENT_FK=:new.RECORDER_DEPARTMENT_FK, M.PMFM_FK=:new.PMFM_FK, M.QUALITATIVE_VALUE_FK=:new.QUALITATIVE_VALUE_FK
             where M.ID = :new.ID;
             -- M_VESSEL_USE_MEASUREMENT update if row exists
             update M_VESSEL_USE_MEASUREMENT MVUM set MVUM.RANK_ORDER=:new.RANK_ORDER
             where MVUM.ID = :new.ID;
             -- M_VESSEL_USE_MEASUREMENT insert if row not exists
             insert into M_VESSEL_USE_MEASUREMENT (ID, RANK_ORDER)
                          select VUM.ID, :new.RANK_ORDER from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM where VUM.ID = :new.ID and not exists (select * from M_VESSEL_USE_MEASUREMENT MVUM where MVUM.ID = :new.ID);
          WHEN DELETING THEN
             delete from SIH2_ADAGIO_DBA.VESSEL_USE_MEASUREMENT VUM where VUM.ID=:old.ID;
             delete from M_VESSEL_USE_MEASUREMENT MVUM where MVUM.ID=:old.ID;
    end case;
  end;
- ```


- Modification de la vue `VESSEL_USE_MEASUREMENT`
 ```sql
  create or replace view PMFM_STRATEGY2METIER as
    select ID as PMFM_STRATEGY_FK,
           METIER_FK
    from SIH2_ADAGIO_DBA.PMFM_STRATEGY PS
    where METIER_FK is not null;
- ```

- Création du trigger `TR_PMFM_STRATEGY2METIER`
  ```sql
  create or replace trigger TR_PMFM_STRATEGY2METIER
    instead of insert or update or delete
      on PMFM_STRATEGY2METIER
        begin
          case
            WHEN INSERTING or UPDATING THEN
              update SIH2_ADAGIO_DBA.PMFM_STRATEGY PS set PS.METIER_FK = :new.METIER_FK where PS.ID = :new.PMFM_STRATEGY_FK;
            WHEN DELETING THEN
              update SIH2_ADAGIO_DBA.PMFM_STRATEGY PS set PS.METIER_FK = null where PS.ID = :new.PMFM_STRATEGY_FK;
          end case;
        end;
- ```


- Modification de la vue `VESSEL_FEATURES`
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
  VF.IS_FPC,
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
- ```


- Modification du synonyme `M_PROGRAM_SEQ` en `PROGRAM_SEQ`
  ```sql
    create or replace synonym PROGRAM_SEQ for SIH2_ADAGIO_DBA.M_PROGRAM_SEQ;
-```

- Creation du synonyme `VESSEL_USE_FEATURES_SEQ`
  ```sql
    create or replace synonym VESSEL_USE_FEATURES_SEQ FOR SIH2_ADAGIO_DBA.VESSEL_USE_FEATURES_SEQ;
-```

- Ajout de synonymes sur la REGIONALISATION
  ```sql
    create or replace synonym SPATIAL_ITEM_TYPE_SEQ for SIH2_ADAGIO_DBA.SPATIAL_ITEM_TYPE_SEQ;
    create or replace synonym SPATIAL_ITEM_SEQ for SIH2_ADAGIO_DBA.SPATIAL_ITEM_SEQ;
    create or replace synonym SPATIAL_ITEM for SIH2_ADAGIO_DBA.SPATIAL_ITEM;
    create or replace synonym SPATIAL_ITEM2LOCATION for SIH2_ADAGIO_DBA.SPATIAL_ITEM2LOCATION;
    create or replace synonym DENORMALIZED_SPATIAL_ITEM for SIH2_ADAGIO_DBA.DENORMALIZED_SPATIAL_ITEM;
    create or replace synonym EXPERTISE_AREA_SEQ for SIH2_ADAGIO_DBA.EXPERTISE_AREA_SEQ;
    create or replace synonym EXPERTISE_AREA2LOCATION for SIH2_ADAGIO_DBA.EXPERTISE_AREA2LOCATION;
    create or replace synonym EXPERTISE_AREA2LOCATION_LEVEL for SIH2_ADAGIO_DBA.EXPERTISE_AREA2LOCATION_LEVEL;  
-```


- Creation de la table `STRATEGY_PROPERTY`  
  ```sql
  CREATE TABLE "SIH2_ADAGIO_DBA_SUMARIS_MAP"."STRATEGY_PROPERTY" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"LABEL" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
	"CREATION_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"STRATEGY_FK" NUMBER(10,0) NOT NULL ENABLE, 
	"STATUS_FK" VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "STRATEGY_PROPERTY_PK" PRIMARY KEY ("ID"), 
	 CONSTRAINT "STRATEGY_PROPERTY_STRATEGY_FKC" FOREIGN KEY ("STRATEGY_FK")
	  REFERENCES "SIH2_ADAGIO_DBA"."STRATEGY" ("ID") ENABLE
   ) 
  TABLESPACE "SIH2_ADAGIO_DBA_SUMARIS_DATA" ;


  COMMENT ON COLUMN "SIH2_ADAGIO_DBA_SUMARIS_MAP"."STRATEGY_PROPERTY"."ID" IS 'Identifiant';
  COMMENT ON COLUMN "SIH2_ADAGIO_DBA_SUMARIS_MAP"."STRATEGY_PROPERTY"."LABEL" IS 'Mnemonique / code de la propriete';
  COMMENT ON COLUMN "SIH2_ADAGIO_DBA_SUMARIS_MAP"."STRATEGY_PROPERTY"."NAME" IS 'Libelle de la propriete';
  COMMENT ON TABLE "SIH2_ADAGIO_DBA_SUMARIS_MAP"."STRATEGY_PROPERTY"  IS 'Proprietes logicielles sur les strategies. Ces proprietes sont utilisees dans les logiciels afin d avoir un comportement specifique a une strategie.';
-```
