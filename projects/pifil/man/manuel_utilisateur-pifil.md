# <div style="text-align: center">Manuel de l'utilisateur</div>

<div style="text-align: center">

<div class="logo">

![SUMARiS](logo_sumaris_titre.png)

</div>

<br>
<br>

<div style="font-size: x-large">

<br>
<br>
<br>

</div>

<div style="font-size: xx-large">

Programme PIFIL 2

</div>

<div style="font-size: x-large">

<br>
<br>
<br>
<br>

Version 2.9.30

Dernière mise à jour : 25/02/2025

![Bandeau logos](splash_pifil.png)

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
  * [Configuration minimum](#configuration-minimum)
* [Assistance technique](#assistance-technique)
* [Formulaire terrain](#formulaire-terrain)
* [Installer l'application SUMARiS](#installer-lapplication-sumaris)
* [Premiers pas dans l'application SUMARiS](#premiers-pas-dans-lapplication-sumaris)
  * [Première utilisation](#première-utilisation)
  * [Écran d'accueil (mode non identifié)](#écran-daccueil-mode-non-identifié)
    * [Choix de la langue](#choix-de-la-langue)
  * [Écran Inscription](#écran-inscription)
  * [Écran Authentification](#écran-authentification)
  * [Écran Réinitialisation du mot de passe](#écran-réinitialisation-du-mot-de-passe)
  * [Écran d'accueil (mode identifié)](#écran-daccueil-mode-identifié)
  * [Menu latéral](#menu-latéral)
  * [Écran Marées](#écran-marées)
    * [Affichage en mode bureau (mode connecté)](#affichage-en-mode-bureau-mode-connecté)
    * [Affichage en mode terrain (hors-ligne)](#affichage-en-mode-terrain-hors-ligne)
    * [Ajout d'une nouvelle marée](#ajout-dune-nouvelle-marée)
    * [Menu Marées](#menu-marées)
  * [Écran Configuration du mode hors-ligne](#écran-configuration-du-mode-hors-ligne)
  * [Écran Nouvelle marée](#écran-nouvelle-marée)
    * [Onglet Détails](#onglet-détails)
    * [Onglet Engins](#onglet-engins)
      * [Écran Recherche engin existant](#écran-recherche-engin-existant)
      * [Écran Détails de l'engin](#écran-détails-de-lengin)
      * [Écran Nouvel engin](#écran-nouvel-engin)
    * [Onglet Opérations](#onglet-opérations)
  * [Écran de saisie d'un filage](#écran-de-saisie-dun-filage)
  * [Écran de saisie d'un virage](#écran-de-saisie-dun-virage)
  * [Écran de saisie d'une capture accidentelle](#écran-de-saisie-dune-capture-accidentelle)
  * [Écran d'édition d'une marée](#écran-dédition-dune-marée)
  * [Écran Mon compte](#écran-mon-compte)
  * [Écran Paramètres](#écran-paramètres)
<!-- TOC -->

<div style="page-break-after: always"></div>

# Préambule

<div style="text-align: center">

[![SUMARiS](logo_sumaris.png)](https://open.sumaris.net)

</div>

_**SUMARiS**_ est un outil de saisie en ligne de données halieutiques, développé par _**E-IS**_.

<div style="text-align: center">

[![E-IS](eis.png)](https://www.e-is.pro)

</div>

Ce document a pour objet d'aider efficacement le nouvel utilisateur à découvrir l'application _**SUMARiS**_, dans le cadre du programme _**PIFIL**_. Il s'adresse exclusivement aux utilisateurs ayant un compte de type _**Observateur**_.

Ce guide ne présente que les éléments permettant une première utilisation rapide de l'application _**SUMARiS**_ et ne doit pas être considéré comme un manuel complet.

## Objectif de l'application

_**SUMARiS**_ est un système d'information en ligne destiné à la collecte, au traitement et à l'extraction de données
ainsi qu'à la diffusion de résultats et d'agrégations.

## Configuration minimum

L'application fonctionne sur des terminaux mobiles (tablette ou téléphone), sur Android ou iOS, ou dans un navigateur Internet (Google Chrome ou Safari).

**L'application peut fonctionner hors connexion (sans accès à Internet), notamment lors de son utilisation en mer.**

En revanche, comme des données doivent être synchronisées à un serveur, une connexion Internet est nécessaire dans les cas suivants :

* Installation de l'application,
* Première connexion à l'application,
* Configuration du mode hors-connexion,
* Synchronisation des données lors du retour à terre.

# Assistance technique

Pour remonter les questions ou problèmes :

* Contacter en priorité l'_**OP**_ (ou _**CRPMEM**_), qui est chargé de centraliser les demandes et de les remonter,
* À défaut, contacter l'assistance technique :
  * Par e-mail :
    * Moyen de communication à privilégier
    * [support@sumaris.net](mailto:support@sumaris.net)
  * Par téléphone :
    * Du lundi au vendredi, de 9h à 18h30
    * [+33 (0)9 53 24 41 20](tel:+33953244120)

<div style="page-break-after: always"></div>

# Formulaire terrain

En cas d'impossibilité d'utiliser l'application _**SUMARiS**_, un formulaire terrain est disponible en ligne, [en cliquant sur ce lien](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/pifil/doc/pifil-doc-25-002-Formulaire_terrain-PIFIL-v1.2.pdf).

[Lien téléchargement direct](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/raw/master/projects/pifil/doc/pifil-doc-25-002-Formulaire_terrain-PIFIL-v1.2.pdf?inline=false)

# Installer l'application SUMARiS

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Pour l'utilisation en mer, a priori **sans connexion Internet**, il est **grandement recommandé** de ne pas utiliser la version Internet (via le navigateur) et **d'installer l'application** sur le terminal mobile, via le store d'applications de l'appareil._

L'application est disponible dans les stores Android et iOS, ainsi que depuis un navigateur Internet :

| [![Disponible sur Google play](google_play_badge_fr.png)](https://play.google.com/store/apps/details?id=net.sumaris.app) | [![QR Code Google Play SUMARiS](qr_code_google_play_sumaris.png)](https://play.google.com/store/apps/details?id=net.sumaris.app)  | https://play.google.com/store/apps/details?id=net.sumaris.app                                                                                                                |
|:------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|      [![Télécharger dans l'App Store](app_store_badge_fr.png)](https://apps.apple.com/fr/app/sumaris/id6736747523)       |         [![QR Code App Store SUMARiS](qr_code_app_store_sumaris.png)](https://apps.apple.com/fr/app/sumaris/id6736747523)         | **https://apps.apple.com/fr/app/sumaris/id6736747523**                                                                                                                       |
|                   [![Télécharger dans l'App Store](mobile-browser-icon.png)](https://open.sumaris.net)                   |                           [![QR Code Open SUMARiS](qr_code_open_sumaris.png)](https://open.sumaris.net)                           | **https://open.sumaris.net** <br><br><div style="color: #ffa500; font-size: large">**⚠ AVERTISSEMENT !**<br></div>_La saisie sans connexion Internet ne sera pas possible !_ |

<br>

Dans le cas de l'ouverture de l'application via le navigateur Internet, attendre l'affichage du bandeau de téléchargement, en haut de l'écran, et cliquer sur le bouton pour être redirigé vers le store correspondant au terminal mobile.

<div style="text-align: center">

![Télécharger pour Android](sumaris_bandeau_telechargement_Android.png)
![Télécharger pour iOS](sumaris_bandeau_telechargement_iOS.png)

</div>

La page de l'application s'ouvre dans le store concerné, pour pouvoir procéder à l'installation.

<div style="page-break-after: always"></div>

# Premiers pas dans l'application SUMARiS

## Première utilisation

Lors de la première utilisation, l'application s'ouvrira sur l'écran de sélection de données.

<div style="text-align: center">

![Écran  de démarrage](sumaris_demarrage_1.png)
![Écran  de démarrage](sumaris_demarrage_2.png)
![Écran  de démarrage](sumaris_demarrage_3.png)

</div>

Aller dans l'onglet _**Programmes de collecte**_ et sélectionner le programme _**PIFIL 2**_.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Faire attention de bien sélectionner le programme **PIFIL 2**._

_La bonne utilisation de l'application et l'exploitabilité des données saisies en découlent !_

L'[Écran d'accueil (mode non identifié)](#écran-daccueil-mode-non-identifié) s'affiche ensuite.

<div style="page-break-after: always"></div>

## Écran d'accueil (mode non identifié)

<div style="float: right">

![Écran d'accueil](sumaris_accueil_non_identifie.png)

</div>

Deux boutons sont disponibles :

* _**S'inscrire**_
  * Lien vers l'[Écran Inscription](#écran-inscription)
* _**Se connecter**_
  * Lien vers l'[Écran Authentification](#écran-authentification)

<div style="clear:both"></div>

### Choix de la langue

<div style="float: right">

![Choix de la langue](sumaris_choix_langue_non_identifie.png)

</div>

L'icône en haut à droite permet de choisir la langue de l'application.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran Inscription

Lors du premier lancement de l'application, il est nécessaire de créer un compte utilisateur pour s'authentifier.

Il est obligatoire de saisir une adresse e-mail valide et un mot de passe sécurisé comprenant différents types de caractères (majuscules,
minuscules, nombres, caractères spéciaux...) puis de valider.

**NB :**

_Le champ _**Organisme**_ correspond à l'**OP** de l'observateur ou, à défaut, à son **CRPMEM**._

<div style="text-align: center">

![Création d'un compte](sumaris_inscription_1.png)
![Création d'un compte](sumaris_inscription_2.png)
![Création d'un compte](sumaris_inscription_3.png)

</div>

À la création du compte, un e-mail automatique est envoyé au nouvel utilisateur afin de valider l'adresse.

Chaque utilisateur authentifié a, au départ, un statut d'invité qui lui permet de visualiser mais pas de saisir de données.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_L'utilisateur doit impérativement demander à son **OP** (ou **CRPMEM**) de lui donner les droits de saisie sur le programme **PIFIL 2**._

_Sous quelques jours, il sera notifié par e-mail de l'attribution des droits d'accès._

_Avant cela, le bouton de **Saisie des marées** ne sera pas affiché, et la saisie de marées ne sera pas possible._

À l'issue de l'inscription, l'utilisateur est automatiquement redirigé vers l'[Écran Authentification](#écran-authentification).

<div style="page-break-after: always"></div>

## Écran Authentification

<div style="float: right">

![Authentification](sumaris_connexion.png)

</div>

Renseigner l'adresse e-mail et le mot de passe puis valider la saisie avec l'icône **✔** de la barre de titre.

Le lien _**Créer un compte**_ permet d'afficher l'[Écran Inscription](#écran-inscription).

Le lien _**Réinitialiser votre mot de passe**_ permet d'afficher l'[Écran Réinitialisation du mot de passe](#écran-réinitialisation-du-mot-de-passe).

<div style="clear:both"></div>

## Écran Réinitialisation du mot de passe

<div style="float: right">

![Réinitialisation du mot de passe](sumaris_reinitialisation_mot_de_passe_1.png)
![Réinitialisation du mot de passe](sumaris_reinitialisation_mot_de_passe_2.png)

</div>

Renseigner l'adresse e-mail puis valider la saisie avec l'icône **✔** de la barre de titre.

Un message de confirmation d'envoi d'e-mail s'affiche en haut de l'écran.

Aller consulter les e-mails et cliquer sur le lien de récupération.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran d'accueil (mode identifié)

<div style="float: right">

![Écran d'accueil](sumaris_accueil_identifie_attente_droits.png)
![Écran d'accueil](sumaris_accueil_identifie.png)

</div>

Deux boutons sont disponibles :

* _**Saisie des marées**_ : Lien vers l'[Écran Marées](#écran-marées)
* _**Mon compte**_ : Lien vers l'[Écran Mon compte](#écran-mon-compte)

**NB :**

_Tant que les droits d'accès n'ont pas été attribués au compte par l'**OP** (ou **CRPMEM**), l'utilisateur ne pourra ni saisir, ni visualiser de marée._

_Le bouton **Saisie des marées** ne sera donc pas affiché._

<div style="clear:both"></div>

## Menu latéral

<div style="float: right">

![Menu latéral](sumaris_menu_lateral_identifie.png)

</div>

Le menu latéral comporte les éléments suivants :

* Identité de l'utilisateur
  * Lien vers l'[Écran Mon compte](#écran-mon-compte)
* Icône de notification ![Notification](sumaris_icone_notification.png)
  * Affichage de la pop-up de notifications
* Marées
  * Lien vers l'[Écran Marées](#écran-marées)
* Navires
* Messages
* Paramètres
  * Lien vers l'[Écran Paramètres](#écran-paramètres)
* À propos
* Se déconnecter

**NB :**

_Tant que les droits d'accès n'ont pas été attribués au compte par l'**OP** (ou **CRPMEM**), l'utilisateur ne pourra ni saisir, ni visualiser de marée._

_L'entrée **Marées** ne sera donc pas affichée._

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran Marées

L'écran _**Marées**_ permet d'afficher la liste des marées saisies par l'utilisateur ou dans le cadre du programme.

L'icône **⁝** de la barre de titre permet d'afficher le [Menu Marées](#menu-marées).

### Affichage en mode bureau (mode connecté)

<div style="float: right">

![Marées](sumaris_marees_1.png)

</div>

<div style="clear:both"></div>

### Affichage en mode terrain (hors-ligne)

<div style="float: right">

![Marées](sumaris_marees_3.png)
![Marées](sumaris_marees_4.png)

</div>

L'écran possède deux onglets :
* _**Non envoyées**_
* _**Envoyées**_

<div style="clear:both"></div>

<div style="float: right">

![Marées](sumaris_marees_6.png)
![Marées](sumaris_marees_7.png)

</div>

<div style="page-break-after: always"></div>

Le statut des marées apparaît en haut à droite du statut des marées.

Une marée en cours de saisie ne peut pas être envoyée au serveur. Il faut avoir appuyé au préalable sur le bouton _**Terminer la saisie**_ de l'[Onglet Détails](#onglet-détails)  de l'[Écran Nouvelle marée](#écran-nouvelle-marée) ou de l'[Écran d'édition d'une marée](#écran-dédition-dune-marée).

Les marées non envoyées (au serveur de la base de données) sont consultables uniquement par l'utilisateur, sur son terminal mobile.

Les marées envoyées (au serveur de la base de données) sont consultables par tous les ayants droit connectés.

Pour envoyer une marée au serveur, appuyer sur le bouton _**Envoyer**_ de la marée correspondante.

Une marée ne peut être prise en compte par les structures professionnelles et les scientifiques que lorsqu’elle a été envoyée.

<div style="clear:both"></div>

### Ajout d'une nouvelle marée

<div style="float: right">

![Ajout marée](sumaris_marees_2.png)
![Ajout marée](sumaris_marees_5.png)

</div>

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Pour l'observation en mer (sans connexion Internet), **privilégier impérativement la saisie terrain (mode hors-ligne)**._

L'appui sur l'icône d'ajout d'une marée ![Ajout marée](sumaris_icone_ajout.png) de l'[Écran Marées](#écran-marées) permet d'afficher les entrées suivantes :

* Saisie terrain (mode hors-ligne) ![Ajout marée terrain](sumaris_icone_ajout_maree_terrain.png)
  * Si le mode hors-ligne n'a pas été configuré :
    * Lien vers l'[Écran Configuration du mode hors-ligne](#écran-configuration-du-mode-hors-ligne)
  * Si le mode hors-ligne a été configuré :
    * Lien vers l'[Écran Nouvelle marée](#écran-nouvelle-marée)
* Saisie bureau (mode connecté) ![Ajout marée bureau](sumaris_icone_ajout_maree_bureau.png)
  * Lien vers l'[Écran Nouvelle marée](#écran-nouvelle-marée)

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

### Menu Marées

<div style="float: right">

![Menu Marées](sumaris_menu_marees_connecte.png)
![Menu Marées](sumaris_menu_marees_hors-ligne.png)

</div>

Le menu s'affiche différemment en mode terrain (hors-ligne) ou en mode bureau (connecté).

L'entrée _**Activer le mode hors-ligne**_ ou _**Mettre à jour le mode hors-ligne**_, selon le mode en cours, permet d'afficher l'[Écran Configuration du mode hors-ligne](#écran-configuration-du-mode-hors-ligne).

<div style="clear:both"></div>

## Écran Configuration du mode hors-ligne

<div style="float: right">

![Configuration du mode hors-ligne](sumaris_configuration_mode_hors-ligne_1.png)
![Configuration du mode hors-ligne](sumaris_configuration_mode_hors-ligne_2.png)

</div>

Cet écran permet de préparer la saisie terrain (mode hors-ligne).

Sélectionner le programme _**PIFIL 2**_ puis le(s) navire(s) souhaités.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Faire attention de bien sélectionner le programme **PIFIL 2**._

_L'exploitabilité des données saisies en découle !_

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

<div style="float: right">

![Configuration du mode hors-ligne](sumaris_configuration_mode_hors-ligne_3.png)
![Configuration du mode hors-ligne](sumaris_configuration_mode_hors-ligne_4.png)

</div>

Il est possible d'importer l'historique des données déjà saisies, dans le cadre du programme et du ou des navire(s) sélectionnés, sur une période donnée, de sept jours à deux ans en arrière.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Les données importées peuvent représenter un volume conséquent qui risque d'augmenter le temps de téléchargement au moment de la création, ainsi que de prendre de la place dans l'espace de stockage du terminal mobile._

Valider la saisie avec l'icône **✔** de la barre de titre.

<div style="clear:both"></div>

<div style="float: right">

![Importation des données du mode hors-ligne](sumaris_importation_donnees_hors-ligne.png)

</div>

L'[Écran Marées](#écran-marées) apparaît, avec une barre de progression de l'importation.

À la fin de l'importation des données, l'affichage bascule vers l'[Écran Nouvelle marée](#écran-nouvelle-marée).

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran Nouvelle marée

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Si le terminal mobile est connecté, les menus déroulants du formulaire de saisie contiendront toutes les entrées disponibles dans la base de données._

_Si le terminal mobile n'est pas connecté, seules les données préalablement téléchargées seront disponibles._

### Onglet Détails

<div style="float: right">

![Saisie des détails d'une nouvelle marée](sumaris_details_nouvelle_maree_1.png)
![Saisie des détails d'une nouvelle marée](sumaris_details_nouvelle_maree_2.png)

</div>

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Faire attention de bien sélectionner le programme **PIFIL 2**._

_L'exploitabilité des données saisies en découle !_

Les champs marqués * sont obligatoires :
* Programme de collecte
* Navire
* Port de départ
* Date de départ
* Heure de départ
* Port de retour
* Date de retour
* Heure de retour
* Utilisation d'un GPS

Les données concernant le retour peuvent être saisies ultérieurement.

<div style="clear:both"></div>

### Onglet Engins

<div style="float: right">

![Saisie des engins d'une nouvelle marée](sumaris_engins_nouvelle_maree_1.png)
![Saisie des engins d'une nouvelle marée](sumaris_engins_nouvelle_maree_2.png)

</div>

L'appui sur l'icône d'ajout d'un engin ![Ajout engin](sumaris_icone_ajout.png) permet d'afficher les entrées suivantes :

* Rechercher ![Rechercher engin](sumaris_icone_recherche_engin.png)
  * Lien vers l'[Écran Engin existant](#écran-recherche-engin-existant)
* Nouveau ![Nouvel engin](sumaris_icone_nouvel_engin.png)
  * Lien vers l'[Écran Nouvel engin](#écran-nouvel-engin)

<div style="clear:both"></div>

#### Écran Recherche engin existant

<div style="float: right">

![Recherche d'un engin existant](sumaris_recherche_engin_existant_1.png)
![Recherche d'un engin existant](sumaris_recherche_engin_existant_2.png)

</div>

Définir les date de début et de fin de période pour la recherche de l'engin.

La liste se rafraîchit automatiquement.

Sélectionner l'engin souhaité.

L'[Écran Détails de l'engin](#écran-détails-de-lengin) s'affiche.

<div style="clear:both"></div>

#### Écran Détails de l'engin

<div style="float: right">

![Détails d'un engin existant](sumaris_details_engin_existant_1.png)
![Détails d'un engin existant](sumaris_details_engin_existant_2.png)

</div>

Vérifier que les caractéristiques de l'engin correspondent bien à celui recherché.

L'icône **✔** de la barre de titre permet de valider la saisie. L'[Onglet Engins](#onglet-engins) s'affiche alors avec l'engin sélectionné.

L'icône **🔍** de la barre de titre permet de retourner à l'[Écran Engin existant](#écran-recherche-engin-existant).

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

#### Écran Nouvel engin

<div style="float: right">

![Création d'un nouvel engin](sumaris_details_nouvel_engin_1.png)
![Création d'un nouvel engin](sumaris_details_nouvel_engin_2.png)

</div>

Sélectionner le code (type) d'engin souhaité.

Les champs à renseigner pour la définition s'afficheront. Ils diffèrent d'un type d'engin à l'autre.

Les champs marqués * sont obligatoires.

L'icône **✔** de la barre de titre permet de valider la saisie.

L'[Onglet Engins](#onglet-engins) s'affiche alors avec l'engin nouvellement créé.

<div style="clear:both"></div>

### Onglet Opérations

<div style="float: right">

![Saisie des opérations d'une nouvelle marée](sumaris_operations_nouvelle_maree_1.png)
![Saisie des opérations d'une nouvelle marée](sumaris_operations_nouvelle_maree_2.png)

</div>

Un message d'information rappelle que toute marée doit commencer par un filage.

L'appui sur l'icône d'ajout d'une opération ![Ajout opération](sumaris_icone_ajout.png) permet d'afficher les entrées suivantes :

* Filage ![Ajout filage](sumaris_icone_ajout_filage.png)
  * Lien vers l'[Écran de saisie d'un filage](#écran-de-saisie-dun-filage)
* Virage ![Ajout virage](sumaris_icone_ajout_virage.png)
  * Lien vers l'[Écran de saisie d'un virage](#écran-de-saisie-dun-virage)

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Les marées étant liées entre elles (filage et virage), elles doivent être terminées et envoyées dans le bon ordre, sans quoi la base de données les refusera._

_L'application affichera un avertissement, le cas échéant._

_Ce point sera amélioré dans une version future._

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran de saisie d'un filage

<div style="float: right">

![Saisie d'un nouveau filage](sumaris_nouveau_filage_1.png)
![Saisie d'un nouveau filage](sumaris_nouveau_filage_2.png)

</div>

Les champs marqués * sont obligatoires.

<div style="clear:both"></div>

<div style="float: right">

![Saisie d'un nouveau filage](sumaris_nouveau_filage_3.png)
![Saisie d'un nouveau filage](sumaris_nouveau_filage_4.png)

</div>

L'icône **⌖** permet de renseigner automatiquement la position actuelle, via les données du GPS.

L'icône **💾** de la barre de titre permet d'enregistrer les données renseignées.

Retourner à l'[Onglet Opérations](#onglet-opérations) en appuyant sur l'icône **🡐** de la barre de titre.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran de saisie d'un virage

<div style="float: right">

![Saisie d'un nouveau virage](sumaris_nouveau_virage_1.png)
![Saisie d'un nouveau virage](sumaris_nouveau_virage_2.png)

</div>

Les champs marqués * sont obligatoires.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Un virage est obligatoirement lié à un filage. Celui-ci doit impérativement avoir été saisi au préalable._

<div style="clear:both"></div>

<div style="float: right">

![Saisie d'un nouveau virage](sumaris_nouveau_virage_3.png)

</div>

Appuyer sur le champ _**Opération associée**_ afin d'afficher l'écran de sélection de filage.

Sélectionner le filage souhaité.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

<div style="float: right">

![Saisie d'un nouveau virage](sumaris_nouveau_virage_4.png)
![Saisie d'un nouveau virage](sumaris_nouveau_virage_5.png)

</div>

L'[Écran de saisie d'un virage](#écran-de-saisie-dun-virage) s'affiche de nouveau, avec le filage sélectionné.

Les champs marqués * sont obligatoires.

L'icône **💾** de la barre de titre permet d'enregistrer les données renseignées.

<div style="clear:both"></div>

<div style="float: right">

![Captures accidentelles](sumaris_captures_accidentelles.png)

</div>

Si le champ _**Présence de capture accidentelle**_ a la valeur _**Oui**_, l'onglet _**Captures accidentelles**_ s'affiche.

L'appui sur l'icône d'ajout d'une capture accidentelle ![Ajout capture accidentelle](sumaris_icone_ajout.png) permet d'afficher l'[Écran de saisie d'une capture accidentelle](#écran-de-saisie-dune-capture-accidentelle).

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran de saisie d'une capture accidentelle

<div style="float: right">

![Saisie d'une nouvelle capture accidentelle](sumaris_nouvelle_capture_accidentelle_1.png)
![Saisie d'une nouvelle capture accidentelle](sumaris_nouvelle_capture_accidentelle_2.png)

</div>

Les champs marqués * sont obligatoires.

L'icône **✔** de la barre de titre permet de valider la saisie.

<div style="clear:both"></div>

<div style="float: right">

![Saisie d'une nouvelle capture accidentelle](sumaris_nouvelle_capture_accidentelle_3.png)
![Saisie d'une nouvelle capture accidentelle](sumaris_nouvelle_capture_accidentelle_4.png)

</div>

L'onglet des captures accidentelles s'affiche alors avec la capture accidentelle nouvellement créée.

L'icône **💾** de la barre de titre permet d'enregistrer les données renseignées.

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran d'édition d'une marée

Cet écran est le même que l'[Écran Nouvelle marée](#écran-nouvelle-marée).

Il permet de visualiser et de modifier toutes les données d'une marée.

<div style="text-align: center">

![Édition des détails d'une marée](sumaris_edition_maree_1.png)
![Édition des détails d'une marée](sumaris_edition_maree_2.png)
![Édition des détails d'une marée](sumaris_edition_maree_3.png)

</div>

Le bouton _**Terminer la saisie**_ permet de clôturer la marée.

Le bouton _**Envoyer**_ permet, **uniquement en cas de connexion à Internet**, de la synchroniser avec le serveur et des rendre ses données disponibles aux autres utilisateurs.

## Écran Mon compte

<div style="float: right">

![Profil](sumaris_profil.png)
![Préférences](sumaris_preferences.png)

</div>

L'écran _**Mon compte**_ permet principalement de pouvoir réinitialiser le mot de passe du compte utilisateur.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Les autres paramètres ne sont à utiliser qu'en connaissance de cause, au risque de détériorer les fonctionnalités de
l'application._

<div style="clear:both"></div>

<div style="page-break-after: always"></div>

## Écran Paramètres

<div style="float: right">

![Paramètres](sumaris_parametres_1.png)
![Paramètres](sumaris_parametres_2.png)

</div>

L'écran _**Paramètres**_ permet principalement de gérer le mode sombre de l'affichage.

<div style="color: #ffa500; font-size: large">

**⚠ AVERTISSEMENT !**

</div>

_Les autres paramètres ne sont à utiliser qu'en connaissance de cause, au risque de détériorer les fonctionnalités de
l'application._

<div style="clear:both"></div>
