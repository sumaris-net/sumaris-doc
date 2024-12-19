REM INSERTING into SIH2_ADAGIO_DBA.SOFTWARE
SET DEFINE OFF;

    insert into software (ID, LABEL, NAME, CREATION_DATE, UPDATE_DATE, STATUS_FK, DESCRIPTION, COMMENTS) values (SOFTWARE_SEQ.nextval, 'Opus-Activite', 'Opus calendrier d''activite', sysdate, current_timestamp, '1', 'Opus calendrier d''activite (refonte Allegro)', null);