# Cas d'utilisation fonctionnels

 - [Administration des référentiels]()
 - [Collecte des données]()
    * [CU Saisir une observation au débarquement]()
    * [CU Saisir un débarquement observé]()

## Administration des référentiels

(à venir)

## Collecte des données

### CU "Saisir une observation au débarquement"

![observed-location](../dist/use-case/collect/observed-location-uc.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle observation au débarquement : bouton +

2. Il saisit :

    * Programme de collecte;
    * Lieu d'observation (cf. partie "Variantes");
    * Date/heure de début de l'observation
    * Date/heure de fin (optionnel/invisible - suivant la configuration du programme)
    * Un ou plusieurs observateurs (au moins un obligatoire)
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Commentaire (optionnel)

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-new.svg)

3. Il peut ensuite ajouter/supprimer des navires observés :

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-vessels.svg)


#### Variantes

Projet SFA:
    * Lieu d'observation
        * Ile
        * District
        * Lieu de débarquement
  
(Le choix se pose de saisir une nouvelle observation ou de poursuivre sur cette observation et 
d'entrer l'effort)
 
### CU "Saisir un débarquement observé"

Objectif :

![landing](../dist/use-case/collect/landing-uc.svg)

#### Scénario principal

1. L'observateur demande la création d'un nouveau débarquement, rattaché à une observation sur site.

2. Il choisit :
    * Le navire observé (parmis la liste des navires identifiés précédemment)

3. Il saisie :
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Un commentaire (optionnel)

![landing-ui-new](../dist/use-case/collect/landing-ui-new.svg)

4. Il peut ensuite saisir la capture débarquée par métier :
    * Nombre d'engin
    * Nombre d'hameçons
    * Temps passé à pêcher
    * Profondeur minimum (m)
    * Profondeur maximum (m)
    * La capture (cf point 5)
    * Un commentaire (optionnel)

![landing-ui-new](../dist/use-case/collect/landing-ui-samples.svg)

5. Il peut ensuite ajouter/supprimer des captures :
    * Espèce
    * Poids (kg)
    * Nombre d'individus
    * Type de packaging


6. L'utilisateur sauvegarde ses modifications

#### Variantes

Projet SFA:
    * Autres caractéristiques/paramètres
        * Métiers observés
        * Nombre d'hommes à bord
        * Principale zone de pêche
        * Gradient de distance à la côte
        * Vent
        * Courant

### Variante 1.a - Débarquement sans observation parente

1. L'observateur demande la création d'un nouveau débarquement, sans
   rattachement à une observation sur site (ex: collecte opportuniste)

2. Il saisit :

    * Le programme de collecte;
    * Le navire observé:
    * Le lieu du débarquement;
    * La date et l'heure du débarquement.
    * Les observateurs (au moins un obligatoire)
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Un commentaire (optionnel)

\[Retour au 3]
