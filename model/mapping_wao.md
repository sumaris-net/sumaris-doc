# Mapping WAO / Sumaris

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/index.html

## Plans d'échantillonnage et lignes de plan

Le but est d'intégrer les lignes de plan stockées actuellement dans WAO dans la base de données.

Historiquement, le plan d'échantillonnage était importé dans les tables :
- `Programme de rattachement` : SAMPLING_SCHEME
- `Ligne de plan` : SAMPLING_STRATE

Il semble possible de les stocker également via les `Strategies`


| Colonne WAO               | Colonne SUMARiS              | Questions                                 |
|---------------------------|------------------------------|-------------------------------------------|
| Code de la ligne          | Strategy.label               |                                           |
| Programme de rattachement | Strategy.analyticReference ? | A valider - WS ?                          |
| Société                   | StrategyDepartment #0        | Ajouter `StrategyDepartment.rankOrder` ?  |
| Société secondaire        | StrategyDepartment #1        | Ajouter `StrategyDepartment.rankOrder` ?  |

TODO: BLA a compléter