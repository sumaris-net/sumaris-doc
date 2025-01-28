# Compte-rendu réunion visio
## 20/01/2025

Point sur la récupération des données avec OcTech / Ifremer / EIS

---

> Présents :
>
> - Camille YOUNSI (DGAMPA)
> - Emilie LEBLOND (Ifremer)
> - Glenn PRIGENT (Ifremer)
> - Nolwenn RANNOU (Ifremer)
> - Damien LE BOULAIRE (OcTech)
> - Benoit LAVENIER (EIS)
<!-- .element: class="font-size-extra-small" -->

---
# Données OcTech

- Type de données : 
  - Horodatage : très important pour le rapprochement des données
  - La balise se met à l'heure à chaque remontée de plongée
    - À voir si le concentrateur peut détecter l'offset de la balise et corriger les heures fournies
      (plutôt que d'exclure les données).
      OcTech pense que c'est faisable.   
- API Influx BD 
  - Identifiant unique du navire
  - Ping ou non, date/heure
- API pour requêter le concentrateur en Bluetooth :
  - OCtech indique que c'est possible 
- Autonomie d'une balise : 
  - Un mois par balise
  - 4h de charge (par recommandé en mer)
- App : pourrait générer des notifications de changement de batterie **en avance** en phase (avant la fin d'autonomie - par ex la semaine d'avant)

---
# Actions

- OcTech met en place une base de tests (API Influx DB)
- OcTech réfléchit à une solution API bluetooth depuis le concentrateur, pour connecter l'App directement et notifier le pêcheur en temps réel
