# Export des données d'auto-échantillonnage 2022

1. Dénormalisation des données d'échantillonnage

> `--denormalize-trips --program ADAP-MER --year 2022`

```
2023-03-15 19:26:39,413 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Starting trips denormalization... filter: TripFilterVO(startDate=Sat Jan 01 00:00:00 CET 2022, endDate=Sat Dec 31 23:59:59 CET 2022, programLabel=ADAP-MER, recorderDepartmentId=null, recorderPersonId=null, observerPersonIds=null, vesselId=null, locationId=null, locationIds=null, excludedIds=null, includedIds=[], tripId=null, operationIds=[], observedLocationId=null, qualityFlagIds=null, dataQualityStatus=null, programIds=null, boundingBox=null)
2023-03-15 19:26:39,594 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 0/223
2023-03-15 19:27:01,436 ERROR [ForkJoinPool.commonPool-worker-2] n.s.c.s.d.d.DenormalizeOperationServiceImpl : Invalid batch weight {id: 3193007, label: 'SORTING_BATCH#2.LAN.%', weight: 32.0}. Should be <= 12.0 kg (parent weight)
2023-03-15 19:27:56,548 WARN  [main           ] n.s.c.s.d.d.DenormalizedBatchServiceImpl   : Invalid batch {id: 3202954, label: 'SORTING_BATCH#1.DIS'}: elevateWeight=0 but elevateIndividualCount > 0
2023-03-15 19:28:49,914 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 20/223
2023-03-15 19:31:07,413 ERROR [ForkJoinPool.commonPool-worker-5] n.s.c.s.d.d.DenormalizeOperationServiceImpl : Invalid batch weight {id: 3214472, label: 'SORTING_BATCH#1.LAN.%', weight: 6.9}. Should be <= 0.0 kg (parent weight)
2023-03-15 19:31:42,778 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 40/223
2023-03-15 19:34:07,385 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 60/223
2023-03-15 19:36:14,780 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 80/223
2023-03-15 19:38:31,930 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 100/223
2023-03-15 19:39:14,628 WARN  [ForkJoinPool.commonPool-worker-7] n.s.c.s.d.d.DenormalizedBatchServiceImpl   : Invalid batch {id: 3293314, label: 'SORTING_BATCH#1.DIS.%'}: elevateWeight=0 but elevateIndividualCount > 0
2023-03-15 19:39:14,628 WARN  [ForkJoinPool.commonPool-worker-7] n.s.c.s.d.d.DenormalizedBatchServiceImpl   : Invalid batch {id: 3293313, label: 'SORTING_BATCH#1.DIS'}: elevateWeight=0 but elevateIndividualCount > 0
2023-03-15 19:40:51,815 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 120/223
2023-03-15 19:42:01,824 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 140/223
2023-03-15 19:44:06,581 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 160/223
2023-03-15 19:46:30,299 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 180/223
2023-03-15 19:48:25,501 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 200/223
2023-03-15 19:49:54,865 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Processing trips denormalization... 220/223
2023-03-15 19:50:10,691 INFO  [main           ] n.s.cli.action.data.DenormalizeTripsAction : Trips denormalization finished, in 23m 31.286s - 223 trips, 3806 operations, 85780 batches - 0 trips in error, 2 invalid batch trees (skipped)
```

2. Téléchargement des données, format COST :

  * 223 marées, 3806 OP
  * 3 OP en erreur : 
    * /trips/1648/operation/197808 
      * modifier les mesures en "Partie retenue"
      * modifier la présentation en "WHL - Entier" (cf commentaire)
    * /trips/1668/operation/198407
        * COD / Partir retenue : le poids échantillonné est corrigé en 0 (zéro)  
    * /trips/1780/operation/201732
      * Poids partie rejettée corriger en 0.76 (=poids RTP)
