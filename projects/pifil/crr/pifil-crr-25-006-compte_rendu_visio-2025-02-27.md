# Compte-rendu réunion visio
## 27/02/2025

Point sur une application de suivi des balises DolphinFREE

---

> Présents :
>
> - Anne CHAUSSE (CNPMEM)
> - Delphine EMON (CNPMEM)
> - Léni GUILLOTIN (CNPMEM)
> - Camille YOUNSI (DGAMPA)
> - Damien LE BOULAIRE (OcTech)
> - Benoît LAVENIER (EIS)
> - Étienne de CHAVAGNAC (EIS)

> Excusés :
>
<!-- .element: class="font-size-extra-small" -->

---

# Bouton Bluetooth

- Donnée vitale
  - Y a-t-il eu capture accidentelle ou non ?
- Moyen
  - Bouton Bluetooth
  - Données envoyées au concentrateur
  - Données récupérées par l'application via le terminal mobile 
- Données collectées
  - Capture
  - Date et heure
  - Espèce capturée
    - En fonction du nombre d'appuis
  - Géolocalisation ?
- Ergonomie
  - Utilisation avec des gants
    - Sensibilité des doigts très atténuée
    - Pas de retour haptique pour le pêcheur
  - Éviter les déclenchements intempestifs
  - Privilégier la position du bouton en cabine
    - Connexion câblée avec le concentrateur
    - Sur le concentrateur ?
    - Utilisation par le capitaine

# Application de suivi des balises

- Données récupérées par le concentrateur à la sortie de l'eau de chaque balise
- Données récupérées par l'application via le terminal mobile
- Privilégier la connexion entre le téléphone et le concentrateur
- Donner la possibilité au téléphone de pouvoir synchroniser les données du concentrateur à la place du concentrateur
  - Le concentrateur ne peut pas, en l'état, faire de roaming sur un réseau étranger
- Ouverture d'un socket pour le téléphone sur le concentrateur

## Consultation des notifications

## Suivi du niveau de batterie

## Gestion des opérations de maintenance 

- Projet RECOPESCA
  - Récupération de données d'activité de pêche et océanographiques
  - Base de données permettant de suivre les équipements
    - Toujours disponible à l'IFREMER
    - Libre de droits
- Nouveau système basé sur RECOPESCA
- Aujourd'hui, la gestion des équipements repose intégralement sur OcTech
- Données
  - Affectation du matériel
    - À un navire
    - À un compte utilisateur
  - Maintenance
    - Mise à jour logicielle
    - Contrôle acoustique
