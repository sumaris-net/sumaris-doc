# Réunion MOA sur la saisie des mesures dans ObsVentes 

### Le 02/12/2024

---

> Présents :
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Elise Bultel SCAVINNER (Ifremer)
> - Vincent Badts (Ifremer)
> - Johann LE TRAON (Ifremer)
> - Vincent BADTS (Ifremer)
> - Benoit LAVENIER (EIS)
> - Caroline DESTREEZ (CODRA)
> - Jean-Victor FAMY (CODRA)

---

### Ordre du jour 

Présentation des 3 jeux de tests

---

### Questions 

- [ ] Présence colonne poids RTP dans l'affichage des dénombrements ? 
  - MOA : Pas de colonne Poids RTP
    - Afficher le poids total RTP
- [X] Sexage des espèces ? (Baudroie, Langoustine, Coquille Saint Jacques) ?
  - A Respecter pour la démo du séminaire
- [X] Dénombrement quand on a plusieurs critères de mensurations (longueur/largeur) ?
  - MOA : Pas de dénombrement si plusieurs critères de mensuration

Langoustines
- A sexer
- PMFM en mm

Si une espèce scientifique, il ne faut peut être pas l'afficher dans le tableau mais juste grisée dans la fenêtre de droite.


### Sémantique à utiliser

Nouvelle vente : à voir pour utiliser une autre sémantique

Ecran de lots à échantillonner


### 1 - Ecran simple avec dénombrement (sans sexage)

Ok : A voir pour rajouter le poids RTP

Limitation du tableau de dénombrement par un filtre : pas de besoin

MOA :
> Pas de besoin de filtrage (pas de cas utilisateur connu)

> Fil d'ariane en mode bureau : rappeler la sortie et le navire (et d'autres critères)

> Ok mais prendre des cas concrets et tester : aller jusqu'à l'enregistrement



### 2 - Ecran avec dénombrement (avec sexage)

Ecran avec les colonnes pour chaque sexe 

MOA :
> Ecran complexe selon la MOA 

> En bas de chaque colonne, avoir le nombre total d'individu

> Saisie au 1/2 cm : Oui 

> Fil d'ariane en mode bureau : rappeler la sortie et le navire (et d'autres critères)

> Ok mais prendre des cas concrets et tester : aller jusqu'à l'enregistrement

> A paramétrer en amont : Par espèce avoir la précision et l'unité (ne pas laisser le choix à l'utilisateur)  


### 3 - Ecran avec plusieurs critère numérique (avec sexage)

MOA : 
> Combinatoire trop importante donc pas de dénombrement : saisie individuelle

>  Cacher le mode de dénombrement


### Récapitulatif - A faire

- [ ] Homogénéiser les boutons (Appliquer, Ajouter)

- [ ] Présence de 2 scrollbars quand il y a beaucoup de lignes

- [ ] Masquer la colonne # avec les numéros de lignes

- [ ] Dans le cas d'une seule espèce scientifique pour l'espèce commerciale, rappeler l'espèce scientifique dans le bandeau de la popup et masquer la colonne espèce scientifique

- [ ] En bas de chaque colonne, avoir le nombre total d'individu

- [ ] Réduire la hauteur de la modale et la déplacer vers le bas pour voir le bandeau de l'écran au-dessous

- [ ] Si plus d'un pmfm numérique, la combinatoire trop importante donc pas de dénombrement : saisie individuelle

- [ ] Masquer la colonne "#" pour eviter des confusions avec la taille

- [ ] Implémenter l'enregistrement

- [ ] Déplacer le formulaire de la modale ((+) dans le formulaire de saisie à droite avec le choix par un radio boutton
  (Choix mode individuel ou dénombrement)

### Séminaire SIH

- Montrer un cas métropole tablette
- Montrer un cas dom-tom pc
- Montrer l'enchainement des écrans
- Démo réalisé par VFA