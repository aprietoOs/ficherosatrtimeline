EXECUTE IMMEDIATE '
    BEGIN
		create or replace task PROCESS.LOAD_AX_IVE_FRO_ALL
            schedule=''USING CRON  0 11 10 * * Europe/Madrid''
            USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE=''XLARGE''
            as BEGIN        

                CREATE OR REPLACE TABLE PROCESS.AX_IVE_FRO_FOREIGNER_ALL_TODAY AS
                SELECT 
                  CASE 
                    WHEN periodo LIKE ''%1er%'' THEN TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(A.periodo, 1, 4) || ''03'', ''YYYYMM'')), ''YYYYMMDD'')) 
                    WHEN periodo LIKE ''%2º%'' THEN TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(A.periodo, 1, 4) || ''06'', ''YYYYMM'')), ''YYYYMMDD''))
                    WHEN periodo LIKE ''%3er%'' THEN TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(A.periodo, 1, 4) || ''09'', ''YYYYMM'')), ''YYYYMMDD''))
                    ELSE TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(A.periodo, 1, 4) || ''12'', ''YYYYMM'')), ''YYYYMMDD''))
                  END AS PERIOD_KEY,
                  COBERTURA AS COBERTURA_DES,
                  A.KPI_TYPE_KEY,
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  PROVINCIAS_Y_CIUDADES AS prov_city_des,
                  CASE 
                    WHEN PROVINCIAS_Y_CIUDADES LIKE ''%/%'' THEN TRIM(SUBSTR(A.PROVINCIAS_Y_CIUDADES, 1, REGEXP_INSTR(A.PROVINCIAS_Y_CIUDADES, ''/'') - 1))
                    ELSE ''No Informado'' 
                  END AS province_des,
                  CASE 
                    WHEN PROVINCIAS_Y_CIUDADES = ''València ciudad'' THEN ''València'' 
                    WHEN PROVINCIAS_Y_CIUDADES NOT LIKE ''%/%'' THEN PROVINCIAS_Y_CIUDADES
                    ELSE ''No Informado'' 
                  END AS City_des,
                  CAST(valor AS FLOAT) AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM 
                (
                  SELECT a.*, d.* 
                  FROM STAGING.ST_IVE_V2425_C2D2550 a
                  JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2425_C2D2550) b ON a.LOAD_DATE = b.LOAD_DATE
                  JOIN (SELECT KPI_TYPE_KEY FROM SIT.DM_GLB_KPI_TYPE WHERE KPI_TYPE_ID = ''FRONTUR'') d
                  UNION ALL
                  SELECT a.*, d.* 
                  FROM STAGING.ST_IVE_V2446_C2D2575 a
                  JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2446_C2D2575) b ON a.LOAD_DATE = b.LOAD_DATE
                  JOIN (SELECT KPI_TYPE_KEY FROM SIT.DM_GLB_KPI_TYPE WHERE KPI_TYPE_ID = ''EGATUR'') d
                ) a
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID;


                CREATE OR REPLACE TABLE PROCESS.AX_IVE_FRO_HOME_COUNTRY_ALL_TODAY AS
                SELECT 
                  periodo AS periodo_des,
                  TRIM(SUBSTR(periodo, 1, REGEXP_INSTR(periodo, ''-'') - 1)) AS year_id, 
                  TRIM(SUBSTR(periodo, REGEXP_INSTR(periodo, ''-'') + 1)) AS month_des,
                  COBERTURA AS COBERTURA_DES,
                  A.KPI_TYPE_KEY,  
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  DECODE(PAIS_DE_RESIDENCIA, ''Total'', ''Todos los Paises'', PAIS_DE_RESIDENCIA) AS COUNTRY_DES,
                  valor AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM  
                (
                  SELECT a.*, d.* 
                  FROM STAGING.ST_IVE_V2370_C2D2450 a
                  JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2370_C2D2450) b ON a.LOAD_DATE = b.LOAD_DATE
                  JOIN (SELECT KPI_TYPE_KEY FROM SIT.DM_GLB_KPI_TYPE WHERE KPI_TYPE_ID = ''FRONTUR'') d
                  UNION ALL
                  SELECT a.*, d.* 
                  FROM STAGING.ST_IVE_V2445_C2D2574 a
                  JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2445_C2D2574) b ON a.LOAD_DATE = b.LOAD_DATE
                  JOIN (SELECT KPI_TYPE_KEY FROM SIT.DM_GLB_KPI_TYPE WHERE KPI_TYPE_ID = ''EGATUR'') d
                ) a
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID;
                 


                CREATE OR REPLACE TABLE PROCESS.AX_IVE_FRO_GATEWAY_ALL_TODAY AS
                SELECT 
                  periodo AS periodo_des,
                  TRIM(SUBSTR(periodo, 1, REGEXP_INSTR(periodo, ''-'') - 1)) AS year_id, 
                  TRIM(SUBSTR(periodo, REGEXP_INSTR(periodo, ''-'') + 1)) AS month_des,
                  COBERTURA AS COBERTURA_DES,
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  NVL(G.GATEWAY_TYPE_KEY, -3) AS GATEWAY_TYPE_KEY,
                  valor AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM STAGING.ST_IVE_V2373_C2D2454 a
                JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2373_C2D2454) b ON a.LOAD_DATE = b.LOAD_DATE
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID
                LEFT JOIN SIT.DM_IVE_GATEWAY_TYPE G ON A.via_de_acceso = G.GATEWAY_TYPE_ID;


                CREATE OR REPLACE TABLE PROCESS.AX_IVE_FRO_HOUSING_ALL_TODAY AS
                SELECT 
                  periodo AS periodo_des,
                  TRIM(SUBSTR(periodo, 1, REGEXP_INSTR(periodo, ''-'') - 1)) AS year_id, 
                  TRIM(SUBSTR(periodo, REGEXP_INSTR(periodo, ''-'') + 1)) AS month_des,
                  COBERTURA AS COBERTURA_DES,
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  NVL(G.HOUSING_TYPE_KEY, -3) AS HOUSING_TYPE_KEY,
                  valor AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM STAGING.ST_IVE_V2372_C2D2453 a
                JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2372_C2D2453) b ON a.LOAD_DATE = b.LOAD_DATE
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID
                LEFT JOIN SIT.DM_IVE_HOUSING_TYPE G ON A.TIPO_DE_ALOJAMIENTO_PRINCIPAL = G.HOUSING_TYPE_ID;

                CREATE OR REPLACE TABLE PROCESS.AX_IVE_FRO_TRAVEL_REASON_ALL_TODAY AS
                SELECT
                  periodo AS periodo_des,
                  TRIM(SUBSTR(periodo, 1, REGEXP_INSTR(periodo, ''-'') - 1)) AS year_id,
                  TRIM(SUBSTR(periodo, REGEXP_INSTR(periodo, ''-'') + 1)) AS month_des,
                  COBERTURA AS COBERTURA_DES,
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  NVL(G.TRAVEL_REASON_KEY, -3) AS TRAVEL_REASON_KEY,
                  valor AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM STAGING.ST_IVE_V2371_C2D2452 a
                JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2371_C2D2452) b ON a.LOAD_DATE = b.LOAD_DATE
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID
                LEFT JOIN SIT.DM_IVE_TRAVEL_REASON G ON A.MOTIVO_PRINCIPAL_DEL_VIAJE = G.TRAVEL_REASON_ID;


                CREATE OR REPLACE TABLE PROCESS.AX_IVE_EGA_INTER_SPEND_ALL_TODAY AS
                SELECT 
                  periodo AS periodo_des,
                  TRIM(SUBSTR(periodo, 1, REGEXP_INSTR(periodo, ''-'') - 1)) AS year_id,
                  TRIM(SUBSTR(periodo, REGEXP_INSTR(periodo, ''-'') + 1)) AS month_des,
                  COBERTURA AS COBERTURA_DES,
                  NVL(C.KPI_KEY, -3) AS KPI_KEY,
                  NVL(G.SPEND_TYPE_KEY, -3) AS SPEND_TYPE_KEY,
                  valor AS KPI_VALUE_NUM,
                  CURRENT_TIMESTAMP(0) AS LOAD_TIME
                FROM STAGING.ST_IVE_V2426_C2D2551 a
                JOIN (SELECT MAX(LOAD_DATE) AS LOAD_DATE FROM STAGING.ST_IVE_V2426_C2D2551) b ON a.LOAD_DATE = b.LOAD_DATE
                LEFT JOIN SIT.DM_IVE_KPI_MASTER C ON A.TIPO_DE_DATO = C.KPI_ID
                LEFT JOIN SIT.DM_IVE_SPEND_TYPE G ON A.CONCEPTO = G.SPEND_TYPE_ID;
        END;

		ALTER TASK PROCESS.LOAD_AX_IVE_FRO_ALL RESUME;

		RETURN ''Create task PROCESS.LOAD_AX_IVE_FRO_ALL & RESUME'';

	END;
';
