## Data Model - Administration

---
### Program

![program](model/administration/program.svg)

Note:
- Program is the entity that holds a data collection project (e.g. a scientific project, a UE project, ...).

- A Program describe the project (label, name, description);  
  * Each program has one or more strategies; 
   
- Forthcoming:
  * Each program can manage access rights by users or departments

---
### Strategy
![strategy](model/administration/strategy.svg)

Note:
- A Strategy holds one data collection protocol. Typically, it define all parameters (PSFMU) that should be collected.
  * Each collected parameters is collected inside a acquisition level (e.g. on Trip, on Operation, on Landing, ...)

- Forthcoming:
   * A strategy is applied on one or more period and on one or more locations.
   
This concept of program / strategies allow us to generate all the fields that user can fill in screens,
and also all applied controls (min/max, type).
This is part the generic aspect of SUMARiS tools.
 
---
### Sampling scheme

![samplingScheme](model/administration/samplingScheme/sampling-scheme.svg)

---
### Sampling strata (denormalized)

![denormalizedSamplingStrata](model/administration/samplingScheme/denormalized-sampling-strata.svg)

---
### User expertise area
The expertise areas define the users' activity zones. The **local language translation** of the repository lists (species, profession, equipment, etc.).
Combined with regionalization, it is then possible to **restrict the repository lists** to display only the relevant elements for the user's region.

![UserActivityArea](model/referential/user-activity-area.svg)
