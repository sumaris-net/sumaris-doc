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



