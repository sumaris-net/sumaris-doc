# Architecture > Noyau logiciel

## Sommaire

* [Introduction](#introduction)
* [Fonctionnalités](#fonctionnalités)
    * [API GraphQL](#api-graphql)
* [Implémentation technique](#implémentation-technique)
  * [Libraries et frameworks](#libraries-et-frameworks)
  * [Composants logiciels](#composants-logiciels)
    * [package `http`](#package-http)
    * [package `service`](#package-service)
    * [package `dao`](#package-dao)
    * [package `model`](#package-model)
    * [package `util`](#package-util)
  * [Sécurité](#sécurité)
  * [Configuration](#configuration)

## Introduction

Le noyau (core) a pour objectif la gestion des entités métier du SI, et leur lecture/écriture depuis/vers une base de données.

## Fonctionnalités

### API GraphQL

Le noyau rend accessible les données via un "endpoint" GraphQL.

Celui-ci répond aux requêtes HTTP (GET ou POST) envoyées au serveur sur le chemin `<SERVER_URL>/api/graphql` (par exemple `http://localhost:8080/api/graphql`).
Ce endpoint est utilisable dans n'importe quel éditeur GraphQL, ou depuis une requête HTTP quelconque.

Le format de la réponse est JSON.

L'authentification au serveur nécessite un header http spécifique.

> Un éditeur GraphiQL est disponible à l'adresse `SERVER_URL/api/graphiql` pour tester le point d'accès.
  

## Implémentation technique

### Libraries et frameworks

Voici les librairies et frameworks utilisés par l'implémentation du noyau logiciel :

- Base de données : Oracle, PostgreSQL ou HsqlDB
- [Spring Boot](https://spring.io/projects/spring-boot) :
  * Pour implémenter les points d'accès HTTP REST (GET ou POST), sous forme de Serlvet JEE;
  * Déployable au sein d'un moteur Apache Tomcat, et/ou d'une autre application web utilisant Spring Boot;
  * La gestion de la sécurité utilise Spring Security, pour contrôler les éventuels droits d'accès par authentificaiton.
- [JPA / Hibernate](https://hibernate.org) : pour le mapping entre les entités (Objet Java) et base de données;
- [Apache Maven](https://maven.apache.org/) :
  * Pour la gestion des dépendances Java, la compilation et livraison du module;
  
### Composants logiciels

Le module est divisé en composants logiciels, illustrés ci-dessous :

![core-components](img/core-components.svg)

#### package `http`

Le package `http` est responsable de répondre aux requêtes HTTP (GET et/ou POST) reçus par le serveur.

Le `GraphQLController` analyse les requêtes GraphQL, et les exécute en délèguant aux services métiers demandés.
Le résultat est retourné par un service métier est converti directement en JSON.

#### package `service`

Le package `service` concentre les fonctions métier, responsable du traitement des données lues ou écrites. 
Cette couche gère également les transactions JDBC et gère les rollback éventuels en cas d'erreur.

Cette couche bénéficie d'un cache applicatif, mis en place si besoin pour optimiser les performances d'accès aux données.

#### package `dao`

Les composants `Repository` définissent les requêtes (JPA ou SQL) d'accès à la base de données.

Chaque `Repository` est généralement lié à une entité métier particulière.

#### package `model`

Ce package permet la définition d'`Entity` qui porte le modèle de la base de données sous-jacente.
Chaque `Entity` représente un concept métier (ex: `Department` réprésente un organisme, `Location` un lieu terrestre ou en mer, etc.).

Les attributs d'une classe `Entity` permette de configurer les colonnes de la table associée, et ses contraintes (no null, etc) 

```java
/**
* Exemple d'entité métier  
**/
@Data
@Entity
@Table(name = "location")
public class Location implements IReferentialEntity<Integer> {

    @Id
    private Integer id;
 
    @Column(nullable = false, length = 50)
    @ToString.Include
    private String label;

    @Column(nullable = false, length = 100)
    private String name;
    
    // ...
}
```


#### package `util`

Un package `util` (non représenté sur l'illustration des composants logiciels) contient des utilitaires, 
pour la manipulation de différents types d'objet Java (`Stream`, `File`, `String`, `Date`, etc.) 

### Sécurité

La gestion des droits d'accès peut se faire au niveau du GraphQLController, grâce à des annotations Java et Spring Security. 
On peut ainsi limiter l'accès, au cas pas cas, par exemple pour autoriser uniquement certains profils d'utilisateur.

### Configuration

Options disponibles pour configurer le noyau : 


| Propriété                         | Description                                                     | Valeur par défaut                          |
|-----------------------------------|-----------------------------------------------------------------|--------------------------------------------|
| `server.url`                      | URL d'accès au serveur                                          | `http://localhost:8080`                    | 
| `spring.datasource.url`           | URL de la BDD (au format JDBC)                                  | `jdbc:postgresql://localhost:5432/sar`     | 
| `spring.liquibase.enabled`        | Activation de la mise à jour du schéma de BDD par Liquibase     | `sar`                                      | 
| `logging.level.org.hibernate.SQL` | Niveau de log des requête SQL (mettre `debug`pour les voir)     | `warn                                      |


**TODO** : à compléter
