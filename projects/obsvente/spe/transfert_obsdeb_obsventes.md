# Transfert ObsDeb - ObsVentes

L'objectif du transfert ObsDeb - ObsVentes est de faciliter et de réduire le temps de saisie dans Obsventes des mensurations 
effectuées par les observateurs dans le cadre d'ObsDeb.

## Principe

Dans ObsVentes, un bouton permet d'afficher la liste des ventes ObsDeb à importer dans ObsVentes, elles correspondent aux 
marées ayant la case "Marée à transférer dans Allegro-Obsvente" cochée et n'existant pas déjà dans la base Harmonie
(clé sur la vente : navire, lieu de vente, date/heure).
Une marée ObsDeb modifiée ou complétée avec de nouvelles espèces ne sera pas répercutée côté ObsVentes.

> Questions :
> - MOA : conserver ce fonctionnement ou mettre en place un import automatique ?

## Règles
<b>RG001</b> : les PMFM et valeurs qualitatives spécifiées sont configurables via des énumérations

<b>RG002</b> : Une nouvelle vente est créée pour chaque type de commercialisation distinct (Produce.saleType_fk) d’une marée 
ObsDeb sélectionnée par l’utilisateur. Pour chaque vente une ligne est ajoutée dans la table SALE. S'il existe plusieurs 
circuits de commercialisation pour une espèce d’une marée obsdeb, alors  il faut créer une seule vente pour une marée OBSDEB 
et positionner le type de vente "9-Indéterminé - Hors HAM / Criée" sur la vente créée.
Exemple dans le cas de plusieurs circuits de commercialisation pour une même espèce :  
A partir de l'arbre de la marée ObsDeb suivant (au niveau de la capture)

Espèce 
    |________Etat 1/ présentation 1/ Catégorie de tri 1 (Poids 1)
    |________Etat 2/ présentation 2/ Catégorie de tri 2 (Poids 2)

La procédure stockée reconstitue la vente suivante dans ObsVentes :

Vente "9-Indéterminé - Hors HAM / Criée"
    |_____ Partie Vendue
               |_______Espèce 
                           |________Etat 1/ présentation 1/ Catégorie de tri 1 (Poids 1)
                           |________Etat 2/ présentation 2/ Catégorie de tri 2 (Poids 2)

## Sortie (OBSERVED_LOCATION)

| Colonne                   | Valeur                                                                                     |
|---------------------------|--------------------------------------------------------------------------------------------|
| ID                        | Trigger Oracle                                                                             |
| START_DATE_TIME           | Date de début de l'observation ObsDeb                                                      |
| END_DATE_TIME             | Date de fin de l'observation Obsdeb                                                        |
| COMMENTS                  | "Sortie importée par <_Utilisateur connecté à ObsVentes_> depuis OBSDEB le <_dd/mm/yyyy_>" |
| QUALIFICATION_DATE        |                                                                                            |
| QUALIFICATION_COMMENTS    |                                                                                            |
| UPDATE_DATE               | Date du jour (sysdate)                                                                     |
| RECORDER_PERSON_FK        | Utilisateur connecté à ObsVentes                                                           |
| RECORDER_DEPARTMENT_FK    | Société de l'utilisateur connecté à ObsVentes                                              |
| SAMPLING_STRATA_FK        | ?                                                                                          |
| SAMPLING_STRATA_REFERENCE | ?                                                                                          |
| LOCATION_FK               | Port de débarquement                                                                       |
| QUALITY_FLAG_FK           | "0"                                                                                        |
| PROGRAM_FK                | "SIH-OBSVENTE"                                                                             |
| CREATION_DATE             | Date du jour (sysdate)                                                                     |
| VALIDATION_DATE           |                                                                                            |
| CONTROLE_DATE             |                                                                                            |

## Observateurs de la sortie (OBSERVED_LOCATION2PERSON)

| Colonne              | Valeur                          |
|----------------------|---------------------------------|
| OBSERVED_LOCATION_FK | ID de la sortie ObsVentes créée |
| OBSERVER_PERSON_FK   | ID de l'observateur             |

## Débarquement (LANDING)

| Colonne                 | Valeur                                                                                          |
|-------------------------|-------------------------------------------------------------------------------------------------|
| ID                      | Trigger Oracle                                                                                  |
| IS_OBSERVED             | "1"                                                                                             |
| LANDING_DATE_TIME       | Date de début de l'observation ObsDeb                                                           |
| COMMENTS                | "Débarquement importé par <_Utilisateur connecté à ObsVentes_> depuis OBSDEB le <_dd/mm/yyyy_>" |
| CREATION_DATE           | Date du jour (sysdate)                                                                          |
| CONTROL_DATE            |                                                                                                 |
| VALIDATION_DATE         |                                                                                                 |
| QUALIFICATION_DATE      |                                                                                                 |
| QUALIFICATION_COMMENTS  |                                                                                                 |
| UPDATE_DATE             | Date du jour (sysdate)                                                                          |
| CATCH_BATCH_FK          |                                                                                                 |
| VESSEL_FK               | Navire de la marée ObsDeb                                                                       |
| PROGRAM_FK              | "SIH-OBSVENTE"                                                                                  |
| RECORDER_DEPARTMENT_FK  | Société de l'utilisateur connecté à ObsVentes                                                   |
| RECORDER_PERSON_FK      | Utilisateur connecté à ObsVentes                                                                |
| SURVEY_QUALIFICATION_FK |                                                                                                 |
| QUALITY_FLAG_FK         | "0"                                                                                             |
| FISHING_TRIP_FK         |                                                                                                 |
| LANDING_LOCATION_FK     |                                                                                                 |
| RANK_ORDER              | "1"                                                                                             |
| OBSERVED_LOCATION_FK    | ID de la sortie ObsVentes créée                                                                 |
| SAMPLING_STRATA_FK      | ?                                                                                               |

> Questions :
> ISI : ajouter les observateurs dans LANDING2OBSERVER_PERSON ? ce n'est pas le cas pour Imagine

## Vente (SALE)

| Colonne                        | Valeur                                                                                  |
|--------------------------------|-----------------------------------------------------------------------------------------|
| ID                             | Trigger Oracle                                                                          |
| SALE_START_DATE                | cf Mapping en Annexe                                                                    |
| CONTROL_DATE                   |                                                                                         |
| VALIDATION_DATE                |                                                                                         |
| QUALIFICATION_DATE             |                                                                                         |
| QUALIFICATION_COMMENTS         |                                                                                         |
| DECLARED_DOCUMENT_REFERENCE_FK |                                                                                         |
| FISHING_TRIP_FK                |                                                                                         |
| SALE_LOCATION_FK               | cf Mapping en Annexe                                                                    |
| SALE_TYPE_FK                   | cf Mapping en Annexe + [RG019]                                                          |
| VESSEL_FK                      | cf Mapping en Annexe                                                                    |
| QUALITY_FLAG_FK                | 0                                                                                       |
| IS_OBSERVED                    | 1                                                                                       |
| SALE_END_DATE                  |                                                                                         |
| COMMENTS                       | "Vente importée par <_Utilisateur connecté à Allegro_> depuis OBSDEB le <_dd/mm/yyyy_>" |
| CREATION_DATE                  | Date du jour (sysdate)                                                                  |
| UPDATE_DATE                    | Date du jour (sysdate)                                                                  |
| CATCH_BATCH_FK                 | Lien vers le lot "Partie Vendue"                                                        |
| LANDING_FK                     |                                                                                         |
| PROGRAM_FK                     | "SIH-OBSVENTE"                                                                          |
| RECORDER_DEPARTMENT_FK         | Société de l'utilisateur connecté à ObsVentes                                           |
| RECORDER_PERSON_FK             | Utilisateur connecté à ObsVentes                                                        |
| SELLER_FK                      |                                                                                         |
| TAKE_OVER_FK                   |                                                                                         |
| SAMPLING_STRATA_FK             | ?                                                                                       |
| TAKE_OVER_TYPE_FK              |                                                                                         |

## Observateurs de la vente (SALE2OBSERVER_PERSON)

<b>RG003</b> : Un ou plusieurs observateurs sont associés à la vente. Pour chaque observateur, une ligne est ajoutée dans la 
table SALE2OBSERVER_PERSON (cf cf Mapping en Annexe)

| Colonne   | Valeur                         |
|-----------|--------------------------------|
| SALE_FK   | ID de la vente ObsVentes créée |
| PERSON_FK | ID de l'observateur            |

## Caractéristiques de la vente (SALE_MEASUREMENT)

<b>RG005</b> : Les caractéristiques de ventes suivantes sont associées à la vente. Pour chaque caractéristique, une ligne est 
ajoutée dans la table SALE_MEASUREMENT.
* Stratégie d'échantillonnage (PMFM_ID=1389). La valeur de la stratégie d’échantillonnage est initialisée à partir de la stratégie d'échantillonnage de la référence au plan, si disponible (DENORMALIZED_SAMPLING_STRATA. SAMPLING_STRATEGY avec DENORMALIZED_SAMPLING_STRATA.ID= référence récupérée dans SALE. SAMPLING_STRATA_FK) 
* Validation observateur  (PMFM_ID=741) : initialisé par défaut à "Données non contrôlées" (QUALITATIVE_VALUE_ID=1242)
* Validation société  (PMFM_ID=297): initialisé par défaut à "Non"  (QUALITATIVE_VALUE_ID=418)


| Colonne                | Valeur                                        |
|------------------------|-----------------------------------------------|
| ID                     | Trigger Oracle                                |
| NUMERICAL_VALUE        |                                               |
| DIGIT_COUNT            |                                               |
| PRECISION_VALUE        |                                               |
| CONTROLE_DATE          |                                               |
| VALIDATION_DATE        |                                               |
| QUALIFICATION_DATE     |                                               |
| QUALIFICATION_COMMENTS |                                               |
| DEPARTMENT_FK          | Société de l'utilisateur connecté à ObsVentes |
| PRECISION_TYPE_FK      |                                               |
| QUALITY_FLAG_FK        | "0"                                           |
| ANALYSIS_INSTRUMENT_FK |                                               |
| NUMERICAL_PRECISION_FK |                                               |
| PMFM_FK                |                                               |
| QUALITATIVE_VALUE_FK   |                                               |
| AGGREGATION_LEVEL_FK   |                                               |
| SALE_FK                | ID de la vente ObsVentes créée                |
| EXPECTED_SALE_FK       |                                               |
| ALPHANUMERICAL_VALUE   |                                               |

## Lot "Partie vendue"

Le lot "Partie Vendue" est le lot de plus haut niveau de l’arbre d’échantillonnage. 
<b>RG006</b> : Pour chaque vente est associée un lot "Partie Vendue". Pour chaque lot "Partie Vendue", une ligne est ajoutée 
dans la table BATCH :

| Colonne                  | Valeur                   |
|--------------------------|--------------------------|
| ID                       | Trigger Oracle           |
| IS_CATCH_BATCH           | "1"                      |
| RANK_ORDER               | "1"                      |
| SUBGROUP_COUNT           |                          |
| INDIVIDUAL_COUNT         |                          |
| CHILD_BATCHS_REPLICATION | "0"                      |
| EXHAUSTIVE_INVENTORY     | "0"                      |
| COMMENTS                 |                          |
| PARENT_BATCH_FK          |                          |
| CONTROL_DATE             |                          |
| VALIDATION_DATE          |                          |
| QUALIFICATION_DATE       |                          |
| QUALIFICATION_COMMENTS   |                          |
| UPDATE_DATE              | Date du jour (sysdate)   |
| QUALITY_FLAG_FK          | "0"                      |
| SAMPLING_RATIO           |                          |
| SAMPLING_RATIO_TEXT      |                          |
| TAXON_GROUP_FK           |                          |
| REFERENCE_TAXON_FK       |                          |
| LABEL                    |                          |
| ROOT_BATCH_FK            |                          |
| LOCATION_FK              |                          |

## Lots "Espèces commerciales"

Les lots "Espèces commerciales" sont des lots fils du lot "Partie Vendue". Ces lots sont caractérisés par un "Type de tri". 
<b>RG007</b> : un lot "Espèce commerciale", fils du lot "Partie Vendue" est créé pour chaque "Espèce commerciale" 
de la capture débarquée et dont le  type de commercialisation est celui de la vente en cours de création. S'il existe 
plusieurs circuits de commercialisation pour une espèce d’une marée OBSDEB (cf règle RG002)  alors   un lot "Espèce commerciale", 
fils du lot "Partie Vendue" est créé pour chaque "Espèce commerciale" de la capture débarquée (quel que soit le type de 
commercialisation)  de la vente en cours de création. Pour chaque lot "Espèce commerciale", une ligne est ajoutée dans la 
table BATCH :

| Colonne                  | Valeur                                                  |
|--------------------------|---------------------------------------------------------|
| ID                       | Trigger Oracle                                          |
| IS_CATCH_BATCH           | "0"                                                     |
| RANK_ORDER               | Incrémenté en partant de 1 pour chaque lot de même père |
| SUBGROUP_COUNT           |                                                         |
| INDIVIDUAL_COUNT         |                                                         |
| CHILD_BATCHS_REPLICATION | "0"                                                     |
| EXHAUSTIVE_INVENTORY     | "1"                                                     |
| COMMENTS                 |                                                         |
| PARENT_BATCH_FK          | ID du lot "Partie vendue"                               |
| CONTROL_DATE             |                                                         |
| VALIDATION_DATE          |                                                         |
| QUALIFICATION_DATE       |                                                         |
| QUALIFICATION_COMMENTS   |                                                         |
| UPDATE_DATE              | Date du jour (sysdate)                                  |
| QUALITY_FLAG_FK          | "0"                                                     |
| SAMPLING_RATIO           |                                                         |
| SAMPLING_RATIO_TEXT      |                                                         |
| TAXON_GROUP_FK           | cf Mapping en Annexe                                    |
| REFERENCE_TAXON_FK       |                                                         |
| LABEL                    |                                                         |
| ROOT_BATCH_FK            | ID du lot "Partie vendue"                               |
| LOCATION_FK              |                                                         |

<b>RG008</b> : Pour chaque lot "Espèce commerciale", une ligne est ajoutée dans la table SORTING MEASUREMENT pour caractériser  
le "Type de tri" (PMFM.ID = 1387)  avec la valeur "Tri patron navire" (QUALITATIVE_VALUE_FK =  1746) par défaut 

| Colonne                | Valeur                                        |
|------------------------|-----------------------------------------------|
| ID                     | Trigger Oracle                                |
| NUMERICAL_VALUE        |                                               |
| DIGIT_COUNT            |                                               |
| PRECISION_VALUE        |                                               |
| CONTROL_DATE           |                                               |
| VALIDATION_DATE        |                                               |
| QUALIFICATION_DATE     |                                               |
| QUALIFICATION_COMMENTS |                                               |
| DEPARTMENT_FK          | Société de l'utilisateur connecté à ObsVentes |
| PRECISION_TYPE_FK      |                                               |
| QUALITY_FLAG_FK        | "0"                                           |
| ANALYSIS_INSTRUMENT_FK |                                               |
| NUMERICAL_PRECISION_FK |                                               |
| PMFM_FK                | Valeur du PMFM [RG008]                        |
| QUALITATIVE_VALUE_FK   | Valeur du PMFM [RG008]                        |
| AGGREGATION_LEVEL_FK   |                                               |
| RANK_ORDER             | 1                                             |
| SORTING_BATCH_FK       | ID du lot "Espèce commerciale"                |
| ALPHANUMERICAL_VALUE   |                                               |

## Lots "Catégorie Terrain - Catégorie UE - Présentation - Etat"

Les lots "Catégorie Terrain - Catégorie UE - Présentation - Etat" sont des lots fils des lots "Espèces commerciale".
<b>RG009</b> : un lot "Catégorie Terrain - Catégorie UE - Présentation - Etat", fils du lot "Espèce commerciale" est créé 
pour chaque "Espèce commerciale" de la capture débarquée. Pour chaque lot "Espèce commerciale", une ligne est ajoutée 
dans la table BATCH :

| Colonne                  | Valeur                                                  |
|--------------------------|---------------------------------------------------------|
| ID                       | Trigger Oracle                                          |
| IS_CATCH_BATCH           | "0"                                                     |
| RANK_ORDER               | Incrémenté en partant de 1 pour chaque lot de même père |
| SUBGROUP_COUNT           |                                                         |
| INDIVIDUAL_COUNT         |                                                         |
| CHILD_BATCHS_REPLICATION | "0"                                                     |
| EXHAUSTIVE_INVENTORY     | "1"                                                     |
| COMMENTS                 |                                                         |
| PARENT_BATCH_FK          | ID du lot "Espèce commerciale"                          |
| CONTROL_DATE             |                                                         |
| VALIDATION_DATE          |                                                         |
| QUALIFICATION_DATE       |                                                         |
| QUALIFICATION_COMMENTS   |                                                         |
| UPDATE_DATE              | Date du jour (sysdate)                                  |
| QUALITY_FLAG_FK          | "0"                                                     |
| SAMPLING_RATIO           |                                                         |
| SAMPLING_RATIO_TEXT      |                                                         |
| TAXON_GROUP_FK           | cf Mapping en Annexe                                    |
| REFERENCE_TAXON_FK       |                                                         |
| LABEL                    |                                                         |
| ROOT_BATCH_FK            | ID du lot "Partie vendue" ?                             |
| LOCATION_FK              |                                                         |

<b>RG010</b> : Une ligne est ajoutée dans la table SORTING MEASUREMENT, pour chacun des critères suivants du lot  
"Catégorie Terrain - Catégorie UE - Présentation - Etat" dans cet ordre :
1. Catégorie Terrain (PMFM_ID= 341) : Cf Mapping en Annexe [10]
2. Catégorie UE (PMFM_ID= 1121) avec la valeur  "Cat UE0" (QUALITATIVE_VALUE_FK =  1481) par défaut
3. Etat (PMFM_ID=189) . Cf Mapping en Annexe [8]
4. Présentation (PMFM_ID=1064) . Cf Mapping en Annexe [9]

| Colonne                | Valeur                                                             |
|------------------------|--------------------------------------------------------------------|
| ID                     | Trigger Oracle                                                     |
| NUMERICAL_VALUE        |                                                                    |
| DIGIT_COUNT            |                                                                    |
| PRECISION_VALUE        |                                                                    |
| CONTROL_DATE           |                                                                    |
| VALIDATION_DATE        |                                                                    |
| QUALIFICATION_DATE     |                                                                    |
| QUALIFICATION_COMMENTS |                                                                    |
| DEPARTMENT_FK          | Société de l'utilisateur connecté à ObsVentes                      |
| PRECISION_TYPE_FK      |                                                                    |
| QUALITY_FLAG_FK        | "0"                                                                |
| ANALYSIS_INSTRUMENT_FK |                                                                    |
| NUMERICAL_PRECISION_FK |                                                                    |
| PMFM_FK                | ID du PMFM [RG010]                                                 |
| QUALITATIVE_VALUE_FK   | Valeur du PMFM [RG010]                                             |
| AGGREGATION_LEVEL_FK   |                                                                    |
| RANK_ORDER             | Ordre du critère de classement [RG010] (1, 2, 3 ou 4)              |
| SORTING_BATCH_FK       | ID du lot "Catégorie Terrain - Catégorie UE - Présentation - Etat" |
| ALPHANUMERICAL_VALUE   |                                                                    |

<b>RG011</b> : Un poids "Déclaration d'un professionnel" (PMFM_ID= 1) est positionné sur  chaque lot "Catégorie Terrain - 
Catégorie UE - Présentation - Etat"  (Cf Mapping en Annexe [7]). Le poids est positionné comme poids de référence, sauf 
pour les espèces sexées (cf RG014 : Détermination du sexage des espèces scientifiques)

| Colonne                     | Valeur                                                             |
|-----------------------------|--------------------------------------------------------------------|
| ID                          | Trigger Oracle                                                     |
| NUMERICAL_VALUE             | Valeur du PMFM [RG011]                                             |
| DIGIT_COUNT                 |                                                                    |
| PRECISION_VALUE             |                                                                    |
| CONTROL_DATE                |                                                                    |
| VALIDATION_DATE             |                                                                    |
| QUALIFICATION_DATE          |                                                                    |
| QUALIFICATION_COMMENTS      |                                                                    |
| DEPARTMENT_FK               | Société de l'utilisateur connecté à ObsVentes                      |
| PRECISION_TYPE_FK           |                                                                    |
| QUALITY_FLAG_FK             | "0"                                                                |
| ANALYSIS_INSTRUMENT_FK      |                                                                    |
| NUMERICAL_PRECISION_FK      |                                                                    |
| PMFM_FK                     | ID du PMFM [RG011]                                                 |
| QUALITATIVE_VALUE_FK        |                                                                    |
| AGGREGATION_LEVEL_FK        |                                                                    |
| SUBGROUP_NUMBER             |                                                                    |
| IS_REFERENCE_QUANTIFICATION | Cf [RG011]                                                         |
| BATCH_FK                    | ID du lot "Catégorie Terrain - Catégorie UE - Présentation - Etat" |
| ALPHANUMERICAL_VALUE        |                                                                    |

## Lot "Espèce scientifique"

Le lot "Espèce scientifique" est un lot fils du lot "Catégorie Terrain - Catégorie UE - Présentation - Etat".

<b>RG012</b> : un lot "Espèce scientifique", fils du lot "Catégorie Terrain - Catégorie UE - Présentation - Etat" est créé 
pour chaque lot "Catégorie Terrain - Catégorie UE - Présentation - Etat"  dont l’espèce commerciale est associée à une seule 
espèce scientifique.
Exemple : Un lot espèce scientifique "Thunnus alalunga" est créé pour l’espèce commerciale ‘ALB-GERMON’. En revanche aucun 
lot espèce scientifique n’est créé pour l’espèce commerciale "MNZ –Baudroies" qui possède plusieurs espèce scientifiques référentes.
Notes techniques : 
•	Les référentiels utilisés pour la gestion des liens espèces commerciales / espèce scientifiques sont les mêmes que ceux 
utilisés pour l’import PSION (Type de transcodage "ARPEGE-TAXON.CODE").
•	La zone de pêche d’obsdeb n’est pas stockée. Elle sera déduite de la référence au plan d’échantillonnage lorsque 
l’utilisateur complétera la vente dans Allegro (Onglet RTP d’une Vente).

| Colonne                  | Valeur                                                                          |
|--------------------------|---------------------------------------------------------------------------------|
| ID                       | Trigger Oracle                                                                  |
| IS_CATCH_BATCH           | "0"                                                                             |
| RANK_ORDER               | Incrémenté en partant de 1 pour chaque lot de même père                         |
| SUBGROUP_COUNT           |                                                                                 |
| INDIVIDUAL_COUNT         |                                                                                 |
| CHILD_BATCHS_REPLICATION | "0"                                                                             |
| EXHAUSTIVE_INVENTORY     | "1"                                                                             |
| COMMENTS                 |                                                                                 |
| PARENT_BATCH_FK          | ID du lot "Catégorie Terrain - Catégorie UE - Présentation - Etat"              |
| CONTROL_DATE             |                                                                                 |
| VALIDATION_DATE          |                                                                                 |
| QUALIFICATION_DATE       |                                                                                 |
| QUALIFICATION_COMMENTS   |                                                                                 |
| UPDATE_DATE              | Date du jour (sysdate)                                                          |
| QUALITY_FLAG_FK          | "0"                                                                             |
| SAMPLING_RATIO           |                                                                                 |
| SAMPLING_RATIO_TEXT      |                                                                                 |
| TAXON_GROUP_FK           |                                                                                 |
| REFERENCE_TAXON_FK       | reference_taxon de l’espèce scientifique associé à l’espèce commerciale [RG012] |
| LABEL                    |                                                                                 |
| ROOT_BATCH_FK            | ID du lot "Partie vendue" ?                                                     |
| LOCATION_FK              |                                                                                 |

## Lot "Sexe"
Le lot "Sexe" est un lot fils du lot "Espèce scientifique".
<b>RG013</b> : Des lots "Sexe" (un lot par valeur possible selon l’espèce scientifique parmi "indéterminé", "mâle", "femelle"), 
fils du lot "Espèce scientifique" sont créés pour chaque "Espèce scientifique" sexée. Si l’espèce n’est pas sexée alors aucun 
lot "sexe" n’est ajouté. 
Notes techniques : 
•	<b>RG014</b> : Détermination du sexage des espèces scientifiques
•	Les référentiels utilisés pour la gestion des liens espèce scientifiques / Espèces sexées sont les mêmes que ceux 
utilisés pour l’import PSION (Type de transcodage "ARPEGE-STOCK.CODE", via le code externe CODE_REFTAX récupéré à 
l’étape précédente pour la détermination de l’espèce scientifique)
•	La zone de pêche (Cf mapping en annexe [12])  et l’année (Cf mapping en annexe [3])   sont récupérés d’OBSDEB pour 
identifier les relations valides dans le référentiel de sexage du plus précis au moins précis 
	Zone la plus précise en fonction de la hiérarchie des lieux.
	Dernière année disponible 
•	La zone de pêche d’obsdeb n’est pas stockée. Elle sera déduite de la référence au plan d’échantillonnage lorsque 
l’utilisateur complétera la vente dans Allegro (Onglet RTP d’une Vente)
Une ligne est ajoutée dans la table BATCH, pour chaque valeur de sexage récupérée.

| Colonne                  | Valeur                                                  |
|--------------------------|---------------------------------------------------------|
| ID                       | Trigger Oracle                                          |
| IS_CATCH_BATCH           | "0"                                                     |
| RANK_ORDER               | Incrémenté en partant de 1 pour chaque lot de même père |
| SUBGROUP_COUNT           |                                                         |
| INDIVIDUAL_COUNT         |                                                         |
| CHILD_BATCHS_REPLICATION | "0"                                                     |
| EXHAUSTIVE_INVENTORY     | "1"                                                     |
| COMMENTS                 |                                                         |
| PARENT_BATCH_FK          | ID du lot "Espèce scientifique"                         |
| CONTROL_DATE             |                                                         |
| VALIDATION_DATE          |                                                         |
| QUALIFICATION_DATE       |                                                         |
| QUALIFICATION_COMMENTS   |                                                         |
| UPDATE_DATE              | Date du jour (sysdate)                                  |
| QUALITY_FLAG_FK          | "0"                                                     |
| SAMPLING_RATIO           |                                                         |
| SAMPLING_RATIO_TEXT      |                                                         |
| TAXON_GROUP_FK           |                                                         |
| REFERENCE_TAXON_FK       |                                                         |
| LABEL                    |                                                         |
| ROOT_BATCH_FK            | ID du lot "Partie vendue" ?                             |
| LOCATION_FK              |                                                         |

<b>RG015</b> : Une ligne est ajoutée dans la table SORTING MEASUREMENT, pour chaque valeur de sexage récupérée (cf RG014):
	Sexe (PMFM_ID= 196) : 
1.	Si ‘I’ Alors ID QUALITATIVE_VALUE("Indéterminé")
2.	Si ‘M’ Alors ID QUALITATIVE_VALUE("Mâle")
3.	Si ‘F’ Alors ID QUALITATIVE_VALUE("Femelle")

| Colonne                | Valeur                                             |
|------------------------|----------------------------------------------------|
| ID                     | Trigger Oracle                                     |
| NUMERICAL_VALUE        |                                                    |
| DIGIT_COUNT            |                                                    |
| PRECISION_VALUE        |                                                    |
| CONTROL_DATE           |                                                    |
| VALIDATION_DATE        |                                                    |
| QUALIFICATION_DATE     |                                                    |
| QUALIFICATION_COMMENTS |                                                    |
| DEPARTMENT_FK          | Société de l'utilisateur connecté à ObsVentes      |
| PRECISION_TYPE_FK      |                                                    |
| QUALITY_FLAG_FK        | "0"                                                |
| ANALYSIS_INSTRUMENT_FK |                                                    |
| NUMERICAL_PRECISION_FK |                                                    |
| PMFM_FK                | ID du PMFM [RG015]                                 |
| QUALITATIVE_VALUE_FK   | Valeur du PMFM [RG015]                             |
| AGGREGATION_LEVEL_FK   |                                                    |
| RANK_ORDER             | Ordre du critère de classement [RG015] (1, 2 ou 3) |
| SORTING_BATCH_FK       | ID du lot "Sexe"                                   |
| ALPHANUMERICAL_VALUE   |                                                    |

## Lot "Taille"
Le lot "Taille" est un lot fils du lot "Sexe" ou du lot "Espèce scientifique" si l’espèce n’est pas sexée
<b>RG016</b> : Deux lots "Taille" (valeur min, valeur max), fils du lot "Sexe" ou du lot "Espèce scientifique" si l’espèce 
n’est pas sexée sont créés.
Notes techniques : 
•	<b>RG017</b> : Détermination du PMFM utilisé pour la taille 
•	Les référentiels utilisés pour la gestion des liens espèce commerciale / PMFM  sont les mêmes que ceux utilisés pour 
l’import PSION (Type de transcodage "ARPEGE-TAXON2PMFM.CODE") selon l’espèce commerciale et la présentation (Cf mapping 
en annexe [9]). Lorsque la correspondance ne peut se faire alors un PMFM par défaut est utilisé 
(PMFM.id = 306 – Longueur totale - Mesure au cm par un observateur)
•	<b>RG018</b> : Par défaut la valeur min = 1 pour le premier lot et la valeur max = 2 pour le deuxième lot
Pour chaque classe de taille (min, max) un enregistrement est ajouté dans les tables suivantes :

BATCH :

| Colonne                  | Valeur                                                       |
|--------------------------|--------------------------------------------------------------|
| ID                       | Trigger Oracle                                               |
| IS_CATCH_BATCH           | "0"                                                          |
| RANK_ORDER               | Incrémenté en partant de 1 pour chaque lot de même père      |
| SUBGROUP_COUNT           |                                                              |
| INDIVIDUAL_COUNT         |                                                              |
| CHILD_BATCHS_REPLICATION | "0"                                                          |
| EXHAUSTIVE_INVENTORY     | "1"                                                          |
| COMMENTS                 |                                                              |
| PARENT_BATCH_FK          | ID du lot "Sexe" ou du lot "Espèce scientifique" si non sexé |
| CONTROL_DATE             |                                                              |
| VALIDATION_DATE          |                                                              |
| QUALIFICATION_DATE       |                                                              |
| QUALIFICATION_COMMENTS   |                                                              |
| UPDATE_DATE              | Date du jour (sysdate)                                       |
| QUALITY_FLAG_FK          | "0"                                                          |
| SAMPLING_RATIO           |                                                              |
| SAMPLING_RATIO_TEXT      |                                                              |
| TAXON_GROUP_FK           |                                                              |
| REFERENCE_TAXON_FK       |                                                              |
| LABEL                    |                                                              |
| ROOT_BATCH_FK            | ID du lot "Partie vendue" ?                                  |
| LOCATION_FK              |                                                              |

SORTING_MEASUREMENT :

| Colonne                | Valeur                                          |
|------------------------|-------------------------------------------------|
| ID                     | Trigger Oracle                                  |
| NUMERICAL_VALUE        | Valeur du PMFM [RG018]                          |
| DIGIT_COUNT            |                                                 |
| PRECISION_VALUE        |                                                 |
| CONTROL_DATE           |                                                 |
| VALIDATION_DATE        |                                                 |
| QUALIFICATION_DATE     |                                                 |
| QUALIFICATION_COMMENTS |                                                 |
| DEPARTMENT_FK          | Société de l'utilisateur connecté à ObsVentes   |
| PRECISION_TYPE_FK      |                                                 |
| QUALITY_FLAG_FK        | "0"                                             |
| ANALYSIS_INSTRUMENT_FK |                                                 |
| NUMERICAL_PRECISION_FK |                                                 |
| PMFM_FK                | ID du PMFM [RG017]                              |
| QUALITATIVE_VALUE_FK   |                                                 |
| AGGREGATION_LEVEL_FK   |                                                 |
| RANK_ORDER             | Ordre du critère de classement [RG018] (1 ou 2) |
| SORTING_BATCH_FK       | ID du lot "Taille"                              |
| ALPHANUMERICAL_VALUE   |                                                 |