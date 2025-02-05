
## Schéma SIH2_ADAGIO_DBA

-- Récupération de l'id de l'utilisateur qui n'arrive pas à se connecter
select id from person where id = 2749;


## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

-- Insertion d'une pubkey temporaire pour l'utilisateur qui n'arrive pas à se connecter
insert into m_person values (2749, null, 'temporary_value_more_than8_caracters', null);