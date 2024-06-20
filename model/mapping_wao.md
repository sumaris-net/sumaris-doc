# Mapping WAO / Sumaris

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/index.html

## Plans d'échantillonnage et lignes de plan

Le but est d'intégrer les lignes de plan stockées actuellement dans WAO dans la base de données.

Historiquement, le plan d'échantillonnage était importé dans les tables :
- `Programme de rattachement` : SAMPLING_SCHEME
- `Ligne de plan` : SAMPLING_STRATE

Il semble possible de les stocker également via les `Strategies`


| Colonne WAO                                                                                                            | Colonne SUMARiS                   | Questions                                                                                                     |
|------------------------------------------------------------------------------------------------------------------------|-----------------------------------|---------------------------------------------------------------------------------------------------------------|
| Code de la ligne                                                                                                       | Strategy.label, name, description |                                                                                                               |
| Programme de rattachement                                                                                              | Strategy.analyticReference ?      | A valider - WS ?                                                                                              |
| Société                                                                                                                | StrategyDepartment #0             | Ajouter `StrategyDepartment.rankOrder` ?                                                                      |
| Sociétés secondaires                                                                                                   | StrategyDepartment #1             | Ajouter `StrategyDepartment.rankOrder` ? NR pour ObsVentes                                                    |
| Strate                                                                                                                 | Strategy                          | Ajouter nouvelle colonne ?                                                                                    |
| Type de campagne                                                                                                       | PMFM                              | Standard, Ciblée, Exploratoire. Uniquement Standard pour ObsVentes. Créer PMFM et QUALITATIVE_VALUE associées |
| Lieu des sorties                                                                                                       | ?                                 | Texte libre, Façade maritime en 2024                                                                          |
| Lieu de vente                                                                                                          | Applied_strategy.location_fk      |                                                                                                               |
| Type de lieu                                                                                                           | _                                 | Criée, Port, Criée et ses ports alentours                                                                     |
| Autre(s) info(s)                                                                                                       | Strategy.comments                 | A fusionner avec le commentaire ?                                                                             |
| Début                                                                                                                  | Applied_period.start_date         |                                                                                                               |
| Fin                                                                                                                    | Applied_period.end_date           |                                                                                                               |
| Exclusions métiers                                                                                                     | ?                                 | Toujours utilisé ? /!\ Référentiel métier différent entre WAO et Harmonie                                     |
| Effort d'observation en nombre de sorties [réalisé/planifié] ou [validé/planifié] trimestre courant et suivant + total | Applied_period.acquisition_number |                                                                                                               |
| Horaires habituels                                                                                                     | PMFM                              | Créer PMFM (valeur alphanumérique)                                                                            |
| Nb. d'observateurs minimal                                                                                             | PMFM                              | Créer PMFM (valeur numérique)                                                                                 |
| Type de sortie                                                                                                         | PMFM                              | Classique ou Courte. Créer PMFM et QUALITATIVE_VALUE associées                                                |
| Commentaire                                                                                                            | Strategy.comments                 |                                                                                                               |
                                                                                                                                     


TODO: BLA a compléter