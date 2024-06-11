## Data Model - Referential

### Base classes

![common](model/referential/common.svg)

Each referential entity item have a numerical id as identifier, a unique label (for code), a name and a full description. 

---
### Lieux (terrestres ou en mer)

![location](model/referential/location.svg)

A location can be:
  - a territorial location (e.g. Country, harbour, auction...)
  - a fishing area, on any administrative spatial unit at sea (e.g. FAO area, ICES division or sub-division, CGPM..)

A location can have a spatial geometry (area, line, or point) that can be used by SUMARiS GIS capabilities.  

---
### Gear

A gear is fishing gear or a scientific gear, used by vessels during a trip. 
Gear code comes from common referential (e.g. FAO gear code), but can be extended with other gear codification (like national gear codes, scientific cruise codication).

---
### Commercial species

Commercial species are call "Taxon Group" in the data model.

FAO ASFIS code are used, but can be extends with national codes. 

---
### Scientific species

Scientific species are called "Taxon" in the data model.

 - For now, codes comes from French RefTax database, or any other national codes;
 - A working group (E-IS, Ifremer, MNHN, Sandre) will develop (2020) a Proof of Concept (PoC) to synchronize codes from [WoRMS](http://www.marinespecies.org/), using Ontologies Web Language (OWL) and the RDF format.    

---
### Collected parameters (PMFMU)

![pmfm](model/referential/pmfm.svg)

a PMFM is an association of:
 
 - a Parameter: what is collected (e.g. a distance, a weight...);
    * A parameter has a unique type : numerical, alphanumerical, boolean, qualitative values;
    * A parameter can define min and max values;
 - a Matrix: what is measured;
 - a Fraction: a part of the matrix;
 - a Method: how to get the measure value;
 - a Unit (e.g meters, kilograms...)

This class allows to define any kind of measure type, with the precision expected by all scientific purposes.

---
### Regulation (Corpus, Fisheries and minimum size allowed)

![regulation](model/referential/regulation.svg)

---
### Spatial

![spatial](model/referential/spatial.svg)