

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_PREDICT_CALVE_DRYMILK_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 预计产犊干奶数据
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


insert  overwrite table BIGDATA_DM.PJ_PREDICT_CALVE_DRYMILK_INFO 

select sum(pre_3mon_calve_cows) as pre_3mon_calve_cows
,sum(pre_3mon_dry_cows) as pre_3mon_dry_cows
,sum(next_1mon_calve_cows ) as next_1mon_calve_cows
,sum(next_1mon_dry_cows ) as next_1mon_dry_cows
,sum(next_2mon_calve_cows ) as next_2mon_calve_cows
,sum( next_2mon_dry_cows) as next_2mon_dry_cows
,sum(next_3mon_calve_cows ) as next_3mon_calve_cows
,sum(next_3mon_dry_cows ) as next_3mon_dry_cows
,cast(regexp_replace(report_month,'-','') as bigint ) as report_month
,farm_name
,big_area_name
,area_name
,cities_name
from BIGDATA_DW.W_PREDICT_CALVE_DRYMILK_INFO

group by report_month
,farm_name
,big_area_name
,area_name
,cities_name

;
