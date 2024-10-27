## Suivi des risques

- [Délai livraison de la release 2.9.20](#compte-rendu-réunion---suivi-des-risques-du-29072024)

---

### Compte rendu réunion - suivi des risques du 29/07/2024

**Risque identifié** :

Retard avéré sur la livraison de la release 2.9.20 pour ActiFlot et ObsVentes** (déploiement en préproduction)

**Retard d'une semaine**

- **Causes**
    - Evolutions concurrentes sur le modèle adagio
        - 4.2.7 pour Campagne
        - 4.3.0 pour refonte ActiFlot et ObsVentes
    - Problème de CI pour builder les releases
      - sumaris-pod : OK
      - sumaris-app : Problèmes en cours de résolution

- **Actions engendrées**
    - Application du processus de validation des modifications du modèle Adagio
        - **Rappel** : EIS/ISI garant du modèle
        - Revue des modifications d'Adagio 4.2.7 par EIS
            - Réunions, modifications des développements MCO

- **Impactes sur l'activité d'EIS**
    - **Rappel** : EIS gère les Merge Request et les releases à chaque fin de sprint
    - Réunions avec la MCO Codra
    - Revue et amélioration des solutions misent en place par Codra
    - Problème de CI sur Adagio
        - Corrigé par EIS

- **Impacte sur le déroulement de la refonte**
  - **Niveau : limité**
    - Prochaine démonstration MOA (release 2.9.20) : le 20/08/2024 sur ActiFlot

- **Conclusion**
    - **Impacte limité**
    - Activité de validation indispensable pour garantir la pertinence et la qualité des évolutions du modèle Adagio

---

### Compte rendu réunion - suivi des risques du 25/10/2024

**Risque identifié** :

Retard des dernières release, avant la MEP, du à des absences  : 
- Absence MOE (release 2.9.23) 
- Absence développeurs sur les dernieres releases d'ActiFlot 

**Release 2.9.23**

- Absence 3 semaines MOE Vincent Fachéro - Mission CGFS Leg 2
- Absence 2 semaines Développeur CODRA Morgan Facorat - Congés

Levier :

- Vincent Fachéro à continué le suivi de la release en cours lors de la mission CGFS

**Release 2.9.24**

- Absence de ? semaines Développeur EIS Benoit Lavenier - Congés paternité

Benoit Lavenier est sur la tâche critique de développement de la régionalisation pour ActiFlot.

Benoit Lavenier assure en parallèle les merge request et les livraison des releases.

- Levier
    - Benoit à réalisé 90% de l'implémentation de la régionalisation
    - Ludovic (EIS) prend le relai à partir de la semaine 44 pour remplacer Benoit qui reste en contact
    

--- 
|       Date | Auteur | Sections mises à jour                               |
|-----------:|--------|-----------------------------------------------------|
| 29/07/2024 | VFA    | Ajout risque délai livraison release                |
| 25/10/2024 | VFA    | Ajout risque livraison dernieres releases avant MEP |
