-- Cambia el idioma de la fecha a espaol
alter session set nls_date_language = 'SPANISH';

-- Establece formato de columnas y pginas


-- Establece formato de columnas y pginas
set colsep '|='
set linenum on -- Esta lnea habilita la numeracin de filas
set pagesize 99
set linesize 150
col parameter format a29
col value format a29



-- Despliega los parmetros de la sesin
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
ORDER BY 1;

-- Cambia el idioma de la fecha a ingls
alter session set nls_date_language = 'ENGLISH';

-- Despliega nuevamente los parmetros de la sesin
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS;

-- Despliega solamente el parmetro nls_date_language
SELECT PARAMETER, VALUE FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_LANGUAGE';
