# General Architecture

- A web application (or App) <!-- .element: class="fragment" -->
- A server application (or Pod) <!-- .element: class="fragment" -->
- A database <!-- .element: class="fragment" -->
- A processing server <!-- .element: class="fragment" -->

Note: The system is divided into 5 main technical components:
- A web application (or App), hosted on a frontend web server (under Docker), allows access to the input interfaces and the administration of repositories. It is developed on the Angular framework.
- A server application (or Pod), which provides two distinct API access points: a GraphQL API for data access (read/write, with access control).
- A database, allowing the banking of data and repositories. The RDBMS can be PostgreSQL, Oracle, or HSQBDB.
- A processing server, to execute regular or heavier tasks: Aggregation or denormalization of data, database backup, etc. Most often, the processing server is integrated and managed in the Pod, but it can be entirely dissociated.

---
![Architecture diagram](architecture/img/general_architecture.png)
---

## Technologies

- **Web** application (or App)
    * Angular 14 / Ionic 7 <!-- .element: class="fragment" -->
    * Web and mobile compatible (Progressive Web Application) <!-- .element: class="fragment" -->

- **Server** application (or Pod)
    * Java / Spring-Boot / Hibernate <!-- .element: class="fragment" -->
    * DB: PostgreSQL, Oracle or HSQLDB <!-- .element: class="fragment" -->
    * Data access API: GraphQL <!-- .element: class="fragment" -->
    * Deployment: Ansible or Docker <!-- .element: class="fragment" -->
