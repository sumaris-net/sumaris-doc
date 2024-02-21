# Modèle de données -  Données collectées

---
### Éléments communs

![data](model/data/common.svg)

Note:
Chaque donnée collectée a une entité racine, liée à un programme.

- Une entité racine peut être liée à un navire de pêche (voir ci-dessous : Voyage, Débarquement, ...)
- Une entité racine a des attributs de qualité des données :
  * Une date de mise à jour, pour identifier la version exacte ;
  * Un département et une personne saisisseur ;
  * Un indicateur de qualité (par exemple, Bon, Mauvais, Hors stats, ...) utilisé pour exclure les mauvaises données lors des exportations ou des produits cartographiques ;

---
### Campagnes scientifiques en mer

![scientific-cruise](model/data/scientific-cruise.svg)

---
### Marées

![trip](model/data/trip.svg)

Note:
- Trip: une marée réalisée par une unique navire.
  * Une marée commence à partir d'un lieu (et date/heure) de départ et se termine à un lieu de retour;
  * Une marée peut définir un ou plusieurs engins de pêche physiques : un engin (par exemple OTB) et ses caractéristiques physiques;
  * Une marée peut avoir de nombreuses opérations, comme des sous-éléments;

- Opération : Une opération de pêche unique, utilisant un unique engin physique (engin de pêche ou engin scientifique) .
  * Une opération peut définir certaines caractéristiques, en fonction du type d'engin utilisé;

---
### Débarquements

![landing](model/data/landing.svg)

Note:
- ObservedLocation : Sortie sur un site (port, criée)
  * Une sortie est définie par une date/heure (ou une période) et un site (un port, une criée, une plage);
  * Une localisation observée peut avoir de nombreux débarquements (un ou plusieurs par navire) comme sous-éléments.

- Landing: Une observation d'un navire, réalisée au moment du débarquement
  * Un débarquement peut avoir une sortie comme élément parent;
  * Un débarquement peut avoir de nombreuses marées comme sous-éléments;

---
### Calendrier d'activité

![activity-calendar](model/data/activity-calendar.svg)

---
### Zone de pêche

![fishing-area](model/data/fishing-area.svg)

---
### Caractéristiques d'utilisation navire

![vessel-use-features](model/data/vessel-use-features.svg)

---
### Caractéristiques d'utilisation engin

![vessel-use-features](model/data/gear-use-features.svg)

---
### Armateurs

![vessel-owner](model/data/vessel-owner.svg)
