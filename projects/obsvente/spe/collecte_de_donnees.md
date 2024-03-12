# Collecte de données
## Spécifications (ObsVentes)

---
## Sommaire

- [Documents](#documents)
- [Lignes de plan](#lignes-de-plan)
- [Ergonomie générale](#ergonomie-générale)
- [Sorties](#sorties)
- [Sorties > Filtres](#sorties-filtres)
- [Sortie > Détails](#sortie-détails)
- [Sortie > Echantillonnages](#sortie-echantillonnages)
- [Lots espèces](#lots-espèces)
- [Mesures individuelles](#mesures-individuelles)
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
Version de tablette utilisée par BL : Samsung Active Tab (ith zoom) 991x580.

> Définir la résolution cible des saisisseurs

---
## Lignes de plan

- Fichier CSV importé dans WAO ObsVentes
- Possibilité de modifier/supprimer une ligne
- TODO : Mapping modèle WAO / 

> Code source : https://gitlab.ifremer.fr/sih/WAO

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
   * Le lieu de la sortie
   * La date/heure
   * Le ou les observateurs
   * Le saisisseur
   * Le commentaire

**Variante(s) :**

**Variante 1a :** Le saisisseur filtre les sorties (REF: OBSVENTES/SORTIES/FILTRES)

**Variante 1b :** Le saisisseur crée une nouvelle sortie (REF: OBSVENTES/SORTIE/DETAILS)

**Variante 1c :** Le saisisseur consulte une sortie existante

**Variante 1d :** Le saisisseur supprime une sortie existante

> Questions :
> - MOA : Renommer le programme SIH-OBSVENTE en SIH-OBSVENTES ? Impacts ?
> - MOA : Liste des colonnes exhaustive ?
> - MOA : Ajouter onglets avec l'ensemble des échantillonnages toutes sorties ?

---
## Sorties > Filtres

**REF: OBSVENTES/SORTIES/FILTRES**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-table-filters.svg)

Les filtres des sorties sont accessibles depuis le tableau de consultation des sorties via l'icône entonnoir.

#### Scénario principal

1. Le saisisseur filtre les sorties (REF: COMMUN/FILTRES). Les critères suivants sont disponibles :
   * Le programme de collecte
   * Le lieu de la sortie
   * La début de la période
   * La fin de la période
   * L'organisme du saisisseur
   * Le saisisseur
   * L'observateur
   * L'état de saisie

Les critères suivants sont multiples (dev en cours sur Imagine) : 
- L'organisme du saisisseur
- Le saisisseur
- L'observateur
- L'état de saisie


---
## Sortie > Détails

**REF: OBSVENTES/SORTIE/DETAILS**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-new.svg)

La création d'une sortie est accessible depuis le tableau de consultation des sorties via l'icône :heavy_plus_sign:

#### Scénario principal

1. Le saisisseur demande la création d'une nouvelle sortie
2. L'écran "Nouvelle sortie" s'ouvre, il est composé de 2 onglets :
    * "Détails" (onglet par défaut)
    * "Echantillonnages" (visible uniquement si le programme est renseigné)
3. Dans l'onglet "Détails", le saisisseur sélectionne :
    * Le programme de collecte*
    * Le lieu*
    * La date*
    * Le ou les observateurs*
4. La liste des espèces à observer (onglet "Echantillonnages") est automatiquement renseignée en fonction de la référence au plan sélectionnée (à confirmer pendant le dev)
5. La stratégie est automatiquement renseignée et les caractéristiques de la sortie s'affichent en fonction de la date sélectionnée
6. Le saisisseur renseigne les caractéristiques de la sortie
5. Le saisisseur enregistre
6. Le bandeau de l'écran affiche "Lieu - date"
7. Le saisisseur est positionné sur l'onglet "Echantillonnages"

**Variante(s) :**

**Variante 2a :** La sélection du filtre "Programme de collecte" sur le tableaux des sorties, renseigne automatiquement les champs suivants sur le formulaire en mode création :
- Programme de collecte
- Observateur
- Date

#### Détails techniques :
* Sortie : OBSERVED_LOCATION
* Type de vente : PMFM à créer, pointe vers SALE_TYPE
* Caractéristiques de la vente :
    * Origine : PMFM_STRATGY avec :
        * STRATEGY.PROGRAM_FK "SIH-OBSVENTE"
        * APPLIED_PERIOD.START_DATE <= date de vente < APPLIED_PERIOD.END_DATE + 1 où APPLIED_PERIOD.APPLIED_STRATEGY_FK = APPLIED_STRATEGY.ID
        * PMFM_STRATGY.ACQUISITION_LEVEL_FK = SALE_SURVEY ou OBSERVED_SALE
    * Caractère obligatoire : PMFM_STRATGY.IS_MANDATORY
    * Ordre d'affichage : PMFM_STRATGY : RANK_ORDER

> Questions :
> - MOA : Ajouter les champs : type de sortie, disponibilité de la fiche pré-vente (cf doc de Johanna) ?
> - MOA : Autoriser l'ajout de carac non définies dans la stratégie ?
> - ISI : Programme de rattachement : Information doublonnée (SAMPLING_SCHEME + SALE_MEASUREMENT) pour la stratégie depuis 2017 ?
> - ISI : Liste d'espèces à observer + liste PETS : traitement qui intègre les données dans SAMPLING_STRATA ou DENORMELIZED_SAMPLING_STRATA ? A approfondir
> - EIS : Stocker la ligne de plan dans OBSERVED_LOCATION.SAMPLING_STRATA_FK ?

---

## Sortie > Echantillonnages

**REF: OBSVENTES/SORTIE/VENTE**

![ui-landings](/projects/obsvente/spe/images/landings-table.svg)

#### Scénario principal

Le saisisseur clique sur l'onglet "Echantillonnages" de l'écran de création de sortie.

1. Dans l'onglet "Echantillonnages", le saisisseur consulte la liste des espèces à observer (espèce commerciale + espèce scientifique)
2. Le type de vente est automatiquement renseignée avec le type de vente sélectionnée sur la sortie
3. Pour chaque espèce observée, le saisisseur :
   * Coche la case "Observé ?"*
   * Sélectionne le navire*
   * Modifie le type de vente
   * Saisit un commentaire
4. Pour chaque espèce non observée, le saisisseur :
   * Sélectionne une raison de non observation*
   * Saisit un commentaire
5. Le saisisseur enregistre l'échantillon observé
6. Le bandeau de l'écran affiche "Lieu - Date"
7. L'encart sur le saisisseur s'affiche
8. Le saisisseur crée un lot d'espèces pour une espèce à observer (REF: OBSVENTES/SORTIE/VENTE/LOT)

**Variante(s) :**

**Variante 3a :** Des PETS (espèces sensibles) sont présents sur le lieu de la vente, le saisisseur privilégie les mensurations de ces espèces 
par rapport à celles définies dans la liste des espèces à observer

**Variante 3b :** La vente a lieu en métropole, le protocole métropole s'applique et contient les informations suivantes (_non applicable pour le protocole d'Outre-Mer_) :
- La priorité des espèces  à observer
- Nombre d'espèces minimum à observer
- Nombre d'espèces maximum à observer

#### Détails techniques :
* Echantillonnage : LANDING
* Vente : SALE
* Priorité : RANK_ORDER
* Observé ? : PMFM à créer
* Raison de non observation : PMFM à créer

> Questions :
> - MOA : une espèce peut-elle être observée sur plusieurs navires ?
> - MOA : liste des raisons de non observation ?
> - MOA : Notion d'inventaire exhaustif à ajouter ?

---
## Lots espèces

**REF: OBSVENTES/SORTIE/VENTE/LOT**

![ui-obsvente](/projects/obsvente/spe/images/pv.svg)

La création d'un lot d'espèce est accessible depuis le tableau de consultation des espèces à observer en double-cliquant 
sur une espèce puis en cliquant sur le bouton :heavy_plus_sign:

#### Scénario principal

1. L'espèce commerciale est automatiquement renseignée avec l'espèce du tableau des espèces à observer
2. Pour chaque lot, le saisisseur renseigne :
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le poids total (kg)* (saisit ou calculé à partir du taux et du poids échantillonnés)
   * Le taux échantillonné
   * Le poids échantillonné
   * Si l'espèce est identifiée (case à cocher)
3. Le saisisseur enregistre
4. Le bandeau de l'écran affiche "Lieu de sortie / Espèce / Navire (Immatriculation et nom)"
5. Le saisisseur ajoute des mesures individuelles (REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES)

**Variante(s) :**

**Variante 4a :** Le saisisseur copie/colle un lot pour faire une nouvelle saisie via la case à cocher d'une ligne puis l'icône de recopie

> Questions :
> - MOA : valeur par défaut état et présentation ?
> - Cas des mélanges ? (ex: baudroie blanche/noire)
> - Pas de sous-échantillonnage ?
> - ISI : cas d'usage à faire sur le contrôle des données : Détecter les lots saisis en doublons, créer une clé unique à partir de la stratégie

---
## Mesures individuelles

**REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES**

![ui-obsventes](/projects/common/spe/images/individual-measures.svg)

La création de mesures individuelles est accessible depuis le tableau de consultation des lots en cliquant sur l'icône :bar_chart:

#### Scénario principal

1. Pour chaque mesure individuelle, le saisisseur renseigne :
   * L'espèce scientifique
   * Le sexe
   * La taille

> Questions/Points de vigilance :
> - Ichtyomètre électronique : connexion bleutooth (gwaleen) uniquement en mode tablette + usb pour le mode bureau ?
> - Caisse de **mélange**: possible au sein d'un même espèce commerciale : Dans ce cas, il faut pouvoir choisir une espèce scientifique en dehors de l'espère commerciale (**non prioritaire**)

**Variante(s) :**

**Variante 5a :** Contrôle des valeurs saisies
La stratégie permet de définir des bornes minimales et maximales sur la longueur et les poids, globalement ou par espèce.
NB : Si la vérification est bloquante, il faut prendre des bornes assez larges

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

1. Le saisisseur clique sur le bouton d'import des données ObsDeb
2. La liste des marées ObsDeb ayant la case "Marée à transférer dans Allegro-Obsvente" cochée et n'existant pas déjà dans 
la base Harmonie s'affiche (clé sur la vente : navire, lieu, date/heure). Une marée ObsDeb modifiée ou complétée avec de 
nouvelles espèces ne sera pas présente dans la liste.
3. Le saisisseur coche les marées à importer dans ObsVentes
4. Le saisisseur valide l'import
5. Les ventes sont importées dans ObsVentes (cf spec détaillée : [Spécification transfert ObsDeb ObsVentes](/projects/obsvente/spe/transfert-obsdeb_obsventes.md))

> Questions :
> - MOA : conserver ce fonctionnement ou mettre en place un import automatique ?

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
