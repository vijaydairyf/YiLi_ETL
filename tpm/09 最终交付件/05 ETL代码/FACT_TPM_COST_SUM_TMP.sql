
--中间临时表
DROP TABLE bigdata_dw.fact_tpm_cost_sum_tmp;
CREATE TABLE bigdata_dw.fact_tpm_cost_sum_tmp AS
--insert overwrite table bigdata_dw.fact_tpm_cost_sum_tmp
SELECT bg_wid
    ,coalesce(bg_name,'缺省') as bg_name--事业部名称
    ,cast(regexp_replace(bug_month, '-', '') AS BIGINT) as bug_month
    ,cast(concat_ws('-',bug_month,'01') as date) as bug_day
    ,coalesce(area_name,'缺省') as area_name
    ,case when region_name = '' or region_name is null then '缺省' else region_name end as region_name
    ,coalesce(camp_type_name,'缺省') as camp_type_name--活动类型
    ,coalesce(exp_subj_name,'缺省') as exp_subj_name--末级科目
    ,coalesce(function_type_name,'缺省') as function_type_name--职能分类
    ,coalesce(exp_from_name,'缺省') as exp_from_name
    ,coalesce(dep_name,'缺省') as dep_name--部门
    ,coalesce(dealer_id,'缺省') as dealer_id
    ,coalesce(dealer_name,'缺省') as dealer_name
    ,coalesce(is_direct,0) as is_direct
    ,coalesce(system_name,'缺省')  AS system_name
    ,SUM(before_disc_amt) AS before_disc_amt--折前收入 
    ,SUM(before_disc_amt_ly) AS before_disc_amt_ly--折前收入同比 
    ,SUM(before_disc_amt_ytd) AS before_disc_amt_ytd--折前收入年累计 
    ,SUM(before_disc_amt_ly_ytd) AS before_disc_amt_ly_ytd--折前收入年累计同比 
    ,SUM(before_disc_amt_lm) AS before_disc_amt_lm--折前收入环比 
    ,cast(case when bg_wid = 1 then sum(amt_af_without_tax) else SUM(before_disc_amt - xzj) end as decimal(38,10)) AS after_disc_amt--折后收入
    ,cast(SUM(sales_cost) as decimal(38,10))  AS sales_cost
    ,cast(SUM(zxje) as decimal(38,10)) AS zxje
    ,cast(SUM(xzj) as decimal(38,10)) AS xzj
    ,SUM(cost_budget_year) AS cost_budget_year
    ,SUM(task_amt_before) AS task_amt_before 
    ,SUM(task_amt_before_ytd) as task_amt_before_ytd --销售月度任务折前年累计
    ,SUM(task_amt_before_ly) as task_amt_before_ly --销售月度任务折前同比
    ,SUM(task_amt_before_ly_ytd) as task_amt_before_ly_ytd --销售月度任务折前年累计同比
    ,SUM(task_amt_after) AS task_amt_after 
    ,SUM(task_amt_after_ytd) AS task_amt_after_ytd 
    ,SUM(budget_amt_before) AS budget_amt_before 
    ,SUM(budget_amt_before_ytd) AS budget_amt_before_ytd 
    ,SUM(budget_amt_after) AS budget_amt_after 
    ,SUM(budget_amt_after_ytd) AS budget_amt_after_ytd 
FROM (
    SELECT bg_wid
        ,bg_name--事业部名称
        ,CUR_MTH.bug_month
        ,area_name
        ,region_name
        ,camp_type_name--活动类型
        ,exp_subj_name--末级科目
        ,function_type_name--职能分类
        ,exp_from_name
        ,dep_name--部门
        ,dealer_id
        ,dealer_name
        ,is_direct
        ,coalesce(system_name,'缺省')  AS system_name
        ,before_disc_amt--折前收入
        ,before_disc_amt_ly --折前收入同比
        ,before_disc_amt_ytd --折前收入年累计
        ,before_disc_amt_ly_ytd --折前收入年累计同比
        ,before_disc_amt_lm--折前收入环比
        ,amt_af_without_tax
        ,task_amt_before
        ,task_amt_before_ytd --销售月度任务折前年累计
        ,task_amt_before_ly--销售月度任务折前同比
        ,task_amt_before_ly_ytd--销售月度任务折前年累计同比
        ,task_amt_after
        ,task_amt_after_ytd
        ,budget_amt_before
        ,budget_amt_before_ytd--销售预算折前年累计
        ,budget_amt_after--销售预算折后
        ,budget_amt_after_ytd--销售预算折后年累计
        ,sales_cost
        ,xzj
        ,zxje
        ,cost_budget_year
    FROM bigdata_dw.fact_tpm_cost_sale_tmp CUR_MTH
    
    UNION ALL
    
    SELECT bg_wid
        ,bg_name--事业部名称
        ,W_DATE_D.month_code
        ,area_name
        ,region_name
        ,camp_type_name--活动类型
        ,exp_subj_name--末级科目
        ,function_type_name--职能分类
        ,exp_from_name
        ,dep_name--部门
        ,dealer_id
        ,dealer_name
        ,is_direct
        ,coalesce(system_name,'缺省')  AS system_name
        ,0 AS before_disc_amt--折前收入
        ,0 AS before_disc_amt_ly --折前收入同比
        ,0 AS before_disc_amt_ytd --折前收入年累计
        ,0 AS before_disc_amt_ly_ytd --折前收入年累计同比
        ,0 AS before_disc_amt_lm--折前收入环比
        ,0 AS amt_af_without_tax
        ,0 AS task_amt_before
        ,0 as task_amt_before_ytd --销售月度任务折前年累计
        ,0 as task_amt_before_ly--销售月度任务折前同比
        ,0 as task_amt_before_ly_ytd--销售月度任务折前年累计同比
        ,0 AS task_amt_after
        ,0 AS task_amt_after_ytd
        ,0 AS budget_amt_before
        ,0 as budget_amt_before_ytd--销售预算折前年累计
        ,0 as budget_amt_after--销售预算折后
        ,0 as budget_amt_after_ytd--销售预算折后年累计
        ,0 AS sales_cost
        ,0 AS xzj
        ,0 AS zxje
        ,0 AS cost_budget_year
    FROM bigdata_dw.fact_tpm_cost_sale_tmp CUR_MTH
    INNER JOIN bigdata_dw.W_DATE_D ON FLOOR(regexp_replace(CUR_MTH.bug_month, '-', '') / 100) = W_DATE_D.YEAR_CODE
        AND lower(W_DATE_D.DT_TYPE) = 'm'
        
    UNION ALL
    
    SELECT bg_wid
        ,bg_name--事业部名称
        ,W_DATE_D.month_code
        ,area_name
        ,region_name
        ,camp_type_name--活动类型
        ,exp_subj_name--末级科目
        ,function_type_name--职能分类
        ,exp_from_name
        ,dep_name--部门
        ,dealer_id
        ,dealer_name
        ,is_direct
        ,coalesce(system_name,'缺省')  AS system_name
        ,0 AS before_disc_amt--折前收入
        ,0 AS before_disc_amt_ly --折前收入同比
        ,0 AS before_disc_amt_ytd --折前收入年累计
        ,0 AS before_disc_amt_ly_ytd --折前收入年累计同比
        ,0 AS before_disc_amt_lm--折前收入环比
        ,0 AS amt_af_without_tax
        ,0 AS task_amt_before
        ,0 as task_amt_before_ytd --销售月度任务折前年累计
        ,0 as task_amt_before_ly--销售月度任务折前同比
        ,0 as task_amt_before_ly_ytd--销售月度任务折前年累计同比
        ,0 AS task_amt_after
        ,0 AS task_amt_after_ytd
        ,0 AS budget_amt_before
        ,0 as budget_amt_before_ytd--销售预算折前年累计
        ,0 as budget_amt_after--销售预算折后
        ,0 as budget_amt_after_ytd--销售预算折后年累计
        ,0 AS sales_cost
        ,0 AS xzj
        ,0 AS zxje
        ,0 AS cost_budget_year
    FROM bigdata_dw.fact_tpm_cost_sale_tmp CUR_MTH
    INNER JOIN bigdata_dw.W_DATE_D ON FLOOR(regexp_replace(CUR_MTH.bug_month, '-', '') / 100) - 1 = W_DATE_D.YEAR_CODE
        AND lower(W_DATE_D.DT_TYPE) = 'm'    
        
    UNION ALL
    
    SELECT bg_wid
        ,bg_name--事业部名称
        ,W_DATE_D.month_code
        ,area_name
        ,region_name
        ,camp_type_name--活动类型
        ,exp_subj_name--末级科目
        ,function_type_name--职能分类
        ,exp_from_name
        ,dep_name--部门
        ,dealer_id
        ,dealer_name
        ,is_direct
        ,coalesce(system_name,'缺省')  AS system_name
        ,0 AS before_disc_amt--折前收入
        ,0 AS before_disc_amt_ly --折前收入同比
        ,0 AS before_disc_amt_ytd --折前收入年累计
        ,0 AS before_disc_amt_ly_ytd --折前收入年累计同比
        ,0 AS before_disc_amt_lm--折前收入环比
        ,0 AS amt_af_without_tax
        ,0 AS task_amt_before
        ,0 as task_amt_before_ytd --销售月度任务折前年累计
        ,0 as task_amt_before_ly--销售月度任务折前同比
        ,0 as task_amt_before_ly_ytd--销售月度任务折前年累计同比
        ,0 AS task_amt_after
        ,0 AS task_amt_after_ytd
        ,0 AS budget_amt_before
        ,0 as budget_amt_before_ytd--销售预算折前年累计
        ,0 as budget_amt_after--销售预算折后
        ,0 as budget_amt_after_ytd--销售预算折后年累计
        ,0 AS sales_cost
        ,0 AS xzj
        ,0 AS zxje
        ,0 AS cost_budget_year
    FROM bigdata_dw.fact_tpm_cost_sale_tmp CUR_MTH
    INNER JOIN bigdata_dw.W_DATE_D ON FLOOR(regexp_replace(CUR_MTH.bug_month, '-', '') / 100) + 1 = W_DATE_D.YEAR_CODE
        AND lower(W_DATE_D.DT_TYPE) = 'm'
    ) tmp
where regexp_replace(bug_month, '-', '') >= 201811 and substr(bug_month,1,4) <= substr(current_date,1,4) and bg_wid in(1,2,5,6,7)
GROUP BY bg_wid
    ,bg_name--事业部名称
    ,bug_month
    ,area_name
    ,region_name
    ,camp_type_name
    ,exp_subj_name
    ,function_type_name
    ,exp_from_name
    ,dep_name--部门
    ,dealer_id
    ,dealer_name
    ,is_direct
    ,system_name;


