

  
  -- 挤奶机 
  -- 问题： 1，四种自动化分类 要覆盖所有挤奶机  四种比例加和等于100%
  ----  2, 时间相差 几年 是根据月份来？
  
  
  insert overwrite table BIGDATA_DW.W_FARM_MILKER_INFO 
  
  select 
  id

 ,cleaning_sys_flag
,surge_dev_flag
,measure_method
,auto_off_cup_flag 
,install_year 
,install_month 
,case when length(install_year) >4 and length(install_month)>2 then concat(substr(install_year,1,4),substr(install_month,1,2)) end as year_month 
,maintenance_agmt_flag 
,maintenance_period 
,oestrus_monitor_sys 
,milking_spot_brand 
,case when measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag= '有' and surge_dev_flag = '有' and  oestrus_monitor_sys in ('非挤奶机自带','挤奶机自带') then '全自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag= '有' and surge_dev_flag = '有' and  oestrus_monitor_sys  ='无' then '自动' 

when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '有' and surge_dev_flag = '无' and  oestrus_monitor_sys  ='有' then '半自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '有' and surge_dev_flag = '无' and  oestrus_monitor_sys  ='无' then '半自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '无' and surge_dev_flag = '有' and  oestrus_monitor_sys  ='有' then '半自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '无' and surge_dev_flag = '有' and  oestrus_monitor_sys  ='无' then '半自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '无' and surge_dev_flag = '无' and  oestrus_monitor_sys  ='有' then '半自动' 
when  measure_method= '电子计量' and auto_off_cup_flag = '有' and cleaning_sys_flag = '无' and surge_dev_flag = '无' and  oestrus_monitor_sys  ='无' then '半自动' 
else    '手动'
end  as auto_type

,case when  cleaning_sys_flag= '有'  and surge_dev_flag = '有'  then '自动' 

else  '手动' 
end  as auto_clean_type

,case when  maintenance_stat ='开展' and maintenance_agmt_flag = '签署'  then '定期维保' 
 when  maintenance_stat  ='开展' and maintenance_agmt_flag = '未签署'  then  '非定期维保' 
  when  maintenance_stat  ='未开展' and maintenance_agmt_flag = '未签署'  then  '无维保' 
 else    '其他'
end  as maintenance_type
,case when length(install_year) >4 AND  year(CURRENT_DATE)-substr(install_year,1,4)+1 <=3 then '3年以内'
when length(install_year) >4 AND  year(CURRENT_DATE)-substr(install_year,1,4)+ 1 >=4 and  year(CURRENT_DATE)-substr(install_year,1,4)+ 1 <=6 then '4-6年'
when length(install_year) >4 AND  year(CURRENT_DATE)-substr(install_year,1,4)+ 1>=7 and  year(CURRENT_DATE)-substr(install_year,1,4)+ 1<=10 then '7-10年'
when length(install_year) >4 AND  year(CURRENT_DATE)-substr(install_year,1,4)+ 1 >10 then '10 年以上' 
else '其他'
end as install_years_type
,case when supplier_name in ('无','/','.','0','') then '其他'
   when supplier_name  is null then '其他'
   else supplier_name end  as supplier_name
,case when device_use is null then '其他'
   when device_use = '' then '其他'
   else device_use end  as device_use
,substr(t2.open_station_dt,1,7) as open_month
,substr(t2.close_station_dt,1,7) as close_month
,t2.farm_code as farm_code
,t2.farm_name  as farm_name
,t2.farm_org_name2 as big_area_name
,t2.farm_org_name3 as area_name
,t2.farm_org_name4 as cities_name 

from (select * from data_lake.d_fac_farm_milker where install_year is not null 
and   length(install_year) >4 and install_month is not null and length(install_month) >2 ) t1
    left join data_lake.d_pty_farm_base t2 on t1.farm_code = t2.farm_code ;


  
  