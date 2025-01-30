# Videoconference meeting minutes
## 29/01/2025

SIH updates follow-up

---

> Attending :
>
> - Emilie AUGUSTIN (SFA)
> - Juliette LUCAS (SFA)
> - Cindy ASSAN (SFA)
> - Ludovic PECQUOT (EIS)
> - Dorian MARCO (EIS)
> - Étienne de CHAVAGNAC (EIS)

---

> Excused :
>
> - Benoît LAVENIER (EIS)
> - Claire PIERRE-LOUIS (SFA)

<!--
 - Annisha LESPERANCE (SFA)
-->

---

## Logbook programs

- Logbooks list
  - _**Sea Cucumber Fishery**_
  - _**Dropline Fishery**_
  - _**Lobster Fishery**_
  - _**Artisanal Fishery**_
  - _**Sport Fishery**_
  - _**Spanner Crab Fishery**_ (new)
  - _**Octopus Fishery**_ (new)

---

- _**Operation**_ and _**Catch**_ screens
  - _**Expenses**_
    - Development ongoing
  - _**Sales**_
    - To be discussed with Landing data screen (next slide)
- _**Sampling data**_ and _**Sales**_ screens
  - Programs settings to be done
- _**Commercial trip**_ and _**Research trip**_ identifier to be added

---

> Statements :
> - _**JMA**_ is an additional logbook for _**Sea Cucumber fishery**_
> - Biological sampling performed by an observer (SFA staff)
> - Logbook data and sampling data are two different documents

---

> Actions :
> - _**GMA**_ logbook to be renamed _**JMA**_
> - _**Octopus Fishery**_ logbook similar to _**Artisanal Fishery**_
>   - Template to be shared (SFA)
> - _**Spanner Crab Fishery**_ logbook new version to be shared (SFA)
> - Bait table to be shared (SFA)
> - Activate, adjust settings and re-test _**SIH-OPRDEB**_ (EIS)
> - New optional parameter (commercial / research) to be added (EIS)

---

## Extraction queries creation

- Queries under development :
  - [ ] _**Fichier flotte**_
  - [ ] _**P03_OBSDEB_CALENDRIER_MAREE**_
  - [ ] _**P03_OBSDEB_CALENDRIER**_
  - [ ] _**P03_OBSDEB_CAPTURE**_
  - [ ] _**P03_OBSDEB_CAPTURE_LOT**_
  - [ ] _**P03_OBSDEB_CAPTURE_INDIVIDU**_
  - [ ] _**P03_OBSDEB_COUT_VARIABLE**_
  - [ ] _**P03_OBSDEB_MAREE**_
  - [ ] _**P03_OBSDEB_OBSERVATEUR**_
  - [ ] _**P03_OBSDEB_OBSERVATION**_
  - [ ] _**P03_OBSDEB_OBSERVATION_OBS**_
  - [ ] _**P03_OBSDEB_OBSERVATION_NAVIRE**_
  - [ ] _**P03_OBSDEB_OPERATION**_
  - [ ] _**P03_OBSDEB_VENTES**_
 
---

- Query to be done :
  - [ ] _**Deducted_Artisanal_Finss**_

---

> Actions : 
> - Share a list of queries to be merged (EIS)
> - Validate above list of queries from EIS (SFA)
> - Merge _**P03_OBSDEB_OBSERVATION**_ and _**P03_OBSDEB_OBSERVATION_OBS**_ (EIS)

---

## Extraction logbook

> Actions :
> - Check and fix extraction for _**Dropline Fishery**_ logbook (EIS)

---

## Adding vessel search option on _**Occasion**_ screen

- New feature
- Purpose
  - Facilitate staff to search for a vessel at any landing site
    - Some vessels can often move location
  - Easily locate a vessel whatever its actual location is

> Actions :
> - Quick evaluation of work to be done (EIS)

---

## Adding biological sampling on _**Packet**_ screen

- New feature
  - 📊 button addition to _**Packet**_ screen
- Purpose
  - Entering biological sampling into packet

![Biological sampling button addition](/projects/sfa/crr/sfa-crr-25-001-img-03.png)

---

> Statements :
> - Individual measurements
> - Only whole length (for all species) to be measured
> - Adding 📊 button just before action button column

> Actions :
> - To be quoted (EIS)

---

## _**Vessels already observed**_ list malfunction

- Issue
  - List content seems not to be accurate
    - Always the same, whatever the location
![Vessel list screenshot](/projects/sfa/crr/sfa-crr-25-001-img-01.png)
  - No possibility to select all the items at once

---

> Statements :
> - No need of _**Select all**_ function

> Actions :
> - Restoring list accuracy by selected landing site (EIS)

---

## Former tablet user name remaining

- Issue
  - Former enumerator name remaining on tablet as _**Recorder**_
![Screenshot](/projects/sfa/crr/sfa-crr-25-001-img-02.png)
  - Jëlle Perrine
    - Former user of the tablet (no longer with SFA)
    - Should no longer appear on new entries
  - Graig Barbe
    - Current user of the tablet
    - Should appear as _**Recorder**_ on new entries

---

> Statements :
> - User logged in with wrong account
> - Issue already solved by SFA

---

## SIH upgrade

SIH upgrade from 2.8.12 to 2.9.29

- Pending issues
  - Database migration evaluation
  - Modal windows to be fixed
  - Specific screens to be evaluated
- Schedule
  - Tests to be performed soon

> Actions :
> - SFA database copy for test data update
> - Non regression tests to be performed (EIS)
 
---

## SFA name and logo change

> Actions :
> - SFA new logo to be shared (SFA)
>   - SVG (preferred) or PNG format
> - Logo to be updated (EIS)
> - Name to be changed to _**Seychelles Fisheries Authority**_ (EIS)