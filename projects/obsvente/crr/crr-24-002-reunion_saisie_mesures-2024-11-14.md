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
  - Présenter ObsVentes en mode bureau et en mode terrain sur des 2 espèces différentes
    - Suivant les délais, EIS pourra nous mettre à disposition version applicative d'ObsVentes sur _test.sumaris.net plutôt_ que de déployer une version en préproduction Ifremer

- PSION : prévoir un import de mensuration dans ObsVentes (format de fichier à définir)
  - En V1 mais d'abord développer les écrans de saisie des espèces pour les mensurations
  - Contacter Blandine Brisset pour l'exploitation des données du PSION dans Allegro (informations sur la moulinette existante)
  - CF Mail Vincent Badts (14/11/2024)
  - CF Mail Marion (24/09/2024)

- Mensuration / Dénombrement
  - Pas de prélèvement ni de maturité sexuelle (réservé ObsBio - IMAGiNE)
  - Certaines espèces sont à sexer (cf [manuel observateur ObsVentes](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/doc/obsventes-doc-24-003-Manuel-observateur-ObsVentes.pdf))
    - La langoustine (Nephrops norvegicus),
    - Les crustacés (araignée, tourteau, homard, langouste, etc.),
    - La lingue bleue (Molva dypterygia),
    - Les élasmobranches (raies et requins)
    - La cardine franche (Lepidorhombus whiffiagonis).
    - Action _MOE_ : RAJOUTER UNE COLONNE SEXE DANS L'IHM DU DENOMBREMENT POUR L'ESPECE CONCERNEE (Spécification)

- 1 PSFM numérique ou plusieurs
  - _Réponse MOA_ : Oui, à prévoir (Cas des élasmobranches)

- Démo du dénombrement (Codra/EIS)

- Prévoir un PSFM par défaut (Ex : longueur totale) puis pouvoir rajouter un autre PSFM (par exemple s'il manque la queue)

- Proposition _MOE/Dév_ : Avoir un référentiel de taille Min/Max par espèce initialisé pour la saisie
de façon à ne pas saisir la taille au pavé numérique.
  - A maquetter / construire un référentiel de classe de taille par espèce (Action _MOA_)

- Définir le champ qui déclenche l'enregistrement
  - _MOE/Dév_ : La dernière valeur saisie déclenche l'enregistrement

- ObsVentes : Pas de poids individuel (que sur ObsBio sur un échantillonnage)

- Le mode dénombrement a t il un sens car le mode de saisie individuel permet la même chose ?
  - _MOE_ : A trancher lors de la prochaine présentation du prototypage

- Proposition _MOE/Dév_ : Mettre un filtre automatique si on ajoute un dénombrement sur une nouvelle espèce scientifique alors qu'une autre espèce à déjà été saisi
  - Le filtre permet de se positionner sur l'espèce rajoutée pour faire la saisie

