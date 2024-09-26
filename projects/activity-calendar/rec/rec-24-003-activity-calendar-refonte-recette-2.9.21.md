# Activity Calendar - Recette MOE/MOA

## Retours de recette MOE - release 2.9.21

### Gestion des droits

- [ ] P1 (pas prioritaire pour la démo et urgent à tester car la gestion des droits est souvent source de bugs!) - Erreur "opérateur relationnel non valide" lors de l'affichage du tableau des calendriers avec tstq2
  [#729](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/729)

### Calendriers d'activité

- [ ] Erreur de chargement des données lors du filtrage (lieu d'immat, port d'exploit, enquêteur ...) et du tri sur la colonne Navire
  - Erreur Oracle : ORA-01791: cette expression n'a pas été SELECTionnée [#723](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/723)
- [x] **P0** - Erreur lors de la consultation de certains calendriers (Exception while fetching data (/data) : null). Impact la prédoc de certains calendriers ne s'affiche pas.
  Exemple : 3224068 - BELLE VUE - année 2022 [#689](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/689)
- [X] Erreur oracle lors de la suppression d'un calendrier "Impossible d'effectuer une suppression à partir de la vue sans exactement une table protégée par clé"

### Calendrier d'activité > Import [#715](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/715)

- [ ] **P0** - Il n'y a pas d'avancement ni de rapport affiché concernant l'import des calendriers vides.
  On a bien l'horloge, dans le menu de gauche, qui indique que la tâche est en cours mais on n'a pas le rapport.
  EN BDD, le PROCESSING_STATUS du traitement est à "CANCELLED". Les calendriers sont quand même bien importés. [#715](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/715)

### Calendriers d'activité > Filtres [#716](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/716)

- [x] **P0** - Année : Lors de la consultation d'un écran autre que le tableau de consultation des calendriers puis de ce tableau, le tableau ne ramène plus aucun résultat, en modifiant le filtre "Année", les résultats apparaissent de nouveau
- [ ] Navire : lors de la recherche par l'immat d'un navire qui a changé de nom, des fois c'est le nom actuel qui s'affiche, des fois c'est l'ancien
- [ ] Quand on applique un filtre sur une année il fonctionne (Ex : "Enquêteur"). Si on change d'année, le filtre ne s'applique plus. Mais si on rafraichit la liste, le filtre est bien appliqué.
  Le filtre devrait s'appliquer sans que l'on ait besoin de rafraichir la liste.
- [ ] Enregistrement des filtres : composant peu visible en noir

### Calendrier d'activité > Général [#717](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/717)

- [ ] Warning qualification : affichage du warning "Qualification xxx incohérente avec l'objectif" si l'objectif d'enquête directe est à "oui" et la qualification de l'enquête est "Directe" alors qu'il ne devrait pas s'afficher
- [ ] Warning inactivité annuelle : Afficher un warning si au moins un mois est actif et valeur est "oui"
- [ ] Plus d'avertissement si l'objectif d'enquête est à Non et si dans les caractéristiques, la qualitifcation de l'enquête est "Directe" [#686](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/686)

### Calendrier d'activité > Navire [#718](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/718)

- [ ] Caractéristiques navires : 
  - [ ] Certaines lignes ne sont pas fusionnées alors qu'elles auraient dû l'être (exemple 846740 - NARVAL année 2022)
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Carac_navire_fusion_lignes.PNG)
  - [ ] La pagination ne tient pas compte des lignes fusionnées, il y a donc des pages vides (exemple : 667404 - BEL ESPOIR en 2024)

### Calendrier d'activité > Calendrier

- [X] **P0** - Gestion des droits : en admin, le message "Vous n'êtes pas autorisé à saisir sur ce lieu" s'affiche alors que la saisie et la sauvegarde fonctionne 
  ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-002-2.9.20-Calendrier_gestion_droits.PNG)
- [ ] Actif ? : lors du passage de actif à inactif puis inactif à actif sans enregistrer, les nb de jours en mer, nb de jours de pêche et nb de personnes à bord sont perdus alors que les métiers, zones et gradients sont conservés [#736](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/736)
- [X] **P0** - Lieu d'immatriculation : Lorsque de la modification d'un calendrier puis de la reconsultation de celui-ci, le lieu d'immatriculation n'est plus présent, tous les champs du calendrier sont grisés et la saisie est bloquée. [#719](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/719)
  - [ ] Métier[#731](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/731) : 
    - [ ] La liste déroulante affiche les x 1ères valeurs mais n'affiche pas les x valeurs suivantes lors du scroll vers le bas
    - [ ] Le message pour indiquer qu'un métier est en doublon sur un mois ne s'affiche que quand le mois a le focus et ne bloque pas l'enregistrement
    - [ ] A rediscuter avec la MOA : Après enregistrement, les métiers sont triés par ordre de saisie au lieu de l'ordre alphabétique
- Gradient/Zône de pêche [#725](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/725)
  - [ ] Zone de pêche/gradient côte : erreur oracle lors de l'enregistrement si un métier d'un mois a 2 zones/gradient côte identiques (violation de contrainte unique SIH2_ADAGIO_DBA.FISHING_AREA_UNIQUE_KEY). Reprendre ce qui a été fait pour le métier pour restreindre la liste déroulante pour la zone 2 et afficher un message en cas de doublon via copier/coller
  - [ ] Gradients : bloquer la saisie du gradient côte, profondeur et zone proche lorsque la zone de pêche n'est pas renseignée
  - [ ] Profondeur : Trier la liste déroulante selon le rank_order
- [ ] Prédocumentation [#724](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/724):
  - [ ] Lorsque la prédocumentation n'existe pas pour certains mois, la colonne est affichée avec une source vide et est affichée quelque soit la source sélectionnée (exemple : 667404 - BEL ESPOIR en 2024)
  - [ ] Lorsqu'une seule source de prédc est sélectionnée, il n'y a pas forcément de métier dans le bloc #1. Possibilité de réorganiser les métiers ?
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-003-2.9.21-Predoc-sources-et-metiers.gif)
  - [ ] Après avoir copié la prédocumentation vers le calendrier, l'icône "copier" conserve un halo bleu
- [ ] Copier/coller [#726](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/726): 
  - [ ] Bloquer l'action "Coller" et afficher le message "Vous ne pouvez pas coller ici" dans le champ "Actif ?" lorsque la valeur copiée est "Inexistant" [#687](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/687)
  - [ ] Bloquer l'action "Coller" et afficher le message "Vous ne pouvez pas coller ici" lorsque les lignes "Nombre de jours de mer" ou "Nombre de jours de pêche" sont copiées vers les lignes "Actif ?", "Port d'exploitation", "Métier", "Zone de pêche", "Gradient côte", "Profondeur" ou "Zone proche". Actuellement ça vide la ligne
- [ ] Raccourcis clavier/focus cellule [#727](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/727) : 
  - [ ] Lorsqu'une cellule a le focus, l'utilisation de la flèche bas, met le focus sur la cellule en-dessous mais décale l'ensemble du tableau vers le bas
  - [ ] Lors de l'utilisation des flèches pour se déplacer puis de la touche "Entrée" pour entrer en édition, ce n'est pas la cellule qui a le focus qui entre en édition mais la dernière cellule cliquée
  - [ ] Lors de l'ajout d'un nouveau bloc métier, plusieurs colonnes peuvent avoir le focus (colonne en bleu). Pour reproduire : sur le dernier bloc métier, copier une cellule sur un mois, coller la cellule sur un autre mois, entrer en édition sur un 3ème mois
    ![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-003-2.9.21-Ajout_bloc_metier.gif)
- [X] **P0** - Violation de contrainte unique à l'enregistrement (SIH2_ADAGIO_DBA.VESSEL_USE_FEAT_UNIQUE_KEY) SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_VESSEL_USE_FEATURES. [#682](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/682)
  Pour reproduire : sur un mois non renseigné (données historiques ou non), sélectionner une valeur dans le champ "Actif ?", enregistrer, sélectionner un port d'exploitation, enregistrer

### Calendrier d'activité > Métiers

- [ ] Supprimer les cases à cocher qui n'ont pas d'utilité [#704](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/704)

### Calendrier d'activité > Formulaire terrain vierge [#696](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/696)

- [ ] Qualification de l'enquête : 
  - [ ] Afficher uniquement les qualitatives values avec STATUS_FK = 1 (ce qui permet de ne plus afficher les "Recopie 2021" et "Recopie 2022")
  - [ ] Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie)
- [ ] Vente : Trier les qualitatives values selon l'ordre alphabétique (pour être conforme au formulaire de saisie)

### Calendrier d'activité > Formulaire terrain avec données [#722](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/722)

- [ ] Erreur lors de la consultation du rapport si ACTIVITY_CALENDAR_RECORDER_PERSON_FK est null 
- [ ] Le titre présent dans le bandeau ne tient pas compte de l'option "Liste déroulante > Navires" des préférences utilisateurs
- [ ] Caractéristiques engins :
  - [ ] Afficher les PMFMs liés aux niveaux d'acquisition ACTIVITY_CALENDAR_GEAR_PHYSICAL_FEATURES et ACTIVITY_CALENDAR_GEAR_USE_FEATURES
  - [ ] Ordonner les métiers selon le même ordre que sur les onglets "Calendrier" et "Métiers" de l'écran de saisie

### Calendrier d'activité > Rapport d'avancement

- [ ] **P0** : Erreur oracle "Nombre d'arguments non valide" [#720](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/720)


## Retours de recette MOA - release 2.9.21.1

Recette faite par Emilie Le Roy le 25/09/2024

### Calendrier d'activité [#720](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/720)

- [ ] Menu contextuel : il manque toute la partie "editer le rapport".
- [ ] Remarque : Si on sélectionne un calendrier par coche, le menu contextuel disparait.

### Calendriers d'activité > Filtres [#716](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/716)

- [ ] Quand on filtre sur un lieu d'immat, que le filtre reste ouvert et que on change l'année, le filtre choisit s'efface.

### Calendrier d'activité > Calendrier

- [ ] Prédocumentation [#724](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/724):
  - [ ] Pour la source "SACROIS-OBSDEB", veiller à l'écrire tel que : "Sacrois-ObsDeb
- [ ] Métiers
  - [ ] Remarques : Le dénombrement des métiers ne se met pas à jour au fil de la saisie (il faut sauvegarder) [#731](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/731)
- [ ] Saisie [#734](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/734)
  - [ ] Pour la saisie des jm/jp, on peut passer d'une cellule à l'autre avec la flèche mais comme il faut forcément double-cliquer pour saisir, il est impossoble de saisir ces valeurs de manière fluide au clavier. Obligé de reprendre la souris.
  - [ ] Toujours au clavier, dans jm/jp, si je me deplace avec les flèche, je fais entrée pour saisir une valeur puis impossible de changer de case avec les flèches.

### Calendrier d'activité > Formulaire terrain vierge [#696](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/696)

- [ ] qualification de l'enquête : enlever recopies
- [ ] caract engins : première ligne ajouter "métier(s)" dans la case vide