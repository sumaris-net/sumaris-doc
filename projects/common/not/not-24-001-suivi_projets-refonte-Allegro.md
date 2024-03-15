# Refonte Allegro 
# (ObsMer / ObsVentes / Calendrier d'activité)

> Rédacteurs :
> - Vincent FACHERO - VFA - (IFREMER)
> - Glenn PRIGENT - GPR - (IFREMER)
> - Caroline DESTREEZ - CDE - (CODRA)

---

## Objectifs 

La refonte Allegro porte sur le développement des volets Obsmer, Obsventes et Calendrier d’Activité en se basant sur le socle Sumaris développé par la société EIS.
Par la suite d’autres outils ont vocation à intégrer ce socle applicatif :
- Administration des référentiels
- WAO (Planification des observations obsmer/obsventes)
- Outils sociaux-économiques (Festif/Carburant)
- Formulaire d’extraction web
- Nouvelle console Recopesca
- Suivi des blocs-coupes

---
## Calendrier 

### Planning des spécifications

- Janvier/Février/Mars
  - ObsMer : rédaction VFA, relecture CDE
  - Calendrier d'activité : rédaction CDE, Relecture VFA
  - ObsVentes : rédaction VFA, CDE

---

### Planning des développements

![ui-planning](/projects/common/not/images/planning.png)

2 chantiers en parallèle : 
- Obsmer à partir de mars
- Obsventes à partir de mars
- Calendrier d’activité date de démarrage à confirmer en fonction des avancées des autres chantiers

Difficulté à estimer la durée des chantiers

---
### Démarrage des développements

> :information_source:
> Début des développements CODRA - Semaine N°10 (04/03/2024)

- Journées de présentation Refonte Allegro (04-05-06/03/2024)
  - 04/03/2024 - ISI / CODRA / EIS - Spécifications
    - Présentation du contexte ObsMer/ObsVentes
      - Formulaires terrains, Manuel Observateur, Videos de présentation du métier d'observateur (déposer sur gitlab)
      - Version Allegro Actuellement utilisée (démo, documentations)
        - ObsMer
        - ObsVentes
---
    - Présentation des spécifications aux développeurs de CODRA (ISI/CODRA)
      - ObsVentes : Développement par CODRA, support EIS
        - Revue fonctionnelle MOA le 29/02/2023, 12/03/2023
      - ObsMer : Développement EIS (dans un premier temps)
        - Montée en compétence de CODRA        
    - Rédaction/Présentation des premiers tickets ObsVentes (re-use Imagine)
      - Ticket 1 : OBSVENTES/SORTIE/DETAILS
      - Ticket 2 : OBSVENTES/SORTIE/VENTE

---
  - 05-06/03/2024 - ISI / CODRA / EIS
    - Présentation de l'architecture de Sumaris 
    - Présentation du socle technique de Sumaris
    - Présentation du socle technique ObsVents, ObsMer
    - Présentation de l'environnement de développement (IDE, outils, ...)
    - Présentation des best practices
      - Re-use, performances, ...


> :warning:
> Planifier la migration Imagine vers Angular 17 (Semaine N° ?). Point EIS sur la migration.

> Information : Benoit (EIS) : Absent la semaine N°11 (du 11/03/2024 au 15/03/2024)

---
## Organisation des développements

EIS continue d’avancer sur le chantier OBSMER (avec une montée en compétence d'un intervenant de CODRA).

CODRA intervient avec 2 intervenants à partir du 04/03/2023 sur le chantier ObsVentes (les écrans ressemblent à ceux d’Imagine).

EIS avance sur le maquettage des écrans de calendriers d’activités pour ensuite pouvoir faire la réalisation par CODRA.

- Développement sur base de sprints de 3 semaines
  - Des points d'avancement / présentation seront réaliser avec la MOA
- Daily à positionner
- Réunion à bloquer en amont avec les acteurs notamment les démonstrations (Inclure ISI, Développeurs et HISSEO (MOA))

---
> :information_source:
> 
> Les 2 premiers sprints sur ObsVentes devront aboutir à la réalisation d'un prototype dans le but de faire une démonstration 
aux utilisateurs de métropole et des DOM (saisie PC et tablette).

---

Démarrage des développements : Découpage ObsVentes (CODRA)

- 1 intervenant CODRA sur l'édition des sorties -> 1 ticket -> 1 branche (feature) (Jean-Victor)

- 1 intervenant CODRA sur le tableau des espèces -> 1 ticket -> 1 branche (feature) (Morgan)

Mise à jour de la BDD côté développement (HSQL / PostGres / Oracle) :
- Doublonné avec EIS (Benoit) et CODRA (Jean-Victor)
- Jean-Victor est le référent technique

Mise à jour à l'Ifremer du schéma SIH2_ADAGIO_SUMARIS_MAP : 
- A Doublonner avec ISI (Vincent) et CODRA (Caroline)

---
## Organisation des livrables

La livraison d'une version se fera sur la branche develop (après les merge request).

Avec la CI, le merge sur la branche develop build une release, contenant les livrables de l'application pour la version :
- Version Web
- Version Windows (autonome)
- Version Linux (autonome)
- Version Android (autonome)

La release listera les tickets associés à la version.

---
## Nommage des applications

Le nom du socle applicatif sera désormais Sumaris (actuellement Allegro).

Les applications seront ainsi nommées :
- Sumaris ObsMer
- Sumaris ObsVentes
- Sumaris Calendrier d'activité
- Sumaris Imagine



---
## Organisation des réunions

- Daily meeting
  - Participants : ISI/CODRA/EIS
  - Fréquence : Quotidienne

- Fin de sprints
  - Participants : ISI/CODRA/EIS/MOA
  - Fréquence : Toutes les 3 semaines  

---

- Revue de spécifications 
  - Participants : ISI/CODRA/EIS/MOA
  - Fréquence : Hebdomadaire actuellement (à espacer par la suite)

- Démonstration aux utilisateurs 
  - Participants : ISI/CODRA/EIS/MOA/Observateurs, saisisseurs/Administrateurs
  - Fréquence : A positionner selon l'avancement

---
## Support de spécifications

- Rédaction des spécifications générales dans gitlab (markdown/PlantUml)
  - En cours (ISI/CODRA)
- Rédaction des spécifications détaillées/techniques dans gitlab (markdown/PlantUml)
  - TODO (ISI/CODRA/EIS)
- Création des tickets d'évolutions dans gitlab
  - Cloisonnement des tickets par milestone (jalon de version)
- Création des tickets d'anomalies dans gitlab (jalon de version)
  - Cloisonnement des tickets par milestone
- Gestion du board dans gitlab par milestone

---
## Gestion des tickets

Les tickets seront créés dans gitlab issues.

Les tickets associés à un sprint seront regroupés par jalon (milestone).

Un sprint (voir plusieurs sprints) correspondra à un milestone. La version, unique, sera incrémentée à chaque milestone.

Le milestone sera terminé lorsque toutes les issues liées à ce dernier seront à l'état "closed".

Les manuels d'exploitation doivent être généralisés aux applications :
- Les mex doivent lister les modifications du schéma sur la livraison d'une version majeur (2.9 par exemple) pour ObsMer / ObsVentes / Calendrier d'activité

---

> :information_source: 
> 
> Mettre en place une notification dans mattermost (canal issues de HAMONIE_MCO) pour être alerté de la mise à jour des tickets


---
La vue "Issue boards" de gitlab sera utilisée pour suivre les différents états des tickets :

- Open (affecter un milestone)
- To Do (milestone + affectation développeur)
- Doing (milestone obligatoire)
- Done (milestone obligatoire)
- Testing (milestone obligatoire)
- Closed (milestone obligatoire)


---
Des labels seront assignés au ticket afin de les regrouper par thématique (OBSMER, OBSVENTES, CALENDRIER, COMMON, ...). 

Les tickets des évolutions et des bugs seront discriminés par les étiquettes "enhancement" (améliorations) et "bug".

Pour information, les commit seront préfixés de la façon suivante :
- Tickets enhancement : enh(_thématique_), Exemple enh(trips)
- Tickets bug : fix(_thématique_), Exemple fix(operation)

---
Après les daily, une revue des tickets sera réalisée entre ISI/CODRA/EIS afin de s'assurer que le développeur parte dans la bonne direction.

Le développeur exprimera sa compréhension du besoin et la façon dont voit l'implémentation dans le logiciel.

EIS, qui a la maitrise du scole technique et de la conception, validera l'implémentation et réalisera si besoin un découpage plus fin
des éléments à développer.

---
## Mise en place des sprints

Premier daily le 08/03/2024 à 10h30.

Premier sprint de définit : 
- Milestone : 2.9.0-alpha15
- Période :
  - Début : 08/03/2024
  - Fin : 29/03/2024

Planification des issues :
- Issues non planifiées dans un sprint
  - A mettre dans le 2.9.0 (stable)
- Issue planifiées
  - A mettre dans un sprint (milestone 2.9.0-aplhaXX)

---
Board du premier sprint 

Board utilisé "Project Management" :

https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?milestone_title=2.9.0-alpha15

![ui-board-sprint-1](/projects/common/not/images/issues-board-sprint-1.png)


---
## Support cibles des outils de saisie

- ObsVentes : En mode tablette et PC
  - La saisie sur tablette est importante
  
- ObsMer : Saisie sur PC priotiaire

---
## Point contractuel

- Signature du DC4
- Commande de plusieurs sprints

---
## Historique

|       Date | Auteur | Sections mises à jour                              |
|-----------:|--------|----------------------------------------------------|
| 06/02/2024 | VFA    | Création                                           |
| 28/02/2024 | VFA    | Prise en compte du point du 22/02/2024             |
| 01/03/2024 | VFA    | Prise en compte du point avec CODRA du 01/03/2024  |
| 08/03/2024 | VFA    | MAJ gestion tickets/sprints du daily du 08/03/2024 |