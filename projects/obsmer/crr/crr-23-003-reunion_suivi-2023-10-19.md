# Réunion de suivi ObsMer
### 19/10/2023

> Présents :
>
> - Glenn PRIGENT (Ifremer)
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Joanna VEGA (Ifremer)
> - Thomas CLOATRE (Ifremer)
> - Vincent BADTS (Ifremer)
> - Benoit LAVENIER (EIS)
> - Maxime DEMAREST (EIS)
> - Sébastien POISSONNET (Codra)

Prochaine réunion : 

---
# Méthodologie

- Prototype basé sur la solution **SUMARiS**
- Point de suivi hebdo : 
  (EIS, Vincent, Glenn, Joanna)
- **Ateliers** de maquettage : 
  - Période : octobre à novembre 
  - Présence d'observateurs (prestataires) - à confirmer
  - Implication de **partenaires** ? (ex: Aglia et LPDB)
- **Spécifications fonctionnelles** (Cas d'utilisation, avec maquette statique)

---
# Avancement > Socle (1/2)

- **Optimisation** des performances : 
  - Optimisation du chargement des stratégies (80%)
  - Optimisation du chargement des navires (via ElasticSearch) (80%)
    - 20ms / navire (au lieu de 2s actuellement)
- **Ergonomie** :
  - Menu de navigation, synchronisé en fonction des écrans/onglets (80%)
- **Étude d'impact** : 
  - Faisabilité de l'intégration de WAO
  - Évolution du modèle SIH-Adagio (ou du modèle SUMARiS)
  - Référentiel des min/max par espèce (et par zone)
  - Référentiel des min/max par espèce

---
# Avancement > Socle (2/2)

- **Migration** :
  - Migration Programmes/Stratégies (en cours)
    - Faut-il migrer tous les programmes `SIH-OBSMER-xxx` ?
    - Faut-il assurer la compatibilité Allegro-ObsMer ?
  - Personnalisation de SUMARiS : 
    - Ajout d'une ligne `OBSMER` dans la table `SOFTWARE` (+ options dans `SOFTWARE_PROPERTY`)

---

## Avancement > Collecte des données (1/2)

- **Marées** (tableau, filtre): OK
- Écran **Marée** : 
  - lecture/écriture : OK
  - Saisie de la vente: à activer ? obligatoire ?
  - RAF: séparer les "caractéristiques d'enquête" ? (via le groupe de paramètre) 
  - RAF: sélection de la stratégie par date/lieu

---

## Avancement > Collecte des données (2/2)

- Carte **positions** : OK
- **Engins** (tableau et filtre) : OK
- Ecran **Engin** : 
    - lecture/écriture OK
    - RAF: groupement des PSFM sur le même PSF ? (+ choix de la méthode)
- Écran **Opération**
  - lecture/écriture: OK (sauf lots - onglet Capture)

---

## Avancement > Rapports 

- Restitution aux professionels
- Rapport de contrôle
  - Types de graphique à intégrer ?

---
## Liens

Liens utiles :
* Documentation projet
  * Compte-rendus de réunion : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/obsmer/crr
  * Spécifications fonctionnelles : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/obsmer/spe
* Anomalies et évolutions
  * GitLab : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Autre 
  * Documentation générale SUMARiS : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  

