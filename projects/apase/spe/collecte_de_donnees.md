# Spécifications - Collecte de données


Historique|                   |
---------:|-------------------|
11/04/2022| Création          |
25/04/2022| MAJ écrans OPE    |
25/05/2022| MAJ écrans engins |

---

## Documents

- Protocole [chalut simple]() et [chalut jumeaux]()  
- Grille de saisie SUMARiS : [ods](/projects/apase/doc/apase-doc-grille_saisie_sumaris-v1.1.ods)

---

## Marée / onglet Détails

cf écran SUMARiS

---

### Marée / onglet Engins
![ui-gears](/projects/apase/spe/gears-table.svg)

---

## Engin / Chaluts simple

Type d'engin possible : OTB (pour le moment)

> Sur chaque engin, un libellé (texte libre) peut être saisi, pour identifier plus simplement l'engin par la suite.

---

## Engin / Chaluts jumeaux

Pour les chaluts jumeaux (OTT), l'utilisateur saisi :
- L'engin parent ;
- Les sous-engins, avec leurs caractéristiques propres ;

> Sur chaque engin (ou sous-engin), un libellé peut être saisi (texte libre), pour identifier l'engin facilement.

---

### Engin / Chaluts jumeaux

![ui-gears](/projects/apase/spe/gear-parent.svg)

---

### Engin / Chaluts jumeaux / Sous-engins

![ui-gears](/projects/apase/spe/gear-child.svg)

---

### Engin (tout type)

> Règle(s) métier :
> - Si l'engin a été copié, puis modifié, avertir l'utilisateur (priorité réalisation : mineure) :
>
>   ```text
>   Vous avez modifié un engin, sans changer de libellé.
>   Êtes-vous de vouloir continuer ? (Oui/Non)
>   ```

---
## Opération / Détails

Pour les chaluts jumeaux :

![ui-operation](/projects/apase/spe/operation.svg)

---

## Opération / Capture

Pour les chaluts jumeaux, un onglet par position de sous-engin:

![collect](/projects/apase/spe/batch-tabs.svg)

> Règle(s) métier:
> - Les espèces saisies sur un engin, sont à recopier dans l'autre engin.
>   Le poids par défaut est à zéro. 
> - (à confirmer) Recopier le taux d'échantillonnage, d'une ligne à l'autre ?

---

## Mesures individuelles

> Règle(s) métier :
> - Contrôle poids:
>
> ```text
> Somme poids élevés ~= Poids total capture
> 
> Marge d'erreur x% 
> (x en variable d'exploitation)
> Warning non bloquant  
> ```
> - Saisie du taux d'échantillonnage :
> 
> ```text
> - Soit rapport du poids
> - Soit saisie du taux 1/n
> - + Saisie du sous-taux 1/n
> ```


---
## Actions

- Aglia: Fournit des **scans de bordereau** (pour servir de jeu de données de référence)  
- EIS: Maquettage dynamique des écrans - en cours

- ~~QS : **Détailler les caractéristiques engins** (min, max, nb max décimales, etc.)~~
- ~~EIS: Saisie des lots : Voir la compatibilité avec le modèle de données~~
