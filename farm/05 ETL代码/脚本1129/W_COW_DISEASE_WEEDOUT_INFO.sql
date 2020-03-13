

-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               W_COW_DISEASE_WEEDOUT_INFO.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 发病淘汰数据
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



insert overwrite table BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO 

    select t1.cow_id as cow_id,
ear_no
  ,month_age
,milk_day
  ,growth_stat
  ,disease_type
  ,disease_name
  ,1 as sick_cows
  ,case when  disease_type like '%呼吸系统%' then 1  else 0  end  as breath_sys_sick_cows
  ,case when  disease_type like '%消化系统%' then 1  else 0  end  as disgestive_sys_sick_cows
  ,case when  disease_type like '%乳房%' then 1  else 0  end  as mammitits_sick_cows
  ,case when  disease_type like '%肢%' then 1  
        when  disease_type like '%蹄%' then 1  else 0  end  as limb_hoof_sick_cows

  ,case when  disease_type like  '%繁殖系统%' then 1  
        when  disease_type like  '%生殖%' then 1
        when  disease_type like  '%子宫%' then 1
        when  disease_type like  '%卵巢%' then 1
        else 0  end  as breed_sys_sick_cows
  ,case when  disease_type like '%呼吸系统%' then 0  
        when  disease_type like '%消化系统%' then 0  
        when  disease_type like '%乳房%' then 0 
        when  disease_type like '%肢%' then 0    
        when  disease_type like '%蹄%' then  0 
        when  disease_type like  '%繁殖系统%' then 0  
        when  disease_type like  '%生殖%' then 0
        when  disease_type like  '%子宫%' then 0
        when  disease_type like  '%卵巢%' then 0
       else 1   end  as other_sick_cows
  ,0 as death_cows

  ,0 as sick_weedout_cows
  ,0 as breath_sys_weedout_cows
  ,0 as disge_sys_weedout_cows
  ,0 as mammit_weedout_cows
  ,0 as limb_hoof_weedout_cows
  ,0 as breed_sys_weedout_cows
  ,0 as other_sick_weedout_cows
  ,0 as weedout_cows
  ,'0' as exit_categ
  ,'0' as exit_type
  ,'0'as exit_reason
  ,'1' as data_type
  ,substr(disease_dt,1,10) as report_date
  ,substr(disease_dt,1,7) as report_month
  ,0 as active_weedout_cows
  ,0 as change_farm_cows
  ,0 as sale_cows
  ,0 as possive_weedout_cows
  ,t1.farm_id  as farm_id
  ,t1.farm_code as  farm_code
  ,t1.farm_name as farm_name
,t2.farm_org_id2 as big_area_id
,t2.farm_org_code2 as big_area_code
,t2.farm_org_name2 as big_area_name
,t2.farm_org_id3 as area_id
,t2.farm_org_code3 as area_code
,t2.farm_org_name3 as area_name
,t2.farm_org4_id as cities_id
,t2.farm_org_code4 as cities_code
,t2.farm_org_name4 as cities_name

  from data_lake.d_evt_dairy_cow_disease t1  
  left join data_lake.d_pty_farm_base t2 on t1.farm_id = t2.farm_id
  union all 
  
  -- 离群牛只数 

  select t3.cow_id as cow_id,
ear_no
  ,month_age
-- 泌乳天数 统计最近产犊日期到离群间隔， 若没有产犊则为青年牛 泌乳天数为 0 
, milk_day
  ,grow_stat
  ,'0' as disease_type
  ,'0' as disease_name
  ,0 as sick_cows
  , 0    as breath_sys_sick_cows
  , 0  as disgestive_sys_sick_cows
  ,0  as  mammitits_sick_cows
  ,0  as  limb_hoof_sick_cows
  ,0  as  breed_sys_sick_cows
  ,0  as other_sick_cows
  ,case when exit_categ = '死亡' then 1  else 0  end  as death_cows
,case when exit_categ = '淘汰' and exit_type = '疾病' then 1  else 0  end  as  sick_weedout_cows
  
  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%呼吸系统%' then 1  else 0  end  as breath_sys_weedout_cows
  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%消化系统%' then 1  else 0  end  as disge_sys_weedout_cows
  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%乳房%' then 1  else 0  end  as mammit_weedout_cows
  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%肢%' then 1  
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%蹄%' then 1
  else 0  end   as limb_hoof_weedout_cows

  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%繁殖系统%' then 1 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%子宫%' then 1 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%卵巢%' then 1 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%生殖%' then 1 
 else 0  end   as breed_sys_weedout_cows
  ,case when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%呼吸系统%' then 0 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%消化系统%' then 0
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%乳房%' then 0  
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%肢%' then 0
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason like '%蹄%' then 0
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%繁殖系统%' then 0 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%子宫%' then 0 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%卵巢%' then 0 
        when exit_categ = '淘汰' and exit_type = '疾病' and exit_reason = '%生殖%' then 0 
        else 1   end   as other_sick_weedout_cows
  ,case when exit_categ = '淘汰' then 1  else 0  end   as weedout_cows
  ,exit_categ
  , exit_type

  ,case when  exit_categ = '淘汰' and exit_type = '疾病' then
  case when exit_reason like '%呼吸%' then '呼吸系统疾病'
     when exit_reason like '%消化%' then '消化系统疾病'
     when exit_reason like '%乳房%' then '乳房炎'         
     when exit_reason like '%肢%' then '肢蹄病'
     when exit_reason like '%蹄%' then '肢蹄病'
     when exit_reason like '%繁殖%'  then '繁殖系统疾病'
     when exit_reason like '%子宫%'  then '繁殖系统疾病'
     when exit_reason like '%卵巢%'  then '繁殖系统疾病'
     when  exit_reason like '%生殖%'   then '繁殖系统疾病'
   
  else '其他疾病' end 
  else exit_reason end  as  exit_reason
  ,'2' as data_type
  ,substr(exit_dt,1,10) as report_date
  ,substr(exit_dt,1,7) as  report_month

,case when exit_categ in ( '转场' ,'出售') then 1  else 0  end   as  active_weedout_cows
  ,case when exit_categ = '转场'  then 1  else 0  end  as change_farm_cows
  ,case when exit_categ = '出售'  then 1  else 0  end  as sale_cows
  -- 被动淘汰 = 死亡淘汰 + 疾病淘汰
  ,case when exit_categ ='死亡' then 1  
        when exit_categ = '淘汰' and exit_type = '疾病' then 1 else 0
 end   as possive_weedout_cows
  
  ,t3.farm_id as farm_id
  ,t3.farm_code as  farm_code
  ,t3.farm_name as  farm_name
,t4.farm_org_id2 as big_area_id
,t4.farm_org_code2 as big_area_code
,t4.farm_org_name2 as big_area_name
,t4.farm_org_id3 as area_id
,t4.farm_org_code3 as area_code
,t4.farm_org_name3 as area_name
,t4.farm_org4_id as cities_id
,t4.farm_org_code4 as cities_code
,t4.farm_org_name4 as cities_name

 from  data_lake.d_evt_dairy_cow_exit t3
  left join data_lake.d_pty_farm_base t4 on t3.farm_code = t4.farm_code;
  
  
  