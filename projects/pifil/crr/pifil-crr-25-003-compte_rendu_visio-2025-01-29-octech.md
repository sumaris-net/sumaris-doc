# Compte-rendu réunion visio
## 29/01/2025

Point sur la récupération des données avec OcTech / EIS

---

> Présents :
>
> - Damien LE BOULAIRE (OcTech)
> - Élie COHEN (OcTech - informaticien concentrateur/maj balises/décente configuration)
> - Serge NOËL (? - Ancien Asten)
> - Benoît LAVENIER (EIS)
> - Étienne de CHAVAGNAC (EIS)
<!-- .element: class="font-size-extra-small" -->

> Excusés :
> - Ulysse MOREAU (OcTech)

---
# État d'esprit de la collaboration

OcTech et EIS sont motivés pour travailler ensemble, en bonne intelligence.

OcTech a développer Randy (platform cloud) pour le suivi.

---
# Concentrateur

Balises installé tous les 500 mètres, sur le filet.
Le concentrateur est dans la cabine. Connexion en BluetoothLE (+10 mètres de portée).

- Les balises publient leur ID (pendant une heure maximum après la sortie de l'eau).
  - L'ID publié est toujours le même (dolphinfree).  
- le concentrateur se connecte pour :
  - récupérer les données,
  - supprimer les anciennes données, 
  - mettre à jour le logiciel.
  Le concentrateur se connecte pour associé l'adresse Mac et l'ID.
  (2-3 minutes de synchronisation)
- Il est prévu une mise en veille des balises, après la synchronisation.
- Il existe une liste de balises par concentrateur.

La concentrateur a une balise GPS, mais elle n'est utilisée uniquement pour l'horodatage.

---
# Batterie
Le niveau de batterie : un mois d'autonomie.
Il faut avertir une semaine avant, en cas de batterie faible.

Une balise sans batterie ne plus pas dire qu'elle n'a plus de batterie.
Il faut donc avertir qu'elle n'émet pas depuix X jours.

L'information de batterie, se dégrade avec le temps.

---
# Notification sur l'App

Le concentrateur peut-il publier son ID, et que le téléphone s'y connecte ?
Armbian (Debian like) - Mise à jour par paquet (.deb) sur un repo.
Mise à jour : apt update && apt get install
Fichier de log ou de configuration (JSON), avec synchro API Rest. 
Python (daemon systemd).

---
# Serveur de test

Serge : déploie l'environnement de test.
Ulysse est un simulateur de données.

---
# Suivi des équipements

OcTech a un ERP, et des outils auto-développés (modèle fait pour le backend, surcouche UI en interne reste à faire).

Lighway Machine-2-machine
Control path

---
# Données OcTech

- Type de données : 
  - Horodatage : très important pour le rapprochement des données
  - La balise se met à l'heure à chaque remontée de plongée
    - À voir si le concentrateur peut détecter l'offset de la balise et corriger les heures fournies
      (plutôt que d'exclure les données).
      OcTech pense que c'est faisable.   
- API Influx BD 
  - Identifiant unique du navire
  - Ping ou non, date/heure
- API pour requêter le concentrateur en Bluetooth :
  - OCtech indique que c'est possible 
- Autonomie d'une balise : 
  - Un mois par balise
  - 4h de charge (par recommandé en mer)
- App : pourrait générer des notifications de changement de batterie **en avance** en phase (avant la fin d'autonomie - par ex la semaine d'avant)

---
# Actions

- OcTech met en place une base de tests (API Influx DB)
- OcTech réfléchit à une solution API bluetooth depuis le concentrateur, pour connecter l'App directement et notifier le pêcheur en temps réel
