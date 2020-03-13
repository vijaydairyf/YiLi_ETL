
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_BUY_COW_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 新购牛数仓表数据
--=============================================================================
-- creation date:       2019-11-29
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
--2019-11-29 capgemini       
-------------------------------------------------------------------------------


insert overwrite table BIGDATA_DW.W_BUY_COW_INFO 
select 
    ear_no
   ,entry_type
   ,entry_src
   ,case when grow_stat in ('泌乳牛','干奶牛') then '成母牛'  
         when grow_stat in ('青年牛','育成牛','断奶犊牛','哺乳犊牛') then '后备牛' 
        
    end as    grow_stat
   ,case when grow_stat in ('青年牛','育成牛','断奶犊牛','哺乳犊牛','泌乳牛','干奶牛') then 1 else 0 end as new_cows      
   ,case when grow_stat in ('泌乳牛','干奶牛') then 1 else 0 end as new_adult_cows   
   ,case when grow_stat in ('青年牛','育成牛','断奶犊牛','哺乳犊牛') then 1 else 0 end as new_reserve_cows
   ,substr(entry_dt,1,10) as report_date
   ,substr(entry_dt,1,7) as report_month
   ,t2.farm_name    
   ,t2.farm_org_name2 as big_area_name
   ,t2.farm_org_name3 as area_name
   ,t2.farm_org_name4 as cities_name

     from ( 
         select * from    data_lake.d_evt_dairy_cow_entry  where entry_src in ( '买进','国内购入','进口' ) and grow_stat  in ('青年牛','育成牛','断奶犊牛','哺乳犊牛','泌乳牛','干奶牛')
    ) t1
   left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code
   ;

   
   
   
------ 首页区域维度信息统计
---
---
-----
  
  
  
  
INSERT overwrite table BIGDATA_DW.W_AREA_INFO 


select    
count(1) 
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
group by 
farm_org_id2  
,farm_org_code2
,farm_org_name2
,farm_org_id3  
,farm_org_code3
,farm_org_name3
,farm_org4_id  
,farm_org_code4
,farm_org_name4

;

   
   
   
   
   
   
   
   
   
   