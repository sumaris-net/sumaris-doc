# Spécifications des règles de gestion des droits d'accès des utilisateurs aux programmes de collecte

<div style="text-align: center; font-size: x-large">
Table des matières
</div>

<br>
<br>
<br>

<!-- TOC -->
* [Spécifications des règles de gestion des droits d'accès des utilisateurs aux programmes de collecte](#spécifications-des-règles-de-gestion-des-droits-daccès-des-utilisateurs-aux-programmes-de-collecte)
* [Demandeur](#demandeur)
  * [Rôles éligibles](#rôles-éligibles)
  * [Écran d'accueil](#écran-daccueil)
  * [Fenêtre de sélection du programme de collecte](#fenêtre-de-sélection-du-programme-de-collecte)
  * [Fenêtre d'envoi d'un message de demande de droits](#fenêtre-denvoi-dun-message-de-demande-de-droits)
  * [Écran Mon compte](#écran-mon-compte)
* [Valideur](#valideur)
  * [Rôles éligibles](#rôles-éligibles-1)
  * [Interface de validation](#interface-de-validation)
<!-- TOC -->

# Demandeur

## Rôles éligibles

Le demandeur peut avoir les rôles suivants :

 * _**Invité**_
 * _**Observateur**_
 * _**Superviseur**_
 * _**Administrateur**_

## Écran d'accueil

À la connexion, si l'utilisateur n'a de droit d'accès sur aucun programme, les éléments conditionnels suivants s'affichent :

 * Message d'information
   * "Vous n'avez actuellement aucun droit d'accès à un programme de collecte."
 * Bouton _**Demander l'accès à un programme de collecte**_
   * Affichage vers la [Fenêtre de sélection du programme de collecte](#fenêtre-de-sélection-du-programme-de-collecte)

![Splash écran d'accueil](images/home-splash-no-access-rights.svg)

## Fenêtre de sélection du programme de collecte

La fenêtre est modale.

![Sélection du programme de collecte](images/program-access-rights-request-selection.svg)

Elle comprend les composants suivants :

 * Liste déroulante _**Programmes de collecte**_
   * Sélection multiple
   * Affiche tous les programmes de collecte actifs de la base de données
 * Bouton _**Suivant**_
   * Affichage de la [Fenêtre d'envoi d'un message de demande de droits](#fenêtre-denvoi-dun-message-de-demande-de-droits)
 * Bouton _**Annuler**_
   * Retour à l'[Écran d'accueil](#écran-daccueil)

## Fenêtre d'envoi d'un message de demande de droits

La fenêtre est modale.

![Message demande de droits](images/program-access-rights-request-message.svg)

Elle comprend les composants suivants :

 * Liste déroulante _**Type d'envoi**_
   * Valeur sélectionnée
     * "E-mail"
   * Désactivée
   * Masquée (si possible)
 * Champ de saisie _**Destinataire**_
   * Valeur renseignée
     * Groupe de superviseurs du programme de collecte demandé
       * Tous les utilisateurs ayant le rôle _**Superviseur**_ et l'accès au programme de collecte demandé
  * Désactivé
  * Masqué (si possible)
 * Champ de saisie _**Objet**_
   * Valeur renseignée
     * "Demande de droit d'accès au programme de collecte _**Programme demandé**_"
   * Désactivé
 * Champ de saisie _**Message**_
   * Activé 
 * Bouton _**Envoyer**_
   * Envoi du message
   * Cas de sélection d'un seul programme de collecte
     * Affichage de l'[Écran d'accueil](#écran-daccueil)
   * Cas de sélection de plusieurs programmes de collecte
     * Si pas dernière occurrence
       * Affichage de la [Fenêtre d'envoi d'un message de demande de droits](#fenêtre-denvoi-dun-message-de-demande-de-droits) pour l'occurrence suivante
     * Si dernière occurrence
       * Affichage de l'[Écran d'accueil](#écran-daccueil)
 * Bouton _**Annuler**_
   * Cas de sélection d'un seul programme de collecte
     * Affichage de l'[Écran d'accueil](#écran-daccueil) 
   * Cas de sélection de plusieurs programmes de collecte
     * Si pas dernière occurrence
       * Affichage de la [Fenêtre d'envoi d'un message de demande de droits](#fenêtre-denvoi-dun-message-de-demande-de-droits) pour l'occurrence suivante
     * Si dernière occurrence
       * Affichage de l'[Écran d'accueil](#écran-daccueil)

## Écran Mon compte

L'utilisateur aura accès, dans les données de son compte, à la liste des programmes de collecte auxquels il a souscrit.

![Sélection du programme de collecte](images/program-access-rights-management-account.svg)

Chaque ligne de la liste comprend les éléments suivants :
 * Nom du programme de collecte
 * Statut des droits d'accès
   * "Actif"
   * "En cours de validation"
 * Bouton _**Suppression**_
   * Affichable au survol
   * Affichage d'un message de confirmation de suppression
   * Suppression des droits
     * Hard delete ou soft delete ?

La dernière ligne de la liste comprend un lien cliquable "+ Ajouter" :
 * Affichage vers la [Fenêtre de sélection du programme de collecte](#fenêtre-de-sélection-du-programme-de-collecte)

# Valideur

## Rôles éligibles

Le valideur peut avoir les rôles suivants :

 * _**Superviseur**_
 * _**Administrateur**_

S'il est _**Superviseur**_, il doit, en outre, avoir pour lui-même les droits d'accès pour le programme auquel il veut donner les droits à un autre utilisateur.

## Interface de validation