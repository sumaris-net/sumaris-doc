

- Script talend : synchronize_wao_to_harmonie
  - https://gitlab.ifremer.fr/sih/adagio/traitements/synchronize_wao_data
  - Script talend SYNCHRONIZE_WAO_HARMONIE
  - Appelé en crontab sur (vsih-script2-exp)

- Puis procédure stockée : P_FILL_DENORMALIZED_SPL_STRATA
  - Appelé en crontab sur (vsih-script2-exp)
  - Lancé 2 fois !!!

Possibilité de lancer en mode manuel en pré-production (validation).


Echanges :
- Modification du Job Talend SYNCHRONIZE_WAO_HARMONIE
  - Faire un mapping de stockage de données et le proposer à samuel Le Blond
    - Créer un ticket YouTrack / Mantis ?
- Pour les PETS et les espèces à observer => DENORMALIZE_STRATA_MEASUREMENT (ligne de plan)
- Créer un grouping par ligne de plan / level
  - Label = SAMPLING_STRATA.LABEL, LEVEL = (PETS | RANDOM | OTHER)
  - Créer un grouping classification (liste espèces pour WAO)
  - Créer un grouping level 
    - PETS
    - RANDOM (species tirées au sort)
    - OTHER
  - Champ SAMPLING_STRATA.IS_RANDOM_SELECTION NUMBER(1)
  - Avoir une nouvelle colonne, dans DENORMALIZE_STRATA_MEASUREMENT, contenant les listes des PETS et la liste des espèces à observer :
    - VARCHAR2(1024)
    - TAXON_GROUP_IDS
    - Séparateurs `,`, `|`, `;` 
    - Valeur de la colonne - cas métropole: 
```
PETS|pets_id1;pets_id2;pets_idx,RANDOM|species_id1;species_id2;species_idx   
```
Cas pour les outres-mer: 
```
OTHER|species_id1;species_id2;species_idx   
```

A intégrer dans le ticket https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/548

- Voir ticket https://forge.ifremer.fr/mantis/view.php?id=29035