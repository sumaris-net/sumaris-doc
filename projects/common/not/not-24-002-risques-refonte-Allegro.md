# Refonte Allegro (ObsMer / ObsVentes / Calendrier d'activité)

## Déroulement des sprints

- Durée des sprints
  - 3~4 semaines de développement (tickets identifiés dans le sprint à réaliser)
  - Recette ISI en fin de sprint

- Daily quotidien ISI / Sous-Traitance
  - Échange développement / spécification

---

- Points hebdomadaires – ISI / MAO (Coordinateur : Johann)
  - Bilan développement, remontée des alertes/questions pour les coordinateurs de la MOA

- Réunion de fin de sprints – ISI / MOA (Coordinateurs applicatifs)
  - Présentation des fonctionnalités du sprint (ISI)
  - Recette à faire des fonctionnalités des sprints livrés (MAO) 
  - Présentation des prochains sprints (ISI)

- Démonstration avec les Coordinateurs/Observateurs/Administrateurs
  - En fonction de l'avancement des fonctionnalités livrées
  - A planifier en avance

---

- **A planifier ** : Mettre en place un comité de coordination en incluant Emilie Le Blond et tous les coordinateurs.

---

**Inquiétudes sur la performance des applications**
- Amélioration du socle technique (Allegro actuel 2009-2012)
- Imagine : Indexation sur les navires en pré-production
- Réalisation de benchmarks

--

**Imagine : Indexation sur les navires en pré-production**

- Tests de performances sur la recherche de navires

| Libellé recherché | Nombre de navires | Réponse (s) sans indexation | Réponse (s) avec indexation | Ratio (%) |
|-------------------|-------------------|-----------------------------|-----------------------------|-----------|
| *pou              | 114               | 9                           | 2                           | 77        |
| *tha              | 225               | 14                          | 1                           | 93        |
| *mou              | 230               | 13                          | 2                           | 84        |
| *vil              | 1912              | 62                          | 8                           | 87        |
| *vi               | 6240              | 169                         | 35                          | 80        |
<!-- .element: class="font-size-small" -->
--

![ui-board-es-benchmark](/projects/common/not/images/vessels_search_benchmark.png)


## Matrice de risques sur la refonte Allegro - V0

| Risques                                   | Probabilité | Impact    | Criticité | Actions de mitigation                         |
|-------------------------------------------|-------------|-----------|-----------|-----------------------------------------------|
| Retard dans la livraison des sprints      | Moyenne     | Élevé     | Moyenne   | - Affecter des ressources supplémentaires     |   
|                                           |             |           |           | - Rajouter des points spécifiques             |
| Montée de version des librairies (Angular)| Élevé       | Élevé     | Élevé     | - Mise en place de tests unitaires            |
|                                           |             |           |           | - A mettre en place en début de développment  | 
<!-- .element: class="font-size-small" -->

---

| Risques                                   | Probabilité | Impact    | Criticité | Actions de mitigation  |
|-------------------------------------------|-------------|-----------|-----------|------------------------|
| Lenteur de la synchronisation             | Faible      | Élevé     | Haute     | - Cluster PostGres     |
| Lenteur de chargement des référentiels    | Faible      | Élevé     | Haute     | - Indexation ES        |
|                                           |             |           |           |                        |
<!-- .element: class="font-size-small" -->

---

| Risques                                   | Probabilité | Impact    | Criticité | Actions de mitigation                                                                                            |
|-------------------------------------------|-------------|-----------|-----------|------------------------------------------------------------------------------------------------------------------|
| Problèmes techniques                      | Élevé       | Élevé     | Élevé     | - Revues de code régulières, tests approfondis, développement incrémental pour identifier les problèmes plus tôt |                                                                     |
| Changements des exigences                 | Élevé       | Élevé     | Élevé     | - Documentation précise des exigences et validation fréquente                                                    |
| Conflits d'équipe                         | Moyenne     | Moyenne   | Moyenne   | - Encourager la communication ouverte et la résolution de conflits                                               |
<!-- .element: class="font-size-small" -->

---