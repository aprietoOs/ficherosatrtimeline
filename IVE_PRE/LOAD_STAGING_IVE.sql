USE ROLE PRE_DO_FR;

-- OFERTA --

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_HOTELES (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Create table STAGING.ST_IVE_OFF_HOTELES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_HOSTALES (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_HOSTALES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_PENSIONES (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_PENSIONES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_APARTAMENTOS (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);


		RETURN ''Created table STAGING.ST_IVE_OFF_APARTAMENTOS'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_CAMPINGS (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_CAMPINGS'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_CASASRURALES (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);


		RETURN ''Created table STAGING.ST_IVE_OFF_CASASRURALES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_ALBERGUES (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_ALBERGUES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_AGENCIAS (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_AGENCIAS'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_OFF_TURISMOACTIVO (
			PERIODO NUMBER(9),
			COBERTURA VARCHAR(200),
			"TIPO DE DATO" VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_OFF_TURISMOACTIVO'';

	END;
';

-- FRONTUR --
EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2371_C2D2452 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			MOTIVO_PRINCIPAL_DEL_VIAJE VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2371_C2D2452 '';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2370_C2D2450 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			PAIS_DE_RESIDENCIA VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2370_C2D2450'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2372_C2D2453 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			TIPO_DE_ALOJAMIENTO_PRINCIPAL VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2372_C2D2453'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2373_C2D2454 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			VIA_DE_ACCESO VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2373_C2D2454'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2425_C2D2550 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			PROVINCIAS_Y_CIUDADES  VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2425_C2D2550'';

	END;
';


-- EGATUR --

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2426_C2D2551 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			CONCEPTO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2425_C2D2550'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2445_C2D2574 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			ORIGEN VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			VALOR VARCHAR(200),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2445_C2D2574'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_IVE_V2446_C2D2575 (
			PERIODO VARCHAR(200),
			YEAR VARCHAR(200),
			COBERTURA VARCHAR(200),
			TIPO_DE_DATO VARCHAR(200),
			PROVINCIAS_Y_CIUDADES VARCHAR(200),
			VALOR FLOAT,
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_IVE_V2446_C2D2575'';

	END;
';

-- EUROSTAT -- 
/*
EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_EUR_SRC_RENTAL_CITIES (
			DATAFLOW VARCHAR(200),
			LAST_UPDATE VARCHAR(200),
			FREQ VARCHAR(200),
			INDIC_TO VARCHAR(200),
			C_RESID VARCHAR(200),
			UNIT VARCHAR(200),
			CITIES VARCHAR(200),
			TIME_PERIOD NUMBER(38,0),
			OBS_VALUE NUMBER(38,0),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_EUR_SRC_RENTAL_CITIES'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace TABLE STAGING.ST_EUR_SRR_RENTAL_REGIONS (
			DATAFLOW VARCHAR(16777216),
			LAST_UPDATE VARCHAR(16777216),
			FREQ VARCHAR(16777216),
			INDIC_TO VARCHAR(16777216),
			C_RESID VARCHAR(16777216),
			MONTH VARCHAR(16777216),
			UNIT VARCHAR(16777216),
			GEO VARCHAR(16777216),
			TIME_PERIOD NUMBER(38,0),
			OBS_VALUE NUMBER(38,0),
			LOAD_DATE DATE
		);

		RETURN ''Created table STAGING.ST_EUR_SRR_RENTAL_REGIONS'';

	END;
';
*/

-- CREATE FILE FORMATS --

EXECUTE IMMEDIATE '
      BEGIN
        CREATE OR REPLACE FILE FORMAT csv_format_ive
        TYPE = CSV
        FIELD_DELIMITER = '',''
        SKIP_HEADER = 0
        ENCODING = ''UTF8''
        NULL_IF = (''NULL'', ''null'')
        FIELD_OPTIONALLY_ENCLOSED_BY = ''"''
        EMPTY_FIELD_AS_NULL = true;

        RETURN ''Created file format csv_format_ive'';

      END;
';

-- Task --
EXECUTE IMMEDIATE '
    BEGIN

		create or replace task STAGING.LOAD_IVE
			schedule=''USING CRON  0 10 10 * * Europe/Madrid''
			USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE=''XLARGE''
			as BEGIN
		    
		    TRUNCATE TABLE ST_IVE_OFF_HOTELES;

		    copy into ST_IVE_OFF_HOTELES(PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_HOTELES.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_HOSTALES;

		    copy into ST_IVE_OFF_HOSTALES (PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4,  
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_HOSTALES.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_PENSIONES;

		    copy into ST_IVE_OFF_PENSIONES (PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_PENSIONES.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_APARTAMENTOS;

		    copy into ST_IVE_OFF_APARTAMENTOS(PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_APARTAMENTOS.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_CAMPINGS;

		    copy into ST_IVE_OFF_CAMPINGS(PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_CAMPINGS.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_CASASRURALES;

		    copy into ST_IVE_OFF_CASASRURALES (PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4,
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_CASASRURALES.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_ALBERGUES;

		    copy into ST_IVE_OFF_ALBERGUES(PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4,
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_ALBERGUES.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_OFF_AGENCIAS;

		    copy into ST_IVE_OFF_AGENCIAS(PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            $3, 
		            $4, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_BOOK_AGENCIAS.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';
		    
		    TRUNCATE TABLE ST_IVE_OFF_TURISMOACTIVO;
		    

		    copy into ST_IVE_OFF_TURISMOACTIVO (PERIODO, COBERTURA, "TIPO DE DATO", VALOR, LOAD_DATE) 
		    FROM (
		        SELECT 
		            $1, 
		            $2, 
		            ''Número'' as "TIPO DE DATO", 
		            $3, 
		            to_timestamp_ntz(current_timestamp) 
		        FROM ''@s3_stage/ive/ST_BOOK_TURISMOACTIVO.csv''
		    )
		    pattern = ''.*ST_BOOK_TURISMOACTIVO.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';
		    

		    TRUNCATE TABLE ST_IVE_V2446_C2D2575;

		    copy into ST_IVE_V2446_C2D2575(PERIODO, YEAR, COBERTURA, "PROVINCIAS_Y_CIUDADES", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $4,
		            $3,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2446_C2D2575.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2371_C2D2452;

		    copy into ST_IVE_V2371_C2D2452(PERIODO, YEAR, COBERTURA, "MOTIVO_PRINCIPAL_DEL_VIAJE", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2371_C2D2452.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2445_C2D2574;

		    copy into ST_IVE_V2445_C2D2574(PERIODO, YEAR, COBERTURA, "ORIGEN", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2445_C2D2574.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2426_C2D2551;

		    copy into ST_IVE_V2426_C2D2551(PERIODO, YEAR, COBERTURA, "TIPO_DE_DATO", "CONCEPTO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2426_C2D2551.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2370_C2D2450;

		    copy into ST_IVE_V2370_C2D2450(PERIODO, YEAR, COBERTURA, "PAIS_DE_RESIDENCIA", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2370_C2D2450.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2372_C2D2453;

		    copy into ST_IVE_V2372_C2D2453(PERIODO, YEAR, COBERTURA, "TIPO_DE_ALOJAMIENTO_PRINCIPAL", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2372_C2D2453.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2373_C2D2454;

		    copy into ST_IVE_V2373_C2D2454(PERIODO, YEAR, COBERTURA, "VIA_DE_ACCESO", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2373_C2D2454.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2425_C2D2550;

		    copy into ST_IVE_V2425_C2D2550(PERIODO, YEAR, COBERTURA, "PROVINCIAS_Y_CIUDADES", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $4,
		            $3,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2425_C2D2550.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		    TRUNCATE TABLE ST_IVE_V2370_C2D2450;

		    copy into ST_IVE_V2370_C2D2450 (PERIODO, YEAR, COBERTURA, "PAIS_DE_RESIDENCIA", "TIPO_DE_DATO", VALOR, LOAD_DATE)
		    FROM(
		        SELECT
		            $1,
		            split_part($1, ''-'', 1),
		            $2,
		            $3,
		            $4,
		            $5,
		            to_timestamp_ntz(current_timestamp)
		            FROM ''@s3_stage/ive/''
		    )
		    pattern = ''.*ST_IVE_V2370_C2D2450.*''
		    file_format = ''csv_format_ive''
		    on_error = ''continue'';

		RETURN ''Created task STAGING.STAGING.LOAD_IVE'';

	END;
';
