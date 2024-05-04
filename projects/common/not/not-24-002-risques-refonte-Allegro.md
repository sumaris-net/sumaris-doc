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

- **A planifier** : Mettre en place un comité de coordination en incluant Emilie Le Blond et tous les coordinateurs.

---

**Inquiétudes sur la performance des applications**
- Amélioration du socle technique (Allegro actuel 2009-2012)
- Imagine : Indexation sur les navires en pré-production
- Réalisation de benchmarks

---

**Imagine : Indexation sur les navires en pré-production**

- Tests de performances sur la recherche de navires

| Libellé recherché | Nombre de navires | Réponse (s) sans indexation | Réponse (s) avec indexation | Ratio (%) |
|-------------------|-------------------|-----------------------------|-----------------------------|-----------|
| *pou              | 114               | 9                           | 1                           | 88        |
| *tha              | 225               | 14                          | 1                           | 93        |
| *mou              | 230               | 13                          | 1                           | 92        |
| *vil              | 1912              | 62                          | 1                           | 98        |
| *vi               | 6240              | 169                         | 1                           | 99.4      |
<!-- .element: class="font-size-small" -->

---

<div style="height:300px">
    <canvas data-chart="line" >
        <!--
        {
         "options": {
                "plugins": {
                    "title": {
                      "display": true,
                      "text": "Vessel Indexation"
                    }
                },
                "scales": {
                    "y": { 
                      "title": {
                        "stacked": false,
                        "color": "green",
                        "display": true,
                        "text": "Time (s)"
                        }
                    },
                    "x": { 
                      "title": {
                        "color": "green",
                        "display": true,
                        "text": "Vessel count"
                        }
                    }
                }
        },
         "data": {
            "labels": [114,225,230,1912,6240],
            "datasets":[
             {
				"data":[9,14,13,62,169],
				"label":"Without ES indexation","backgroundColor":"rgba(20,220,220,.8)"
             },
             {
				"data":[1,1,1,1,1],
				"label":"ES indexation","backgroundColor":"rgba(220,120,120,.8)"
             }
            ]
         }
        }
        -->
    </canvas>
</div>

---

## **Matrice de risques sur la refonte Allegro**

| **Risques - TECHNIQUE**                                   | Probabilité | Impact  | Criticité | Actions de mitigation                                                     |
|-----------------------------------------------------------|-------------|---------|-----------|---------------------------------------------------------------------------|
| Montée de version des librairies (Angular)                | Élevé       | Élevé   | Élevé     | - Mise en place de tests unitaires                                        |
|                                                           |             |         |           | - A mettre en place en début de développement                             | 
| Problèmes techniques                                      | Élevé       | Élevé   | Élevé     | - Revues de code régulières, tests approfondis, développement incrémental |                                                                     |
| Régression des applicatifs sur les évolutions des schémas | Élevé       | Élevé   | Élevé     | - Mise en place d'un circuit de validation (MOE)                          |
<!-- .element: class="font-size-extra-small" -->

---

| **Risques - PERFORMANCE**              | Probabilité | Impact    | Criticité | Actions de mitigation  |
|----------------------------------------|-------------|-----------|-----------|------------------------|
| Lenteur de la synchronisation          | Moyenne     | Élevé     | Haute     | - Cluster PostGres     |
| Lenteur de chargement des référentiels | Moyenne     | Élevé     | Haute     | - Indexation ES        |
<!-- .element: class="font-size-small" -->

---

| **Risques - RESSOURCES**                | Probabilité | Impact    | Criticité     | Actions de mitigation                                              |
|-----------------------------------------|-------------|-----------|---------------|--------------------------------------------------------------------|
| Compétence de l'équipe de développement | Moyenne     | Élevé     | Élevé         | - Former, accompagner, référent technique                          |
| Disponibilité des ressources (MOE)      | Elevé       | Moyenne   | Moyenne       | - Arbitrer les priorités                                           | 
|                                         |             |           |               | - Augmenter le temps alloué à la refonte (+10%)                    |
| Changements des exigences               | Élevé       | Élevé     | Élevé         | - Documentation précise des exigences et validation fréquente      |
| Conflits d'équipe                       | Faible      | Moyenne   | Moyenne       | - Encourager la communication ouverte et la résolution de conflits |
<!-- .element: class="font-size-extra-small" -->

---


| **Risques - DELAIS**                  | Probabilité | Impact | Criticité | Actions de mitigation                                                                   |
|---------------------------------------|-------------|--------|-----------|-----------------------------------------------------------------------------------------|
| Retard dans la livraison des releases | Moyenne     | Élevé  | Elevé     | - Affecter des ressources supplémentaires                                               |   
|                                       |             |        |           | - Rajouter des points spécifiques                                                       |
| Retard dans la recette                | Moyenne     | Élevé  | Elevé     | - Affecter des ressources supplémentaires                                               |   
|                                       |             |        |           | - Planifier/Organiser la recette                                                        | 
| Retard dans la mise en exploitation   | Moyenne     | Élevé  | Elevé     | - Mise en pré-production à chaque release                                               |
|                                       |             |        |           | - Mettre à jour les MEX, industrialiser les mises à jour des schémas BDD (liquide base) |
<!-- .element: class="font-size-extra-small" -->

---

## **Points de vigilance**

- Equipe de développement 
  - EIS, éviter le goulot d'étranglement : revue de code, merge des branches, production des releases
  - Exigences technique fortes d'EIS
  
```
Gestion MOE, Renfort d'un expert technique si besoin
```

- Déploiement des releases en pré production
  - Evolution des schémas BDD : détection, analyse impacte 

```
Circuit de validation MOE
```

---

- Coordination de la recette
  - Rédaction des tests : charge de travail non négigeable
  - Déroulement de la recette MOE/MOA

```
Coordination MOA, Renfort MOE (+1 ETP, ETP à 100% si besoin)
```