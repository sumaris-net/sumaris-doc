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

## Définitions
- Modèle conceptuel / thématique : Conceptes Sémantique (marée, sorties, débarquements, ...)
- Modèle physique : Schéma de BDD (tables, colonnes, vues, ..)
- Socle technique : ensemble de librairies et de composants maison
  - Ensemble de librairies (Angular)
  - Composants maison (authentification, menus, tableaux de saisie, listes déroulantes)
- Code source du logiciel (repository) : Implémentation des fonctionnalités
   - Master : tronc commun
   - Branch/Merge : Code à fusionner 
   - Fork : Bifurcation difficilement fusionnable (nouveau tronc)

---

## Utilisation d'un socle technique

- Partagé avec Quadrige

| Avantages                                                                   | Inconvénients                                                        |
|-----------------------------------------------------------------------------|----------------------------------------------------------------------|
| Maintenabilité du socle (mise à niveau régulière des librairie              | Nécessite une bonne coopération (points réguliers)                   | 
| Meilleur qualité du socle (efforts de tests partagés)                       | Efforts en tests de non-régression (en amont / en aval)              | 
| Évolutions fonctionnelles réutilisables (sous menu, notifications, filtres) | Bénéfice futur difficilement quantifiable (Champs Latitude/Longitude) |
| Veille technologique (CI, retours Zenika)                                   |                                                                      |                                 

---

## Utilisation d'un code source commun ?

Résumé des craintes émit par la MOA lors de la réunion du 21/03/2024 :
- Ajout fonctionnel non utile -> Nouveau délai
- Couplage des déploiements entre les volets thématiques (Exemple : module de synchro Campagne/ObsDev) 
- Nécessité d'une coordination avec des tiers 
- Manque d'autonomie des volets thématiques Ifremer
- Couts et délais comparables à Imagine
- Inquiétude sur la performance des applications (référentiels, synchronisation, ...)

---

**Ajout fonctionnel non utile -> Nouveau délai**

| Avantages                                                                               | Inconvénients                                                                               |
|-----------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Partage des nouvelles fonctionnalités utiles (aucun cout de développement. Ex : ObsMer) | Générateur de bug/régressions applicatifs                                                   | 
| Fiabilisation par un tiers d'une fonctionnalité utilisée (RTP)                          | Une évolution d'un écran doit être optionnelle (cout de développement légèrement supérieur) | 

---

**Couplage des déploiements entre les volets thématiques**
- Possibilité d'avoir des serveurs séparés garantie 
- Amélioration des déploiements avec la CI (docker)
- Responsabilité de l'équipe d'intégration (ISI/RIC)

---

**Nécessité d'une coordination avec des tiers**
- Responsabilité du modèle physique : Ifremer/EIS
- Modèle conceptuel (pas d'évolution, référence modèle Adagio)

---

**Manque d'autonomie des volets thématiques Ifremer**
- Non lié à la refonte 
- Limitation des ETPs (interne, sous traitance)
- Nécessité de prioriser (MOA)
- Nécessité de consultation, choix technique (ISI)

---

**Couts et délais comparables à Imagine**
- Intégration de Sumaris vers Hamonie faite (vues, optimisations ES, ...)
- Prototypage systématique avant développement
- Equipe de sous traitance actuelle formée et accompagnée techniquement (dès le départ)
  - Suivi quotidien/hebdomadaire avec remontées d'alertes
- Retour d'expérience 
  - Performance
  - Ergonomie

---

**Inquiétude sur la performance des applications**
- Amélioration du socle technique (Allegro actuel 2009-2012)
- Imagine : Indexation sur les navires en pré-production
- Réalisation de benchmarks 

---


## Matrice de risques sur la refonte Allegro - V0

| Risques                                   | Probabilité | Impact    | Criticité | Actions de mitigation                                                                                           |
|-------------------------------------------|-------------|-----------|----------|-----------------------------------------------------------------------------------------------------------------|
| Retard dans la livraison des sprints      | Moyenne     | Élevé     | Moyenne  | - Affecter des ressources supplémentaires                                                                       |   
|                                           |             |           |          | - Rajouter des points spécifiques                                                                               |
| Montée de version des librairies (Angular)| Élevé       | Élevé     | Élevé    | - Mise en place de tests unitaires                                                                              | 
|                                           |             |           |          | - A mettre en place en début de développment                                                                    | 
| Lenteur de la synchronisation             | Faible      | Élevé     | Haute    | - Cluster PostGres                                                                                              |
| Lenteur de chargement des référentiels    | Faible      | Élevé     | Haute    | - Indexation ES                                                                                                 |
|                                           |             |           |          |                                                                                                                 |
| Problèmes techniques                      | Élevé       | Élevé     | Élevé    | - Revues de code régulières, tests approfondis, développement incrémental pour identifier les problèmes plus tôt |                                                                     |
| Changements des exigences                 | Élevé       | Élevé     | Élevé    | - Documentation précise des exigences et validation fréquente                                                   |
| Conflits d'équipe                         | Moyenne     | Moyenne   | Moyenne  | - Encourager la communication ouverte et la résolution de conflits                                              |
|                                           |             |           |          |                                                                                                      |

