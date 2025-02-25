# Videoconference meeting minutes
## 25/02/2025

SIH updates follow-up

---

> Attending :
>
> - Juliette LUCAS (SFA)
> - Cindy ASSAN (SFA)
> - Ludovic PECQUOT (EIS)
> - Étienne de CHAVAGNAC (EIS)

---

> Excused :
>
> - Emilie AUGUSTIN (SFA)
> - Benoît LAVENIER (EIS)
> - Dorian MARCO (EIS)

---

## Performed actions since previous meeting

- _**GMA**_ logbook to be renamed _**JMA**_ (EIS)
- _**JMA**_ logbook specific substrate type list to be shared (SFA)
- _**JMA**_ logbook specific substrate type list to be implemented (EIS)
- _**Spanner Crab Fishery**_ logbook new version to be shared (SFA)
- _**Spanner Crab Fishery**_ bait table to be shared (SFA)
- New optional parameter (commercial / research) to be added (EIS)
- _**P03_OBSDEB_OBSERVATION**_ and _**P03_OBSDEB_OBSERVATION_OBS**_ to be merged (EIS)
- _**SFA**_ database to be copied for test data update (EIS)
- _**SFA**_ new logo (_**SVG**_ (preferred) or _**PNG**_ format) to be shared (SFA)

---

## Pending actions since previous meeting

- _**Octopus Fishery**_ logbook (similar to _**Artisanal Fishery**_) template to be shared (SFA)
- _**OPRDEB**_ to be activated, settings adjusted and re-tested (EIS)
- List of _**P03**_ queries to be merged to be shared (EIS)
- List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)
- Extraction for _**Dropline Fishery**_ logbook to be checked and fixed (EIS)
- Adding vessel search option on _**Occasions**_ screen quick evaluation of work to be done (EIS)
- _**Packets**_ screen individual measurements to be quoted (EIS)
- _**Vessels already observed**_ list accuracy by selected landing site to be restored (EIS)
- Non regression tests to be performed (EIS)
- _**SFA**_ logo to be updated (EIS)
- _**SFA**_ name to be changed to _**Seychelles Fisheries Authority**_ (EIS)

---

## Provisional delivery schedule

![Delivery schedule](/projects/sfa/crr/sfa-25-002-gantt.svg)

---

> Statements :
> - IT person in charge
>   - Jude Gabriel
> - Test on tablets will be performed with browser emulation

> Actions :
> - Share whether _**SFA**_ test server is still up and running or not (SFA)
> - Share whether there is a test database or if test application is using production database (SFA)

---


## Batch #1 (28/03/2025)

### SIH upgrade from 2.8.12 to 2.9.xx

- Pending issues
  - Database migration evaluation
  - Modal windows to be fixed
  - Specific screens to be evaluated
- Schedule
  - Tests ongoing

> Actions :
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

> Actions :
> - _**Octopus Fishery**_ logbook (similar to _**Artisanal Fishery**_) template to be shared (SFA)

---

### _**OPRDEB**_ program in _**Landed catches**_ and _**Sales**_ screens

- _**Efforts**_ and _**Catches**_ screens
  - _**Sampling data**_ and _**Sales**_ OK

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
> - _**Vessels already observed**_ list accuracy by landing site to be restored (EIS)
> - Extraction for _**Dropline Fishery**_ logbook to be fixed (EIS)
> - Miscellaneous bug fixes according to remaining time (EIS)

---

## Batch #2 (30/04/2025)

### _**Trips**_ screen

- Expenses tab creation for logbook programs

> Statements :
> - Bonito and Bonit are the same baits

> Actions :
> - Share which fishery use tuna as bait (SFA)

---

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

| _**Fichier flotte**_                | _**Deducted_Artisanal_Finss**_   |
|:------------------------------------|:---------------------------------|
| _**P03_OBSDEB_CALENDRIER_MAREE**_   | _**P03_OBSDEB_CALENDRIER**_      |
| _**P03_OBSDEB_CAPTURE**_            | _**P03_OBSDEB_CAPTURE_LOT**_     |
| _**P03_OBSDEB_CAPTURE_INDIVIDU**_   | _**P03_OBSDEB_COUT_VARIABLE**_   |
| _**P03_OBSDEB_MAREE**_              | _**P03_OBSDEB_OBSERVATEUR**_     |
| _**P03_OBSDEB_OBSERVATION**_        | _**P03_OBSDEB_OBSERVATION_OBS**_ |
| _**P03_OBSDEB_OBSERVATION_NAVIRE**_ | _**P03_OBSDEB_OPERATION**_       |
| _**P03_OBSDEB_VENTES**_             |                                  |

</span>

---

> Actions :
> - List of _**P03**_ queries to be merged to be shared (EIS)
> - List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)
 
---

## Next meeting

### Tuesday, **March 18<sup>th</sup>, 2025**

| **Seychelles** | **France** |
|:--------------:|:----------:|
|     14:00      |   11:00    |