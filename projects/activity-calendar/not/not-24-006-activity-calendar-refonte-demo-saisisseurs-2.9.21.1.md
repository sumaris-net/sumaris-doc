# Calendrier d'Activité - Démonstration

## Présentation de la nouvelle application Calendrier d'activité

## le 26/09/2024

---

### Application Web : SUMARiS - ActiFlot (_nommage non définitif_)

**Client léger Web** : application qui fonctionne via un navigateur Web (Chrome) qui s'appuie sur des ressouces distantes (serveur)

- [Spécifications](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/activity-calendar/spe/collecte_de_donnees.md?ref_type=heads)
- [Architecture SUMARiS](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/architecture/general_architecture.md?ref_type=heads)

---

### Comparatif avec l'Allegro actuel (client lourd)

|                                     | **Allegro Calendrier - Actuel <br> (client lourd)**                  | **SUMARiS ActiFlot - Refonte <br> (client léger)**                                                             |         
|-------------------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| **Installation**                    | Sur chaque poste utilisateur                                         | Aucune                                                                                                         | 
| **Maintenance, gestion de version** | Manuellement sur chaque poste                                        | Centralisée (côté serveur)<br>Transparent pour les utilisateurs                                                |
| **Accessibilité**                   | Restreint aux machines sur lesquelles le logiciel est installé       | Accessible depuis n'importe quel appareil. <br>Fonctionne en client lourd également (PC, tablette, smartphone) | 
| **Réseau**                          | Mode connecté - synchronisation<br>Fonctionne en mode déconnecté<br> | Mode connecté - pas de synchronisation<br>Fonctionne en mode déconnecté                                        |
| **Sécurité**                        | Gérée sur chaque poste (plus vulnérable)                             | Gérée côté serveur (Infra RIC Ifremer)                                                                         |
| **Performance**                     | Dépend du poste local (recommandation)                               | Dépend du serveur (Infra RIC Ifremer)                                                                          |
<!-- .element: class="font-size-extra-small" -->

---

### Périmètre fonctionnel de **SUMARiS ActiFlot**


| **Volets**             | **Version** | **Périmètre**                                            | **Jalon MEP**     | **Formation**                     |         
|------------------------|-------------|----------------------------------------------------------|-------------------|-----------------------------------|
| Calendrier d'Activité  | V1          | Iso fonctionnel Allegro actuel                           | Novembre 2024     | Décembre 2024<br/>(séminaire SIH) | 
| Calendrier d'Activité  | V2          | Cartographie<br/>Mode Tablette<br/>Intégration de photos | 2nd semestre 2025 | -                                 |
<!-- .element: class="font-size-extra-small" -->
---

![ui-calendrier-planning](/projects/activity-calendar/not/images/refonte-activity-calendar-planning-sprints.svg)<!-- .element: style="width: 75%" -->

---

### Application SUMARiS - ActiFlot

#### Connexion à la nouvelle application
- **URL** : https://sumaris-app.isival.ifremer.fr
- **Choix du noeud** : https://sumaris-pod.isival.ifremer.fr
- **Compte** : Compte Intranet/Extranet (_à venir_)
- **Version de développement** : Release 2.9.21.1
- **Environnement des données** : Base de PréProduction Allegro
  - Copie de la production (du 03/2024)

---

## Démonstration 

- Saisie d'un calendrier dans SUMARiS ActiFlot

---

### Notes Réunion

- Présents :
  - Emilie Le Roy (MOA/HISSEO)
  - Vincent Badts (MOA/HISSEO)
  - Johann Le Traon (MOA/HISSEO)
  - Vincent Fachéro (MOE/ISI)
  - Caroline Destreez (MOE/CODRA)
  - COUPEAU Yann (Saisisseur/LTBH)
  - GOASCOZ Nicolas (Saisisseur/LTBH)
  - PENELOPE Florian (Saisisseur/BIODIVENV)
  - ESTRIPEAUT Emilie (Saisisseur/BIODIVENV)
  - ROVILLON Georges-Augustin (Saisisseur/BIODIVENV)
  - MARTIN Stephane (Saisisseur/LBH)
  - LE RU Loic (Saisisseur/LBH)
  - CORNILLE Vincent (Saisisseur/LRHBL)
  - LAVENIER Benoit (Dév / EIS)

---

### Retours de présentation 

- Souhaits saisisseur : Eviter trop de clics souris
