# Compte-rendu réunion visio
## 18/10/2024

L'objectif de la réunion est la remontée des tests de l'application,
et la définition d'une stratégie de communication auprès des professionels  

> Date de prochaine visio : 31/10/2024 à 10h

---

> Présents :
>
> - Camille YOUNSI (DGAMPA)
> - Léni GUILLOTIN (AGLIA)
> - Quitterie SOURGET (LPDB)
> - Fiona BIGEY (OP VENDEE)
> - Aurélien HENNEVEUX (PDA)
> - Bastien MÉRIGOT (Université de montpellier)
> - Germain BOUSSARIE (Ifremer)
> - Benoit LAVENIER (EIS)
> - Dorian MARCO (EIS)

---

> Excusés :
>
> - Noëlle BRU (Université de Pau)
> - Glenn PRIGENT (Ifremer)
> - Nolwenn RANNOU (Ifremer)
> - Olivier BODERE (AGLIA)
> - Yves LE GALL (Ifremer)
> - Anne CHAUSSE (CNPMEN)
> - Hélène RENAULT (DGAMPA)
> - Chloé FAURE (DGAMPA)
> - Isabelle JOSSERAND (DGAMPA)
> - Thomas CLOATRE (Ifremer)
> - Emilie LEBLOND (Ifremer)

---
## Retour sur les tests

Voici les retours suite aux tests de l'application sur open-test.sumaris.net (version 2.9.23.2)

- Installation :
  - Sous Android, plusieurs personnes n'ont pas pu installer l'application (sur Samsung) 
  - Bug de synchronisation / mode hors ligne, détecté par EIS

- Ergonomie :
  - Icone disquette pour sauvegarder : pas intuitif pour tous
    - Proposition d'aJouter le texte "Sauvegarder" en dessous ? 

---

- Écran Marée :
  - Ajout d'un navire (bouton "+" à droite du champ navire) :
    - "Lieu d'immatriculation" 
      - à suffixer avec "(QIM, Pavillon)" ?
      - La liste déroulante apparait est vide, il faut taper une recherche pour voir des éléments
 - Onglet "Opérations" pas visible sur petit écran.
   - Proposition de réduire la largeur des titres d'onglets,
   - Proposition d'ajouter des boutons suivant/précédent pour changer d'onglet   

---

- Tableau des engins :
  - Le bouton bleu "+" pour ajouter un engin pourrait proposer 2 choix :
    - "Rechercher un engin existant" :
      - Ouverture de la modal de recherche.
      - A la sélection de l'engin, retour à la fenêtre d'édition de l'engin pour pouvoir le modifier
    - ou "Saisir un nouvel engin" : reprendre le comportement existant

---

- Écran Opérations (filage ou virage)
  - Bug sur la géolocalisation (un message d'attente apparait, mais ne rend pas la main)
  - Si marée sans caméra ni sans GPS :
    - Remplir la date de fin automatiquement (sans heure)
    - Recopier automatiquement la zone de début dans celle de fin, si cette dernière est vide.
      Si la zone de fin n'est pas vide, alors demander confirmation à l'utilisateur avant de la mettre à jour
  - Champ "Profondeur de l'engin (m)" à renommer en "Profondeur au filage (m)"
  - Si "Captures accidentelles" à "Oui" : Rendre plus visible l'onglet "Captures accidentelles" 
    - Proposition d'ajouter une icone d'erreur dans le titre de l'onglet, si aucune captures n'est déclarée

---

- Captures accidentelles :
  - "Référence de la marque" à renommer "Numéro de la bague Pélagis"

---

## Stratégie de communication

Point sur les supports de communication :

- Manuel papier (PDF) : Nécessaire dans tous les cas
  - Action (EIS): Réalise le manuel utilisateur (Quiterie envoi des modèles)
  - Action (EIS): Propose une vidéo montrant l'utilisation de l'application : saisie d'une marée, engin, OP etc 
  - Action (DGAMPA) : Camille demande la réalisation d'un support de com à la DIRCOM 
- Formulaire papier vierge : Nécessaire dans tous les cas
  - Qui le réalise ? 
- Formulaire papier avec données ? (non discuté)

---

Stratégie de déploiement de l'application :

Le 1er mois : 
- Les OP proposent l'application à 5-6 bateaux
  - Léni (AGLIA) et Aurélien (PA) proposent des bateaux volontaires ? 
- Les OP saisissent les fiches terrain papier des autres bateaux
  - /!\ Potentiellement 1 semaine de saisie pour 5 bateaux (récup des fiches, vérification avec les logbooks, etc.)

- Les pêcheurs remontent les bugs et demandes aux OP, qui les remontent à EIS

Puis :
- EIS corrige/améliore l'application

A l'issue de la mise à jour de l'application :
- Les OP proposent l'application à d'avantage de bateaux

---

##  Contrôle/validation des données

- Qui doit faire la validation ?
- Chaque OP pour ses adhérents ?

Une point DGAMPA / OP est à planifier

---

## Connectivité avec les outils Logbooks

Rappel des obligations déclaratives : 
- Logbook Électronique : > 12m 
  - 2 logiciels : IKTUS (CLS) - Turbocatch (Agiltech)
- Logbook papier : < 12m
  - l'app "Visio capture" est en cours de déploiement (France Agrimer) 
- Fiche de pêche : < 10m
  - l'app "Visio capture" est en cours de déploiement (France Agrimer)


__note:__ App "Visio capture" en cours de déploiement
