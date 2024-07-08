# Collecte de données
## Spécifications (ObsVentes)

---
## Sommaire

- [Documents](#documents)
- [Lignes de plan](#lignes-de-plan)
- [Ergonomie générale](#ergonomie-générale)
- [Sorties](#sorties)
- [Sorties > Filtres](#sorties--filtres)
- [Sortie > Détails](#sortie--détails)
- [Sortie > Echantillonnages en métropole](#sortie--echantillonnages-en-métropole)
- [Sortie > Echantillonnages en outremer](#sortie--echantillonnages-en-outremer)
- [Sortie > Echantillonnages en outremer > Ajout par lot](#sortie--echantillonnages-en-outremer--ajout-par-lot)
- [Vente > Détails](#vente--détails)
- [Vente > Lots espèces](#vente--lots-espèces)
- [Vente > Lots espèces > Mesures individuelles](#vente--lots-espèces--mesures-individuelles)
- [Sortie > Contrôle de la saisie](#sortie--contrôle-de-la-saisie)
- [Règles métier](#règles-métier)
- [Importation depuis ObsDeb](#importation-depuis-obsdeb)
- [Référentiels](#référentiels)


---
## Documents

- [PPT_Allegro_V2](/projects/obsmer/doc/obsmer-doc-23-001-PPT_Allegro_V2.pdf)
- [Formulaire terrain OBSVENTES](/projects/obsvente/doc/obsventes-doc-24-001-Formulaire_terrain_OBSVENTES.pdf) (v1 2023)
- [Formulaire terrain OBSVENTES DOM](/projects/obsvente/doc/obsventes-doc-24-002-Manuel-ObsVentes-DOM.pdf)

---
## Cible

Le mode tablette est à inclure dans le périmètre de la V1.

Résolution de tablette utilisée par BL : Samsung Active Tab (with zoom) 991x580.

Résolution de tablette utilisée par VB : Samsung Active Tab (with zoom) 1920x1200.

> Définir la résolution cible des saisisseurs avec VB et BL

---
## Lignes de plan

- Fichier CSV importé dans WAO ObsVentes
- Possibilité de modifier/supprimer une ligne
- TODO : Mapping modèle WAO / 

> Code source : https://gitlab.ifremer.fr/sih/WAO

---
## Gestion des droits

**REF: OBSVENTES/USERS_RIGHTS**

![ui-obsvente](/projects/obsvente/spe/images/obsventes-users-rights.svg)

(1) :
* Si l'utilisateur est de la société Ifremer, il peut consulter, modifier et supprimer toutes les sorties non validés
* Si l'utilisateur n'est pas de la société Ifremer, il peut consulter, modifier et supprimer uniquement les sorties créées par sa société et non validés

(2) : Seules les données non validées peuvent être modifiées ou supprimées

#### Détails techniques :
* Administrateur de référentiels :
   * PERSON2USER_PROFIL = 1
   * PROGRAM2PERSON = vide
* Responsable de programme :
   * PERSON2USER_PROFIL = 3
   * PROGRAM2PERSON = 1
* Coordinateur :
   * PERSON2USER_PROFIL = 2
   * PROGRAM2PERSON = 4
* Observateur :
   * PERSON2USER_PROFIL = 2
   * PROGRAM2PERSON = 2

> Questions :
> - MOA : Revoir la gestion des droits 
>   - Actuellement : définition d'un portefeuille de navires par utilisateur -> pb perf
>   - Proposition 1 : définir le coordinateur selon le PROGRAM_PRIVILEGE -> Instantané. Le coordinateur a les mêmes navires que les saisisseurs de sa société, moins fin que la gestion actuelle. Peu couteux.
>   - Proposition 2 : indexer les porteuilles de navires dans ES -> L'indexation est réalisée une fois par jour, la modification des droits n'est donc pas prise en compte instantanément. Fin. Couteux ?


Validation des données : qui valide (responsable de programme et/ou coordinateur) ? comment ?
- L'action de "Terminer la saisie" correspond à une validation par l'observateur
- L'action de "Validation" correspond à une validation de la société
- L'edition du rapport lance le contrôle des données saisies 
  - En cas d'erreur, le rapport n'est pas éditer et l'observateur est informé sur les écrans en erreur


---
## Ergonomie générale

**REF: OBSVENTES/INTERFACE**

![ui-obsvente](/projects/obsvente/spe/images/observed-location-tree.svg)

---
## Sorties

**REF: OBSVENTES/SORTIES**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-table.svg)

#### Scénario principal

1. Le saisisseur sélectionne le menu "Sorties" dans l'interface de l'arbre du menu
2. L'écran "Sorties" s'ouvre. Les informations suivantes sont affichées pour chaque sortie :
   * L'état de saisie de la sortie :
     * "En cours de saisie" : _réprésenté par une icône :pencil2: dans la cellule_
     * "Terminé" : _réprésenté par une icône :heavy_check_mark: dans la cellule_
     * "Qualifié" : _réprésenté par une icône :checkered_flag: dans la cellule_
   * Le programme
   * L'origine
   * Le lieu de la sortie
   * La date/heure de début de sortie
   * La date/heure de fin de sortie
   * Le ou les observateur(s)
   * Le ou les saisisseur(s)
   * Le commentaire
3. Le saisisseur consulte le tableau des sorties
4. Le saisisseur filtre les sorties (REF: OBSVENTES/SORTIES/FILTRES)
5. Le saisisseur crée une nouvelle sortie (REF: OBSVENTES/SORTIE/DETAILS)

**Variante(s) :**

**Variante a :** 
4. Le saisisseur consulte une sortie existante [Retour en 4]

**Variante b :** 
4. Le saisisseur supprime une sortie existante [Retour en 4]

> Questions :
> - ISI : Analyser le renommage du programme SIH-OBSVENTE en SIH-OBSVENTES (impact + chiffrage) ?
> - Saisisseur : Ajouter onglet avec l'ensemble des échantillonnages toutes sorties ? (cf Imagine)
> - MOA/EIS : Ajout du plan d'échantillonnage ? Impact côté Imagine ?

---
## Sorties > Filtres

**REF: OBSVENTES/SORTIES/FILTRES**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-table-filters.svg)

Les filtres des sorties sont accessibles depuis le tableau de consultation des sorties via l'icône entonnoir.

#### Scénario principal

1. Les filtres du tableau "Sorties" s'ouvrent. Les critères suivants sont disponibles :
   * Le programme de collecte
   * L'origine
   * L'état de saisie
   * Le lieu de la sortie
   * La début de la période
   * La fin de la période
   * L'organisme du saisisseur
   * Le saisisseur
   * Les observateurs
2. Le saisisseur filtre les sorties (REF: COMMUN/FILTRES)

Les critères suivants sont multiples (dev en cours sur Imagine) : 
  * L'origine
  * L'état de saisie
  * L'organisme du saisisseur 
  * Le saisisseur 
  * L'observateur 

---
## Sortie > Détails

**REF: OBSVENTES/SORTIE/DETAILS**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-new.svg)

La création d'une sortie est accessible depuis le tableau de consultation des sorties via l'icône :heavy_plus_sign:

#### Scénario principal

1. Le saisisseur demande la création d'une nouvelle sortie
2. L'écran "Nouvelle sortie" s'ouvre, il est composé de 3 onglets :
    * "Détails" (onglet par défaut)
    * "Echantillonnages" (visible uniquement si le programme est renseigné)
3. Dans l'onglet "Détails", le saisisseur sélectionne :
    * Le programme de collecte*
    * Le plan d'échantillonnage*
    * Le lieu*
    * La date de début*
    * La date de fin*
    * Le ou les observateurs*
4. L'origine est automatiquement renseignée en fonction du programme de collecte
5. La liste des espèces à observer (onglet "Echantillonnages") est automatiquement renseignée en fonction de la référence au plan sélectionnée (à confirmer pendant le dev)
6. Les caractéristiques de la sortie s'affichent en fonction du programme, de la date et du lieu sélectionnés
   *  Il est possible de choisir les libellés des PMFM (caractéristiques) via le dictionnaire thématique
7. Le saisisseur renseigne les caractéristiques de la sortie
8. Le saisisseur enregistre
9. Le bandeau de l'écran affiche "Lieu - date"
10. Le saisisseur est positionné sur l'onglet "Echantillonnage"

**Variante(s) :**

**Variante a :** 
3. Les champs suivants sont automatiquement renseignés lorsque le filtre "Programme de collecte" sur le tableau des sorties est renseigné [Retour en 3] :
  * Programme de collecte 
  * Observateur 
  * Date

**Variante b :** 
Le plan d'échantillonnage n'est pas modifiable s'il y a des échantillonnages associés

#### Détails techniques :
* Sortie : OBSERVED_LOCATION
* Origine : POC à prévoir : créer une table OBSERVED_LOCATION_ORIGIN liée à OBSERVED_LOCATION ? Non-modifiable. 
Sera également utilisé dans Imagine pour distinguer les données Obsbio de Campagne
* Disponibilité de la fiche de pré-vente : PMFM à créer, QUALITATIVE_VALUE à créer (oui/non)
* Caractéristiques de la vente :
    * Origine : PMFM_STRATEGY avec :
        * STRATEGY.PROGRAM_FK "SIH-OBSVENTE"
        * APPLIED_PERIOD.START_DATE <= date de vente < APPLIED_PERIOD.END_DATE + 1 où APPLIED_PERIOD.APPLIED_STRATEGY_FK = APPLIED_STRATEGY.ID
        * PMFM_STRATEGY.ACQUISITION_LEVEL_FK = SALE_SURVEY ou OBSERVED_LOCATION
    * Caractère obligatoire : PMFM_STRATEGY.IS_MANDATORY
    * Ordre d'affichage : PMFM_STRATEGY : RANK_ORDER

> Questions/Remarques :
> 
> - MOE : Programme de rattachement : Information doublonnée (SALE + SALE_MEASUREMENT) pour la stratégie depuis 2017 ?
> 
> - MOE : Liste d'espèces à observer + liste PETS : traitement qui intègre les données dans SAMPLING_STRATA ou DENORMALIZED_SAMPLING_STRATA ? A approfondir
> 
> - MOE : Validation observateur, Validation société : remplacer ces PMFM par le processus de contrôle des données de Sumaris, 
> 
> - MOA : Donner la liste des libellés des caractéristiques (PMFM)
> 
> - MOA : Prévoir une réunion sur le protocole de "Fin de saisie" - La MOA prépare un diagramme de workflow de validation de la donnée.
>
> Terminaison de la saisie : 
> 
> - Rendre accessible l'édition du rapport avant terminaison de la saisie, prévoir modification ou mieux refonte des rapports birt qui doivent certainement utiliser ces pmfm
> 
> - MOA : A ANALYSER : revoir la terminaison de la saisie pour afficher un message demandant de renseigner les champs "validation observateur" et "validation observateur"
>
> - fournir workflow de la terminaison de la saisie - action MS, VB
>
> - MOE : A ANALYSER : pouvoir modifier la ligne de plan même si des échantillonnages sont associés

---
## Sortie > Echantillonnages en métropole

**REF: OBSVENTES/SORTIE/ECH_METROPOLE**

![ui-landings](/projects/obsvente/spe/images/landings-table-pets-random.svg)

Le saisisseur accède à l'onglet "Echantillonnages" de l'écran de création d'une sortie.
La stratégie déterminée à partir des éléments définis sur la sortie permet de déterminer s'il s'agit d'une vente en métropole ou en outremer.
Si la caractéristique "PETS" est à "Oui", l'onglet affiche en premier le tableau de saisie des PETS (REF: OBSVENTES/SORTIE/ECH_AUTRES),
puis le tableau de saisie "Tirage au sort". Sinon l'onglet affiche seulement le tableau de saisie "Tirage au sort" (REF: OBSVENTES/SORTIE/ECH_METROPOLE)


#### Scénario principal

1. Dans l'onglet "Echantillonnages", le saisisseur saisie la liste des PETS observés s'il à indiqué PETS à "Oui" dans la sortie. 
2. Il renseigne aussi la liste des espèces à observer.

### Sortie > Echantillonnages en métropole > Saisie de PETS

**REF: OBSVENTES/SORTIE/ECH_AUTRES**

**PETS** : Protected Endangered and Threatened Species. Dans le cadre de l’EU-MAP et de sa révision pour la période
2022-2027, la liste des espèces protégées à suivre est établie en vertu de la législation de l‘Union et des accords
internationaux. Elle fait référence aux listes des deux conventions internationales OSPAR (région I à V) et UNEP
(Méditerranée) et des organisations régionales des pêches NEAFC (=Liste OSPAR), ICCAT et GFCM (= Liste UNEP). Ces
espèces sont des espèces d’élasmobranches et d’amphihalins, prélevées en prises accessoires ou accidentelles de la pêche
professionnelle

En cas de présence de PETS sur le lieu de la vente, le saisisseur privilégie les mensurations de ces espèces
par rapport à celles définies dans la liste des espèces à observer.

#### Scénario principal

1. Dans le tableau "PETS", les informations suivantes sont affichées pour chaque espèce :
    * Espèce commerciale
    * Espèce scientifique
    * Navire
    * Observé ?
    * Zone de pêche
    * Type de vente
    * Commentaire
2. Le saisisseur ajoute les PETS observés. Pour chaque PETS, le saisisseur renseigne :
    * L'espèce commerciale*
    * L'espèce scientifique
3. La case à cocher "Observé ?" est automatiquement cochée
4. Le saisisseur enregistre l'échantillon observé
5. Le saisisseur crée un lot d'espèces pour un PETS (REF: OBSVENTES/SORTIE/VENTE/DETAILS)

**Variante(s) :**

**Variante 4a :** Le saisisseur supprime un PETS

#### Détails techniques :
* Echantillonnage : LANDING
* Vente : SALE
* Type de vente : SALE_TYPE
* Espèce commerciale et scientifique : liste des PETS issue de WAO, la liste des PETS varie suivant le lot (façade maritime) (environ 15 PETS par lot en métropole)
* Zone de pêche : PMFM à créer, prévoir une option pour définir le niveau de lieu


### Sortie > Echantillonnages en métropole > Espèces tirées au sort

Dans l'onglet échantillonnage, l'observateur renseigne la liste des espèces à observer.

#### Scénario principal

1. Pour chaque espèce, les informations suivantes sont affichées :
   * Priorité
   * Espèce commerciale
   * Espèce scientifique
   * Observé ? (par défaut décoché)
   * Raison de non observation
   * Navire
   * Zone de pêche
   * Type de vente
   * Commentaire
2. Le système affiche le nombre d'espèces minimal à observer
3. Pour chaque espèce observée, le saisisseur coche la case "Observé ?"* 
4. Le système actualise le compteur d'espèces observées
5. Pour chaque espèce non observée, le saisisseur sélectionne une raison de non observation*
6. Le saisisseur enregistre les échantillonnages
7. Le bandeau de l'écran affiche "Lieu - Date"
8. L'encart sur le saisisseur s'affiche
9. Le saisisseur crée un lot d'espèces pour une espèce à observer (REF: OBSVENTES/SORTIE/VENTE/DETAILS)


Liste exhaustive des raisons de non observation : 


**Variante(s) :**

**Variante b :**
2. Un warning apparait lorsque le nombre d'espèces observées est inférieur au nombre minimal d'espèces à observer [Retour en 2]

**Variante a :** 
8. Un warning apparait lorsque le saisisseur accède à la vente d'une espèce sans avoir coché la case "Observé ?".
Le warning peut être omis en cliquant sur la case à cocher "Ne plus afficher" [Retour en 8]

   
#### Détails techniques :
* Echantillonnage : LANDING
* Vente : SALE
* Type de vente : SALE_TYPE
* Priorité : RANK_ORDER
* Observé ? : PMFM à créer
* Raison de non observation : PMFM à créer avec les valeurs qualitatives suivantes : 
  * Pas d'apport
  * Accès au site impossible
  * Annulation observateur
  * Blocage de la profession
  * Autre
* Zone de pêche : PMFM à créer, prévoir une option pour définir le niveau de lieu

---

## Sortie > Echantillonnages en outremer

**REF: OBSVENTES/SORTIE/ECH_OUTREMER**

![ui-landings](/projects/obsvente/spe/images/landings-table-outremer.svg)

Le saisisseur accède à l'onglet "Echantillonnages" de l'écran de création d'une sortie.
La stratégie déterminée à partir des éléments définis sur la sortie permet de déterminer s'il s'agit d'une vente en métropole ou en outremer.

#### Scénario principal

1. Dans l'onglet "Echantillonnages", le saisisseur consulte la liste des espèces à observer. Pour chaque espèce, les informations suivantes sont affichées :
    * Espèce commerciale
    * Espèce scientifique
    * Observé ? (par défaut décoché)
    * Navire
    * Zone de pêche
    * Type de vente
    * Commentaire
2. Le saisisseur peut ajouter une espèce à échantillonner en cliquant sur le bouton :heavy_plus_sign:
3. Le saisisseur peut ajouter un lot d'espèces à échantillonner en cliquant sur le bouton (:heavy_plus_sign:)
    * L'écran **OBSVENTES/SORTIE/ECH_OUTREMER/AJOUT_LOT** s'affiche
4. Pour chaque espèce observée, le saisisseur coche la case "Observé ?"*
5. Le saisisseur enregistre les échantillonnages
6. Le bandeau de l'écran affiche "Lieu - Date"
7. L'encart sur le saisisseur s'affiche
8. Le saisisseur crée un lot d'espèces pour une espèce à observer (REF: OBSVENTES/SORTIE/VENTE/DETAILS)

---

## Sortie > Echantillonnages en outremer > Ajout par lot

**REF: OBSVENTES/SORTIE/ECH_OUTREMER/AJOUT_LOT**

![ui-landings-random-add](/projects/obsvente/spe/images/random-add.svg)

Pour ajouter des espèces à échantillonner, le saisisseur ouvre la fenêtre de sélection des espèces.

#### Scénario principal

La Fenêtre est composée de 2 onglets, "Historique" et "Recherche espèces".

1. Le saisisseur se positionne sur l'onglet "Historique"
2. Un tableau affiche les informations suivantes sur les dernières espèces qui ont été échantillonnées :
    * Une case à coche pour sélectionner l'espèce
    * Etat de la saisie
    * Nom commercial de l'espèce
    * Date heure de la dernière utilisation (avec le nombre de jours distant de la date actuelle)
    * Le nom du saisisseur ayant dernièrement utilisé l'espèce
3. Les espèces affichées sont celles dont la date d'utilisation est inférieure à un nombre de jours (paramétrable dans les options du programme)
4. Le saisisseur peut sélectionner une ou plusieurs espèces
    * A la sélection, la ou les espèces sont rajoutées dans le tableau afin d'être échantillonnées

    
---

## Sortie > Echantillonnages en outremer > Ajout par lot > Recherche

**REF: OBSVENTES/SORTIE/ECH_OUTREMER/AJOUT_LOT/SEARCH**

![ui-landings-random-add](/projects/obsvente/spe/images/random-add-search.svg)

#### Scénario principal

Pour ajouter des espèces à échantillonner, le saisisseur ouvre la fenêtre de sélection des espèces.

#### Scénario principal

La Fenêtre est composée de 2 onglets, "Historique" et "Recherche espèces".

1. Le saisisseur se positionne sur l'onglet "Recherche espèces"
2. La liste de toutes les espèces échantillonnables apparait dans le tableau
    * Il est possible de trier sur les colonnes suivantes
      * Code de l'espèce
      * Libellé de l'espèce
3. Le saisisseur peut rechercher une espèce en saisissant son code ou son libellé dans la zone de recherche
4. La liste des espèces affichées est filtrée suivant la saisie
5. Le saisisseur peut sélectionner l'espèce recherchée
   * A la sélection, l'espèce est rajoutée dans le tableau afin d'être échantillonnée

---

> Question MOE/EIS :
> 
> Faut il conserver une colonne "Etat" ? Oui s'il y a des espèces temporaires (mais que dans ObsMer)

## Vente > Détails.

**REF: OBSVENTES/SORTIE/VENTE/DETAILS**

![ui-obsvente](/projects/obsvente/spe/images/sale-details.svg)

La création d'un lot d'espèces est accessible depuis le tableau des échantillonnages en cliquant sur l'icône :page_facing_up:

#### Scénario principal

1. Le saisisseur demande la création d'un lot d'espèces
2. L'écran "Nouveau lot" s'ouvre, il est composé de 2 onglets :
   * "Détails" (onglet par défaut)
   * "Lots"
3. Sur l'onglet "Détails", le saisisseur renseigne les détails de la vente :
   * Le navire*
   * Le type de vente* (automatiquement renseigné avec le type de vente défini sur la sortie)
   * Le lieu de vente
   * La date/heure de vente*
   * Le type d'engin*
   * La zone de pêche
   * Commentaires
4. Le saisisseur clique sur l'onglet "Lots" (REF: OBSVENTES/SORTIE/VENTE/LOT)


**Variante(s) :**

**Variante 3a :** Remplissage auto de la date de la vente 

En mode terrain, il est possible d'activer une case à cocher, dans le bandeau de l'écran, permet d'initialiser la date/heure de la vente avec la date/heure courante (stocké dans les préférences locales).

> Réunion 21/05/2024    
Type de vente : 
> - Echantillonnages en Métropole  => OK
>  - Saisissable sur le détail de la sortie (obligatoire)
>  - Pré-renseigné de manière automatique (détail de la sortie) et modifiable dans le tableau des espèces.

> - Echantillonnages en Outre-mer
>  - Absent de la stratégie sur le détail de la sortie => Variante à faire
>  - Tableau d'échantillonnage : PMFM de type de vente avec bouton appliquer  => OK
>    - Renseigné sur chaque ligne et modifiable dans le tableau des espèces 


> Proposition MOE :

> Ne proposer le champs que sur la saisie d'une nouvelle vente

> Garder la valeur précédente pour la saisie d'une autre vente

> L'enlever du tableau et enlever la liste déroulante avec le bouton appliquer


> Saisissable détail de la sortie.
> Recopier dans la vente (non visible)
> MOE : Enlever le lieu de vente de la maquette => OK

> - MOA : Lieu de vente :
> Case à cocher en haut à option :  OK
> "Remplissage automatique de l'heure de la vente"
> Stockée dans les préférences locales

---
## Vente > Lots espèces

**REF: OBSVENTES/SORTIE/VENTE/LOT**

![ui-obsvente](/projects/obsvente/spe/images/sale.svg)

Le saisisseur accède à l'onglet "Lots" de l'écran de création des lots.

#### Scénario principal

1. L'onglet "Lots" s'ouvre. Les informations suivantes sont affichées pour chaque lot :
   * L'espèce commerciale
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le poids total (kg)* (saisit ou calculé à partir du taux et du poids échantillonnés)
   * Le taux échantillonné
   * Le poids échantillonné
   * Identification à confirmer
2. Le saisisseur demande la création d'un nouveau lot via l'icône :heavy_plus_sign:
3. L'espèce commerciale est automatiquement renseignée avec l'espèce du tableau des espèces à observer
4. Pour chaque lot, le saisisseur renseigne :
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le poids total (kg)* (saisit ou calculé à partir du taux et du poids échantillonnés)
   * Le taux échantillonné
   * Le poids échantillonné
   * Identification à confirmer
   * Selon les cas, l'ajout d'une photo sur le 1er individu de chaque lot est obligatoire, notamment pour les 1ères sorties 
5. Le saisisseur enregistre
6. Le bandeau de l'écran affiche "Lieu de sortie / Espèce / Navire (Immatriculation et nom)"
7. Le saisisseur ajoute des mesures individuelles (REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES)

**Variante(s) :**

**Variante a :** 
4. Le saisisseur copie/colle un lot pour faire une nouvelle saisie via la case à cocher d'une ligne puis l'icône de recopie [Retour en 5]

> Questions :
> - Cas des mélanges ? (ex: baudroie blanche/noire)
> - Pas de sous-échantillonnage ?
> - MOE : cas d'usage à faire sur le contrôle des données : Détecter les lots saisis en doublons, créer une clé unique à partir de la stratégie

> Réunion 21/05/2024 - POC à réaliser
> Ecran des mesures individuelles : 
> Compteur total sur le nombre d'individu (dans le bandeau à droite)
> Graphique à réaliser : Histogramme du nombre d'individu par classe de taille
> Le bouton d'affichage du graphique est disponible sur l'écran des mesures individuelles

---
## Vente > Lots espèces > Mesures individuelles

**REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES**

La création de mesures individuelles est accessible depuis le tableau de consultation des lots en cliquant sur l'icône :bar_chart:

#### Scénario principal

[Spécifications communes / Mesures](/projects/common/spe/regles_communes.md#commun-saisie-de-mensuration)

---
## Sortie > Contrôle de la saisie

**REF: OBSVENTES/SORTIE/CONTROLE**

![ui-obsvente](/projects/obsvente/spe/images/observed-location-control.svg)

Le contrôle de la saisie d'une sortie est accessible depuis l'écran de consultation d'une sortie en cliquant sur le bouton "Terminer la saisie"

#### Scénario principal

1. Le saisisseur clique sur le bouton "Terminer la saisie"
2. Un message indique les espèces ayant la case à cocher "Observé ?" décochée et une vente associée

---
## Règles métier

(en cours de rédaction)

Utiliser le moteur de règles : définir le contexte de la règle bloquante ou d'avertissement

> Règle(s) métier :
> - Contrôle poids:
>
> ```text
> Somme poids élevés ~= Poids total capture
> 
> Marge d'erreur x% 
> (x en variable d'exploitation)
> Warning non bloquant  
> ```
> - Saisie du taux d'échantillonnage :
>
> ```text
> - Soit rapport du poids
> - Soit saisie du taux 1/n
> - + Saisie du sous-taux 1/n
> ```

---
## Importation depuis ObsDeb

L'objectif du transfert ObsDeb - ObsVentes est de réduire le temps de saisie dans Obsventes des mensurations
effectuées par les observateurs dans ObsDeb.

#### Scénario principal

1. Les marées ObsDeb ayant la case "Marée à transférer dans Allegro-Obsvente" cochée et n'existant pas déjà dans
   la base Harmonie s'affiche (clé sur la vente : navire, lieu, date/heure) sont automatiquement importées dans ObsVentes. 
   Une marée ObsDeb modifiée ou complétée avec de nouvelles espèces ne sera pas ré importée (cf spec détaillée : 
   [Spécification transfert ObsDeb ObsVentes](/projects/obsvente/spe/transfert_obsdeb_obsventes.md))

---
## Référentiels

(en cours de rédaction)

---
## Historique

|       Date | Sections mises à jour                                                                 |
|-----------:|---------------------------------------------------------------------------------------|
| 11/09/2023 | Création                                                                              |
| 10/11/2023 | Ajout écrans Marée, Engins et OP                                                      |
| 14/12/2023 | Tableau des échantillonnages : distinction colonnes espèce commerciale/scientifique   |
