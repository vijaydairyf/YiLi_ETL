INSERT overwrite TABLE bigdata_dm.fact_tpm_budget_anay_f PARTITION (bg_wid)
SELECT bg_wid
    ,0 as date_wid
    ,0 as area_wid
    ,0 as source_wid
    ,0 as channel_wid
    ,coalesce(exp_from_name,'缺省') as exp_from_name
    ,coalesce(exp_from_cd,'缺省') as exp_from_cd
    ,coalesce(exp_subj_name,'缺省') as exp_subj_name
    ,coalesce(area_name,'缺省') as area_name
    ,case when region_name = '北京区域' then '北京' else coalesce(region_name,'缺省') end as region_name
    ,bu_name
    ,bug_month
    ,coalesce(area_name,'缺省') as area_name
    ,case when region_name = '北京区域' then '北京' else coalesce(region_name,'缺省') end as region_name
    ,coalesce(exp_subj_id,'缺省') as exp_subj_id
    ,coalesce(camp_type_name,'缺省') as camp_type_name
    ,coalesce(camp_type_cd,'缺省') as camp_type_cd
    ,coalesce(function_type_name,'缺省') as function_type_name
    ,coalesce(function_type_cd,'缺省') as function_type_cd
    ,coalesce(fin_process_cat,'缺省') as fin_process_cat
    ,int_budget_amt
    ,fin_budget_amt
    ,adj_budget_amt
    ,rel_budget_amt
    ,coalesce(sum(approve_amt)     over (partition by bg_wid,exp_from_name,exp_from_cd,bug_org,bug_org_two,bu_name,floor(bug_month/100),area_name,region_name,exp_subj_id,exp_subj_name,camp_type_name,camp_type_cd,function_type_name,function_type_cd,fin_process_cat order by bug_month),0) as approve_amt_ytd
    ,coalesce(sum(sub_no_appr_amt) over (partition by bg_wid,exp_from_name,exp_from_cd,bug_org,bug_org_two,bu_name,floor(bug_month/100),area_name,region_name,exp_subj_id,exp_subj_name,camp_type_name,camp_type_cd,function_type_name,function_type_cd,fin_process_cat order by bug_month),0) as sub_no_appr_amt_ytd
    ,approve_amt
    ,sub_no_appr_amt
    ,int_budget_amt_all_year
    ,sales_cost
    ,coalesce(area_code.big_region_code,'9999') AS re_attribute1
    ,coalesce(region_code.sale_region_code,'9999') AS re_attribute2
    ,'' AS re_attribute3
    ,'' AS re_attribute4
    ,'' AS re_attribute5
    ,0 AS re_attribute6
    ,0 AS re_attribute7
    ,0 AS re_attribute8
    ,0 AS re_attribute9
    ,0 AS re_attribute10
    ,0 AS re_attribute11
    ,0 AS re_attribute12
    ,0 AS re_attribute13
    ,0 AS re_attribute14
    ,0 AS re_attribute15
    ,0 AS re_attribute16
    ,0 AS re_attribute17
    ,0 AS re_attribute18
    ,0 AS re_attribute19
    ,0 AS re_attribute20
    ,0 AS re_attribute21
    ,0 AS re_attribute22
    ,0 AS re_attribute23
    ,0 AS re_attribute24
    ,CURRENT_DATE insert_date
    ,bg_wid AS bg_wid
FROM bigdata_dw.fact_tpm_budget_anay_f_detail
left join datalake_md.d_par_region_principal region_code
on region_code.biz_unit_name = bu_name and region_code.big_region = area_name and region_code.sale_region = case when region_name = '北京区域' then '北京' else region_name end
left join 
(select distinct biz_unit_name,big_region,big_region_code from datalake_md.d_par_region_principal) area_code
on area_code.biz_unit_name = bu_name and area_code.big_region = area_name;

 

INSERT overwrite TABLE bigdata_dm.fact_tpm_budget_anay_f PARTITION (bg_wid)
select * from bigdata_dm.fact_tpm_budget_anay_f 
where     (bu_wid =7 and region_name !='缺省') or bu_wid!=7;



