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
```

## Schéma SIH2_ADAGIO_DBA

- Ajout de droits sur `SIH2_ADAGIO_DBA.person`
  ```sql
  grant REFERENCES on sih2_adagio_dba.person to sih2_adagio_dba_sumaris_map;
  ``` 

- Ajout de droits sur `SIH2_ADAGIO_DBA.department`
  ```sql
  grant REFERENCES on sih2_adagio_dba.department to sih2_adagio_dba_sumaris_map;
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

- grants sur `PROGRAM2PERSON`
  ```sql
  grant SELECT,INSERT,UPDATE,DELETE on SIH2_ADAGIO_DBA.PROGRAM2PERSON to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM_SEQ`
  ```sql
  grant SELECT on SIH2_ADAGIO_DBA.PROGRAM_SEQ to SIH2_ADAGIO_DBA_SUMARIS_MAP;
-```

- grants sur `PROGRAM2LOCATION_CLASSIF`
  ```sql
  grant SELECT,INSERT,DELETE on SIH2_ADAGIO_DBA.PROGRAM2LOCATION_CLASSIF to SIH2_ADAGIO_DBA_SUMARIS_MAP;
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
  );

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

- Modification du synonyme `M_PROGRAM_SEQ` en `PROGRAM_SEQ`
  ```sql
    create or replace synonym PROGRAM_SEQ for SIH2_ADAGIO_DBA.M_PROGRAM_SEQ;
-```