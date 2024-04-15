# Processus métier
## Spécifications (Calendrier d'activité)


![ui-activity-calendar](/projects/activity-calendar/spe/images/procesus-metier.svg)

---
## Gestion du référentiel

### Cas d'un nouvel utilisateur
1. Le nouvel utilisateur remplit un formulaire sur le site web du SIH en précisant ses quartiers maritimes (gestion du portefeuille de navires)
   https://intraforms.ifremer.fr/sih/enregistrement-dun-nouvel-observateur-ifremer-sih/
2. Le responsable de programme valide la demande
3. Le service informatique crée l'utilisateur dans le LDAP
4. Le guichet d'exploitation crée l'utilisateur en base à partir des informations du LDAP
5. Gestion du portefeuille de navires (reboucler avec Armelle)

### Cas d'un nouveau navire ou d'une modification à apporter à un navire (armateur, port d'exploitation,)
1. L'utilisateur fait une demande d'ajout d'un navire ou une demande de modification à apporter à un navire auprès du guichet d'exploitation
2. Le guichet d'exploitation traite la demande

---
## Collecte des données
1. Collecte des données par l'utilisateur (observateur ou coordinateur)
2. Saisie des données par l'utilisateur
3. Contrôle des données par l'utilisateur dans Valparaiso
4. Correction éventuelle l'utilisateur
5. Contrôle des données par le superviseur dans Valparaiso si l'utilisateur est observateur
6. Correction éventuelle par le superviseur
7. Contrôle des données par le responsable de programme dans Valparaiso (ensemble de données) (présence d'une table dédiée à Valparaiso pour commenter les données)
8. Envoi d'un mail du responsable de programme à l'utilisateur si une correction est à effectuer
8. Correction éventuelle par l'utilisateur

---
## Consolidation des données

---
## Détermination de la stratégie de pêche
