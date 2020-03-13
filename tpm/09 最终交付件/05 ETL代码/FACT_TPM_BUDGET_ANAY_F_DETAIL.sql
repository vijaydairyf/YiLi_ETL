

DROP TABLE bigdata_dw.fact_tpm_budget_anay_f_detail;
CREATE TABLE bigdata_dw.fact_tpm_budget_anay_f_detail AS
--insert overwrite table bigdata_dw.fact_tpm_budget_anay_f_detail
SELECT bg_wid
    ,exp_from_name
    ,exp_from_cd
    ,exp_subj_name
    ,bug_org
    ,bug_org_two
    ,bu_name
    ,bug_month
    ,area_name
    ,region_name
    ,exp_subj_id
    ,camp_type_name
    ,camp_type_cd
    ,function_type_name
    ,function_type_cd
    ,fin_process_cat
    ,sum(int_budget_amt) AS int_budget_amt
    ,sum(fin_budget_amt) AS fin_budget_amt
    ,sum(adj_budget_amt) AS adj_budget_amt
    ,sum(rel_budget_amt) AS rel_budget_amt
    ,sum(approve_amt) AS approve_amt
    ,sum(sub_no_appr_amt) AS sub_no_appr_amt
    ,sum(int_budget_amt_all_year) AS int_budget_amt_all_year
    ,sum(sales_cost) AS sales_cost
FROM (
    SELECT bg_wid
    ,exp_from_name
    ,exp_from_cd
    ,exp_subj_name
    ,coalesce(area_name,'缺省') as bug_org
    ,coalesce(region_name,'缺省') as bug_org_two
    ,bu_name
    ,bug_month
    ,coalesce(area_name,'缺省') as area_name
    ,coalesce(region_name,'缺省') as region_name
    ,exp_subj_id
    ,camp_type_name
    ,camp_type_cd
    ,function_type_name
    ,function_type_cd
    ,fin_process_cat
    ,int_budget_amt
    ,fin_budget_amt
    ,adj_budget_amt
    ,rel_budget_amt
    ,approve_amt
    ,sub_no_appr_amt
    ,0.0 AS int_budget_amt_all_year
    ,0.0 AS sales_cost
    FROM bigdata_dw.fact_tpm_budget_anay_f_tmp CUR_MTH

    UNION ALL
--补全当年明细数据
    SELECT bg_wid
    ,exp_from_name
    ,exp_from_cd
    ,exp_subj_name
    ,coalesce(area_name,'缺省') as bug_org
    ,coalesce(region_name,'缺省') as bug_org_two
    ,bu_name
    ,regexp_replace(w_date_d.month_code, '-', '') as bug_month
    ,coalesce(area_name,'缺省') as area_name
    ,coalesce(region_name,'缺省') as region_name
    ,exp_subj_id
    ,camp_type_name
    ,camp_type_cd
    ,function_type_name
    ,function_type_cd
    ,fin_process_cat
    ,0 AS int_budget_amt
    ,0 AS fin_budget_amt
    ,0 AS adj_budget_amt
    ,0 AS rel_budget_amt
    ,0 AS approve_amt
    ,0 AS sub_no_appr_amt
    ,0.0 AS int_budget_amt_all_year
    ,0.0 AS sales_cost
    FROM bigdata_dw.fact_tpm_budget_anay_f_tmp CUR_MTH
    INNER JOIN bigdata_dw.W_DATE_D ON FLOOR(bug_month / 100) = W_DATE_D.YEAR_CODE
        AND lower(W_DATE_D.DT_TYPE) = 'm'

    UNION ALL
--初始预算金额全年累计
    SELECT bg_wid
    ,'缺省' AS exp_from_name
    ,'缺省' AS exp_from_cd
    ,exp_subj_name
    ,'缺省' AS bug_org
    ,'缺省' AS bug_org_two
    ,bu_name
    ,regexp_replace(w_date_d.month_code, '-', '') AS bug_month
    ,coalesce(area_name, '缺省') AS area_name
    ,coalesce(region_name, '缺省') AS region_name
    ,exp_subj_id
    ,'缺省' AS camp_type_name
    ,'缺省' AS camp_type_cd
    ,'缺省' AS function_type_name
    ,'缺省' AS function_type_cd
    ,'缺省' AS fin_process_cat
    ,0 AS int_budget_amt
    ,0 AS fin_budget_amt
    ,0 AS adj_budget_amt
    ,0 AS rel_budget_amt
    ,0 AS approve_amt
    ,0 AS sub_no_appr_amt
    ,int_budget_amt_all_year
    ,0.0 AS sales_cost
FROM (
    SELECT bg_wid
        ,exp_subj_name
        ,bu_name
        ,floor(bug_month / 100) AS bug_month
        ,coalesce(area_name, '缺省') AS area_name
        ,coalesce(region_name, '缺省') AS region_name
        ,exp_subj_id
        ,sum(int_budget_amt) AS int_budget_amt_all_year
    FROM bigdata_dw.fact_tpm_budget_anay_f_tmp
    GROUP BY bg_wid
        ,bu_name
        ,floor(bug_month / 100)
        ,area_name
        ,region_name
        ,exp_subj_id
        ,exp_subj_name
    ) CUR_MTH
INNER JOIN bigdata_dw.W_DATE_D ON bug_month = W_DATE_D.YEAR_CODE
    AND lower(W_DATE_D.DT_TYPE) = 'm'
    union all
--费用
    select bg_wid
    ,exp_from_name
    ,'缺省' as exp_from_cd
    ,exp_subj_name
    ,area_name as bug_org
    ,region_name as bug_org_two
    ,bg_name
    ,regexp_replace(bug_month, '-', '') as bug_month
    ,area_name
    ,region_name
    ,'缺省' as exp_subj_id
    ,camp_type_name
    ,'缺省' as camp_type_cd
    ,function_type_name
    ,'缺省' as function_type_cd
    ,fin_process_cat
    ,0 AS int_budget_amt
    ,0 AS fin_budget_amt
    ,0 AS adj_budget_amt
    ,0 AS rel_budget_amt
    ,0 AS approve_amt
    ,0 AS sub_no_appr_amt
    ,0.0 AS int_budget_amt_all_year
    ,sum(sales_cost) AS sales_cost
from bigdata_dw.fact_tpm_cost_sale_tmp
GROUP BY bg_wid
    ,exp_from_name
    ,bg_name
    ,bug_month
    ,area_name
    ,region_name
    ,exp_subj_name
    ,camp_type_name
    ,function_type_name
    ,fin_process_cat
    ) tmp
where bug_month >= 201811 and substr(bug_month,1,4) <= substr(current_date,1,4) and bg_wid in(1,2,5,6,7)
GROUP BY bg_wid
    ,exp_from_name
    ,exp_from_cd
    ,exp_subj_name
    ,bug_org
    ,bug_org_two
    ,bu_name
    ,bug_month
    ,area_name
    ,region_name
    ,exp_subj_id
    ,camp_type_name
    ,camp_type_cd
    ,function_type_name
    ,function_type_cd
    ,fin_process_cat;


