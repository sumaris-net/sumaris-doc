# DOLPHINFREE - Recette

## Présentation démo 

##   Informations sur la version   ----

Cette version est un prototype, dans le cadre du programme DOLPHINFREE.
Elle est testable sur : https://open-test.sumaris.net

Le but de cette version est de valider l'ergonomie générale de la saisie sous le protocole DOLPHINFREE, de la marée jusqu'à l'arbre d'échantillonnage et des captures accidentelles.
----   Corrections et améliorations  ----

Voici les améliorations par rapport aux précédentes versions de SUMARiS :

- Écran Marée :
    -[ ] Mise en place du programme DOLPHINFREE

- Écran Opération :
    * Onglet Détails:
      -[ ] Ajout du paramètre "Utilisation d'une caméra?"
      -[ ] Changement d'affichage du couple [date,lieu] par une option de programme
      -[ ] Ajout des différentes dispositions de filière avec leurs détails associés
      -[ ] Ajout de la profondeur de l'engin

    * Onglet Engins :
      -[ ] Ajout des types d'engin de pêche
      -[ ] Ajout de la composition de la ralingue haute
      -[ ] Ajout du diamètre de la ralingue haute
      -[ ] Ajout du maillage du filet (étiré)
      -[ ] Ajout de la longueur de la filière
      -[ ] Ajout de l'équipementier

    * Onglet Captures accidentelles :
      -[ ] Ajout des espèces manquantes
      -[ ] Ajout des états de décomposition
      -[ ] Ajout du paramètre "Maillé ?"
      -[ ] Ajout de la distance du pinger le plus proche
      -[ ] Ajout du paramètre "Numéro du pinger accessible?"
      -[ ] Ajout du numéro du pinger
      -[ ] Ajout du poids de l'individu capturé

----   Limitations  ----

- Marée :
    -[ ] Onglet Détails : le paramètre "Utilisation d'un GPS ?" devrais être masquer lorsque que l'on choisi "Oui" sur le paramètre "Utilisation d'une caméra ?". Ceci sera corriger par la suite.
- Engin :
    -[ ] La composition de la ralingue haute ne propose pas les choix suivant qui seront ajoutés par la suite:
      ** Polyamide
      ** Polyester
      ** Flex (Mondiet)
    -[ ] Le contrôle de saisie n'est pas fonctionnel. Cela corriger par la suite.
    -[ ] Le contrôle de fin de saisie n'est pas fonctionnel. Cela sera corriger par la suite.
    -[ ] Le label affiché dans les opérations de filage, lorsque le paramètre "Utilisation d'un GPS ?" est à faux et "Utilisation d'une caméra?" est à vrai, est incorrecte. Cela sera corriger par la suite
  

----   Comment tester ?   ----

L'application est testable sur : https://open-test.sumaris.net

- Administrateur : admin@sumaris.net / admin
- Observateur : obs@sumaris.net / demo
- Superviseur  : demo@sumaris.net / demo

Sur tablette ou ordiphone Android :

- Télécharger et installer le fichier APK :
  - Se rendre sur "https://open-test.sumaris.net" avec votre appareil et cliquer sur "Télécharger" puis installer le fichier téléchargé.
   
- Au lancement, choisir le nœud réseau : 
  - Se rendre dans les paramètres 
  - Vérifier si le nœud réseau "open-test.sumaris.net" est présent dans la liste des nœuds réseaux proposés
    - s'il n'est pas présent, il faudra saisir manuellement "https://open-test.sumaris.net". 

Sur matériel Apple : 
- L'application est en cours de déploiement. 

----   Remontez vos remarques   ----

Remontez les anomalies rencontrées :
- sur le portail gitlab Ifremer (inscription nécessaire) : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues


Librement,
L'équipe SUMARiS