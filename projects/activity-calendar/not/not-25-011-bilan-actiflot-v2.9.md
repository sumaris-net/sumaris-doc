# Bilan Opus Activité - version 2.9

> Rédacteurs :
> - Vincent FACHERO - MOE - (IFREMER IRSI/ISI)

---

## **Dates clés de la MEP d'Opus Activité**

[Planning de développement](/projects/activity-calendar/not/images/refonte-activity-calendar-planning-sprints.svg)

- **14/01/2025** : MEP BDD réalisée (Acteur MOE)
  - changelog 4.3.2 sur SIH2_ADAGIO_DBA
  - vues et triggers sur SUMARIS_MAP
- **20/01/2025** MEP Infra WIZ réalisée (Acteurs RIC / MOE)
  - opus-activite-app, opus-activite-pod
  - Echanges RIC/ISI (Mantis [66569](https://forge.ifremer.fr/mantis/view.php?id=66569), [66570](https://forge.ifremer.fr/mantis/view.php?id=66570))
  - Fiche signalétique : [sih/opus-activite](https://dev-ops.gitlab-pages.ifremer.fr/documentation/service_datasheet/scientific/environment/sih/opus-activite/)
- **23/01/2025** : Ouverture de l'application aux saisisseurs

---

## **Planning des tests de l'application avant ouverture**

- Tests en validation (avant la MEP)
  - 2 semaines : Recette Outils du SI HARMONIE
- Tests en exploitation (avant ouverture)
  - 4 jours : Tests de saisie dans Opus en exploitation

---

### **REX sur les tests en validation (avant la MEP)**

- Détection de regressions sur ObsDeb (problème de droit)
    - Changelog SFA passé sur la BDD HARMONIE (Erreur de mauvaise condition dans le code)
- Détection de problème concurrent de connexion IMAGiNE (intranet) / Opus (extranet)
    - Passage d'IMAGiNE en connexion extranet

**Léger retard avéré sur la MEP**

---

### **REX sur les tests en exploitation (avant ouverture)**

- Problème d'erreur des upgrade des websockets
  - Corrigé au niveau de la configuration du pod [Mantis 66569](https://forge.ifremer.fr/mantis/view.php?id=66569), note 0216247
- Problème de blocage au niveau du WAF
  - Autorisation côté RIC 
- Problème d'indexation ElasticSearch [#915](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/915)
  - Désactivation de l'indexation ES en attendant la résolution

**Pas de retard sur l'ouverture**
  
---

### **REX sur l'ouverture aux saisisseurs**

- Problème sur l'importation de la feuille de route (Régression par rapport aux tests) 
  - La mise à jour des 258 calendriers existants sur 2024 à vidée les données saisie dans les tables filles.
    - Récupération des données : Restauration de HARMONIE sur PP_HARMONIE (date de la sauvegarde 23/01/2025 12:00)
    - Réinjection des données (action MOE)
- Non visibilité des caractéristiques de mise en oeuvre des engins saisis dans Allegro
  - Release corrective

**Tickets OTRS sur Allegro dès l'ouverture**

---

### **Suivi des risques sur les développements Opus Activité**

[Suivi des risques Opus](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/common/not/not-24-004-suivi-risques-refonte-Allegro.md)

---

### **REX sur les développements/MEX d'Opus Activité**

| **B's**                                            | **C's**                                                                                  |
|----------------------------------------------------|------------------------------------------------------------------------------------------|
| 2ème environnement de production pour jouer la MEP | Timing d'ouverture aux saisisseurs (pendant le rush à La Réunion)                        |
| Pertinence des tests sur les outils du SI HARMONIE | Retard sur les derniers bugs à corriger (retard MEP)                                     |
| Pas de bug bloquant rencontrer lors des MEPs       | Disponiblité des ressources RIC / ISI (retard MEP)                                       |
| Forte réactivité pour les release correctives      | Manque de communication sur l'arrêt de saisi dans Allegro <br> Pas de blocage des saisis |
| Forte réactivité sur l'assistance au guichet       |                                                                                          |
<!-- .element: class="font-size-small" -->
---

### **Axes d'amélioration** 

- Améliorer le processus d'application des changelogs [#703](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/703)
  - Chantier en cours
- Prévoir les demandes de MEP côté RIC très en avance
  - Fiche signalétique, Mantis, Mail assistance
- Insister auprès des développeurs / MOE pour une meilleure recette de leur correctif
- Amélioration de la communication aux saisisseurs (ancien outil, formation, ...)
- Brider les volets Allegro (ObsVentes, ObsMer)

---

### **Suivi du guichet d'assistance Opus (OTRS) (1/2)**

- Tickets OTRS aboutissant à des [issues](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/mex/v2.9/otrs/otrs-25-001-tickets-2.9.29.x.md#tickets-otrs---bugs) 
- 5 releases correctives
  - Demandes de MEP Assistance (Mantis, Mails) 
  - Réunions MOA   
  - Dernière release 2.9.37
  - 3 bugs restants [#1036](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1036), [#1040](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1040), [#1070](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1070)$
    - Release à livrer (2.9.38)

---

### **Suivi du guichet d'assistance Opus (OTRS) (2/2)**

| **Classification des ticket**                             | **74 tickets traités** |
|-----------------------------------------------------------|------------------------|
| Perte de données (Import, saisie Allegro)                 | 4                      |             
| Bug rapports                                              | 8                      |             
| Problème sur les filtres (navires, ...)                   | 5                      |             
| Navires manquants / droits QIM                            | 6                      |             
| Enrichissement de la régionalisation (données manquantes) | 8                      |             
| Bateau sur plusieurs quartiers                            | 2                      |             
| Bug saisie calendrier (gradients, PMFMs, métiers, ...)    | 8                      |             
| Bug sauvegarde (décalage horaire)                         | 6                      |             
| Pas de bateau (droits manquants)                          | 2                      |             
| Problème d'utilisation                                    | 10                     |             
| Actions bloquées par le WAF                               | 3                      |             
| Propositions d'amélioration                               | 3                      |             
| Bug pagination                                            | 4                      |             
| Coupure réseau                                            | 2                      |             
| Problème connexion lente                                  | 3                      |             
| **Tickets doublons**                                      | **15**                 | 
<!-- .element: class="font-size-extra-small" -->

---

### **Suivi du guichet d'assistance Opus (OTRS) (2/2)**

![ui-repartition-ticket](/projects/activity-calendar/not/images/otrs-tickets-repartition.svg)

---

### **Opus Activité - Release 2026**

[RoadMap Opus 2025](/projects/common/not/not-25-001-Opus-Roadmap.md#gestion-des-priorités---planning-2025)





