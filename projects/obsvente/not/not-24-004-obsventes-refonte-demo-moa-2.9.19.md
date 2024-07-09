# ObsVentes - Demo MOA 2

## Application 

- URL : https://sumaris-app.isival.ifremer.fr
- Node choice : https://sumaris-pod.isival.ifremer.fr
- Login : Intranet user account

---

## 09/07/2024 - Demo 2

### ObsVentes - Sprint 4 - Issues Board

- **Sprint** : 4
- **Start date** : 27/05/2024
- **End date** : 21/06/2024
- **Milestone** : **2.9.19.2**
- **Status** : Closed
- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=OBSVENTES&milestone_title=2.9.19)

---

### Fonctionnalités / Limitations

Fonctionnalités sur le sprint 4
- [Echantillonnage sur une sortie](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/spe/collecte_de_donnees.md#sortie--echantillonnages-en-m%C3%A9tropole)
- [Saisie d'une vente](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/spe/collecte_de_donnees.md#vente--d%C3%A9tails)
- [Saisie d'un lot d'espèce sur la vente](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/spe/collecte_de_donnees.md#vente--lots-esp%C3%A8ces)
- [Saisie de mensuration sur un lot d'espèce]( https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/spe/collecte_de_donnees.md#vente--lots-esp%C3%A8ces--mesures-individuelles)

Limitations sur le sprint 4
- [Retours de recette ObsVentes v2.9.19](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/638)
- [Retours de recette volets communs v2.9.19](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/631)
 
---

### Recette MOE du sprint 4 

Navigateur conseillé pour la recette :
- **Chrome**

Des bugs ont été trouvés sur FireFox mais pas sur Chrome [#631](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/631)

- Sumaris-ObsVentes ([SquashTM](http://visi-common-squash.ifremer.fr:8080/squash/login))
  - 02 Collecte de données
     * 01.01 Consultation des sorties / Filtre sur les sorties
     * 01.02 Saisie d'une sortie
     * 01.03 - Saisie d'un échantillonnage - métropole
     * 01.05 - Saisis d'un lot d'espèces 
     * 01.06 - Saisie des mesures individuelles 

Début recette MOA : 
- Pas avant le 15/07/2024

---

### Demonstration du contenu du sprint 4 d'ObsVentes

---

### Sprint 4 en cours (2.9.20)

- [gitlab Issues board](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/boards/873?label_name[]=OBSVENTES&milestone_title=2.9.20)
- Démonstration - [environnement de développement](https://obsmer.sumaris.net)
  - Points réguliers d'avancement 
- Tickets à prioriser

---

### Notes Réunion

- Présents :
  - Marion Scavinner (MOA/HISSEO)
  - Elise Bultel (MOA/HISSEO)
  - Vincent Fachéro (MOE/ISI)
  - Caroline Destreez (MOE/CODRA)
  - Jean-Victor Famy (CODRA)
  - Benoit Lavenier (EIS)

---
2 Stratégies (voir plus pour les DOM) : 
- Stratégie Métropole
- Stratégie outre-mer (PETS pas activé)
  - Peut être une stratégie pour chaque outre-mer

Ecran de sortie - Supprimer les champs : 
- validation observateur*
- validation société*

Ecran de la vente : 
- Ajouter le métier à la place de l'engin

Actions MOE :
- Modifier les PETS en BDD (voir liste PDF).
- Revoir le fonctionnement du bouton ((+) : Métropole - Resynchronisation avec WAO pour recharger la liste des espèces tirées au sort.
- Type de vente
  - Envoyer la liste des types de vente à Marion et Elise pour éventuellement faire un filtrage.
  - Ticket 637 - regarder le nombre d'occurence et le type de vente et fournir cela à la MOA.
  - Demander à Antoine s'il utilise les ID négatifs dans SACROIS.
- Manque la colonne espèce scientifique dans le tableau des Lots (Option du programme).
- Spécifications sur le bouton ((+) : Modifier les spécifications

Développements : 
- Ecran des ventes/lots - Ne pas proposer le choix de l'espèce commerciale mais la renseigner automatiquement
(dans le titre).
- Bug au niveau du tableau de saisie des mesures individuelles : le poids doit être en lecture seul.
- Etat : pas besoin à l'affichage mais utile pour le calcul des RTPs (à regarder dans Allegro). 

Dans PMFM_STRATEGY : 
- On peut affecter un PMFM à une stratégie.
Exemple : Etat saisissable pour telle espèce ou fixe pour une autre espèce (Ex : Frais pour Baudroie)
Ou ne pas mettre de valeur par défaut et recopier la valeur de la ligne suivante.

- Si on se trompe de ligne de plan : 
Bouton ((+) : Complète la liste, réordonne et supprimer les précédentes espèces qui ne sont plus dans la ligne de plan actuelle




