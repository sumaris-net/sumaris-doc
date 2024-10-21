## Modèle de données - Administration

---
### Programme

![program](model/administration/program.svg)

Note:
- Un Programme est l'entité qui porte un projet de collecte de données (par exemple, un projet scientifique, un projet UE, ...).

- Un Programme décrit le projet (mnémonique/code, libellé, description);
  * Chaque programme a une ou plusieurs stratégies;

- À venir:
  * Chaque programme peut gérer les droits d'accès par utilisateurs ou départements

---
### Stratégie
![strategy](model/administration/strategy.svg)

Note:
- Une Stratégie porte un protocole de collecte de données. Typiquement, elle définit tous les paramètres (PSFMU) qui doivent être collectés.
  * Chaque paramètre collecté est recueilli à un niveau d'acquisition (par exemple, sur le voyage, sur l'opération, sur le débarquement, ...)

- À venir (v3):
  * Une stratégie est appliquée sur une ou plusieurs périodes et sur un ou plusieurs emplacements.

Ce concept de programme / stratégies permet de générer tous les champs que l'utilisateur peut remplir dans les écrans,
ainsi que tous les contrôles appliqués (min/max, type).
Cela fait partie de l'aspect générique des outils SUMARiS.
 
---
### Plan d'échantillonnage

![samplingScheme](model/administration/samplingScheme/sampling-scheme.svg)

---
### Plan d'échantillonnage (dénormalisées)

![denormalizedSamplingStrata](model/administration/samplingScheme/denormalized-sampling-strata.svg)

---
### Zone de compétence

Les zones de compétences permettent de définir les zones d'activité des utilisateurs.
Combiner avec la régionalisation, il est alors possible de **restreindre les listes du référentiel*,* pour n'afficher que les éléments pertinents pour la région de l'utilisateur.

![UserActivityArea](model/referential/user-activity-area.svg)