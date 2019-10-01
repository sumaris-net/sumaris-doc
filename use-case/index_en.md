# Functional use cases

 - [Administration of referentials]()
 - [Collection of data]()
    * [CU Entering a sighting on landing]()
    * [CU Entering an observed landing]()

## Administration of referentials

(ongoing)

## Collection of data

### CU "Entering a sighting on landing"

![observed-location](../dist/use-case/collect/observed-location-uc.svg)

#### Main Scenario

1. The observer requests the creation of a new observation on landing.

2. He enters :

    * Data collection program;
    * Location of observation;
    * Date/time of observation start;
    * End date/time (optional/invisible - depending on program configuration);
    * One or more observers (at least one mandatory);
    * Other characteristics / parameters, collected for the program;
    * Comment (optional)

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-new.svg)

3. He can then add/remove observed vessels :

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-vessels.svg)


### CU "Entering an observed landing"

Goal :


![landing](../dist/use-case/collect/landing-uc.svg)

#### Main Scenario

1. The observer requests the creation of a new landing, attached to an observation on site.

2. He enters :
    * The observed vessel:
    * Other characteristics / parameters, collected for the program;
    * A comment (optional)

![landing-ui-new](../dist/use-case/collect/landing-ui-new.svg)

3. He can then enter the landed catch :

![landing-ui-new](../dist/use-case/collect/landing-ui-samples.svg)

4. The user saves his changes

#### Variants

### Variant 1.a - Landing without parent observation

1. The observer requests the creation of a new landing, without 
   attachment to an on-site observation (eg opportunistic data collection)

2. He enters :

    * The collection program;
    * The observed vessel:
    * he place of landing;
    * The date and time of the landing.
    * Observers (at least one mandatory)
    * Other characteristics / parameters, collected for the program;
    * A comment (optional)

\[Retour au 3]
