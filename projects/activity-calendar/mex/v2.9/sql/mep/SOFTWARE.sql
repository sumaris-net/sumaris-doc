REM INSERTING into SIH2_ADAGIO_DBA.SOFTWARE

insert into software (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, STATUS_FK, DESCRIPTION, COMMENTS) values (SOFTWARE_SEQ.nextval, 'Opus-Activite', 'Opus calendrier d''activité', sysdate, current_timestamp, '1', 'Opus calendrier d''activité', null);

commit;