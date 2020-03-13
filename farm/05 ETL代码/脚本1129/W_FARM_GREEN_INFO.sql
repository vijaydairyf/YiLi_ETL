
----
--
----1）环评手续字段为空 算是哪种，-- 若仪器安装时间为空 则年份直接默认为 20
----2）设备设施 配备中的 其他类型 是除（氧化塘，沼气，其他）之外算是其他 还是其他字 

insert overwrite table BIGDATA_DW.W_FARM_GREEN_INFO 

SELECT 


env_assess_rpt_flag
, env_pro_facl_flag
,forbid_field_flag 
,limit_field_flag
,manure_deal_fac 
,manure_deal_method
,env_pro_fac_install_year 
,env_pro_fac_install_month

,case when length(env_pro_fac_install_year) >4 and length(env_pro_fac_install_month)>2 then concat(substr(env_pro_fac_install_year,1,4),'-',substr(env_pro_fac_install_month,1,2)) end as year_month 

 ,1  as eve_pro_farm
--,env_assess_reply_year  
--,env_assess_reply_month 
,case when env_assess_rpt_flag= '有' and env_pro_facl_flag= '有' and forbid_field_flag = 0 and limit_field_flag = 0  then '第一类' 
when env_assess_rpt_flag= '无' and env_pro_facl_flag= '有' and forbid_field_flag = 0 and limit_field_flag = 0   then '第二类' 
when env_assess_rpt_flag= '有' and env_pro_facl_flag= '无' and forbid_field_flag = 0 and limit_field_flag = 0   then '第二类'  
when env_assess_rpt_flag= '无' and env_pro_facl_flag= '无' and forbid_field_flag = 0 and limit_field_flag = 0   then '第三类' 


 
when env_assess_rpt_flag= '有' and env_pro_facl_flag= '有' and forbid_field_flag = 1 and limit_field_flag = 0   then '第四类' 
when env_assess_rpt_flag= '有' and env_pro_facl_flag= '有' and forbid_field_flag = 0 and limit_field_flag = 1   then '第四类'   

when env_assess_rpt_flag= '无' and env_pro_facl_flag= '有' and forbid_field_flag = 1 and limit_field_flag = 0  then '第四类'  
when env_assess_rpt_flag= '无' and env_pro_facl_flag= '有' and forbid_field_flag = 0 and limit_field_flag = 1  then '第四类'   
 
when env_assess_rpt_flag= '有' and env_pro_facl_flag= '无' and forbid_field_flag = 1 and limit_field_flag = 0  then '第四类'  
when env_assess_rpt_flag= '有' and env_pro_facl_flag= '无' and forbid_field_flag = 0 and limit_field_flag = 1  then '第四类'   
else  '其他'
end  as farm_pro_type
,case when manure_deal_fac like '%氧化塘%'   then '一类工艺' 
when manure_deal_fac like '%沼气%'   then '二类工艺' 
when manure_deal_fac like '%还田%'   then '三类工艺'
else  '其他'
end  as farm_pro_fac_type
-- 通过判断 数据中的安装年份则当前年份减去 安装年份
,case when length(env_pro_fac_install_year) >4 AND  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 <=2 then '3年以下'
when length(env_pro_fac_install_year) >4 AND  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 >=3 and  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 <=5 then '3-5年'
when length(env_pro_fac_install_year) >4 AND  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 >=6 and  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 <=10 then '5-10年'
when length(env_pro_fac_install_year) >4 AND  year(CURRENT_DATE)-substr(env_pro_fac_install_year,1,4)+1 >10 then '10年以上' 

end as farm_pro_fac_year_type 
,substr(open_station_dt,1,7) as open_date
,substr(close_station_dt,1,7) as close_date

,farm_id
,farm_code
,farm_name 
,farm_org_id2 as big_area_id
,farm_org_code2 as big_area_code
,farm_org_name2 as big_area_name
,farm_org_id3 as area_id
,farm_org_code3 as area_code
,farm_org_name3 as area_name
,farm_org4_id as cities_id
,farm_org_code4 as cities_code
,farm_org_name4 as cities_name

FROM DATA_LAKE.d_pty_farm_base
where  env_pro_fac_install_year is not null 
and env_pro_fac_install_month is not null
and length(env_pro_fac_install_year) =5
and length(env_pro_fac_install_month)=3
;




