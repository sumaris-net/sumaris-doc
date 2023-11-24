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

- TODO

---

## Lignes de plan

- Fichier CSV importé dans WAO ObsVente
- Possibilité de modifier/supprimer une ligne
- TODO : Mapping modèle WAO / 

> Code source : https://gitlab.ifremer.fr/sih/WAO

---

## Sortie en criées

![ui-observed-location](/projects/obsvente/spe/images/observed-location-new.svg)

---

### Sortie en criée > onglet Échantillonnages
![ui-landings](/projects/obsvente/spe/images/landings-table.svg)


---
## Opération > Détails

![ui-operation](/projects/obsmer/spe/images/operation.svg)

> - Prédocumenter la liste des espèces cibles / navires ? Pas prioritaire
> - Engins dormants: autoriser date de début OP AVANT marée
> - Engins traînants : Empêcher date de début OP en dehors de la période de la marée

---
## Opération > Capture

(en cours de rédaction)

---

## Lots espèces

(en cours de rédaction)

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
