## Spécifications des règles d'ergonomie (ObsMer, ObsVente, Calendrier d'activité)

Cette partie décrit les règles d'ergonomie communes aux applications <b>ObsMer</b>, <b>ObsVente</b>, <b>Calendrier d'activité</b>

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