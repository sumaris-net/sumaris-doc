
## Schéma SIH2_ADAGIO_DBA

-- Récupération de l'id de l'utilisateur qui n'arrive pas à se connecter
select id from person where id = 2749;

## Test de connexion sur sumaris-app (HARMONIE_VAL)
-- Récupération de la PUBKEY dans les logs
-- Feb 06 11:10:14 visi-docker04-val dockersvc_sumaris-pod[741852]: 2025-02-06 11:10:14,019 TRACE [http-nio-8080-exec-8] o.h.type.descriptor.sql.BasicBinder
-- : binding parameter [1] as [VARCHAR] - [3T4K8UvcDPe3LWvQnq6iGR8zErzCoZAeVmUqeszyWCxz]

## Schéma SIH2_ADAGIO_DBA_SUMARIS_MAP

-- Insertion de la pubkey pour l'utilisateur qui n'arrive pas à se connecter
insert into m_person values (2749, null, '3T4K8UvcDPe3LWvQnq6iGR8zErzCoZAeVmUqeszyWCxz', null);