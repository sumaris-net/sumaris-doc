# Activity Calendar - Recette MOA sur la démo 2 

## Présentation démo 2 MOA 

- [Présentation](/projects/activity-calendar/not/not-24-003-activity-calendar-refonte-demo-moa-2.9.19.md)

---

## Retours de recette MOA (Emilie Le Roy)

### Calendrier d'activité 
- [Spécifications](/projects/activity-calendar/spe/collecte_de_donnees.md#calendriers-dactivité)
- Remarques  :
  - [ ]  Le filtre "année" affiche "vide" au lieu de 2024 (année qui s'affiche quand j'ouvre le calendrier).
    - [ ] le filtre "vide" affiche l'année N-1 au lieu de tout afficher

**Rappel Spécifications** : 
- Le filtre de l'année est automatiquement renseignée avec l'année :
    * N-1, sur pc
    * N, sur tablette

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-001-2.9.19.2-annee-vide.png)

### Calendrier d'activité > Général
- [Spécifications](/projects/activity-calendar/spe/collecte_de_donnees.md#calendrier-dactivité--général)
- Evolutions :
  - Menu contextuel
    - [ ] Supprimer à la place de Vider

  - Champs :
    - [ ] Enquête éco ? : oui/non, non modifiable => pas affiché
    - [ ] Enlever hauteur du filet #634
    - [ ] pour toutes les caractéristiques, dans le champs de saisie, pas nécessaire de mettre [code-libellé] : le libellé suffit.
    Sinon, ça créé des doublons et le code du PSFM (s'il existe) n'est pas utilisé. C'est plutôt une réponse à une question.

### Calendrier d'activité > Navire
- [Spécifications](/projects/activity-calendar/spe/collecte_de_donnees.md#calendrier-dactivité--navire)
- Evolutions :
  - [ ] Photos : A masquer car non requis pour la V1

#### Tableau "Caractéristiques navire"
  - Evolutions :
    - [X] Marquage extérieur => par défaut, supprimer cette colonne
    - [ ] Longueur hors tout (m) => à mettre après port d'exploitation
    - [X] Indicatif radio (IRCS) => n'apparaît plus mais c'est mieux ainsi (vu en visio démo)
    - [X] Port d'attache : code - libellé => il y a écrit "port d'exploitation" mais c'est mieux ainsi (vu en visio démo), à mettre après FPC
      FPC => apparaît après le nom, c'est mieux ainsi (vu en visio démo)
    - [ ] L'en-tête du tableau "Armateurs" contient les éléments suivants => tous les éléments sont affichés mais il n'y a pas de données


### Calendrier d'activité > Rapports
- [Spécifications](/projects/activity-calendar/spe/collecte_de_donnees.md#calendrier-dactivité--rapports)
- Anomalies :
  - [ ] Toutes les données sont présentes dans le rapport sauf la qualification de l'enquête. Mais il manque la ligne rouge sous caractériqtiques engins.
  - [ ] Imprimer :  le format est portrait par défaut, je ne peux pas basculer en paysage et donc le rapport est tronqué. cf pj	

![rec-activity-calendar-report](/projects/activity-calendar/rec/images/rec-24-001-2.9.19.2-impression.png)	