# RM0009: résultats de quantification calculés automatiquement

## Calcul par relation taille-poids

> Repise des specificationss Allegro `allegro-dsf-09-001` v3.1.4 

- Dans le cas d’un échantillonnage effectué sous une opération, ou sous un groupe d’opérations, prendre en compte le secteur de pêche. Pour une opération, le secteur peut être retrouvé à partir de la position ponctuelle du début de l'opération (latitude/longitude) (cf CU "Sélectionner un/des lieu(x) à partir d'une position géographique").   Note : le secteur a pu déjà être retrouvé et affiché au niveau de l'opération (cf. du CU "Créer un opération").
- Dans le cas d’un échantillonnage effectué au débarquement ou à la vente, prendre en compte le secteur du produit rattaché au lot.
- Le calcule de quantification par la relation taille-poids doit également prendre en compte l’année, en plus des mois de début et fin (attribut WeigthLengthConversion.year) :
    * L’application de la relation taille poids s’effectue à partir des données de conversion disponibles dans le référentiel, et par ordre de priorité suivant :
    * En priorité, une relation T/P récente et trimestrielle (la dernière relation au cours du trimestre)
    * Sinon, une relation T/P récente et annuel (la dernière relation au cours de l’année en cours),
    * Sinon, ancienne (la dernière relation connu de l’année précédente)
- Il faut néanmoins conserver le type de relation utilisée. Pour cela, il faut utiliser des PSFM dont la méthode est distincte pour chacun des trois cas. Les identifiants des ces PSFM doivent être en variable d’exploitation (variables d’exploitation, modifiable par l’équipe d’exploitation).

### Implementation dans Allegro

Voici l'implémentation faite dans Allegro ObsMer, pour mémoire :

```java
Integer presentationId = getPresentationSortingQuantification($sortingBatch);

// NNZ : #8972 - Mutualisation de code entre create et update
WeightLengthConversionVO weightLengthConversion = (WeightLengthConversionVO)RulesBatchHelper.getInstance()
    .calculateWeightLengthConversion(
        $sortingBatch,
        referenceTaxonId,
        locationId,
        endMonth,
        endYear,
        sortingParameterCode);

BigDecimal size = getSizeSortingQuantification($sortingBatch);
Integer sizeUnitId = getSizeSortingQuantificationUnitId($sortingBatch);
BigDecimal precision = getSizeSortingQuantificationPrecision($sortingBatch);

if(weightLengthConversion != null){
    // update
    size = convertSizeForWeightLength(size, sizeUnitId, weightLengthConversion, precision);
    BigDecimal result = (new BigDecimal(weightLengthConversion.getConversionCoefficientA().toString())).multiply(
        new BigDecimal(Math.pow(
            size.doubleValue(),
        new BigDecimal(weightLengthConversion.getConversionCoefficientB().toString()).doubleValue()
        ))).multiply(new BigDecimal($individualCount.toString()));

    // #8972 -> Calcul du Poids RTP contextuel
    if(presentationId != null) {
        result = calculateAliveWeight($sortingBatch,result);
    }
    
    // convert g to kg
    if (result!=null){
    
        result = result.divide(new BigDecimal("1"), getMaxNumberOfDecimalOfSizeWeightQuantification(), RoundingMode.HALF_UP);
        Float valueOld = $sizeWeightQuantification.getNumericalValue();
        $sizeWeightQuantification.setNumericalValue(new Float(result.toString()));
        $sizeWeightQuantification.setQualityFlagCode($qualityFlagCode);
    
        if(!(valueOld.equals($sizeWeightQuantification.getNumericalValue()))){
            $sortingBatch.setModified(true);
            QuantificationChangeEvent quantificationChangeEvent = new QuantificationChangeEvent(AllegroResourceManager.getInstance().getBatchResourceIdForQuantification($sortingBatch));
            AllegroResourceManager.getInstance().publishChange(quantificationChangeEvent);
        }
        remove = false;
    }
}
```
