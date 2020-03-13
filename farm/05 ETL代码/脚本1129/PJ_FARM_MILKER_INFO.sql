
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FARM_MILKER_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牧场挤奶机数据
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




insert  overwrite table BIGDATA_DM.PJ_FARM_MILKER_INFO 



select t1.milker_count 
,t2.milker_count as milker_count_total
,t1.year_month
,t1.milking_spot_brand
,t1.auto_type
,t1.auto_clean_type
,t1.maintenance_type
,t1.install_years_type
,t1.big_area_name
,t1.area_name



 from 

(select 
     count(id) as milker_count 
   
     ,year_month
     ,milking_spot_brand
     ,auto_type
     ,auto_clean_type
     ,maintenance_type
     ,install_years_type
     ,big_area_name
     ,area_name

     from BIGDATA_DW.W_FARM_MILKER_INFO t1

     where  year_month is not null
     group by year_month
     ,milking_spot_brand
     ,auto_type
     ,auto_clean_type
     ,maintenance_type
     ,install_years_type
     ,big_area_name
     ,area_name
) t1 left join 

(select 
     count(id) as milker_count 
   
     ,year_month
    
     from BIGDATA_DW.W_FARM_MILKER_INFO t1
     where  year_month is not null
    
     group by year_month
     
) t2 on t1.year_month = t2.year_month
 ;







