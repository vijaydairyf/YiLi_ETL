
--写入临时表
DROP TABLE bigdata_dw.fact_tpm_cost_a_tmp;
CREATE TABLE bigdata_dw.fact_tpm_cost_a_tmp AS
--insert overwrite table bigdata_dw.fact_tpm_cost_a_tmp
SELECT bg_wid
    ,0 AS date_wid
    ,0 AS area_wid
    ,0 AS dealer_wid
    ,0 AS channel_wid
    ,0 AS active_type_wid
    ,0 AS account_wid
    ,bg_name
    ,bug_month AS bug_month
    ,function_type_name
    ,'0' AS function_type_cd
    ,area_name
    ,region_name
    ,'0' AS city_group
    ,'0' AS channel_type
    ,exp_subj_name
    ,'0' AS exp_subj_id
    ,camp_type_name
    ,exp_from_name--费用出处
    ,dep_name--部门
    ,'0' AS camp_type_cd
    ,a.dealer_name
    ,a.dealer_id
    ,'0' AS dealer_level
    ,is_direct
    ,before_disc_amt--折前收入
    ,before_disc_amt_ly--折前收入同比 
    ,after_disc_amt
    ,xzj
    ,sales_cost
    ,zxje
    ,coalesce(lag(sales_cost, 1) over (partition by bg_wid,bg_name,bug_month,area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as sales_cost_lm
    ,coalesce(lag(sales_cost,12) over (partition by bg_wid,bg_name,bug_month,area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as sales_cost_ly
    ,coalesce(lag(sales_cost,24) over (partition by bg_wid,bg_name,bug_month,area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as sales_cost_lly
    ,cost_budget_year
    ,before_disc_amt_ytd --折前收入年累计
    ,before_disc_amt_ly_ytd--折前收入年累计同比
    ,coalesce(sum(after_disc_amt) over (partition by bg_wid,bg_name,floor(bug_month/100),area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as after_disc_amt_ytd --年累计-年度预算分解金额
    ,coalesce(sum(xzj) over (partition by bg_wid,bg_name,floor(bug_month/100),area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as xzj_ytd --年累计-年度预算分解金额
    ,coalesce(sum(sales_cost) over (partition by bg_wid,bg_name,floor(bug_month/100),area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as sales_cost_ytd --年累计-年度预算分解金额
    ,task_amt_before--销售月度任务折前
    ,task_amt_before_ytd --销售月度任务折前年累计
    ,task_amt_after
    ,task_amt_after_ytd --年累计-年度预算分解金额 
    ,budget_amt_before
    ,budget_amt_before_ytd --年累计-年度预算分解金额 
    ,budget_amt_after--销售预算折后
    ,budget_amt_after_ytd--销售预算折后年累计
    ,coalesce(sum(cost_budget_year) over (partition by bg_wid,bg_name,floor(bug_month/100),area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as cost_budget_year_ytd
    ,before_disc_amt_lm--折前收入环比
    ,coalesce(lag(cost_budget_year, 12) over (partition by bg_wid,bg_name,bug_month,area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as cost_budget_year_ly
    ,coalesce(lag(cost_budget_year, 1) over (partition by bg_wid,bg_name,bug_month,area_name,region_name,camp_type_name,exp_subj_name,function_type_name,exp_from_name,dep_name,dealer_id,dealer_name,is_direct order by bug_month),0) as cost_budget_year_lm
    ,task_amt_before_ly
    ,task_amt_before_ly_ytd
    FROM bigdata_dw.fact_tpm_cost_sum_tmp a
where bug_month >= 201811 and bg_wid in(1,2,5,6,7);

