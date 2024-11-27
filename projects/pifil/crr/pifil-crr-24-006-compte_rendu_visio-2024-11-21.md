# Compte-rendu réunion visio
## 21/11/2024

L'objectif de la réunion est de coordonnées le rapprochement des données de PIFIL / DolphinFree

---

> Présents :
>
> - Florian EXPERT (MTECP DEB)
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

Types de flux impliqués dans les projets PIFIL/DOLPHINFREE : 

- Saisie manuelle : 
  - Auto-échantillonnage
  - Observateurs ObsMer
- Caméra embarquée (ObsCam)
- Balise
- Logbook ?

Puis à partir de ces flux : 
- Rapprochement de données
- Production des résultats


---
## Flux > Auto-échantillonnage

- Saisie dans l'app SUMARiS (open.sumaris.net)
  - Délais : 
    - Non validée : quasi temps réel
    - Validée : dépends de qui valide ?
  - Accès aux données: API GraphQL ou fichiers CSV
- Ou saisie depuis des fiches terrain
  - Délais : dépends de qui saisit ?

> **Questions en suspends** :
> - Qui saisie les fiches terrains ?
> - Qui valide les données saisies ?

> Action :
> - EIS - fournir la documentation du format d'export

---
## Flux > Observateur ObsMer

- Saisie dans Allegro-ObsMer
- Protocole : Longueur, sexe, circonf., trace de capture, blessures,  bagué ou non, numéro bague mis sur la carcasse, date heure et position de la capture, et du point de remise à l'eau
- Délais : 
  - Validation prestataire : sous 30 jours
  - Validation programme (par Ifremer) : quel délai ?

> **Question en suspends** :
> - Délai de validation programme (Ifremer) ?

---
## Flux > Caméra embarquée (ObsCam)

- Données anonymisées par défaut 
  - Demander à OFB pour accès aux données non anonymisés  
- Sinay produit le fichier de données
- Délais  : 
  - acquisition: flux quotidien recu par Sinay 
  - traitement : 
    - 45 navires: ~2-3 mois
    - 50-60 navires: ~2-4 mois (engagement contractuel)

---
## Balise

- OCTech produit le fichier
- Délais :
  - Données récupérées quotidiennement
  - Mise à disposition à J+1
- Accès aux données : 
  - 1 format CSV PIFIL, 1 format CSV DOLPHINFREE 
  - Documentation à transmettre
  - Possibilité de construction d'une API

> Action :
> - OCTech - fournir la documentation des 2 formats

---
## Logbook ?

- Données d'auto-échantillonnage de captures accidentelles
- Via flux ERS (xml)
- Ifremer produits le fichier
- Délais : 
  - Aggrégation SACROIS : un mois
  - VisioCapture (FranceAgrimer) : délais de fourniture ~1j à 2-3 mois
- **Intéret de ces données ?** A statuer

---
## Rapprochement

- Responsable : Ifremer
- Jeux de de données de test à prévoir
- Objectif de fourniture des données rapprochées : juillet 2025
- Au moins 4 types de cas de tests : 
  - PIFIL : avec ou sans ObsCam
  - DOLPHINFREE : avec ou sans ObsCam
  - Observateurs embarqués ?
  - ObsCam : demande d'autorisation auprès de l'OFB
  - Balises : demande d'autorisation auprès du CNPMEN

---
## Production des résultats

- Responsable : Universités( Montpellier et Pau)
- Objectif : septembre 2025