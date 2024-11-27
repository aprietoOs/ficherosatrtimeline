-- CSV FORMAT --

EXECUTE IMMEDIATE '
    BEGIN
        CREATE OR REPLACE FILE FORMAT PROCESS.csv_format_dm
        TYPE = CSV
        FIELD_DELIMITER = '',''
        SKIP_HEADER = 1
        NULL_IF = (''NULL'', ''null'')
        FIELD_OPTIONALLY_ENCLOSED_BY = ''"''
        EMPTY_FIELD_AS_NULL = true;

        RETURN ''Created FILE FORMAT SIT.csv_format_dm'';
    END;
';


EXECUTE IMMEDIATE '
    BEGIN	
		create or replace task PROCESS.LOAD_AX_IVE_OFF_ALL
			schedule=''USING CRON  0 11 10 * * Europe/Madrid''
			USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE=''XLARGE''
			as BEGIN

				CREATE or REPLACE TABLE PROCESS.AX_IVE_OFF_ALL_TODAY as
				    (
				       (select ''Hoteles'' ACCOMMODATION_TYPE_ID,to_number(a.PERIODO) PERIODO, COBERTURA, "TIPO DE DATO", VALOR, CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_HOTELES a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_HOTELES ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Hostales'' ACCOMMODATION_TYPE_ID,to_number(a.PERIODO) PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_HOSTALES a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_HOSTALES ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Pensiones'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_PENSIONES a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_PENSIONES ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Apartamentos'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_APARTAMENTOS a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_APARTAMENTOS ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Campings'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_CAMPINGS a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_CAMPINGS ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Rurales'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_CASASRURALES a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_CASASRURALES ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				union all
				(select ''Albergues'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_ALBERGUES a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_ALBERGUES ) b
				where 
				  a.LOAD_DATE =b.LOAD_DATE)
				  union all
				(select ''Agencias'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_AGENCIAS a ,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_AGENCIAS ) b
				where 
				 a.LOAD_DATE =b.LOAD_DATE)
				  union all
				(select ''Turismo'' ACCOMMODATION_TYPE_ID,PERIODO, COBERTURA, "TIPO DE DATO", VALOR,CURRENT_TIMESTAMP(0) load_time from STAGING.ST_IVE_OFF_TURISMOACTIVO a,
				(select max(LOAD_DATE) LOAD_DATE from STAGING.ST_IVE_OFF_TURISMOACTIVO ) b
				where 
				   a.LOAD_DATE =b.LOAD_DATE)
				  );


		        CREATE OR REPLACE TABLE PROCESS.AX_IVE_OFF_FILTER_KEYS AS
		        SELECT 
		            TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(a.periodo || ''12'', ''YYYYMM'')), ''YYYYMMDD'')) PERIOD_KEY,
		            CASE 
		                WHEN REGEXP_INSTR(TRIM(SUBSTR(a.cobertura, 1, REGEXP_INSTR(a.cobertura, ''-'') - 1)), ''[0-9]'') > 0 THEN TRIM(SUBSTR(a.cobertura, 1, REGEXP_INSTR(a.cobertura, ''-'') - 1)) 
		                ELSE NULL 
		            END city_id,
		            ACCTYPE.ACCOMMODATION_TYPE_KEY,
		            KPI.kpi_key,
		            a.VALOR KPI_VALUE_NUM,
		            CURRENT_TIMESTAMP(0) LOAD_TIME
		        FROM 
		            PROCESS.AX_IVE_OFF_ALL_TODAY a
		            LEFT JOIN SIT.DM_IVE_KPI_MASTER KPI ON a."TIPO DE DATO" = KPI.KPI_DES
		            LEFT JOIN SIT.DM_IVE_ACCOMMODATION_TYPE ACCTYPE ON a.ACCOMMODATION_TYPE_ID = ACCTYPE.ACCOMMODATION_TYPE_ID
		        WHERE 
		            a.VALOR != ''-''
		            AND a."TIPO DE DATO" != ''Total'';

		END;

		RETURN ''Create task PROCESS.LOAD_AX_IVE_OFF_ALL'';

	END;
';


EXECUTE IMMEDIATE '
    BEGIN
		create or replace TABLE PROCESS.WK_IVE_OFF_ALERT_NO_CITY (
			CITY_ID VARCHAR(30),
			LOAD_TIME TIMESTAMP_NTZ(9)
		);

		RETURN ''Create table PROCESS.WK_IVE_OFF_ALERT_NO_CITY & RESUME'';

	END;
';

EXECUTE IMMEDIATE '
    BEGIN

		create or replace task PROCESS.LOAD_WK_IVE_OFF_ALERT_NO_CITY
			USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE=''XLARGE''
			schedule=''USING CRON  30 11 10 * * Europe/Madrid''
			as BEGIN

				insert into PROCESS.WK_IVE_OFF_ALERT_NO_CITY 
				(
				select distinct a.city_id,CURRENT_TIMESTAMP(0) from PROCESS.AX_IVE_OFF_FILTER_KEYS a ,SIT.DM_GLB_CITY b, PROCESS.WK_IVE_OFF_ALERT_NO_CITY c
				where a.city_id=b.city_id(+)
				and a.city_id=c.city_id(+)
				and c.city_id is null
				and a.city_id is not null
				and b.city_key is null
				);

		END;

		ALTER TASK PROCESS.LOAD_WK_IVE_OFF_ALERT_NO_CITY RESUME;
		ALTER TASK PROCESS.LOAD_AX_IVE_OFF_ALL RESUME;

		RETURN ''Create task PROCESS.LOAD_WK_IVE_OFF_ALERT_NO_CITY & RESUME'';

	END;
';
