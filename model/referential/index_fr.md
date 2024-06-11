# Modèle de données - Référentiels
---

### Classes communes

![common](model/referential/common.svg)

Chaque élément d'entité référentielle possède un identifiant numérique, un libellé unique (pour le code), un nom et une description complète.

---
### Lieux (terrestres ou en mer)

![location](model/referential/location.svg)

Note:
Une localisation peut être :
- une localisation territoriale (par exemple, Pays, port, criée...)
- une zone de pêche, sur n'importe quelle unité spatiale administrative en mer (par exemple, zone FAO, division ou sous-division CIEM, CGPM...)

Une localisation peut avoir une géométrie spatiale (zone, ligne, ou point) qui peut être utilisée par les capacités SIG de SUMARiS.

---
### Engin

Un engin est un engin de pêche ou un engin scientifique, utilisé par les navires lors d'un voyage.

Le code de l'engin provient d'un référentiel (généralement le code FAO), mais peut être étendu avec d'autres codifications d'engins (comme les codes d'engins nationaux, codes de campagnes à la mer).

---
### Espèces commerciales

Les espèces commerciales sont appelées "Groupe de Taxons" dans le modèle de données.

Les codes ASFIS de la FAO sont généralement utilisés, mais peuvent être étendus avec des codes nationaux.

---
### Espèces scientifiques

Les espèces scientifiques sont appelées "Taxon" dans le modèle de données.

Les codes proviennent de la base de données RefTax française, ou de tout autre code national;

---
### Paramètres collectés (PSFM)

![pmfm](model/referential/pmfm.svg)

Note:
Un PSFM est une association de :

- un Paramètre : ce qui est collecté (par exemple, une distance, un poids...);
    * Un paramètre a un type unique : numérique, alphanumérique, booléen, valeurs qualitatives;
    * Un paramètre peut définir des valeurs minimales et maximales;
- un Support : ce qui est mesuré;
- une Fraction : une partie de la matrice;
- une Méthode : comment obtenir la valeur de mesure;
- une Unité (par exemple mètres, kilogrammes...)

Cette classe permet de définir tout type de mesure, avec la précision attendue par tous les objectifs scientifiques.

---
### Autorisation de pêche 

Corpus, Pêcheries et tailles minimales autorisée

![regulation](model/referential/regulation.svg)

---
### Régionalisation

![spatial](model/referential/spatial.svg)
