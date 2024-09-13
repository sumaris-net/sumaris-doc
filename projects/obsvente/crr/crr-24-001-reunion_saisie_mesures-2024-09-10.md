# Réunion de présentation de la saisie des mesures dans ObsVentes à la MOA

### 26/02/2024

> Présents :
> - Vincent FACHERO (Ifremer)
> - Marion SCAVINNER (Ifremer)
> - Elise Bultel SCAVINNER (Ifremer)
> - Johann LE TRAON (Ifremer)
> - Vincent BADTS (Ifremer)
> - Benoit LAVENIER (EIS)
> - Jean-Victor FAMY (CODRA)

---

### Présentation de la saisie des mesures individuelles

- Mise en place d'un protocole par stratégie (temps/espace) : Une entrée par criée (discriminant)
  - Pouvoir disposer de plusieurs stratégies en métropole

- Choix du critère de classement :
  - Champ de saisi du nombre d'individu avec case une à cocher "Saisie manuelle" grisé par défaut avec la valeur à 1. 
  - Si on coche "Saisie manuelle", on dégrise le champ et la saisie dévient possible.
  - Renommer Critère de classement en **Type de mesure**.

- Il peut y avoir plusieurs **Type de mesure**
  - Si on a un seul type de mesure, il n'y a pas de sélection à faire (la liste n'apparait pas).
  - MODE BUREAU : Si plusieurs PMFM identique (type de mesure), on demande à l'utilisateur de choisir sa précision (cm/mm)
  - MODE TABLETTE : Longueur totale (cm) avec **...** pour sélectionner le type de mesure (à la sélection, on change "Longueur totale (cm)")
  
- Il faut pouvoir saisir le poids observé en plus (ajouter le PMFM du poids observé)

- Saisir une photo : en V1 (sur le lot le plus fin, espèce scientifique)

- Saisir une photo : en V2 (sur le lot le plus fin, espèce scientifique) - suivant un algo de plusieurs paramètres (observateur nouveau, espèce rare, ...) : information à déterminer par un statisticien

- Le poids total RTP est calculé si tous les poids RTP sont renseignés


- Critère de classement numérique
  - Instrument d'analyse à enlever

- Fenêtre de dénombrement
  - Rajouter une liste déroulante Male/Femelle avec un seul choix
  - Rajout d'une colonne "Sexe" et on duplique les lignes
  - Le filtre doit s'appliquer le contenu du tableau du dénombrement.

- Saisie des effectifs 
  - Activable par une option dans ObsVente (désactiver par défaut)

**Proposer une maquette applicative pour la prochaine réunion**

**Prochaine réunion ObsVentes  - Le jeudi 14/11/2024**

### Réponses sur l'ODJ

- Pas de maintien du la fonctionnaltité d'utilisation du PSION (utilisé par groupe EI) ?
  - Problème du format à importer. Prévu dans la refonte ? Non à l'heure actuelle.
  - Importer au niveau de la sortie ou au niveau des lots ?


- Questions Elise : 
  - On peut avoir plus que 2 métiers (métier principale / métier secondaire) : Nommenclature à revoir suite à un point entre MOA
  - Renommer ObsVentes. Ok à faire côté serveur (ouvrir un ticket)
  - Génération du rapport de collecte remplit : MOA à une préférence pour la vue en arbre (faire le rapport avec la vue arbre)
    https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/obsvente/doc/obsventes-doc-24-007-Formulaire_terrain_v1-valide_tableau.pdf
    MOA (Marion) demande aux utilisateurs le choix du rapport (arbre ou tableau)







