# Restitution des données
## Spécifications

---
## Documents fournis

- Exemple de restitution : [exemple_sortie_test_selectivité](/projects/apase/doc/apase-doc-exemple_sortie_test_selectivité.docx) (docx);
- Cahier des charges : [sortie_test_selectivité_v3](/projects/apase/doc/apase-doc-sortie_test_selectivité-v3.docx) (docx);
- Bordereaux papier d'une marée (CAPS)
 
---
## Besoins (1/2)

- _Qui lance la restitution ?_
   * Observateurs 
     * Filtrer par navire / dates / strate sélectivité
   * Superviseurs 
     * Filtrer par strate sélectivité (cf liste des critères plus bas)
- _Pour qui ?_ 
  * À destination des pros
- _Quand ?_ 
  * Observateur : à chaque marée, y compris en mer (mode terrain)
  * Superviseur : à la demande, depuis un poste de travail (mode bureau)

---
## Besoins (2/2)

- Formats de sortie :
  * Observateurs : Visualisation HTML (pour montrer au pro. sur la tablette)
  * Superviseurs : Pouvoir faire des copier/coller HTML en mode bureau
  * Pouvoir partager un rapport via un lien (**non prioritaire**)

---
## Sélection des données 

- Pouvoir filtrer par
    * `navires / dates / strate sélectivité`
    * ou `strate sélectivité / navires / dates`
      * + `espèce` (non prioritaire) 

- Pouvoir  
  * Pouvoir regrouper les OPE par dispositif sélectif (pour les chaluts simples notamment).
  * Pouvoir inclure/exclure des OPE
  * Pouvoir inclure/exclure des espèces (**non prioritaire**) 

---
## Contenu de la restitution (1/2)

- Voir les critères de sélection (info navires, dates, etc)
- Voir le tableau des navires

---
## Contenu de la restitution (2/2)
- Graphiques, par espèce :
  * Mensuration sur la capture totale 
    * -> maquette OK
    * RAF: élévation des données, taille limite de débarquement / espèce
  * Comparaison standrd/sélectif -> maquette OK
  * `BoxPlot` -> **maquettage en cours**

---
## Test logiciel

 - Pour tester les restitutions :
   * EIS a besoin d'un jeu de données **de référence**
   * Par exemple sur 3 marées
   * Et les graphiques associés

 
---
## Actions

- EIS : valider la faisabilité du BoxPlot
- EIS : valider le cacher des charges "Ex_sortie_test_selectivité_APASE_v3" 
- EIS : réalisation l'élévation des données dans l'App

---
## Historique des modifications

|       Date | Section modifiées                                                  |
|-----------:|--------------------------------------------------------------------|
| 25/04/2022 | Création                                                           |
| 09/05/2022 | MAJ suite réunion de suivi                                         |
| 07/06/2022 | Définition des acteurs et besoins. Relecture du cahier des charges |
| 18/10/2022 | Ajour paragraphe "Contenu de la restitution"                       |
