# Transfert ObsDeb - ObsVentes

L'objectif du transfert ObsDeb - ObsVentes est de faciliter et de réduire le temps de saisie dans Obsventes des mensurations 
effectuées par les observateurs dans le cadre d'ObsDeb.

## Principe

Dans ObsVentes, un bouton permet d'afficher la liste des ventes ObsDeb à importer dans ObsVentes, elle correspond aux marées 
ayant la case "Marée à transférer dans Allegro-Obsvente" cochée et n'existant pas déjà en base
(clé sur la vente : navire, lieu de vente, date/heure).
Une marée ObsDeb modifiée ou complétée avec de nouvelles espèces ne sera pas répercutée côté ObsVentes.

<b>RG001</b> : les PMFM et valeurs qualitatives spécifiées sont configurables via des énumérations

RG002 : Une nouvelle vente est créée pour chaque type de commercialisation distinct (Produce.saleType_fk) d’une marée ObsDeb sélectionnée par l’utilisateur. Pour chaque vente une ligne est ajoutée dans la table SALE. S'il existe plusieurs circuits de commercialisation pour une espèce d’une marée obsdeb, alors  il faut créer une seule vente pour une marée OBSDEB et positionner le type de vente « 9-Indéterminé - Hors HAM / Criée" sur la vente créée».
Exemple dans le cas de plusieurs circuits de commercialisation pour une même espèce :  
A partir de l'arbre de la marée ObsDeb suivant (au niveau de la capture)

Espèce 
    |________Etat 1/ présentation 1/ Catégorie de tri 1 (Poids 1)
    |________Etat 2/ présentation 2/ Catégorie de tri 2 (Poids 2)

La procédure stockée reconstitue la vente suivante dans ObsVentes :

Vente  « 9-Indéterminé - Hors HAM / Criée"
    |_____ Partie Vendue
               |_______Espèce 
                           |________Etat 1/ présentation 1/ Catégorie de tri 1 (Poids 1)
                           |________Etat 2/ présentation 2/ Catégorie de tri 2 (Poids 2)

#### Table SALE

| Colonne | Valeur |
| ID | Trigger Oracle |
| SALE_START_DATE | cf Mapping en Annexe 
| CONTROL_DATE |  |
| VALIDATION_DATE |  |
| QUALIFICATION_DATE |  |
| QUALIFICATION_COMMENTS |  |
| DECLARED_DOCUMENT_REFERENCE_FK |  |
| FISHING_TRIP_FK |  |
| SALE_LOCATION_FK | cf Mapping en Annexe |
| SALE_TYPE_FK | cf Mapping en Annexe + [RG019] |
| VESSEL_FK | cf Mapping en Annexe |
| QUALITY_FLAG_FK | 0 |
| IS_OBSERVED | 1 |
| SALE_END_DATE | |
| COMMENTS | «Vente importée par <_Utilisateur connecté à Allegro_> depuis OBSDEB le <_dd/mm/yyyy_>» |
| CREATION_DATE | Date du jour (sysdate) |
| UPDATE_DATE | Date du jour (sysdate) |
| CATCH_BATCH_FK | Lien vers le lot « Partie Vendue » |
| LANDING_FK | |
| PROGRAM_FK | « SIH-OBSVENTE » (cf énumération ProgramCode.SIH_OBSVENTE) |
| RECORDER_DEPARTMENT_FK | Utilisateur connecté à Allegro |
| RECORDER_PERSON_FK | Utilisateur connecté à Allegro |
| SELLER_FK | |
| TAKE_OVER_FK | |
| SAMPLING_STRATA_FK | ? |
| TAKE_OVER_TYPE_FK |  |

<b>RG003</b> : Un ou plusieurs observateurs sont associés à la vente. Pour chaque observateur, une ligne est ajoutée dans la 
table SALE2OBSERVER_PERSON (cf cf Mapping en Annexe)

<b>RG005</b> : Les caractéristiques de ventes suivantes sont associées à la vente. Pour chaque caractéristique, une ligne est 
ajoutée dans la table SALE_MEASUREMENT.