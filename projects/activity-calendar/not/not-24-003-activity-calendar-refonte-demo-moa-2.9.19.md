# Activity Calendar - Demo 2 MOA

## Application 

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Intranet user account

---

## 09/07/2024 - Demo 2

### Activity Calendar - Sprint 3 - Issues Board

- **Sprint** : 3
- **Start date** : 27/05/2024
- **End date** : 21/06/2024
- **Milestone** : **2.9.19.2**
- **Status** : Closed
- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.19)

---

### Fonctionnalités / Limitations

Fonctionnalités du sprint 3
- Saisie des gradients
- Onglet calendrier : 
  - Copier/Coller depuis/vers une cellule
  - Notifier l'utilisateur lors de l'ajout d'un doublon de métier
  - Afficher le nom des armateurs dans le calendrier d'activités (_à confirmer_)
- Création du filtre pour le composant photo historique
- Prise en compte des anomalies/remarques recette MOE du sprint 2
- Prise en compte des anomalies/remarques recette MOA du sprint 2
- Recette MOE sprint 3

---

Limitations du sprint 3 
- [Retours de recette ActiFlot v2.9.19](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/633)
- [Retours de recette volets communs v2.9.19](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/631)

---

### Recette MOE/MOA du sprint 3 

Navigateur préconisé pour la recette : 
- **Chrome**

Des bugs ont été trouvés sur FireFox mais pas sur Chrome [#631](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/631)

- Sumaris-Calendrier d'activité ([SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login))
  - 03 Collecte de données
     * 01.01 - Consultation des calendriers
     * 01.02 - Saisie d'un calendrier
  - 05 Restitution des données
     * 02 - Formulaire terrain avec données

Début recette MOA Le 10/07/2024

---

### Demonstration du contenu du sprint 3 d'ActiFlot

---

### Sprint 4 en cours (2.9.20)

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.20)
- Démonstration - [environnement de développement](https://obsmer.sumaris.net)
- Tickets à prioriser (MOA)

Pas de démonstration MOA sur le sprint 4 (congés ELR)

---

### Sprint 5 (2.9.21 - à venir)

Démonstration semaine 34 (jour à planifier)
- Le mardi 20/08/2024 de 15h00 à 17h00 (semaine 34)
- Présenté par Caroline Destreez, assistée de Morgan Facorat (CODRA) et Maxime Demarest (EIS) 
- Vincent Fachéro et Benoit Lavenier seront en congés
---

### Notes Réunion

- Présents :
  - Emilie Le Roy (MOA/HISSEO)
  - Vincent Badts (MOA/HISSEO)
  - Vincent Fachéro (MOE/ISI)
  - Caroline Destreez (MOE/CODRA)
  - Morgan Facorat (CODRA)
  - Benoit Lavenier (EIS)

---

Rajouter le PMFM pour avoir la qualification de l'enquête dans les rapports.

Métiers qui n'ont pas d'engin (Ex : transport de passagers, aquaculture, ...) : 
- Oui, ça a du sens de mettre un métier qui n'a pas d'engin 
- Mettre une zone quand même
- Dans l'onglet métier, il ne s'affiche pas et il n'y a pas de caractéristiques à saisir donc

Replier tous les métiers à la sauvegarde : Oui

Si le calendrier est vide on déplie jusqu'au gradient, zone, ...

Si le caldendrier à de la données, on replie les métiers.

Ligne zone de pêche grisée (gris plus clair que la ligne métier).

Message sur incohérence Enquête directe et qualification :
- "Qualification estimation incohérente avec l'objectif"

Objectif d'enquête directe à passer en read only (police noire et non grisée).

Import du fichier : 
- Fonction d'import pour importer le fichier pour créer les calendriers pour les administrateurs (pas pour les saisisseurs).

Colonne de programme masquée pour les saisisseurs (car un seul programme). Pas maqusée pour les administrateurs.

Filtre sur les calendriers : 
- Supprimer le programme
- Supprimer l'année

Prédocumentation
- 2 sources : Enquête N-1 et SACROIS
  - Pouvoir de copier d'une des 2 sources vers le calendrier (une icone pour un seul copier/coller)
  - Le bouton copier/coller n'est actif que lorsqu'il n'y a qu'une seule source d'affichée


