# Restitution des données
## Spécifications (ObsVente)

**REF: `OBSVENTE/INTERFACE/FORMULAIRES`**

![ui-obsventes-report-activation](/projects/obsvente/spe/images/obsventes-report-activation.svg)

---
L’accès à la fonctionnalité de génération de rapports est disponible depuis la liste des sorties via l’icône située en haut à droite de l’écran.
Il est possible de générer les formulaires vierges ou terrain avec données depuis [l'écran des sorties](/projects/obsvente/spe/collecte_de_donnees.md#sorties) ou depuis la [consultation d'une sortie](/projects/obsvente/spe/collecte_de_donnees.md#sortie--détails).

---

## Documents fournis

- Exemple de restitution :
    - [Formulaire terrain vierge (métropole)](/projects/obsvente/doc/obsventes-doc-24-001-Formulaire_terrain_OBSVENTES.pdf)
    - [Formulaire terrain vierge (Outre-mer)](/projects/obsvente/doc/obsventes-doc-24-009-formulaire_outre-mer.pdf)
    - [Formulaire avec données (arbre)](/projects/obsvente/doc/obsventes-doc-24-005-Formulaire_terrain_v1-valide_arbre.pdf)

---

## Questions

- Les observateurs présents sur un même bateau sont-ils toujours de la même société (il n'y a qu'un seul champ de saisie pour la société) ?

- Les options de configuration du formulaire terrain suivantes, doivent-elles être maintenues ? :
    - Afficher les erreurs de saisie des ventes,
    - Afficher les erreurs de saisie des lots,
    - Afficher les erreurs de saisie des prélèvements.

---
## **Paramétrages - Options de programme**

- Il est possible de paramétrer, dans les **options de programme**, un ou plusieurs types de **rapports accessibles** pour un observateur ![Rapports accessibles](/projects/obsvente/spe/images/obsventes-reports-params.svg)
- Il est également possible de définir un **nombre maximal de lignes de calendriers** au-delà duquel un **avertissement** est affiché lors de la tentative de génération du rapport (prévention des lenteurs de traitement) ![Seuil avertissement](/projects/obsvente/spe/images/obsventes-report-generation-lente.svg)
- Enfin, un **seuil de calendriers** peut être défini, au-delà duquel **la génération de rapport est refusée** ![Seuil génération refusée](/projects/obsvente/spe/images/obsventes-report-nb-generation.svg)

---
### **Scénario principal**

1. L’observateur demande l’édition d’un rapport.
2. Un sous-menu s’ouvre avec les options suivantes :
    * **"Éditer le rapport…"**
        * **"Types de rapport"**
            * **"Formulaire vierge"** *(affiché selon la zone géographique de l’observateur : métropole ou outre-mer)*
            * **"Formulaire avec données"**
3. L’observateur sélectionne une option du sous-menu.
4. En fonction de la sélection effectuée :
    * Si l’observateur **n’a sélectionné aucune sortie** dans la liste, il peut éditer un formulaire vierge ou avec données, à condition que le nombre total de sorties ne dépasse pas un seuil prédéfini.
    * Si le **seuil est dépassé**, un **message d’alerte** l’informe qu’il doit réduire la sélection.
    * Si l’observateur a **sélectionné une ou plusieurs sorties**, l’édition du formulaire portera uniquement sur ces sorties.
5. Si l’observateur se trouve sur la **page de détail d’une sortie**, il peut également éditer un formulaire vierge ou avec données.
6. Lors de l’édition d’un **formulaire avec données**, un **contrôle de validation** est effectué sur les informations saisies.
7. **En cas d’erreur de saisie**, l’édition du formulaire est bloquée et un **message d’information** informe l’observateur des erreurs à corriger.

---

### **Variante(s) :**

**Variante 4a :**  
Si l’observateur a appliqué un **filtre "Programme de collecte"** dans la liste des sorties, certains champs sont préremplis automatiquement :
* **Programme de collecte**
* **Observateur**
* **Date**  
  [Retour en 3]

**Variante 4b :**  
Le **formulaire avec données** n’est pas modifiable si des échantillonnages sont déjà associés.