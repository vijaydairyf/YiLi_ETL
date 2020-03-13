

drop TABLE bigdata_dw.fact_tpm_cost_sale_base;
CREATE TABLE bigdata_dw.fact_tpm_cost_sale_base AS
SELECT division_name
    ,data_type_name
    ,rep_month
    ,exe_area_id
    ,exe_region_id
    ,camp_type_name
    ,exp_subj_name
    ,function_type_name
    ,exp_from_name
    ,dep_name
    ,accnt_id
    ,accnt_name
    ,fin_process_cat
    ,system_name
    ,sum(jan_implement_amt) AS jan_implement_amt
    ,sum(feb_implement_amt) AS feb_implement_amt
    ,sum(mar_implement_amt) AS mar_implement_amt
    ,sum(apr_implement_amt) AS apr_implement_amt
    ,sum(may_implement_amt) AS may_implement_amt
    ,sum(june_implement_amt) AS june_implement_amt
    ,sum(july_implement_amt) AS july_implement_amt
    ,sum(aug_implement_amt) AS aug_implement_amt
    ,sum(sept_implement_amt) AS sept_implement_amt
    ,sum(oct_implement_amt) AS oct_implement_amt
    ,sum(nov_implement_amt) AS nov_implement_amt
    ,sum(dec_implement_amt) AS dec_implement_amt
FROM sdata_full.tpm_cx_xx_rep_base b
WHERE data_type_name = '执行' and rep_month >= '2017-01'
GROUP BY division_name
    ,data_type_name
    ,rep_month
    ,exe_area_id
    ,exe_region_id
    ,camp_type_name
    ,exp_subj_name
    ,function_type_name
    ,exp_from_name
    ,dep_name
    ,accnt_id
    ,accnt_name
    ,fin_process_cat
    ,system_name;

--销售,费用,预算明细表
DROP TABLE bigdata_dw.fact_tpm_cost_sale_tmp;
CREATE TABLE bigdata_dw.fact_tpm_cost_sale_tmp AS
--insert overwrite table bigdata_dw.fact_tpm_cost_sale_tmp
SELECT a.bg_wid
    ,bg.bg_name--事业部名称
    ,'sale' as data_src
    ,c.month_code as bug_month
    ,b.big_area_name as area_name
    ,b.area_name as region_name
    ,'缺省' AS camp_type_name--活动类型
    ,'缺省' AS exp_subj_name--末级科目
    ,'缺省' AS function_type_name--职能分类
    ,'缺省' AS exp_from_name--费用出处
    ,'缺省' AS dep_name--部门
    ,e.integration_id AS dealer_id
    ,e.daler_name AS dealer_name
    ,case when e.attribute1 = '非直营' then 0 else 1 end AS is_direct
    ,'缺省'  AS fin_process_cat
    ,'缺省'  AS system_name
    ,sum(amt_bf_without_tax + dc_amt_bf_without_tax) as before_disc_amt --折前收入
    ,sum(yago_amt_bf_without_tax + yago_dc_amt_bf_without_tax) as before_disc_amt_ly --折前收入同比
    ,sum(amt_bf_without_tax_ytd + dc_amt_bf_without_tax_ytd) as before_disc_amt_ytd --折前收入年累计
    ,sum(yago_amt_bf_without_tax_ytd + yago_dc_amt_bf_without_tax_ytd) as before_disc_amt_ly_ytd --折前收入年累计同比
    ,sum(mago_amt_bf_without_tax + mago_dc_amt_bf_without_tax) as before_disc_amt_lm--折前收入环比
    ,sum(amt_af_without_tax) amt_af_without_tax
    ,sum(task_amt_bf_without_tax) task_amt_before--销售月度任务折前
    ,sum(task_amt_bf_without_tax_ytd) as task_amt_before_ytd --销售月度任务折前年累计
    ,sum(yago_task_amt_bf_no_tax) as task_amt_before_ly--销售月度任务折前同比
    ,sum(yago_task_amt_bf_no_tax_ytd) as task_amt_before_ly_ytd--销售月度任务折前年累计同比
    ,sum(task_amt_af_without_tax) task_amt_after--销售月度折后任务
    ,sum(task_amt_af_without_tax_ytd) as task_amt_after_ytd --销售月度任务折后年累计
    ,sum(budget_amt_bf_without_tax) as budget_amt_before--销售预算折前
    ,sum(budget_amt_bf_without_tax_ytd) as budget_amt_before_ytd--销售预算折前年累计
    ,sum(budget_amt_af_without_tax) as budget_amt_after--销售预算折后
    ,sum(budget_amt_af_without_tax_ytd) as budget_amt_after_ytd--销售预算折后年累计
    ,0 AS sales_cost
    ,0 AS xzj
    ,0 AS zxje
    ,0 AS cost_budget_year
from bigdata_dm.pj_sales_ytd_tmp a
inner join bigdata_dw.w_bg_d bg on a.bg_wid = bg.row_wid
inner join bigdata_dw.w_area_d b on a.area_wid = b.row_wid
inner join bigdata_dw.w_date_d c on a.sales_month_wid = c.row_wid
inner join bigdata_dw.w_dealer_d e on a.dealer_wid = e.row_wid
where 1=0 and month_code>='2018-11' and (a.bg_wid <> 5 or (a.bg_wid = 5 and a.prod_wid not in(19526,17608,20063,20159,20062,20061,17067,17066,3537,3515,3532,3528,3534,3502,3484,3519,3544,3530,3526,3539,17752)))
group by a.bg_wid
    ,bg.bg_name
    ,c.month_code
    ,b.big_area_name
    ,b.area_name
    ,e.integration_id
    ,e.daler_name
    ,e.attribute1

UNION

SELECT bg.row_wid AS bg_wid
    ,division_name AS bg_name--事业部名称
    ,'cost' as data_src
    ,month_code
    ,case when exe_region_id is null then area.big_area_name else region.big_area_name end as big_area_name--执行大区
    ,region.area_name--执行区域
    ,camp_type_name--活动类型
    ,exp_subj_name--末级科目
    ,function_type_name--职能分类
    ,exp_from_name--费用出处
    ,dep_name--部门
    ,dealer.integration_id as integration_id
    ,dealer.dealer_name as dealer_name
    ,case when dealer.is_direct = '非直营' then 0 else 1 end AS is_direct
    ,fin_process_cat
    ,system_name
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
    ,sum(zxje - jacx - yjacx - bkyzfjacx - kyjacx - yjasjacx) sales_cost--销售部费用
    ,sum(xzj) AS xzj--需折价费用
    ,sum(zxje) AS zxje--执行金额
    ,0 AS cost_budget_year
--,sum(zxje) zxje,sum(jacx) jacx,sum(yjacx) yjacx,sum(bkyzfjacx) bkyzfjacx,sum(kyjacx) kyjacx,sum(yjasjacx) yjasjacx
FROM (
    SELECT division_name
        ,a.month_code
        ,exe_area_id--执行大区ID
        ,exe_region_id
        ,camp_type_name
        ,exp_subj_name
        ,function_type_name
        ,exp_from_name
        ,dep_name
        ,fin_process_cat
        ,system_name
        ,coalesce(accnt_id,'缺省') dealer_id
        ,coalesce(accnt_name,'缺省') dealer_name
        ,case
             when substr(a.month_code,6,2)='01' then nvl(jan_implement_amt,'0')
             when substr(a.month_code,6,2)='02' then nvl(feb_implement_amt,'0')
             when substr(a.month_code,6,2)='03' then nvl(mar_implement_amt,'0')
             when substr(a.month_code,6,2)='04' then nvl(apr_implement_amt,'0')
             when substr(a.month_code,6,2)='05' then nvl(may_implement_amt,'0')
             when substr(a.month_code,6,2)='06' then nvl(june_implement_amt,'0')
             when substr(a.month_code,6,2)='07' then nvl(july_implement_amt,'0')
             when substr(a.month_code,6,2)='08' then nvl(aug_implement_amt,'0')
             when substr(a.month_code,6,2)='09' then nvl(sept_implement_amt,'0')
             when substr(a.month_code,6,2)='10' then nvl(oct_implement_amt,'0')
             when substr(a.month_code,6,2)='11' then nvl(nov_implement_amt,0)
             when substr(a.month_code,6,2)='12' then nvl(dec_implement_amt,'0')
        end zxje
        ,'0' jacx
        ,'0' yjacx
        ,'0' bkyzfjacx
        ,'0' kyjacx
        ,'0' yjasjacx
        ,'0' xzj
    FROM (
        SELECT month_code
            ,year_code
        FROM bigdata_dw.w_date_d
        WHERE lower(dt_type) = 'm'
            AND month_code >= '2017-01'
            AND month_code <= date_format(CURRENT_DATE, 'yyyy-MM')
        ) a
    LEFT JOIN bigdata_dw.fact_tpm_cost_sale_base b ON a.year_code = substr(nvl(b.rep_month, '8888-88'), 1, 4)
    WHERE b.data_type_name = '执行'
        AND b.rep_month <= a.month_code

    UNION ALL

    SELECT division_name
        ,rep_month
        ,exe_area_id--执行大区ID
        ,exe_region_id
        ,camp_type_name
        ,exp_subj_name
        ,function_type_name
        ,exp_from_name
        ,dep_name
        ,fin_process_cat
        ,system_name
        ,coalesce(accnt_id,'缺省') dealer_id
        ,coalesce(accnt_name,'缺省') dealer_name
        ,'0' zxje
        ,case when b.data_type_name='结案差异' then b.amt else '0' end jacx--结案差异金额
        ,case when b.data_type_name='预结案差异' then b.amt else '0' end yjacx--预结案差异金额
        ,case when b.data_type_name='支付差异-不可用' then b.amt else '0' end bkyzfjacx--不可用支付差异金额
        ,case when b.data_type_name='支付差异-可用' then b.amt else '0' end kyjacx--结案差异金额
        ,case when b.data_type_name='预结案实结案差异' then b.amt else '0' end yjasjacx--结案差异金额
        ,case when fin_process_mode in('折价','随车') then b.amt else '0' end xzj--需折价费用
        --,case when fin_process_cat = '折价' then b.amt else '0' end xzj--需折价费用
    FROM sdata_full.tpm_cx_xx_rep_base b
    WHERE nvl(b.rep_month,'1888-08')>='2017-01' and
        b.data_type_name in('执行','结案差异','预结案差异','支付差异-不可用','支付差异-可用','预结案实结案差异')
    ) t
INNER JOIN bigdata_dw.w_bg_d bg ON division_name = bg.bg_name
LEFT JOIN bigdata_dw.dm_tpm_area_d region on t.exe_region_id = region.tpm_region_id and region.div_type = 'region'
LEFT JOIN bigdata_dw.dm_tpm_area_d area on t.exe_area_id = area.tpm_region_id and area.div_type = 'area'
LEFT JOIN bigdata_dw.dm_tpm_dealer_d  dealer ON dealer.tpm_dealer_id = t.dealer_id
GROUP BY month_code
    ,bg.row_wid
    ,division_name
    ,area.big_area_name
    ,region.big_area_name
    ,region.area_name
    ,t.exe_region_id
    ,camp_type_name
    ,exp_subj_name
    ,function_type_name
    ,exp_from_name
    ,dep_name
    ,dealer.integration_id
    ,dealer.dealer_name
    ,dealer.is_direct
    ,fin_process_cat
    ,system_name

UNION

SELECT t6.row_wid AS bg_wid
    ,T6.bg_name AS BG_NAME
    ,'budget' as data_src
    ,T2.NAME AS MONTH_CODE--预算月份
    ,area.big_area_name as area_name--执行大区
    ,case when area.div_type = 'area' then null else area.area_name end as region_name--执行区域
    ,'缺省' AS camp_type_name--活动类型
    ,T3.Shot_Name AS exp_subj_name--末级科目
    ,'缺省' AS function_type_name--职能分类
    ,'缺省' AS exp_from_name--费用出处
    ,'缺省' AS dep_name--部门
    ,'缺省' AS dealer_id
    ,'缺省' AS dealer_name
    ,0 AS is_direct
    ,'缺省'  AS fin_process_cat
    ,'缺省'  AS system_name
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
    ,cast(T1.MONTH_EXPENSE AS DECIMAL(38, 10)) AS cost_budget_year --年度预算分解数
FROM sdata_full.tpm_CX_YEAR_BUD_LN T1
INNER JOIN sdata_full.tpm_S_PERIOD T2 ON T1.MONTH_PERIOD_ID = T2.ROW_ID
LEFT OUTER JOIN sdata_full.tpm_CX_EXP_SUBJECT T3 ON T1.EXP_SUBJ_ID = T3.ROW_ID
LEFT JOIN bigdata_dw.dm_tpm_area_d area on t1.org_id = area.tpm_region_id --and area.div_type = 'area'
INNER JOIN bigdata_dw.w_bg_d t6 ON t6.bg_name = area.tpm_bu_name
where t2.name>='2017-01';



