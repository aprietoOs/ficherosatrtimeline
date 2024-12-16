------------------------------------------------
-------------FRONTUR----------------------------
------------------------------------------------
--------------------------------------------
-- ------AX_INE_FRONTUR_MICRO_ALL_TODAY---------
--------------------------------------------

use role data_engineer;
use warehouse collect_wh;

CREATE or REPLACE TABLE DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO_ALL_TODAY
(
     YEAR_KEY	        NUMBER(10,0)
    ,MONTH_KEY	        NUMBER(10,0)
    ,SURVEY_TYPE_ID     VARCHAR(5)
    ,FORM_ID    	    VARCHAR(20)
    ,VISITOR_CATEGORY_ID VARCHAR(5)
    ,TRANSPORT_ID	    VARCHAR(5)
    ,COUNTRY_ORIGIN_ID  VARCHAR(5)
    ,REGION_DEST_ID     VARCHAR(5)
    ,ACCOMODATION_ID    VARCHAR(5)
    ,REASON_ID          VARCHAR(5)
    ,PAQ_FLG            NUMBER(1,0)
    ,NOS_ID             VARCHAR(5)
    ,FACTOR             FLOAT
    ,DUPLICATE_FILTER	  NUMBER(5,0)    
    ,LOAD_TIME TIMESTAMP_LTZ default current_timestamp()
) ;


use role dev_da_fr;
use warehouse dev_transform_wh;
USE DATABASE DEV_TOURISM_DB;

INSERT INTO DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO_ALL_TODAY
SELECT
     '20' || SUBSTR(FILE_NAME,3,2) AS YEAR_KEY
    ,SUBSTR(FILE_NAME,0,2) AS MONTH_KEY
    ,A0
    ,A0_1
    ,A0_7
    ,A1
    ,RESIDENCIA
    ,CCAA
    ,DECODE(A14,'0','98',A14)
    ,A15
    ,DECODE(A16, '0','-2', '6','0', A16) 
    ,A13_1
    ,REPLACE(FACTOR,',','.')  
    ,ROW_NUMBER() OVER (PARTITION BY FILE_NAME, A0_1 ORDER BY ST.LOAD_DATE DESC) AS DUPLICATE_FILTER
    ,current_timestamp() LOAD_TIME
FROM DEV_TOURISM_DB.STAGING.ST_INE_FRONTUR_MICRO ST
INNER JOIN (SELECT MAX(LOAD_DATE) LOAD_DATE FROM DEV_TOURISM_DB.STAGING.ST_INE_FRONTUR_MICRO) LD
ON ST.LOAD_DATE = LD.LOAD_DATE;


--------------------------------------------
-- ----------AX_INE_FRONTUR_MICRO-----------
--------------------------------------------

use role data_engineer;
use warehouse collect_wh;

CREATE or REPLACE TABLE DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO
(
     YEAR_KEY	          NUMBER(10,0)
    ,MONTH_KEY	          NUMBER(10,0)
    ,SURVEY_TYPE_KEY      NUMBER(5,0)
    ,FORM_ID    	      VARCHAR(20)
    ,VISITOR_CATEGORY_KEY NUMBER(5,0)
    ,TRANSPORT_KEY	      NUMBER(5,0)
    ,COUNTRY_ORIGIN_KEY   NUMBER(5,0)
    ,REGION_DEST_KEY      NUMBER(5,0)
    ,ACCOMODATION_KEY     NUMBER(5,0)
    ,REASON_KEY           NUMBER(5,0)
    ,PAQ_FLG              NUMBER(1,0)
    ,NOS_KEY              NUMBER(5,0)
    ,FACTOR               FLOAT
    ,LOAD_TIME TIMESTAMP_LTZ default current_timestamp()
) ;

use role dev_da_fr;
use warehouse dev_transform_wh;
USE DATABASE DEV_TOURISM_DB;

INSERT INTO DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO
SELECT
     YEAR_KEY
    ,MONTH_KEY
    ,NVL(ST.SURVEY_TYPE_KEY,-3) AS SURVEY_TYPE_KEY 
    ,FORM_ID
    ,NVL(CV.VISITOR_CATEGORY_KEY,-3) AS VISITOR_CATEGORY_KEY
    ,NVL(TT.TIPO_TRANSPORTE_KEY,-3) AS TRANSPORT_KEY
    ,NVL(C.COUNTRY_KEY,-3) AS COUNTRY_ORIGIN_KEY
    ,NVL(REGION_DEST_ID,-3) AS REGION_DEST_KEY 
    ,NVL(TE.TIPO_ESTABLECIMIENTO_KEY,-3) AS ACCOMODATION_KEY  
    ,NVL(MV.MOTIVO_VIAJE_KEY,-3) AS REASON_KEY
    ,PAQ_FLG
    ,NVL(NOS.NIGHTS_STAY_KEY,-3) AS NIGHTS_STAY_KEY
    ,FACTOR
    ,current_timestamp() LOAD_TIME
FROM DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO_ALL_TODAY FRONTUR

------------------------TIPO DE ENCUESTA
LEFT JOIN DUMMYDB.PUBLIC.DM_INE_SURVEY_TYPE ST
    ON FRONTUR.SURVEY_TYPE_ID = ST.SURVEY_TYPE_ID
    
------------------------TIPO DE TRANSPORTE
LEFT JOIN DUMMYDB.PUBLIC.DM_INE_TIPO_DE_TRANSPORTE TT
    ON FRONTUR.TRANSPORT_ID = TT.ID_FRONTUR

------------------------CATEGORIA DE VISITANTE
LEFT JOIN DUMMYDB.PUBLIC.DM_GLB_VISITOR_CATEGORY CV
    ON FRONTUR.VISITOR_CATEGORY_ID = CV.ID_FRONTUR    
    
------------------------PAÍS
LEFT JOIN DUMMYDB.PUBLIC.DM_GLB_COUNTRY C
    ON FRONTUR.COUNTRY_ORIGIN_ID = C.ID_FRONTUR
    
------------------------TIPO DE ESTABLECIMIENYO      
LEFT JOIN DUMMYDB.PUBLIC.DM_INE_TIPO_DE_ESTABLECIMIENTO TE
    ON FRONTUR.ACCOMODATION_ID = TE.ID_FRONTUR
    
------------------------MOTIVO DEL VIAJE   
LEFT JOIN DUMMYDB.PUBLIC.DM_INE_MOTIVO_DEL_VIAJE MV
    ON FRONTUR.REASON_ID = MV.ID_FRONTUR	
    
------------------------NOS
LEFT JOIN DUMMYDB.PUBLIC.DM_FLX_NIGHTS_STAY NOS
    ON FRONTUR.NOS_ID = NOS.ID_FRONTUR 
    
WHERE DUPLICATE_FILTER = 1    

UNION ALL

SELECT FC.*
FROM DUMMYDB.PUBLIC.FC_INE_FRONTUR_MICRO FC
LEFT JOIN DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO_ALL_TODAY AX
    ON  FC.YEAR_KEY = AX.YEAR_KEY
    AND FC.MONTH_KEY = AX.MONTH_KEY
    AND FC.FORM_ID = AX.FORM_ID
WHERE AX.FORM_ID IS NULL
;

--------------------------------------------
-- ------FC_INE_FRONTUR_MICRO---------------
--------------------------------------------

use role data_engineer;
use warehouse collect_wh;

CREATE or REPLACE TABLE DUMMYDB.PUBLIC.FC_INE_FRONTUR_MICRO
(
     YEAR_KEY	          NUMBER(10,0)
    ,MONTH_KEY	          NUMBER(10,0)
    ,SURVEY_TYPE_KEY      NUMBER(5,0)
    ,FORM_ID    	      VARCHAR(20)
    ,VISITOR_CATEGORY_KEY NUMBER(5,0)
    ,TRANSPORT_KEY	      NUMBER(5,0)
    ,COUNTRY_ORIGIN_KEY   NUMBER(5,0)
    ,REGION_DEST_KEY      NUMBER(5,0)
    ,ACCOMODATION_KEY     NUMBER(5,0)
    ,REASON_KEY           NUMBER(5,0)
    ,PAQ_FLG              NUMBER(1,0)
    ,NOS_KEY              NUMBER(5,0)
    ,FACTOR               FLOAT
    ,LOAD_TIME TIMESTAMP_LTZ default current_timestamp()
) ;

use role dev_da_fr;
use warehouse dev_transform_wh;

INSERT INTO DUMMYDB.PUBLIC.FC_INE_FRONTUR_MICRO
SELECT
    YEAR_KEY
    ,MONTH_KEY
    ,SURVEY_TYPE_KEY
    ,FORM_ID
    ,VISITOR_CATEGORY_KEY
    ,TRANSPORT_KEY
    ,COUNTRY_ORIGIN_KEY
    ,REGION_DEST_KEY
    ,ACCOMODATION_KEY
    ,REASON_KEY
    ,PAQ_FLG
    ,NOS_KEY
    ,FACTOR
    ,current_timestamp() LOAD_TIME
FROM DUMMYDB.PUBLIC.AX_INE_FRONTUR_MICRO
;
