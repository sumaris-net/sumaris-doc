# Rapport d'exécution de la mise exploitation des calendrier d'activité v2.9

- BDD cible : Nouvelle préproduction
  - Instance : PP_HARMONIE
  - Copie de la MEP du 19/12/2024

Mode opératoire
1. Exécuter le changelog 4.3.2 sur PP_HARMONIE

!!! Pré-requis : Supprimer tous les changelogs liée à la BDD SFA (Indispensable)
```
 Update a Adagio database :
  - Edit 'conf/adagio-core-server.config' to configure Oracle connexion
  - Launch "adagio-core-server.bat --schema-update"
  - Verify database version in table SYSTEM_VERSION
```
 - Status : OK

2. Exécution des scripts SQL d'alimentation sur PP_HARMONIE
   - Régionalisation 
     - Script [EXPERTISE_AREA.sql](/projects/activity-calendar/mex/v2.9/sql/EXPERTISE_AREA.sql)
     - Status : OK
   - Alimentation historisation des observateurs
     - Script [ACTIVITY_CALENDAR2PERSON_POPULATE.sql](/projects/activity-calendar/mex/v2.9/sql/ACTIVITY_CALENDAR2PERSON_POPULATE.sql)
     - Status : OK (192 339 lignes inséré) 
3. Déclaration de l'application Opus en BDD
   - Script [SOFTWARE.sql](/projects/activity-calendar/mex/v2.9/sql/SOFTWARE.sql)
   - Status : OK
4. Déclaration des propriétés de l'application Opus en BDD   
   - Script [SOFTWARE_PROPERTY.sql](/projects/activity-calendar/mex/v2.9/sql/SOFTWARE_PROPERTY.sql)
   - Status : OK
5. Paramétrage du programme
    - Script [PROGRAM_PROPERTY.sql](/projects/activity-calendar/mex/v2.9/sql/PROGRAM_PROPERTY.sql)
6. Modification de la structure de la table USER_EVENT
    - Script [USER_EVENT_MODIFICATION.sql](/projects/activity-calendar/mex/v2.9/sql/USER_EVENT_MODIFICATION.sql)
   
7. Application des modifications communes sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
   - MEX commmon à appliquer  
   - Status : OK
   
8. Application des modifications ActiFlot sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
    - MEX ActiFlot à appliquer   
   - Status : OK
   
9. Fichier de configuration
    - `application-valOpusActivite.properties`
        - Configuration à la BDD
           ```
               spring.datasource.url=jdbc:oracle:thin:@PP_HARMONIE
               spring.datasource.platform=oracle
               spring.datasource.username=SIH2_ADAGIO_DBA_SUMARIS_MAP
               spring.datasource.password=
           ```
    - Nom de l'application
        ```    
            sumaris.name=OpusActivite
        ```
    - Status : 
10. Déclaration de l'application dans isival
   - opus-app-activite
     - deploy_docker_val2 
   - opus-pod-activite
     - deploy_docker_val2
11. Paramétrage de la stratégie
   - Duplication de la dernière stratégie (Sur opus-activite)
   - Nettoyage des niveaux d'acquisition de la nouvelle stratégie (identifiant de la stratégie à renseigner)
     - Sur SIH2_ADAGIO_DBA
```
delete pmfm_strategy where strategy_fk = 2445 and ACQUISITION_LEVEL_FK in ('FISHING_EFFORT_CALENDAR','MONTHLY_FISHING_EFFORT','YEARLY_FISHING_EFFORT')
```
   - Supprimer les PMFMs suivants du niveau d'acquisition "Caractéristiques d'enquête" : 
     - "Validation observateur", "validation société", "validation programme", "Hauteur filet"
     -  Il en reste 6
   - Ajout des min/max sur les PMFMs nombre de jours d'homme et de mer
   - Modifier l'ordre du PMFM "Nombre de jour de pêche" avec la valeur "2" (sinon les 2 pmfm "Nombre de jours de mer" et "Nombre de jours de pêche" sont inversés)


### Tests de l'application 

Correction - Ajout de la variable d'environnement APP_NAME au run de l'image docker
- Configuration isival
```
    docker_extra_opts: |-
      -e LOG_FILENAME=opus-activity-calendar-pod.log \
      -e APP_NAME=OPUS \
      -e PROFILES=valOpus \
      -e PORT=8080 \
      -e TZ=Europe/Paris \
```