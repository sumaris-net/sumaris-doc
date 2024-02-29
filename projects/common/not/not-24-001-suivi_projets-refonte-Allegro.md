# Refonte Allegro - ObsMer / ObsVente / Calendrier d'activité

> Rédacteurs :
> - Vincent FACHERO - VFA - (IFREMER)
> - Glenn PRIGENT - GPR - (IFREMER)
> - Caroline DESTREEZ - CDE - (CODRA)

## Objectifs 

La refonte Allegro porte sur le développement des volets Obsmer, Obsvente et Calendrier d’Activité en se basant sur le socle Sumaris développé par la société EIS.
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
  - ObsVente : rédaction VFA, CDE

---
### Planning des développements

![ui-planning](/projects/common/not/images/planning.png)

2 chantiers en parallèle : 
- Obsmer à partir de mars
- Obsvente à partir de mars
- Calendrier d’activité date de démarrage à confirmer en fonction des avancées des autres chantiers

Difficulté à estimer la durée des chantiers

---
### Démarrage des développements

> :information_source:
> Début des développements CODRA - Semaine N°10 (04/03/2024)

- 2 Journées de présentation Refonte Allegro (04-05/03/2024)

  - 04/03/2024 - ISI / CODRA / EIS - Spécifications
    - Présentation du contexte ObsMer/ObsVente
      - Formulaires terrains, Manuel Observateur, Videos de présentation du métier d'observateur (déposer sur gitlab)
      - Version Allegro Actuellement utilisée (démo, documentations)
        - ObsMer
        - ObsVente
    - Présentation des spécifications aux développeurs de CODRA (ISI/CODRA)
      - ObsVente : Développement par CODRA, support EIS
        - Revue fonctionnelle MOA le 29/02/2023, 12/03/2023
      - ObsMer : Développement EIS (dans un premier temps)
    - Rédaction/Présentation des tickets ObsVente (re-use Imagine)
      - Ticket 1 : OBSVENTE/SORTIE/DETAILS
      - Ticket 2 : OBSVENTE/SORTIE/VENTE/DETAILS
      - Ticket 3 : OBSVENTE/SORTIES
      - Ticket 4 : OBSVENTE/SORTIE/VENTES

  - 05/03/2024 - ISI / CODRA / EIS
    - Présentation de l'architecture de Sumaris 
    - Présentation du socle technique de Sumaris
    - Présentation du scole technique ObsVente, ObsMer
    - Présentation de l'environnement de développement, tests unitaires, ... 
    - Présentation des best practices
      - Re-use
      - Performances
      - ...

> :warning:
> Planifier la migration Imagine vers Angular 17 (Semaine N° ?). Point EIS sur la migration.

> Information : Benoit (EIS) : Absent la semaine N°11 (du 11/03/2024 au 15/03/2024)

## Organisation des développements

EIS continue d’avancer sur le chantier OBSMER.

CODRA intervient avec 2 intervenants à partir du 04/03/2023 sur le chantier OBSVENTE (les écrans ressemblent à ceux d’Imagine).

EIS avance sur le maquettage des écrans de calendriers d’activités pour ensuite pouvoir faire la réalisation par CODRA.

- Développement sur base de sprints de 3 semaines
- Daily à positionner
- Réunion à bloquer en amont avec les acteurs notamment les démonstrations
  - Avancement : Inclure ISI, Développeurs et HISSEO (MOA)

> :information_source:
Les 2 premiers sprints sur ObsVentes devront aboutir à la réalisation d'un prototype de l'ensemble des écrans
afin de faire une démonstration aux utilisateurs de métropole et desDOM, sur la saisie PC et tablette. 

---
## Support de spécifications

A confirmer ISI/EIS

- Rédaction des spécifications générales dans gitlab (markdown/PlantUml)
  - En cours (ISI/CODRA)
- Rédaction des spécifications détaillées/techniques dans gitlab (markdown/PlantUml)
- Création des tickets d'évolutions dans gitlab (utilisation de labels ?)
  - Cloisonnement des tickets par application
- Création des tickets d'anomalies dans gitlab (utilisation de labels ?)
  - Cloisonnement des tickets par application
- Gestion du board dans gitlab

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

|       Date | Auteur | Sections mises à jour                  |
|-----------:|--------|----------------------------------------|
| 06/02/2024 | VFA    | Création                               |
| 28/02/2024 | VFA    | Prise en compte du point du 22/02/2024 |
