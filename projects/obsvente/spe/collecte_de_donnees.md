# Collecte de données (ObsVente)
## Spécifications
---

## Sommaire

- [Sortie en criée](#/4/3)
- [Échantillonnages](#/4/11)
- Actions
- Historique

---

## Documents

- [Formulaire terrain OBSVENTE](/projects/obsvente/doc/Formulaire_terrain_OBSVENTES_V1-2023_Nouveau-marché.pdf) (v1 2023)

---

## Lignes de plan

- Fichier CSV importé dans WAO ObsVente
- Possibilité de modifier/supprimer une ligne
- TODO : Mapping modèle WAO / 

> Code source : https://gitlab.ifremer.fr/sih/WAO

---

## Sortie en criées

![ui-observed-location](/projects/obsvente/spe/images/observed-location-new.svg)

> Lignes de plan avec statut "programmée" doivent être importée (depuis WAO).
> Avec la liste des espèces prioritaires à échantillonner.

---

### Sortie en criée > onglet Échantillonnages
![ui-landings](/projects/obsvente/spe/images/landings-table.svg)

---

## Lots espèces

- Lots espèces: 
  - espèce commerciale
  - catégorie commerciale, présentation, état
  - Poids de la caisse, puis poids échantillonné
  > Cas des mélanges ? (ex: baudroie blanche/noire)
  > Pas de sous-échantillonnage ?
- Mesures individuelles :
  - espèce scientifique 
  - sexe, longueur 
  - 30 individus
  
---

## Lots espèces

- Mesures individuelles :
  - Connectivité à la règle **Gwaleen** 
    - Mode bureau (USB ?) 
  - Caisse de **mélange**: possible au sein d'un même espèce commerciale :  
    Dans ce cas, il faut pouvoir choisir une espèce scientifique en dehors de l'espère commerciale  
    (**non prioritaire**)

---

## Lots espèces
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

## Mesures individuelles

(en cours de rédaction)

![batch-species](/projects/apase/spe/images/individual-measure.svg)

> Règle(s) métier :
> - Saisie au 1 cm, 0.5cm, 1mm, suivant l'espèce (cf normes Ifremer)

---
## Référentiels

(en cours de rédaction)

---
## Actions

- [x] EIS: Livraison une version testable (~ 3.0.0-rc1)
- [x] Ifremer (Vincent Fachero): Déploiement docker

---
## Historique

|       Date | Sections mises à jour                                                                         |
|-----------:|-----------------------------------------------------------------------------------------------|
| 11/09/2023 | Création                                                                                      |
| 10/11/2023 | Ajout écrans Marée, Engins et OP                                                              |
