# Restitution des données
## Spécifications (ObsMer)

**REF: `OBSMER/INTERFACE/FORMULAIRES`**
![ui-obsmer-report-activation](/projects/obsmer/spe/images/obsmer-report-activation.svg)

---
L’accès à la fonctionnalité de génération de rapports est disponible depuis la liste des marées via l’icône située en haut à droite de l’écran.
Il est possible de générer les formulaires vierges ou terrain avec données depuis [l'écran des marées](/projects/obsmer/spe/collecte_de_donnees.md#marées) ou depuis la [consultation d'une marée](/projects/obsmer/spe/collecte_de_donnees.md#marée--détails).

---
## Documents fournis

- Exemple de restitution Allegro (pour mémoire): 
  - [Formulaire terrain vierge 2020](/projects/obsmer/doc/obsmer-doc-24-004-Formulaire_terrain_OBSMER_2020.pdf)
  - [Formulaire terrain avec données 2020](/projects/obsmer/doc/obsmer-doc-24-006-Formulaire_validation_OBSMER_2020.pdf)
  
- Exemple de restitution : 
  - [Formulaire terrain vierge 2023](/projects/obsmer/doc/obsmer-doc-24-005-Formulaire_terrain_OBSMER_2023.pdf)  
  - [Formulaire terrain avec données 2023](/projects/obsmer/doc/obsmer-doc-24-008-Formulaire_terrain_remplit_OBSMER_2023.pdf)
  - [Restitution aux professionnels (2020)](/projects/obsmer/doc/obsmer-doc-24-007-Rapport_restitution_pro_OBSMER_2020.pdf)

---
## Questions

- Les options de configuration du formulaire terrain suivantes, doivent-elles être maintenues ? :
    - Afficher les erreurs de saisie des marées et opérations,
    - Afficher les erreurs de saisie des lots,
    - Afficher les erreurs de saisie des prélèvements.

---
## **Paramétrages - Options de programme**

- Il est possible de paramétrer, dans les **options de programme**, un ou plusieurs types de **rapports accessibles** pour un observateur ![Rapports accessibles](/projects/obsmer/spe/images/obsmer-report-activation.svg)
- Il est également possible de définir un **nombre maximal de lignes de marées** au-delà duquel un **avertissement** est affiché lors de la tentative de génération du rapport (prévention des lenteurs de traitement) ![Seuil avertissement](/projects/obsmer/spe/images/obsmer-report-generation-lente.svg)
- Enfin, un **seuil de marées** peut être défini, au-delà duquel **la génération de rapport est refusée** ![Seuil génération refusée](/projects/obsmer/spe/images/obsmer-report-nb-generation.svg)

---
### **Scénario principal**

1. L’observateur demande l’édition d’un rapport.
2. Un sous-menu s’ouvre avec les options suivantes :
    * **"Éditer le rapport…"**
        * **"Types de rapport"**
            * **"Formulaire terrain"** *(vue en arbre)*
			* **"Formulaire terrain avec données"**
            * **"Restitution aux professionnels"**			
3. L’observateur sélectionne une option du sous-menu.
4. En fonction de la sélection effectuée :
    * Si l’observateur **n’a sélectionné aucune marée** dans la liste, il peut éditer un formulaire vierge ou avec données, à condition que le nombre total de marées ne dépasse pas un seuil prédéfini.
    * Si le **seuil est dépassé**, un **message d’alerte** l’informe qu’il doit réduire la sélection.
    * Si l’observateur a **sélectionné une ou plusieurs marées**, l’édition du formulaire portera uniquement sur ces marées.
5. Si l’observateur se trouve sur la **page de détail d’une marée**, il peut également éditer un formulaire vierge ou avec données.
6. Lors de l’édition d’un **formulaire avec données**, un **contrôle de validation** est effectué sur les informations saisies.
7. **En cas d’erreur de saisie**, l’édition du formulaire est bloquée et un **message d’information** informe l’observateur des erreurs à corriger.

---
### **Variante(s) :**

**Variante 4a :** 
### Rapport de restitution aux professionnels  

Contrairement aux formulaires terrain, qui sont en lecture seule, le rapport de restitution aux professionnels est **paramétrable**. L’observateur accède ainsi à un **écran de paramétrage** permettant de :  
- Sélectionner les espèces et métiers à inclure dans le rapport.  
- Ajouter des précisions sur le lieu, le métier et le contexte de la marée.  
- Déclarer les prises accidentelles, ajouter des souvenirs de la marée et insérer des photos.  

### **Écran de paramétrage**  

L’écran est structuré en **trois onglets**, correspondant aux fonctionnalités ci-dessus.
![ui-obsmer-report-restitution-parametrage](/projects/obsmer/spe/images/obsmer-report-restitution-parametrage.svg)

### **Onglet 1 - Sélection des espèces et métiers**  
L’observateur peut configurer les éléments suivants :  
- **Mode d'affichage du rapport** : standard, détaillé ou simplifié.  
- **Métiers échantillonnés** : liste des métiers de la marée sous forme de cases à cocher.  
- **Répartition des poids** : cases à cocher pour les espèces en *Partie Retenue (PR)* et *Partie Non Retenue (PNR)*.  
- **Histogrammes des tailles** : cases à cocher pour sélectionner les espèces concernées.  
- **Seuils de regroupement des espèces en catégorie "Divers"** (en %), définis pour :  
  - *Partie retenue totale*  
  - *Fraction retenue*  
  - *Fraction remise à la mer*
  
![ui-obsmer-report-restitution-parametrage-onglet1](/projects/obsmer/spe/images/obsmer-report-restitution-parametrage-onglet1.svg)

### **Onglet 2 - Précisions sur le lieu, le métier et le contexte**  
L’observateur peut renseigner :  
- Une description du métier observé.  
- La localisation géographique de la marée.
![ui-obsmer-report-restitution-parametrage-onglet2](/projects/obsmer/spe/images/obsmer-report-restitution-parametrage-onglet2.svg)

### **Onglet 3 - Prises accidentelles et souvenirs de la marée**  
Cet onglet permet d’ajouter :  
- Un commentaire sur les prises accidentelles ou exceptionnelles.  
- Un résumé du déroulement de la marée.  
- Jusqu'à **deux photos**.  
![ui-obsmer-report-restitution-parametrage-onglet3](/projects/obsmer/spe/images/obsmer-report-restitution-parametrage-onglet3.svg)
---

## **Contenu des formulaires**

### Informations de la marée  
Les données de marée sont organisées en deux sections :  
- **_Fiche marée_** : regroupe les informations saisies dans les onglets *Général*, *Ventes* et *Commentaire* de la marée.  
- **_Fiche engin physique_** : rassemble les informations issues de l’onglet *Engins physiques*.  

### Informations des opérations  
Les données liées aux opérations sont réparties en deux parties :  
- **_Fiche opération de pêche (1er tableau)_** : contient les informations générales des opérations, à l'exclusion des paramètres.  
- **_Fiche opération de pêche (2e tableau)_** : regroupe les paramètres des opérations ainsi que les modalités de mise en œuvre des engins physiques.  

### Informations des arbres d’échantillonnage  
La saisie des arbres d’échantillonnage est présentée sous forme d’arborescence.  
Elle inclut les dénombrements, les quantifications, les taux d’échantillonnage ainsi que les calculs automatiques associés.  
Chaque arbre d’échantillonnage est divisé en deux parties :  
- **_Partie Retenue (PR)_**  
- **_Partie Non Retenue (PNR)_**  
(sous réserve de l'existence de ces catégories).  

---


## Restitution de la marée (1/2)

- _Qui lance la restitution ?_
   * Observateurs 
     * Par Marée, une fois la validation (de la société) effectuée 
     * Sélection des espèces (pas prioritaire)
   * Superviseurs
- _Pour qui ?_ 
  * À destination des pros
- _Quand ?_ 
  * Observateur : à chaque marée, y compris en mer (mode terrain)
  * Superviseur : à la demande, depuis un poste de travail (mode bureau)

---
## Restitution de la marée (2/2)

- Formats de marée :
  * Observateurs : Visualisation HTML (pour montrer au pro. sur la tablette)
  * Superviseurs : Pouvoir faire des copier/coller HTML en mode bureau
  * Pouvoir partager un rapport via un lien (**non prioritaire**)

---
## Restitution du formulaire

- _Pour qui ?_
    * Observateurs, pour contrôle de la saisie
- _Quand ?_
    * Observateur : à chaque marée, a posteriori de la saisie, depuis un poste de travail (mode bureau)
    * Superviseur : à la demande, depuis un poste de travail (mode bureau)

---
## Sélection des données 

- Pouvoir filtrer par
    * `navires / dates / strate sélectivité`
    * ou `strate sélectivité / navires / dates`
      * + `espèce` (non prioritaire) 

- Pouvoir  
  * Pouvoir regrouper les OPE par dispositif sélectif (pour les chaluts simples notamment).
  * Pouvoir inclure/exclure des OPE
  * Pouvoir inclure/exclure des espèces (**non prioritaire**) 

---
## Contenu de la restitution (1/2)

- Voir les critères de sélection (info navires, dates, etc)
- Voir le tableau des navires

---
## Contenu de la restitution (2/2)
- Graphiques, par espèce :
  * Mensuration sur la capture totale 
    * -> maquette OK
    * RAF: élévation des données, taille limite de débarquement / espèce
  * Comparaison standard/sélectif -> maquette OK
  * `BoxPlot` -> **maquettage en cours**

---
## Test logiciel

 - Pour tester les restitutions :
   * EIS a besoin d'un jeu de données **de référence**
   * Par exemple sur 3 marées
   * Et les graphiques associés

 
---
## Actions

- EIS : valider la faisabilité du BoxPlot
- EIS : valider le cacher des charges "Ex_marée_test_selectivité_APASE_v3" 
- EIS : réalisation l'élévation des données dans l'App

---
## Historique des modifications

|       Date | Section modifiées                                                  |
|-----------:|--------------------------------------------------------------------|
| 25/04/2022 | Création                                                           |
| 09/05/2022 | MAJ suite réunion de suivi                                         |
| 07/06/2022 | Définition des acteurs et besoins. Relecture du cahier des charges |
| 18/10/2022 | Ajour paragraphe "Contenu de la restitution"                       |
