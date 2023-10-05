# Réunion de suivi
### 22/09/2023

> Présents :
>
> - Glenn PRIGENT (Ifremer)
> - Benoit LAVENIER (EIS)


---
# Organisation / planning

- PoC de refonte sur la solution SUMARiS
- Point hebdo ?
- Implication utilisateurs finaux ?

---
# Avancements > Socle

- **Pod** : 
  - Configuration des énumérations (50%) (AcquisitionLevel, LocationLevel, Pmfm, etc.)
  - Optimisation du chargement des stratégies (80%)
  - Optimisation du chargement des navires (ElasticSearch) (0%)
- **App** (Ergonomie) :
  - RAF: menu de navigation (afficher dans le menu les titres des onglets de l'écran + ceux des pages parentes) 
- **Migration** (Liquibase, MEX) :
  - Migration Programmes/Stratégies => en cours
    - Tous les programmes SIH-OBSMER-* ?
    - Faut-il assurer la compatibilité Allegro-ObsMer ?
  - Ajout d'un `software` "OBSMER" (tables `SOFTWARE` et `SOFTWARE_PROPERTY`)

---

## Avancements > Collecte des données

  - **Marées** (tableau, filtre): OK
  - Écran **Marée** : 
    - lecture/écriture : OK
    - saisie vente: à activer ? obligatoire ?
    - RAF: séparer les "caractéristiques d'enquête" ? (via le groupe de paramètre) 
    - RAF: sélection de la stratégie par date/lieu
---

- Carte **positions** : OK
- **Engins** (tableau et filtre) : OK
- Ecran **Engin** : 
    - lecture/écriture OK
    - RAF: groupement des PSFM sur le même PSF ? (+ choix de la méthode)
- Écran **Opération**
  - lecture: OK, sauf lots (onglet Capture)
  - écriture: OK, sauf lots

---
## Liens

Liens utiles :
* Anomalies et évolutions 
  * YouTrack : https://youtrack.ifremer.fr
  * GitLab : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Documentation
  * Général (SUMARiS) : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  

