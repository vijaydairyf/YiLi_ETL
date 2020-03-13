

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FARM_AREA_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 供应商信息大区牧场关系数据
--=============================================================================
-- creation date:       2019-11-27
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
--2019-11-27 capgemini       
-------------------------------------------------------------------------------

  
INSERT overwrite table BIGDATA_DM.PJ_FARM_AREA_INFO 


select    
cast(regexp_replace(substr(open_station_dt,1,10),'-','') as bigint ) as open_date
,cast(regexp_replace(substr(close_station_dt,1,10),'-','') as bigint ) as close_date
,cast(regexp_replace(substr(open_station_dt,1,7),'-','') as bigint ) as open_month
,cast(regexp_replace(substr(close_station_dt,1,7),'-','') as bigint ) as close_month

,farm_id
,farm_code
,farm_name
,farm_org_id2   as big_area_id
,farm_org_code2 as big_area_code
,farm_org_name2 as big_area_name
,farm_org_id3   as area_id
,farm_org_code3 as area_code
,farm_org_name3 as area_name
,farm_org4_id   as cities_id
,farm_org_code4 as cities_code
,farm_org_name4 as cities_name 
from data_lake.d_pty_farm_base 


;
