# DOLPHINFREE - Nouvelle version 2.9.23.2 

##   Informations sur la version 

Cette version est un prototype, dans le cadre du programme DOLPHINFREE.
Elle est testable sur : https://open-test.sumaris.net

Le but de cette version est de valider l'ergonomie générale de la saisie sous le protocole DOLPHINFREE, de la marée jusqu'à l'arbre d'échantillonnage et des captures accidentelles.

---
## Corrections et améliorations 

Voici les améliorations par rapport aux précédentes versions de SUMARiS :

- Écran Marée :
    - Mise en place du programme DOLPHINFREE

- Écran Opération :
    * Onglet Détails :
      - Ajout du paramètre "Utilisation d'une caméra ?"
      - Changement d'affichage du couple [date,lieu] par une option de programme
      - Ajout des différentes dispositions de filière avec leurs détails associés
      - Ajout de la profondeur de l'engin

    * Onglet Engins :
      - Ajout des types d'engin de pêche
      - Ajout de la composition de la ralingue haute
      - Ajout du diamètre de la ralingue haute
      - Ajout du maillage du filet (étiré)
      - Ajout de la longueur de la filière
      - Ajout de l'équipementier

    * Onglet Captures accidentelles :
      - Ajout des espèces manquantes
      - Ajout des états de décomposition
      - Ajout du paramètre "Maillé ?"
      - Ajout de la distance du pinger le plus proche
      - Ajout du paramètre "Numéro du pinger accessible ?"
      - Ajout du numéro du pinger
      - Ajout du poids de l'individu capturé

---
## Limitations  

- Marée :
    - Le bouton "Terminer la saisie" n'est pas encore fonctionnel.

- Engin :
    - Il manque quelques valeurs au paramètre "Composition de la ralingue haute". Nous allons ajouter :
      ** Polyamide
      ** Polyester
      ** Flex (Mondiet)

- Opération :
    - Mauvais titre pour une opération de filage, si le paramètre "Utilisation d'une caméra ? = Non" et "Utilisation d'un GPS ? = Oui".
    - Saisie du filage en "mode dégradé" : nous allons ajouter une fonctionnalité pour permettre la saisie d'un virage **sans que le filage existe** préalablement.

---
## Comment tester ?   

L'application est testable sur : https://open-test.sumaris.net

- Observateur : obs@sumaris.net / demo

Sur tablette ou ordiphone Android :

- Télécharger et installer le fichier APK :
  - Se rendre sur "https://open-test.sumaris.net" avec votre appareil et cliquer sur "Télécharger" puis installer le fichier téléchargé.
    > /!\ si l'installation ne fonctionne pas, veuillez suivre les étapes sur ce lien : (https://www.frandroid.com/comment-faire/tutoriaux/184151_comment-installer-un-fichier-apk-sur-son-terminal-android#installer-lapk)

- Au lancement, choisir le nœud réseau : `open-test.sumaris.net`. Ou alors : 
  - se rendre dans "Menu > Paramètres" 
  - puis Vérifier si le nœud réseau sélectionné est bien : `open-test.sumaris.net` 
  - s'il n'est pas sélectionné, il faudra choisir parmi la liste déroulante. 

Sur matériel Apple : 
- L'application est encore en cours de déploiement sur l'Apple Store. Nous nous excusons de ce contre temps.

---

## Replay de la dernière démonstration

- [Vidéo de la visio du 11/10/2023](https://www.youtube.com/watch?v=dW0d67LSqBU)
- [Compte-rendu de la visio du 11/10/2023](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/blob/master/projects/pifil/crr/pifil-crr-24-003-compte_rendu_visio-2024-10-11.md?ref_type=heads)

---

##   Remontez vos remarques  

Remontez les anomalies rencontrées :
- par courriel : contact@e-is.pro (avec copie à dorian.marco@e-is.pro)
- sur le portail gitlab Ifremer (inscription nécessaire) : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues

 
Librement, 
L'équipe SUMARiS
