# <div style="text-align: center">Manuel du superviseur</div>

<div style="text-align: center">

<div class="logo">

![SUMARiS](img/common/logo_sumaris_titre.png)

</div>

<br>

<div class="logo">

![DolphinFREE](img/common/logo_dolphinfree.png)

</div>

<div style="font-size: x-large">

<br>

Version 2.9.30

Dernière mise à jour : 05/03/2025

![Bandeau logos](img/common/splash_pifil.png)

<br>
<br>

Auteur : E-IS

</div>

<br>
<br>

**Licence: [Creative Commons Attribution-ShareAlike 4.0 (CC-by-SA)](https://creativecommons.org/licenses/by-sa/4.0/)**

</div>

<div style="page-break-after: always"></div>

<div style="text-align: center; font-size: x-large">
Table des matières
</div>

<br>
<br>
<br>

<!-- TOC -->
* [Préambule](#préambule)
  * [Objectif de l'application](#objectif-de-lapplication)
  * [Pré-requis](#pré-requis)
* [Assistance technique](#assistance-technique)
* [Utilisation de l'application SUMARiS](#utilisation-de-lapplication-sumaris)
  * [Écran d'accueil](#écran-daccueil)
  * [Gérer les droits d'accès des utilisateurs à un programme de collecte](#gérer-les-droits-daccès-des-utilisateurs-à-un-programme-de-collecte)
    * [Écran Programmes](#écran-programmes)
    * [Écran de paramétrage d'un programme](#écran-de-paramétrage-dun-programme)
      * [Onglet Détails](#onglet-détails)
      * [Onglet Droits d'accès](#onglet-droits-daccès)
        * [Privilèges des utilisateurs](#privilèges-des-utilisateurs)
        * [Ajout d'un utilisateur au programme de collecte](#ajout-dun-utilisateur-au-programme-de-collecte)
        * [Modification des droits d'accès d'un utilisateur au programme de collecte](#modification-des-droits-daccès-dun-utilisateur-au-programme-de-collecte)
        * [Retrait d'un utilisateur du programme de collecte](#retrait-dun-utilisateur-du-programme-de-collecte)
  * [Gérer les navires](#gérer-les-navires)
    * [Écran Navires](#écran-navires)
    * [Fenêtre Nouveau navire](#fenêtre-nouveau-navire)
    * [Écran Détails d'un navire](#écran-détails-dun-navire)
<!-- TOC -->

<div style="page-break-after: always"></div>

# Préambule

<div style="text-align: center">

[![SUMARiS](img/common/logo_sumaris.png)](https://open.sumaris.net)

</div>

_**SUMARiS**_ est un outil de saisie en ligne de données halieutiques, développé par _**E-IS**_.

<div style="text-align: center">

[![E-IS](img/common/eis.png)](https://www.e-is.pro)

</div>

Ce document a pour objet d'aider efficacement le superviseur à affecter des droits d'accès, dans le cadre du programme _**DolphinFREE**_, à des utilisateurs ayant un compte dans dans l'application _**SUMARiS**_. Il s'adresse exclusivement aux utilisateurs ayant un compte de type _**Responsable de programme**_ (_**Manager privilege**_). 

## Objectif de l'application

_**SUMARiS**_ est un système d'information en ligne destiné à la collecte, au traitement et à l'extraction de données
ainsi qu'à la diffusion de résultats et d'agrégations.


## Pré-requis

Afin de pouvoir accéder à l'application en tant que superviseur, l'utilisateur doit :
- avoir créé un compte utilisateur,
- avoir validé son compte utilisateur via le lien reçu par e-mail,
- avoir reçu les privilèges de _**Responsable de programme**_ (_**Manager privilege**_) d'un superviseur de son programme de collecte ou d'un administrateur.

Pour pouvoir effectuer les actions décrites dans ce document, l'utilisateur doit se connecter avec son compte à l'application [SUMARiS](https://open.sumaris.net), à l'adresse https://open.sumaris.net. 

# Assistance technique

Pour remonter les questions ou problèmes :

* Contacter en priorité le superviseur de votre organisation (ou _**CNPMEM**_), qui est chargé de vous assister,
* À défaut, contacter l'assistance technique :
    * Par e-mail :
        * Moyen de communication à privilégier
        * [support@sumaris.net](mailto:support@sumaris.net)
    * Par téléphone :
        * Du lundi au vendredi, de 9h à 18h30
        * [+33 (0)9 53 24 41 20](tel:+33953244120)

<div style="page-break-after: always"></div>

# Utilisation de l'application SUMARiS

## Écran d'accueil

Une fois connecté, l'utilisateur se retrouve sur l'[Écran d'accueil](#écran-daccueil).

Le menu latéral est visible sur la partie gauche de l'écran.

<div style="float: right">

![Écran d'accueil](img/desktop/sumaris_accueil_desktop.png)

</div>

Le superviseur peut effectuer les actions suivantes :
- [Gérer les droits d'accès des utilisateurs à un programme de collecte](#gérer-les-droits-daccès-des-utilisateurs-à-un-programme-de-collecte)
  - Accès à l'[Écran Programmes](#écran-programmes) via l'entrée _**Programmes**_ du menu latéral 
    - Si celle-ci n'est pas visible, contacter un autre superviseur du programme ou l'[Assistance technique](#assistance-technique) pour obtenir droits nécessaires.
- [Gérer les navires](#gérer-les-navires)
  - Accès à l'[Écran Navires](#écran-navires) via l'entrée _**Navires**_ du menu latéral

<div style="page-break-after: always"></div>

## Gérer les droits d'accès des utilisateurs à un programme de collecte

### Écran Programmes

L'écran _**Programmes**_ permet d'afficher la liste des programmes de collecte pour lesquels l'utilisateur connecté a les droits d'accès.

![Écran Programmes](img/desktop/sumaris_programmes_desktop.png)

Cliquer sur la ligne du programme _**DolphinFREE**_ pour accéder à l'[Écran de paramétrage d'un programme](#écran-de-paramétrage-dun-programme). 

### Écran de paramétrage d'un programme

L'écran est composé des onglets suivants :

- [_**Détails**_](#onglet-détails)
- Lieux
- Stratégies
- Options
- [_**Droits d'accès**_](#onglet-droits-daccès)

Il s'ouvre par défaut sur l'onglet [_**Détails**_](#onglet-détails).

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

> Les privilèges affectés au superviseur donnent, pour l'instant accès à tous les onglets.
>
> Ne modifier des données que dans l'onglet **Droits** d'accès.
>
> Modifier les autres données pourrait rendre le programme de collecte inopérant.

<div style="page-break-after: always"></div>

#### Onglet Détails

Cet onglet affiche les généralités du programme.

![Onglet Détails](img/desktop/sumaris_details_programme_desktop.png)

Aucune action n'est requise sur cet onglet. Cliquer sur l'[Onglet Droits d'accès](#onglet-droits-daccès) pour l'afficher.

#### Onglet Droits d'accès

L'onglet affiche la liste de tous les utilisateurs ayant les droits d'accès à ce programme de collecte.

![Onglet Droits d'accès](img/desktop/sumaris_droits_acces_programme_desktop.png)

##### Privilèges des utilisateurs

Un utilisateur peut disposer, pour un programme de collecte, des privilèges suivants :
- _**Responsable de programme**_ (_**Manager privilege**_)
- _**Observateur**_ (_**Observer privilege**_)
- _**Qualificateur**_ (_**Qualifier privilege**_)
- _**Validateur**_ (_**Validator privilege**_)
- _**Invité**_ (_**Viewer privilege**_)

Ces privilèges ne sont valables, pour l'utilisateur, que sur le programme de collecte concerné.

Les privilèges à affecter aux utilisateurs sont les suivants :
- _**Observateur**_ (_**Observer privilege**_)
  - Pour les pêcheurs et toute autre personne devant effectuer des observations en mer.
- _**Validateur**_ (_**Validator privilege**_)
    - Pour les responsables devant effectuer des validations de données.
- _**Responsable de programme**_ (_**Manager privilege**_)
    - Pour les responsables de structure devant gérer les droits d'accès des utilisateurs.

##### Ajout d'un utilisateur au programme de collecte

L'appui sur l'icône ![Ajout utilisateur](img/desktop/sumaris_icone_ajout_gris_desktop.png) ajoute une nouvelle ligne, en orange, en bas du tableau.

À tout moment, l'appui sur l'icône ![Suppression ligne](img/desktop/sumaris_icone_suppression_ligne_desktop.png) permet de supprimer la ligne en cours de saisie.

Sélectionner l'utilisateur souhaité dans la liste déroulante qui s'affiche.

![Ajout d'un utilisateur](img/desktop/sumaris_ajout_utilisateur_programme_desktop_1.png)

Sélectionner ensuite le champ _**Privilège**_ puis, dans la liste déroulante qui s'affiche, les privilèges souahités.

![Ajout d'un utilisateur](img/desktop/sumaris_ajout_utilisateur_programme_desktop_2.png)

Une fois la saisie terminée, la ligne passe en bleu.

<div style="page-break-after: always"></div>

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

> À ce stade, l'ajout de l'utilisateur n'est pas encore enregistré en base de données.
> 
> L'ajout de l'utilisateur ne sera effectif qu'après l'appui sur le bouton _**Sauvegarder**_.

![Ajout d'un utilisateur](img/desktop/sumaris_ajout_utilisateur_programme_desktop_3.png)

Il est alors possible d'ajouter un ou plusieurs autre(s) utilisateur(s), en recommençant l'opération autant de fois que souhaité, en appuyant à chaque fois sur l'icône ![Ajout utilisateur](img/desktop/sumaris_icone_ajout_gris_desktop.png).

Chaque ligne précédemment créée affichera une icône <span style="color: #ff4081; font-size: large">★</span> en son extrémité droite, pour indiquer qu'elle n'est pas encore enregistrée en base de données.

Une fois la saisie terminée, appuyer sur le bouton _**Sauvegarder**_ afin d'enregistrer les modifications dans la base de données.

Le ou les utilisateur(s) nouvellement ajouté(s) apparaissent alors sur fond blanc et sans <span style="color: #ff4081; font-size: large">★</span>, comme ceux précédemment présents dans le programme de collecte.

![Ajout d'un utilisateur](img/desktop/sumaris_ajout_utilisateur_programme_desktop_4.png)

<div style="page-break-after: always"></div>

##### Modification des droits d'accès d'un utilisateur au programme de collecte

Sélectionner la ligne à modifier. Elle s'affiche alors en bleu.

![Modification des droits d'un utilisateur](img/desktop/sumaris_modification_droits_utilisateur_programme_desktop_1.png)

Sélectionner ensuite la totalité du contenu du champ _**Privilège**_. La liste déroulante s'affiche avec uniquement la valeur affectée.

![Modification des droits d'un utilisateur](img/desktop/sumaris_modification_droits_utilisateur_programme_desktop_2.png)

Effacer le contenu du champ _**Privilège**_ puis sélectionner la nouvelle valeur souhaitée, dans la liste déroulante.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

> À ce stade, la modification effectuée n'est pas encore enregistrée en base de données.
>
> La modification ne sera effective qu'après l'appui sur le bouton _**Sauvegarder**_.

![Modification des droits d'un utilisateur](img/desktop/sumaris_modification_droits_utilisateur_programme_desktop_3.png)

Comme lors de l'ajout de nouveaux utilisateurs, il est alors possible de modifier les droits d'un ou de plusieurs autre(s) utilisateur(s), en recommençant l'opération autant de fois que souhaité, en sélectionnant à chaque fois la ligne à modifier.

Chaque ligne précédemment modifiée affichera une icône <span style="color: #ff4081; font-size: large">★</span> en son extrémité droite, pour indiquer qu'elle n'est pas encore enregistrée en base de données.

Une fois la modification terminée, appuyer sur le bouton _**Sauvegarder**_ afin d'enregistrer les modifications dans la base de données.

Le ou les utilisateur(s) modifié(s) apparaissent alors sur fond blanc et sans <span style="color: #ff4081; font-size: large">★</span>, comme les autres utilisateurs du programme de collecte.

![Modification des droits d'un utilisateur](img/desktop/sumaris_modification_droits_utilisateur_programme_desktop_4.png)

<div style="page-break-after: always"></div>

##### Retrait d'un utilisateur du programme de collecte

Sélectionner la ou les ligne(s) à supprimer, à l'aide des cases à cocher en début de chaque ligne.

![Suppression des droits d'un utilisateur](img/desktop/sumaris_suppression_droits_utilisateur_programme_desktop_1.png)

L'appui sur l'icône ![Suppression liste](img/desktop/sumaris_icone_suppression_liste_desktop.png) permet de supprimer la ou les ligne(s) sélectionnée(s) et, ainsi, de retirer les droits d'accès au programme de collecte aux utilisateurs concernés.

La ou les lignes à supprimer disparaissent alors de l'affichage de la liste.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

> À ce stade, la suppression n'est pas encore enregistrée en base de données.
>
> La suppression ne sera effective qu'après l'appui sur le bouton _**Sauvegarder**_.

![Suppression des droits d'un utilisateur](img/desktop/sumaris_suppression_droits_utilisateur_programme_desktop_2.png)

Comme lors de l'ajout ou de la modification d'utilisateurs, il est alors possible de supprimer les droits d'un ou de plusieurs autre(s) utilisateur(s), en recommençant l'opération autant de fois que souhaité.

La ou les lignes à supprimer disparaissent alors de l'affichage de la liste.

Une fois la suppression terminée, appuyer sur le bouton _**Sauvegarder**_ afin d'enregistrer les modifications dans la base de données.

Le ou les utilisateur(s) concerné(s) sont alors définitivement supprimés du programme de collecte.

![Modification des droits d'un utilisateur](img/desktop/sumaris_droits_acces_programme_desktop.png)

## Gérer les navires

### Écran Navires

L'écran _**Navires**_ permet d'afficher la liste de tous les navires disponibles dans la base de données.

![Écran Navires](img/desktop/sumaris_navires_desktop.png)

L'appui sur une ligne affiche l'[Écran Détails d'un navire](#écran-détails-dun-navire).

L'appui sur l'icône ![Ajout navire](img/desktop/sumaris_icone_ajout_bleu_desktop.png) affiche la [Fenêtre Nouveau navire](#fenêtre-nouveau-navire).

L'appui sur l'icône ![Rafraîchir](img/desktop/sumaris_icone_rafraichir_desktop.png) rafraîchit la liste des navires.

L'appui sur l'icône ![Filtres](img/desktop/sumaris_icone_filtres_desktop.png) affiche le volet des filtres.

![Écran Navires](img/desktop/sumaris_navires_filtres_desktop_1.png)

Le volet des filtres peut être masqué par l'appui sur l'icône ![Filtres](img/desktop/sumaris_icone_filtres_desktop.png) ou sur le bouton _**Fermer**_.

Renseigner un ou plusieurs champ(s) de filtrage et appuyer sur le bouton _**Appliquer**_.

Le volet des filtres se masque et la liste apparaît filtrée. 

![Écran Navires](img/desktop/sumaris_navires_filtres_desktop_2.png)

L'icône ![Filtres](img/desktop/sumaris_icone_filtres_desktop.png) affiche une pastille indiquant le nombre de filtre(s) appliqués : ![Filtres 1](img/desktop/sumaris_icone_filtres_1_desktop.png).

L'appui sur l'icône ![Suppression filtres](img/desktop/sumaris_icone_suppression_filtres_desktop.png) supprime les filtres appliqués.

<div style="page-break-after: always"></div>

### Fenêtre Nouveau navire

![Fenêtre Nouveau navire](img/desktop/sumaris_nouveau_navire_desktop.png)

Les champs marqués <strong>*</strong> sont obligatoires.

Renseigner le champ _**État**_ avec la valeur "Actif à la saisie" afin que le navire soit visible par tous les utilisateurs.

Renseigner les caractéristiques du navire et appuyer sur le bouton _**Ajouter**_ pour terminer la création du navire.

### Écran Détails d'un navire

L'écran affiche, en lecture seule les caractéristiques du navire.

![Écran Détails d'un navire](img/desktop/sumaris_details_navire_desktop.png)

<div style="float: right">

![Bouton Modifier désactivé](img/desktop/sumaris_bouton_modifier_desactive_desktop.png)

</div>

Si l'utilisateur n'a accès au navire qu'en lecture seule, le bouton _**Modifier**_ est désactivé.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

<div style="float: right">

![Bouton Modifier menu déroulant](img/desktop/sumaris_bouton_modifier_menu_deroulant_desktop.png)

</div>

Si l'utilisateur a accès au navire en écriture, le bouton _**Modifier**_ est activé.

L'appui sur le bouton affiche un menu déroulant permettant de réaliser des modifications.

<div style="clear:both"></div>

Les champs de l'écran passent alors en mode édition.

![Modification détails d'un navire](img/desktop/sumaris_details_navire_modification_desktop.png)

L'appui sur le bouton _**Sauvegarder**_ enregistre les modifications dans la base de données. 