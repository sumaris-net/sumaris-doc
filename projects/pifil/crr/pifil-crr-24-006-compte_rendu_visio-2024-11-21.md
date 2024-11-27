# Compte-rendu réunion visio
## 21/11/2024

L'objectif de la réunion est de coordonner le rapprochement des données de PIFIL / DOLPHINFREE

---

> Présents :
>
> - Damien LE BOULAIRE (OchTech)
> - Glenn PRIGENT (Ifremer)
> - Marie-claude Cote-Laurin (OFB - projet ObsCam)
> - Chloé MALIRAT (OFB)
> - Alex Chailloux (SINAY)
> - Camille YOUNSI (DGAMPA)
> - Anne CHAUSSE (CNPMEN)
> - Margaux HONNORE (CNPMEM)
> - Benoit LAVENIER (EIS)
> - Quitterie SOURGET (OP LPDB)
> - Fiona BIGEY (OP VENDEE)
> - Aurélien HENNEVEUX (OP PDA)
> - Bastien MÉRIGOT (Université de Montpellier)
> - Florian EXPERT (MTECP DEB)
> - Lugdiwine BURTSCHELL (DEB/ELM3)

---

> Excusés :
>
> - Léni GUILLOTIN (AGLIA)
> - Germain BOUSSARIE (Ifremer)
> - Dorian MARCO (EIS)
> - Noëlle BRU (Université de Pau)
> - Nolwenn RANNOU (Ifremer)
> - Olivier BODERE (AGLIA)
> - Yves LE GALL (Ifremer)
> - Hélène RENAULT (DGAMPA)
> - Chloé FAURE (DGAMPA)
> - Isabelle JOSSERAND (DGAMPA)
> - Thomas CLOATRE (Ifremer)
> - Emilie LEBLOND (Ifremer)

---
## Flux de données

Types de flux impliqués dans les projets PIFIL et DOLPHINFREE : 

- Saisie manuelle (Marée, opération, captures accidentelles): 
  - Auto-échantillonnage
  - Observateur embarqué (ObsMer)
- Caméra embarquée (ObsCam)
- Balise
- Logbook ?

Puis à partir de ces flux : 
- Rapprochement de données
- Production des résultats


---
## Saisie manuelle > Auto-échantillonnage

- Saisie dans l'app SUMARiS (open.sumaris.net)
  - Délais de mise à disposition des données : 
    - Donnée non validée : quasi temps réel
    - Donnée validée : dépends de qui valide ?
  - Accès aux données : 
    - API GraphQL
    - ou fichiers CSV
- Ou saisie depuis des fiches terrain
  - Délais : qui saisit ? les OP ?

> **Questions** :
> - Qui valide les données saisies manuellement ?
> - Qui saisie les fiches terrains ?

> Action :
> - EIS - fournir la documentation des formats d'export PIFIL2 et DOLPHINFREE

---
## Saisie manuelle > Observateur embarqué

- Saisie dans Allegro-ObsMer, hébergé par Ifremer
- Protocole : Longueur, sexe, circonf., trace de capture, blessures,  bagué ou non, numéro bague mis sur la carcasse, date heure et position de la capture, et du point de remise à l'eau
- Délais : 
  - Validation prestataire : sous 30 jours
  - Validation programme (par Ifremer) : quel délai ?

> **Question en suspends** :
> - Délai de validation programme (Ifremer) ?

> Action :
> - Ifremer - vérifier la compatibilité d'Allegro-Obsmer avec le protocole DOLPHINFREE

---
## Flux > Caméra embarquée (ObsCam)

- Données anonymisées par défaut 
  - Demander à OFB pour accès aux données non anonymisés  
- Sinay produit le fichier de données
- Délais : 
  - acquisition : flux quotidien recu par Sinay 
  - traitement : 
    - 45 navires: ~2-3 mois
    - 50-60 navires: ~2-4 mois (engagement contractuel)

---
## Balise

- OCTech produit les fichiers
- Délais :
  - Données récupérées quotidiennement
  - Mise à disposition à J+1
- Accès aux données : 
  - 1 format CSV PIFIL, 1 format CSV DOLPHINFREE 
  - API d'accès évoquée
  - Documentation à transmettre
  - Possibilité de construction d'une API

> Action :
> - OCTech - fournir la documentation des 2 formats CSV et/ou de l'API d'accès

---
## Logbook

- Données d'auto-échantillonnage de captures accidentelles
- Ifremer produits le fichier
  - Recu via un flux ERS (xml)
- Délais : 
  - Aggrégation SACROIS : un mois
  - VisioCapture (FranceAgrimer) : délais de fourniture ~1j à 2-3 mois

> **Questions** :
> - Intéret de ces données ? Elles ne semblent par apporter de nouveaux éléments,
>   **A statuer**

---
## Rapprochement

- Responsable : Ifremer
- Jeux de données de test à prévoir - quels navires/périodes ?
- Objectif de fourniture des données rapprochées : juillet 2025
- Au moins 4 types de cas de tests : 
  - PIFIL : avec ou sans ObsCam
  - DOLPHINFREE : avec ou sans ObsCam
  - Observateurs embarqués ?
- ObsCam : demande d'autorisation à faire auprès de l'OFB
- Balises : demande d'autorisation à faire auprès du CNPMEN

> Action :
> - TOUS - Définir un jeu de données de chaque flux 

---
## Production des résultats

- Responsable : Universités (Montpellier et Pau)
- Objectif : septembre 2025