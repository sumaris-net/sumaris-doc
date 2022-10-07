# Collecte de données
## Spécifications
---

## Sommaire

- [Marée](#/4/3)
  - [Engin](#/4/4)
- [Opération](#/4/11)
  - [Capture](#/4/12)
    - [Mesures individuelles](#/4/15)
- Actions
- Historique

---

## Documents

- Protocole [chalut simple]() et [chalut jumeaux]()  
- Grille de saisie SUMARiS : [ods](/projects/apase/doc/apase-doc-grille_saisie_sumaris-v1.1.ods)

---

## Marée > Détails

cf écran SUMARiS

---

### Marée > onglet Engins
![ui-gears](/projects/apase/spe/images/gears-table.svg)

---

## Engin > Chaluts simple

Type d'engin possible : OTB (pour le moment)

> Sur chaque engin :
> - un libellé (texte libre - obligatoire) peut être saisi, pour identifier plus simplement l'engin par la suite.
> - un "code essai" (obligatoire) : "Grille à lotte", "Grille à langoustine", ...

---

## Engin > Chaluts jumeaux

Pour les chaluts jumeaux (OTT), l'utilisateur saisit :
- L'engin parent ;
- Les sous-engins, avec leurs caractéristiques propres ;

> Sur chaque engin (ou sous-engin), un libellé peut être saisi (texte libre), pour identifier l'engin facilement.

---

### Engin > Chaluts jumeaux (1/2)

![ui-modal-gear](/projects/apase/spe/images/gear-parent.svg)


---

### Engin > Chaluts jumeaux (2/2)

![ui-modal-gear-2](/projects/apase/spe/images/gear-parent-tab2.svg)

---


### Sous-engin > Chaluts jumeaux

[<img src="/projects/apase/spe/images/gear-child.svg" width="40%">](/projects/apase/spe/images/gear-child.svg)

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
## Opération > Détails

Pour les chaluts jumeaux :

![ui-operation](/projects/apase/spe/images/operation.svg)

> Force du vent: [cf échelle beaufort](https://files.meteofrance.com/files/glossaire/FR/glossaire/designation/510_curieux_view.html)
 
---
## Opération > Capture (1/3)

Pour les chaluts jumeaux, un onglet par position de sous-engin:

![batch-tabs](/projects/apase/spe/images/batch-tabs.svg)

---
## Opération > Capture (2/3)

![batch-tabs-discard](/projects/apase/spe/images/batch-tabs-discard.svg)

---
## Opération > Capture (3/3)

> Priorité: 
> - mode terrain (pour fin nov. 2022) 
> - mode bureau ensuite

> Règle(s) métier:
> - Les espèces saisies sur un engin, sont à recopier dans l'autre engin.
    >   Le poids par défaut est à zéro.
> - (à confirmer) Recopier le taux d'échantillonnage, d'une ligne à l'autre ?
> - Pouvoir saisir plusieurs taux d'échantillonnage

---

## Lots espèces (1/2)

![collect](/projects/apase/spe/images/batch-species.svg)

---
## Lots espèces (2/2) 

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

## Mesures individuelles (1/2)

![batch-species](/projects/apase/spe/images/individual-measure.svg)

- Pourvoir saisir d'abord les espèces de la partie retenue, puis la partie rejettée
- (priorité basse) Pourvoir ajouter un lot espèce depuis la saisie des mesures (nouveau bouton "+")

---
## Mesures individuelles (2/2)
> Règle(s) métier :
> - Saisie au 1 cm, 0.5cm, 1mm, suivant l'espèce (cf normes Ifremer) 

---
## Référentiels

### Espèces commerciales

- Insérer les espèces manquantes (action Quiterie)
- Pouvoir d'ajouter une espèce par trimestre (max).

---
## Actions

- EIS: Livraison d'une nouvelle version (~ 1.30.0)
- Quiterie: envoi d'une liste des espèces

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 11/04/2022 | Création                                                                                      |
| 25/04/2022 | Mise à jour écrans OPE                                                                        |
| 25/05/2022 | - Ajout des écrans engins (avec notion de sous-engins)<br/>-Mise à jour écrans des opérations |
| 20/06/2022 | - Modification des écrans sous-engins                                                         |
| 19/09/2022 | - **Modification des écrans lots**                                                            
