# Activity Calendar - Demo 7 MOA

---

## Application

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Extranet user account

---

![rec-activity-calendar-planning](/projects/activity-calendar/not/images/refonte-activity-calendar-planning-sprints.svg)

---

## 28/11/2024 - Demo

## Calendrier d'activité - Sprint 9 - Issue Board

- **Start date** : 04/11/2024
- **End date** : 22/11/2024
- **Milestone** : **2.9.25.3**
- **Goal** : Bugs correction, enhancements
- **Status** : Close
- **Deployement** : Done
- **Gitlab issues board** : [2.9.25](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.25)

---

## Fonctionnalités / Limitations

Fonctionnalités de la release **2.9.25**

[Listing des Tickets](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/not/not-24-001-calendrier-refonte-sprints-board.md#calendrier-dactivité---sprint-9---issue-board) 

---

- Compléments régionalisation
  - Niveau de lieu par zone de compétence
  - Option en 1er dans la liste
  - Zone de pêche

---

- Calendrier
  - Terminer la saisie
  - Validation
  - Bouton dépliage/repliage
  - Désactivation clic droit sur saisie cellule
  - Compactage par défaut activé
  - Figer les entêtes des colonnes

---

- Accès coordinateur de programme

- Mode hors ligne désactivé

- Rapports
  - Correction de style
  - Bugs et évolutions sur les formulaires vierges, données et avancement

---

## Limitations de la release **2.9.25**
- [Retours de recette MOE ActiFlot v2.9.25](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/rec/rec-24-006-activity-calendar-refonte-recette-2.9.25.md)

---

## Manuel utilisateur

[Manuel d'aide à la saisie](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/user-manual/user-activity-calendar-manual/user-activity-calendar-manual.md)

---

## Recette MOE/MOA du sprint 9 (**2.9.25**)

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

- [Téléchargement](https://gitlab.ifremer.fr/api/v4/projects/sih-public%2Fsumaris%2Fsumaris-app/packages/generic/sumaris-app/2.9.25.3/sumaris-app-2.9.25.3-windows-x64.exe)

_MOE/MOA : Ne pas communiquer sur la version client lourd pour la V1 (sauf cas particulier pour des utilisateurs)_

---

Recette **MOE** faite les 25,26,27/11/2024. 

Début recette **MOA** le ?/11/2024 (_MOE : Donner le GO_)

---

## Anomalies restantes sur la release 2.9.25

Livraison d'ActiFLot avec des bugs identifiés 

[2.9.25 bugs](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/mex/mex-24-002-issues-report-2.9.md)

A arbitrer avec la MOA pour la version 1.0 en production et opérationnelle en Janvier 2025

---

### Notes Réunion

- Présents :
    - Emilie Le Roy (MOA/HISSEO)
    - Charlène Spagnol (MOA/HISSEO)
    - Caroline Destreez (MOE/CODRA)
    - Benoit Lavenier (EIS)

---

### Retours de présentation 

Icone activité sur les 2 formulaires terrain et rapport avancement  [#827](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/827)

En mode observateur, il faut enlever la possibilité de désactiver la régionalisation : 
- _MOE_ : A remonter à Emilie - Un observateur ne peut pas désactiver le régionalisation. Mais un super utilisateur oui (superviseur).
- _MOE_ : A remonter à Emilie - L'évolution sur l'application de la régionalisation dans le filtrage (Lieu et port) va être disponible dans la prochaine version. 

_MOE_ : A remonter à Emilie - Filtrage sur le navire : Faut il afficher le dernier nom du navire dans le filtre ou afficher le nom de l'année filtrée ?
- Exemple capture d'écran [#639](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/639)
- Spatialisation temporelle du filtrage sur les navires

Ajout des niveaux sur les zones de compétences : attente liste par la MOA

Gradients de profondeur pas régionalisé (validé MOA)

Enlever le filtre sur le saisisseur (plus utile car saisisseur=observateur) ([#846](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/846)
Issue [#746](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/746) clos

Faire un test de connexions simultanées le lundi 02/12/2024 à 15h00

- Planning 
  - Recette MOA : lundi 02/12 après-midi ou mercredi 04/12
  - Consigne saisisseurs pour test de connexion : mardi 03/12 matin