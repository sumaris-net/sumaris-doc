# Architecture > Extraction de données

## Sommaire

* [Introduction](#introduction)
* [Fonctionnalités](#fonctionnalités)
* [Implémentation technique](#implémentation-technique)
  * [XML Query](#xml-query)
  
## Introduction

## Fonctionnalités

## Implémentation technique

### XML Query

Les requetes SQL sont générées à partir de fichiers XML structurés à partir des balises principales suivantes :
- `<queries>` : Un élément racine qui contient une ou plusieurs requêtes.
- `<query>` : Représente une requête individuelle, avec divers attributs pour décrire ses propriétés, tels que le nom, le type de requête, et les informations de la table.
- `<select>` : Utilisé pour sélectionner des colonnes spécifiques à partir des tables de la base de données.
- `<from>` : Spécifie les tables à partir desquelles les données sont extraites, ainsi que les jointures éventuelles.
- `<where>` : Permet de définir des conditions pour filtrer les données extraites.
- `<groupby>` : Utilisé pour grouper les données extraites par une ou plusieurs colonnes.
- `<orderby>` : Permet de trier les données extraites selon une colonne spécifique et la direction (ASC ou DESC).

Une classe Java `XmlQuery` sert à manipuler et traiter les requetes XML, en utilisant la bibliothèque JDOM2 :
- Charger la requête à partir du classpath en utilisant la méthode `setQuery()`.
  ```java 
  XmlQuery xmlQuery = new XmlQuery();
  xmlQuery.setQuery(/*URL query_url*/);
  ```
- Activer/désactiver des parties de la requête en utilisant des attributs "group" dans les balises `<select>` et la méthode `setGroup()`.
  ```java
  xmlQuery.setGroup("myGroup", true);
  ```
- Utiliser des variables dans le fichier de requête XML et les remplacer (bind) à l'aide de la méthode `bind()`.
  ```xml
  <select alias="alias1">&amp;myParameter1</select>
  <select alias="alias2"><![CDATA[&myParameter2]]></select>
  ```
  ```java
  xmlQuery.bind("myParameter1", "value1");
  xmlQuery.bind("myParameter2", "value2");
  ```
- Manipuler ou lire le contenu XML en utilisant la bibliothèque JDOM2.
- Obtenir une requête SQL exécutable en appliquant une transformation XSL sur le contenu XML restant à l'aide de la méthode `getSQLQueryAsString()`.
  ```java 
  String sql = xmlQuery.getSQLQueryAsString();
  ```
  
