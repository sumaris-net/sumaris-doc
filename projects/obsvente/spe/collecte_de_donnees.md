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
- [Sortie > PETS](#sortie-pets)
- [Vente > Détails](#vente-détails)
- [Vente > Lots espèces](#vente-lots-espèces)
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
>   - Proposition 2 : inder les porteuilles de navires dans ES -> L'indexation est réalisée une fois par jour, la modification des droits n'est donc pas prise en compte instantanément. Fin. Couteux ?
> - MOA : Validation des données : qui valide (responsable de programme et/ou coordinateur) ? comment ?
> - MOA : Fonctionnalités utilisées : données temporaires (navires, personnes, taxons, groupes de taxons, engins) ?

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
> - ISI : Analyser le renommage du programme SIH-OBSVENTE en SIH-OBSVENTES (impact + chiffrage) ?
> - Saisisseur : Ajouter onglet avec l'ensemble des échantillonnages toutes sorties ? (cf Imagine)
> - MOA/EIS : Ajout du plan d'échantillonnage ? Impact côté Imagine ?

---
## Sorties > Filtres

**REF: OBSVENTES/SORTIES/FILTRES**

![ui-obsventes](/projects/obsvente/spe/images/observed-location-table-filters.svg)

Les filtres des sorties sont accessibles depuis le tableau de consultation des sorties via l'icône entonnoir.

#### Scénario principal

1. Le saisisseur filtre les sorties (REF: COMMUN/FILTRES). Les critères suivants sont disponibles :
   * Le programme de collecte
   * L'origine
   * L'état de saisie
   * Le lieu de la sortie
   * La début de la période
   * La fin de la période
   * L'organisme du saisisseur
   * Le saisisseur
   * L'observateur

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
    * "<Autres espèces> (PETS)" (visible uniquement si la caractéristique "PETS" est à "Oui")
3. Dans l'onglet "Détails", le saisisseur sélectionne :
    * Le programme de collecte*
    * Le plan d'échantillonnage*
    * Le lieu*
    * La date de début*
    * La date de fin*
    * Le ou les observateurs*
4. L'origine est automatiquement renseignée en fonction du programme de collecte
5. La liste des espèces à observer (onglet "Echantillonnages") est automatiquement renseignée en fonction de la référence au plan sélectionnée (à confirmer pendant le dev)
6. La stratégie est automatiquement renseignée et les caractéristiques de la sortie s'affichent en fonction de la date sélectionnée
7. Le saisisseur renseigne les caractéristiques de la sortie
8. Le saisisseur enregistre
9. Le bandeau de l'écran affiche "Lieu - date"
10. Le saisisseur est positionné sur l'onglet "PETS" si la caractéristique "PETS" est à "Oui", "Echantillonnages" sinon

**Variante(s) :**

**Variante 2a :** La sélection du filtre "Programme de collecte" sur le tableau des sorties, renseigne automatiquement les champs suivants sur le formulaire en mode création :
  * Programme de collecte 
  * Observateur 
  * Date

#### Détails techniques :
* Sortie : OBSERVED_LOCATION
* Origine : POC à prévoir : créer une table OBSERVED_LOCATION_ORIGIN liée à OBSERVED_LOCATION ? Non-modifiable. 
Sera également utilisé dans Imagine pour distinguer les données Obsbio de Campagne
* Type de vente : PMFM à créer, pointe vers SALE_TYPE
* Disponibilité de la fiche de pré-vente : PMFM à créer, QUALITATIVE_VALUE à créer (oui/non)
* Caractéristiques de la vente :
    * Origine : PMFM_STRATEGY avec :
        * STRATEGY.PROGRAM_FK "SIH-OBSVENTE"
        * APPLIED_PERIOD.START_DATE <= date de vente < APPLIED_PERIOD.END_DATE + 1 où APPLIED_PERIOD.APPLIED_STRATEGY_FK = APPLIED_STRATEGY.ID
        * PMFM_STRATEGY.ACQUISITION_LEVEL_FK = SALE_SURVEY ou OBSERVED_LOCATION
    * Caractère obligatoire : PMFM_STRATEGY.IS_MANDATORY
    * Ordre d'affichage : PMFM_STRATEGY : RANK_ORDER

> Questions :
> - ISI : Programme de rattachement : Information doublonnée (SALE + SALE_MEASUREMENT) pour la stratégie depuis 2017 ?
> - ISI : Liste d'espèces à observer + liste PETS : traitement qui intègre les données dans SAMPLING_STRATA ou DENORMALIZED_SAMPLING_STRATA ? A approfondir
> - MOA : Validation observateur, Validation société : conserver ces PMFM ou les remplacer par le processus de contrôle des données de Sumaris ? 
>  - Ces champs sont-ils utilisés par les rapports Birt ?
>  - Y a t-il une validation (donnée unitaire) ou une qualification (ensemble de données) côté Ifremer ?
>  - Détail du processus de validation des données de Sumaris : l'observateur termine la saisie puis le coordinateur (prestataire) valide les données

---

## Sortie > Echantillonnages

**REF: OBSVENTES/SORTIE/ECH**

![ui-landings](/projects/obsvente/spe/images/landings-table.svg)

#### Scénario principal

Le saisisseur clique sur l'onglet "Echantillonnages" de l'écran de création de sortie.

1. Dans l'onglet "Echantillonnages", le saisisseur consulte la liste des espèces à observer. Les informations suivantes sont affichées pour chaque espèce :
   * Espèce commerciale
   * Espèce scientifique
   * Observé ? (par défaut décoché)
   * Raison de non observation
   * Navire
   * Zone de pêche
   * Type de vente
   * Commentaire
2. Pour chaque espèce observée, le saisisseur coche la case "Observé ?"*
3. Pour chaque espèce non observée, le saisisseur :
   * Sélectionne une raison de non observation*
   * Saisit un commentaire
4. Le saisisseur enregistre l'échantillon observé
5. Le bandeau de l'écran affiche "Lieu - Date"
6. L'encart sur le saisisseur s'affiche
7. Le saisisseur crée un lot d'espèces pour une espèce à observer (REF: OBSVENTES/SORTIE/VENTE/LOT)

**Variante(s) :**

**Variante 3a :** Des PETS sont présents sur le lieu de la vente, le saisisseur privilégie les mensurations de ces espèces 
par rapport à celles définies dans la liste des espèces à observer (REF: OBSVENTES/SORTIE/VENTE_AUTRES)

**Variante 3b :** La vente a lieu en métropole, le protocole métropole s'applique et contient les informations suivantes (_non applicable pour le protocole d'Outre-Mer_) :
- La priorité des espèces  à observer
- Nombre d'espèces minimum à observer
- Nombre d'espèces maximum à observer

**Variante 3c :** Un warning apparait lorsque le saisisseur accède à la vente d'une espèce sans avoir coché la case "Observé ?".
Le warning peut être omis en cliquant sur la case à cocher "Ne plus afficher"

#### Détails techniques :
* Echantillonnage : LANDING
* Vente : SALE
* Priorité : RANK_ORDER
* Observé ? : PMFM à créer
* Raison de non observation : PMFM à créer
* Zone de pêche : PMFM à créer, prévoir une option pour définir le niveau de lieu

> Questions :
> - MOA : Inverser l'ordre des onglets "Echantillonnages" et "PETS" ?
> - MOA : Liste des raisons de non observation ?

---

## Sortie > PETS

**REF: OBSVENTES/SORTIE/ECH_AUTRES**

**PETS** : Protected Endangered and Threatened Species. Dans le cadre de l’EU-MAP et de sa révision pour la période 
2022-2027, la liste des espèces protégées à suivre est établie en vertu de la législation de l‘Union et des accords 
internationaux. Elle fait référence aux listes des deux conventions internationales OSPAR (région I à V) et UNEP
(Méditerranée) et des organisations régionales des pêches NEAFC (=Liste OSPAR), ICCAT et GFCM (= Liste UNEP). Ces 
espèces sont des espèces d’élasmobranches et d’amphihalins, prélevées en prises accessoires ou accidentelles de la pêche 
professionnelle

![ui-landings](/projects/obsvente/spe/images/landings-others-table.svg)

#### Scénario principal

Le saisisseur clique sur l'onglet "<Autres espèces> (PETS)" de l'écran de création de sortie.

1. Dans l'onglet "<Autres espèces> (PETS)", le saisisseur ajoute les PETS observés. Les informations suivantes sont affichées pour chaque espèce :
    * Espèce commerciale
    * Espèce scientifique
    * Navire
    * Zone de pêche
    * Type de vente
    * Commentaire
2. Pour chaque PETS, le saisisseur renseigne :
   * L'espèce commerciale*
   * L'espèce scientifique
3. Le saisisseur enregistre l'échantillon observé
4. Le saisisseur crée un lot d'espèces pour un PETS (REF: OBSVENTES/SORTIE/VENTE/LOT)

**Variante(s) :**

**Variante 4a :** Le saisisseur supprime un PETS

> Qusetions :
> - MOA : Pas de PETS en outremer ?

#### Détails techniques :
* Nom de l'onglet : il fait partie du dictionnaire thématique. Dans le cas d'ObsVentes, le nom sera "PETS"
* Echantillonnage : LANDING
* Vente : SALE
* Espèce commerciale et scientifique : liste des PETS issue de WAO, la liste des PETS varie suivant le lot (façade maritime)
* Zone de pêche : PMFM à créer, prévoir une option pour définir le niveau de lieu

---
## Vente > Détails

**REF: OBSVENTES/SORTIE/VENTE/DETAILS**

![ui-obsvente](/projects/obsvente/spe/images/sale-details.svg)

La création d'un lot d'espèces est accessible depuis le tableau de consultation des espèces à observer en cliquant
sur l'icône :page_facing_up:

#### Scénario principal

1. Le saisisseur demande la création d'un nouveau lot d'espèces
2. L'écran "Nouveau lot" s'ouvre, il est composé de 2 onglets :
   * "Détails" (onglet par défaut)
   * "Lots"
3. Sur l'onglet "Détails", le saisisseur renseigne les détails de la vente :
   * Navire*
   * Type de vente* (automatiquement renseigné avec le type de vente défini sur la sortie)
   * Lieu de vente* (automatiquement renseigné avec le lieu de la sortie)
   * Date/heure* (automatiquement renseigné ?)
   * Zone de pêche
   * Commentaires
4. Le saisisseur clique sur l'onglet "Lots" (REF: OBSVENTES/SORTIE/VENTE/LOT)

> Questions : 
> - MOA : Type de vente : 
>   - Initialisé avec le type de vente défini sur la sortie
>   - Modifiable sur la vente ?
>   - Si modification du type de vente sur la sortie alors répercution sur les ventes existantes ?
> - MOA : Lieu de vente :
>   - Initialisé avec le lieu défini sur la sortie
>   - Modifiable sur la vente ?
>   - Si modification du lieu sur la sortie alors répercution sur les ventes existantes ?
> - MOA : Date de vente : notion différente de la date de la sortie ? Reboucler avec les saisisseurs (action Marion)

---
## Vente > Lots espèces

**REF: OBSVENTES/SORTIE/VENTE/LOT**

![ui-obsvente](/projects/obsvente/spe/images/sale.svg)

#### Scénario principal

1. Le saisisseur demande la création d'un nouveau lot via l'icône :heavy_plus_sign:
2. L'espèce commerciale est automatiquement renseignée avec l'espèce du tableau des espèces à observer
3. Pour chaque lot, le saisisseur renseigne :
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le poids total (kg)* (saisit ou calculé à partir du taux et du poids échantillonnés)
   * Le taux échantillonné
   * Le poids échantillonné
   * Identification à confirmer
4. Le saisisseur enregistre
5. Le bandeau de l'écran affiche "Lieu de sortie / Espèce / Navire (Immatriculation et nom)"
6. Le saisisseur ajoute des mesures individuelles (REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES)

**Variante(s) :**

**Variante 4a :** Le saisisseur copie/colle un lot pour faire une nouvelle saisie via la case à cocher d'une ligne puis l'icône de recopie

> Questions :
> - Cas des mélanges ? (ex: baudroie blanche/noire)
> - Pas de sous-échantillonnage ?
> - ISI : cas d'usage à faire sur le contrôle des données : Détecter les lots saisis en doublons, créer une clé unique à partir de la stratégie

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
