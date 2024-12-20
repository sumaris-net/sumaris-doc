## Spécifications des règles d'ergonomie (ObsMer, ObsVente, Calendrier d'activité)

Cette partie décrit les règles d'ergonomie communes aux applications <b>ObsMer</b>, <b>ObsVente</b>, <b>Calendrier d'activité</b>


---
## Sommaire
- [test](#commun--saisie-de-mensuration)
- [Spécificités techniques](#spécificités-techniques)
- [Commun > Ergonomie > principes généraux](#commun--ergonomie-principes-généraux)
- [Commun > Ergonomie > Connexion à l'application](#commun--ergonomie-connexion-à-l-application)
- [Commun > Application des filtres](#commun--application-des-filtres)
- [Commun > Epingler un élément](#commun--epingler-un-élément)
- [Commun > Extraction](#commun--extraction)
- [Commun > Saisie de mensuration](#commun--saisie-de-mensuration)
- [Commun > Fin d'une saisie](#commun--fin-d-une-saisie)
- [Commun > Ajout de PSFM](#commun--ajout-de-psfm)
- [Commun > Stratégie](#commun--stratégie)
- [Commun > Formulaires](#commun--formulaires)
- [Commun > Saisisseur](#commun--saisisseur)
- [Commun > Enregistrement automatique](#commun--enregistrement-automatique)
- [Commun > Suppression](#commun--suppression)
- [Commun > Utilisation de données temporaires](#commun--utilisation-de-données-temporaires)
- [Commun > Régionalisation](#commun--régionalisation)

## Spécificités techniques

**REF: COMMUN/TECHNIQUE**

### Instance

> Proposition à valider :
>
> Afin de pouvoir assurer une mise en production en minimisant les impacts sur les autres volets d'Allegro,
> il y aura 2 instances distinctes jusqu'à ce que les 3 volets soient stabilisés :
> - Une instance dédiée aux calendriers d'activité
> - Une instance dédiée à OsbMer et ObsVentes qui sont complémentaires

>Lorsque les 3 volets seront stabilisés, les 3 volets seront regroupés sur une seule instance.

### Schéma

> A définir : SUMARIS_MAP ou ADAGIO patché ?


## Commun > Ergonomie > principes généraux

**REF: COMMUN/ERGONOMIE/PRINCIPES**

- Les champs obligatoires sont suffixé par un * (en rouge dans Allegro V2)
  - S'ils ne sont pas renseignés lors de la saisie, ils apparaissent en rouge
- Les champs calculés sont en italique et la police est de couleur bleu
- Les champs non saisissables sont affichés avec une police de couleur grise
- Les préconisations de saisies sont affichées en blanc sur fond rouge
- Il est possible d'activer des fonctionnalités par des raccourcis clavier
  - Touche "Ctrl" + Lettre surligné du bouton
- Dans un écran de saisi, il est possible de passer à l'élément suivant par la touche TAB du clavier
- Les données sous forme de tableau
    - Tri des données (croissant/décroissant) : Une flèche indique le sens du tri passage de la souris sur le nom de la colonne triable
      - Toutes les colonnes peuvent être triées
    - Affichage/masque de colonnes : Un bouton offre la possibilité d'afficher ou de masquer des colonnes dans une vue tabulaire
      - A la prochaine connexion, le paramétrage sur les colonnes est appliqué
    - Les listes des marées, engins, opérations peuvent être restreintes en appliquant des filtres sur les données
- Les caractéristiques (PSFM) obligatoires (*) sont affichée en tête de liste
    - Cela se configure dans le programme, section "configuration des PSFM"
- Pour les champs réliés à un référentiel, un filtre s'applique sur le 1er premier caractère saisi
  - L'utilisation du caractère * permet de rechercher sur tout le libellé
- Il faut afficher uniquement les colonnes PSFM ayant une valeur
- Dans un écran de saisie, le bouton "Sauvegarder" est actif lorsque tous les champs obligatoires ont été saisis

> **Remarques ISI** :

> ISI : A complèter par rapport à l'existant dans Allegro V2

> ISI -> EIS : Toutes les colonnes peuvent être triées (à confirmer)
>
> Ou se paramètre le tri sur les colonnes ? 


## Commun > Ergonomie > Connexion à l'application

**REF: COMMUN/ERGONOMIE/CONNEXION**

![ui-main_connexion](/projects/common/spe/images/main-login-connect.svg)

L'interface est composée des éléments graphiques suivants :
1. Champ texte pour renseigné son "Identifiant *"
2. Champ texte pour renseigné son "Mot de passe *"
3. Une lite déroulante avec le choix du noeud
4. Un bouton "Annuler"
5. Un bouton "Se connecter"

#### Scénario principal

1. L'observateur renseigne son identifiant (Compte intranet de l'Ifremer)
2. L'observateur renseigne son mot de passe
3. L'observateur sélectionne le noeud de connexion dans la liste déroulante (ObsMer, ObsVente)
4. Le bouton "Se connecter" est actif une fois que les champs obligatoires ont été renseignés

Une fois la connexion validée, l'interface graphique de l'application s'adapte par rapport à la configuration sélectionnée ("noeud") :
- Titres,
- Logos,
- Menu,
- ...

Le noeud est stocké dans les paramètres locaux (local setting) du navigateur.

**Variante(s) :**

**Variante 3a** - Connexion suivantes : Aux connexionx suivantes, l'observateur est directement positionné sur le précédent noeud qu'il avait choisit lors
de sa précédente connexion.


---
## Commun > Gestion des droits

**REF: COMMON/USERS_RIGHTS**

![ui-common-rights](/projects/common/spe/images/obsmer-obsventes-users-rights.svg)

(1) :
* Si l'utilisateur est de la société Ifremer, il voit toutes les ventes
* Si l'utilisateur n'est pas de la société Ifremer, il voit uniquement les ventes associées à sa société, en consultatio

(2) : Seules les données non validées peuvent être modifiées ou supprimées


## Commun > Application des filtres

**REF: COMMUN/FILTRES**

Il est possible d'appliquer des filtres sur les marées et les opérations.

**ACCESSIBILITE : MAREES, OPERATIONS** 

**ACTEURS : OBSERVATEUR**

#### Scénario principal

1. L'utilisateur clique sur le bouton du filtre
2. L'écran affiche les paramètres sur lesquels appliquer un filtre
3. Le nombre d'élements avant l'application du filtre est affiché en bas de la fenêtre
4. L'utilisateur clique sur le bouton "Appliquer"
   * Le filtre est appliqué : la liste est restreinte selon les critères de filtrage
   * Le nombre de champs utilisés pour le filtrage est affiché sur l'icône du filtre
   * Un bouton apparait à côté du bouton de filtrage, permettant d'effacer le filtre appliqué
5. L'utilisateur clique sur le bouton de suppression du filtre
   * La liste des élements est affichée dans sa totalité

La validation d'une saisie supprime le filtre précédemment appliqué (cas particulier, variante de terminaison de saisie)

**Variante(s) :**

_interface à réaliser_

**Variante 1a**

Le filtre peut être enregistré pour être ré-appliqué par la suite (dev en cours sur Quadrige, nécessité ajout d'une table
qui contient les champs filtrés et les valeurs sous forme de flux JSON)

**Variante 2a**

Les filtres peuvent être multiples sur certains champs définis dans le code (dev en cours sur Imagine)


> **Remarques** : 

> ISI : A mettre en variante la fin de saisie qui supprime les filtres appliqués ?

> Les développements sur l'enregistrement des filtres sont en cours côté Quadrige.


## Commun > Epingler un élément

**REF: COMMUN/EPINGLER**

![main-tree-pin](/projects/common/spe/images/main-tree-pin.svg)

Il est possible d'épingler des éléments (marées, opérations) dans l'arbre du menu de façon
à les rendre toujours visibles pour y accèder facilement.

#### Scénario principal

L'observateur passe le pointeur de la souris sur un élément du menu. 
1. Une épingle apparait
2. L'observateur clique sur l'épingle
3. L'élément épinglé reste affiché et est accessible, même si l'observateur sélectionne un autre élement. 

## Commun > Extraction

**REF: COMMUN/EXTRACTION**

_A mettre dans une partie validation de données_

**ACTEURS : SUPERVISEUR, VALIDATEUR**

> **Réunion MOA 06/02/2024** :

> Version 2 :
> 
> Prevoir un mécanisme pour rechercher rapidement la données et la corriger
> 
> Pouvoir facilement identifier une marée ou une opération sur la saisie d'une espèce.
>
> Réel besoin des MOAs pour par exemple connaitre comment les espèces sont exploitées)
>
> - Avoir un tableau avec les opérations toutes marées confondues
> - Avoir un accès aux téléchargements avec un lien qui renvoie vers le formulaire de saisie
> - Avoir un lien dans Valparaiso qui renvoie vers le formulaire de saisie
>
> MOA -> OBS : Demander aux observateurs les besoins en filtrage sur les données


## Commun > Saisie de mensuration

**REF: COMMUN/MESURES**

**Saisie de mesures individuelles**

![ui-common-mesures](/projects/common/spe/images/individual-measures.svg)

La création de mesures individuelles est accessible depuis les tableaux de consultation des lots en cliquant sur l'icône :bar_chart:

L'écran affiche 3 choix de saisie de mensuration pour l'espèce commerciale : 
- Saisie de mesures individuelles (écran par défaut :memo:)
- Saisie par dénombrement sur classement numérique (Activable par le bouton :clipboard:) 
- Saisie par effectif du lot (Cas d'usage Obsventes)

L'écran permet de saisir soit des mesures individuelles, soit un dénombrement.

L'écran affiche par défaut la saisie de mesures individuelles.

1. L'écran est composé d'un tableau des mesures et d'une zone de saisie de mesures.
2. Une liste déroulante permet de sélectionner, pour l'espèce commerciale, le critère de classement de mesure
    * Dès qu'une mensuration est saisie, il n'est plus possible de modifier ce critère de classement
3. La zone de saisie de mesure est composée des champs suivants :
    * Le choix du nom de l'espèce scientifique
      * Une case à cocher permet de figer la valeur sélectionnée. En cas de nouvel ajout, la liste sera automatiquement positionnée sur cette valeur.
    * Le sexe de l'espèce mesurée
    * La longueur totale mesurée (dépend du choix du critère de classement)
    * Le nombre d'individu
        * Une case à cocher permet de figer la valeur sélectionnée. En cas de nouvel ajout, le champ sera automatiquement renseigné avec cette valeur.
    * Le poids calculé RTP (Relation taille poids) en kg
      * Ce poids RTP est automatiquement calculé (affiché en bleu en italique)
4. Un bouton permet d'ajouter la mesure individuelle saisit
    * Une ligne est ajoutée au tableau
5. Une case à cocher permet de sélectionner une ou plusieurs mesures pour ensuite les supprimer en cliquant sur l'icône "corbeille"
6. Un bouton permet d'afficher un graphique présentant le nomnbre d'individu par classe de taille (histogramme)
7. Un compteur est incrémenté à chaque ajout de nouvelle mensuration

**Saisie de dénombrement**

**Variante 1a** : Saisie des mensurations par dénombrement

1. L'observateur clique sur le bouton :clipboard:
2. L'écran de création du dénombrement par classe de mensuration s'ouvre.

![ui-common-mesures-enumerations](/projects/common/spe/images/numerical-classification.svg)

3. L'écran est composé des éléments suivants :
    * Le choix du nom de l'espèce scientifique
    * Le critère de classement
    * La méthode de classement
    * L'unité de classement
    * Les bornes minimale et maximale des mensurations
    * L'instrument de mesure

Le choix du critère de classement se fait parmi une liste déroulante affichant, pour chaque critère à sélectionner : 
- Le paramètre
- Le support
- La fraction
- La méthode

![ui-common-mesures-enumerations-criteria-selection](/projects/common/spe/images/numerical-classification-criteria-selection.svg)

4. A la validation de la fenêtre de création de classe de dénombrement, la fenêtre de saisie des mensurations individuelles est remplacée par la fenêtre de saisie des dénombrements ci dessous :

![ui-common-mesures-enumerations](/projects/common/spe/images/numerical-enumeration.svg)

1. Le paramètre de mensuration et la méthode d'analyse sont affichés et ne sont pas modifiables
2. L'observateur peut, pour chaque classe de mesure :
    * Saisir un nombre d'individu 
3. Le poids calculé RTP est automatiquement calculé pour chaque dénombrement
4. Un compteur, auto incrémenté et non modifiable, rappel le nombre d'invididu total saisi

Un clique sur le bouton :memo: permet à l'observateur d'afficher le mode de saisie de mesures individuelles.


**Variante 1b** : Modification du type de saisie sur une saisie en cours

Sur l'écran de saisi des mesures individuelles : 

1. L'observateur à saisi des mesures individuelles
2. Les mesures sont présentes dans le tableau
3. L'observateur clique sur le bouton de saisi de dénombrement
4. La fenêtre de saisie de dénombrement s'ouvre
5. Un message d'avertissement (texte de couleur blanche surligné en rouge) indique à l'observateur que des mensurations ont été saisies.
    * La saisie d'un dénombrement effacera les mensurations précédemment saisies

![ui-common-mesures-enumerations-edit-warning](/projects/common/spe/images/numerical-classification-warning.svg)


**Saisie de quantité (ObsMer)**


**Variante 1c** : Saisie des effectifs 

Cette option n'est **accessible** que depuis le **volet ObsMer**, ou l'on peut saisir un effectif d'une espèce scientifique sans aucune mesure associée.

![ui-common-mesures-effectives](/projects/common/spe/images/individual-measures-effective.svg)

Sur l'écran de saisi des mesures individuelles, il est possible, par un radio bouton, de sélectionner une saisie par effectif sur l'espèce scientifique.

1. L'observateur sélectionne l'option "Effectif"
2. La fenêtre de saisie est modifiée et affiche les éléments suivants : 
    * Le choix du nom de l'espèce scientifique
    * Une zone de saisie du nombre d'individus observés
3. Le tableau des mesures est modifié et 2 colonnes sont affichées :
    * Le nom de l'espèce scientifique
    * Le nombre de l'effectif des individus observés


### CRR Réunion du 13/08/2024 (Avec Elise Bultel)

- Poids de référence: faut-il pouvoir choisir la méthode "Déclaration par un observateur"
  - Oui pour les DOM
- Y a t il un protocol à appliquer par espèce ? (Saisie sur sexe par exemple)
  - Oui avec les crevettes en Outre Mer (saisie de la phase de maturité)
  - A mettre en place
- DOM : Pouvoir saisir plusieurs métiers pour une même espèce. Le modèle permet il de stocker cela ?
- Terminologie du programme SIH-OBSVENTES - Souhait important de la MOA : 
  - Etudier l'impacte d'un passage du nom de programme ObsVente à ObsVentes dans tout Harmonie (voir avec Glenn)
  - Si complexe : faire en sorte que Sumaris affiche ObsVentes (voir avec Benoit)
- Renommer le PMFM PARAMETER_FK like 'MATURITY_STAGE_%' : Stade en Phase (Attente retour Elise puis valider avec Armelle)
- Génération du rapport de collecte remplit : MOA à une préférence pour la vue tableau (à confirmer le 10/09/2024)

## Commun > Fin d'une saisie

**REF: COMMUN/SAISIE/TERMINER**

Le bouton est présent sur les écrans de saisie des marées et des opérations.

1. L'utilisateur termine sa saisie en cliquant sur le bouton "Terminer saisie".
2. Le système contrôle les données saisie.
3. S'il a détecté une erreur, il indique un message explicite et propose de corriger l'erreur.

**Variante(s) :**

**Variante 1a** - En mode de saisie bureau le contrôle plus stricte sur la saisie qu'en mode terrain.
Par exemple en mode saisie terrain, le lieu de retour de marée n'est pas obligatoire alors qu'en mode bureau oui.

**Variante 1b** - Sur la validation de saisie d'une marée, le contrôle valide la saisie des opérations avec détection des erreurs.


## Commun > Ajout de PSFM

**REF: COMMUN/PSFM/AJOUT**

**PSFM** :  Quadruplet paramètre/support/méthode/fraction. Ce quadruplet est systématiquement associé aux résultats et décrit précisemment les conditions de mesure/d'analyse de ceux-ci.

![ui-psfm-ajout](/projects/common/spe/images/pmfm-add.svg)

L'écran d'ajout de PSFM est disponible pour ajouter des caractéristiques à saisir sur les écrans suivants :
- Caractéristiques des marées
- Caractéristiques des engins
- Caractéristiques des lots

#### Scénario principal

L'écran affiche la liste des PSFMs, disponible pour la stratégie, qu'il est possible d'ajouter.
1. Les attributs suivants des PSFMs sont affichés :
    * Le libellé
    * L'unité
    * Le support
    * La fraction
    * La méthode de collecte
2. Une zone de saisie permet de rechercher les PSFMs par leur code ou leur libellé
    * L'observateur saisie un code ou un libellé et valide avec la touche "Entrée"
      * La liste des PSFMs se met à jour avec les résultats de la recherche
3. Une liste déroulante permet de filtrer les PSFMs selon leur état
    * Par défaut un filtre est positionné sur la valeur de l'état "Actif à la saisie". Seuls les PSFMs à l'état "Actif à la saisie" sont affichés.

**Variante(s) :**

**Variante 3a** - Si le filtre sur l'état des PSFMs est supprimé, la colonne "Etat" devient visible.

> **Remarques** :

> Doit on pouvoir laisser un observateur ajouter un PSFM ?

> Sinon il faut passer par la modification de la stratégie pour ajouter un PSFM. 
 

## Commun > Stratégie

**REF: COMMUN/STRATEGIES**

**ACTEURS : SUPERVISEUR, VALIDATEUR**

Prévoir un chantier pour refondre la gestion/mise en place des stratégies.

Voir dans Quadrige pour la partie administration des stratégies.

En attendant, il faut utiliser Allegro actuel pour la gestion des stratégies et rédiger un manuel d'exploitation pour faciliter
l'expoitation.

> **Remarques** :

> Suivant le programme, en connexion administrateur/coordinateur/... : On peut éditer des stratégies 
 
> La consultation/saisie des strétégies n'est accessible que depuis le menu référentiel (pas depuis le bouton d'oeil dans la consultation d'une marée saisie) 

> Nouvel écran : vue tabulaire d'affichage de toutes les stratégies. Pouvoir les créer/consulter/modifier/supprimer. 

> Se baser sur l'écran existant : https://obsmer.sumaris.net/referential/programs/90/strategies/legacy/90?tab=1


## Commun > Formulaires

**REF: COMMUN/FORMULAIRES**

Les formulaires terrain doivent pouvoir être importés dans Allegro (numérisés).
Ils sont nécessaires pour l'ifremer, afin de contrôler les données collectées par les prestataires.

Le document numérisé sera renommé par le traitement d'importation.
Il devrait respecter la règle de nommenclature suivante : 
- _OBSMER_LOTX_LIGNE DE PLAN_IMMATRICULATION NAVIRE CFR_DATE D'EMBARQUEMENT DE LA SORTIE AU FORMAT AAAAMMJJ.pdf_
  - Exemple : OBSMER_LOT1_2020_M0002_FRA000123456_20200718.pdf

En mode bureau (connecté), Il est possible de les visionner directement dans Allegro, une fois le document importé.

En mode tablette (déconnecté), cela doit être étudié.

> **Remarques** :

> _A compléter_


## Commun > Saisisseur

**REF: COMMUN/SAISISSEUR**

Dans le cas d'une poursuite de saisie, une donnée peut être saisie par un ou plusieurs saisisseurs.

Dans les applications, la notion de saisisseur fait référence au 1er saisisseur, les autres saisisseurs doivent être définis dans 
la liste des observateurs et pourront éditer la donnée.

> Questions :
> - Utile pour tous les volets ?


## Commun > Enregistrement automatique

**REF: COMMUN/ENREGISTREMENT**

L'accès à certains onglets nécessite d'enregistrer le formulaire.
Si tous les champs obligatoires du formulaire ont été renseignés, alors la sélection de l'onglet enregistre automatiquement le formulaire.


## Commun > Suppression

**REF: COMMUN/SUPPRESSION**

La suppression d'un élément doit être confirmé par le saisisseur via une popup de confirmation.

## Commun > Utilisation de données temporaires

Les données temporaires sont surtout utilisées lors des marées hauturières qui s'organisent au dernier moment et que l'observateur n'a pas encore le navire dans son portefeuille.

Les données temporaires à utiliser sont les navires et les taxons/groupes si l'observateur n'identifie pas tout de suite l'espèce.

Cette utilisation de données temporaires n'est pas fréquente mais pas rare.
Pour les espèces (doutes sur l'existence), utiliser un flag (douteux), ajouter une photo.


**Navire temporaire** : 

Fonctionnement actuel : 
    * Terminaison de la saisie impossible avec navire temporaire, il faut forcément remplacer le navire temporaire par un navire du référentiel
    * Le saisseur ne peut pas aller jusqu'à la fin de sa saisie avec un navire temporaire

Proposition (retenue) : 
    * Insérer les navires temporaires dans la table VESSEL avec le statut temporaire (STATUS_FK = 2) et un programme dédié (OBSMER, OBSVENTE)
        * Lister le niveau d'information minimum de saisie pour un navire temporaire
        * Champs obligatoires : Nom, immmatriculation, .. (Cf maquette à venir)
        * Tables renseignées : VESSEL, VESSEL_REGISTRATION_PERIOD et VESSEL_FEATURE
    * Phase de tests : Insérer des navires temporaires en BDD et tester le programme de consolidation des navires
    * Avoir la possibilité de désactiver cette fonctionnalité s'il y a des problèmes en production

**Observateur manquant** :
    * Ajouter une note dans la marée


## Commun > Régionalisation

Modèle de données : ![ui-regionalisation-model](/model/referentiel/spatial.svg)

Tables utilisées :
 * SPATIAL_ITEM
 * SPATIAL_ITEM2LOCATION
 * SPATIAL_ITEM_TYPE

Tables non utilisées (vides) mais présentes dans le modèle :
 * SPATIAL_ITEM_AREA
 * SPATIAL_ITEM_LINE
 * SPATIAL_ITEM_POINT

**Note de la réunion du 11/06/2024** : 

Fonctionnement actuel : la régionalisation permet de limiter l'affichage des référentiels ET de mettre des noms locaux (espèces et métiers)

Il y a 2 types de régionalisation :
 * A terre : ObsDeb et ActiFlot (métiers)
 * En mer : ObsMer et ObsVente

Filtre sur la liste des métiers suivant la zone de compétences

Zone de compétence -> Zone en mer ou à terre -> Filtrage sur les métiers

Priorité à appliquer la régionalisation dans calendrier d'activité (Mois d'activité) : Limiter les métiers, les zones de pêche, gradient de profondeur, gradient à la côte

A plus grande échéance dans ObsMer :
- Régionaliser les contrôles, régionaliser les noms des espèces (ObsMer)

**Retours de recette MOA - ObsVentes (2.9.19)** : 

- Cas d'usage d'échantillonnage en Outre Mer :
  - **En Priorité 2** : Régionaliser les types de ventes
      - Les types de ventes seront différents dans les DOM et il n'y a pas de criée ; il faudra peut être compléter et sélectionner les options du référentiel uniquement valables pour les DOM pour alléger la saisie pour ces territoires

Référentiel : 
- Armelle ne touche que SpatialItem
- Géométrie pas utilisée 
- Outil (Adagio Admin) pour gérer la régionalisation
- Nom régionalisé est bien utilisé

Dans l'Allegro actuel : 
    * La régionalisation est définie par une zone de haut niveau puis affinée en zones à terre et en mer. Le contenu des 3 listes est en dur dans le code d'Allegro -> Prévoir de mettre ça au propre en intégrant ça au modèle
    * Il n'est pas possible de modifier la régionalisation depuis les écrans de saisie

Même en mode connecté, il faut une régionalisation

Configuration du mode hors ligne (synchronisation) : sélectionner la zone de compétence (Ex : Guyane)
Cas du mode terrain en tablette (synchro) : 1 seule régionalisation possible (performance meilleure si une seule). A confirmer avec la MOA.

Il faut pouvoir filtrer/défiltrer les listes dans les écrans afin de pouvoir sortir de la régionalisation (sans passer par les préférences).

Note de la réunion du 27/06/2024 : 
- Calendrier d'activité : Faire des propositions pour modifier la régionalisation pendant la saisie

1. Dans les listes déroulantes (métiers, espèces, ...) (Cf Allegro Campagne, cf Captures d'écran)
2. Dans l'écran de saisie du "Calendrier et afficher la zone régionalisée