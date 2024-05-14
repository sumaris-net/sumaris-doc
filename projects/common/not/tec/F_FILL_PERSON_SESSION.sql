
-- CREATE GLOBAL TEMPORARY TABLE "SIH2_ADAGIO_TEST_VFACHERO"."TEMP_PERSON_SESSION_VESSEL" 
-- (
-- ...
-- ) ON COMMIT DELETE ROWS ;

-- test avec CREATE TABLE "SIH2_ADAGIO_TEST_VFACHERO"."TEMP_PERSON_SESSION_VESSEL_2" + commit pour conserver les données 

create or replace FUNCTION                 F_FILL_PERSON_SESSION
(
  P_PERSON_FK IN number,
  P_SKIP_LONG_DURATION IN NUMBER DEFAULT 1
)
RETURN SYS_REFCURSOR AS

  MAX_DURATION_IN_MS constant number(19) := 30000;

  -- types de privilèges
  -- gestion des programmes/stratégies
  PRIVILEGE_MANAGER constant number(10) := 1;
  
  -- saisie
  PRIVILEGE_RECORDER constant number(10) := 2;
  
  -- validation
  PRIVILEGE_VALIDATOR constant number(10) := 4;

  -- les constantes relatives aux navires 
  -- programme SIH par défaut
  VESSEL_DEFAULT_PROGRAM constant varchar2(30) := 'SIH';
  
  -- navires de pêche professionnels
  VESSEL_TYPE_PRO constant number(10) := 1;
  
  -- navires informels : pirogues, etc…)
  VESSEL_TYPE_INFORMAL constant number(10) := 5;
  
  -- navires scientifiques
  VESSEL_TYPE_SCIENTIFIC constant number(10) := 8;

  -- les types de données
  -- calendriers d’activités  
  CALENDAR_OBJ_TYPE constant varchar2(30) := 'ACTIVITY_CALENDAR'; 
  
  -- marées
  FISHING_TRIP_OBJ_TYPE constant varchar2(30) := 'OBSERVED_FISHING_TRIP';
  
  -- enquêtes engins
  PHYS_GEAR_SURVEY_OBJ_TYPE constant varchar2(30) := 'PHYSICAL_GEAR_SURVEY';
  
  -- ventes
  SALE_OBJ_TYPE constant varchar2(30) := 'OBSERVED_SALE';
  
  -- campagnes scientifiques
  SCIENT_CRUISE_OBJ_TYPE constant varchar2(30) := 'SCIENTIFIC_CRUISE';
  
  -- Débarquement observé
  OBSERVED_LANDING_OBJ_TYPE constant varchar2(30) := 'OBSERVED_LANDING';
  
  -- Lieu observé
  OBSERVED_LOCATION_OBJ_TYPE constant varchar2(30) := 'OBSERVED_LOCATION';

  PROJECT_TEAM_MEMBER_PROFILE constant number(10) := 3;
  YEAR_SPAN_FOR_PTM number(10) := 15;
  YEAR_SPAN_DEFAULT constant number(10) := 3;

  session_id number(10);
  hibernate_result sys_refCursor;
  previous_fill_duration NUMBER(19);
  time_1   NUMBER(19);
  
  -- Types de données 
  -- ACTIVITY_CALENDAR : calendriers d’activités  
  -- OBSERVED_FISHING_TRIP : marées
  -- PHYSICAL_GEAR_SURVEY : enquêtes engins 
  -- OBSERVED_SALE : ventes 
  -- SCIENTIFIC_CRUISE :  campagnes scientifiques
  -- OBSERVED_LANDING : Débarquement observé 
  -- OBSERVED_LOCATION : Lieu observé

  CURSOR cur(V_YEAR_SPAN_FOR_PTM number) is

      WITH
			-- Récupération des stratégies sur les programmes et les types de données
			-- SIH-OBSMER-AUTO-ECH-CABILLAUD			Démarrage le 01/01/2014			OBSERVED_FISHING_TRIP
			-- SIH-OBSMER								OBSMER démarrage le 01/01/2019	OBSERVED_FISHING_TRIP
			-- SIH-OBSMER-AUTO-ECH-CABILLAUD			Démarrage le 01/01/2017			OBSERVED_FISHING_TRIP
			-- SIH-OBSMER-AUTO-ECH-CABILLAUD-BALTIQUE	Démarrage le 01/01/2019			OBSERVED_FISHING_TRIP
			-- SIH-OBSMER-AUTO-ECH-MERLAN-BLEU			Démarrage le 01/01/2019			OBSERVED_FISHING_TRIP
			-- SIH-OBSMER-SENTINELLE					Démarrage le 01/01/2019			OBSERVED_FISHING_TRIP	
			-- ...			
            program_object_types as
                (select distinct
                  p.code,
                  s.name,
                  pmfm_s.acquisition_level_fk
                from program p
                  inner join strategy s
                    on p.code = s.program_fk
                  inner join pmfm_strategy pmfm_s
                    on pmfm_s.strategy_fk = s.id
                 where pmfm_s.acquisition_level_fk in (
                      CALENDAR_OBJ_TYPE,
                      FISHING_TRIP_OBJ_TYPE,
                      PHYS_GEAR_SURVEY_OBJ_TYPE,
                      SALE_OBJ_TYPE,
                      SCIENT_CRUISE_OBJ_TYPE,
                      OBSERVED_LANDING_OBJ_TYPE
                    )
                ),
				
			-- Récupération des droits de la personne P_PERSON_FK (PERSON) sur les programmes (PROGRAM_FK) et leur types de données (OBJECT_TYPE_FK)
			-- person_fk  in (2311) 
			-- ID 		PERSON	PROGRAM_FK		LOCATION_FK 	READ_VESSEL READ_DATA   WRITE_DATA  VALIDATE_DATA	OBJECT_TYPE_FK
			-- 871		2311	SIH-OBSMER			NULL			1			1			1			1				OBSERVED_FISHING_TRIP
			-- 2855		2311	SIH-OBSMER			NULL			1			1			1			1				OBSERVED_FISHING_TRIP
			-- 2847		2311	SIH-OBSMER			NULL			1			1			1			1				OBSERVED_FISHING_TRIP
			-- 11007	2311	SIH-OBSVENTE		NULL			1			1			1			1				OBSERVED_SALE
			-- 2001		2311	SIH-OBSMER			NULL			1			1			1			1				OBSERVED_FISHING_TRIP
            person_program_privilege as
                (select distinct
                  case
                    when p2p.reference_person_fk is not null then ref_p2p.id
                    when p2p.reference_person_fk is null then p2p.id
                  end as id,
                  p2p.person_fk as person,
                  p2p.program_fk,
                  case
                    when p2p.reference_person_fk is not null then ref_p2p.location_fk
                    when p2p.reference_person_fk is null then p2p.location_fk
                  end as location_fk,
                  1 as read_vessel,
                  1 as read_data,
                  case
                    when p2p.program_privilege_fk = PRIVILEGE_VALIDATOR or p2p.program_privilege_fk = PRIVILEGE_RECORDER then 1
                    when p2p.program_privilege_fk <> PRIVILEGE_VALIDATOR and p2p.program_privilege_fk <> PRIVILEGE_RECORDER then 0
                  end as write_data,
                  case
                    when p2p.program_privilege_fk = PRIVILEGE_VALIDATOR then 1
                    when p2p.program_privilege_fk <> PRIVILEGE_VALIDATOR then 0
                  end as validate_data,
                  pot.acquisition_level_fk as object_type_fk
                from program2person p2p
                  inner join program_object_types pot
                    on p2p.program_fk = pot.code
                  left join program2person ref_p2p
                    on p2p.reference_person_fk = ref_p2p.person_fk
                      and p2p.program_fk = ref_p2p.program_fk
                      and ref_p2p.reference_person_fk is null
                      and ref_p2p.program_privilege_fk <> PRIVILEGE_MANAGER
                where p2p.person_fk = p_person_fk
                      and p2p.program_privilege_fk <> PRIVILEGE_MANAGER
                      and (p2p.reference_person_fk is null	
                          or ref_p2p.id is not null)
                ),


			-- Récupération des droits d'une personne P_PERSON_FK d'un service pour un programme particulier
			-- aucun resultat en BDD de TEST
			-- 1 entrée dans program2department : departement OFIMER (303), lieu Bordeaux, program_FK OFIMER (aucune personne rattachée à ce département)
            department_program_privilege as
                (select p2d.id,
                  p.id as person,
                  p2d.program_fk,
                  p2d.location_fk,
                  1 as read_vessel,
                  1 as read_data,
                  case
                    when p2d.program_privilege_fk = PRIVILEGE_VALIDATOR or p2d.program_privilege_fk = PRIVILEGE_RECORDER then 1
                    when p2d.program_privilege_fk <> PRIVILEGE_VALIDATOR and p2d.program_privilege_fk <> PRIVILEGE_RECORDER then 0
                  end as write_data,
                  case
                    when p2d.program_privilege_fk = PRIVILEGE_VALIDATOR then 1
                    when p2d.program_privilege_fk <> PRIVILEGE_VALIDATOR then 0
                  end as validate_data,
                  pot.acquisition_level_fk as object_type_fk
                from program2department p2d
                  inner join program_object_types pot
                    on p2d.program_fk = pot.code
                  inner join person p
                    on p.department_fk = p2d.department_fk
                where p.id = p_person_fk
                      and p2d.program_privilege_fk <> PRIVILEGE_MANAGER
                ),


			-- Exception d'inclusion de personne/programme sur des navires
            included_exceptions as
              (select p2pe.program2person_fk as p2p_id,
                  p2pe.vessel_fk
                from program2person_exception p2pe
                where p2pe.is_exclude = 0
              ),
			 -- Exception d'exclusion de personne/programme sur des navires
            excluded_exceptions as
              (select p2pe.program2person_fk as p2p_id,
                  p2pe.vessel_fk
                from program2person_exception p2pe
                where p2pe.is_exclude = 1
              ),
			 
			-- Compte le nombre d'exception d'inclusion 		 
            count_inclusions as
              (select ex_in.program2person_fk as p2p_id,
                    count(ex_in.program2person_fk) as inc_nb
                from program2person_exception ex_in
                where ex_in.is_exclude = 0
                group by ex_in.program2person_fk
              ),


			-- Recuperation de la période et du lieu d'immatriculation des navires
            vessel_by_parent_location as
              (select vrp.vessel_fk,
                  vrp.start_date_time,
                  vrp.end_date_time,
                  loc_h.parent_location_fk
                from vessel v
                  inner join vessel_registration_period vrp
                    on vrp.vessel_fk = v.code
                  inner join location_hierarchy loc_h
                    on loc_h.child_location_fk = vrp.registration_location_fk
                where
                    v.program_fk = VESSEL_DEFAULT_PROGRAM
                    and v.vessel_type_fk in (VESSEL_TYPE_PRO, VESSEL_TYPE_INFORMAL, VESSEL_TYPE_SCIENTIFIC)
              ),


			-- Jointure entre person_program_privilege / vessel_by_parent_location sur location_fk ou vessel_fk pas dans excluded_exceptions
			-- Récuperation des privileges des programmes / navires / stratégies sur les programmes (sans exclusion) 
            privileges_by_location as
            (SELECT ppp.program_fk,
                    ppp.read_vessel,
                    ppp.read_data,
                    ppp.write_data,
                    ppp.validate_data,
                    ppp.object_type_fk,
                    vbpl.vessel_fk as vessel,
                    vbpl.start_date_time,
                    vbpl.end_date_time
              FROM person_program_privilege ppp
                INNER JOIN vessel_by_parent_location vbpl
                  ON ppp.location_fk = vbpl.parent_location_fk
              WHERE ppp.location_fk IS NOT NULL
                AND vbpl.vessel_fk IS NOT NULL
                AND vbpl.vessel_fk not in (select ex.vessel_fk
                                            from excluded_exceptions ex
                                            where ex.p2p_id = ppp.id)
            ),


			-- Récuperation des privileges des programmes / navires / types de données (avec les inclusions des exceptions)
            privileges_by_inc_exceptions as
            (SELECT ppp.program_fk,
                    max(ppp.read_vessel) as read_vessel,
                    max(ppp.read_data) as read_data,
                    max(ppp.write_data) as write_data,
                    max(ppp.validate_data) as validate_data,
                    ppp.object_type_fk,
                    ex.vessel_fk as vessel,
                    min(vrp.start_date_time) as start_date_time,
                    max(nvl(vrp.end_date_time,to_date('01-01-2100','DD-MM-YYYY'))) as end_date_time
              FROM person_program_privilege ppp
                INNER JOIN included_exceptions ex
                  ON ppp.id = ex.p2p_id
                LEFT OUTER JOIN vessel_registration_period vrp
                  ON vrp.vessel_fk = ex.vessel_fk
              GROUP BY ex.vessel_fk,
                      ppp.program_fk,
                      object_type_fk,
                      ppp.location_fk
            ),

			-- Récuperation des privileges des programmes / navires / types de données sans lieu (sans inclusions et absents des exceptions)
            privileges_no_location as
            (SELECT ppp.program_fk,
                  max(ppp.read_vessel) as read_vessel,
                  max(ppp.read_data) as read_data,
                  max(ppp.write_data) as write_data,
                  max(ppp.validate_data) as validate_data,
                  ppp.object_type_fk,
                  vrp.vessel_fk as vessel,
                  min(vrp.start_date_time) as start_date_time,
                  max(nvl(vrp.end_date_time,to_date('01-01-2100','DD-MM-YYYY'))) as end_date_time
            FROM person_program_privilege ppp
                LEFT OUTER JOIN count_inclusions ci
                  ON ci.p2p_id = ppp.id,
                vessel_registration_period vrp
                inner join vessel v
                  on vrp.vessel_fk = v.code
                    and v.program_fk = VESSEL_DEFAULT_PROGRAM
                    and v.vessel_type_fk in (VESSEL_TYPE_PRO, VESSEL_TYPE_INFORMAL, VESSEL_TYPE_SCIENTIFIC)
            WHERE ppp.location_fk IS NULL
              AND (ci.inc_nb IS NULL OR ci.inc_nb = 0)
              AND vrp.vessel_fk not in (select ex.vessel_fk
                                          from excluded_exceptions ex
                                          where ex.p2p_id = ppp.id)
            GROUP BY vrp.vessel_fk,
                    ppp.program_fk,
                    object_type_fk
            ),

			-- Récuperation des privileges par service des programmes / navires / stratégies sur les programmes 
			-- les droits portent uniquement sur le couple [programme de collecte / lieu]. Il n’y a pas de personne(s) supervisée(s), ni de gestion d’exceptions d’inclusion/exclusion de navires.
            privileges_by_department as
            (SELECT dpp.program_fk,
                    dpp.read_vessel,
                    dpp.read_data,
                    dpp.write_data,
                    dpp.validate_data,
                    dpp.object_type_fk,
                    vbpl.vessel_fk as vessel,
                    vbpl.start_date_time,
                    vbpl.end_date_time
              FROM department_program_privilege dpp
                INNER JOIN vessel_by_parent_location vbpl
                  ON dpp.location_fk = vbpl.parent_location_fk
              WHERE dpp.location_fk IS NOT NULL
                AND vbpl.vessel_fk IS NOT NULL
            ),

			-- On regroupe tous les privileges
            privileges_union as
            (SELECT * FROM privileges_by_location
            UNION ALL
            SELECT * FROM privileges_by_inc_exceptions
            UNION ALL
            SELECT * FROM privileges_no_location
            UNION ALL
            SELECT * FROM privileges_by_department
            )

	  -- Récupération des privilèges sur le tuple vessel / program / types de données
      SELECT session_id,
            pu.vessel as vessel_fk,
            max(pu.read_vessel) as read_vessel,
            max(pu.read_data) as read_data,
            max(pu.write_data) as write_data,
            max(pu.validate_data) as validate_data,
            pu.program_fk,
            pu.object_type_fk,
            pu.start_date_time as unique_sdt,
            min(greatest(pu.start_date_time, to_date('01-01-'||(extract(year from sysdate)-decode(up.user_profil_fk, PROJECT_TEAM_MEMBER_PROFILE, V_YEAR_SPAN_FOR_PTM, YEAR_SPAN_DEFAULT)), 'DD-MM-YYYY'))) as start_date_time,
			-- si pu.end_date_time is NULL alors end_date_time = 01-01-2100
            max(nvl(pu.end_date_time, to_date('01-01-2100','DD-MM-YYYY'))) as end_date_time
      FROM privileges_union pu
        LEFT JOIN PERSON2USER_PROFIL up
          ON up.person_fk = p_person_fk
		  -- up.user_profil_fk = ALLEGRO_SUPER_UTILISATEUR
          AND up.user_profil_fk = PROJECT_TEAM_MEMBER_PROFILE
      WHERE pu.end_date_time is null
	    -- si up.user_profil_fk = ALLEGRO_SUPER_UTILISATEUR alors date debut privilege >= (01-01-current_year - 15 ans), sinon >= (01-01-current_year - 3 ans)
	    OR pu.start_date_time >= to_date('01-01-'||(extract(year from sysdate)-decode(up.user_profil_fk, PROJECT_TEAM_MEMBER_PROFILE, V_YEAR_SPAN_FOR_PTM, YEAR_SPAN_DEFAULT)), 'DD-MM-YYYY')
            OR (pu.end_date_time > to_date('01-01-'||(extract(year from sysdate)-decode(up.user_profil_fk, PROJECT_TEAM_MEMBER_PROFILE, V_YEAR_SPAN_FOR_PTM, YEAR_SPAN_DEFAULT)), 'DD-MM-YYYY')
                AND pu.start_date_time <= to_date('01-01-'||(extract(year from sysdate)-decode(up.user_profil_fk, PROJECT_TEAM_MEMBER_PROFILE, V_YEAR_SPAN_FOR_PTM, YEAR_SPAN_DEFAULT)), 'DD-MM-YYYY')
                )
      GROUP BY pu.vessel,
            pu.program_fk,
            pu.object_type_fk,
            pu.start_date_time
      ORDER BY program_fk
;
-- fin cur(V_YEAR_SPAN_FOR_PTM=15)

  row_to_check person_session_vessel%rowtype;
  TYPE t_table_of_vessels is table of VARCHAR2(40) index by varchar2(40);
  table_of_vessels t_table_of_vessels;
  vessel_to_delete vessel.code%type;
  deb integer;
  fin integer;
  has_update    boolean := FALSE;
  has_update_in_items boolean := FALSE;


 -- debut procedure p : Mise à jour ou insertion dans person_session_vessel ... 
 -- On écrit d'abord les droits de la personne dans la table temporaire temp_person_session_vessel (sert ensuite à récupérer les anciens droits qui n'existent plus)
 -- On met à jour les droits de la personne dans person_session_vessel s'ils sont différents 
 -- Si des droits ne sont pas trouvés (nouveaux droits), on les insère dans person_session_vessel
  procedure p (rec in cur%rowtype, program in varchar2)
  is
     recordToInsert cur%rowtype;
  BEGIN
      DBMS_OUTPUT.ENABLE (buffer_size => NULL);
      recordToInsert := rec;
      recordToInsert.program_fk := program;
      BEGIN
	insert into temp_person_session_vessel_2 (PERSON_SESSION_FK,
						VESSEL_FK,
						READ_VESSEL,
						READ_DATA,
						WRITE_DATA,
						VALIDATE_DATA,
						PROGRAM_FK,
						OBJECT_TYPE_FK,
						START_DATE_TIME,
						END_DATE_TIME)
	values (recordToInsert.session_id,
		recordToInsert.vessel_fk,
		recordToInsert.read_vessel,
		recordToInsert.read_data,
		recordToInsert.write_data,
		recordToInsert.validate_data,
		recordToInsert.program_fk,
		recordToInsert.object_type_fk,
		recordToInsert.start_date_time,
		recordToInsert.end_date_time);
      DBMS_OUTPUT.PUT_LINE('VFA recordToInsert.session_id =' || recordToInsert.session_id || ' recordToInsert.program_fk=' || recordToInsert.program_fk || ' recordToInsert.vessel_fk=' || recordToInsert.vessel_fk);
      EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN
	  DBMS_OUTPUT.PUT_LINE('Ignore exception duplicate index on (VESSEL, PROGRAM, OBJECT_TYPE, START_DATE):'
		|| ' - ' || RECORDTOINSERT.VESSEL_FK
		|| ' - ' ||  RECORDTOINSERT.PROGRAM_FK
		|| ' - ' ||  RECORDTOINSERT.OBJECT_TYPE_FK
		|| ' - ' ||  RECORDTOINSERT.START_DATE_TIME);
	  NULL;
  END;
      DBMS_OUTPUT.PUT_LINE('VFA update person_session_vessel');
	  -- Devrait pouvoir être remplacé par un MERGE 
      select *
      into row_to_check
      from person_session_vessel
      where person_session_fk = session_id
      and vessel_fk = rec.vessel_fk
      and program_fk = program
      and object_type_fk = rec.object_type_fk
      and start_date_time = rec.start_date_time;
      if rec.READ_VESSEL != row_to_check.READ_VESSEL
      or rec.READ_DATA != row_to_check.READ_DATA
      or rec.WRITE_DATA != row_to_check.WRITE_DATA
      or rec.VALIDATE_DATA != row_to_check.VALIDATE_DATA
      or rec.END_DATE_TIME != row_to_check.END_DATE_TIME then
        update person_session_vessel
        set READ_VESSEL = rec.READ_VESSEL,
            READ_DATA = rec.READ_DATA,
            WRITE_DATA = rec.WRITE_DATA,
            VALIDATE_DATA = rec.VALIDATE_DATA,
            END_DATE_TIME = rec.END_DATE_TIME,
            update_date = sysdate
        where person_session_fk = session_id
        and vessel_fk = rec.vessel_fk
        and program_fk = program
        and object_type_fk = rec.object_type_fk
        and start_date_time = rec.start_date_time;

        has_update := TRUE;
      end if;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('VFA insert person_session_vessel');
        insert into person_session_vessel( ID, START_DATE_TIME,
                            OBJECT_TYPE_FK,
                            VESSEL_FK,
                            PROGRAM_FK,
                            PERSON_SESSION_FK,
                            READ_VESSEL,
                            READ_DATA,
                            WRITE_DATA,
                            VALIDATE_DATA,
                            END_DATE_TIME,
                            UPDATE_DATE)
        values (PERSON_SESSION_VESSEL_SEQ.nextval, rec.START_DATE_TIME,
                            rec.OBJECT_TYPE_FK,
                            rec.VESSEL_FK,
                            program,
                            session_id,
                            rec.READ_VESSEL,
                            rec.READ_DATA,
                            rec.WRITE_DATA,
                            rec.VALIDATE_DATA,
                            rec.END_DATE_TIME,
                            systimestamp);

        has_update := TRUE;
    END p;

-- fin procedure p



BEGIN
  time_1 := DBMS_UTILITY.GET_TIME;

  -- call P_FILL_SUPERVISOR 
  -- Suppression des anciens privilèges de P_PERSON_FK sur un des programmes
  -- Ajout des nouveaux privilèges de P_PERSON_FK sur un des programmes
  -- Alimente PROGRAM2PERSON : utilisé dans person_program_privilege
  P_FILL_SUPERVISOR(P_PERSON_FK);

  -- 31/05/18 EB patch for erostiau
  --L_YEAR_SPAN_FOR_PTM := YEAR_SPAN_FOR_PTM;
  -- Modification de YEAR_SPAN_FOR_PTM à 20 au lieu de 15 pour erostiau, cvignot et cspagnol
  IF( P_PERSON_FK = 16 /* erostiau */ OR P_PERSON_FK = 2254 /* cvignot */ OR P_PERSON_FK = 2932 /* cspagnol */ ) THEN
	YEAR_SPAN_FOR_PTM := 20;
  END IF;

  -- CONSTRAINT FOREIGN KEY ("PERSON_SESSION_VESSEL.PERSON_SESSION_FK" = PERSON_SESSION" ("ID")
  -- On vérifie si le personne existe dans PERSON_SESSION. Si ce n'est pas le cas on l'insère dans la table PERSON_SESSION  => session_id = person_session_seq.nextval
  -- Si elle existe session_id => session_id = person_session.id
  BEGIN
    select id, fill_duration into session_id, previous_fill_duration
    from person_session
    where person_fk = p_person_fk;
    DBMS_OUTPUT.PUT_LINE('VFA FOUND in person_session.session_id =' || session_id); 
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      select person_session_seq.nextval into session_id
      from dual;
      insert into person_session (id, person_fk, update_date)
      values (session_id, p_person_fk, sysdate);
      previous_fill_duration := 0;
      DBMS_OUTPUT.PUT_LINE('VFA NO_DATA_FOUND in person_session session_id =' || session_id);  	  
  END;

	
  if (P_SKIP_LONG_DURATION = 0
     or previous_fill_duration < MAX_DURATION_IN_MS) then

    DBMS_OUTPUT.PUT_LINE('Start to fill person_session for PERSON_FK=' || p_person_fk);

    -- Pour chaque tuple vessel / program / types de données 	
    for rec in cur(YEAR_SPAN_FOR_PTM) loop

      deb := 1;
      fin := instr(rec.program_fk,',');
	  -- On boucle sur chaque programme si plusiers programme_fk (ex : 'SIH-OBSMER,SIH-OBSMER-CARI3P,SIH-OBSVENTE') 
	  -- NB : au vu du code ça n'arrive pas.
      while (fin != 0) loop
        DBMS_OUTPUT.PUT_LINE('VFA loop - rec.program_fk =' || rec.program_fk);	  
        p(rec, substr(rec.program_fk, deb,fin-deb));
        deb := fin + 1;
        fin := instr(rec.program_fk, ',', deb);
      end loop;
	  -- On prend le dernier de la liste ou le premier s'il n'y a qu'un programme par enregistrement de "rec"
      DBMS_OUTPUT.PUT_LINE('VFA end loop - rec.program_fk =' || rec.program_fk); 	  
      p(rec, substr(rec.program_fk, deb));
    end loop;
	
	-- Suppression des anciens privilèges : Suppression des privilèges de PERSON_SESSION_VESSEL de PERSON_FK qui ne sont plus dans les nouveaux privilèges (temp_person_session_vessel)
	-- session_id = person_session_seq.nextval si PERSON_FK absent de PERSON_SESSION
	-- session_id = person_session_fk si PERSON_FK existe dans PERSON_SESSION
	-- NB : t.person_session_fk is null => ceux qui n'existent pas dans temp_person_session_vessel
	-- Ce privilège n'étant pas dans les nouveaux de temp_person_session_vessel, il sera supprimé	
	-- Pour tester un privilège à supprimer : update person_session_vessel set program_fk = 'SIH-RECOPESCA' where id = 43995241 and person_session_fk = 8025
	-- 	retourne : null 01/01/20 00:00:00,000000000	OBSERVED_FISHING_TRIP	114907	SIH-RECOPESCA	8025	1	1	1	01/01/00 00:00:00,000000000	09/08/23 10:41:57,718194000	43995262	0
	-- Requete équivalente
	-- select t.person_session_fk, p.*
    --             from person_session_vessel p, temp_person_session_vessel_2 t
    --             where t.person_session_fk (+)=  p.person_session_fk
    --              and t.vessel_fk  (+)= p.vessel_fk
    --              and t.program_fk  (+)= p.program_fk
    --              and t.object_type_fk (+)=  p.object_type_fk
    --              and t.start_date_time (+)=  p.start_date_time
    --             and  p.person_session_fk = 8025
    --             and t.person_session_fk is null   
	
	DBMS_OUTPUT.PUT_LINE('*** VFA - before delete session_id =' || session_id);
    for rec in (select p.*
                from person_session_vessel p
                left join temp_person_session_vessel_2 t on (p.person_session_fk = t.person_session_fk
                                                      and p.vessel_fk = t.vessel_fk
                                                      and p.program_fk = t.program_fk
                                                      and p.object_type_fk = t.object_type_fk
                                                      and p.start_date_time = t.start_date_time)
                where p.person_session_fk = session_id
                and t.person_session_fk is null) loop
    
      DBMS_OUTPUT.PUT_LINE('*** VFA - delete person_session_vessel.program_fk =' || rec.program_fk);
      table_of_vessels(rec.vessel_fk) := rec.program_fk;
	  
	  
	  -- On supprime de person_session_vessel les anciens privilèges
      delete person_session_vessel p
      where p.person_session_fk = rec.person_session_fk
      and p.vessel_fk = rec.vessel_fk
      and p.program_fk = rec.program_fk
      and p.object_type_fk = rec.object_type_fk
      and p.start_date_time = rec.start_date_time;
    end loop;
    vessel_to_delete := table_of_vessels.first;
	-- On trace chaque suppression de PERSON_SESSION_VESSEL dans DELETED_ITEM_HISTORY
    while vessel_to_delete is not null loop
      DBMS_OUTPUT.PUT_LINE('*** VFA - insert into deleted_item_history');	
      insert into deleted_item_history (id, vessel_fk, recorder_person_fk, object_type_fk, update_date, program_fk)
      values (deleted_item_history_seq.nextval, vessel_to_delete, p_person_fk, 'PERSON_SESSION_VESSEL', sysdate, table_of_vessels(vessel_to_delete));
      vessel_to_delete := table_of_vessels.next(vessel_to_delete);

      has_update := TRUE;
    end loop;
	-- Idem que F_FILL_PERSON_SESSION mais remplissage dans PERSON_SESSION_ITEM
    has_update_in_items := F_FILL_PERSON_SESSION_ITEM(
      P_PERSON_FK => P_PERSON_FK,
      P_PERSON_SESSION_FK => session_id,
      PRIVILEGE_MANAGER => PRIVILEGE_MANAGER,
      PRIVILEGE_RECORDER => PRIVILEGE_RECORDER,
      PRIVILEGE_VALIDATOR => PRIVILEGE_VALIDATOR,
      OBSERVED_LANDING_OBJ_TYPE => OBSERVED_LANDING_OBJ_TYPE,
      OBSERVED_LOCATION_OBJ_TYPE => OBSERVED_LOCATION_OBJ_TYPE,
      PROJECT_TEAM_MEMBER_PROFILE => PROJECT_TEAM_MEMBER_PROFILE,
      YEAR_SPAN_FOR_PTM => YEAR_SPAN_FOR_PTM,
      YEAR_SPAN_DEFAULT => YEAR_SPAN_DEFAULT
    );
	-- Mise à jour de la durée d'exécution de la mise à jour
    IF (has_update OR has_update_in_items) THEN
      update person_session
      set fill_duration = (DBMS_UTILITY.GET_TIME - time_1),
      update_date = systimestamp
      where id=session_id;
    END IF;

    DBMS_OUTPUT.PUT_LINE('End to fill person_session, in ' || (DBMS_UTILITY.GET_TIME - time_1) || ' ms.');
  end if;
  OPEN hibernate_result
  FOR select session_id from dual;
  RETURN hibernate_result;

END F_FILL_PERSON_SESSION;