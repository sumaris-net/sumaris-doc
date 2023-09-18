# Modèle de données

## Référentiels
---
### Classes communes

![common](model/referential/common.svg)

---
### Lieux (terrestres ou en mer)

![location](model/referential/location.svg)

---
### Paramètres collectés (PSFM)

![pmfm](model/referential/pmfm.svg)

---

## Données collectées
---
### Campagnes scientificque en mer


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
- ObservedLocation : Sortie sur un site
  * Une sortie est définie par une date/heure (ou une période) et un site (un port, une criée, une plage);
  * Une localisation observée peut avoir de nombreux débarquements (un ou plusieurs par navire) comme sous-éléments.

- Landing: Une observation d'un navire, réalisée au moment du débarquement
  * Un débarquement peut avoir une sortie comme élément parent;
  * Un débarquement peut avoir de nombreuses marées comme sous-éléments;

