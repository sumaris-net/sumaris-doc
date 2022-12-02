# Réunion de suivi
### 02/12/2022

> Présents :
>
> - Thomas RIMAUD
> - Marion FICHE
> - Benoit LAVENIER (EIS)

---
## Congés

> - Thomas RIMAUD : 26/12/2022
> - Marion FICHE : du 21/12 au 02/01/2023
>    * En congé maternité 03/2023
> - Benoit LAVENIER : du 05-09/12/2023, puis 20-26/12/2023


---
## Avancement (1/3)

- Migration du socle : **réalisé**
  - (Angular 14, Ionic 6, Capacitor)
  - Gestion des notifications : **en cours** (90%)
  - Gestion des traitements serveur : **en cours** (90%)

- Référentiels :
  - Import des navires SIOP : **réalisé**
  - Import des RTP Ifremer : **en cours** (50%)

---

## Avancement (2/3)

- Auto-échantillonnage :
  * Capture / lots : 
    * Bureau > Nombre d'individus total non saisissable
    * Mobile > Ajout de messages d'erreurs, sur poids/poids échantillonné obligatoire
    * Mobile > Changement du plugin d'acquisition GPS : **à tester en mer**
  * Synchronisation : validation des lots espèces (contrôle poids manquants) : **en cours** (90%)
  
---
## Avancement (3/3)

- Contrôle criée :
  * Point de contrôle :
    * Saisie des poids en grammes : **réalisé**
    * Gestion des photos (mobile et bureau) : **réalisé**

  * Rapports :
    * Visualisation/Edition : **réalisé**
    * Lien de partage (sans connexion) : **en cours** (50%)
    * Nom du fichier : **à corriger**
      > "Rapport de contrôle - NOM_NAVIRE IMMAT - JJ/MM/AAAA.pdf"  

---
## Reste à faire

- Extractions :
  * Génération automatique : **réalisé**
  * Extraction marées (correctifs)
    * Distinction espèce Baudroie
    * Poids vif
    > Date de livraison 23/02/2023 

  * Extraction contrôles criées - **A faire ?** (évolution)

---
## Facturation

- PV de recette à prévoir, fin février 
  - Indiquer les évolutions effectuées : 
    - Rapport au niveau de la sortie, 
    - Gestion des photos pour le mode bureau
    - Suivi des traitements du serveur (Extraction, import des navires)
    - Changement du plugin d'acquisition GPS
  - Indiquer les réserves 
    - Extractions - Le suivi de la fin des travaux pourra être effectué par Ifremer, projets SIH et APASE

---
## Actions

- 02/12/22 - EIS - Livraison sur adap-test (v1.32)
- 15/12/22 - LPDB : Tester la saisie des contrôles criées (sur tablette)

- 19/12/22 - EIS - Finalisation des développements (auto-échantillonnage + contrôle criée) 
  - Contrôle des poids des lots, etc.
  - Partager un rapport de contrôle

- 13/01/23 - EIS - Livraison en production (auto-échantillonnage + contrôle criée) - Hors extraction
- 23/02/23 - EIS - Livraison finale avec les correctifs d'extraction

---

# Liens
* Tests: https://adap-test.pecheursdebretagne.eu
* Anomalies et évolutions (GitLab) : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Documentation
  * Général (SUMARiS) : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  * Projet ADAP : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/adap
