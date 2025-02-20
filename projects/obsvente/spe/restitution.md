# Restitution des données
## Spécifications (ObsVente)

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
## Accès à la fonctionnalité de génération de rapports

Il est possible de générer les formulaires vierges ou terrain avec données depuis [l'écran des sorties](/projects/obsvente/spe/collecte_de_donnees.md#sorties) ou depuis la [consultation d'une sortie](/projects/obsvente/spe/collecte_de_donnees.md#sortie--détails).

Par défaut la génération des formulaires est active. Depuis l'écran de la liste des sorties, il est possible de bloquer cette génération ou d'avertir le saisisseur si trop de sorties vont constituer les rapports :
- Une limite du nombre de sorties est paramétrable, avec un blocage de la génération en avertissant le saisisseur si cette limite est atteinte.
- Une limite du nombre de sorties est paramétrable, avec un simple avertissement sur le temps de génération pouvant être long si cette limite est atteinte.

L’accès à la génération de rapports se fait via un bouton situé en haut à droite de la fenêtre affichant la liste des sorties. [Bouton accès rapport](/projects/obsvente/spe/images/observed-location-PrintButton.svg).

L’appui sur ce bouton ouvre un sous-menu proposant les options suivantes :

- Éditer le rapport… [Interface graphique](/projects/obsvente/spe/images/Print-report-menu.svg)
	- Types de rapport
	  - Formulaire vierge (choix entre métropole et outre-mer selon la zone de l’observateur)
	  - Formulaire avec données
# Conditions d’édition des formulaires
## Sans sélection de sorties
Si aucune sortie n’est sélectionnée, l’observateur peut éditer un formulaire vierge ou avec données, à condition que le nombre total de sorties affichées ne dépasse pas un seuil prédéfini.
Si le seuil est dépassé, un message d’alerte informe l’observateur qu’il doit réduire la sélection avant de poursuivre.

## Avec sélection de sorties
Lorsque l’observateur sélectionne une ou plusieurs sorties dans la liste, l’édition des formulaires vierges ou avec données portera uniquement sur les sorties sélectionnées.

## Depuis la page de détail d’une sortie
Lorsqu’une sortie est ouverte en détail, l’observateur peut également éditer un formulaire vierge ou avec données depuis cette page.

# Contrôle des données lors de l’édition d’un formulaire avec données
Lors de l’édition d’un formulaire avec données, un contrôle de validation est effectué sur les informations saisies.
En cas d’erreur, l’édition du formulaire est bloquée et un message d’information indique à l’observateur les erreurs à corriger avant de poursuivre.