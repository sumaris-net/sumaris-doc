# Mapping Adagio / Sumaris

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/index.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html

## Utilisateurs, profils et droits

| Specs | Adagio | Sumaris |
| ----- | ------ | ------- |
| Utilisateur | person (first_name, last_name, email, department_fk) | person (first_name, last_name, email, department_fk) |
| Profil | user_profil : <br> ALLEGRO_ADMINISTRATEUR, ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR | user_profile : <br> ADMIN, USER, SUPERVISOR, GUEST (surchargé par énumération) |
| Privilège | program_privilege : <br> Administrateur, Observateur, Consultation intégrale, Validateur, Qualificateur | program_privilege : <br> MANAGER, OBSERVER, VIEWER, VALIDATOR, QUALIFIER (surchargé par énumération) |

Profiles et privilèges utilisés :
- Administrateur de référentiel : profil Administrateur
- Administrateur de programme : profil Administrateur avec privilège Administrateur sur un programme
- Utilisateur : profile Utilisateur avec privilège Observateur sur une observation

Les droits sont gérés au niveau de l'observation.

## Plans d'échantillonnage et lignes de plan

Les stratégies sont reliées au programme PARAM-BIO.
Les données seront par contre rattachées au programmes de collecte correspondants : SIH-OBSVENTE, CAM-*.

| Specs | Adagio |
| ----- | ------ |
| programme (PARAM-BIO) | strategy.program_fk |
| code (AAAA_BIO_XXXX) | strategy.label + strategy.name |
| commentaire | strategy.description |
| EOTP | strategy.analytic_reference |
| laboratoire | strategy2department (program_privilège_fk=Observateur) |
| zones de pêches | applied_strategy.location_fk + program2location (zones en mer / configurables) |
| espèce cible | strategy.reference_taxon_strategy.reference_taxon_fk |
| paramètres à mesurer | pmfm_strategy (acquisition_level_fk=SAMPLE) |
| - poids (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - taille (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - sexe (pmfm) | pmfm_strategy.pmfm_fk |
| - maturité (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - âge (pmfm) | pmfm_strategy.pmfm_fk |
| - type de pièce calcifiée (liste de fractions) | pmfm_strategy.fraction_fk |
| début de la période | non stocké (min applied_period.start_date) |
| fin de la période | non stocké (max applied_period.end_date) |
| trimestres de la période | applied_strategy.applied_period.start_date/end_date (lié à la première zone de pêche) |
| efforts sur le trimestre | applied_strategy.applied_period.acquisition_number (lié à la première zone de pêche) |

> Initialiser PROGRAM2LOCATION_CLASSIFICATION avec zones en mer / zones à terre

> Lorsque les stratégies sont modifiées, mettre à jour PROGRAM.UPDATE_DATE

Liste des évolutions de modèle nécessaires :
- modifier PMFM_STRATEGY.PMFM_FK en nullable
- ajouter les colonnes PMFM_STRATEGY.PARAMETER_FK, MATRIX_FK, FRACTION_FK, METHOD_FK en nullable
- ajouter les colonnes STRATEGY.ANALYTIC_REFERENCE, APPLIED_PERIOD.ACQUISITION_NUMBER
- ajouter la table STRATEGY2DEPARTMENT : lien n-n avec program_privilège_fk (cf program2department)

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/diagram/_12_5_1_eb50347_1207578735308_746618_4801.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html?refid=_17_0_4_2_ece0350_1583488391537_540379_6549

## Observations individuelles

Les données de l'observation sont stockées dans OBSERVED_LOCATION et recopiées dans LANDING avec le navire. Les mesures individuelles sont stockées dans SAMPLE et SAMPLE_MEASUREMENT.

| Specs | Adagio |
| ----- | ------ |
| programme (**SIH-OBSVENTE ?**) | observed_location.program_fk |
|  | landing.program_fk |
|  | sample.program_fk |
| saisisseur | observed_location.recorder_department_fk + recorder_person_fk |
|  | landing.recorder_department_fk + recorder_person_fk |
|  | sample.recorder_department_fk + recorder_person_fk |
|  | sample_measurement.department_fk |
| saisisseurs | observed_location2person |
| ligne de plan (AAAA_BIO_XXXX) | **PMFM ? observed_location.sampling_strata_reference ?** |
| date de prélèvement (sans heure) | **observed_location.start_date_time + observed_location.end_date_time ?** |
|  | landing.landing_date_time |
|  | **sample.sample_date ?** |
| navire | landing.vessel_fk |
| numéro de trait | (uniquement pour les campagnes) |
| lieu d'observation | observed_location.location_fk |
|  | landing.landing_location_fk (seulement si lieu de type port) |
| zones de pêche | non stocké (issu de la stratégie) |
| espèce cible | sample.reference_taxon_fk |
| **présentation** | **?** |
| commentaire | observed_location.comments |
| mesures individuelles (pmfms de la stratégie) |  |
| - code prélèvement (XBL071220MERLMER0001) | **sample.label ?** |
| - code Morse (TitiX00032) | **sample_measurement.alphanumerical_value avec pmfm_fk = ?** |
| - commentaire | sample.comments |
| - poids (liste de pmfm) | sample_measurement.numerical_value avec pmfm_fk = pmfm_strategy.pmfm_fk |
| - taille (liste de pmfm) | sample_measurement.numerical_value avec pmfm_fk = pmfm_strategy.pmfm_fk |
| - autres (pmfm) | sample_measurement.numerical_value/qualitative_value_fk avec pmfm_fk = pmfm_strategy.pmfm_fk |
|  |  |
|  | sample.matrix_fk = 2 (individu) |

> Lorsque les prélèvements sont modifiés, mettre à jour OBSERVED_LOCATION.UPDATE_DATE

Liste des évolutions de modèle nécessaires :
- ajouter la colonne SAMPLE.LANDING_FK en nullable
- [POD] modifier le service qui va chercher les PMFM applicables, pour, à partir des PMFM_STRATEGY, aller chercher (par requêtes) les PMFM qui correspondent

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html?refid=_17_0_4_2_b9302e6_1589364467597_86385_4919