# Réunion de suivi ObsMer
### 22/09/2023

> Présents :
>
> - Glenn PRIGENT (Ifremer)
> - Vincent FACHERO (Ifremer)
> - Benoit LAVENIER (EIS)


---
# Méthodologie

- Prototype basé sur la solution **SUMARiS**
- Point de suivi hebdo: 
  - MOE: Glenn, Vincent
  - MOA: avec qui ?
- Implication utilisateurs finaux ?

---
# Avancements > Socle

- **Pod** : 
  - Configuration des énumérations (50%) (AcquisitionLevel, LocationLevel, Pmfm, etc.)
  - Optimisation du chargement des stratégies (80%)
  - Optimisation du chargement des navires (ElasticSearch) (0%)
- **App** (Ergonomie) :
  - RAF: menu de navigation (afficher dans le menu les titres des onglets de l'écran + ceux des pages parentes) 
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
    - saisie vente: à activer ? obligatoire ?
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
  - lecture: OK, sauf lots (onglet Capture)
  - écriture: OK, sauf lots

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
  

