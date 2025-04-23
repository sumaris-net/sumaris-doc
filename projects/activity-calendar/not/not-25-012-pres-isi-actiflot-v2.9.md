# Présentation  Opus Activité <br> (Refonte Allegro)

> Rédacteurs :
> - Vincent FACHERO - MOE - (IFREMER IRSI/ISI)

---

## Périmètre/Planning de la refonte Allegro

- **Allegro Calendrier d'activité**
- **Allegro ObsVentes**
- **Allegro ObsMer**

| **Volets**                                     | **Priorité** | **Avancement** | **Périmètre**                                             | **Livraison validation** | **MEP**       | **Ouverture saisie** |
|------------------------------------------------|--------------|----------------|-----------------------------------------------------------|--------------------------|---------------|----------------------|
| <span style="color:green">Calendrier V1</span> | <span style="color:green">-</span>            | <span style="color:green">100%</span>           | <span style="color:green">Iso fonctionnel</span>          | <span style="color:green">octobre 2024</span>             | <span style="color:green">décembre 2024</span> | <span style="color:green">janvier 2025</span>         |
| ObsVentes V1                                   | P1/P2        | _70%_          | Iso fonctionnel <br> Hors PSION <br> Hors saisisseurs MED | juillet 2025             | octobre 2025  | novembre 2025        |
| ObsMer V1                                      | P2/P1        | _80%_          | Iso fonctionnel                                           | octobre 2025             | décembre 2025 | janvier 2026         |
| Batchs                                         | P1           | 10%            | Import des calendriers, ObsVentes WAO, ...                | juin 2025                |               |
| Calendrier V1.1                                | P3           | 0%             | Améliorations identifiées                                 | Septembre 2025           | novembre 2025 | décembre 2025        |
<!-- .element: class="font-size-extra-small" -->

---

## Nouveautés de la refonte Allegro

- **Socle SUMARiS (IMAGiNE, Quadrige) - Développé par EIS**

|                                       | **Allegro - Actuel (client lourd)**                             | **Opus (SUMARiS) - Refonte (client léger)**                                                                                                 |         
|---------------------------------------|-----------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Socle**                             | Modèle conceptuel de données                                    | Évolutions fonctionnelles réutilisables (sous menus, notifications, filtres). Ex : ObsMer, adaptabilité aux volets                          |
| **Installation, gestion de version**  | Sur chaque poste utilisateur                                    | MEP assistance                                                                                                                              | 
| **Accessibilité**                     | Restreint aux machines sur lesquelles le logiciel est installé  | Accessible depuis n'importe quel appareil. <br>Fonctionne en client lourd également (PC, tablette, smartphone)                              | 
| **Réseau**                            | Mode connecté - synchronisation<br>Fonctionne en mode déconnecté<br> | V1 : ActiFlot / ObsVentes mode connecté, ObsMer mode connecté/déconnecté                                                                    |
| **Sécurité**                          | Gérée sur chaque poste (plus vulnérable)                        | Gérée côté serveur (Infra RIC Ifremer) <br> Autorisation des actions dans le WAF                                                           |
| **Performance**                       | Dépend du poste local (recommandation)                          | Dépend du serveur (Infra RIC Ifremer), Dépend du réseau (clé 3G/4G dans les DOM) <br> Indexation ES pour optimiser les recherches (Navires) |

<!-- .element: class="font-size-extra-small" -->

---

## Architecture d'Opus

- Fiche signalétique : [sih/opus-activite](https://dev-ops.gitlab-pages.ifremer.fr/documentation/service_datasheet/scientific/environment/sih/opus-activite/)

---

## **Développements : Méthode AGILE**

- [Planning de développement](/projects/activity-calendar/not/images/refonte-activity-calendar-planning-sprints.svg)
- Suivi du projet sous gitlab : [sumaris-doc](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/index.md) 

---

## **Complexité de la refonte**

- Thématique/Protocole de collecte de données halieutique (en mer, en criée, dans les campagnes)
  - Différentes selon les façades (MED, DOM)
- Modèle conceptuel de données (Allegro)
  - ADAGIO (référentiel thématique), SUMARIS_MAP (surcouche applicative)
- Développement : Solution EIS (app et pod) complexe à appréhender

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

### **Démonstration**

- [Opus Activité - validation](https://opus-obsventes.isival.ifremer.fr/)
- [Saisie d'un calendrier](https://opus-activite.isival.ifremer.fr/activity-calendar/3345626) 

---

### **Suivi du guichet d'assistance Opus (OTRS)**

- 74 Tickets OTRS (certains aboutissant à des [issues](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/mex/v2.9/otrs/otrs-25-001-tickets-2.9.29.x.md#tickets-otrs---bugs))
- 5 releases correctives
  - Demandes de MEP Assistance (Mantis, Mails), réunions MOA
- Release en exploitation **2.9.37**
- 3 bugs mineurs restants [#1036](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1036), [#1040](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1040), [#1070](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/1070)
  - Prochaine release à livrer ([2.9.38](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/milestones/57#tab-issues))

---

### **Retours utilisateurs**

[Bilan enquête de satisfaction](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/doc/Bilan_satisfaction_utilisateurs_2025_OPUS.pptx)

---

### **Opus Activité - Release 2026**

[RoadMap Opus 2025](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/common/not/not-25-001-Opus-Roadmap.md#gestion-des-priorités---planning-2025)





