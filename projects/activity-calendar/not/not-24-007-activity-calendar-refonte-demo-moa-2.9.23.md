# Activity Calendar - Demo 5 MOA

## Application

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Extranet user account

---

## 15/10/2024 - Demo

## Calendrier d'activité - Sprint 7 - Issue Board

- **Start date** : 16/09/2024
- **End date** : 04/10/2024
- **Milestone** : **2.9.23**
- **Goal** : Bugs correction, enhancements
- **Status** : Close
- **Deployement** : Done
- **Gitlab issues board** : [2.9.23](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.23) + [2.9.23.3](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.23.3)

---

### Fonctionnalités / Limitations

Fonctionnalités de la release **2.9.23**

- Mise en place de l'authentification extranet
- Correction des droits pour les non administrateurs
- Rapports :
  - Optimisation de l'affichage
  - Accès aux rapports depuis le tableau des calendriers
  - Implémentation du rapport d'avancement
- Application des filtres lors du changement d'année
- Onglet "Calendrier" - Prédocumentation
  - Affichage du libellé "Sacrois-ObsDeb"
  - Réorganisation des métiers pour une seule source

---

- Onglet "Calendrier" - Saisie
  - Ajout de la fonctionnalité "Couper"
  - Saisie des pmfms à la volée
  - Optimisation de la gestion des erreurs
  - Chargement à la demande liste métiers
  - Correction focus
  - Correction copier/coller de lignes
  - Amélioration des perfs

---

Limitations de la release **2.9.23**
- [Retours de recette ActiFlot v2.9.23](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/rec/rec-24-004-activity-calendar-refonte-recette-2.9.23.md)

---

### Recette MOE/MOA du sprint 7 (**2.9.23**)

Navigateur préconisé pour la recette : **Chrome**

- Sumaris-Calendrier d'activité ([SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login))
    - 2 - Import/Export des calendriers vides
    - 3 - Collecte de données
        * 01.01 - Consultation des calendriers
        * 01.02 - Saisie d'un calendrier
    - 4 - Formulaires & rapports
        * 02 - Formulaire terrain vierge
        * 03 - Formulaire terrain avec données

---

Recette **MOE** faite le 09/10/2024. Début recette **MOA** le xx/10/2024.

---

### Sprint 8 en cours (2.9.24)

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.24)

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

- Sur le pied de page du tableau des calendriers, conserver "Nombre de lignes"
- Nombre de calendriers 2023 sur le lieu d'immat FF - Fort de France incohérent avec les donnése d'Emilie : fonctionnement normal, les donnése de préprod datent de Mars 2024
- Mettre en place un onglet à côté de calendriers d'activité qui reprennent les données du rapport d'avancement (V2)
- Ajouter une valeur "Opportuniste" à l'objectif d'enquête directe (#700) ? voir pour mettre une valeur vide (obligatoire en base !) ou masquer l'info si plus rapide
- Prévoir un script pour renseigner les observateurs avec le saisisseur pour les données historiques
- Indiquer les zones géolocalisées ? Pas nécessaire en V1. Vérifier la véracité de l'info dans VESSEL_FEATURES.HAS_VMS. Si elle est correcte, c'est rapide à afficher
- Calendrier d'activité > Calendrier
  - Présence de 2 scrollbars sur le calendrier de saisie ![rec-activity-calendar](/projects/activity-calendar/rec/images/rec-24-004-2.9.23-Calendrier_2_scrollbars.gif)
  - Modifier la fonctionnalité "Déplier tout" pour au 1er clic déplier uniquement les métiers et au second déplier les gradient de côte (V1 si le temps, sinon V2)
  - Ajouter une fonctionnalité pour sélectionner une zone ou un métier pour les supprimer (V1 si le temps, sinon V2)
  - Ajouter une action "Supprimer" dans le menu contextuel (V1 si le temps, sinon V2)
  - Ajouter les raccourcis clavier dans le menu contextuel (mettre en petit)
  - Ajouter le raccourci clavier pour l'accès à la prédoc (ctrl + P)
  - Réorganiser les métiers si une seule source de prédoc est sélectionnée ou replier les métiers vides

- Formulaire terrain avec données : le champ "Zone/Gradient" n'affiche que le LOCATION.LABEL, ajouter le DISTANCE_TO_COAST_GRADIENT.LABEL comme c'est le cas sur la prédoc du site web [#722](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/722)
- Rapport d'avancement : ajouter une limite sur le nombre de calendriers pour la génération du rapport ou à minima mettre un warning. Prévoir tests de perf

---

### Organisation pour les prochains jours/semaines :
- MOE : 
  - Déploiement et recette de la version 2.9.23.3
  - Création des calendriers vides sur 2024 pour les tests MOA et saisisseurs
  - Transmission à la MOA des éléments pour que les saisisseurs puissent tester (installation vpn, url, connexion login extranet, préférences utilisateurs)
- MOA : 
  - Recette version 2.9.23.3 semaine 42
  - Transmission noms saississeurs prestataires à la MOE pour demande d'accès au vpn à RIC
- Les saisisseurs font leurs retours à la MOA, la MOA fait un retour à la MOE



