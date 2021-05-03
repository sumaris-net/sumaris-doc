# Mapping Adagio / Sumaris

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/index.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html

## Utilisateurs, profils et droits

| Specs | Adagio | Sumaris |
| ----- | ------ | ------- |
| Utilisateur | person (first_name, last_name, email, department_fk) | person (first_name, last_name, email, department_fk) |
| Profil | user_profil : <br/> ALLEGRO_ADMINISTRATEUR, ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR | user_profile : <br/> ADMIN, USER, SUPERVISOR, GUEST (surchargé par énumération) |
| Privilège | program_privilege : <br/> Administrateur, Observateur, Consultation intégrale, Validateur, Qualificateur | program_privilege : <br/> MANAGER, OBSERVER, VIEWER, VALIDATOR, QUALIFIER (surchargé par énumération) |

Profiles et privilèges utilisés :
- Administrateur de référentiel : profil Administrateur (ALLEGRO_ADMINISTRATEUR)
- Administrateur de programme : profil Superviseur (ALLEGRO_SUPER_UTILISATEUR) avec privilège Administrateur sur un programme
- Utilisateur : profile Utilisateur (ALLEGRO_UTILISATEUR) avec privilège Observateur sur une observation

Les droits sont gérés au niveau de l'observation.

## Plans d'échantillonnage et lignes de plan

Les stratégies sont reliées au programme PARAM-BIO.
Les données seront par contre rattachées au programmes de collecte correspondants : SIH-OBSVENTE, CAM-*.

| Specs | Adagio |
| ----- | ------ |
| programme (SIH-PARAM-BIO) | strategy.program_fk |
| code (AAAA-BIO-XXXX) | strategy.label + strategy.name + strategy.description + pmfm_strategy.pmfm_fk (acquisition_level_fk=LANDING) |
| commentaire | strategy.comments |
| EOTP | strategy.analytic_reference |
| laboratoire | strategy2department (program_privilège_fk=Observateur) |
| zones de pêches | applied_strategy.location_fk + program2location (zones en mer / configurables) |
| espèce cible | strategy.reference_taxon_strategy.reference_taxon_fk |
| paramètres à mesurer | pmfm_strategy (acquisition_level_fk=SAMPLE) |
| - code Morse (pmfm) | pmfm_strategy.pmfm_fk (ajouté automatiquement mais pas affiché) |
| - poids (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - taille (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - sexe (pmfm) | pmfm_strategy.pmfm_fk (=196)|
| - maturité (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - âge (pmfm) | pmfm_strategy.pmfm_fk (=2269)|
| - type de pièce calcifiée (liste de fractions) | pmfm_strategy.fraction_fk |
| Année | applied_strategy.applied_period.start_date : lié à la première zone de pêche. Il n'y a pas de persistance à proprement parler, c'est juste un affichage en prenant l'année du premier trimestre qu'on trouve (il y en a forcément au moins 1, sinon la ligne de plan ne peut pas être créée) |
| trimestres de la période | applied_strategy.applied_period.start_date/end_date (lié à la première zone de pêche) |
| effort planifié sur le trimestre | applied_strategy.applied_period.acquisition_number (lié à la première zone de pêche) |
| effort réalisé sur le trimestre | nombre de landing avec landing_measurement.alphanumerical_value = strategy.label et landing_date_time entre applied_period.start_date et applied_period.end_date

> Initialiser PROGRAM2LOCATION_CLASSIFICATION avec zones en mer / zones à terre

> Lorsque les stratégies sont modifiées, mettre à jour PROGRAM.UPDATE_DATE

Liste des évolutions de modèle nécessaires :
- modifier PMFM_STRATEGY.PMFM_FK en nullable
- ajouter les colonnes PMFM_STRATEGY.PARAMETER_FK, MATRIX_FK, FRACTION_FK, METHOD_FK en nullable
- ajouter les colonnes STRATEGY.ANALYTIC_REFERENCE, APPLIED_PERIOD.ACQUISITION_NUMBER
- ajouter la table STRATEGY2DEPARTMENT : lien n-n avec program_privilège_fk (cf program2department)
- ajouter la colonne STRATEGY.COMMENTS en nullable

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/diagram/_12_5_1_eb50347_1207578735308_746618_4801.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html?refid=_17_0_4_2_ece0350_1583488391537_540379_6549

## Observations individuelles

Les données de l'observation sont stockées dans OBSERVED_LOCATION et recopiées dans LANDING avec le navire. Les mesures individuelles sont stockées dans SAMPLE et SAMPLE_MEASUREMENT.

| Specs | Adagio |
| ----- | ------ |
| **Observation** |  |
| programme (**SIH-PARAM-BIO**) | observed_location.program_fk |
| *- recopié de observed_location* | landing.program_fk |
| *- recopié de observed_location* | sample.program_fk |
| saisisseur | observed_location.recorder_department_fk + recorder_person_fk |
| *- recopié de observed_location* | landing.recorder_department_fk + recorder_person_fk |
| *- recopié de observed_location* | sample.recorder_department_fk + recorder_person_fk |
| *- recopié de observed_location* | sample_measurement.department_fk |
| saisisseurs | observed_location2person |
| date de prélèvement (sans heure) | observed_location.start_date_time + observed_location.end_date_time |
| *- recopié de observed_location* | landing.landing_date_time |
| *- recopié de observed_location* | sample.sample_date |
| lieu d'observation | observed_location.location_fk |
| *- recopié de observed_location* | landing.landing_location_fk (seulement si lieu de type port) |
| **Débarquement** |  |
| ligne de plan (AAAA-BIO-XXXX) | landing_measurement.alphanumerical_value avec pmfm_fk = ? |
| navire | landing.vessel_fk |
| numéro de trait | (uniquement pour les campagnes) |
| port de débarquement | landing.landing_location_fk (lieux de type port uniquement) |
| zones de pêche | non stocké (issu de la stratégie) |
| espèce cible | sample.reference_taxon_fk (par défault : strategy.reference_taxon_strategy.reference_taxon_fk) |
| commentaire | landing.comments |
| **Mesures individuelles** (pmfms de la stratégie) |  |
| - code prélèvement (XBL071220MERLMER0001) | sample.label |
| - commentaire | sample.comments |
| - code Morse (TitiX00032) | sample_measurement.alphanumerical_value avec pmfm_fk = pmfm_strategy.pmfm_fk |
| - poids (liste de pmfm) | sample_measurement.numerical_value avec pmfm_fk = pmfm_strategy.pmfm_fk |
| - taille (liste de pmfm) | sample_measurement.numerical_value avec pmfm_fk = pmfm_strategy.pmfm_fk |
| - autres (pmfm) | sample_measurement.numerical_value/qualitative_value_fk avec pmfm_fk = pmfm_strategy.pmfm_fk |
|  |  |
|  | landing.rank_order = 1 |
|  | sample.matrix_fk = 2 (individu) |

> Lorsque les prélèvements sont modifiés, mettre à jour OBSERVED_LOCATION.UPDATE_DATE

Liste des évolutions de modèle nécessaires :
- ajouter la colonne SAMPLE.LANDING_FK en nullable
- [POD] modifier le service qui va chercher les PMFM applicables, pour, à partir des PMFM_STRATEGY, aller chercher (par requêtes) les PMFM qui correspondent

Modèle Adagio :
- OBSERVED_LOCATION : http://www.ifremer.fr/allegro/allegro-uml/html/diagram/_17_0_4_2_7d60262_1389018854224_287800_6931.html
- LANDING : http://www.ifremer.fr/allegro/allegro-uml/html/diagram/_15_5_1_eb50347_1225730050904_747257_7340.html
- SAMPLE : http://www.ifremer.fr/allegro/allegro-uml/html/diagram/_12_5_1_eb50347_1207578736105_286575_6103.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html?refid=_17_0_4_2_b9302e6_1589364467597_86385_4919
