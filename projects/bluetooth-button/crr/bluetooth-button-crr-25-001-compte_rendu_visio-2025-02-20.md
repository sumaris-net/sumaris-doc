# Compte-rendu réunion visio
## 20/02/2025

Point sur un bouton Bluetooth multi-projets pour l'IFREMER

---

> Présents :
>
> - Vincent BADTS (IFREMER)
> - Benoît LAVENIER (EIS)
> - Étienne de CHAVAGNAC (EIS)

<!-- .element: class="font-size-extra-small" -->

---

# Bouton Bluetooth pour diverses applications IFREMER

## Besoins

- Bouton
- Caractéristiques

| Caractéristique | Impératif | Facultatif |
|:----------------|:---------:|:----------:|
| Bluetooth       |     X     |            |
| Sur batterie    |           |     X      |
| Étanche         |     X     |            |
| Anti-choc       |           |     X      |
| Bracelet        |           |     X      |
| Fixation murale |           |     X      |
| Autre fixation  |           |     X      |

La question se pose  

## Éléments du commerce

### Minew B10 : Bouton d'urgence intelligent

[Site produit](https://www.minew.com/product/b10-smart-emergency-button/)  

#### Caractéristiques

| Caractéristique             | Valeur                                                                       |
|:----------------------------|:-----------------------------------------------------------------------------|
| Taille                      | ⌀38 x 10 mm (corps principal)                                                |
|                             | 270 x 41 x 11 mm (étui à bracelet)                                           |
|                             | 47 x 40 x 11 mm (étui suspendu)                                              |
| Batterie                    | Batterie au lithium polymère                                                 |
| Capacité de la batterie     | 100 mAh                                                                      |
| Poids                       | 11 g (corps principal)                                                       |
|                             | 30 g (étui à bracelet)                                                       |
|                             | 22 g (étui suspendu)                                                         |
| Couleur                     | Noir & Rouge                                                                 |
| Plage de fonctionnement     | Température: -20°C ~ +50°C                                                   |
|                             | Humidité: 50 ±20% HR                                                         |
| Micrologiciel de l'appareil | [iBeacon](https://en.wikipedia.org/wiki/IBeacon) (Défaut)                     |
|                             | [Eddystone](https://en.wikipedia.org/wiki/Eddystone_(Google)) (Défaut)       |
|                             | [Mesh](https://en.wikipedia.org/wiki/Bluetooth_mesh_networking) (Facultatif) |
|                             | OTA (Facultatif)                                                             |
| Imperméable                 | IP66                                                                         |
| Capteur intégré             | Accéléromètre                                                                |
| Portée de diffusion         | Jusqu'à 100 m                                                                |

#### Prix

15 $   
[Site marchand](https://www.minewstore.com/product/b10-smart-emergency-button)

#### Vidéo

[Unboxing B10 Smart Emergency Button](https://www.youtube.com/watch?v=e6EtlShCMAc)  
[How to Add Smart Devices to Minew TagCloud](https://www.youtube.com/watch?v=e7j2whupIDQ)

#### SDK

_**BeaconSET Plus**_  
[Guide de développement](https://docs.minew.com/Android/Android_BeaconPlus_Software_Development_Kit_Guide.html)  
[Android](https://docs.minew.com/Android/Android_BeaconPlus_Software_Development_Kit_Guide.html)  
[iOS](https://docs.minew.com/iOS/iOS_BeaconPlus_Software_Development_Kit_Guide.html)

#### Application
_**BeaconSET Plus**_  
[Android](https://play.google.com/store/apps/details?id=com.minew.beaconplus)  
[iOS](https://apps.apple.com/fr/app/beaconset-plus/id1264548636)

#### Avantages et inconvénients

| Avantages             | Inconvénients                                               |
|:----------------------|:------------------------------------------------------------|
| Prix                  | Résistance ?                                                |
| SDK Android           | Obligation de passer par un système / réseau propriétaire ? |
| SDK iOS               |                                                             |
| Batterie rechargeable |                                                             |

### MOKOSmart Balise de casque H7

[Site produit](https://www.mokosmart.com/mokosmart-h7-helmet-beacon/)

#### Prix

10 $   
[Site marchand](http://store.mokosmart.com/shop/bluetooth-beacon/personnel-tag-emergency-button/h7-helmet-tag/)

#### Caractéristiques

| Caractéristique                        | Valeur                                                                                      |
|:---------------------------------------|:--------------------------------------------------------------------------------------------|
| Dimensions (L x l x h)                 | 57.4 x 41.4 x 18.7 mm                                                                       |
| Modèle de batterie                     | CR3032                                                                                      |
| Capacité de la batterie                | 550mAh                                                                                      |
| Durée de vie de la batterie par défaut | Jusqu'à 5 ans sur les paramètres par défaut, mais le capteur G à 3 axes ne sera pas présent |
|                                        | Jusqu'à 2 ans sur les paramètres par défaut où la détection de mouvement est active 24/7    |
| Batterie remplaçable                   | Oui                                                                                         |
| Plage de transmission maximale         | 150 mètres dans les zones ouvertes                                                          |
| Étanche                                | Oui                                                                                         |
|                                        | IP67                                                                                        |
| Protocoles                             | Eddystone                                                                                   |
|                                        | iBeacon                                                                                     |
|                                        | (TLM, URL, UID)                                                                             |
| Mise à jour du firmware                | Nordic DFU OTA                                                                              |
|                                        | J-Link                                                                                      |
| Méthode de fixation                    | Brassard                                                                                    |
|                                        | Adhésif                                                                                     |
| Capteur intégré                        | 3-capteur accéléromètre d'axe                                                               |
| Certifications (Europe)                | CE-EMC                                                                                      |
|                                        | CE-RED                                                                                      |
|                                        | CE-LVD                                                                                      |
|                                        | RoHS                                                                                        |
|                                        | REACH                                                                                       |

#### Documentation

[Documentation](https://www.mokosmart.com/wp-content/uploads/2023/01/H7-Helmet-Beacon-Product-Brief_V1.0_20211128.pdf)

#### Vidéo

[H7 Helmet BLE Beacon for Tunnels, Mining & Construction Site](https://www.youtube.com/watch?v=bfuTKZ3UWQg)

#### Application

_**BeaconX Pro**_  
[Android](https://play.google.com/store/apps/details?id=com.moko.beaconxpro)  
[iOS](https://apps.apple.com/cn/app/beaconx-pro/id1478861755)

_**MK Tag**_  
[Android](https://play.google.com/store/apps/details?id=com.moko.bxp.tag)  
[iOS](https://apps.apple.com/cn/app/mk-tag/id6443744839)

_**MK Button**_  
[Android](https://play.google.com/store/apps/details?id=com.moko.bxp.button)  
[iOS](https://apps.apple.com/cn/app/mk-button/id1630904337)

_**MK PIR**_  
[Android](https://play.google.com/store/apps/details?id=com.moko.pirsensor)  

#### Avantages et inconvénients

| Avantages | Inconvénients |
|:----------|:--------------|
| Prix      | Sur pile ?    |

### MOKOSmart Balise de casque H7L

[Site produit](https://www.mokosmart.com/helmet-tag-h7l/)

#### Prix

8 $   
[Site marchand](http://store.mokosmart.com/shop/bluetooth-beacon/personnel-tag-emergency-button/h7-lite-helmet-tag/)

#### Caractéristiques

| Caractéristique               | Valeur                                  |
|:------------------------------|:----------------------------------------|
| Connectivité                  | BLE 5.0                                 |
| Dimensions (L x l x h)        | 42.6 x 25.2 x 8.3 mm                    |
| Couleur                       | Corps - blanc                           |
|                               | Bouton - Bleu (couleur personnalisable) |
| Matière                       | PC+TPU                                  |
| Poids                         | 8.7 g                                   |
| Classe IP                     | IP67                                    |
| Capteur                       | Accéléromètre                           |
|                               | Buzzer                                  |
| Capacité de la batterie       | 220 mAh                                 |
|                               | Batterie remplaçable                    |
| Durée de vie de la batterie   | 3 ans                                   |
| Température de fonctionnement | -20°C à +60°C                          |
| Gamme de transmission         | 150 m (Aire dégagée sans obstacles)     |
| Fixation                      | Adhésif 3M                              |
| Certification                 | FCC                                     |
|                               | CE                                      |
|                               | RoHS                                    |
|                               | REACH                                   |
|                               | Bluetooth                               |

#### Documentation

[Documentation](https://www.mokosmart.com/wp-content/uploads/2023/04/H7-Lite-Product-Brief.pdf)

#### Avantages et inconvénients

| Avantages | Inconvénients |
|:----------|:--------------|
| Prix      | Sur pile      |

### Tag d'identification Série H8

[Site produit](https://www.mokosmart.com/h8-driver-identification-tag/)

#### Prix

8 $   
[Site marchand](http://store.mokosmart.com/shop/bluetooth-beacon/personnel-tag-emergency-button/h8-identification-tag/)

#### Caractéristiques

| Caractéristique                        | H8                                     | H8R                                          |
|:---------------------------------------|:---------------------------------------|:---------------------------------------------|
| Dimensions                             | 36.0 x 56.0 x 7.3 mm                   | 36.0 x 56.0 x 7.7 mm                         |
| Connectivité                           | BLE 5.0                                | BLE 5.0                                      |
| Couleur                                | Noir                                   | Noir                                         |
| Matériel                               | ABS                                    | ABS                                          |
| Indice IP                              | IP65                                   | IP67                                         |
| Capacité de la batterie                | 220 mAh                                | 80 mAh                                       |
|                                        | Pile CR2032                            | Rechargeable                                 |
|                                        | Remplaçable                            |                                              |
| Durée de vie de la batterie            | 1 an (Mode publicitaire *)             | 4 mois par charge (Mode publicitaire *)      |
|                                        | 10 mois (Mode de connexion long *)     | 3 mois par charge (Mode de connexion long *) |
| Accéléromètre                          | Optionnel                              | Optionnel                                    |
| Buzzer                                 | 65 dB                                  | 85dB                                         |
| Moteur de vibration                    | Non                                    | Optionnel                                    |
| LED                                    | 1 x LED rouge monochromatique          | 1 x LED RVB                                  |
| Enregistrement de l'événement d'alarme | Non                                    | 500 par groupe                               |
| Température de fonctionnement          | -20°C ~ +60 °C                         | -20°C ~ +60 °C                               |
| Plage de transmission                  | 150 m (en zone ouverte sans obstacles) | 150 m (en zone ouverte sans obstacles)       |
| Installation                           | Cordon                                 | Cordon                                       |
| Certification                          | FCC                                    | FCC                                          |
|                                        | CE                                     | CE                                           |
|                                        | RoHS                                   | RoHS                                         |
|                                        | REACH                                  | REACH                                        |
|                                        | Bluetooth                              | Bluetooth                                    |

#### Documentation

[Documentation](https://www.mokosmart.com/wp-content/uploads/2025/02/H8-Series-Identification-Tag.pdf)

#### Vidéo

[H8 Driver Identification Tag - Fleet Safety, Driver Connection](https://www.youtube.com/watch?v=4bQ6iR24x3w)

#### Avantages et inconvénients

| Avantages          | Inconvénients |
|:-------------------|:--------------|
| Prix               | Sur pile (H8) |
| Sur batterie (H8R) | Résistance?   |

### Balise de bracelet Bluetooth W6

[Site produit](https://www.mokosmart.com/mokosmart-w6-bluetooth-wristband-beacon/)

#### Prix

11 $   
[Site marchand](http://store.mokosmart.com/shop/bluetooth-beacon/personnel-tag-emergency-button/w6-wristband-tag/)

#### Caractéristiques

| Caractéristique                                                                                | Valeur                                                                                         |
|:-----------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| Dimensions (L x l x h)                                                                         | 48.9mm x 41.7mm x 12mm                                                                         |
| Intervalle                                                                                     | Jusqu'à 150 mètres (492 pieds) dans les zones ouvertes                                         |
| Type de batterie                                                                               | Pile au lithium CR2032                                                                         |
| Capacité de la batterie                                                                        | 220 mAh                                                                                        |
| Durée de vie de la batterie par défaut                                                         | Jusqu'à 13 mois                                                                                |
| Remplacement de la batterie                                                                    | Oui                                                                                            |
| Mise à jour du firmware                                                                        | OTA                                                                                            |
| Type d'antenne                                                                                 | Circuit imprimé (PCB)                                                                          |
| Capteurs                                                                                       | Accéléromètre 3 axes Mifare Classic 1k EV1 RFID                                                |
| LED                                                                                            | 1 x LED rouge                                                                                  |
| Matériel                                                                                       | ABS + PC & TPU                                                                                 |
| Norme Bluetooth                                                                                | Bluetooth 5.1                                                                                  |
| Couleur                                                                                        | Peut être personnalisé                                                                         |
| Conditions environnementales                                                                   | Température de fonctionnement: -20°C/ +60°C                                                    |
| Température de stockage: -20°C/ +60°C( batterie non installée) 10°C/ 25°C (batterie installée) | Température de stockage: -20°C/ +60°C( batterie non installée) 10°C/ 25°C (batterie installée) |
| Humidité: 0% - 95% (sans condensation)                                                         | Humidité: 0% - 95% (sans condensation)                                                         |
| Protocoles                                                                                     | Eddystone                                                                                      |
|                                                                                                | iBeacon                                                                                        |
|                                                                                                | (URL, TML et UID)                                                                              |
| Installation                                                                                   | Cordon                                                                                         |
|                                                                                                | Bracelet                                                                                       |
|                                                                                                | Porte-clés                                                                                     |
|                                                                                                | Suspendu                                                                                       |
| Étanche                                                                                        | IP67                                                                                           |
| Bouton                                                                                         | Bouton mécanique                                                                               |
| Puce principale utilisée                                                                       | Nordic nRF52811                                                                                |
| Certification (Europe)                                                                         | RoHS                                                                                           |
|                                                                                                | CE-RED                                                                                         |
|                                                                                                | CE-LVD                                                                                         |
|                                                                                                | REACH                                                                                          |
|                                                                                                | CE-EMC                                                                                         |

#### Documentation

[Documentation](https://www.mokosmart.com/wp-content/uploads/2023/01/W6-Wristband-Beacon-Product-Brief-V1.1_210914.pdf)

#### Vidéo

[Main Applications of W6 Wearable Bluetooth Beacon](https://www.youtube.com/watch?v=8474cmUL5KM)

#### Avantages et inconvénients

| Avantages | Inconvénients |
|:----------|:--------------|
|           |               |
|           |               |

## Autres sociétés

### Feasycom

[https://www.feasycom.com](https://www.feasycom.com)

#### Filiale américaine

14931 SE 43rd Street Suite 100  
Bellevue, WA 98006, United States  
[+1 206 218 8071](tel:+12062188071)  
[support@feasycom.com](mailto:support@feasycom.com)

### Agence Blue Net Beacon (BNB)

[https://www.bnbeacon.com](https://www.bnbeacon.com)

#### Siège social

Blue Net Beacon  
Groupe Digistem  
39, rue des Granges Galand  
37 550 Saint-Avertin  
FRANCE  
[+33 (0)9 70 46 31 40](tel:+33970463140)  
[+33 (0)6 95 89 52 37](tel:+33695895237)  
[contact@bnbeacon.com](mailto:contact@bnbeacon.com)