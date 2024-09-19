# Activity Calendar - Demo 4 MOA

## Application

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Intranet user account

---

## 19/09/2024 - Demo 

## Calendrier d'activité - Sprint 5 - Issue Board

- **Start date** : 22/07/2024
- **End date** : 16/08/2024
- **Milestone** : **2.9.21**
- **Goal** : Bugs correction, enhancements
- **Status** : Close
- **Deployement** : Done
- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.21)

---

### Fonctionnalités / Limitations

Fonctionnalités de la release **2.9.21**
- Formulaire terrain vierge
- Contrôle de fin de saisie
- Cohérence des données affichées
- Bugs :
  - Impossibilité de consulter un calendrier historique, Copier/Coller, Navires : Problème de pagination
- Fonctionnalité d'import
- Rapport d'édition : Informations navires, Ajout de l'armateur
- Enregistrement des filtres
- Déplier les colonnes lors de sélection multiple
- Masquer le bouton création
---

Limitations de la release **2.9.21**
- [Retours de recette ActiFlot v2.9.21](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/rec/rec-24-003-activity-calendar-refonte-recette-2.9.21.md)

---

## Calendrier d'activité - Sprint 6 - Issue Board

- **Start date** : 19/08/2024
- **End date** : 13/09/2024
- **Milestone** : **2.9.22**
- **Goal** : Bugs correction, enhancements
- **Status** : Close
- **Deployement** : Done
- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.22)

---

### Fonctionnalités / Limitations

Fonctionnalités de la release **2.9.22**
- Filtre : Correction de Bugs
- Copier/coller de lignes et de colonnes
- Saisie par la touche entrée
- Déplacement : Flèche de navigation (avec touche Ctrl)
---

Limitations de la release **2.9.22**
- [Retours de recette ActiFlot v2.9.22](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/rec/rec-24-003-activity-calendar-refonte-recette-2.9.21.md)

---

### Recette MOE/MOA du sprint 5 (**2.9.21**) et 6 (**2.9.22**)

Navigateur préconisé pour la recette : **Chrome**

- Sumaris-Calendrier d'activité ([SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login))
  - 2 - Import/Export des calendriers vides 
  - 3 - Collecte de données
    * 01.01 - Consultation des calendriers
    * 01.02 - Saisie d'un calendrier
  - 4 - Formulaires & rapports
    * 02 - Formulaire terrain vierge
    * 03 - Formulaire terrain avec données

Recette **MOE** faite le 17/09/2024. Début recette **MOA** le 25/09/2024.

Démonstration au saisisseur le 26/09/2024.

---

### Sprint 7 en cours (2.9.23)

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.23)

---

### Notes Réunion

Support (temporaire) : 

- Planning ActiFlot : http://localhost:3000/project-monitoring.html#/7
- Présentation : http://localhost:3000/project-monitoring.html#/8

- Présents :
  - Emilie Le Roy (MOA/HISSEO)
  - Vincent Badts (MOA/HISSEO)
  - Johann Le Traon (MOA/HISSEO)
  - Vincent Fachéro (MOE/ISI)
  - Caroline Destreez (MOE/CODRA)
  - Morgan Facorat (CODRA)
  - Benoit Lavenier (EIS)
  - Maxime Demarest (EIS)

---

Retours de présentation 

- Bug : 
  - On peut écraser les métiers en copiant/collant une ligne du Nombre de jours de pêche
  - La sélection ne suit pas le déplacement par les flèches (ellle reste au niveau du pointeur de souris)
  - Rapport : 
    - Rajouter le libellé "Métiers" dans le tableau des caractéristiques engins
- A tester : 
  - Ecriture concurrente sur un même mois par 2 observateurs différents
- Export Csv à ajouter avec le menu de génération du rapport d'avancement
- Rapport d'avancement : ajouter un filtre s'il y en a un d'appliqué


Ordre du jour :
- Présentation de la release 2.9.22
- Retours échanges rapport d'avancement
- Présentation fonctionnalité d'extraction
- Questions/Réponses


