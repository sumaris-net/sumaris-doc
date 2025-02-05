# Opus Calendrier d'activité - Ticket OTRS dans la version 2.9.29.x en exploitation

## Versions applicatives 

Application Opus - Calendrier d'activité en production le 20/01/2025

- release actuelle du pod **2.9.29.1**
- release actuelle de l'app **2.9.29.4**
- release corrective : **2.9.29.x**

--- 

## Bonnes pratiques

- Ne pas écrire à harmonie@ifremer.fr si cela ne nécessite pas de suivi par un ticket
  - Passer par le formulaire de remonter d'incident
- Attention à ne pas doublonner les tickets
- Affecter les tickets aux bonnes personnes 
  - MOA : besoin de réponse sur un comportement
  - MOE : besoin analyse/correction sur bug/limitation
- Ne pas créer de Mantis (suivi par gitlab issue)

Workflow des tickets du guichet Opus Activité -> Assistance 1 SISMER -> Exploitation (Xavier) -> MOA (Emilie) -> MOE (Vincent) -> Equipe Dév.

![ui-workflow](/projects/activity-calendar/mex/v2.9/otrs/images/guichet-workflow.svg)

---

## Saisie dans Opus et arrêt Allegro

> Arrêt de saisie dans Allegro (par contre il faut que les utilisateurs ayant commencé à saisir dans Allegro poussent leur données dans Harmonie)
> 
> De notre côté bascule des données saisies dans Allegro pour affichage dans Opus ( caractéristiques engin)
> 
> Utilisation d'Opus pour tout le monde

---

## Tickets OTRS

| **Number**                                                                             | **Content**                                | **Priority** | **Nom / Prénom**           | **Comments**                                                  | **Status**                                                                                | **Release OpusVal 2.9.30**                               |
|----------------------------------------------------------------------------------------|--------------------------------------------|--------------|----------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------|
| [500420](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500420) | Perte du contenu de calendrier             | Urgent       | Evano Hugues               | restauré le 28/01/2025                                        | Done                                                                                      | Pas de suppression OK. Bug - Généralités pas mise à jour |
| [500520](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500520) | rapport d'avancement/Nb enquêtes directes  | Moyen        | LARRANAGA Soizic           | A analyser et corriger                                        | [bug] Issue [#917](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/917) | Yes - Corrigé                                            |
| [500745](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500745) | Filtration navires/Port d'exploitation     | Moyen        | Martin Stéphane            | Filtre sera appliqué sur le ou les ports des années N-1 et N. | [enh] Issue [#920](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/920) | 2.9.30.1                                                 |
| [500923](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500923) | Gradient de profondeur                     | Moyen        | LARRANAGA Soizic           | Comportement normal                                           | Nothing to do                                                                             | -                                                        |
| [501008](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501008) | Saisie port étranger                       | Faible       | HOURCADE DA COSTA Mallorie | Solution à analyser                                           | Paramétrage de la zone de compétence                                                      | Implémenté                                               |
| [501089](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501089) | Filtre navire AD 804676                    | Urgent       | Le Roy Emilie              | Sans l'indexation ES, le filtre est un peu lent parfois       | Prévoir d'activer ES                                                                      | ES activé                                                |
| [501090](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501090) | Terminer la saisie - incohérence bloquante | Urgent       | Le Mestre Sophie           | Comportement normal, pas de blocage                           | Nothing to do                                                                             | -                                                        |
| [501167](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501167) | gradient zone incohérent                   | Urgent       | Lazard Coline              | Contrôle à mettre en place pour bloquer la saisie ?           | [bug] Issue [#923](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/923) | Waiting                                                  | 
| [501123](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501123) | formulaire vierges                         | Faible       | LARRANAGA Soizic           | A corriger                                                    | [bug] Issue [#923](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/922) | 2.9.30.1                                                 | 
| [501701](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501701) | Bug Opus Activité - Urgent - Nina CHOQUET - Message d'erreur                          | Urgent       | Nina CHOQUET          | A corriger                                                    | [bug] Issue [#923](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/922) | 2.9.30.1                                                 |
| [501806](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501806) | Opus Activité données caractéristiques engins                         | Urgent       | LARRANAGA Soizic           | A corriger                                                    | [bug] Issue [#923](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/922) | 2.9.30.1                                                 |
| [501914](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501914) | Pb d'authentification OPUS                          | Urgent       | Pascale FOSSECAVE           | En cours d'analyse                                            | [bug] Issue [#923](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/922) | 2.9.30.1                                                 | 

