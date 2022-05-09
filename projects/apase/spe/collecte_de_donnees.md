# Spécifications - Collecte de données


Historique|                                          |
---------:|------------------------------------------|
11/04/2022| Création                                 |
25/04/2022| MAJ écrans OPE suite réunion du 25/04    |

---

## Marée

Paramètres collectés :

à définir (à partir des formulaires papier)

---

## Engins

L'utilisateur saisi :
- L'engin OTT avec les caractéristiques globales ;
- L'engin avec dispositif sélectif et ses caractéristiques propres ;
- L'engin standard et ses caractéristiques propres ;

Sur chaque engin, un libellé (texte libre) peut être saisi, pour identifier plus simplement l'engin par la suite.

- ~~Action : QS - **Détailler les caractéristique**s (min, max, nb max décimales, etc.)~~

---

## Opération / Détails

Chalut jumeaux

![collect](/projects/apase/spe/operation.svg)

---

## Opération / Capture

Chalut jumeau. Un onglet par engin

![collect](/projects/apase/spe/batch-tabs.svg)

> - Les espèces saisies sur un engin, sont à recopier dans l'autre engin.
>   Le poids par défaut est à zéro. 

---

## Lots - Règles métier

Contrôle poids:

```text
Somme poids élevés ~= Poids total capture

Marge d'erreur x% (x en variable d'exploitation)
Warning non bloquant  
``` 

Saisie du taux d'échantillonnage :
```text
- Soit rapport du poids
- Soit saisie du X/Y
```


---
## Actions

- Aglia: Fournit des **scans de bordereau** (pour servir de jeu de données de référence)  
- EIS: Maquettage dynamique des écrans - en cours

- ~~QS : **Détailler les caractéristiques engins** (min, max, nb max décimales, etc.)~~
- ~~EIS: Saisie des lots : Voir la compatibilité avec le modèle de données~~
