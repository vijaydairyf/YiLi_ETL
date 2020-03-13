
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_COW_DISEASE_WEEDOUT_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 发病淘汰指标数据
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


insert overwrite table BIGDATA_DM.PJ_COW_DISEASE_WEEDOUT_INFO


select t4.sick_cows                
,t4.breath_sys_sick_cows    
,t4.disgestive_sys_sick_cows
,t4.mammitits_sick_cows     
,t4.limb_hoof_sick_cows     
,t4.breed_sys_sick_cows    
,t4.other_sick_cows         
,t4.death_cows     
,t4.weedout_cows     
,t4.sick_weedout_cows       
,t4.breath_sys_weedout_cows 
,t4.disge_sys_weedout_cows  
,t4.mammit_weedout_cows     
,t4.limb_hoof_weedout_cows  
,t4.breed_sys_weedout_cows  
,t4.other_sick_weedout_cows 
,t4.active_weedout_cows     
,t4.change_farm_cows        
,t4.sale_cows               
,t4.possive_weedout_cows
,t4.sick_cows_period               
,t4.breath_sys_sick_cows_period   
,t4.disgestive_sys_sick_cow_period
,t4.mammitits_sick_cows_period    
,t4.limb_hoof_sick_cows_period    
,t4.breed_sys_sick_cows_period    
,t4.other_sick_cows_period        
,t4.death_cows_period    
,t4.sick_weedout_cows_period      
,t4.breath_sys_weedout_cows_period
,t4.disge_sys_weedout_cows_period 
,t4.mammit_weedout_cows_period    
,t4.limb_hoof_weedout_cows_period 
,t4.breed_sys_weedout_cows_period 
,t4.other_sick_weedout_cows_period
,t4.weedout_cows_period 
,t4.active_weedout_cows_period    
,t4.change_farm_cows_period       
,t4.sale_cows_period              
,t4.possive_weedout_cows_period
,t4.cows_level1_code
,t4.cows_level2_code
,t4.disease_type
,t4.report_month
,t5.farm_name
,t5.farm_org_name2 as big_area_name
,t5.farm_org_name3 as area_name
,t5.farm_org_name4 as cities_name

from (
select sum(sick_cows               ) as sick_cows               
      ,sum(breath_sys_sick_cows    ) as breath_sys_sick_cows    
      ,sum(disgestive_sys_sick_cows) as disgestive_sys_sick_cows
       ,sum(mammitits_sick_cows    ) as mammitits_sick_cows     
       ,sum(limb_hoof_sick_cows    ) as limb_hoof_sick_cows     
       ,sum(breed_sys_sick_cows    ) as breed_sys_sick_cows    
       ,sum(other_sick_cows        ) as other_sick_cows         
       ,sum(death_cows             ) as death_cows     
       ,sum( weedout_cows          ) as weedout_cows     
       ,sum(sick_weedout_cows      ) as sick_weedout_cows       
       ,sum(breath_sys_weedout_cows) as breath_sys_weedout_cows 
       ,sum(disge_sys_weedout_cows ) as disge_sys_weedout_cows  
       ,sum(mammit_weedout_cows    ) as mammit_weedout_cows     
       ,sum(limb_hoof_weedout_cows ) as limb_hoof_weedout_cows  
       ,sum(breed_sys_weedout_cows ) as breed_sys_weedout_cows  
       ,sum(other_sick_weedout_cows) as other_sick_weedout_cows 
       ,sum(active_weedout_cows    ) as active_weedout_cows     
       ,sum(change_farm_cows       ) as change_farm_cows        
       ,sum(sale_cows              ) as sale_cows               
       ,sum(possive_weedout_cows   )  as possive_weedout_cows
       ,sum(sick_cows_period              ) as sick_cows_period               
       ,sum(breath_sys_sick_cows_period   ) as breath_sys_sick_cows_period   
       ,sum(disgestive_sys_sick_cow_period) as disgestive_sys_sick_cow_period
       ,sum(mammitits_sick_cows_period    ) as mammitits_sick_cows_period    
       ,sum(limb_hoof_sick_cows_period    ) as limb_hoof_sick_cows_period    
       ,sum(breed_sys_sick_cows_period    ) as breed_sys_sick_cows_period    
       ,sum(other_sick_cows_period        ) as other_sick_cows_period        
       ,sum(death_cows_period             ) as death_cows_period    
       ,sum(sick_weedout_cows_period      ) as sick_weedout_cows_period      
       ,sum(breath_sys_weedout_cows_period) as breath_sys_weedout_cows_period
       ,sum(disge_sys_weedout_cows_period ) as disge_sys_weedout_cows_period 
       ,sum(mammit_weedout_cows_period    ) as mammit_weedout_cows_period    
       ,sum(limb_hoof_weedout_cows_period ) as limb_hoof_weedout_cows_period 
       ,sum(breed_sys_weedout_cows_period ) as breed_sys_weedout_cows_period 
       ,sum(other_sick_weedout_cows_period) as other_sick_weedout_cows_period
       ,sum(weedout_cows_period           ) as weedout_cows_period 
       ,sum(active_weedout_cows_period    ) as active_weedout_cows_period    
       ,sum(change_farm_cows_period        )as change_farm_cows_period       
       ,sum(sale_cows_period               )as sale_cows_period              
       ,sum(possive_weedout_cows_period   ) as possive_weedout_cows_period
        ,cows_level1_code
        ,cows_level2_code
        ,disease_type
        ,farm_code
        ,substr(report_date,1,6) as report_month

     from (

--- 通过 union 拿到今年和去年的值
  select
         sum(if (sick_cows                is null , 0 , sick_cows               )) as sick_cows               
        ,sum(if (breath_sys_sick_cows     is null , 0 , breath_sys_sick_cows    )) as breath_sys_sick_cows    
        ,sum(if (disgestive_sys_sick_cows is null , 0 , disgestive_sys_sick_cows)) as disgestive_sys_sick_cows
        ,sum(if (mammitits_sick_cows      is null , 0 , mammitits_sick_cows     )) as mammitits_sick_cows     
        ,sum(if (limb_hoof_sick_cows      is null , 0 , limb_hoof_sick_cows     )) as limb_hoof_sick_cows     
        ,sum(if (breed_sys_sick_cows      is null , 0 , breed_sys_sick_cows     )) as breed_sys_sick_cows    
        ,sum(if (other_sick_cows          is null , 0 , other_sick_cows         )) as other_sick_cows         
        ,sum(if (death_cows               is null , 0 , death_cows              )) as death_cows     
        ,sum(if (weedout_cows             is null , 0 , weedout_cows            ))  as weedout_cows     
        ,sum(if (sick_weedout_cows        is null , 0 , sick_weedout_cows       )) as sick_weedout_cows       
        ,sum(if (breath_sys_weedout_cows  is null , 0 , breath_sys_weedout_cows )) as breath_sys_weedout_cows 
        ,sum(if (disge_sys_weedout_cows   is null , 0 , disge_sys_weedout_cows  )) as disge_sys_weedout_cows  
        ,sum(if (mammit_weedout_cows      is null , 0 , mammit_weedout_cows     )) as mammit_weedout_cows     
        ,sum(if (limb_hoof_weedout_cows   is null , 0 , limb_hoof_weedout_cows  )) as limb_hoof_weedout_cows  
        ,sum(if (breed_sys_weedout_cows   is null , 0 , breed_sys_weedout_cows  )) as breed_sys_weedout_cows  
        ,sum(if (other_sick_weedout_cows  is null , 0 , other_sick_weedout_cows )) as other_sick_weedout_cows 
        ,sum(if (active_weedout_cows      is null , 0 , active_weedout_cows     )) as active_weedout_cows     
        ,sum(if (change_farm_cows         is null , 0 , change_farm_cows        )) as change_farm_cows        
        ,sum(if (sale_cows                is null , 0 , sale_cows               )) as sale_cows               
        ,sum(if (possive_weedout_cows     is null , 0 , possive_weedout_cows    )) as possive_weedout_cows
        , 0 as sick_cows_period               
        , 0 as breath_sys_sick_cows_period   
        , 0  as disgestive_sys_sick_cow_period
        , 0 as mammitits_sick_cows_period    
        , 0 as limb_hoof_sick_cows_period    
        , 0 as breed_sys_sick_cows_period    
        , 0 as other_sick_cows_period        
        , 0 as death_cows_period    
        , 0 as sick_weedout_cows_period      
        , 0 as breath_sys_weedout_cows_period
        , 0 as disge_sys_weedout_cows_period 
        , 0 as mammit_weedout_cows_period    
        , 0 as limb_hoof_weedout_cows_period 
        , 0 as breed_sys_weedout_cows_period 
        , 0 as other_sick_weedout_cows_period
        , 0 as weedout_cows_period 
        , 0 as active_weedout_cows_period    
        , 0 as change_farm_cows_period       
        , 0 as sale_cows_period              
        , 0 as possive_weedout_cows_period
        ,cows_level1_code
        ,cows_level2_code
        ,disease_type
        ,td.farm_code
        ,cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ) as report_date
        
        
        from (

           select cow_id   
             ,ear_no   
             ,month_age
             ,milk_day 
             ,growth_stat  
              -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
             
             ,disease_type 
             ,disease_name 
             ,sick_cows
             ,breath_sys_sick_cows
             ,disgestive_sys_sick_cows
             ,mammitits_sick_cows 
             ,limb_hoof_sick_cows 
             ,breed_sys_sick_cows 
             ,other_sick_cows 
             ,death_cows  
             ,weedout_cows
             ,sick_weedout_cows   
             ,breath_sys_weedout_cows 
             ,disge_sys_weedout_cows  
             ,mammit_weedout_cows 
             ,limb_hoof_weedout_cows  
             ,breed_sys_weedout_cows  
             ,other_sick_weedout_cows 
             ,exit_type   
             ,exit_reason 
             ,data_type
             ,cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ) as report_date
             
             ,active_weedout_cows 
             ,change_farm_cows
             ,sale_cows   
             ,possive_weedout_cows
              ,td.farm_code
           from(select * from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO 
         ) td 
          

       )td group by cows_level1_code
       ,cows_level2_code
       ,disease_type
       ,td.farm_code
       ,cast(regexp_replace(substr(report_date,1,10),'-','') as bigint )
      
 union all 


   select
         0 as sick_cows               
        , 0 as breath_sys_sick_cows    
        , 0 as disgestive_sys_sick_cows
        , 0 as mammitits_sick_cows     
        , 0 as limb_hoof_sick_cows     
        , 0 as breed_sys_sick_cows    
        , 0 as other_sick_cows         
        , 0 as death_cows     
        , 0  as weedout_cows     
        , 0 as sick_weedout_cows       
        , 0 as breath_sys_weedout_cows 
        , 0 as disge_sys_weedout_cows  
        , 0 as mammit_weedout_cows     
        , 0 as limb_hoof_weedout_cows  
        , 0 as breed_sys_weedout_cows  
        , 0 as other_sick_weedout_cows 
        , 0 as active_weedout_cows     
        , 0 as change_farm_cows        
        , 0 as sale_cows               
        , 0 as possive_weedout_cows
        ,sum(if (sick_cows                is null , 0 , sick_cows               )) as sick_cows_period               
        ,sum(if (breath_sys_sick_cows     is null , 0 , breath_sys_sick_cows    )) as breath_sys_sick_cows_period   
        ,sum(if (disgestive_sys_sick_cows is null , 0 , disgestive_sys_sick_cows))  as disgestive_sys_sick_cow_period
        ,sum(if (mammitits_sick_cows      is null , 0 , mammitits_sick_cows     )) as mammitits_sick_cows_period    
        ,sum(if (limb_hoof_sick_cows      is null , 0 , limb_hoof_sick_cows     )) as limb_hoof_sick_cows_period    
        ,sum(if (breed_sys_sick_cows      is null , 0 , breed_sys_sick_cows     )) as breed_sys_sick_cows_period    
        ,sum(if (other_sick_cows          is null , 0 , other_sick_cows         )) as other_sick_cows_period        
        ,sum(if (death_cows               is null , 0 , death_cows              )) as death_cows_period    
        ,sum(if (weedout_cows             is null , 0 , weedout_cows            )) as sick_weedout_cows_period      
        ,sum(if (sick_weedout_cows        is null , 0 , sick_weedout_cows       )) as breath_sys_weedout_cows_period
        ,sum(if (breath_sys_weedout_cows  is null , 0 , breath_sys_weedout_cows )) as disge_sys_weedout_cows_period 
        ,sum(if (disge_sys_weedout_cows   is null , 0 , disge_sys_weedout_cows  )) as mammit_weedout_cows_period    
        ,sum(if (mammit_weedout_cows      is null , 0 , mammit_weedout_cows     )) as limb_hoof_weedout_cows_period 
        ,sum(if (limb_hoof_weedout_cows   is null , 0 , limb_hoof_weedout_cows  )) as breed_sys_weedout_cows_period 
        ,sum(if (breed_sys_weedout_cows   is null , 0 , breed_sys_weedout_cows  )) as other_sick_weedout_cows_period
        ,sum(if (other_sick_weedout_cows  is null , 0 , other_sick_weedout_cows )) as weedout_cows_period 
        ,sum(if (active_weedout_cows      is null , 0 , active_weedout_cows     )) as active_weedout_cows_period    
        ,sum(if (change_farm_cows         is null , 0 , change_farm_cows        )) as change_farm_cows_period       
        ,sum(if (sale_cows                is null , 0 , sale_cows               )) as sale_cows_period              
        ,sum(if (possive_weedout_cows     is null , 0 , possive_weedout_cows    )) as possive_weedout_cows_period
      ,cows_level1_code
      ,cows_level2_code
      ,disease_type
       ,farm_code
       ,cast(regexp_replace(substr(report_date,1,10),'-','') as bigint ) as report_date

from (
      select cow_id   
      ,ear_no   
      ,month_age
      ,milk_day 
      ,growth_stat  
        -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
      
      ,disease_type 
      ,disease_name 
      ,sick_cows
      ,breath_sys_sick_cows
      ,disgestive_sys_sick_cows
      ,mammitits_sick_cows 
      ,limb_hoof_sick_cows 
      ,breed_sys_sick_cows 
      ,other_sick_cows 
      ,death_cows  
      ,weedout_cows
      ,sick_weedout_cows   
      ,breath_sys_weedout_cows 
      ,disge_sys_weedout_cows  
      ,mammit_weedout_cows 
      ,limb_hoof_weedout_cows  
      ,breed_sys_weedout_cows  
      ,other_sick_weedout_cows 
      ,exit_type   
      ,exit_reason 
      ,data_type
      ,substr(add_months(report_date,12 ),1,10) as report_date
      
      ,active_weedout_cows 
      ,change_farm_cows
      ,sale_cows   
      ,possive_weedout_cows
      ,farm_code 
    from (select * from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO ) td 
           
      
    )t1 
  group by cows_level1_code
       ,cows_level2_code
       ,disease_type
       ,farm_code
       ,report_date 
)t3 group by cows_level1_code
        ,cows_level2_code
        ,disease_type
        ,farm_code
        ,substr(report_date,1,6)

) t4 left join data_lake.d_pty_farm_base t5 on t5.farm_code = t4.farm_code
;







---- 发病淘汰数据 柱状图展示数据
--
----

insert overwrite table BIGDATA_DM.PJ_COW_DISEASE_WEEDOUT_TABLE

select sum(cow_num) as cow_num
,sum(cow_num_period) as cow_num_period
,cows_level1_code
,cows_level2_code
,disease_type
,disease_name
,case when disease_type = '呼吸系统疾病' then 1
      when disease_type = '消化系统疾病' then 2
      when disease_type = '乳房炎'       then 3
      when disease_type = '肢蹄病'       then 4
      when disease_type = '繁殖系统疾病' then 5
      when disease_type = '其他疾病' then 6 end as order_column

,data_type
,cast(regexp_replace(substr(report_date,1,7),'-','') as bigint )
,farm_name
,big_area_name
,area_name
,cities_name
,exit_categ
,exit_type
,exit_reason
from (

select count(ear_no) as cow_num
, 0 as cow_num_period
,cows_level1_code
,cows_level2_code
,disease_type
,disease_name
,data_type
,report_date

,farm_name
,big_area_name
,area_name
,cities_name
,'0' as exit_categ
,'0' as exit_type
,'0' as exit_reason
from (
--- 将 union all 的数据进行求和 并分组
 select cow_id   
             ,ear_no   
             ,month_age
             ,milk_day 
             ,growth_stat  
            -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
             
             ,case when disease_type like '%呼吸%' then '呼吸系统疾病'
                   when disease_type like '%消化%' then '消化系统疾病'
                   when disease_type like '%乳房%' then '乳房炎'
                   when disease_type like '%肢%' then '肢蹄病' 
                   when disease_type like '%蹄%' then '肢蹄病' 
                   when disease_type like '%繁殖%' then '繁殖系统疾病'
                   when disease_type like '%子宫%' then '繁殖系统疾病'
                   when disease_type like '%卵巢%' then '繁殖系统疾病'
                   when disease_type like '%生殖%' then '繁殖系统疾病'
             else '其他疾病'  end as disease_type 
             ,disease_name 
             ,data_type
             ,report_date 
   
              ,farm_name
              ,big_area_name
              ,area_name
              ,cities_name
           from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO
           where data_type = 1
           
    )t2 group by cows_level1_code
,cows_level2_code
,disease_type
,disease_name
,data_type
,report_date
,farm_name
,big_area_name
,area_name
,cities_name 

union all 

      select 0 as cow_num
,count(ear_no) as cow_num_period
      ,cows_level1_code
      ,cows_level2_code
      ,disease_type
      ,disease_name
      ,data_type
      ,add_months(report_date,12) as report_date
      ,farm_name
      ,big_area_name
      ,area_name
      ,cities_name
,'0' as exit_categ
,'0' as exit_type
,'0' as exit_reason
      from (
      
       select cow_id   
                   ,ear_no   
                   ,month_age
                   ,milk_day 
                   ,growth_stat  
                   -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
   
                   ,case when  disease_type like '%呼吸%' then '呼吸系统疾病'
                          when disease_type like '%消化%' then '消化系统疾病'
                          when disease_type like '%乳房%' then '乳房炎'
                          when disease_type like '%肢%' then '肢蹄病' 
                          when disease_type like '%蹄%' then '肢蹄病' 
                          when disease_type like '%繁殖%' then '繁殖系统疾病'
                           when disease_type like '%子宫%' then '繁殖系统疾病'
                          when disease_type like '%卵巢%' then '繁殖系统疾病'
                           when disease_type like '%生殖%' then '繁殖系统疾病'
                    else '其他疾病' end as disease_type 
                   ,disease_name 
                   ,data_type
                   ,report_date 
                    ,farm_name
                    ,big_area_name
                    ,area_name
                    ,cities_name
                 from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO
                 where data_type = 1
               
          )t2 group by cows_level1_code
      ,cows_level2_code
      ,disease_type
      ,disease_name
      ,data_type
      ,report_date
      ,farm_name
      ,big_area_name
      ,area_name
      ,cities_name 
) tr group by cows_level1_code
 ,cows_level2_code
 ,disease_type
 ,disease_name
 ,data_type
 ,report_date
 ,farm_name
 ,big_area_name
 ,area_name
 ,cities_name 
 ,exit_categ
,exit_type
,exit_reason


union all 

----- 离群数据
select 
sum(cow_num) as cow_num
,sum(cow_num_period) as cow_num_period
,cows_level1_code
,cows_level2_code
,disease_type
,disease_name
,case when disease_type = '呼吸系统疾病' then 1
      when disease_type = '消化系统疾病' then 2
      when disease_type = '乳房炎'       then 3
      when disease_type = '肢蹄病'       then 4
      when disease_type = '繁殖系统疾病' then 5
      when disease_type = '其他疾病' then 6 end as order_column
,data_type
,cast(regexp_replace(substr(report_date,1,7),'-','') as bigint )
,farm_name
,big_area_name
,area_name
,cities_name
,exit_categ
,exit_type
,exit_reason
 from (
select count(ear_no) as cow_num
 ,0 as cow_num_period
,cows_level1_code
,cows_level2_code
-- 将离群原因放到 疾病类型 字段方便查询
,exit_reason as disease_type
, '0' as disease_name
,data_type
,report_date
,farm_name
,big_area_name
,area_name
,cities_name
,exit_categ
, exit_type
, exit_reason
from (

 select cow_id   
             ,ear_no   
             ,month_age
             ,milk_day 
             ,growth_stat  
              -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
             ,exit_categ
             ,exit_type 
             ,exit_reason 
             ,data_type
             ,report_date 
              ,farm_name
              ,big_area_name
              ,area_name
              ,cities_name
           from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO
     ---  筛选离群数据 统计
           where data_type = 2
       
    )t2 group by cows_level1_code
,cows_level2_code
,exit_categ
,exit_type
,exit_reason
,data_type
,report_date
,farm_name
,big_area_name
,area_name
,cities_name 
union all 
select 
0 as cow_num
,count(ear_no) as cow_num_period
,cows_level1_code
,cows_level2_code
-- 将离群原因放到 疾病类型 字段方便查询
,exit_reason as disease_type
, '0' as disease_name
,data_type
,add_months(report_date,12) as report_date
,farm_name
,big_area_name
,area_name
,cities_name
,exit_categ
, exit_type
, exit_reason

from (

 select cow_id   
             ,ear_no   
             ,month_age
             ,milk_day 
             ,growth_stat  
              -- 增加牛只一级，二级类别判断
             ,case when growth_stat = '哺乳犊牛' then '后备牛'  
              when growth_stat = '断奶犊牛' then '后备牛' 
              when growth_stat = '育成牛' then '后备牛' 
              when growth_stat = '青年牛' then '后备牛' 
              when growth_stat = '泌乳牛' then '泌乳牛'
              when growth_stat = '干奶牛' then '断奶牛'
              end as cows_level1_code
             , case 
               when growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age <2 then '犊牛(0-2月龄)'    
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=2 and  month_age <6  then '犊牛(2 - 6月龄)'
              when  growth_stat in ('哺乳犊牛', '断奶犊牛','育成牛','青年牛') and month_age >=6  then '育成牛(6月到产犊)'
              when growth_stat = '泌乳牛' and milk_day <30 then '0-30d' 
              when growth_stat = '泌乳牛' and milk_day >=30 and milk_day <=60 then '30-60d'
              when growth_stat = '泌乳牛' and milk_day >60 and milk_day <=90 then '60-90d'
              when growth_stat = '泌乳牛' and milk_day >90 then '90d以后'
              when growth_stat = '干奶牛' then '--'
              end as cows_level2_code 
             ,exit_categ
             ,exit_type 
             ,exit_reason
             ,data_type
             ,report_date 
              ,farm_name
              ,big_area_name
              ,area_name
              ,cities_name
           from BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO
     ---  筛选离群数据 统计
           where data_type = 2
        
    )t2 group by cows_level1_code
,cows_level2_code
,exit_categ
,exit_type
,exit_reason
,data_type
,report_date
,farm_name
,big_area_name
,area_name
,cities_name 

) ts group by 
cows_level1_code
,cows_level2_code
,disease_type
,disease_name
,exit_categ
,exit_type
,exit_reason
,data_type
,report_date
,farm_name
,big_area_name
,area_name
,cities_name 

;
















