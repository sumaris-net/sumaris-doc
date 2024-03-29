# Refonte Allegro 
# (ObsMer / ObsVentes / Calendrier d'activité)

## Déroulement des sprints

- Durée des sprints
  - 3~4 semaines de développement (tickets identifiés dans le sprint à réaliser)
  - Recette ISI en fin de sprint

- Daily quotidien ISI / Sous-Traitance
  - Echange développement / spécification

- Point hebdomadaire – ISI / MAO (Coordinateur : Johann)
  - Bilan développement, remontée des questions

- Réunion de fin de sprints – ISI / MOA (Coordinateurs applicatifs)
  - Présentation des fonctionnalités du sprint (ISI)
  - Présentation des prochains sprints (ISI)
  - Recette à faire des fonctionnalités des sprints livrés (MAO)


## Avantages/Inconvénients d'utiliser un repository commun 


| Avantages                                                   | Inconvénients                                 |
|-------------------------------------------------------------|-----------------------------------------------|
| Maintenabilité du socle, des versions                       | Collaboration des acteurs pour la convergence | 
| Evolutions collaboratives, re-use de fonctionnalités        |                                               | 
| Fonctionnalités cloisonnées pour les programmes de collecte |                                               | 
| Sémantique propre à chaque programme de collecte            |                                               |


## Avantages/Inconvénients d'utiliser un repository Ifremer


| Avantages                               | Inconvénients                             |
|-----------------------------------------|-------------------------------------------|
| Autonomie                               | Couts sur le report d'évolutions du socle | 
| Cloisonnement des évolutions            |                                           | 
| Sémantique commune aux 3 volets Allegro |                                           |


## Matrice de risques sur la refonte Allegro

| Risques                                    | Probabilité | Impact  | Criticité | Actions de mitigation                        |
|--------------------------------------------|-------------|---------|-----------|----------------------------------------------|
| Retard dans la livraison des sprints       | Moyenne     | Moyenne | Moyenne   | - Affecter des ressources supplémentaires    |   
|                                            |             |         |           | - Rajouter des points spécifiques            |
| Montée de version des librairies (Angular) | Élevé       | Élevé   | Élevé     | - Mise en place de tests unitaires           | 
|                                            |             |         |           | - A mettre en place en début de développment | 
| Lenteur de la synchronisation              | Faible      | Élevé   | Haute     | - Cluster PostGres                           |
| Lenteur de chargement des référentiels     | Faible      | Élevé   | Haute     | - Indexation ES                              |
|                                            |             |         |           |                                              |
|                                            |             |         |           |                                              |
| ...                                        | ...         | ...     | ...       | -                                            |
|                                            |             |         |           | - Action 2                                   |
|                                            |             |         |           | - Action 3                                   |

