# Compte-rendu réunion visio
## 27/09/2024

> Présents :
>
> - Camille YOUNSI (DGAMPA)
> - Léni GUILLOTIN (AGLIA)
> - Quiterie SOURGET (LPDB)
> - Glenn PRIGENT (Ifremer)
> - Nolwenn RANNOU (Ifremer)
> - Fiona BIGEY (OP VENDEE)
> - Olivier BODERE (AGLIA)
> - Bastien MÉRIGOT (Université de montpellier)
> - Benoit LAVENIER (EIS)
> - Aurélien HENNEVEUX (PDA)

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

**Prochaine réunion** de suivi : 11 octobre (au plus tôt

**ODJ** :
- Pédagogie pour l'installation de l'application auprès des professionnels
- Retour suite aux embarquements éventuels (Léni)

---

## Point contractuel
- CNPMEM a signé le devis pour PIFIL2.
- DGAMPA a signé le devis pour DolphinFree.

---

## Point planning

- La saisie PIFIL2 a déjà commencé, pour le PAMM intermédiaire;
- Finalisation du développement **fin septembre** pour assurer la phase de test;
- Objectif de mise en production :
  - Saisie : avant le début du PAMM - **1 décembre 2024**
  - Fonctionnalité d'extraction (CSV) : **début 2025** ?
  - Bancarisation/Hébergement à Ifremer : **fin 2025** ?

---

# Point exploitation des données

- Université de Pau : traite les données PIFIL2
- Université de Montpellier : traite les données DolphinFree


---

# Rapprochement des données

- Fournitures des données : 
  - Données Pinger : OCTech
    - Début/fin OP, présence de Cétacés (nombre), charge batterie, profondeur (à valider), etc. 
  - Données Caméra : Sinay (projet ObsCam) et EasyFish (installation caméra)
    - Début/Fin OP, position élémentaire, etc.
    - /!\ **3-4 mois** de délais pour le traitement d'image
    - Intégration des données dans le SIH ?
  - Données ObsMer-PIFIL (Allegro)
  - Données saisies sur **open.sumaris.net**
- Centralise et consolide : **Ifremer** (à terme)

---

# Extraction des données

- Responsable : **Ifremer**
- Plusieurs solutions : centralisation dans le SIH Ifremer (à terme) ou dans SUMARiS (moyen terme)  
- Professionnels doivent voir accès aux **données consolidées**
- Échéances d'extraction : **fin avril** 2025 ?  

---

## Avancé des développements (1/3)

- Saisie de la **marée** : OK
- Saisie des caractéristiques **engins** : OK

---

## Avancé des développements (2/3)

- Saisie de l'opération / **filage** : OK
  * Saisie du rectangle statistique : faut-il limiter à une zone ? (non bloquant) 
- Saisie de l'opération / **virage** : **en cours**
  * Saisie du nombre de captures accidentelles de petits cétacés et d'autres espèces ?
  * Saisie du nombre de captures accidentelles d'autres espèces ? (optionnel - priorité basse)
- Saisie de la capture accidentelle : **en cours**
  * "Si maillé, distance au pinger le plus proche" => à décomposer en 2 champs ? 
  * "Espèce" : 
    * Code FAO pour 'Dauphin non-identifié" ?
    * Code FAO pour "Autres" : utiliser "MZZ - Poissons divers" ?

---

## Avancé des développements (3/3)

- Au lancement de l'application : 
  - Amélioration du choix du programme de collecte : **en cours**
  - Amélioration du choix du noeud / base de données (à déduire du programme) : **en cours**
- Adaptation à iOS (iphone) : OK
- Adaptation des petits écrans (smartphone) : **en cours**
  
---

## Démonstration

Questions : 
- `DOLPHINFREE` au lieu de `DOLPHIN-FREE`
- GPS : précision à 10 min ?
- OP : copier le rectangle en début ET fin de virage
- Capture accidentelle : Renommer `Référence de la marque` -> `Référence de la bague`

---
## Organisation des tests

- Tests sur [open-test.sumaris.net](https://open-test.sumaris.net) (nécessite de créer un compte)
- EIS donnera le feu vert (par email)
- /!\ Les données saisies ne seront **PAS** conservées
- Qui testera ?
  - OP, 
  - Scientifiques intéressés (extraction notamment)
  - Camille YOUNSI fournira la liste