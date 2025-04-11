# Bilan Opus Activité - version 2.9

> Rédacteurs :
> - Vincent FACHERO - MOE - (IFREMER IRSI/ISI)

---

## **Dates clés de la MEP d'Opus Activité**

- **14/01/2025** : _Réalisation de la MEP BDD  (Acteur MOE)_
  - changelog 4.3.2 sur SIH2_ADAGIO_DBA
  - vues et triggers sur SUMARIS_MAP
- **20/01/2025** : _Réalisation de la MEP Infra WIZ (Acteurs RIC / MOE)_
  - opus-activite-app, opus-activite-pod
  - Echanges RIC/ISI (Mantis [66569](https://forge.ifremer.fr/mantis/view.php?id=66569), [66570](https://forge.ifremer.fr/mantis/view.php?id=66570))
  - Fiche signalétique : [sih/opus-activite](https://dev-ops.gitlab-pages.ifremer.fr/documentation/service_datasheet/scientific/environment/sih/opus-activite/)
- **23/01/2025** : _Ouverture de l'application aux saisisseurs_

[Planning de développement](/projects/activity-calendar/not/images/refonte-activity-calendar-planning-sprints.svg)

---

## **Tests de l'application avant ouverture**

- Tests en **validation** (avant la MEP)
  - 2 semaines : Recette Outils du SI HARMONIE
- Tests en **exploitation** (avant ouverture)
  - 4 jours : Tests de saisie dans Opus en exploitation

---

### **REX sur les tests en VALIDATION (avant la MEP)**

- Détection de régressions sur ObsDeb (problème de droit)
    - Changelog SFA passé sur la BDD HARMONIE (Erreur de mauvaise condition dans le code)
- Détection d'un problème de connexion concurrente entre IMAGiNE (intranet) / Opus (extranet)
    - Passage d'IMAGiNE en connexion extranet

**Léger retard avéré sur la MEP**

---

### **REX sur les tests en EXPLOITATION (avant ouverture)**

- Problème d'erreur des upgrades des websockets
  - Corrigé au niveau de la configuration du pod [Mantis 66569](https://forge.ifremer.fr/mantis/view.php?id=66569), note 0216247
- Problème de blocage au niveau du WAF
  - Autorisation côté RIC 
- Problème d'indexation ElasticSearch [#915](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/915)
  - Désactivation de l'indexation ES en attendant la résolution (en cours)

**Pas de retard sur l'ouverture**
  
---

### **REX sur l'OUVERTURE aux saisisseurs**

- Problème sur l'importation de la feuille de route (Régression par rapport aux tests) 
  - La mise à jour des 258 calendriers existants sur 2024 à vidé les données saisies dans les tables filles.
    - Récupération des données : Restauration de HARMONIE sur PP_HARMONIE (date de la sauvegarde 23/01/2025 12:00)
    - Réinjection des données (action MOE)
- Non visibilité des caractéristiques de mise en oeuvre des engins saisis dans Allegro
  - Release corrective

**Tickets OTRS sur Allegro dès l'ouverture**

---

### **Suivi des risques sur les développements Opus Activité**

[Rapports des risques Opus](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/common/not/not-24-004-suivi-risques-refonte-Allegro.md)

---

### **REX sur les développements/MEX d'Opus Activité**

| **B's (avantages)**                                          | **C's (inconvénients)**                                                                                                                   |
|--------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| 2ème environnement de pré-production pour jouer la MEP       | Timing d'ouverture aux saisisseurs (pendant le rush à La Réunion). <br> Saisie 2024 déjà débutée dans Allegro. <br> Données non visibles. |
| Pertinence des tests sur les outils du SI HARMONIE           | Disponibilité des ressources RIC / ISI (complexifier la MEP)                                                                              |
| Retard de MEP a permis de corriger les derniers bugs mineurs | Disponibilité du référent technique (Dév.)                                                                                                |
| Pas de bug bloquant rencontré lors des MEPs                  | Manque de communication sur l'arrêt de saisie dans Allegro. <br> Pas de blocage des saisies dans Allegro                                  |
| Forte réactivité pour les releases correctives               |                                                                                                                                           |
| Forte réactivité sur l'assistance au guichet                 |                                                                                                                                           |
<!-- .element: class="font-size-extra-small" -->
---

### **Axes d'amélioration** 

- Améliorer le processus d'application des changelogs [#703](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/703)
  - _Chantier en cours_
- Insister auprès des développeurs / MOE pour une meilleure recette de leurs correctifs
  - _Recette côté Dév._
- Soulager le référent technique (déléguer certaines tâches) 
  - _Renfort +1 ETP_
- Amélioration de la communication aux saisisseurs (anciens outils, formations, manuel, ...)
- Bloquer la saisie des volets Allegro (ObsVentes, ObsMer)
- Prévoir les demandes de MEP côté RIC très en avance
  - _Fiche signalétique, Mantis, Mail assistance_

---

### **Suivi du guichet d'assistance Opus (OTRS) (1/2)**

- Tickets OTRS aboutissant à des [issues](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/mex/v2.9/otrs/otrs-25-001-tickets-2.9.29.x.md#tickets-otrs---bugs) 
- 5 releases correctives
  - Demandes de MEP Assistance (Mantis, Mails) 
  - Réunions MOA   
  - Release en exploitation **2.9.37**
  - 3 bugs restants [#1036](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1036), [#1040](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1040), [#1070](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1070)
    - Prochaine release à livrer ([2.9.38](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/milestones/57#tab-issues))

---

### **Suivi du guichet d'assistance Opus (OTRS) (2/2)**

| **Classification des ticket**                             | **74 tickets traités** |
|-----------------------------------------------------------|------------------------|
| Abscence de données (Import, saisie Allegro)              | 4                      |             
| Bug rapports                                              | 8                      |             
| Problème sur les filtres (navires, ...)                   | 5                      |             
| Navires manquants / droits QIM                            | 8                      |             
| Enrichissement de la régionalisation (données manquantes) | 8                      |             
| Navire sur plusieurs quartiers                            | 2                      |             
| Bugs saisie calendrier (gradients, PMFMs, métiers, ...)   | 8                      |             
| Bugs sauvegarde (décalage horaire)                        | 6                      |
| Problèmes d'utilisation                                   | 10                     |             
| Actions saisisseurs bloquées par le WAF                   | 3                      |             
| Propositions d'amélioration                               | 3                      |             
| Bugs pagination                                           | 4                      |             
| Coupure réseau (maintenance)                              | 2                      |             
| Problèmes connexion lente                                 | 3                      |             
| **Tickets en doublons**                                   | **15**                 | 
<!-- .element: class="font-size-extra-small" -->

---

### **Suivi du guichet d'assistance Opus (OTRS) (2/2)**

![ui-repartition-ticket](/projects/activity-calendar/not/images/otrs-tickets-repartition.svg)

---

### **Opus Activité - Release 2026**

[RoadMap Opus 2025](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/common/not/not-25-001-Opus-Roadmap.md#gestion-des-priorités---planning-2025)





