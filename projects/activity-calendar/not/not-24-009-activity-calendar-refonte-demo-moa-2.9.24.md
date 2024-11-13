# Activity Calendar - Demo 6 MOA

## Application

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Extranet user account

---

## 12/11/2024 - Demo

## Calendrier d'activité - Sprint 8 - Issue Board

- **Start date** : 07/10/2024
- **End date** : 01/11/2024
- **Milestone** : **2.9.24**
- **Goal** : Bugs correction, enhancements
- **Status** : Close
- **Deployement** : Done
- **Gitlab issues board** : [2.9.24](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.24)

---

## Fonctionnalités / Limitations

Fonctionnalités de la release **2.9.24**

[Listing des Tickets](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/not/not-24-001-calendrier-refonte-sprints-board.md#calendrier-dactivité---sprint-8---issue-board) 

- Régionalisation _[enh]_ 

- Onglet "Calendriers d'activité" 
  - Ajout de la colonne "Date de modification" _[enh]_
  - Ajout de la colonne "Lieu d'immatriculation" _[enh]_
  - Sauvegarde des filtres _[bug]_

- Predocumentation
  - Visualisation des métiers _[bug]_
  - Source Sacrois-ObsDeb absente _[bug]_

---

- Onglet "Calendrier" 
  - Gestion des droits - Changement de QIM _[bug]_
  - Sélection de cellule décalée _[bug]_
  - Amélioration de l'ergonomie _[enh]_
  - Raccourcis clavier _[enh]_
  - Bordure absente sur décembre _[bug]_
  - Bug blocage de la saisie _[bug]_
  - Affichage des différents observateurs _[enh]_

- Rapports
  - Informations navire manquantes _[bug]_
  - Bugs rapport d'avancement _[bug]_
  - Evolutions formulaire terrain vierge _[enh]_

---

## Limitations de la release **2.9.24**
- [Retours de recette MOE ActiFlot v2.9.24](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/rec/rec-24-005-activity-calendar-refonte-recette-2.9.24.md)

---

## Manuel utilisateur

[Manuel d'aide à la saisie](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/user-manual/user-activity-calendar-manual/user-activity-calendar-manual.md)

- A diffuser / présenter aux utilisateurs pour la recette
  - Réunion à prévoir ?
    - A enrichir pour la formation séminaire SIH
    - Prévoir une génération au format PDF (action MOE)

_MOA : voir avec Johnatan Rault pour appliquer la charte graphique du SIH en markdown_

---

## Recette MOE/MOA du sprint 8 (**2.9.24**)

Navigateur préconisé pour la recette : **Chrome**

- Sumaris-Calendrier d'activité ([SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login))
  - MOA
      - 2 - Import/Export des calendriers vides
      - 3 - Collecte de données
          * 01.01 - Consultation des calendriers
          * 01.02 - Saisie d'un calendrier
          * 01.03 - Saisie d'un calendrier-régionalisation
      - 4 - Formulaires & rapports
          * 02 - Formulaire terrain vierge
          * 03 - Formulaire terrain avec données
          * 04 - Rapport d'avancement

---

## Application client lourd

- [Téléchargement](https://gitlab.ifremer.fr/api/v4/projects/sih-public%2Fsumaris%2Fsumaris-app/packages/generic/sumaris-app/2.9.24.4/sumaris-app-2.9.24.4-windows-x64.exe)

- Démonstration sur ActiFlot

_MOE/MOA : Ne pas communiquer sur la version client lourd pour la V1 (sauf cas particulier pour des utilisateurs)_

---

Recette **MOE** faite les 08,12,13/11/2024. 

Début recette **MOA** le 15/11/2024 (_MOE : Donner le GO_)

---

## Sprint 9 en cours (2.9.25)

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.25)

---

### Notes Réunion

- Présents :
    - Emilie Le Roy (MOA/HISSEO)
    - Vincent Badts (MOA/HISSEO)
    - Johann Le Traon (MOA/HISSEO)
    - Glenn Prigent (MOE/ISI)
    - Caroline Destreez (MOE/CODRA)
    - Jean-Victor Famy (CODRA)
    - Benoit Lavenier (EIS)

---

### Retours de présentation 

- Calendrier 
  - Si le navire est inactif sur toute l'année, le champ "Inactivité annuelle confirmée par l'observateur" doit être obligatoire, peut importe la valeur saisie (Oui ou Non)
  - Il ne faut pas donner la possibilité de valider/qualifier un calendrier avec un mois actif sans métier
  - Désactiver la validation
    - Paramètres Système 
      - _Saisie > Activer le processus qualité ?_ > _Non_
  - Revoir l'ergonomie de saisie du tableau métier
    - En l'état la tableau ne parait pas saisissable

- Régionalisation
  - Garder le fonctionnement actuel mais déplacer l'activation/désactivation de la régionalisation dans les paramètres du saisisseur
  - Paramétrer les niveaux pour chaque zone de compétence
 