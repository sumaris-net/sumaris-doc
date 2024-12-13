# Compte-rendu réunion visio
## 28/11/2024

---

> Présents :
>
> - Camille YOUNSI (DGAMPA)
> - Benoit LAVENIER (EIS)
> - Dorian MARCO (EIS)
> - Quitterie SOURGET (OP LPDB)
> - Aurélien HENNEVEUX (OP PDA)
> - Bastien MÉRIGOT (Université de Montpellier)

---

> Excusés :
>
> - Damien LE BOULAIRE (OchTech)
> - Glenn PRIGENT (Ifremer)
> - Marie-claude Cote-Laurin (OFB - projet ObsCam)
> - Chloé MALIRAT (OFB)
> - Alex Chailloux (SINAY)
> - Anne CHAUSSE (CNPMEN)
> - Margaux HONNORE (CNPMEM)
> - Fiona BIGEY (OP VENDEE)
> - Florian EXPERT (MTECP DEB)
> - Lugdiwine BURTSCHELL (DEB/ELM3)
> - Léni GUILLOTIN (AGLIA)
> - Germain BOUSSARIE (Ifremer)
> - Noëlle BRU (Université de Pau)
> - Nolwenn RANNOU (Ifremer)
> - Olivier BODERE (AGLIA)
> - Yves LE GALL (Ifremer)
> - Hélène RENAULT (DGAMPA)
> - Chloé FAURE (DGAMPA)
> - Isabelle JOSSERAND (DGAMPA)
> - Thomas CLOATRE (Ifremer)
> - Emilie LEBLOND (Ifremer)

---
## Organisation des tests en mer (1/3)

- Définir une convention d'utilisation des données, relatif aux navires impliqués 
  - Pour la fourniture des données tests (= jeu de données de test mentionné dans la réunion du 21/11/2024 sur le rapprochement des données)
    - Limité dans le temps
    - Lister les acteurs qui auront accès aux données ? (ex: sous-traitants informatiques)
    - ObsMer - à voir avec Ifremer
  - Pour le long terme :
    - ObsCam - cf "Contrat navire" en cours de rédaction (OFB)
    - Balises - Contrat en cours de rédaction (CNPMEM)
    - ObsMer - à voir avec Ifremer
  - Lister tous les acteurs impliqués

---
## Organisation des tests en mer (2/3)

- 4-5 navires sur l'ensemble des facades ont été sollicité
  - **LPDB#1** : PIFIL + ObsCam + ObsMer (pas sûr) + Saisie App (à faire iphone) 
  - **PDA#1** : Dolphinfree (4 sur 5 qui ont fonctionné) + ObsCam + ObsMer (à confirmer) + Saisie App (déjà saisie Léni - marée du 15-17/11/2024)
  - **PDA#2** : PIFIL + ObsCam + ObsMer (à confirmer) + Saisie App (fiche terrain marée du 06-16/11/2024)
  - **PDA#3** : PIFIL + ObsCam + ObsMer (à confirmer) + Saisie App (fiche terrain marée du 04-14/11/2024)
  - **PDA#4** : PIFIL (depuis le 28/11/2024) + ObsCam + ObsMer (à confirmer) + Pas de saisie dans l'App

---
## Organisation des tests en mer (3/3)

> Actions :
> - Ifremer/CNPMEM/OFB - Établir une convention sur le croisement de données (test, puis long terme)
> - Ifremer - Demander les données ObsMer disponibles sur les navires sélectionnés pour les tests

---
## Retours sur le formulaire terrain

EIS présente un [prototype PDF de formulaire terrain](](../doc/dolphinfree-doc-24-002-Prototype_formulaire_terrain_via_App.pdf)) généré par l'application.
En plus des autres retours déjà remontés (cf CRR précédents),
plusieurs demandes de corrections ont été faites :

- Général : 
  - [ ] Ajouter les logos en entête (action Dorian) : 
    - Logo DolphinFree à gauche
    - Logo DGAMPA à droite
      (note technique : à ajouter dans les assets)
- Engins : 
  - Quiterie Sourget propose un mode de saisie tableau (cf [formulaire terrain engin de PIFIL](../doc/pifil-doc-24-001-Formulaire_terrain_PAMM-engin.pdf))
  - ou bien EIS propose d'ajouter 3 blocs de formulaire engin
  - => Activer le mode "bloc" ou "tableau" suivant une option de programme
- Opérations : 
  - [ ] Libellé de la colonne commentaires : retirer le texte spécifique à ObsMer (à rendre configuration en option)
- Captures accidentelles : 
  - [ ] Activer un mode 'multi OP' dans le tableau (via une option de programme) : 
    - [ ] Ajouter une colonne N° OP, à la place de la colonne # (numéro d'ordre)
    - [ ] Ajouter une colonne date/heure de l'OP (pour éviter les erreurs de saisis dans le N° OP)
  - [ ] Masquer "Espèces commerciales (FAO)" (suivant l'option de programme existante)
  - [ ] Ajouter "Espèce scientifique" (sur 2 lignes) (suivant l'option de programme existante)
    - [ ] Lister les codes espèces en bas de page, si pas trop d'espèces (ex : si moins de 15)
  - [ ] Réduire la largeur des colonnes `O [ ] N [ ]` en ajoutant `(Oui/Non)` dans l'entête de colonne
  - [ ] Afficher/Masquer les valeurs qualitatives dans les cellules (suivant une option de programme)
- Remises à l'eau
  - [ ] Il manque le tableau de saisie des remises à l'eau 
  - [ ] Activer un mode 'multi OP' dans le tableau (via une option de programme) :
    - [ ] Ajouter une colonne N° OP, à la place de la colonne # (numéro d'ordre)
    - [ ] Ajouter une colonne date/heure de l'OP (pour éviter les erreurs de saisis dans le N° OP)

> Actions :
> - EIS - semaine 49 - Corriger les points bloquants et majeurs sur le formulaire
> - EIS - semaine 49 - Fournir un formulaire terrain à jour, pour validation (semaine 49) 

---
## Retours sur l'application de saisie

En plus des autres retours déjà remontés (cf CRR précédents),
plusieurs demandes ont été faites pour faciliter la prise en main de l'App :

- Lancement de l'application
  - Sélection du programme de collecte :
    - [x] Renommer le titre de la modale en "Démarrage" 
    - [x] Renommer l'onglet "Recherche" en "Programme de collecte"
      - [x] Revoir le texte d'explication, pour y ajouter "(...) programme **de collecte ou expérimentation** (...)" 
    - [x] Renommer l'onglet "Nœuds réseau" en "Base de données"
  - Créer un compte - à la dernière étape - **à valider** :
    - [ ] Ajouter un champ "Programme de collecte" (avec choix multiple ? à confirmer)
    - [ ] Ajouter un champ "[ ] Pêcheur professionnel ?" (à confirmer)
    - [ ] Si "Oui", ajouter un champ "Navire" (optionnel) (à confirmer)
- Écran Marée :
  - Opérations :
    - [x] Si création d'un virage, alors affichage d'une demande de confirmation :
      "Pour votre première marée, veuillez commencer par un filage. Voulez-vous néanmoins continuer ?"
- Écran opération :
  - [x] Retirer le PMFM "Présence de dispositif (...)" (à conserver pour `PIFIL2`, et à retirer de `Dophinfree`)
  - [x] Création d'un virage, les positions lat/long du filage doivent être recopiées en début ET en fin de virage
    (cf programme `ACOST`) 

> Actions :
> - EIS - semaine 49 - Corriger les points bloquants et majeurs de l'application
> - EIS - semaine 49 - Livrer l'application sur open-test.sumaris.net, et les stores Google et Apple


---
## Création des comptes dans l'application

Le point est fait sur la création des comptes utilisateurs sur `open.sumaris.net`
Il faut prévoir de : 
- Créer les comptes utilisateurs ;
- Ajouter les droits sur le programme de collecte (PIFIL ou Dolphinfree) ;

> Questions :
> - Les OP créent les comptes de leurs adhérents ?
> - le CNPMEM gère les comptes des navires hors OP ? via les CRP et/ou CDP ?  

> Actions : 
> - Tous - à rediscuter lors d'un prochain point
