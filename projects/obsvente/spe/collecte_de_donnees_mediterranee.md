# Collecte de données - Méditerranée
## Spécifications (ObsVentes)

---
## Sommaire

- [Vente > Détails](#vente--détails)
- [Vente > Lots espèces](#vente--lots-espèces)


---

## Vente > Détails

**REF: OBSVENTES/SORTIE/VENTE/DETAILS**

![ui-obsvente](/projects/obsvente/spe/images/med/sale-mediterranee-details.svg)

La création de lots d'espèces, pour la façade Méditerranée, est accessible depuis le tableau des échantillonnages en cliquant sur l'icône :page_facing_up:

La particularité de la collecte de données en Méditerranée est qu'une espèce commerciale, de différentes tailles, peut provenir de plusieurs bateaux.

Il convient donc de créer autant de vente qu'il y a de bateau, ayant pêché l'espèce commerciale à échantillonner.

#### Scénario principal

1. Le saisisseur demande la création d'un lot d'espèces
2. L'écran "Nouveau lot" s'ouvre, il est composé de 2 onglets :
   * "Détails" (onglet par défaut)
   * "Lots #1" (onglet du lot correspondant au premier navire à renseigner)
3. Sur l'onglet "Détails", le saisisseur renseigne les détails d'une vente* ou de plusieurs ventes (un bateau est associé à une vente) :
   * Le navire #1*
   * Le type de vente*
   * Le lieu de vente
   * La date/heure de vente*
   * Les métiers (non obligatoire)
     * La liste des métiers est régionalisée
     * Il est possible de rajouter plusieurs métiers (:heavy_plus_sign:)
       * Le premier métier constitue le métier principal. Il est obligatoire
       * Les autres métiers ajoutés constituent les métiers secondaires
     * Il est possible de supprimer des métiers (:heavy_multiplication_x:)
   * Les zones de pêche (non obligatoire)
     * La liste des zônes de pêche est régionalisée
       * Zones CIEM ?
     * Il est possible de rajouter plusieurs zones de pêche (:heavy_plus_sign:)
     * Il est possible de supprimer des zones de pêche (:heavy_multiplication_x:)
   * Commentaires
4. Le saisisseur peut ajouter plusieurs ventes si l'espèce provient de différents bateaux (:heavy_plus_sign:)

![ui-obsvente](/projects/obsvente/spe/images/med/sale-mediterranee-vessels-details.svg)

   * A chaque ajout, une nouvelle vente est créée, associée à un nouveau navire
     * Un onglet "Lots _#X_" est créé
   * Le libellé du navire est incrémenté (_#X_)
   * Il n'est pas possible de choisir un navire déjà renseigné dans une vente existante
   * Le saisisseur renseigne les détails de la nouvelle vente (retour en 3)

5. Le saisisseur peut supprimer une vente (:heavy_multiplication_x:)
6. Le saisisseur clique sur l'onglet d'un lot "Lots _#X_" (REF: OBSVENTES/SORTIE/VENTE/LOT#)


**Variante(s) :**

**Variante 3a :** Remplissage auto de la date de la vente 

En mode terrain, il est possible d'activer une case à cocher, dans le bandeau de l'écran, permet d'initialiser la date/heure de la vente avec la date/heure courante (stocké dans les préférences locales).

---
## Vente > Lots espèces

**REF: OBSVENTES/SORTIE/VENTE/LOTS#**

![ui-obsvente](/projects/obsvente/spe/images/med/sale-mediterranee.svg)

Le saisisseur accède à l'onglet "Lots" de l'écran de création des lots.

#### Scénario principal

1. L'onglet "Lots _#X_" s'ouvre. Les informations suivantes sont affichées pour chaque lot :
   * L'espèce commerciale
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le taux échantillonné
   * Le poids échantillonné
   * Identification à confirmer
2. Le saisisseur demande la création d'un nouveau lot via l'icône :heavy_plus_sign:
3. L'espèce commerciale est automatiquement renseignée avec l'espèce du tableau des espèces à observer
4. Pour chaque lot, le saisisseur renseigne :
   * La catégorie de tri terrain
   * La catégorie UE
   * L'état*
   * La présentation*
   * Le taux échantillonné
   * Le poids échantillonné
   * Identification à confirmer
5. Le saisisseur enregistre
6. Le bandeau de l'écran affiche "Lieu de sortie / Espèce / Navire (Immatriculation et nom)"
7. Le saisisseur peut ajouter des photos de la caisse du lot
8. Le Saisisseur peut saisir un commentaire sur le lot
9. Le saisisseur ajoute des mesures individuelles (REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES)


NB : La fonctionnalité d'ajout d'une photo sur chaque individu est décrit dans [les spécifications communes / Mesures](/projects/common/spe/regles_communes.md#commun-saisie-de-mensuration)


**Variante(s) :**

**Variante 4a :** 
4. Le saisisseur copie/colle un lot pour faire une nouvelle saisie via la case à cocher d'une ligne puis l'icône de recopie [Retour en 5]

---
## Vente > Lots espèces > Mesures individuelles

**REF: OBSVENTES/SORTIE/VENTE/LOT/MESURES**

La création de mesures individuelles est accessible depuis le tableau de consultation des lots en cliquant sur l'icône :bar_chart:

#### Scénario principal

[Spécifications communes / Mesures](/projects/common/spe/regles_communes.md#commun-saisie-de-mensuration)

---
## Historique

|       Date | Sections mises à jour                                                                 |
|-----------:|---------------------------------------------------------------------------------------|
| 11/03/2025 | Création                                                                              |
