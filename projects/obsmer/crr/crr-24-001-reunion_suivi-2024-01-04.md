# Réunion de suivi ObsMer/ObsVente
### 04/01/2024

> Présents :
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Joanna VEGA (Ifremer)
> - Thomas Cloatre (Ifremer)
> - Armelle  (Ifremer)
> - Benoit LAVENIER (EIS)
>
> Excusés :
> - Glenn PRIGENT (Ifremer)
> - Johann Le Traon (Ifremer)
> - Vincent BADTS (Ifremer)

Prochaine réunion : Vendredi 12/01/2024 à 14h  

---
# Organisation

- Vincent Fachero a commencé les spécifications fonctionnelles (Cas d'utilisation, maquettes écrans),
  sur **ObsMer** 
- EIS continue le PoC, sur la partie **calendrier d'activité mensuelle**

---
# Administration de la saisie des lots

- Deux options sont possibles :
  - Gestion de modèles d'arbres / stratégie
    - Inconvénient : Stockage en BDD, tous les cas à prévoir
    - Avantage : Meilleure compréhension du résultat 
  - PSFM + règles / stratégie
    - Inconvénient : gestion plus abstraite
    - Avantage: génération de tous les cas possible en peu de règle

---
# Avancement > Socle (1/2)

- [X] **Optimisation** des performances : 
  - [X] Optimisation chargement des stratégies (100%)
  - [X] Optimisation chargement des navires (via ElasticSearch) (100%)
- [X] **Ergonomie** :
  - [X] Menu de navigation, synchronisé par écrans/onglets (100%)
- [ ] **Étude d'impact** : (10%) 
  - Faisabilité de l'intégration de WAO
  - Évolution du modèle SIH-Adagio (ou du modèle SUMARiS)
  - Référentiel des min/max par espèce (et par zone)
  - Régionalisation

---
# Avancement > Socle (2/2)

- [X] **Migration** :
  - Migration Programmes/Stratégies : OK
  - Personnalisation de SUMARiS pour OBSMER : OK
- [ ] Base de données de **test** :
  - [ ] Ajout du programme SIH-OBSMER: 80% (reste des PMFM des lots)
  - [ ] Ajout du programme SIH-OBSVENTE: 80% (reste des PMFM des lots)

---

## Avancement > Collecte des données - ObsMer (1/2)

- **Marées** (tableau, filtre): OK
- Écran **Marée** : 
  - Lecture/écriture : OK
  - Sélection de la stratégie par date/lieu: OK 
    - RAF: corriger quelques régressions sur d'autres volets
  - Saisie de la vente: OK
  - RAF: séparer les "caractéristiques d'enquête" ? (via le groupe de paramètre) - non prioritaire 

---

## Avancement > Collecte des données - ObsMer (2/2)

- Carte **positions** : OK
- **Engins** (tableau et filtre) : OK
- Ecran **Engin** : 
    - lecture/écriture OK
    - RAF: groupement des PSFM sur le même PSF ? (+ choix de la méthode) - non prioritaire
- Écran **Opération**
  - lecture/écriture: OK (sauf lots - onglet Capture)
  - RAF: onglet **Capture** 

---

## Avancement > Restitution - ObsMer 

- RAF: Restitution aux professionels
- RAF: Restitution formulaire terrain
- RAF: Rapport de contrôle
  - Types de graphique à intégrer ?

---

## Avancement > Collecte des données - ObsVente (1/2)

- **Sortie** (tableau, filtre): OK
- Écran **Sortie** :
  - Lecture/écriture : OK
  - Sélection de la stratégie par date/lieu: OK
    - RAF: corriger quelques régressions sur d'autres volets
  - RAF: Saisie de la ligne du plan d'échantillonnage
  - RAF: Revoir le tableau des échantilonnages (remplissage auto des espèces)
- Écran **Débarquement**
  - Lecture/écriture : 50%
  - RAF: Sélection de la stratégie par date/lieu
  - RAF: Saisie des lots 

## Avancement > Restitution - ObsVente

- RAF: Exportation des données (format dérivé de COST: TR, HH, SL, HL)
- RAF: formulaire terrain

---

## Liens

Liens utiles :
* Documentation projet
  * Compte-rendus de réunion : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/obsmer/crr
  * Spécifications fonctionnelles :
    * ObsMer : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/obsmer/spe
    * ObsVente : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/obsvente/spe
* Anomalies et évolutions
  * GitLab : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Autre 
  * Documentation générale SUMARiS : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  

