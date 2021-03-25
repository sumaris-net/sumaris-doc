# Première mise en exploitation d'une application utilisant le socle Sumaris
## Mise à jour du schéma SIH2_ADAGIO_DBA
```bash
git clone --branch adagio-sumaris https://gitlab.ifremer.fr/sih/adagio/adagio.git
mvn compile liquibase:update -pl core -Psql -Denv=oracle -Doracle.net.tns_admin=\\brest\tnsnames
```
## Création d'un nouveau schema SIH2_ADAGIO_DBA_SUMARIS_MAP
1. Demande à l'assistance de créer un schéma **SIH2_ADAGIO_DBA_SUMARIS_MAP** sur la base de données HARMONI
E souhaitée. il faut également créer deux tablespaces : **SIH2_SUMARIS_DATA** et **SIH2_SUMARIS_INDEX**.
1. Création entitées du schéma SIH2_ADAGIO_DBA_SUMARIS_MAP via les [scripts associés](https://gitlab.ifremer.fr/sih/adagio/adagio/-/tree/adagio-sumaris/core/src/sql/oracle/sumaris) :
    * vues : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/adagio-sumaris/core/src/sql/oracle/sumaris/create-views.sql
    * triggers : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/adagio-sumaris/core/src/sql/oracle/sumaris/create-triggers.sql
    * synonymes : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/adagio-sumaris/core/src/sql/oracle/sumaris/create-synonyms.sql
    * tables : https://gitlab.ifremer.fr/sih/adagio/adagio/-/blob/adagio-sumaris/core/src/sql/oracle/sumaris/create-tables.sql


# Première mise en exploitation du volet Imagine
## Création de nouveaux objets en base de données
Demander au guichet d'exploitation Harmonie de créer les objets suivant en base de données : 
```sql
insert into PROGRAM (CODE,NAME,DESCRIPTION,STATUS_FK,GEAR_CLASSIFICATION_FK,TAXON_GROUP_TYPE_FK) values ('SIH-PARAM-BIO','Programme d observation des paramètres biologiques','Programme d observation des paramètres biologiques',1,2);
insert into PROGRAM2LOCATION_CLASSIF (PROGRAM_FK,LOCATION_CLASSIFICATION_FK) values ('SIH-PARAM-BIO',2);

insert into PARAMETER (CODE,NAME,IS_QUALITATIVE,IS_TAXINOMIC,IS_CALCULATED,IS_ALPHANUMERIC,PARAMETER_GROUP_FK,STATUS_FK,CREATION_DATE) values ('MORSE_CODE','Code Morse',0,0,0,1,1,1,sysdate);
insert into PARAMETER (CODE,NAME,IS_QUALITATIVE,IS_TAXINOMIC,IS_CALCULATED,IS_ALPHANUMERIC,PARAMETER_GROUP_FK,STATUS_FK,CREATION_DATE) values ('STRATEGY_LABEL','Stratégie',0,0,0,1,1,1,sysdate);

insert into PMFM (PARAMETER_FK,LABEL,MATRIX_FK,FRACTION_FK,METHOD_FK,UNIT_FK,AGGREGATION_LEVEL_FK,STATUS_FK,CREATION_DATE) values ('MORSE_CODE','MORSE_CODE',21,1,3,4,1,1,sysdate);
insert into PMFM (PARAMETER_FK,LABEL,MATRIX_FK,FRACTION_FK,METHOD_FK,UNIT_FK,AGGREGATION_LEVEL_FK,STATUS_FK,CREATION_DATE) values ('STRATEGY_LABEL','STRATEGY_LABEL',21,1,3,4,1,1,sysdate);
```

## Configuration du serveur
Definition des configurations serveur via l'IHM du client web (menu **configuration serveur** accessible en tant qu'administrateur). C'est ici que l'on peut définir les images de fonds, logos, surcharge des enumérations.

NB : Il faudra dans tous les cas surcharger PMFM créer ci-dessus pour prendre en compte les bon ids dans la base Oracle.
