# Spécifications - Collecte de données


Historique     |         |
---------:|---------|
11/04/2022| Création |

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

---

## Opération / Chalut jumeaux

Propositon n°1 : Multi-tableaux (un par engin) 

![collect](/projects/apase/spe/batch-multi.svg)

---
## Opération / Chalut jumeaux

Propositon n°2 : Un onglet par engin

![collect](/projects/apase/spe/batch-tabs.svg)

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

- EIS: Saisie des lots : Voir la compatibilité avec le modèle de données
- EIS: Maquettage dynamique des écrans
