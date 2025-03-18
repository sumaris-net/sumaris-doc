# Videoconference meeting minutes
## 18/03/2025

SIH updates follow-up

---

> Attending :
>
> - Juliette LUCAS (SFA)
> - Emilie AUGUSTIN (SFA)
> - Ludovic PECQUOT (EIS)
> - Étienne de CHAVAGNAC (EIS)

> Excused :
>
> - Cindy ASSAN (SFA)
> - Benoît LAVENIER (EIS)
> - Dorian MARCO (EIS)

---

## Performed actions since previous meeting

- _**Octopus Fishery**_ logbook (similar to _**Artisanal Fishery**_) template to be shared (SFA)
- _**Vessels already observed**_ list accuracy by selected landing site to be restored (EIS)

---

## Pending actions since previous meeting

- Share whether _**SFA**_ test server is still up and running or not (SFA)
- Share whether there is a test database or if test application is using production database (SFA)
- All logbook templates latest versions to be shared (SFA)
- List of unusable gears in _**SIH**_ to be fulfilled with target species (SFA)
- _**OPRDEB**_ to be activated, settings adjusted and re-tested (EIS)
- _**SFA**_ logo to be updated (EIS)
- _**SFA**_ name to be changed to _**Seychelles Fisheries Authority**_ (EIS)
- Extraction for _**Dropline Fishery**_ logbook to be checked and fixed (EIS)
- Share which fishery uses tuna as bait (SFA)
- _**Packets**_ screen individual measurements to be quoted (EIS)
- Adding vessel search option on _**Occasions**_ screen quick evaluation of work to be done (EIS)
- List of _**P03**_ queries to be merged to be shared (EIS)
- List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)

---

## Provisional delivery schedule

![Delivery schedule](/projects/sfa/crr/sfa-25-003-gantt.svg)

---

## Batch #1 (28/03/2025)

### SIH upgrade from 2.8.12 to 2.9.xx

- Pending issues
  - Database migration evaluation
  - Modal windows to be fixed
  - Specific screens to be evaluated
- Schedule
  - Tests ongoing

---
> Statement :
> - _**SFA**_ test server probably not existing any more

> Actions :
> - Application server (10.9.8.55) specifications to be shared (SFA)
> - Application server ability to run both test and production to be stated (EIS)
> - Database to be duplicated on database server, for test purpose (SFA)
> - Non regression tests to be performed (EIS)

---

### Logbooks modifications

- Created logbooks
  - _**Spanner Crab Fishery**_
  - _**Octopus Fishery**_
  - _**JMA (Joint Management Area)**_

- Commercial / research trip parameter addition to logbooks
    - _**Sea Cucumber Fishery**_
    - _**Dropline Fishery**_
    - _**Lobster Fishery**_
    - _**Artisanal Fishery**_
    - _**Sport Fishery**_

---

- _**Spanner Crab Fishery**_ logbook template

![Spanner Crab logbook](/projects/sfa/crr/sfa-crr-25-003-img-01.png)

> Statements :
> - _**Type of trip**_ parameter is mandatory
>   - No default value
> - _**Spanner Crab Fishery**_
>    - _**Tangle net set (No.)**_ and _**Tangle net haul (No.)**_ are quantities
>    - Three digits maximum (one per cell on paper datasheet)

---

> Actions :
> - All logbook templates latest versions to be shared (SFA)
> - List of all gears in _**SIH**_ to be shared with _**SFA**_ (EIS)
> - List of unusable gears in _**SIH**_ to be fulfilled with target species (SFA)

---

### _**Logbook**_ screen

- Expenses tab creation for logbook programs

> Statement :
> _**Artisanal Fishery**_ uses tuna as bait (SFA)

> Actions :
> - _**Baits**_ tab to be added in _**Expenses**_ tab for all logbooks (EIS)
> - Baits list (common, as much as possible) for all logbooks to be shared (SFA)
> - Gears list (common, as much as possible) for all logbooks to be shared (SFA)

---

### _**OPRDEB**_ program in _**Landed catches**_ and _**Sales**_ screens

- _**Efforts**_ and _**Catches**_ screens

> Statements :
> - Packets functionality will temporarily be enabled in _**Batch #1**_
> - It will be disabled in _**Batch #2**_

> Actions :
> - _**OPRDEB**_ to be activated, settings adjusted and re-tested (EIS)

---

### Miscellaneous

> Actions :
> - _**SFA**_ logo update (EIS)
> - _**SFA**_ name change to _**Seychelles Fisheries Authority**_ (EIS)
> - Extraction for _**Dropline Fishery**_ logbook to be fixed (EIS)
> - Miscellaneous bug fixes according to remaining time (EIS)

---

## Batch #2 (30/04/2025)

#### Adding biological sampling on _**Packets**_ screen

- Purpose
  - Entering biological sampling into packet
- Individual measurements
- Only whole length (for all species) to be measured
- Adding 📊 button just before action button column

> Actions :
> - _**Packets**_ screen individual measurements to be quoted (EIS)

---

### Vessel search option addition to _**Occasions**_ screen

- New feature
- Purpose
  - Facilitate staff to search for a vessel at any landing site
    - Some vessels can often move location
  - Easily locate a vessel whatever its actual location is

> Actions :
> - Adding vessel search option on _**Occasions**_ screen quick evaluation of work to be done (EIS)

---

## Batch #3 (27/06/2025)

- Extraction queries creation :

<span style="font-size:x-large">

| _**Fichier flotte**_              | _**Deducted_Artisanal_Finss**_      |
|:----------------------------------|:------------------------------------|
| _**P03_OBSDEB_CALENDRIER_MAREE**_ | _**P03_OBSDEB_CALENDRIER**_         |
| _**P03_OBSDEB_CAPTURE**_          | _**P03_OBSDEB_CAPTURE_LOT**_        |
| _**P03_OBSDEB_CAPTURE_INDIVIDU**_ | _**P03_OBSDEB_COUT_VARIABLE**_      |
| _**P03_OBSDEB_MAREE**_            | _**P03_OBSDEB_OBSERVATEUR**_        |
| _**P03_OBSDEB_OBSERVATION**_      | _**P03_OBSDEB_OBSERVATION_NAVIRE**_ |
| _**P03_OBSDEB_OPERATION**_        | _**P03_OBSDEB_VENTES**_             |

</span>

---

> Actions :
> - List of _**P03**_ queries to be merged to be shared (EIS)
> - List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)

---

## _**SWIOFish**_ and _**IOTC**_ perspectives

- _**SWIOFish2**_ has resumed in 2024
- No _**SWIOFish3**_ perspective so far
- Upcoming _**IOTC**_ conferences
  - _**Working Party on Data Collection and Statistics**_ (WPDCS)
    - 25/11/2025 to 29/11/2025 
    - China
  - _**Scientific Committee**_ (SC)
    - 01/12/2025 to 05/12/2025
    - China
 
---

## Next meeting

### Tuesday, **April 22<sup>nd</sup>, 2025**

| **Seychelles** | **France** |
|:--------------:|:----------:|
|     14:00      |   11:00    |