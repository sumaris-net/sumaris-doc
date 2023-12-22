## Data Model - Collected data
---
### Base classes

![data](model/data/common.svg)

Each collected data has a root entity, linked to a program.

- A root entity can be linked to one fishing vessel (see below: Trip, Landing, ...)
- A root entity has some data quality attributes : 
  * A update date, to identify the exact version;
  * A recorder department and person;
  * A quality flag (e.g. Good, Bad, Out of stats, ...) used to exclude bad data on exports or map products; 

---
### Scientific cruise

![scientific-cruise](model/data/scientific-cruise.svg)

---
### Trip

![trip](model/data/trip.svg)

- Trip: a fishing trip, on a unique vessel.
  * A trip start from a departure location (and date/time) and ends with a return location; 
  * A trip can define one or more physical gears: a gear (e.g. OTB) and its physical features;
  * A trip can have many operations, as children;

- Operation: A unique fishing operation, using a physical gear.
  * A operation can define some features;

---
### Landing

![landing](model/data/landing.svg)

- Observed Location: an observation applied on a landing site (harbour, auction) on a date/time (or period);
  * an observed location can have many landings (one or more by vessel), as children.

- Landing: an observation on a vessel, observed at landing time.
  * A landing can have a parent observed location, as parent;
  * A landing can have many trips, as children;

---
### Activity calendar

![activity-calendar](model/data/activity-calendar.svg)

---
### Fishing Area

![fishing-area](model/data/fishing-area.svg)

---
### Vessel/Gear use features

![vessel-use-features](model/data/vessel-use-features.svg)
![vessel-use-features](model/data/gear-use-features.svg)