# Rapport d'exécution de la mise exploitation des calendrier d'activité v2.9

- BDD cible : Nouvelle préproduction
  - Instance : PP_HARMONIE
  - Copie de la MEP du 11/2024

Mode opératoire
1. Exécuter le changelog 4.3.2 sur PP_HARMONIE
 - Status : OK
2. Exécution des scripts SQL d'alimentation sur PP_HARMONIE
 - Alimentation de la régionalisation (attente liste MOA modifiée)
   - Status : OK
 - Alimentation historisation des observateurs
   - Status : OK
3. Fichier de configuration
   - application-valOpus.properties
     - Configuration à la BDD
        ```
            spring.datasource.url=jdbc:oracle:thin:@PP_HARMONIE
            spring.datasource.platform=oracle
            spring.datasource.username=SIH2_ADAGIO_DBA_SUMARIS_MAP
            spring.datasource.password=
        ```
    - Nom de l'application
        ```    
            sumaris.name=Opus
        ```
    - Status : OK  
4. Déclaration de l'application Opus en BDD
   - Schéma SIH2_ADAGIO_DBA
   ```sql
       insert into SOFTWARE (ID, LABEL, NAME, STATUS_FK, CREATION_DATE, DESCRIPTION) VALUES (SOFTWARE_SEQ.nextval, 'opus','Opus - Activité',1, sysdate, 'Application Opus - Activité');
   ```    
   - Status : OK
5. Déclaration des propriétés de l'application Opus en BDD   
   - Script SOFTWARE_PROPERTY.sql
   - Status : OK
6. Application des modifications communes sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
   - MEX commmon à appliquer  
   - Status : OK
7. Application des modifications ActiFlot sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
    - MEX ActiFlot à appliquer   
   - Status : OK
8. Déclaration de l'application dans isival
   - opus-app
   - opus-pod