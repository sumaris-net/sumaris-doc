## Spécifications des règles d'ergonomie (ObsMer, ObsVente, Calendrier d'activité)

Cette partie décrit les règles d'ergonomie communes aux applications <b>ObsMer</b>, <b>ObsVente</b>, <b>Calendrier d'activité</b>

## Commun > Ergonomie > principes généraux

**REF: COMMUN/ERGONOMIE/PRINCIPES**

- Les champs obligatoires sont suffixé par un * (en rouge dans Allegro V2)
- Les champs calculés sont en italique et la police est de couleur bleu
- Les champs non saisissables sont affichés avec une police de couleur grise
- Les préconisations de saisies sont affichées en blanc sur fond rouge
- Les données sous forme de tableau
    - Tri des données (croissant/décroissant) : Une flèche indique le sens du tri passage de la souris sur le nom de la colonne triable
    - Affichage/masque de colonnes : Un bouton offre la possibilité d'afficher ou de masquer des colonnes dans une vue tabulaire
    - Les listes des marées, engins, opérations peuvent être restreintes en appliquant des filtres sur les données
- Les caractéristiques (PSFM) obligatoires (*) sont affichée en tête de liste
    - Cela se configure dans le programme, section "configuration des PSFM"
- Il faut afficher uniquement les colonnes PSFM ayant une valeur
- Dans un écran de saisie, le bouton "Sauvegarder" est actif lorsque tous les champs obligatoires ont été saisis

> **Remarques ISI** :

> ISI : A complèter par rapport à l'existant dans Allegro V2

> **Réunion MOA 06/02/2024** : 

> Implémenter des raccourcis clavier, 1ère lettre du bouton souligné (control + alt + MAJ + lettre)

> ISI -> EIS : Toutes les colonnes peuvent être triées 

    > Ou se paramètre le tri sur les colonnes ? 

> Attente très forte sur l'ergonomie pour la refonte :

    > Large public : malvoyant, daltonisme, ... ? Quelles sont les exigences de l'état sur ces développements ?

    > Action côté MOA https://accessibilite.numerique.gouv.fr/

    > Faire un atelier d'ergonomie avec des observateurs




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

**Variante(s) :**

**Variante 3a** - Connexion suivantes : Aux connexionx suivantes, l'observateur est directement positionné sur le précédent noeud qu'il avait choisit lors
de sa précédente connexion.

> **Remarques ISI** :

> ISI -> EIS : Comportement différent d'Imagine : on saisit d'abord le noeud, puis on se connecte

> ISI -> EIS : Ou est stocké l'information du noeud à la première connexion de l'utilisateur ?


> **Réunion MOA 06/02/2024** : 

> Proposer la liste déroulante à chaque connexion et positionner le noeud choisit lors de la dernière connexion. L'observateur peut changer de noeud à chaque connexion

> (En outre-mer ou métropole, les observateurs peuvent switcher entre ObsMer et ObsVente)


## Commun > Application des filtres

**REF: COMMUN/FILTRES**

Il est possible d'appliquer des filtres sur les marées et les opérations.

1. L'utilisateur clique sur le bouton du filtre
2. L'écran affiche les paramètres sur lesquels appliquer un filtre
3. Le nombre d'élement avant l'application du filtre est affiché en bas de la fenêtre
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

Le filtre peut être enregistré pour être ré-appliqué par la suite.


> **Remarques** : 

> ISI : A mettre en variante la fin de saisie qui supprime les filtres appliqués ?

> **Réunion MOA 06/02/2024** :

> Filtrage sur l'écran des marées uniquement. 

> Version 2 : 

    > Pouvoir facilement identifier une marée ou une opération sur la saisie d'une espèce.
    
    > Réel besoin des MOAs pour par exemple connaitre comment les espèces sont exploitées)
    
    > MOA -> OBS : Demander aux observateurs les besoins en filtrage des données 


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

> **Réunion MOA 06/02/2024** :

> Bouton Terminer la saisie sur les marées et sur les opérations (et sur les marées, on valide la saisie des opérations avec détection des erreurs) 


## Commun > Ajout de PSFM

**REF: COMMUN/PSFM/AJOUT**

**PSFM** :  Quadruplet paramètre/support/méthode/fraction. Ce quadruplet est systématiquement associé aux résultats et décrit précisemment les conditions de mesure/d'analyse de ceux-ci.

![ui-psfm-ajout](/projects/common/spe/images/pmfm-add.svg)

L'écran d'ajout de PSFM est disponible pour ajouter des caractéristiques à saisir sur les écrans suivants :
- Caractéristiques des marées
- Caractéristiques des engins
- Caractéristiques des lots

#### Scénario principal

TODO

> **Réunion MOA 06/02/2024** :

> Ecran d'ajout de PSFM disponible sur les écrans : caractéristiques engins, marées, lots

> Enlever la colonne Etat, si possible, car ne sert à rien.
 

## Commun > Stratégie

**REF: COMMUN/STRATEGIE**

TODO

> **Réunion MOA 06/02/2024** :

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

Il est possible de les visionner directement dans Allegro, une fois le document importé.

TODO

> **Réunion MOA 06/02/2024** :

> Nommenclature à faire au moment de l'import (attente nommenclature MOA).

> Pouvoir visionner le PDF numériser.