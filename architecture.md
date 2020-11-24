 
# App architecture

## Overview

Ionic, Angular, Angular Material, Apollo (graphql)

On Android: Cordova plugins (camera, audio, ...).

## Modules

- Shared
- Core
- Admin
- Referential
- Data
  * Trip
  * ...

## Core module

### Core :: Storage

- Local storage (web browser) or SQLlite (Android)

### Core :: Config

- Load order: pod, local storage, environement (defaults)
- Allow to get: 
  * theme (colors, app logo, partner's logos, background images)
  * App name
  * Software properties (See the pod entity SoftwareProperties)

## Core :: Settings

- User defined, with defaults
- Saved locally

- Allow to store: 
 * user locale
 * usage mode (on field mode, or desktop mode),
 * fields preferences (e.g. Display label+Code, or Label only)
 * ...
 

### Core :: Services

- Base service can be linked each other:
  * Life cycle : start() stop() ready() 


#### Network service

- First service to be started
- Manage network connection and peer changes.
- If no peer found (in local storage or environement) ask user to choose a peer

#### Platform service
- Wait network to be started, then settings, and Cordova plugins

#### Data service

- Query GQL
  * Fragments

- EditorDataService: CRUD for editor
  * load()
  * save()
  * delete()
  * listenChanges()

- TableDataService: CRUD for table
  * watchAll()
  * saveAll()
  * deleteAll()

- Cache

- Model entities
- Entity validators

##### What is GraphQL ?

- Query
- Mutation (update, delete)
- Subscription (listen changes)

##### Model entities

- Simple beans:
  * only attributes
  * BUT with two required functions:
    * fromObject() : parse GraphQL queries result
    * asObject(): convert to objet for GraphQL mutations
- Class inheritance (Entity -> DataEntity -> Trip)
- Interface implementation (IReferentialItem, IWithVesselEntity)

#### Validators

- Check entities content (e.g. min/max, required fields, etc.)
- Used in Reactive forms

## Admin module

- Access to pod managment
  * Users
  * Pod's configuration (see entities: Software & SoftwareProperties)

## Data module

- Utilities for data editor, data table
- Use abstract data model entities (.e.g QualityFlag, RecorderDepartment)

## Business modules (e.g. Trip)

- Final user (business specific) screens
  * Pages,
  * Services
  * Entities
  * Validator

  
  
# Pod architecture

## Overview

Spring Boot, Hibernate/JPA, GraphQL-java

## Maven

- Start pod (-Prun)
- Liquibase diff 

## Database

- HSQLDB (server mode) 
- Oracle (mapping over a SIH-Adagio database)

## Model entities

- JPA entities
- Value Object (VO)

## DAO / Repository

- Interface + Impl
- HQL Query
- JPA Query Builder - toSpecification()
- Cache (Spring Cache)
- Unit Tests

## Service

- Interface + Impl
- Unit Tests

## GraphQL endpoint

- Annotations: declare query/mutation, auth
- Contextual fecth
- Dev tools: GraphiQL
