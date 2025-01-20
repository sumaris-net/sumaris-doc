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
delete pmfm_strategy where strategy_fk = 2447 and ACQUISITION_LEVEL_FK in ('FISHING_EFFORT_CALENDAR','MONTHLY_FISHING_EFFORT','YEARLY_FISHING_EFFORT')
```
   - Supprimer les PMFMs suivants du niveau d'acquisition "Caractéristiques d'enquête" : 
     - "Validation observateur", "validation société", "validation programme", "Hauteur filet"
     -  Il en reste 6
   - Ajout des min/max sur les PMFMs nombre de jours d'homme et de mer
   - Modifier l'ordre du PMFM "Nombre de jour de pêche" avec la valeur "2" (sinon les 2 pmfm "Nombre de jours de mer" et "Nombre de jours de pêche" sont inversés)

### Déploiement de l'application par RIC

- Backend (Le pod) : [Mantis #66569](https://forge.ifremer.fr/mantis/view.php?id=66569)
- Frontend (L'app) : [Mantis #66570](https://forge.ifremer.fr/mantis/view.php?id=66570)

### Tests de l'application 

Erreurs à l'issue de la MEP :

- Problème d'erreur des upgrade des websockets : 
  - Corrigé au niveau de la configuration du pod [Mantis 66569](https://forge.ifremer.fr/mantis/view.php?id=66569), note 0216247
- Problème d'indexation ElasticSearch : Il manque des entrées dans ES pour les navires
    - Exemple : Navire 104641
        - Validation ES : 14 entrées
        - Exploitation ES : 2 entrées
    - Conséquence : L'importation des calendriers d'activité sur 2025 est partielle
    - En cours d'identification. Désactivation de l'indexation ES en attendant

### REX de la mise en exploitation d'Opus Activité

Difficultés rencontrées : 

- Application des changelogs sur la BDD HARMONIE_VAL
  - Détection de regression sur ObsDeb
    - Conséquence : Moins d'observations affichées pour les utilisateurs 
    - Cause : Modification de la fonction PL-SQL de recalcul des droits 
      - Application d'un changelog SFA sur la BDD HARMONIE
- Détection de problème concurrent de connexion IMAGiNE (intranet) / Opus (extranet)
  - Passage d'IMAGiNE en connexion extranet
- Retard dans la livraison de la dernière release (correction des derniers bugs)
  - Conséquence : RIC à besoin de connaitre les versions à déployer 
  - Causes : 
    - Derniers bugs trouvés à corrigés, 
    - Problème de changelog sur le schéma de mapping présent dans le pod et non appliqué
      - Impact sur la correction de la fonction d'import des calendriers
- Disponibilité des ressources RIC pour faire la MEP applicative
  - Une seule personne avec un empoi du temps très chargé
- Disponibilité des ressources ISI pour faire les tests de non régression 
  - IMAGiNE, Synchronistation Allegro, Allegro
  - Absence côté ISI


Axes d'amélioration :

- Améliorer le processus d'application des changelogs [#703](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/703)
- Prévoir les demandes de MEP côté RIC très en avance
  - Fiche signalétique, Mantis, Mail assistance
- Fixer les release à déployer en production en avance
  - Indispensable pour RIC

Points positifs : 

- 2ème environnement de préproduction pour jouer la MEP (4 fois)
- Tests de non régression pertinent, permettant d'éviter des problèmes en production
  - ObsDeb
  - IMAGiNE
