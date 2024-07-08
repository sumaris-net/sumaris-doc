# Activity Calendar - Demo 1 MOA

## Application 

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Intranet user account

---

## 13/06/2024 - Demo 1 

### Activity Calendar - Sprint 2 - Issues Board

- **Sprint** : 2
- **Start date** : 29/04/2024
- **End date** : 24/05/2024
- **Milestone** : **2.9.3-alpha18**
- **Status** : Closed
- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.3-alpha18)

---

### Fonctionnalités / Limitations

Fonctionnalités du sprint 2
- Création de l'onglet "Calendrier"
- Prédocumentation
- POC tableau de saisie de l'activité
- Création du tableau des métiers
- Ajout des tableaux d'historique des caractéristiques/immat/armateurs
- Rapport - Formulaire terrain
- Ajout des photos
  * Optimisation du chargement des images 
  * Création du filtre pour le composant photo historique
- Recette MOE

---

Limitations du sprint 2
- [Retours de recette ActiFlot v2.9.3-alpha18](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/587)
- [Retours de recette volets communs v2.9.3-alpha18](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/596)

---

### Recette MOE du sprint 2 

[SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login)

- Sumaris-Calendrier d'activité
  - 03 Collecte de données
     * 01.01 - Consultation des calendriers
     * 01.02 - Saisie d'un calendrier (à confirmer Caroline)

L'ordre des numéros indique l'importance des tests (1 : cas nominaux)

---

### Demonstration du contenu du sprint 2 d'ActiFlot

---

### Sprint 3 en cours

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=ACTIFLOT&milestone_title=2.9.19)
- Démonstration - [environnement de développement](https://obsmer.sumaris.net)
- Tickets à prioriser (MOA)

---

### Notes Réunion

- Présents :
  - Emilie Le Roy (MOA/HISSEO)
  - Johann Le Traon (MOA/HISSEO)
  - Vincent Fachéro (MOE/ISI)
  - Caroline Destreez (MOE/CODRA)
  - Benoit Lavenier (EIS)
  - Jean-Victor Famy (EIS)
  - Morgan Facorat (EIS)


---

**Remarques MOA sur la présentation du sprint ActiFlot**

Tableau des calendriers d'activité : 
  * Ajouter l'organisme saisisseur
  * Détecter qu'il n'y a qu'un programme et l'enlever du tableau 
  * Vérifier le filtre sur le port d'attache renseigné dans le calendrier : OK, en place dans le sprint 2 

Information :
  * Présence de calendriers 2024 renseignés sur 2 mois : saisie en outre mer (synchronisation depuis WAO)

Sauvegarde lors de la recette : 
  * On peut modifier les calendriers de l'année 2022, pas après (validation d'Emilie)

Formulaire "Calendrier d'activité" > onglet "Navire"
  * Erreur lors de l'enregistrement après ajout d'une photo
    * En cours d'analyse et de résolution par la MOE
    * Dans l'historique afficher toutes les photos, y compris celle de l'année de saisie, dans un bandeau à droite
    * Mettre en gras les changements de caractéristiques

Formulaire "Calendrier d'activité" > onglet "Calendrier" :
  * Besoin de la régionalisation dans les listes, à la saisie d'un calendrier (Port d'attache par exemple)
  * Cas des superviseurs qui peuvent changer de régionalisation

Raccourcis :
  * Pas de besoin de raccourci pour ouvrir des écrans (Exemple : control + M pour ouvrir les mensurations)
  * Déjà en place pour la Prédocumentation (Control + P)

Mise en place de Min/Max (nombre d'homme à bord par exemple) - 
  * Référentiel métier régionalisé sur les engins des métiers (table SIH2_ADAGIO_DBA.GEAR_FEATURES_CONTROL)
  * Il faut que ce soit non bloquant avec un message d'erreur (le message doit afficher la borne)
  * Pas prioritaire mais il faut a minima un message V1

Bien faire attention à anonymiser les captures d'écran dans les tickets gitlab (sumaris-app à une visibilité public)
  * Pour les données à anonymiser, il faut créer des tickets avec une visibilité internal

Cible plutôt Chrome

Trouver une méthodologie pour faire des mini vidéos pour reproduire des bugs 


---

**Démo de la version en pré-production** 



---

**Rédaction des tests MOA pour les 3 volets**
- Dans SquashTM
  - Créer un dossier MOE et MOA
  - Dupliquer les tests MOE dans le dossier MOA
    - La MOA a ensuite toute la liberté pour modifier/enrichir les tests

La MOA devra reporter les anomalies du sprint dans le ticket associé :
- [Ticket Retours Recette ActiFlot MOA](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/617)

La MOA devra reporter les incohérences sur les spécifications du sprint dans le ticket associé :
- [Ticket Retours Spécifications ActiFlot MOA](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/618)





