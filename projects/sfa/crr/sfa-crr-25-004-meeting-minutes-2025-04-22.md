# Videoconference meeting minutes
## 22/04/2025

SIH updates follow-up

---

> Attending :
>
> - Juliette LUCAS (SFA)
> - Emilie AUGUSTIN (SFA)
> - Cindy ASSAN (SFA)
> - Ludovic PECQUOT (EIS)
> - Étienne de CHAVAGNAC (EIS)

> Excused :
>
> - Benoît LAVENIER (EIS)
> - Dorian MARCO (EIS)

---

## Performed actions since previous meeting

- Application server (10.9.8.55) specifications to be shared (SFA)</span>
- Server ability to run both test and production to be stated (EIS)
- Test server VM to be created and set up (SFA)
- Non regression tests to be performed (EIS)
- All logbook templates latest versions to be shared (SFA)
- List of all gears in _**SIH**_ to be shared with _**SFA**_ (EIS)
- List of unusable gears in _**SIH**_ to be fulfilled with target species (SFA)
- _**Baits**_ tab to be added in _**Expenses**_ tab for all logbooks (EIS)
- Baits list for all logbooks to be shared (SFA)
- Gears list for all logbooks to be shared (SFA)
- _**SFA**_ logo to be updated (EIS)
- Extraction for _**Dropline Fishery**_ logbook to be checked and fixed (EIS)
- List of _**P03**_ queries to be merged to be shared (EIS)
- List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)

---

## Pending actions since previous meeting

- **Batch #1**
   - _**SIH**_ application and pod to be installed on test server (VM) (EIS)
   - Database to be duplicated on database server, for test purpose (EIS)
   - _**OPRDEB**_ to be activated, settings adjusted and re-tested (EIS)
   - _**SFA**_ name to be changed to _**Seychelles Fisheries Authority**_ (EIS)
   - Miscellaneous bug fixes according to remaining time (EIS)
- **Batch #2**
   - _**Packets**_ screen individual measurements to be quoted (EIS)
   - Production server VM to be created and set up (SFA)
   - _**SIH**_ application and pod to be installed on production server (VM) (EIS)
   - Adding vessel search option on _**Occasions**_ screen quick evaluation of work to be done (EIS)

---

## Delivery schedule

![Delivery schedule](/projects/sfa/crr/sfa-25-004-gantt.svg)

---

## Batch #1 (~~28/03/2025~~ ➜ 25/04/2025)

### SIH upgrade from 2.8.12 to 2.9.38

- No pending issues
- Regression tests done
- New functionalities validation tests done

---

> Actions :
> - ~~Application server (10.9.8.55) specifications to be shared (SFA)~~
> - ~~Application server ability to run both test and production to be stated (EIS)~~
> - ~~Test server VM to be created and set up (SFA)~~
> - _**SIH**_ application and pod to be installed on test server (VM) (EIS)
> - Database to be duplicated on database server, for test purpose (EIS)
> - ~~Non regression tests to be performed (EIS)~~
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

> Questions :
> - Shall we disable the following gears?
>    - _**GHT - Hoop/tangle net (crustaceans)**_
>       - Used in _**Spanner Crab**_ logbook
>    - _**HGD - Hand gathering skin diving**_
>       - Used in _**Lobster**_ logbook
> - What species to be affected to _**PR - Charter recreational (not specified)**_?

---

> Actions :
> - ~~All logbook templates latest versions to be shared (SFA)~~
> - ~~List of all gears in _**SIH**_ to be shared with _**SFA**_ (EIS)~~
> - ~~List of unusable gears in _**SIH**_ to be fulfilled with target species (SFA)~~

---

### _**Logbook**_ screen

- Expenses tab creation for logbook programs

> Actions :
> - ~~_**Baits**_ tab to be added in _**Expenses**_ tab for all logbooks (EIS)~~
> - ~~Baits list (common, as much as possible) for all logbooks to be shared (SFA)~~
> - ~~Gears list (common, as much as possible) for all logbooks to be shared (SFA)~~

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
> - ~~_**SFA**_ logo to be updated (EIS)~~
> - _**SFA**_ name to be changed to _**Seychelles Fisheries Authority**_ (EIS)
> - ~~Extraction for _**Dropline Fishery**_ logbook to be checked and fixed (EIS)~~
> - Miscellaneous bug fixes according to remaining time (EIS)

---

## Batch #2 (~~30/04/2025~~ ➜ 16/05/2025)

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
> - ~~List of _**P03**_ queries to be merged to be shared (EIS)~~
> - ~~List of _**P03**_ queries to be merged (from _**EIS**_) to be validated (SFA)~~

---

## Next meeting

### Tuesday, **May 20<sup>th</sup>, 2025**

| **Seychelles** | **France** |
|:--------------:|:----------:|
|     14:00      |   11:00    |