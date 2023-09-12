

# Architecture générale

- Une application web (ou App) <!-- .element: class="fragment" -->
- Une application serveur (ou Pod) <!-- .element: class="fragment" -->
- Une base de données <!-- .element: class="fragment" -->
- Un serveur de traitement <!-- .element: class="fragment" -->

Note: Le système se découpe en 5 composants techniques principaux :
- Une application web (ou App), hébergée sur un serveur
web frontal (sous Docker), permet l’accès aux interfaces de
saisie et l’administration des référentiels. Elle est développée sur le framework
Angular.
- Une application serveur (ou Pod), qui fournit deux points
d’accès d’API distincte : une API GraphQL pour l'accès aux données (en lecture/écriture, avec contrôle des droits d’accès).
- Une base de données, permettant la bancarisation des
données et des référentiels. Le SGBDR peut-être PostgreSQL, Oracle ou HSQBDB.
- Un serveur de traitement, pour exécuter les tâches
régulières ou plus lourdes : Aggrégation ou dénormalisation des données, sauvegarde de la base,
etc. Le plus souvent, le serveur de traitement est intégré et géré dans le Pod,
mais il peut-être entièrement dissocié.

---
![Architecture diagram](architecture/img/general_architecture.png)
---
## Technologies

- Application **web** (ou App)
  * Angular 14 / Ionic 7 <!-- .element: class="fragment" -->
  * Compatible web et mobile (Progressive Web Application) <!-- .element: class="fragment" --> 

- Application **serveur** (ou Pod)
  * Java / Spring-Boot / Hibernate <!-- .element: class="fragment" -->
  * BDD : PostgreSQL, Oracle ou HSQLDB <!-- .element: class="fragment" -->
  * API d'accès aux données : GraphQL <!-- .element: class="fragment" -->
  * Déploiement : Ansible ou Docker <!-- .element: class="fragment" -->
