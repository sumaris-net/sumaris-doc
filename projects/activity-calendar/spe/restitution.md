# **Restitution des données**  
## **Spécifications – Calendrier d'activité**  

---

## **Documents fournis**  

Exemples de restitution :  
- [Formulaire terrain vierge](/projects/activity-calendar/doc/Formulaire-terrain-vierge.png)  
- [Formulaire terrain avec données](/projects/activity-calendar/doc/Formulaire-terrain-avec-données.png)  
- [Rapport d'avancement](/projects/activity-calendar/doc/Rapport-avancement.png)  

---

## **Modifications à prendre en compte**  

### **Formulaire terrain avec données**  

![ui-activity-calendar-report](/projects/activity-calendar/doc/screenshots/Capture_rapport_engin_label.png)  

Les spécifications ci-dessous doivent être prises en compte lors de la réalisation du formulaire :  
- **Qualification de l'enquête** : inclure toutes les valeurs, y compris "Non réalisable".  
- **Métier** :  
  - Sur la 1ère ligne, afficher le **label** (`METIER.LABEL`).  
  - Sur la 2ᵉ ligne, afficher le **nom** (`METIER.NAME`).  
  - Si le champ "nom" est trop long, le tronquer et afficher `"..."`.  
- **Observateurs** :  
  - Si plus de **deux observateurs**, afficher le **nom et le prénom** sur une seule ligne.  

### **Rapport d'avancement**  

Ce rapport est utilisé par les **observateurs** et les **superviseurs** pour suivre l’avancement de la saisie des calendriers.  

Les indicateurs suivants doivent être ajoutés au rapport :  
- **Enquête directe ?**  
- **Enquête indirecte ?**  

---

## **Accessibilité depuis l'application**  

### **Génération des rapports (vierge, terrain avec données, avancement)**  

📌 **REF: `ACTIVITY_CALENDAR/INTERFACE/FORMULAIRES`**  

![ui-activity-calendar-report-activation](/projects/activity-calendar/spe/images/activity-calendar-reports-activation.svg)  

L’accès à la fonctionnalité de **génération de rapports** est disponible depuis la **liste des calendriers d'activité**, via l’**icône située en haut à droite de l’écran**.  

Il est possible de générer **les formulaires vierges ou terrain avec données** depuis :  
- [L’écran des calendriers d'activité](/projects/activity-calendar/spe/collecte_de_donnees.md#calendriers-dactivité).  
- La [consultation d'un calendrier d'activité](/projects/activity-calendar/spe/collecte_de_donnees.md#calendrier-dactivité--calendrier).  

⚠️ **Le rapport d'avancement n'est pas disponible** lorsque l’utilisateur se trouve sur la consultation d’un calendrier d’activité.  

---

## **Paramétrages - Options de programme**  

- Il est possible de paramétrer, dans les **options de programme**, un ou plusieurs types de **rapports accessibles** pour un observateur [Rapports accessibles](/projects/activity-calendar/doc/screenshots/reporting/Configuration-TypesOfReports.png).
- Il est également possible de définir un **nombre maximal de lignes de calendriers** au-delà duquel un **avertissement** est affiché lors de la tentative de génération du rapport (prévention des lenteurs de traitement) [Seuil avertissement](/projects/activity-calendar/doc/screenshots/reporting/Configuration-Warn_NbMaxCalendards.png).
- Enfin, un **seuil de calendriers** peut être défini, au-delà duquel **la génération de rapport est refusée** [Seuil génération refusée](/projects/activity-calendar/doc/screenshots/reporting/Configuration-NbMaxCalendards.png).

---

### **Scénario principal**  

1. L’observateur demande l’édition d’un rapport.  
2. Un **sous-menu** s’ouvre avec les options suivantes :  
    - **"Éditer le rapport..."**  
        - **"Types de rapport"**  
            - **"Formulaire vierge"**  
            - **"Formulaire avec données"**  
            - **"Rapport d'avancement"**
3. L’observateur sélectionne une option du sous-menu.  
4. En fonction de la sélection effectuée :  
    - Si l’observateur **n’a sélectionné aucun calendrier** dans la liste, il peut éditer un formulaire vierge ou avec données, **à condition que le nombre total de calendriers ne dépasse pas le seuil prédéfini** [voir Paramétrages].  
    - Si le **seuil est dépassé**, un **message d’alerte** l’informe qu’il doit réduire la sélection.  
    - Si l’observateur a **sélectionné un ou plusieurs calendriers**, l’édition du formulaire portera uniquement sur ces derniers.  
5. Si l’observateur se trouve sur la **page de détail d’un calendrier**, il peut également éditer un formulaire vierge ou avec données, mais **n’a pas accès au rapport d’avancement**.  
6. Lors de l’édition d’un **formulaire avec données**, un **contrôle de validation** est effectué sur les informations saisies.  
7. **En cas d’erreur de saisie**, l’édition du formulaire est bloquée et un **message d’information** informe l’observateur des erreurs à corriger.  

---

## **Points de vigilance**  

📌 **Le rapport doit être consultable par deux prestataires si le navire a changé de prestataire au cours de l'année** (exemple : changement de quartier maritime).  

---