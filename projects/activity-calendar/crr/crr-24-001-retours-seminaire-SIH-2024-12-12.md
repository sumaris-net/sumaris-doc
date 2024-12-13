# Retours formation séminaire SIH - Opus Calendrier d'activité
### 12/12/2024

> Présents :
> Environ 30 participants

> Déroulé
> Présentation MOE de la gestion de projet
> Présentation MOA de l'application
> Présentation MOE du manuel utilisateur
> Saisi libre par les utilisateurs

> Condition d'utilisation
> Dégradée : réseau instable, perte de connexion VPN

---

# Retours

- [bug] Erreur de sauvegarde si la zone de pêche n'est pas renseigné : Erreur Oracle : cannot insert null - [#872](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/872)
  - Exemple : Copier/Coller d'une prédoc avec la zone de pêche en dehors de la zone de compétence
    - zone de pêche non copiée et erreur Oracle à la sauvegarde
    - Solution : Lors de la copie d'un calendrier de la prédoc, mettre un message si pb de régionalisation et bloquer la sauvegarde
    
```
2024-12-12 09:52:02,720 DEBUG [http-nio-8080-exec-8] org.hibernate.SQL                          - insert into SIH2_ADAGIO_DBA_SUMARIS_MAP.fishing_area (depth_gradient_fk, distance_to_coast_gradient_fk, gear_use_features_fk, location_fk, nearby_specific_area_fk, operation_fk, qualification_comments, qualification_date, quality_flag_fk, sale_fk, vessel_use_features_fk, id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
2024-12-12 09:52:02,722 WARN  [http-nio-8080-exec-8] o.h.engine.jdbc.spi.SqlExceptionHelper     - SQL Error: 1400, SQLState: 23000
2024-12-12 09:52:02,722 ERROR [http-nio-8080-exec-8] o.h.engine.jdbc.spi.SqlExceptionHelper     - ORA-01400: impossible d'insérer NULL dans ("SIH2_ADAGIO_DBA"."FISHING_AREA"."LOCATION_FK")
ORA-06512: à "SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_FISHING_AREA", ligne 12
ORA-04088: erreur lors d'exécution du déclencheur 'SIH2_ADAGIO_DBA_SUMARIS_MAP.TR_FISHING_AREA'
```

- [bug] Bug du double clique sur un calendrier : Retour à l'accueil (pas systématique) - [#864](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/864)

- [bug] Le control Z est souvent désactivé comme le bouton réinitialisé - [#865](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/865)
  - Reproduit

- [bug] Parfois dans le filtre des QIM, la valeur n'est pas conservée - Ticket à créer ?
  - Problème réseau ?
  - Timeout côté app ?

- [bug] Bugs sur 2 PC sur Chrome dans l'url avec rechargement continu de la page
  - Cause : rafraichissement du à une nouvelle version, mais la version (en alpha) n'a pas été bien parsé, et le rafraichissement échoue, et boucle encore
  - Solution : Ouvrir la console développeur > Aller dans Appli > Supprimer la base de données sumaris

- [enh] Sur un calendrier, afficher tous les commentaires liés au navire - [#866](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/866)
  - Import : Prévoir la copie du commentaire du calendrier N-1 vers le calendrier N 
  - Requête SQL : recopier du commentaire du calendrier N-1 vers le calendrier N

- [bug] Dans le cas d'un copié-collé de plusieurs colonnes vers la gauche, seule la 1ere colonne est collée - [#867](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/867)

- [bug] Avec un pc en heure de Guadeloupe, le calendrier affiche 13 mois sur une année - [#868](https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/868)
  - Bug sur le fuseau horaire de la guadeloupe (UTC +04:00)

- [bug] Warning "!" affichés sur certains en-têtes de mois mais pas sur d'autres 
  - A tester

- [bug] Bug sur la régionalisation liée à la zone proche, je ne sais pas si c'est juste un pb sur l'avertissement (cellule en jaune-orangé) ou sur les valeurs affichées dans la liste déroulante - https://gitlab.ifremer.fr/sih-public/sumaris/sumaris-app/-/issues/869

- [bug] Prédoc d'un palangrier réunionnais qui travaille au large de La Réunion et également dans les ZEE non française.
  - Il y a des warning sur les gradients de côte "étranger" dans la prédoc.
  - Le point embêtant, c'est qu'on ne peut pas les copier dans le calendrier, il faut les retaper un par un.
  - MOE : Attente vérification
