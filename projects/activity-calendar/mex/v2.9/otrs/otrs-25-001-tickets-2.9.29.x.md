# Opus Calendrier d'activité - Ticket OTRS dans la version 2.9.29.x en exploitation

## Versions applicatives 

Application Opus - Calendrier d'activité en production le 20/01/2025

- release actuelle du pod **2.9.29.1**
- release actuelle de l'app **2.9.29.4**
- release corrective : **2.9.29.x**

--- 

## Bonnes pratiques

- Ne pas écrire à harmonie@ifremer.fr si cela ne nécessite pas de suivi par un ticket
- Attention à ne pas doublonner les tickets
- Affecter les tickets aux bonnes personnes 
  - MOA : besoin de réponse sur un comportement
  - MOE : besoin analyse/correction sur bug/limitation
- Ne pas créer de Mantis (suivi par gitlab issue)
- Ajouter en copie Charlène et Soizic dans le suivi des bugs

---

## Saisie dans Opus et arrêt Allegro

> Arrêt de saisie dans Allegro (par contre il faut que les utilisateurs ayant commencé à saisir dans Allegro poussent leur données dans Harmonie)
> De notre côté bascule des données saisies dans Allegro pour affichage dans Opus ( caractéristiques engin)
> Utilisation d'Opus pour tout le monde

---

## Tickets OTRS

| **Number**                                                                             | **Content**                                  | **Priority** | **Nom / Prénom**           | **Comments**                                            | **Status**                                                                                | **Release OpusVal** |
|----------------------------------------------------------------------------------------|----------------------------------------------|--------------|----------------------------|---------------------------------------------------------|-------------------------------------------------------------------------------------------|---------------------|
| [500420](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500420) | Perte du contenu de calendrier               | Urgent       | Evano Hugues               | restauré le 28/01/2025                                  | Résolu                                                                                    | Calendriers dispos  |
| [500520](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500520) | rapport d'avancement/Nb enquêtes directes    | Moyen        | LARRANAGA Soizic           | A analyser et corriger                                  | [bug] Issue [#917](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/917) | Yes                 |
| [500745](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500745) | Filtration navires/Port d'exploitation       | Moyen        | Martin Stéphane            | A implémenter                                           | [enh] Issue [#920](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/920) | No                  |
| [500923](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=500923) | Gradient de profondeur                       | Moyen        | LARRANAGA Soizic           | Comportement normal                                     |                                                                                           |                     |
| [501008](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501008) | Saisie port étranger                         | Faible       | HOURCADE DA COSTA Mallorie | Solution à analyser                                     |                                                                                           |                     |
| [501089](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501089) | Filtre navire AD 804676                      | Urgent       | Le Roy Emilie              | Sans l'indexation ES, le filtre est un peu lent parfois | Prévoir d'activer ES                                                                      |                     |
| [501090](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501090) | Terminer la saisie - incohérence bloquante   | Urgent       | Le Mestre Sophie           | Comportement normal, pas de blocage                     |                                                                                           |                     |
| [501167](https://otrs.ifremer.fr/otrs/index.pl?Action=AgentTicketZoom;TicketID=501167) | gradient zone incohérent                     | Urgent       | Lazard Coline              | Contrôle à mettre en place pour bloquer la saisie ?     |                                                                                           |                     | 

