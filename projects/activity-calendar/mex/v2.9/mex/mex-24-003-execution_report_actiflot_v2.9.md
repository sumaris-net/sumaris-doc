# Rapport d'exécution de la mise exploitation des calendrier d'activité v2.9

- BDD cible : Nouvelle préproduction
  - Instance : PP_HARMONIE
  - Copie de la MEP du 19/12/2024

Mode opératoire
1. Exécuter le changelog 4.3.2 sur PP_HARMONIE
```
 Update a Adagio database :
  - Edit 'conf/adagio-core-server.config' to configure Oracle connexion
  - Launch "adagio-core-server.bat --schema-update"
  - Verify database version in table SYSTEM_VERSION
```
 - Status : OK

2. Exécution des scripts SQL d'alimentation sur PP_HARMONIE
   - Régionalisation 
     - Script EXPERTISE_AREA.sql
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
   
6. Application des modifications communes sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
   - MEX commmon à appliquer  
   - Status : OK
   
7. Application des modifications ActiFlot sur les schémas SIH2_ADAGIO_DBA et SIH2_ADAGIO_DBA_SUMARIS_MAP
    - MEX ActiFlot à appliquer   
   - Status : 
   
8. Fichier de configuration
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
9. Déclaration de l'application dans isival
   - opus-app-activite
     - deploy_docker_val2 
   - opus-pod-activite
     - deploy_docker_val2
10. Paramétrage de la stratégie
   - Duplication de la dernière stratégie
   - Nettoyage des niveaux d'acquisition de la nouvelle stratégie (identifiant de la stratégie à renseigner)
```
delete pmfm_strategy where strategy_fk = 2364 and ACQUISITION_LEVEL_FK in ('FISHING_EFFORT_CALENDAR','MONTHLY_FISHING_EFFORT','YEARLY_FISHING_EFFORT')
```
  - Ajout des min/max sur les PMFMs nombre de jours d'homme et de mer


### Tests de l'application 

- [X Erreur au démarrage du pod
```
 Dec 02 17:03:56 visi-docker-val2 dockersvc_opus-pod[28717]: org.springframework.dao.DataRetrievalFailureException: Software with label 'sumaris' not found
```

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

- [X] Erreur de sauvegarde de stratégie
```
select properties0_.strategy_fk as strategy_fk7_135_0_, properties0_.id as id1_135_0_, properties0_.id as id1_135_1_, properties0_.creation_date as creation_date2_135_1_, properties0_.label as label3_135_1_, properties0_.name as name4_135_1_, properties0_.status_fk as status_fk6_135_1_, properties0_.strategy_fk as strategy_fk7_135_1_, properties0_.update_date as update_date5_135_1_ from SIH2_ADAGIO_DBA_SUMARIS_MAP.strategy_property properties0_ where properties0_.strategy_fk=?
Dec 02 17:41:10 visi-docker-val2 dockersvc_opus-pod[8867]: 2024-12-02 17:41:10,012 WARN  [http-nio-8080-exec-3] o.h.engine.jdbc.spi.SqlExceptionHelper     : SQL Error: 980, SQLState: 42000
Dec 02 17:41:10 visi-docker-val2 dockersvc_opus-pod[8867]: 2024-12-02 17:41:10,012 ERROR [http-nio-8080-exec-3] o.h.engine.jdbc.spi.SqlExceptionHelper     : ORA-00980: la traduction de synonymes n'est plus valide
```

Correction - Ajout la table strategy_property dans SIH2_ADAGIO_DBA_SUMARIS_MAP


- [ ] Problème de suppression des niveaux d'acquisition (Calendrier d'effort) 