# RM0009: résultats de quantification calculés automatiquement

## Calcul par relation taille-poids

> Reprise des spécifications d'Allegro v1 (`allegro-dsf-07-001` v1.12)
> et des spécifications Allegro v3 (`allegro-dsf-09-001` v3.1.4)

Il existe trois types de calcul automatique de quantification. Chacun des calculs devra être rattaché à un PSFM spécifique qui lui sera propre. Les trois types de calculs sont :
 - Détermination par relation taille/poids : calcul du poids à partir d’une taille,
 - Détermination de l’équivalent poids vif : calcul du poids à partir d’un état de présentation (ex : poisson vidé)
 - Détermination du poids total d’un lot, à partir des poids des sous-ensembles. Typiquement, un poids total est calculé automatiquement si le lot a été découpé en plusieurs sous-ensembles, et que chacun de ces sous-ensembles a reçu une valeur de poids.

Les modifications faites sur la marée, l’opération, ou l'arbre d’échantillonnage déclenchent la mise à jour des paramètres calculés (en V2 pour les modifications sur la marée et l’opération)

Relation Taille poids (1/2) :
- Le calcul est de la forme « Poids =a * Taille b » (poids en gramme et taille en mm) par individu du lot. les  coefficients a et b sont obtenus via une table de correspondance, à partir des caractéristiques suivantes :
- Taxon mesuré (=espèces scientifiques)
- Période (ex : du mois de "janvier" au mois de "juillet", indépendant de l'année). La période est celle incluant  la date de début de  l’opération de prélèvement.
- Lieu.
  * Dans le cas d’un échantillonnage effectué sous une opération, ou sous un groupe d’opérations, prendre en compte le secteur de pêche. Pour une opération, le secteur peut être retrouvé à partir de la position ponctuelle du début de l'opération (latitude/longitude) (cf CU "Sélectionner un/des lieu(x) à partir d'une position géographique").   Note : le secteur a pu déjà être retrouvé et affiché au niveau de l'opération (cf. du CU "Créer un opération").
  * Dans le cas d’un échantillonnage effectué au débarquement ou à la vente, prendre en compte le secteur du produit rattaché au lot.
- Sexe. Il s’agit de la valeur du critère de classement ‘Sexe’ du lot, si définie
- L’ordre à appliquer dans les recherches est le suivant :
  1. Recherche des relations sur le lieu, du plus précis au plus large (via les lieux pères),  juqu'à trouver au moins une relation.
  2. Parmi les relations trouvées à l'étape 1, recherche des relations sur la période (du plus précis au plus large) juqu'à trouver au moins une relation.
  3. Parmi les relations trouvées à l'étape 2, recherche des relations sur le sexe du plus précis au plus large (sexe = null dans la table de correspondance pour un sexe non défini).

   - Le calcul n’est pas déclenché si :
   - Le nombre d’individus du lot ne peut pas être déterminé
   - Le taxon (espèce scientifique) ne peut pas être déterminé pour le lot : n’a pas été saisie sur le lot ou un des lots père,
   - Le lieu ne peut pas être déterminé (par exemple en V1 : si le lieu de départ de la marée n’a pas été saisi).
   - La période ne peut pas être déterminée (par exemple : si la date de début d’opération de prélèvement est non saisie).
   - La taille du lot n’a pas été saisie (= critère de classement sur le lot)
   - La présentation du poisson  peut être déterminée pour le lot (ou un des lots pères), et elle est différente de "entier"

   - Il y a différents niveaux de précisions d'une relation taille poids. Cela peut aller d'une relation générale (un taxon,  une zone, sans période, sans sexe,) à quelque chose de très précis (un taxon,  une zone, une période,  un sexe).

   - Pour la maille géographique de base d'une Relation taille Poids, la classification territoriale sera utilisée en version  V1. Elle sera étendue à la classification sectorielle en V2

- Le calcule de quantification par la relation taille-poids doit également prendre en compte l’année, en plus des mois de début et fin (attribut WeigthLengthConversion.year) :
  * L’application de la relation taille poids s’effectue à partir des données de conversion disponibles dans le référentiel, et par ordre de priorité suivant :
  * En priorité, une relation T/P récente et trimestrielle (la dernière relation au cours du trimestre)
  * Sinon, une relation T/P récente et annuel (la dernière relation au cours de l’année en cours),
  * Sinon, ancienne (la dernière relation connue de l’année précédente)

- Il faut néanmoins conserver le type de relation utilisée. Pour cela, il faut utiliser des PSFM dont la méthode est distincte pour chacun des trois cas. Les identifiants des ces PSFM doivent être en variable d’exploitation (variables d’exploitation, modifiable par l’équipe d’exploitation).


Equivalent poids vif :
 - Le calcul se fait par multiplication du poids total du lot par un coefficient multiplicateur. Ce coefficient est obtenu via une table de correspondance, à partir des caractéristiques suivantes :
 - espèce commerciale (=groupe de taxon) ;
 - présentation du poisson (ex : "Entier", "Vidé", "Étêté, vidé, équeuté", "Décortiqué", ...). La présentation du poisson correspond à un critère de classement. Si aucune présentation n’a été indiquée, on considère la présentation "entier" pour la recherche du coefficient ;
 - Etat du poisson (ex : "frais", "congelé", "salé", "séché"...). Si aucun état n’a été indiqué, on prenconsidère l’état "frais" pour la recherche du coefficient ;
 - Pays dans lequel s’est effectuée la capture. Le pays est obtenu à partir du lieu de départ de la marée observée, puis en remontant dans l’arbre des lieux de type ‘lieux terrestre’ jusqu’au niveau ‘pays’.
 - Le calcul n’est pas déclenché si :

   - L’espèce commerciale ne peut pas être déterminer pour le lot : elle n’a pas été saisie sur le lot ni sur aucune des lot père,
   - Aucun poids total n’a été saisi ou calculé sur le lot,
   - Le pays ne peut pas être déterminé.

Poids total calculé à partir des poids des sous-ensembles :
 - Le calcul se fait par addition des poids des différents sous ensembles pesés.
 - Le calcul n’est pas effectué tant que tous les sous-ensembles déclarés n’ont pas reçu de valeur de poids.
 - Le calcul n’a lieu que si un nombre de sous-ensemble a été saisi sur un lot.
 - Les lots héritent donc implicitement des critères de classement des lots pères. (https://gforge.ifremer.fr/mantis/view.php?id=1244)


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
