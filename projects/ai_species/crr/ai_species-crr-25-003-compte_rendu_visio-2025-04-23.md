# Compte-rendu visio E-IS / Sinay
## 23/04/2025

Application de reconnaissance de l'espèce par IA depuis une photo

---

> Présents :
>
> - Johan BOURDAIS (Sinay)
> - Jacques EVERWYN (Sinay)
> - Benoît LAVENIER (EIS)
> - Étienne de CHAVAGNAC (EIS)

<!-- .element: class="font-size-extra-small" -->

---

# Équipe projet

<span style="font-size:x-large">

|                        | <span style="font-size:xx-large">**Sinay**</span> | <span style="font-size:xx-large">**E-IS**</span> |
|:-----------------------|:-------------------------------------------------:|:------------------------------------------------:|
| **Chefs de Projet**    |                  Johan BOURDAIS                   |               Étienne de CHAVAGNAC               |
| **Ingénieurs IA**      |                  Jacques EVERWYN                  |                                                  |
|                        |                  Thomas CARREAU                   |                                                  |
| **Architecte BDD**     |                                                   |                 Benoît LAVENIER                  |
| **Développeurs front** |                                                   |                 Benoît LAVENIER                  |
| **Expert halieutique** |                  Morgan MUYLAERT                  |                                                  |

</span>

Fonctionnement en binômes _**Sinay**_ / _**E-IS**_ pour maximiser l'expérience 

Impliquer Vincent BADTS et les services informatiques de l'_**Ifremer**_ (ISI, ...) 

---

# Répartition des tâches

<span style="font-size:medium">

| Domaine                                        |          Resp.          |               _**Sinay**_                |            _**EIS**_             | _**Ifremer**_ |
|:-----------------------------------------------|:-----------------------:|:----------------------------------------:|:--------------------------------:|:-------------:|
| Pilotage / Coordination projet                 |       _**Sinay**_       |     Mandataire: Coordination / Suivi     |    Coordination / Suivi appli    |               |
| Relation client _**Ifremer**_                  |       _**Sinay**_       |            Contact principal             |        Contact secondaire        |               |
| Développement modèles IA                       |       _**Sinay**_       | Conception / Entraînement / Optimisation |                -                 |               |
| Déploiement / Intégration modèles IA           |       _**Sinay**_       |     Intégration dans infrastructure      |       Support échanges API       |       X       |
| MLOps / Versionnage modèles                    |       _**Sinay**_       |        Mise en place pipelines IA        |                -                 |               |
| Réduction impact environnemental IA            |       _**Sinay**_       |      Méthodologie réduction / Suivi      |                -                 |               |
| Développement application web                  |        _**EIS**_        |   Supervision besoins IA et UX métier    |    Conception / Développement    |               |
| Développement application mobile               |        _**EIS**_        |   Support fonctionnel / Supervision IA   |    Conception / Développement    |               |
| Interopérabilité BDD _**Ifremer**_ (_**SIH**_) |        _**EIS**_        |         Méthodologie données IA          |      Intégration technique       |       X       |
| Sécurité / Hébergement (_**Ifremer**_)         |        _**EIS**_        |          Flux / Déploiements IA          |  Conformité / Intégration LDAP   |       X       |
| Conception IHM (web / mobile)                  |        _**EIS**_        |              Validation IA               |  UX/UI / Ergonomie scientifique  |               |
| Tests modèles IA (unitaires / croisés)         |       _**Sinay**_       |         Organisation / Reporting         | Support validation fonctionnelle |       X       |
| Tests applications (web / mobile)              |        _**EIS**_        |          Coordination tests IA           |  Réalisation tests fonctionnels  |       X       |
| Documentation IA                               |       _**Sinay**_       |                Rédaction                 |                -                 |               |
| Documentation technique applications           |        _**EIS**_        |           Relecture parties IA           |    Rédaction / Structuration     |               |
| Développement API IA                           |                         |                                          |                                  |               |
| Développement API applicatives                 |                         |                                          |                                  |               |
| Livrables finaux (code, modèles, docs)         | _**Sinay**_ / _**EIS**_ |       Livraison modèles IA / docs        |  Livraison applications / docs   |               |

</span>

---

# Conception / Spécification

- API
   - Versionnage 
   - Jeux de données régionalisés
- Modélisation
   - _**UML**_
- API pour déployer ou entraîner un nouveau modèle ?
   - Métadonnées à stocker et à réemployer
- Code source
   - _**GitLab**_ de l'_**Ifremer**_
- Spécification, documentation et comptes-rendus
  - _**Markdown**_
  - _**PlantUML**_

---

# Planning

![Planning](/projects/ai_species/crr/ai_species-crr-25-001-img-01.png)

Durées en mois

Point à la fin de chaque sprint (deux semaines)

---

# Prochains points

## **E-IS / Sinay**

Mardi 7 mai 2025  
11h - 12h

## **Kick-off meeting**

Mercredi 14 mai 2025  
14h - 16h (horaire à confirmer)