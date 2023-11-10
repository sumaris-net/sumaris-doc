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

- [PPT_Allegro_V2](/projects/obsmer/doc/obsmer-doc-23-001-PPT_Allegro_V2.pdf)
- [SPEC Fonc-Allegro_2023_V2](/projects/obsmer/doc/obsmer-doc-23-002-Propositions%20SPEC-Fonc-Allegro_2023_V2_Reflexions%20GT_300323.xlsx)
- [Champs saisie](/projects/obsmer/doc/obsmer-doc-23-004-champs_saisie.xlsx)

---

## Marée > Détails

![ui-gears](/projects/obsmer/spe/images/trip-new.svg)

---

### Marée > onglet Engins
![ui-gears](/projects/obsmer/spe/images/gears-table.svg)

> - Masquer les colonnes PSFM vides
> - Ascenceur vertical 

---
## Opération > Détails - Engins dormants

![ui-operation](/projects/obsmer/spe/images/operation-net.svg)

> - Prédocumenter la liste des espèces cibles / navires ? Pas prioritaire
> - Autoriser date de début OP AVANT marée 

---

## Opération > Détails - Engins traînant

![ui-operation](/projects/obsmer/spe/images/operation-trawl.svg)

> - Empêcher date de début OP en dehors de la période de la marée
 
---
## Opération > Capture  (1/2)

TODO

---
## Opération > Capture (2/2)

> Priorité:
> - mode bureau 
> - mode terrain ensuite

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

- [x] EIS: Livraison d'une nouvelle version (~ 1.33.3)
- [x] Quiterie: envoi d'une liste des espèces

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 11/04/2022 | Création                                                                                      |
| 25/04/2022 | Mise à jour écrans OPE                                                                        |
| 25/05/2022 | - Ajout des écrans engins (avec notion de sous-engins)<br/>-Mise à jour écrans des opérations |
| 20/06/2022 | - Modification des écrans sous-engins                                                         |
| 19/09/2022 | - **Modification des écrans lots**                                                            
