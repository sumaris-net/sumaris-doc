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
    * Date/heure de début de l'observation;
    * Date/heure de fin (optionnel/invisible - suivant la configuration du programme).
    * Un ou plusieurs observateurs (au moins un obligatoire).
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Commentaire (optionnel)

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-new.svg)

3. Il peut ensuite ajouter/supprimer des navires observés :

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-vessels.svg)


#### Variantes

Projet SFA:
    * Lieu d'observation;
        * Ile;
        * District;
        * Lieu de débarquement;
  
(Le choix se pose de saisir une nouvelle observation ou de poursuivre sur cette observation et 
d'entrer l'effort)
 
### CU "Saisir un débarquement observé"

Objectif :

![landing](../dist/use-case/collect/landing-uc.svg)

#### Scénario principal

1. L'observateur demande la création d'un nouveau débarquement, rattaché à une observation sur site.

2. Il choisit :
    * Le navire observé (parmi la liste des navires identifiés précédemment);

3. Il saisie :
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Un commentaire (optionnel);

![landing-ui-new](../dist/use-case/collect/landing-ui-new.svg)

4. Il peut ensuite saisir la capture débarquée par métier :
    * Nombre d'engin;
    * Nombre d'hameçons;
    * Temps passé à pêcher;
    * Profondeur minimum (m);
    * Profondeur maximum (m);
    * Un commentaire (optionnel);
    * La capture (cf point 5);

#### Variantes

Projet SFA:
    * Autres caractéristiques/paramètres;
        * Métiers observés;
        * Nombre d'hommes à bord;
        * Principale zone de pêche;
        * Gradient de distance à la côte;
        * Vent;
        * Courant;

### Variante 1.a - Débarquement sans observation parente

1. L'observateur demande la création d'un nouveau débarquement, sans
   rattachement à une observation sur site (ex: collecte opportuniste)

2. Il saisit :

    * Le programme de collecte;
    * Le navire observé:
    * Le lieu du débarquement;
    * La date et l'heure du débarquement;
    * Les observateurs (au moins un obligatoire);
    * Les autres caractéristiques/paramètres, collectés pour le programme;
    * Un commentaire (optionnel);

\[Retour au 3]

![landing-ui-new](../dist/use-case/collect/landing-ui-samples.svg)

### CU "Saisir les captures débarquées"

5. Il peut ensuite ajouter/supprimer des captures:
    * Pour les captures individuelles :
        * Espèce;
        * Poids (kg);
        * Nombre d'individus;
        * Type de packaging;
        * Préservation (champs obligatoire);
    * Pour les captures en paquets : 
        * Différencier les paquets homogènes (une seule espèce), 
          des paquets hétérogènes (composition d'espèces);
          (1 ligne par type de composition de paquets)
        * Echantillonner de 1 à 6 paquets par type de paquet, puis ;
          compléter par composition de paquet (tableau de regroupement) :
            * Nombre total de paquets comptés par type de composition;
            * Ajouter les espèces qui composent le paquet (1 ligne = 1 espèce);
            * Ajouter le poids des paquets échantillons (1 colonne = 1 paquet échantillon);
            * Ajouter la proportion (%) de présence de chaque espèce (ligne) par paquet (colonne);
              La somme des pourcentage doit être égale à 100 %;
                Si somme des % < 100 % : message Warning !
                Si somme des % > 100 % : message erreur !
            * Le poids total (kg) de chaque espèce est calculé par composition de paquet
            
6. L'utilisateur sauvegarde ses modifications

### CU "Saisir les ventes"


### CU "Saisir les dépenses"


