# ObsVentes - Recette MOA sur la démo 2 

## Présentation démo 2 MOA 

- [Présentation](/projects/obsvente/not/not-24-004-obsventes-refonte-demo-moa-2.9.19.md)
- [Retours de recette](#point-moa---25072024)

---

## Retours de recette MOA (Marion Scavinner, Elise Bultel)


### Cas d'usage

- [X] On est pas familières avec les requêtes, est-il attendu que nous les vérifions? Si non, pourquoi les afficher ici?
  - Les requêtes ont été supprimées des cas de tests MOA (utile uniquement pour les cas de tests MOE)
- [X] " La zone d'accès au lot d'espèce est activable. " : pas compris: que voulez-vous dire?
  - _MOE : modifié par "l'accès à la vente"_
- [X] "Le PETS est supprimé sans erreur. " De quel PETS s'agit-il?
  - _MOE : L'action du cas de test à été détaillée_
- [X] "La zone d'accès au lot d'espèce est activable. " : pas compris: que voulez-vous dire?
- [X] "#" ça veut dire quoi déjà ?
  - _MOE : La colonne "#" indique qu'il s'agit d'une colonne d'identifiant d'entité en base de données ou d'énumération. Elle sera masquée pour les observateurs (affichée uniquement pour les administrateurs)._
- [X] On ne peut pas garder l'information des mensurations après avoir dénombré. on revient sur l'onglet Lot et la fenetre mensurations est vide si on y retourne.
  - _MOE : Action du cas de test modifié_
- [X] Supprimer pour les DOM : Warning 15 espèces observées min
  - _MOE : Action du cas de test supprimée_


### Communs 

- [ ] Elise trouve que la formulation de confirmer supprimer pourrait être plus claire/explicite: là il y a un doute entre annuler et abandonner les modifs à mon sens (j'avais déjà remarqué sur Imagine), quelle différence entre annuler et abandonner?
  - _MOE_ :
    - _"Annuler" permet de fermer cette fenêtre sans sauvegarder et sans perdre ce que l'on saisi_
    - _"Abandonner les modifications permet d'annuler ce que l'on a saisit sans sauvegarder_ 

![rec-obsventes-cancel](/projects/obsvente/rec/images/rec-24-001-2.9.19.2-annuler-sans-sauvegarder.png)


### Sortie > Echantillonnages en métropole 
- [Spécifications](/projects/obsvente/spe/collecte_de_donnees.md#sortie--echantillonnages-en-métropole)
- Remarques  : 
  - Il manque les éléments suivants dans le tableau de l'échantillonnage :
      - [ ] Espèce scientifique
      - [ ] Zone de peche
      - [ ] Type de vente
        - _MOE : Le type de vente est saisissable dans la vente_

- [X] Ajouter plusieurs PETS fonctionne, à condition de renseigner l'espèce commerciale de l'ajout précédent
- [ ] Dans la liste déroulante des PETS proposées, on peut resaisir une espèce déjà ajoutée précédemment. et il ya deux fois le POK de proposé.
  - _MOE : Un des POK a été remplacé par une autre espèce_
- [ ] Erreur sur le bouton ((+) :
  - _MOE : A reproduire pour avoir la stacktrace_
  - _MOE : Le bouton ne sera présent que pour l'OM afin de rechercher des espèces déjà observées (future release)_ 
![rec-obsventes-ajout-pets](/projects/obsvente/rec/images/rec-24-002-2.9.19.2-ajout-pets.png)

- [ ] Une liste d'espèce apparait bien mais il ne nous est pas possible de savoir s'il s'agit d'un tirage aléatoire depuis une liste prédéfinie
  - MOE : Problème remonté (implémenté en 2.9.20)
- [ ] Erreur à la sauvegarde : 
  - _MOE : reproduit en 2.9.19, a corriger dans les prochaines release_
![rec-obsventes-sauvegarde](/projects/obsvente/rec/images/rec-24-003-2.9.19.2-sauvegarde.png)

```
update SIH2_ADAGIO_DBA_SUMARIS_MAP.landing set comments=?, control_date=?, creation_date=?, landing_date_time=?, landing_location_fk=?, observed_location_fk=?, program_fk=?, qualification_comments=?, qualification_date=?, quality_flag_fk=?, rank_order=?, recorder_department_fk=?, recorder_person_fk=?, trip_fk=?, update_date=?, validation_date=?, vessel_fk=? where id=?
Jul 18 11:16:30 visi-docker-val4 dockersvc_sumaris-pod[1997197]: 2024-07-18 11:16:30,098 WARN  [http-nio-8080-exec-4] o.h.engine.jdbc.spi.SqlExceptionHelper     : SQL Error: 1, SQLState: 23000
Jul 18 11:16:30 visi-docker-val4 dockersvc_sumaris-pod[1997197]: 2024-07-18 11:16:30,098 ERROR [http-nio-8080-exec-4] o.h.engine.jdbc.spi.SqlExceptionHelper     : ORA-00001: violation de contrainte unique (SIH2_ADAGIO_DBA.LANDING_UNIQUE_KEY)
Jul 18 11:16:30 visi-docker-val4 dockersvc_sumaris-pod[1997197]: ORA-06512: à "SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_LANDING", ligne 11
Jul 18 11:16:30 visi-docker-val4 dockersvc_sumaris-pod[1997197]: ORA-04088: erreur lors d'exécution du déclencheur 'SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_LANDING'
```

Contrainte d'unicité SIH2_ADAGIO_DBA.LANDING_UNIQUE_KEY :
```
LANDING_DATE_TIME	1
VESSEL_FK	2
PROGRAM_FK	3
RANK_ORDER	4
```

- **Point en suspend MOA** : Marion et Elise réflechissent à l'ordre de saisie des informations liées à la sortie (a priori les infos zone de peche seraient dans l'onglet détails de la sortie) : à confirmer
- A échanger avec la MOA

### Sortie > Echantillonnages en outremer
- [Spécifications](/projects/obsvente/spe/collecte_de_donnees.md#sortie--echantillonnages-en-outremer)
- Remarques  :
  - Il n'y aura pas de tirage aléatoire des espèces pour les DOM (ni de priorité). On pourra retirer les élements suivants:
    - [ ] Observé ? (car si espèce ajoutée par l'obs, c'est qu'elle a été observée)
    - [ ] Raison de non obs (car l'espèce ne sera pas ajoutée si pas observée)
    - _MOE : Spécifications : supprimer la colonne "Observé ?"_
  - [ ] Les types de ventes seront différents dans les DOM et il n'y a pas de criée ; il faudra p-e compléter et sélectionner les options du référentiel uniquement valables pour les DOM pour alléger la saisie pour ces territoires

- _MOE : cas d'usage à faire dans la partie régionalisation : Régionaliser les types de ventes (en P2)_


- **Point en suspend MOA** : Pour l'OM, on va voir si besoin de PETS dans la stratégie mais pas sûr (Marion a un point vendredi prochain sur le sujet)

### Vente > Détails
- [Spécifications](/projects/obsvente/spe/collecte_de_donnees.md#vente--détails)

- Remarques  : 
  - [ ] On peut ouvrir une vente à partir des espèces trirées au sort mais pas à partir des PETS : message d'erreur code 500 précédemment rencontré 
    - _MOE : Non reproduit (à reproduire)_
  - [ ] Utilité du champ Navire dans l'onglet Echantillonnage car il n'est pas renseignable ici
    - _MOE : A masquer si besoin (ou mettre à la fin)_
  - [X] Au niveau de la saisie du navire, le bandeau bleu clair indique "Marquage extérieur": à remplacer par "Immatriculation"
    - _MOE : c'est corrigé (Option rajouée dans les Paramètres de l'application)_
    
![rec-obsventes-etting-immat-navire](/projects/obsvente/rec/images/rec-24-005-2.9.19.2-setting-immat-navire.png)

  - [ ] La liste des lots à échantillonner s'ouvre bien mais comme on est partie d'une espèces pour ouvrir la vente, on se demande pouquoi là il faut à nouveau renseigner cet élément
  - [ ] Lenteur : chargement à la sauvegarde bien long (quasi 30'')
    - _MOE : A analyser (problème de requête ?)_
  - [ ] Une fois qu'on a saisi le navire dans la vente, apparait-il dans l'onglet Echantillonnage au niveau de l'espèce ? 
    - _MOE : Oui (problème connu de sauvegarde du lien entre la vente et la sortie dans la version 2.9.19)_

### Vente > Lots espèces
- [Spécifications](/projects/obsvente/spe/collecte_de_donnees.md#vente--lots-espèces)

- Remarques  : 
  - [ ] Pas de liste déroulante proposée pour l'espèce scientifique
    - _MOE : Non reproduit (Pour quelle espèce commerciale ?)_
  - [ ] L'espèce associée au lot n'est pas automatiquement renseignée, on a du aller le saisir depuis la liste déroulante
    - _MOE : Ok, déjà remonté_

### Vente > Lots espèces > Mesures individuelles
- [Spécifications](/projects/obsvente/spe/collecte_de_donnees.md#vente--lots-espèces--mesures-individuelles)

- Remarques  : 
  - [ ] Perturbant d'avoir 2 endroits où saisir la mm chose : soit avec le bouton + à gauche directement dans le tableau soit à droite dans le tableau mensurations : choisir l'un ou l'autre
    - _MOE : Nous allons garder une des 2 fonctionnalités_
  - [ ] Il faudra une cohérence entre types et unités de mesures avec les espèces car longueur totale ne correspond pas à toutes les espèces (parfois  c'est LF, ou LC etc.)
    - _MOE : Mode bureau : tableau avec + et si besoin, afficher la modale à droite de saisie au kilomètre_
  - Dénombrement : 
    - [ ] On remarque un sujet problématique: quand on renseigne le tableau des dénombrements, on s'étonne de ne pas pouvoir renseigner les longueurs associées de manière rapide/itérative. Et là quand on renseigne 10 ind par ex, alors qu'on a saisi 4 ind dans le tableau Lots, ça ne change rien.
    - [ ] Avez-vous compris que dénombrement était utile uniquement si il n'y a pas de mensurations associées ? si c'est le cas nous aurons besoin d'en reparler car il faut pouvoir dénombrer par taille. On ne dénombrera jamais sans tailles associées dans ObsVentes (dans ObsMer oui)
      - _MOE : A creuser avec la MOA car ce n'est pas clair avec le besoin exprimé par Vincent Badts_
        - _Si aucun PSFM pour l'espèce, on passe automatiquement au dénombrement (à confirmer)_
        - _Ajouter une colonne nombre d'individu (rendre activable)_
  - [ ] Pourquoi afficher le poids (qui n'est pas renseignable de toute façon) alors que le protocole OV demande le poids global de l'espèce et pas individuel?
    - _MOE : Normalement c'est le poids calculé RTP (en italique car calculé). Manque une énumération._


### Point MOA - 25/07/2024

## Ordre du jour 

Points proposés par la MOE :
- [X] Retours de recette MOA 2.9.19
- [X] Spécifications saisie des mensurations (cas d'usage)
- [ ] OM : On va voir si besoin de PETS dans la stratégie mais pas sûr (Marion a un point vendredi prochain sur le sujet)
- [X] Contenu de la présentation du 10/09 (présentation d'un cas d'usage saisie métropole et outre-mer, données réelles)

Points proposés par la MOA : 
- [ ] Ou mettre "type de vente"
- [ ] Champs validation : revoir labels en adéquation avec CCTP : contrôle observateur, vérification société et validation programme
- [X] Priorité ajout métiers : V1. Mais pb de plusieurs métiers : comment gérer ça ?
- [ ] Dans les DOM : mm espèces peuvent être capturées par différents métiers
- [ ] Revenir sur ObsVentes sans S (et Guyanne avec 2 N..) : souhait d’exploration des impacts pour corriger ces erreurs : pas très professionnel de garder tel quel
- [ ] MAJ Phase au lieu de Stade sur maturité crevettes
- [ ] Vue en tableau ne marche pas sur Allegro
- [X] Retour question Vincent sur transfert ObsDeb


## Compte rendu

- Informations congés : 
  - Congés Elise Bultel (MOA) : du 15/08/2024 au 08/09/2024
  - Congés Johann Le Traon (MOA) : du 12/08/2024 au 24/08/2024 
- Démonstration du 10/09/2024 
  - Se baser sur un [formulaire terrain remplit envoyé](/projects/obsvente/doc/obsventes-doc-24-008-jeu_de_données_OBSVENTES.pdf) le 25/07/2024 par Johann Le Traon 
  - Coeur de la saisie : saisie des mensurations - Discriminant pour la démo du 10/09/2024


### Retours de recette MOA 2.9.19 

- **Ecran des échantillonnages**
  - Choix de la présence et de la position du champ navire

- **Ecran d'une vente** : 
  - Vente : Ajout d'un champ métier en V1 (comme dans Imagine)
    - A voir comment gérer pour les DOMs (plusieurs métiers)
  - Avoir un bouton controler la saisie et pouvoir supprimer les lots vides

- **Ecran de saisie des lots** :
  - Espèce commerciale : doit être automatiquement renseignée
  - Espèce scientifique : à supprimer
  - Mobile :
    - Ne pas avoir la colonne nombre d'individu échantillonné mais garder le nombre sur l'icone des mesurations
  - Bureau :
    - Ne garder que le nombre d'individu échantillonné (ne pas garder le nombre sur l'icone des mesurations)
  - Poids total :
    - Pouvoir saisir le poids total calculé
    - Pouvoir saisir la formule pour calculé le poids total (11+12+13)
    - **Prototypage à proposer et à présenter pour validation**
  - Poids échantillonné :
    - Pouvoir le copier du poids RTP ou le saisir manuellement
    - Mettre un message pour dire que le poids RTP à changé et pouvoir proposer la recopie vers le poids échantillonné

  
- **Ecran de saisie des mensurations** :
  - Mode saisie de mensuration : rajouter un champ pour saisir le nombre d'individu pour pouvoir saisir plusieurs individus dans une même classe de taille
    - Par défaut à 1 et le champ doit pouvoir être figé
  - Sur ObsVentes il y a obligatoirement des mensurations (pas de dénombrement seul)
    - En OM : peut être le besoin
    - Le mode dénombrement actuellement présent (à renommer) peut être activé/désactivé par une option (géré dans ObsVentes Métrople/OM et dans ObsMer)
  - Prévoir un bouton ((+) pour ajouter un tableau de mensuration avec un min/max pour que l'utilisateur saisira le nombre d'individu par classe de taille (comme dans l'allegro actuel)

- **Ecran de saisie des mensurations** :
  - Pouvoir générer un formulaire des données saisies 
    - En attente de fourniture d'un formulaire pdf de rapport Allegro
    - Se baser sur https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/doc/obsventes-doc-24-001-Formulaire_terrain_OBSVENTES.pdf?ref_type=heads
    - Garder la vue en arbre des lots https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsmer/doc/obsmer-doc-24-006-Formulaire_validation_OBSMER_2020.pdf?ref_type=heads

Pas de restitution aux professionnels (pour ObsVentes). A y penser pour l'OM ?


- **Transfert ObsDeb -> ObsVentes**
  - Besoin de faire du lien entre les programmes (OM)
  - Plus vraiment d'actualité car la saisie sera d'abord faites sur Obsventes (saisie tablette) puis sur Obsdeb  (saisie pc)
    - Point spécifique à faire


### Décisions 

- Maquettage à faire sur les écrans des mensurations/dénombrement (pendant le mois d'aout)
- **Ne pas faire de démonstration aux coordinateurs de façade et aux correspondants régionaux (trop tôt)**
  - Mail de communication sur le report, envoyé le 25/07/2024
  - **Garder le créneau du 10/09 avec la MOA pour présenter le maquettage de la saisie des mensurations**




