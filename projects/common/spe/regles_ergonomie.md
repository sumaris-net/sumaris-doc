## Spécifications des règles d'ergonomie (ObsMer, ObsVente, Calendrier d'activité)

Cette partie décrit les règles d'ergonomie communes aux applications <b>ObsMer</b>, <b>ObsVente</b>, <b>Calendrier d'activité</b>

## Ergonomie : principes généraux

**REF: ERGONOMIE/PRINCIPES**

- Les champs obligatoires sont suffixé par un * (en rouge dans Allegro V2)
- Les champs calculés sont en italique et la police est de couleur bleu
- Les champs non saisissables sont affichés avec une police de couleur grise
- Les préconisations de saisies sont affichées en blanc sur fond rouge
- Les données sous forme de tableau
    - Trie des données (croissant/décroissant) : Une flèche indique le sens du tri passage de la souris sur le nom de la colonne triable
    - Affichage/masque de colonnes : Un bouton offre la possibilité d'afficher ou de masquer des colonnes dans une vue tabulaire
    - Les listes des marées, engins, opérations peuvent être restreintes en appliquant des filtres sur les données
- Les caractéristiques (PSFM) obligatoires (*) sont affichée en tête de liste
    - Cela se configure dans le programme, section "configuration des PSFM"
- Il faut afficher uniquement les colonnes PSFM ayant une valeur
- Dans un écran de saisie, le bouton "Sauvegarder" est actif lorsque tous les champs obligatoires ont été saisis

> Remarques :

> VFA : A complèter par rapport à l'existant dans Allegro V2


## Ergonomie : Connexion à l'application

**REF: ERGONOMIE/CONNEXION**

![ui-main_connexion](/projects/obsmer/spe/images/main-login-connect-out-first.svg)

L'interface est composée des éléments graphiques suivants :
1. Champ texte pour renseigné son "Identifiant *"
2. Champ texte pour renseigné son "Mot de passe *"
3. Une lite déroulante avec le choix du noeud (pour la première connexion)
4. Un bouton "Annuler"
5. Un bouton "Se connecter"



#### Scénario principal
1. L'utilisateur renseigne son identifiant (Compte intranet de l'Ifremer)
2. L'utilisateur renseigne son mot de passe
3. Le bouton "Se connecter" est actif une fois les champs obligatoires renseigné

Une fois la connexion validée, l'interface graphique de l'application s'adapte par rapport à la configuration sélectionnée ("noeud") :
- Titres,
- Logos,
- Menu,
- ...

**Variante(s) :**

**Variante 3a** - Mode connecté : En mode connecté, aux connexionx suivantes, l'utilisateur est directement positionné sur le bon noeud.

![ui-main_connexion](/projects/obsmer/spe/images/main-login-connect.svg)

**Variante 3b** - Mode déconnecté : En mode déconnecté, l'utilisateur choisit le noeud à la première connexion de l'application.

Aux connexions suivantes, un lien leur rappel le noeud et leur permet de le changer dans les paramètres de l'application.

![ui-main_connexion](/projects/obsmer/spe/images/main-login-connect-out-next.svg)

> Remarques :

> VFA -> EIS : Comportement différent d'Imagine (on saisit d'abord le noeud)

> VFA -> EIS : Ou est stocké l'information du noeud à la première connexion de l'utilisateur ?


## Ergonomie : Application des filtres

**REF: ERGONOMIE/FILTRES**

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


> Remarques

> VFA : A mettre variante de terminaison de saisie ?


## Ergonomie : Fin d'une saisie

**REF: ERGONOMIE/SAISIE/TERMINER**

1. L'utilisateur termine sa saisie en cliquant sur le bouton "Terminer saisie".
2. Le système contrôle les données saisie.
3. S'il a détecté une erreur, il indique un message explicite et propose de corriger l'erreur.

**Variante(s) :**

**Variante 1a**
En mode de saisie bureau le contrôle plus stricte sur la saisie qu'en mode terrain.
Par exemple en mode saisie terrain, le lieu de retour de marée n'est pas obligatoire alors qu'en mode bureau oui.


## Ergonomie : Ecran d'ajout de PSFM

**REF: ERGONOMIE/PSFM/AJOUT**

**PSFM** :  Quadruplet paramètre/support/méthode/fraction. Ce quadruplet est systématiquement associé aux résultats et décrit précisemment les conditions de mesure/d'analyse de ceux-ci.

![ui-psfm-ajout](/projects/common/spe/images/pmfm-add.svg)