# Réunion de suivi
### 25/04/2023

> Présents :
>
> - Glenn PRIGENT (Ifremer)
> - Benoit LAVENIER (EIS)

Prochaine réunion : jeudi 27/04/23 à 10h - [lien visio](https://rendez-vous.renater.fr/ifremer_harmonie)

---
# Organisation / planning

En raison des congés et de contretemps rencontrés lors des mises en production d'autres volets (voir plus bas), EIS a eu des difficultés pour consacrer du temps à Imagine.

- Intervention prévue initialement du 17/04 au 28/04
- Décalée du 24/04 au 11/05

---
# Tickets P0 à traiter (1/2)


- [ ] Gestion des saisies en g/kg (https://youtrack.ifremer.fr/issue/Obsbio-20)
- [ ] Sample table: option pour désactiver la génération des TAG_ID depuis la BDD, et reprendre celle de la ligne précédente (https://youtrack.ifremer.fr/issue/Obsbio-62)
- [ ] Modifier la couleur orange des efforts quand trop d'efforts ont été réalisés sur un trimestre, sur le fond gris des colonnes "Efforts T1" et "Efforts T3" c'est difficile à lire (https://youtrack.ifremer.fr/issue/Obsbio-83)
- [ ] Les efforts de tous les trimestres (passés, courant, futurs) doivent toujours être modifiables, même s'il y a des échantillonnages associés (https://youtrack.ifremer.fr/issue/Obsbio-48)
- [ ] Gestion des droits utilisateurs (A COMPLETER)
 
---
# Tickets P0 à traiter (2/2)

- [ ] Filtrage des sorties (https://youtrack.ifremer.fr/issue/Obsbio-89)
- [ ] Par ligne de plan
- [ ] Par identifiant d’échantillon
- [ ] Créer sortie ou échantillonnage à partir de l’interface des lignes de plan (https://youtrack.ifremer.fr/issue/Obsbio-90 , cf. OBSBIO-10)
- [ ] Nœud de connexion (https://youtrack.ifremer.fr/issue/Obsbio-84)

---
# Tickets P1 à traiter

Priorité 1 :
- [ ] Ajout des efforts campagnes dans l’interface (https://youtrack.ifremer.fr/issue/Obsbio-17)
- [ ] Définir le PSFM de l'âge en fonction du type de pièces calcifiées sélectionnées
- [ ] La liste des zones doit avoir les mêmes valeurs que celle sur les lignes de plan
- [ ] Les maturités "Maturity scale SMSF", "Maturité sexuelle WKMSGAD 9 stades" et "Maturité sexuelle Poissons osseux" sont dans la colonne "Autre"
- [ ] Supprimer l'option programme "Sortie > Débarquements : Unité du poids"

---
# Avancement des autres volets (1/2)

Pour information, voici un récapitulatif des tâches réalisées pour les autres volets :

- **Éditions de rapports dynamiques** pour les marées (test de sélectivité pour APASE) et pour les sorties (LPDB) :
  * Possibilité de partager des rapports via un lien de partage (avec données embarquées dans un fichier JSON)
  * Assemblage de rapports entre eux (par exemple, le rapport de sortie inclut ceux des débarquements/échantillonnages)
  * Utilisation des extractions en ligne comme sources de données (élévation des lots à la volée si nécessaire)

---
# Avancement des autres volets (2/2)
Correction de bugs sur la saisie depuis un arbre d'échantillonnage (test de sélectivité pour APASE) 
- Extractions : évolutions demandées pour APASE (l'equipe Ifremer sous-traite à une société externe le traitement des données)
- Connexion à l'ichtyomètre Bluetooth (modèle Gwaleen de la société Aptatio - en attente de notre retour) : 
  - RAF : 4 à 5j. 
  - En pause, pour se consacrer à Imagine.

---
## Liens

Liens utiles :
* Visio : https://rendez-vous.renater.fr/ifremer_harmonie
* Anomalies et évolutions 
  * YouTrack : https://youtrack.ifremer.fr
  * GitLab : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Documentation
  * Général (SUMARiS) : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  

