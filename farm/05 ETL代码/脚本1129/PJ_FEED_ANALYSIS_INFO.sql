


-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_FEED_ANALYSIS_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牧场饲养分析数据
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



INSERT OVERWRITE TABLE BIGDATA_DM.PJ_FEED_ANALYSIS_INFO

SELECT  fodder_cost             
,fodder_lost             
,actual_eat              
,group_price             
,fodder_cost_period      
,fodder_lost_period      
,actual_eat_period       
,group_price_period      
,total_milk              
,total_milk_period       
,cows_count              
,cows_count_period       
,group_type              
,dry_milk_price          
,perin_cows_price        
,milk_cows_price         
,reserve_cows_price      
,calf_price              
,dry_milk_eat            
,perin_cows_eat          
,milk_cows_eat           
,reserve_cows_eat        
,calf_eat                
,dry_milk_price_period   
,perin_cows_price_period 
,milk_cows_price_period  
,reserve_cows_price_period
,calf_price_period       
,dry_milk_eat_period     
,perin_cows_eat_period   
,milk_cows_eat_period    
,reserve_cows_eat_period 
,calf_eat_period         
,atype_fodder_price
,btype_fodder_price
,ctype_fodder_price
,dtype_fodder_price
,atype_milk_prod
,btype_milk_prod
,ctype_milk_prod
,dtype_milk_prod
,atype_fodder_period
,btype_fodder_period
,ctype_fodder_period
,dtype_fodder_period
,atype_milk_period
,btype_milk_period
,ctype_milk_period
,dtype_milk_period

,dry_cows                
,locating_cows           
,reserve_cows            
,calf                    
,dry_cows_period         
,locating_cows_period    
,reserve_cows_period     
,calf_period             
,farm_type               
 ,cast(regexp_replace(report_date,'-','') as bigint )as report_date
 ,cast(regexp_replace(substr(report_date,1,7),'-','') as bigint ) as report_month          
,farm_code               
,farm_name               
,big_area_name           
,area_name               
,cities_name  
 FROM BIGDATA_DW.W_FEED_ANALYSIS_INFO
 
 ;








INSERT OVERWRITE TABLE BIGDATA_DM.PJ_FEED_ANALYSIS_TABLE

SELECT 
fodder_cost
 ,fodder_lost
 ,actual_eat
 ,group_price
 ,fodder_cost_period
 ,fodder_lost_period
 ,actual_eat_period
 ,group_price_period
 ,total_milk
 ,total_milk_period
 ,cows_count
 ,cows_count_period
 ,group_type
,case when group_type = '干奶牛' then 1
when group_type = '围产牛' then 2 
when group_type = '泌乳牛' then 3
when group_type = '后备牛' then 4
when group_type = '犊牛'   then 5
else 6
 end as order_column 
 ,farm_type    
 ,cast(regexp_replace(report_date,'-','') as bigint )as report_date
 ,cast(regexp_replace(substr(report_date,1,7),'-','') as bigint ) as report_month
 ,farm_code    
 ,farm_name    
 ,big_area_name
 ,area_name    
 ,cities_name  
 FROM BIGDATA_DW.W_FEED_ANALYSIS_INFO

 
 ;





----- 饲养分析按分群统计搅拌量 和偏差量
insert overwrite table BIGDATA_DM.PJ_FEED_ACTUAL_ERROR
 select 
 t2.dev_plan_qty
,t2.actual_qty
,t2.mix_error
,t2.user_grp_type_name
,case when t2.user_grp_type_name = '高产牛' then 1
when t2.user_grp_type_name = '中产牛' then 2
when t2.user_grp_type_name = '低产牛' then 3
when t2.user_grp_type_name = '干奶牛' then 4
when t2.user_grp_type_name = '围产牛' then 5

when t2.user_grp_type_name = '断奶犊牛' then 6
when t2.user_grp_type_name = '后备牛' then 7
when t2.user_grp_type_name = '其他' then 8
end as order_column 

,cast(regexp_replace(t2.mix_dt ,'-','') as bigint ) as report_date
,cast(regexp_replace(substr(t2.mix_dt,1,7),'-','') as bigint ) as report_month
,t3.farm_code
,t3.farm_name
,t3.farm_org_name2 as big_area_name
,t3.farm_org_name3 as area_name
,t3.farm_org_name4 as cities_name
 from 
 (
 select 
   sum(dev_plan_qty) as dev_plan_qty
   ,sum(actual_qty) as actual_qty
   ,sum(mix_error) as mix_error
   ,user_grp_type_name
   ,farm_code
   ,mix_dt
   from 
   (
   select  if(dev_plan_qty is null , 0,dev_plan_qty) as dev_plan_qty
   ,if(actual_qty is null ,0, actual_qty) as actual_qty
   --- 搅拌误差 = 实际 - 计划
   ,(if(actual_qty is null ,0, actual_qty) - if(dev_plan_qty is null , 0,dev_plan_qty)) as mix_error
   ,case when user_grp_type_name like '%高产%' then '高产牛'
   when user_grp_type_name like '%中产%' then '中产牛'
   when user_grp_type_name like '%低产%' then '低产牛'
   when user_grp_type_name like '%干奶%' then '干奶牛'
   when user_grp_type_name like '%围产%' then '围产牛'
   when user_grp_type_name like '%犊牛%' then '断奶犊牛'
   when user_grp_type_name like '%青年%' then '后备牛'
   when user_grp_type_name like '%育成%' then '后备牛'
   else '其他' end as user_grp_type_name
   ,farm_code
   ,substr(mix_dt,1,10) as  mix_dt
  from data_lake.d_evt_tmr_mix_dtl  where mix_dt is not null 
   )t1 group by 
   user_grp_type_name,
   farm_code,
   mix_dt 
   ) t2 left join data_lake.d_pty_farm_base t3 on t2.farm_code = t3.farm_code
   ;
   