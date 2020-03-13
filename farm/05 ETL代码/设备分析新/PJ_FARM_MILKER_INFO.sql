
---- 挤奶机数量统计
--
----


insert  overwrite table BIGDATA_DM.PJ_FARM_MILKER_INFO 

select 
    
   
 year_month
 ,milking_spot_brand
 ,auto_type
 ,auto_clean_type
 ,maintenance_type
 ,install_years_type
 ,supplier_name
 ,device_use
 ,cast(regexp_replace(open_month,'-','') as bigint ) as open_date
 ,cast(regexp_replace(close_month,'-','') as bigint ) as close_date
 ,farm_code
 ,farm_name
 ,big_area_name
 ,area_name
,cities_name
 from BIGDATA_DW.W_FARM_MILKER_INFO
 where  year_month is not null
 ;





