EXECUTE IMMEDIATE '
      BEGIN

                create or replace TABLE SIT.DM_IVE_KPI_MASTER_MLG (
                    KPI_KEY NUMBER(16),
                    LANGUAGE_KEY NUMBER(16),
                    KPI_ID VARCHAR2(100),
                    KPI_DES VARCHAR2(100),
                    LOAD_TIME DATETIME
                );

                copy into SIT.DM_IVE_KPI_MASTER_MLG (KPI_KEY, LANGUAGE_KEY, KPI_ID, KPI_DES, LOAD_TIME)
                FROM (
                    SELECT
                        $1,
                        $2,
                        $3,
                        $4,
                        to_timestamp_ntz(current_timestamp)
                    FROM ''@s3_stage/ive_dt/DM_IVE_KPI_MASTER_MLG_V4.csv''
                )
                file_format = ''csv_format_dm''
                on_error = ''continue'';

		DELETE FROM SIT.DM_IVE_KPI_MASTER_MLG
		WHERE KPI_KEY IS NULL
		AND LANGUAGE_KEY IS NULL
		AND KPI_ID IS NULL
		AND KPI_DES IS NULL
		AND LOAD_TIME IS NOT NULL;


            RETURN ''Insert data into SIT.DM_IVE_KPI_MASTER_MLG'';

      END;
';

EXECUTE IMMEDIATE '
      BEGIN

                create or replace TABLE SIT.DM_IVE_ACCOMMODATION_TYPE_MLG (
                    ACCOMMODATION_TYPE_KEY NUMBER(16),
                    ACCOMMODATION_TYPE_ID VARCHAR2(100),
                    LANGUAGE_KEY NUMBER(16),
                    ACCOMMODATION_TYPE_DES VARCHAR2(100),
                    LOAD_TIME DATETIME
                );



                copy into SIT.DM_IVE_ACCOMMODATION_TYPE_MLG (ACCOMMODATION_TYPE_KEY,ACCOMMODATION_TYPE_ID,LANGUAGE_KEY,ACCOMMODATION_TYPE_DES, LOAD_TIME)
                FROM (
                    SELECT
                        $1,
                        $2,
                        $3,
                        $4,
                        to_timestamp_ntz(current_timestamp)
                    FROM ''@s3_stage/ive_dt/DM_IVE_ACCOMMODATION_TYPE_MLG_V3.csv''
                )
                file_format = ''csv_format_dm''
                on_error = ''continue'';

                CREATE or replace TABLE SIT.DM_IVE_SPEND_TYPE_MLG ( 
                    SPEND_TYPE_KEY NUMBER(16),
                    LANGUAGE_KEY NUMBER(16),
                    SPEND_TYPE_DES VARCHAR(100),
                    LOAD_TIME TIMESTAMP_LTZ(9)
                );

                copy into SIT.DM_IVE_SPEND_TYPE_MLG (SPEND_TYPE_KEY,LANGUAGE_KEY,SPEND_TYPE_DES,LOAD_TIME) 
                FROM (select $1,$2,$3,to_timestamp_ntz(current_timestamp)  from ''@s3_stage/ive_dt/DM_IVE_SPEND_TYPE_MLG_V1.csv'') file_format = ''csv_format_dm'' force= true on_error=''continue''; 

                CREATE or replace TABLE SIT.DM_IVE_HOUSING_TYPE_MLG ( 
                    HOUSING_TYPE_KEY NUMBER(16),
                    LANGUAGE_KEY NUMBER(16),
                    HOUSING_TYPE_DES VARCHAR(100),
                    LOAD_TIME TIMESTAMP_LTZ(9)
                );

                copy into SIT.DM_IVE_HOUSING_TYPE_MLG (HOUSING_TYPE_KEY,LANGUAGE_KEY,HOUSING_TYPE_DES,LOAD_TIME) 
                FROM (select $1,$2,$3,to_timestamp_ntz(current_timestamp)  from ''@s3_stage/ive_dt/DM_IVE_HOUSING_TYPE_MLG_V1.csv'') file_format = ''csv_format_dm'' force= true on_error=''continue''; 

                CREATE or replace TABLE SIT.DM_IVE_GATEWAY_TYPE_MLG ( 
                    GATEWAY_TYPE_KEY NUMBER(16),
                    LANGUAGE_KEY NUMBER(16),
                    GATEWAY_TYPE_DES VARCHAR(100),
                    LOAD_TIME TIMESTAMP_LTZ(9)
                );

                copy into SIT.DM_IVE_GATEWAY_TYPE_MLG (GATEWAY_TYPE_KEY,LANGUAGE_KEY,GATEWAY_TYPE_DES,LOAD_TIME) 
                FROM (select $1,$2,$3,to_timestamp_ntz(current_timestamp)  from ''@s3_stage/ive_dt/DM_IVE_GATEWAY_TYPE_MLG_V1.csv'') file_format = ''csv_format_dm'' force= true on_error=''continue''; 

                CREATE or replace TABLE SIT.DM_IVE_TRAVEL_REASON_MLG ( 
                    TRAVEL_REASON_KEY NUMBER(16),
                    LANGUAGE_KEY NUMBER(16),
                    TRAVEL_REASON_DES VARCHAR(100),
                    LOAD_TIME TIMESTAMP_LTZ(9)
                );

                copy into SIT.DM_IVE_TRAVEL_REASON_MLG (TRAVEL_REASON_KEY,LANGUAGE_KEY,TRAVEL_REASON_DES,LOAD_TIME) 
                FROM (select $1,$2,$3,to_timestamp_ntz(current_timestamp)  from ''@s3_stage/ive_dt/DM_IVE_TRAVEL_REASON_MLG_V1.csv'') file_format = ''csv_format_dm'' force= true on_error=''continue''; 

            RETURN ''Insert data into SIT.DM_IVE_ACCOMMODATION_TYPE_MLG | SIT.DM_IVE_SPEND_TYPE_MLG | SIT.DM_IVE_HOUSING_TYPE_MLG | SIT.DM_IVE_GATEWAY_TYPE_MLG | SIT.DM_IVE_TRAVEL_REASON_MLG'';

      END;
';


DELETE FROM SIT.DM_IVE_ACCOMMODATION_TYPE 
WHERE ACCOMMODATION_TYPE_KEY IS NULL
  AND ACCOMMODATION_TYPE_ID IS NULL
  AND ACCOMMODATION_TYPE_DES IS NULL
  AND LOAD_TIME IS NOT NULL; 

DELETE FROM SIT.DM_IVE_HOUSING_TYPE WHERE HOUSING_TYPE_KEY IS NULL
  AND HOUSING_TYPE_ID IS NULL
  AND HOUSING_TYPE_DES IS NULL
  AND PARENT_HOUSING_TYPE_KEY IS NULL
  AND LOAD_TIME IS NOT NULL;
