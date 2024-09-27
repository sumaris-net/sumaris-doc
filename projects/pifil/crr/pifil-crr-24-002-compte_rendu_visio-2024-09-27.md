# Compte-rendu réunion visio
## 27/09/2024

> Présents :
>
> - Camille YOUNSI (DGAMPA)
> - Glenn PRIGENT (Ifremer)
> - Nolwenn RANNOU (Ifremer)
> - Léni GUILLOTIN (AGLIA)
> - Quiterie SOURGET (LPDB)
> - Fiona BIGEY (OP VENDEE)
> - Olivier BODERE (AGLIA)
> - Bastien MÉRIGOT (Université de montpellier)
> - Aurélien HENNEVEUX (PDA)
> - Benoit LAVENIER (EIS)
> - Dorian MARCO (EIS)

---

> Excusés :
> 
> - Germain BOUSSARIE (Ifremer)
> - Yves LE GALL (Ifremer)
> - Anne CHAUSSE (CNPMEN)
> - Hélène RENAULT (DGAMPA)
> - Chloé FAURE (DGAMPA)
> - Isabelle JOSSERAND (DGAMPA)
> - Thomas CLOATRE (Ifremer)
> - Emilie LEBLOND (Ifremer)

**Prochaine réunion** de suivi : ~11 octobre (au plus tôt) - à confirmer

**ODJ de la prochaine réunion** :
- Pédagogie pour l'installation de l'application auprès des professionnels
- Retour suite aux embarquements éventuels (Léni)
- Avancés des développements
- Point sur le rapprochement des données

---

## Point contractuel
- CNPMEM a signé le devis pour PIFIL2.
- DGAMPA a signé le devis pour DOLPHINFREE.

---

## Point planning

- La saisie sur PIFIL2 a déjà commencé (pour le PAMM intermédiaire);
- Finalisation du développement **fin septembre** pour assurer la phase de test;
- Objectif de mise en production :
  - Saisie : avant le début du PAMM - **1 décembre 2024**
  - Fonctionnalité d'extraction des données : **mi 2025** ? - à valider
  - Bancarisation/Hébergement à Ifremer : **fin 2025** ? - à valider 

---

# Fournitures des données

- Données Pinger : OCTech
  - Début/fin OP, présence de Cétacés (nombre), charge batterie, profondeur (à valider), etc. 
- Données Caméra : Sinay (projet ObsCam) et EasyFish (installation caméra)
  - Début/Fin OP, position élémentaire, etc.
  - /!\ **3-4 mois** de délais pour le traitement d'image
  - Intégration des données dans le SIH ?
- Données ObsMer-PIFIL (Allegro)
- Données d'auto-échantillonnage PIFIL et DOLPHINFREE (SUMARiS sur **open.sumaris.net**)

---

# Extraction des données

- Fonctionnalité d'extraction des données : **mi 2025** ?
- Responsable de la consolidation : Ifremer (à terme)
- Plusieurs solutions possibles :  
  - import des données Caméra & Pinger directement dans la BDD SUMARiS (à court et moyen terme)
  - centralisation dans le SIH Ifremer (à terme)
- Professionnels doivent voir accès aux **données consolidées**

---

# Exploitation des données

- Université de Pau : traite les données PIFIL2
- Université de Montpellier : traite les données DOLPHINFREE

---

## Validation du protocole

En séance, révision du protocole 
- à partir du [26/09/2024 (rev QS)](projects/pifil/doc/dolphinfree-doc-24-002-protocole-2024-09-26-revQS.xlsx)
- pour aboutir à une [nouvelle version 27/09/2024](projects/pifil/doc/dolphinfree-doc-24-002-protocole-2024-09-27.xlsx)

---

## Avancé des développements

- Saisie de la **marée** : OK
- Saisie des caractéristiques **engins** : en cours de finition
  - Manque diamètre & composition de la ralingue 

---

- Saisie OP **filage** : OK
  * Limitation aux rectangles statistiques d'une zone ? non prioritaire 
- Saisie OP **virage** : **en cours**
  * Saisie du nombre de captures accidentelles de petits cétacés et d'autres espèces ?
    * Sera déduit du nombre d'individu saisis : à ignorer dans l'App 
  * Saisie du nombre de captures accidentelles d'autres espèces ? (optionnel) => priorité basse (à reporter)

---

- Saisie de la capture accidentelle : **en cours**
  * Etat de décomposition et blessures => à décomposer en 3 champs :
    * Mort (Oui/Non)
    * Si mort : État de décomposition (frais/légère/très décomposé/NSP)
    * Si remontée à bord : Blessure (Oui/Non/NSP)
  * "Si maillé, distance au pinger le plus proche" => à décomposer en 3 champs :
    * Maillé (Oui/Non)
    * Distance au pinger le plus proche
    * Pinger accessible ? (Oui/Non)
    * Numéro du pinger (obligatoire si accessible)
  * "Espèce" : 
    * Code FAO pour 'Dauphin non-identifié" : `UNK`
    * Code FAO pour "Autres" : `MZZ`
    * Ajouter `DRR - Dauphin de risso`

---

- Adaptation à iOS (iphone) : OK
- Adaptation des petits écrans (smartphone) : OK
- Au lancement de l'application : 
  - Amélioration du choix du programme de collecte : **à faire**
  - Amélioration du choix du noeud (déduit du programme) : **à faire**
  
---

## Démonstration

Questions : 
- `DOLPHINFREE` au lieu de `DOLPHIN-FREE`
- GPS : précision à 10 min ?
- OP : copier le rectangle en début ET fin de virage
- Capture accidentelle : Renommer `Référence de la marque` -> `Référence de la bague`

---
## Organisation des tests

- Qui testera ?
  - Les OP,
  - Scientifiques intéressés (extraction notamment)
  - Autres ?
- Camille YOUNSI fournira la liste des testeurs à EIS 
- Les tests se feront sur : [open-test.sumaris.net](https://open-test.sumaris.net) (nécessite de créer un compte)
  - Après l'email de lancement d'EIS
  - /!\ Les données saisies ne seront **PAS** conservées
