# Manuel de mise en exploitation d'Imagine version ??

Objectif : le document liste les étapes de migration, pour réaliser la mise en production

Liste des tickets réalisés : 
- [#499](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/499) - [Obs. Individuelle - sorties] Modification champ Date
- [#500](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/500) - [Ligne de plan] Invalid value of AppliedPeriode.endDate

> Auteur: Benoit LAVENIER
> Date création : 13/12/2023
> Mise à jour : 13/12/2023

## Configuration du Pod

- [ ] Nouvelles options dans le fichier de configuration :
  ```properties  
  # [Optionnel] Indexation et recherche des navires via ElasticSearch (version ~7.17.7)
  # See documentation at: https://docs.spring.io/spring-boot/docs/2.7.17/reference/html/data.html#data.nosql.elasticsearch
  spring.elasticsearch.enabled=true
  spring.elasticsearch.uris=http://localhost:9200
  spring.elasticsearch.username=<USERNAME>
  spring.elasticsearch.password=<PASSWORD>
  spring.elasticsearch.index.prefix=isi_sumaris_rw_
  
  # [Optionnel] Nb years for ElasticSearch vessels indexation (used to limit vessel features/registration) 
  sumaris.elasticsearch.vessel.snapshot.scheduling.nbYears=5
  
  # [Optionnel] Cron expression, to update the vessels indexation (Hourly by default) 
  sumaris.elasticsearch.vessel.snapshot.scheduling.cron=0 0 * * * ?
  
  # Limit vessel indexation/search to specific VesselType (e.g. "Fishing vessel", "Scientific vessel")
  sumaris.data.vessel.type.ids=1,8
  
  # Enumerations
  sumaris.enumeration.VesselType.UNKNOWN.id=0
  sumaris.enumeration.VesselType.FISHING_VESSEL.id=1
  sumaris.enumeration.VesselType.SCIENTIFIC_RESEARCH_VESSEL.id=8
  ```

- [ ] Tester l'accès à l'index ES (par exemple `http://localhost:9200/vessel_snapshot/_search?pretty&size=0`)

## Schéma SIH2_ADAGIO_DBA

RAS

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

RAS
  
## Mise à jour du programme SIH-OBSBIO

RAS


## Mise à jour des données SIH-OBSBIO

- Correction des `AppliedPeriod.endDate` en remplaçant `23:59:59` par `00:00:00` (cf ticket [#500](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/500)): 
  ```sql
  UPDATE APPLIED_PERIOD
  SET END_DATE = TRUNC(END_DATE)
  WHERE END_DATE <> TRUNC(END_DATE)
  AND APPLIED_STRATEGY_FK in (
    select APS.ID 
    from APPLIED_STRATEGY APS 
    inner join STRATEGY on STRATEGY.ID = APS.STRATEGY_FK 
    where STRATEGY.PROGRAM_FK=:programId -- ID du program 'SIH-OBSBIO'
  );
- ``` 