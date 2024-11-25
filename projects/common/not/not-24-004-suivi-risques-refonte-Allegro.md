## Suivi des risques

- [Délai livraison de la release 2.9.20](#compte-rendu-réunion---suivi-des-risques-du-29072024)

---

### Compte rendu réunion - suivi des risques du 29/07/2024

**Risque identifié** :

Retard avéré sur la livraison de la release 2.9.20 pour ActiFlot et ObsVentes (déploiement en préproduction)

**Retard d'une semaine**

- **Causes**
    - Evolutions concurrentes sur le modèle adagio
        - 4.2.7 pour Campagne
        - 4.3.0 pour refonte ActiFlot et ObsVentes
    - Problème de CI pour builder les releases
      - sumaris-pod : OK
      - sumaris-app : Problèmes en cours de résolution
      - Beaucoup d'évolutions donc beaucoup de merge request à valider

- **Actions engendrées**
    - Application du processus de validation des modifications du modèle Adagio
        - **Rappel** : EIS/ISI garant du modèle
        - Revue des modifications d'Adagio 4.2.7 par EIS
            - Réunions, modifications des développements MCO
    - Focalisation d'EIS sur les Merge request 

- **Impactes sur l'activité d'EIS**
    - **Rappel** : EIS gère les Merge Request et les releases à chaque fin de sprint
    - Réunions avec la MCO Codra
    - Revue et amélioration des solutions misent en place par Codra
    - Problème de CI sur Adagio
        - Corrigé par EIS

- **Impacte sur le déroulement de la refonte**
  - **Niveau : moyen**
    - Retard récurrent sur les merge request de chaque release
    - Prochaine démonstration MOA (release 2.9.20) : le 20/08/2024 sur ActiFlot

- **Conclusion**
    - **Impacte moyenne**
      - Activité de validation indispensable pour garantir la pertinence et la qualité des évolutions du modèle Adagio
      - Temps de validation des merge request indispensable pour garantir la qualité des développements
      - **ObsMer/ObsVentes** : Proposition de renfort CODRA avec un expert++ pour soulager EIS

---

### Compte rendu réunion - suivi des risques du 25/10/2024

**Risque identifié** :

Retard des dernières release, avant la MEP, du à des absences  : 
- Absence MOE (release 2.9.23) 
- Absence développeurs sur les dernieres releases d'ActiFlot 

**Impacte sur la release 2.9.23**

- Absence 3 semaines MOE Vincent Fachéro - Mission CGFS Leg 2
- Absence 2 semaines Développeur CODRA Morgan Facorat - Congés

Leviers :

- Vincent Fachéro à continué le suivi de la release en cours lors de la mission CGFS
- Jean-Victor Famy (CODRA) à prit le relai sur ActiFlot

**Impacte sur la release 2.9.24**

- Absence de 1 semaine, Développeur EIS Benoit Lavenier - Congés paternité

Benoit Lavenier est sur la tâche critique de développement de la régionalisation pour ActiFlot.

Benoit Lavenier assure en parallèle les merge request et les livraison des releases.

- Leviers
    - Benoit à réalisé 90% de l'implémentation de la régionalisation
    - Ludovic PECQUOT (EIS) prend le relai à partir de la semaine 44 pour remplacer Benoit qui reste en contact

- **Conclusion**
    - **Impacte faible**
      - Aucune incidence sur le planning : Régionalisation finalisée dans les temps.

--- 

**Complexité de la MEP**

**Causes** :
- Mise à jour de schémas BDD (ADAGIO et MAP)
- Changelog et scripts SQL à jouer

**Actions engendrées** :
- Disposer d’une instance BDD pour s’entrainer pour la MEP
- Possiblité de rejouer la MEP en préproduction

**Impactes sur le refonte** : Niveau faible

---

### Compte rendu réunion - suivi des risques du 22/11/2024

**Risque identifié** :

Flou récurrent sur les choix d'implémentation des fonctionnalités lors des réunions MOA : 
- Beaucoup de propositions sont faites et validées par la MOA mais aucune n'est vraiment arrêtée

**Impacte sur les développements et spécifications**

- Difficulté pour la MOE et les développeurs pour matérialiser les choix retenus

Leviers :

- Choisir une implémentation pendant la réunion 
- Prendre un moment en fin de réunion pour retranscrire par écrits le ou les choix retenus (sumaris-doc) 

- **Conclusion**
    - **Impacte faible**

---

|       Date | Auteur | Sections mises à jour                               |
|-----------:|--------|-----------------------------------------------------|
| 29/07/2024 | VFA    | Ajout risque délai livraison release                |
| 25/10/2024 | VFA    | Ajout risque livraison dernieres releases avant MEP |
