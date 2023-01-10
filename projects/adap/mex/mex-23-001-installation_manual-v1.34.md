# Manuel de mise en exploitation 

> Auteurs: Benoit LAVENIER
> Date: 2023

## Mise à jour du program ADAP-MER

- [ ] Physical gear: Modifier le nombre d'acquisition du PMFM SELECTIVITY_DEVICE à 1  
- [ ] Opération: Ajouter le PSFM HAS_INDIVIDUAL_MEASURE


## Ajout des coefficients de conversion poids vif

- [ ] COD - Cabillaud (209 lignes)
  https://adap-test.pecheursdebretagne.eu/referential/taxonGroup/1122?label=MNZ&tab=1 
- [ ] MNZ - Baudroie (69 lignes)
  https://adap-test.pecheursdebretagne.eu/referential/taxonGroup/8927?label=COD&tab=1 
- [ ] HAD - Eglefin (68 lignes)
  https://adap-test.pecheursdebretagne.eu/referential/taxonGroup/8928?label=HAD&tab=1 


## Ajout des divisions CIEM

 - [ ] 38 divisions CIEM (ex: "007E00 - CIEM VIIe (Manche occidentale)")
   - [ ] à relier au sous-zones CIEM

## Ajout des relations taille-poids

- [ ] COD - Cabillaud - Gadus morhua
  - [ ] 81/81 lignes
    https://adap-test.pecheursdebretagne.eu/referential/taxonName/0?label=COD&tab=1
- [ ] MNZ - Lophius piscatorius - Baudroie blanche
    - [ ] 60/31 lignes (1 ligne ignorée: Golfe du Lion)
      https://adap-test.pecheursdebretagne.eu/referential/taxonName/1033?label=MON&tab=1
- [ ] MNZ - Lophius budegasse - Baudroie noire
  - [ ] 58/59 lignes (1 ligne ignorée: Golfe du Lion)
    https://adap-test.pecheursdebretagne.eu/referential/taxonName/1034?label=ANK&tab=1 
- [ ] HAD - Eglefin - Melanogrammus aeglefinus
  - [ ] 53/53 lignes
    https://adap-test.pecheursdebretagne.eu/referential/taxonName/4?label=HAD&tab=1
