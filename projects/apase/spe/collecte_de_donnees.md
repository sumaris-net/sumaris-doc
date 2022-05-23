# Spécifications - Collecte de données


Historique|                                          |
---------:|------------------------------------------|
11/04/2022| Création                                 |
25/04/2022| MAJ écrans OPE suite réunion du 25/04    |

---

## Documents fournis

- Protocole [chalut simple]() et [chalut jumeaux]()  
- Grille de saisie SUMARiS : [ods](/projects/apase/doc/apase-doc-grille_saisie_sumaris-v1.1.ods)
- 
---

## Marée

Paramètres collectés **(à valider)** :
- Observateurs ? 
- Vente ? (Lieu, type de vente, date de la vente)
- Autres ? (ex: Nombre d'homme à bord)

---

## Engins (1/2)

Pour les chaluts jumeaux, l'utilisateur saisi :
- L'engin OTT avec les caractéristiques globales ;
- L'engin avec dispositif sélectif et ses caractéristiques propres ;
- L'engin standard et ses caractéristiques propres ;

> Sur chaque engin, un libellé (texte libre) peut être saisi, pour identifier plus simplement l'engin par la suite.

- ~~Action : QS - **Détailler les caractéristique**s (min, max, nb max décimales, etc.)~~
- Action : QS - Fournir la **liste des codes engins** (OTB, OTT, etc.)

---

### Engin principal (parent)
![ui-gears](/projects/apase/spe/gear-parent.svg)

---

### Engin sélectif (fils)

![ui-gears](/projects/apase/spe/gear-child.svg)

---
## Opération / Détails

Pour les chalut jumeaux :

![ui-operation](/projects/apase/spe/operation.svg)

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
