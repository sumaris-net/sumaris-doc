# Restitution des données
## Spécifications (Calendrier d'activité)

---
## Documents fournis

Exemple de restitution :
- [Formulaire terrain vierge](/projects/activity-calendar/doc/Formulaire-terrain-vierge.png)
- [Formulaire terrain avec données](/projects/activity-calendar/doc/Formulaire-terrain-avec-données.png)
- [Rapport d'avancement](/projects/activity-calendar/doc/Rapport-avancement.png)

---
## Formulaire terrain avec données

![ui-activity-calendar-report](/projects/activity-calendar/doc/screenshots/Capture_rapport_engin_label.png)

- Qualification de l'enquête : mettre toutes les valeurs y comprit "Non réalisable"
- Métier : sur la 1ère ligne, afficher le label (METIER.LABEL) et sur une seconde ligne afficher le nom (METIER.NAME). Si le champ nom est trop long, le tronquer et afficher "..."
- Observateur : si plus de 2 observateurs, mettre le nom et le prénom sur la même ligne

--- 

## Rapport d'avancement

Rapport utilisé par les observateurs et les superviseurs pour suivre l'avancement de la saisie des calendriers

Modifications à apporter :
 * Ajouter les indicateurs :
   * Objectif d'enquête directe ?
   * Enquête éco ?

---

## Accessibilité depuis l'application des rapports (vierge, terrain avec données, avancement)

**REF: ACTIVITY_CALENDAR/INTERFACE/FORMULAIRES**

![ui-activity-calendar-report-activation](/projects/activity-calendar/spe/images/activity-calendar-reports-activation.svg)

### Génération des rapports

Il est possible de générer les formulaires vierges ou terrain avec données depuis [l'écran des calendriers](/projects/activity-calendar/spe/collecte_de_donnees.md#calendriers-dactivité) ou depuis la [consultation d'un calendrier](/projects/activity-calendar/spe/collecte_de_donnees.md##calendrier-dactivité--général).

Par défaut la génération des formulaires est active. Depuis l'écran de la liste des calendriers, il est possible de bloquer cette génération ou d'avertir le saisisseur si trop de calendriers vont constituer les rapports :
- Une limite du nombre de calendrier est paramétrable, avec un blocage de la génération en avertissant le saisisseur si cette limite est atteinte.
- Une limite du nombre de calendrier, est paramétrable, avec un simple avertissement sur le temps de génération pouvant être long si cette limite est atteinte.

Ces 2 options sont distinctes et cumulables.

> Points de vigilance :
> - Le rapport doit être consultable par 2 prestataires si le navire a changé de prestataires au cours de l'année (cas d'un chagement de quartier maritime par exemple)