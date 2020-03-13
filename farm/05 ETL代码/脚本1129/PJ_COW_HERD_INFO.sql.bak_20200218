
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_COW_HERD_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 牛只分析指标数据
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




---   ('15142', '15019') 两个牧场信息 没有城市信息
--
---
--- 


insert overwrite table BIGDATA_DM.PJ_COW_HERD_INFO 

select 
 sum(total_cows        ) as total_cows        
,sum(adult_cows         )as adult_cows        
,sum(dry_cows           )as dry_cows          
,sum(locating_cows      )as locating_cows     
,sum(milk_cows          )as milk_cows         
,sum(perinatal_cows     )as perinatal_cows    
,sum(gl_cows            )as gl_cows           
,sum(new_born_unresist  )as new_born_unresist 
,sum(medcine_cows       )as medcine_cows      
,sum(quar_other_cows    )as quar_other_cows   
,sum(reserve_cows       )as reserve_cows      
,sum(lactation_calf     )as lactation_calf    
,sum(weaning_calf       )as weaning_calf      
,sum(bred_cows          )as bred_cows         
,sum(youth_cows         )as youth_cows        
,sum(new_cows           )as new_cows          
,sum(new_adult_cows     )as new_adult_cows    
,sum(new_reserve_cows   )as new_reserve_cows  
,sum(new_lactation_calf )as new_lactation_calf
,sum(new_weaning_calf   )as new_weaning_calf  
,sum(new_bred_cows      )as new_bred_cows     
,sum(new_youth_cows     )as new_youth_cows    
,sum(amount_1Lac        )as amount_1Lac       
,sum(amount_2Lac        )as amount_2Lac       
,sum(amount_3Lac        )as amount_3Lac       
,sum(amount_4Lac        )as amount_4Lac       
,sum(amount_5Lac        )as amount_5Lac       
,sum( total_cows_period    ) as total_cows_period   
,sum( adult_cows_period    ) as adult_cows_period    
,sum( dry_cows_period      ) as dry_cows_period      
,sum( perinatal_cows_period) as perinatal_cows_period
,sum( gl_cows_period       ) as gl_cows_period       
,sum( reserve_cows_period  ) as  reserve_cows_period
,sum( lactation_calf_period) as lactation_calf_period
,sum( weaning_calf_period  ) as weaning_calf_period  
,sum( bred_cows_period     ) as bred_cows_period     
,sum( youth_cows_period    ) as youth_cows_period    
,sum( amount_1Lac_period   ) as amount_1Lac_period   
,sum( amount_2Lac_period   ) as amount_2Lac_period   
,sum( amount_3Lac_period   ) as amount_3Lac_period   
,sum( amount_4Lac_period   ) as amount_4Lac_period   
,sum( amount_5Lac_period   ) as amount_5Lac_period   
-- 固定站字段不用
,null as fixed_start_date
,null as fixed_end_date
,report_date
--- 数据时间作为情期字段查询
,report_date as estrus_period
,report_month
,farm_code
,farm_name
,big_area_name       
,area_name          
,cities_name  

from (



--- 计算同期数据 
select 
  if(total_cows         is null,0,total_cows         ) as total_cows        ,
  if(adult_cows         is null,0,adult_cows         ) as adult_cows        ,
  if(dry_cows           is null,0,dry_cows           ) as dry_cows          ,
  if(locating_cows      is null,0,locating_cows      ) as locating_cows     ,
  if(milk_cows          is null,0,milk_cows          ) as milk_cows         ,
  if(perinatal_cows     is null,0,perinatal_cows     ) as perinatal_cows    ,
  if(gl_cows            is null,0,gl_cows            ) as gl_cows           ,
  if(new_born_unresist  is null,0,new_born_unresist  ) as new_born_unresist ,
  if(medcine_cows       is null,0,medcine_cows       ) as medcine_cows      ,
  if(quar_other_cows    is null,0,quar_other_cows    ) as quar_other_cows   ,
  if(reserve_cows       is null,0,reserve_cows       ) as reserve_cows      ,
  if(lactation_calf     is null,0,lactation_calf     ) as lactation_calf    ,
  if(weaning_calf       is null,0,weaning_calf       ) as weaning_calf      ,
  if(bred_cows          is null,0,bred_cows          ) as bred_cows         ,
  if(youth_cows         is null,0,youth_cows         ) as youth_cows        ,
  if(new_cows           is null,0,new_cows           ) as new_cows          ,
  if(new_adult_cows     is null,0,new_adult_cows     ) as new_adult_cows    ,
  if(new_reserve_cows   is null,0,new_reserve_cows   ) as new_reserve_cows  ,
  if(new_lactation_calf is null,0,new_lactation_calf ) as new_lactation_calf,
  if(new_weaning_calf   is null,0,new_weaning_calf   ) as new_weaning_calf  ,
  if(new_bred_cows      is null,0,new_bred_cows      ) as new_bred_cows     ,
  if(new_youth_cows     is null,0,new_youth_cows     ) as new_youth_cows    ,
  if(amount_1Lac        is null,0,amount_1Lac        ) as amount_1Lac       ,
  if(amount_2Lac        is null,0,amount_2Lac        ) as amount_2Lac       ,
  if(amount_3Lac        is null,0,amount_3Lac        ) as amount_3Lac       ,
  if(amount_4Lac        is null,0,amount_4Lac        ) as amount_4Lac       ,
  if(amount_5Lac        is null,0,amount_5Lac        ) as amount_5Lac       ,
  0 as total_cows_period  ,
  0 as adult_cows_period      ,
  0 as dry_cows_period       ,
  0 as perinatal_cows_period    ,
  0 as gl_cows_period         ,
  0 as reserve_cows_period,
  0 as lactation_calf_period  ,
  0 as weaning_calf_period   ,
  0 as bred_cows_period      ,
  0 as youth_cows_period     ,
  0 as amount_1Lac_period    ,
  0 as amount_2Lac_period    ,
  0 as amount_3Lac_period    ,
  0 as amount_4Lac_period    ,
  0 as amount_5Lac_period    ,
      
  cast(regexp_replace(substr(fixed_start_date,1,10),'-','') as bigint ) as fixed_start_date,
  cast(regexp_replace(substr(fixed_end_date,1,7),'-','') as bigint ) as fixed_end_date,
  cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ) as report_date,
  cast(regexp_replace(substr(report_date,1,7),'-','') as bigint ) as report_month,
 farm_code           ,
  farm_name           ,
  big_area_name       ,

  area_name           ,

  cities_name  
  from BIGDATA_DW.W_COW_HERD_INFO 


 union  all 
-- 同期数据

  select 


  0 as total_cows     ,
  0 as adult_cows     ,
  0 as dry_cows       ,
  0 as locating_cows  ,
  0 as milk_cows      ,
  0 as perinatal_cows ,
  0 as gl_cows        ,
  0 as new_born_unresist   ,
  0 as medcine_cows        ,
  0 as quar_other_cows     ,
  0 as reserve_cows        ,
  0 as lactation_calf      ,
  0 as weaning_calf        ,
  0 as bred_cows           ,
  0 as youth_cows          ,
  0 as new_cows            ,
  0 as new_adult_cows      ,
  0 as new_reserve_cows    ,
  0 as new_lactation_calf  ,
  0 as new_weaning_calf    ,
  0 as new_bred_cows       ,
  0 as new_youth_cows      ,
  0 as amount_1Lac        ,
  0 as amount_2Lac         ,
  0 as amount_3Lac         ,
  0 as amount_4Lac         ,
  0 as amount_5Lac         ,
 if(total_cows     is null,0,total_cows     ) as total_cows_period       ,
 if(adult_cows     is null,0,adult_cows     ) as adult_cows_period       ,
 if(dry_cows       is null,0,dry_cows       ) as dry_cows_period         ,
 if(perinatal_cows is null,0,perinatal_cows ) as perinatal_cows_period   ,
 if(gl_cows        is null,0,gl_cows        ) as gl_cows_period         ,
 if(reserve_cows   is null,0,reserve_cows   ) as reserve_cows_period    ,
 if(lactation_calf is null,0,lactation_calf ) as    lactation_calf_period  ,
 if(weaning_calf   is null,0,weaning_calf   ) as weaning_calf_period    ,
 if(bred_cows      is null,0,bred_cows      ) as bred_cows_period       ,
 if(youth_cows     is null,0,youth_cows     ) as   youth_cows_period      ,
 if(amount_1Lac    is null,0,amount_1Lac    ) as amount_1Lac_period     ,
 if(amount_2Lac    is null,0,amount_2Lac    ) as amount_2Lac_period     ,
 if(amount_3Lac    is null,0,amount_3Lac    ) as amount_3Lac_period     ,
 if(amount_4Lac    is null,0,amount_4Lac    ) as amount_4Lac_period     ,
 if(amount_5Lac    is null,0,amount_5Lac    ) as amount_5Lac_period     ,

 cast(regexp_replace(substr(fixed_start_date,1,10),'-','') as bigint ) as fixed_start_date,
 cast(regexp_replace(substr(fixed_end_date,1,7),'-','') as bigint ) as fixed_end_date,
 
 cast(regexp_replace(add_months(substr(report_date,1,10),12),'-','') as bigint ) as report_date,
 cast(regexp_replace(substr(add_months(substr(report_date,1,10),12),1,7),'-','') as bigint ) as report_month,
 farm_code           ,
  farm_name           ,
  big_area_name       ,

  area_name           ,

  cities_name  
  from BIGDATA_DW.W_COW_HERD_INFO 


) t1 group by 
report_date
,report_month
,big_area_name       
,area_name          
,cities_name  
,  farm_name  
,farm_code        


;



-----
--
--牛只分析月报数据 
---- 数据取值为取每月最后一天数据


 
 insert  overwrite table BIGDATA_DM.PJ_COW_HERD_MONTH_INFO 
 select t3.*
 from (
    select cast(regexp_replace(last_day(concat(substr(report_month,1,4),'-',substr(report_month,5,2),'-01')),'-','') as bigint ) as report_date
    ,farm_code
    from (
    select report_month ,farm_code,count(1) 
    from BIGDATA_DM.PJ_COW_HERD_INFO group by farm_code,report_month
    ) t1 
 ) t2 
 inner join BIGDATA_DM.PJ_COW_HERD_INFO  t3 on t2.report_date = t3.report_date 
 and t2.farm_code = t3.farm_code
 ;
 



  
  

---- 隔离牛 饼图统计 
-- 
--
----


insert overwrite table    BIGDATA_DM.PJ_COW_GL_TABLE
   select medcine_cows  ,'用药牛'  as cow_type ,report_date, report_month,1 as data_type ,farm_code,farm_name,big_area_name,area_name,cities_name from BIGDATA_DM.PJ_COW_HERD_INFO
   union all 
   select quar_other_cows ,'其他隔离牛'  as cow_type ,report_date, report_month,1 as data_type ,farm_code,farm_name,big_area_name,area_name,cities_name from BIGDATA_DM.PJ_COW_HERD_INFO
   union all 
   ----  隔离牛 月报数据
   select medcine_cows  ,'用药牛'  as cow_type ,report_date,report_month,2 as data_type ,farm_code,farm_name,big_area_name,area_name,cities_name from BIGDATA_DM.PJ_COW_HERD_MONTH_INFO
   union all 
   select quar_other_cows ,'其他隔离牛'  as cow_type ,report_date,report_month,2 as data_type ,farm_code,farm_name,big_area_name,area_name,cities_name from BIGDATA_DM.PJ_COW_HERD_MONTH_INFO
   ;






----
-- 获取繁殖率  成母牛 禁配牛的数量
----
--

 
 
 insert overwrite table BIGDATA_DM.PJ_COW_HERD_DAY_INFO

select  tc.adult_cows
,tc.adult_cows_period
,tc.youth_cows 
,tc.youth_cows_period
,(tc.adult_cows + tc.youth_cows ) as last_year_cows
,(tc.adult_cows_period +tc.youth_cows_period ) as last_year_cows_period
,tf.adult_forbid_cows 
,tf.youth_forbid_cows
,(tf.adult_forbid_cows  + tf.youth_forbid_cows) as forbid_cows
,tf.adult_forbid_cows_period
,tf.youth_forbid_cows_period 
,(tf.adult_forbid_cows_period + tf.youth_forbid_cows_period) as forbid_cows_period
,tc.report_month
,tc.report_year
,tc.farm_name
,tc.big_area_name
,tc.area_name
,tc.cities_name

 from 
(
--- 获取去年12 月底的 禁配牛信息数据
select sum(adult_cows) as adult_cows
      ,sum(youth_cows) as youth_cows
      ,sum(adult_cows_period) as adult_cows_period
      ,sum(youth_cows_period) as youth_cows_period
      ,t2.report_month 
      ,t2.report_year
-- 获取选择时间前一年年份
      ,substr((t2.report_year-1),1,4) as pre_report_year
      ,t3.farm_code
      ,t3.farm_name
      ,t3.cities_name
      ,t3.area_name
      ,t3.big_area_name
from 
  (
  select   farm_code
  
           ,report_month 
           ,substr(report_month,1,4) as report_year
           
             -- 去年 12月31日
           ,cast(regexp_replace(concat(substr(substr(report_month,1,4)-1,1,4),'-12-31'),'-','') as bigint ) as last_year_day
        
             -- 获取上月最后一天日期
            , cast(regexp_replace(date_add(concat (substr(substr(cast(report_month as String),1,4) - 1,1,4),'-',substr(cast(report_month as String),5,2),'-01'),-1),'-','') as bigint )  as last_year_int_date
            from (
              SELECT farm_code,report_month
             ,count(1) from BIGDATA_DM.PJ_COW_HERD_INFO group by report_month,farm_code
             ) t1 
  ) t2 left join BIGDATA_DM.PJ_COW_HERD_INFO  t3 
          on t2.farm_code = t3.farm_code 
          and  t2.last_year_day = t3.report_date
   where t3.farm_code is not null 

  group by t3.farm_code
   ,t3.farm_name
           ,t3.cities_name
            ,t3.area_name
            ,t3.big_area_name 
 ,t2.report_month 
 ,t2.report_year
 ) tc
 left join (
 ---  禁配牛数据
 
 select sum(adult_forbid_cows) as adult_forbid_cows
,sum(youth_forbid_cows        ) as youth_forbid_cows       
,sum(adult_forbid_cows_period ) as adult_forbid_cows_period
,sum(youth_forbid_cows_period ) as youth_forbid_cows_period
,report_year,big_area_name,area_name,cities_name,farm_name ,farm_code


from 

(
 select sum(if(adult_forbid_cows is null ,0,adult_forbid_cows )) as adult_forbid_cows
 ,sum(if(youth_forbid_cows is null ,0 ,youth_forbid_cows )) as youth_forbid_cows 
 ,0 as adult_forbid_cows_period
 ,0 as youth_forbid_cows_period
 ,year as report_year,big_area_name,area_name,cities_name,farm_name ,farm_code
 from (
  
   select ear_no,cow_id,growth_stat,forbid_dt,cancel_forbid_dt,year,result
         ,case when  result = 1 and growth_stat in( '成母牛','干奶牛','泌乳牛') then 1 else 0 end as adult_forbid_cows
        ,case when  result = 1 and growth_stat = '青年牛' then 1 else 0 end as youth_forbid_cows
        ,t2.farm_code
        ,t2.farm_name 
       ,t2.farm_org_name2 as big_area_name
       
       ,t2.farm_org_name3 as area_name
       
       ,t2.farm_org_name4 as cities_name
             from (
      select t1.ear_no,t1.cow_id
      ,t1.grow_stat AS growth_stat
      ,cast(regexp_replace(substr(t1.forbid_dt,1,10),'-','') as bigint ) as forbid_dt
      ,cast(regexp_replace(substr(t2.cancelforbiddate,1,10),'-','') as bigint ) as cancel_forbid_dt
    , concat (substr(t1.forbid_dt,1,4),'-12-31') as index_date
    ,substr(t1.forbid_dt,1,4) as year
      --- 判断  当起始时间小于 选择年份最后一天且年份最后一天 小于解禁时间
   , case when cast(regexp_replace(concat (substr(t1.forbid_dt,1,4),'-12-31'),'-','') as bigint)>= cast(regexp_replace(substr(t1.forbid_dt,1,10),'-','')as bigint)  and cast(regexp_replace(concat (substr(t1.forbid_dt,1,4),'-12-31'),'-','') as bigint)<cast(regexp_replace(substr(t2.cancelforbiddate,1,10),'-','') as bigint) then 1 
    else 0 end as result
    ,t1.farm_code  
      from 
    (
    select cow_id, ear_no,farm_code,grow_stat,forbid_dt,Row_Number() OVER (partition by cow_id,ear_no,farm_code ORDER BY forbid_dt asc) rank 
    from data_lake.d_evt_dairy_cow_forbid 
    ) t1  left join 
    (select cow_id,earnum  as ear_no,farm_code,data_growstatus,data_forbiddate,cancelforbiddate,Row_Number() OVER (partition by cow_id,earnum,farm_code ORDER BY cancelforbiddate asc) rank 
    from data_lake.d_evt_dairy_cow_cancel_forbid   
    ) t2 on t1.cow_id = t2.cow_id and  t1.ear_no = t2.ear_no and t1.farm_code = t2.farm_code  and t1.rank = t2.rank
     where t1.ear_no is not null 
   ) t1 left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code
            
 ) t2 group by year,big_area_name,area_name,cities_name,farm_name ,t2.farm_code
 
 union all
 
  select 
   0 as adult_forbid_cows
 ,0 as youth_forbid_cows
  ,sum(if (adult_forbid_cows is null ,0,adult_forbid_cows )) as adult_forbid_cows_period
  ,sum(if(youth_forbid_cows is null ,0,youth_forbid_cows)) as youth_forbid_cows_period 

 ,substr(year +1,1,4) as year,big_area_name,area_name,cities_name,farm_name ,farm_code
 from 
      (
   select ear_no,cow_id,growth_stat,forbid_dt,cancel_forbid_dt,year,result
         ,case when  result = 1 and growth_stat in( '成母牛','干奶牛','泌乳牛') then 1 else 0 end as adult_forbid_cows
        ,case when  result = 1 and growth_stat = '青年牛' then 1 else 0 end as youth_forbid_cows  ,t2.farm_code
        ,t2.farm_name
       ,t2.farm_org_name2 as big_area_name
       
       ,t2.farm_org_name3 as area_name
       
       ,t2.farm_org_name4 as cities_name
             from (
      select t1.ear_no,t1.cow_id
      ,t1.grow_stat AS growth_stat
      ,cast(regexp_replace(substr(t1.forbid_dt,1,10),'-','') as bigint ) as forbid_dt
      ,cast(regexp_replace(substr(t2.cancelforbiddate,1,10),'-','') as bigint ) as cancel_forbid_dt
    , concat (substr(t1.forbid_dt,1,4),'-12-31') as index_date
    ,substr(t1.forbid_dt,1,4) as year
     --- 判断  当起始时间小于 选择年份最后一天且年份最后一天 小于解禁时间
   , case when cast(regexp_replace(concat (substr(t1.forbid_dt,1,4),'-12-31'),'-','') as bigint)>= cast(regexp_replace(substr(t1.forbid_dt,1,10),'-','')as bigint)  and cast(regexp_replace(concat (substr(t1.forbid_dt,1,4),'-12-31'),'-','') as bigint)<cast(regexp_replace(substr(t2.cancelforbiddate,1,10),'-','') as bigint) then 1 
    else 0 end as result
    ,t1.farm_code  
      from 
    (
    select cow_id, ear_no,farm_code,grow_stat,forbid_dt,Row_Number() OVER (partition by cow_id,ear_no,farm_code ORDER BY forbid_dt asc) rank 
    from data_lake.d_evt_dairy_cow_forbid 
    ) t1  left join 
    (select cow_id,earnum  as ear_no,farm_code,data_growstatus,data_forbiddate,cancelforbiddate,Row_Number() OVER (partition by cow_id,earnum,farm_code ORDER BY cancelforbiddate asc) rank 
    from data_lake.d_evt_dairy_cow_cancel_forbid   
    ) t2 on t1.cow_id = t2.cow_id and  t1.ear_no = t2.ear_no and t1.farm_code = t2.farm_code  and t1.rank = t2.rank
     where t1.ear_no is not null 
   ) t1 left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code
            
 ) t2   group by year,big_area_name,area_name,cities_name,farm_name ,farm_code

) t3 group by  report_year,big_area_name,area_name,cities_name,farm_name,farm_code
 )tf on tc.farm_code = tf.farm_code and tc.pre_report_year = tf.report_year ;
