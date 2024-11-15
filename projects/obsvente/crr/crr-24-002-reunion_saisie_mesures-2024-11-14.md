# Réunion MOA sur la saisie des mesures dans ObsVentes 

### Le 14/11/2024

---

> Présents :
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Elise Bultel SCAVINNER (Ifremer)
> - Johann LE TRAON (Ifremer)
> - Vincent BADTS (Ifremer)
> - Armelle ROUYER (Ifremer)
> - Benoit LAVENIER (EIS)
> - Caroline DESTREEZ (CODRA)
> - Jean-Victor FAMY (CODRA)

---

### Ordre du jour 

**Mail Marion du 08/11/2024, 16:24**  

---

### Ordre du jour (1/4)

- [X] Voir les évolutions pour dénombrement depuis le 10/09 
  - Cas d'utilisation mobile / bureau (% d'usage ?)
  - Paramétrage de PSFM par espèce (déduire de l'espèce le PSFM)
    - 1 PSFM numérique ou plusieurs (% d'usage ?)
  - Prélèvement ? Maturité sexuel ? (réservé ObsBio)
  - IMAGiNE en mode terrain ? (Action Johann)

- Ajout de plusieurs métiers & zones : avec une finesse d’association en fonction des individus au sein des mm ventes & possibilité de dire qu’on ne connait le métier et ou la zone

---

### Ordre du jour (2/4)

- Contrôle & validation des données :
  - Revoir termes en adéquation avec CCTP : contrôle observateur/vérification société et validation programme
  - Vérifier que les actions de validation correspondent bien
  - Ajouter des étapes de contrôle/validation ?

- Avancement sur ObsVentes avec S ?

- Avancement sur MAJ Phase au lieu de Stade sur maturité crevettes : Elise contacte Laurent et Carine pour confirmer remplacement : remplacement confirmé par Carine. 
  - Vincent et Carine ont pu en parler

---

### Ordre du jour (3/4)

- Avancement sur Fichier de validation : privilégier une vue permettant la correspondance avec formulaire terrain (vue tableau a priori)

- Formulations : annuler / abandonner : clarifier message ?

- Ajouter profondeur comme données avec métier/zone ? plutôt en V2

- Présentation refonte ObsVentes séminaire SIH

---

### Ordre du jour (4/4)

- Questions de Vincent :
  - Même date de sortie et vente en hexagone (sauf si autre canal de commercialisation que la criée si échantillon au cul du bateau)
    - Marion va demander à Sébastien s'il serait intéressant d'avoir toutes les dates/type de ventes par espèces pour Sacrois même si c'est très souvent les mêmes infos
  - Fiche mareyeurs = bordereau de vente a priori : contient infos sur les poids totaux par esp et de prix de vente : aide l’obs à vérifier et finaliser sa saisie. 
    - Prévente : catalogues données aux acheteurs en amont des ventes en criée : que Hexagone
    - [X] Solution pour pouvoir acquérir électroniquement de la donnée (ex : psion & ichtym électronique)

---

### Compte rendu

- Avancement sur MAJ Phase au lieu de Stade | Ajouter profondeur comme données avec métier/zone ? plutôt en V2
  - Prévoir un point spécifique avec Elise

- Présentation refonte ObsVentes séminaire SIH
  - Prévoir un point spécifique avec Marion
  - Voir pour un démonstration tablette d'un outil à Benoit

- PSION : prévoir un import de mensuration dans ObsVentes (format de fichier à définir)
  - En V1 mais d'abord développer les écrans de saisie des espèces pour les mensurations
  - Contacter Blandine Brisset pour l'exploitation des données du PSION dans Allegro (moulinette existante)
  - CF Mail Vincent Badts (14/11/2024)
  - CF Mail Marion (24/09/2024)

- Mensuration / Dénombrement
  - Pas de prélèvement ni de maturité sexuelle
  - Certaines espèces sont à sexer
    - La langoustine (Nephrops norvegicus),
    - Les crustacés (araignée, tourteau, homard, langouste, etc.),
    - La lingue bleue (Molva dypterygia),
    - Les élasmobranches (raies et requins)
    - La cardine franche (Lepidorhombus whiffiagonis).
    - RAJOUTER UNE COLONNE SEXE DANS L'IHM DU DENOMBREMENT POUR L'ESPECE CONCERNEE

- 1 PSFM numérique ou plusieurs
  - Oui, à prévoir (Cas des élasmobranches)

- Démo du dénombrement

- Prévoir un PSFM par défaut (Ex : longueur totale) puis pouvoir rajouter un autre PSFM (par exemple s'il manque la queue)

- Avoir un référentiel de taille Min/Max par espèce initialisé pour la saisie
de façon à ne pas saisir la taille au pavé numérique.
  - A maquetter / construire un référentiel de classe de taille par espèce

- Définir le champ qui déclenche l'enregistrement
  - La dernière valeur saisie déclenche l'enregistrement

- ObsVentes : Pas de poids individuel (que sur ObsBio sur un échantillonnage)

- Le mode dénombrement a t il un sens car le mode de saisie individuel permet la même chose ?

- Mettre un filtre automatique si on ajoute un dénombrement sur une nouvelle espèce scientifique alors qu'une autre espèce à déjà été saisi
  - Le filtre permet de se positionner sur l'espèce rajoutée pour faire la saisie

