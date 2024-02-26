# Réunion de présentation du prototype ObsMer aux utilisateurs

### 26/02/2024

> Présents :
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Glenn PRIGENT (Ifremer)
> - Yohann Le Traon (Ifremer)
> - Vincent BADTS (Ifremer)
> - Benoit LAVENIER (EIS)
> - Caroline DESTREEZ (CODRA)
> - Julie CADIOU (SINAY)
> - Alice VASTEL (SINAY)
> - Charlotte FABJANCZYK (SINAY) 
> - Elise NOGER-HUET (SINAY)

---
# Présentation de SUMARIS

- Présentation de l'outil SUMARIS (équivalent d'Allegro)
- Développé depuis 6 ans, en production, mais pas sur des volets ObsMer

# Connexion à l'application

L'application est testable sur : https://obsmer.sumaris.net

- Administrateur : admin@sumaris.net / admin
- Observateur : obs@sumaris.net / demo
- Superviseur  : demo@sumaris.net / demo

Sur tablette ou ordiphone Android :
- Télécharger et installer le fichier APK ;
- Au lancement, choisir le noeud : obsmer.sumaris.net

---

# Page d'accueil
 
- Menu et page centrale permettant de saisie des marées, des sorties (ventes) et d'administrer les référentiels (navires, programmes, ...)
- L'utilisateur peut avoir des notifications (messages indiqués par une cloche).

# Saisie des marées

- Filtre sur les marées : Possibilité de filtrer les données (visibilité du filtre mit en place et suppression possible)
  Colonne triable et paramétrage des colonnes possibles : A la prochaine connexion, l'ordre est restauré

- Descendre dans une marée : on clique sur une marée (flèche retour pour revenir au tableau précédent). 2 façons de savoir ou on est rendu (bandeau ou menu de gauche)

- Contenu de saisie pour une marée :
  Navire, départ date-heure, retour date-heure (indicateur calculé), vente, lieu de vente, observateurs, nombre d'homme à bord (PSFM), ..., commentaire de la marée

- Partie de droite d'information sur la marée : Saisisseur, date création, bouton Terminer la saisie


# Marée > Engins

- Fenêtre dédiée pour saisir un engin : caractéristiques pour la saisie

- Les champs de saisis sont rouges s'ils sont obligatoire laissés vide 

> ISI : A ajouter dans les règles d'ergonomie communes

- Saisis des champs : filtre sur les 3 premiers caractères renseignés et utilisation du champ * pour les libellés

> ISI : A ajouter dans les règles d'ergonomie communes


# Marée > Opérations

-latitude/longitude pas forcément connues : rendre non obligatoire

# Saisie des captures 

- Possibilité d'épingler un élément dans le menu de gauche (Exemple: épingler une opération pour retrouver la saisie)

> ISI : A spécifier

**Question utilisateur** : 
- L'opération est non visible sur le menu de gauche ?
Bouton LOG : historique des dernière saisies (Exemple : opérations) -> Bouton d'ajout disponible

> ISI : A spécifier

- Possibilité de figer des champs (sur une liste déroulante) pour faciliter la saisie

> ISI : A spécifier

**Question utilisateur** :
- Avoir plus de critères de saisis de mesures (centimètre, longueur totale, ...) ?
Espèce avec plusieurs critères de mesures (coquille St Jacques) ? Automatiquement prévu dans l'arbre : 1 mesure de référence
2 types de longueur avec une des 2 obligatoires à la saisie et avoir la possiblité de figer le champ pour obligatoirement le saisir (case à cocher "Figer").


**Question utilisateur** :
Coef. échant. se saisit tout seul ? OUI 

> ISI : Manque une colonne en bleu italique, poids RTP avec possibilité de copier/coller (poids de référence ou poids RTP)

Bouton des mensurations cliquable - Avoir le bouton d'ajout de mensuration plus grand : bleu s'il y a de la donnée, noir sinon (avec icone pour avoir le nombre de saisie)
On doit pouvoir y accèder par le clavier (tabulation).

> ISI : A spécifier

Notion d'unicité de saisie à ajouter dans l'outil ? A confirmer.

**Remarque utilisateur** :
Ajouter une colonne catégorie dans sous menu des parties retenus (CHU, AP, GOD, OD)

> ISI : A spécifier

**Question aux utilisateurs** :
- Coef. Echant. : % ou fraction ? Utilisation de fraction OK


## Saisie des captures > Copier/Coller

- Le copier/coller -> Ne colle pas les poids mais seulement les espèces
- "Déplacer Vers" -> Coupe et colle les espèces

> ISI : A spécifier

- Au niveau de la capture -> Importer toutes la liste d'espèce depuis une opération précédente (faire une variante), disponible dans les options de la capture (à côté du menu capture)
Avec demande de confirmation.

- PNR, Vrac : Rajouter un poids total et un poids échantillonné dans l'écran (rien pour l'instant). Laisser saisissable mais se remplit tout seul.
-"Animaux" dans PNR non détaillé à la place de PNR détaillé

**Question utilisateur** :
- Au niveau des poids : estimé ou pas ?
- Estimé ou pas dépend des espèces : Rajouter dans le champ estimé dans le champ poids total et poids échantillonné

> ISI : A spécifier

Ergonomie : Réduire par exemple la colonne Présentation (avec ...)


## Saisie des captures > Contrôle

- Bouton contrôler : en rouge les erreurs sur les compteurs et se positionne sur la première erreur.
- Quand on controle, si rien n'a été saisi, on passe le poids total à 0 comme ça on peut revenir dessus.
- Compteur : Couleur gris quand vide, bleu ok, rouge en erreur

> ISI : A spécifier

**Question utilisateur** :
- Pouvoir connecter un ichtyomètre bluetooth => Mode de saisie avec une tablette
- Icone bluetooth en plus sur la tablette pour sélectionner la règle ichtyomètre


# Avis utilisateurs

- Le nouvel outil est plus intuitif au niveau de la saisie
- Ils sont enthousiastes à l'idée d'utiliser cet outil
- C'est le jour et la nuit par rapport à Allegro actuel

Mode déconnecté ? Aussi fluide sans internet Oui
Action de synchronisation accessible que quand on a du réseau (envoie les données sur la BDD Harmonie).
