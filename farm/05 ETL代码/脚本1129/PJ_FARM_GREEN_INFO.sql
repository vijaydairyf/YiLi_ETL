
---- PJ_FARM_ENVIRONMENT_PROTECTIVE_INFO

-- 牧场环保设备 信息
----



insert overwrite table BIGDATA_DM.PJ_FARM_GREEN_INFO 

select 
  

cast(regexp_replace(year_month,'-','') as bigint ) as year_month
,farm_pro_type
,farm_pro_fac_type
,farm_pro_fac_year_type
,cast(regexp_replace(open_month,'-','') as bigint ) as open_month
,cast(regexp_replace(close_month,'-','') as bigint ) as close_month
,farm_code
,farm_name

,big_area_name

,area_name
,cities_name
 FROM BIGDATA_DW.W_FARM_GREEN_INFO
 where  
 -- 过滤掉安装年月为 空的数据
 year_month is not null 
 and length(year_month)>=6
 

;


