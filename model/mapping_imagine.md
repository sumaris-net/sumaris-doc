# Mapping Adagio / Sumaris

Modèle Adagio : http://www.ifremer.fr/allegro/allegro-uml/html/index.html

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html

## Utilisateurs, profils et droits

| Specs | Adagio | Sumaris |
| ----- | ------ | ------- |
| Utilisateur | person (first_name, last_name, email, department_fk) | person (first_name, last_name, email, department_fk) |
| Profil | user_profil : <br> ALLEGRO_ADMINISTRATEUR, ALLEGRO_UTILISATEUR, ALLEGRO_SUPER_UTILISATEUR | user_profile : <br> ADMIN, USER, SUPERVISOR, GUEST (surchargé par énumération) |
| Privilège | program_privilege : <br> Administrateur, Observateur, Consultation intégrale, Validateur, Qualificateur | program_privilege : <br> MANAGER, OBSERVER, VIEWER, VALIDATOR, QUALIFIER (surchargé par énumération) |
| Droits | ? *observed_location (sampling_strata_fk, location_fk)* <br> ? *observed_location2person (observed_location_fk, program_privilege_fk, person_fk, department_fk)* | ? |

Profiles et privilèges utilisés :
- Administrateur de référentiel : profil Administrateur
- Administrateur de programme : profil Administrateur avec privilège Administrateur sur un programme
- Utilisateur : profile Utilisateur avec privilège Observateur sur une observation

Les droits sont gérés au niveau de l'observation.

## Plans d'échantillonnage et lignes de plan

| Specs | Adagio |
| ----- | ------ |
| 3 programmes (SIH-BIO*) | strategy.program_fk |
| code (AAAA_BIO_XXXX) | strategy.name |
| commentaire | strategy.description |
| EOTP | strategy.project_code |
| laboratoire | strategy.department_fk |
| zones de pêches | applied_strategy.location_fk (zones en mer / configurables) |
| port de débarquement | applied_strategy.location_fk (zones à terre / port) |
| espèce cible | strategy.reference_taxon_strategy.reference_taxon_fk |
| paramètres à mesurer | pmfm_strategy (acquisition_level_fk=SAMPLE) |
| - poids (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - taille (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - sexe (pmfm) | pmfm_strategy.pmfm_fk |
| - maturité (liste de pmfm) | pmfm_strategy.pmfm_fk |
| - âge (pmfm) | pmfm_strategy.pmfm_fk |
| - type de pièce calcifiée (liste de fractions) | pmfm_strategy.fraction_fk |
| incrément de la taille | non stocké (inclus dans le pmfm) |
| début de la période | non stocké (min applied_period.start_date) |
| fin de la période | non stocké (max applied_period.end_date) |
| trimestres de la période | applied_strategy.applied_period.start_date/end_date |
| efforts sur le trimestre | applied_strategy.applied_period.frequency |

Liste des évolutions de modèle nécessaires :
- modifier PMFM_STRATEGY.PMFM_FK en nullable
- ajouter les colonnes PMFM_STRATEGY.PARAMETER_FK, MATRIX_FK, FRACTION_FK, METHOD_FK en nullable
- ajouter les colonnes STRATEGY.DEPARTMENT_FK, STRATEGY.PROJECT_CODE, APPLIED_PERIOD.FREQUENCY
- ajouter un table de gestion de l'historique des modifications (date, comments, old_value, new_value, operation_type: add/del/mod, object_type, object_id)
- [POD] modifier le service qui va chercher les PMFM applicables, pour, à partir de ces PMFM_STRATEGY, aller chercher (par requêtes) les PMFM qui correspondent

Spécifications : https://www.ifremer.fr/sih-resource-private/bargeo/UML/bargeo.html?refid=_17_0_4_2_ece0350_1583488391537_540379_6549

![pmfm_strategy](http://www.ifremer.fr/allegro/allegro-uml/html/index_files/_12_5_1_eb50347_1207578735308_746618_4801.jpg)