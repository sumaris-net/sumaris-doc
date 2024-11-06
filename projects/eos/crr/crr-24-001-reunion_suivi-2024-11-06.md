# Réunion de suivi
### 06/11/2024

> Présents :
>
> - Thomas BARREAU
> - Benoit LAVENIER

Prochaine réunion : **à planifier fin décembre** - [lien visio](https://meet.evolix.org/sumaris-mnhn-eis-2024)

---
# Organisation / planning

Le MNHN a fourni une [liste des besoins](projects/eos/doc/Liste_besoin_EOS.docx) pour l'application EOS.

EIS doit maintenant fournir un devis (d'ici fin décembre) pour les mettre en oeuvre dans SUMARiS.  


---
# Spécifications - Référentiels

- 3 plans d'échantillonnage
- Navire : Référentiel SIH Ifremer - synchroniser
- Notion de `Type de Navire` (différent du SIH Ifremer) : 
  - `Côtier` (1j de mer), `semi-hauturier` (2-3j), `hauturier` (< 3j)
  - Utiliser ensuite car le tri terrain est différent entre les types de navire
  - EIS indique que le tri pourrait aussi être construit à partir des dernières données saisies (sur une fenêtre glissante) 
- Lien espèces commerciales criée vers l'Espèce FAO
  - ex: espèce `SYC` vendue en criée avec le code `SCL` (=genre)
- Espèces scientifiques "chondrichtyen" 
  - ~ 140 occurrences
  - à rapprocher du SIH Ifremer
- Combinaison sexe/maturité : 
  - Mj - Mâle juvenile
  - Ma - Mâle adulte
  - F  - Femelle
  - I  - Indéterminé
- Gamme de taille : 
  - Relation espèce scientifique / catégorie / min/max
    - Pour l'initialisation de la grille de bouton de mensuration
    - Mesure au cm
    - On affiche 20 unités (configurable)
    - Pas contraignant (on peut passer aux 20 unités suivantes/précédentes)
- Type de mesure
  - Parfois plusieurs mesures pour une même espèce
- Taille max / espèce
- Taille maximale en fonction de la maturité des mâles
  - EIS: à voir si on peut ajouter la maturité dans le référentiels des min/max par espèces 

- Référentiel "protocole" :
  - En fonction du groupe d'espèce (~6) : 
    - Affichage potentiellement d'une image explicative,
    - Affichage d'une documentation (par exemple rédigée en markdown)
- Référentiel des `Tare`
  - Par criée et type de caisse, le poids de la tare
  - EIS propose d'utiliser les données historiques, sur une fenêtre glissante (par exemple sur 3 mois),
    pour alimenter ce référentiel au fur et à mesure.

---
# Spécifications - Saisie 

- Sortie : RAS
- Navire : Voir pour l'ajout, si tous les champs sont nécessaires
- Vente : RAS
- Échantillon : possibilité de rendre la photo obligatoire (ex: PETS)

---
# Spécifications - Autres

- Rendre inaccessible les données validées, après mois (option de programme)
- Reprise des données historiques (BDD Access)

---
# Actions

- Semaine 50 - MNHN (Thomas BARREAU) - Envoyer la BDD Access (anonymisée) 
- Semaine 52 - EIS (Benoit LAVENIER) - Fournir un devis fin décembre 2024

---
## Liens

Liens utiles :
* Visio : https://meet.evolix.org/sumaris-mnhn-eis-2024
* Anomalies et évolutions 
  * GitLab : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues
* Documentation
  * Général (SUMARiS) : https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc
  * Lien projet : https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-doc/-/tree/master/projects/eos
  

