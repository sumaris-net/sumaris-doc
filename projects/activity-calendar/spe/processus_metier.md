# Processus métier
## Spécifications (Calendrier d'activité)


![ui-activity-calendar](/projects/activity-calendar/spe/images/processus-metier.svg)

---
## Gestion du référentiel

### Cas d'un nouvel utilisateur
1. Le nouvel utilisateur remplit un formulaire sur le site web du SIH en précisant ses quartiers maritimes
   https://intraforms.ifremer.fr/sih/enregistrement-dun-nouvel-observateur-ifremer-sih/
2. Le responsable de programme valide la demande
3. Le service informatique crée l'utilisateur dans le LDAP
4. Le guichet d'exploitation crée l'utilisateur en base via Adagio-Admin à partir des informations du LDAP
5. Le guichet d'exploitation associe des quartiers maritimes et/ou des navires à l'utilisateur via Adagio-Admin

### Cas d'un nouveau navire ou de la modification d'un navire (caractéristiques, immatriculation, armateur)
1. L'utilisateur fait une demande d'ajout d'un navire sur le site web du SIH
   https://sih.ifremer.fr/prive/Acces-aux-donnees/Extractions/Referentiels/Demander-une-mise-a-jour-des-referentiels
   ou depuis WAO https://forms.ifremer.fr/sih/wao-demande-dintervention-sur-le-site/
2. Si le navire n'est pas au CFR, mise en attente de la demande pour voir si le navire sera au CFR le mois suivant
   * Si oui, le traitement de consolidation des navires crée le navire
   * Si non, le guichet d'exploitation crée le navire 
3. Si le navire est au CFR, le traitement de consolidation des navires crée le navire
4. A CONFIRMER

### Cas de la modification d'un navire (caractéristiques, immatriculation, armateur)
1. L'utilisateur fait une demande d'ajout d'un navire sur le site web du SIH
   https://sih.ifremer.fr/prive/Acces-aux-donnees/Extractions/Referentiels/Demander-une-mise-a-jour-des-referentiels
   ou depuis WAO https://forms.ifremer.fr/sih/wao-demande-dintervention-sur-le-site/
2. ?

### Cas d'un navire à ajouter au portefeuille d'un utilisateur
1. ?
2. Un traitement ajoute automatiquement le navire au portefeuille de l'utilisateur

---
## Collecte des données
1. Collecte des données par l'utilisateur (observateur ou coordinateur)
2. Saisie des données par l'utilisateur
3. Contrôle des données par l'utilisateur dans Valparaiso
4. Correction éventuelle l'utilisateur
5. Contrôle des données par le superviseur dans Valparaiso si l'utilisateur est observateur
6. Correction éventuelle par le superviseur
7. Contrôle des données par le responsable de programme dans Valparaiso (ensemble de données)
8. Envoi d'un mail du responsable de programme à l'utilisateur si une correction est à effectuer
9. Correction éventuelle par l'utilisateur

---
## Consolidation des données
1. Exécution automatique de SACROIS une fois par mois

---
## Détermination de la stratégie de pêche
1. Détermination de la stratégie de pêche
2. Stratification de la flotte
3. Elaboration des plans d'échantillonnage