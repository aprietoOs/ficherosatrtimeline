USE ROLE PRE_DO_FR;

EXECUTE IMMEDIATE '
    BEGIN

		create or replace task SIT.LOAD_FC_IVE_OFFER
			schedule=''USING CRON  15 11 10 * * Europe/Madrid''
			USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE=''XLARGE''
			as BEGIN
				create or replace table SIT.FC_IVE_OFFER as
				select a.period_key,nvl(b.city_key,-3) city_key, a.ACCOMMODATION_TYPE_KEY, nvl(a.KPI_KEY,-3) KPI_KEY, to_number(a.KPI_VALUE_NUM) KPI_VALUE_NUM,CURRENT_TIMESTAMP(0) LOAD_TIME
				from PROCESS.AX_IVE_OFF_FILTER_KEYS a
				,SIT.DM_GLB_CITY b
				where a.city_id=b.city_id(+)
				and a.city_id is not null;

		END;

		ALTER TASK SIT.LOAD_FC_IVE_OFFER RESUME;

		RETURN ''Create task SIT.LOAD_FC_IVE_OFFER & RESUME'';

	END;
';
