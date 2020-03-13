drop table bigdata_dm.fact_tpm_cost_anay_f_temp;

create table bigdata_dm.fact_tpm_cost_anay_f_temp as 
select bg_wid
    ,0 AS date_wid
    ,0 AS area_wid
    ,0 AS dealer_wid
    ,0 AS channel_wid
    ,0 AS active_type_wid
    ,0 AS account_wid
    ,bg_name
    ,dep_name--部门
    ,cast(regexp_replace(bug_month, '-', '') AS BIGINT) AS bug_month
    ,case when bg_wid = 1 and function_type_name in('巴氏奶推广','巴氏奶运营') then '巴氏奶'
          when bg_wid = 1 and function_type_name in('行销推广','行销运营','督导') then '行销'
          else function_type_name end function_type_name
    ,'0' AS function_type_cd
    ,case when area_name is null or area_name = '' then '缺省' else area_name end AS area_name
    ,case when region_name is null or region_name = '' then '缺省' 
          when region_name = '内蒙销售区域' then '内蒙' 
          when region_name = '北京区域' then '北京' 
          else region_name end AS region_name
    ,'0' AS city_group
    ,'0' AS channel_type
    ,case when exp_subj_name is null or exp_subj_name = '' then '缺省' else exp_subj_name end AS exp_subj_name
    ,'0' AS exp_subj_id
    ,case when camp_type_name is null or camp_type_name = '' then '缺省' else camp_type_name end AS camp_type_name
    ,case when (bg_wid in(2,5,7) and exp_from_name like '市场部%') 
          or (bg_wid = 1 and exp_from_name in ('市场部Joyday推广组','市场部重客推广组','整合行销部推广组基础费用','整合行销部推广组每益添费用',
                                                '整合行销部推广组畅轻费用',
                                                '市场部畅轻推广组',
                                                '整合行销部推广组JOYDAY费用',
                                                '市场部基础推广组',
                                                '市场部每益添推广组'))  then '市场部费用'
          when (bg_wid in(2,5,7) and exp_from_name like '销售部%') 
          or (bg_wid = 1 and exp_from_name in ('销售部行销组',
                                                '销售部电商组',
                                                '销售部重客组',
                                                '销售部沃尔玛组',
                                                '销售部特渠组',
                                                '销售部集团重客基金费用',
                                                '酸奶事业部销售部巴氏奶组',
                                                '酸奶事业部销售部电商组')) then '销售部费用'
          when bg_wid = 1 and exp_from_name in('销售大区','销售区域') then '大区费用'                                       
          when exp_from_name is null or exp_from_name = '' then '缺省'
          else exp_from_name end as exp_from_name--费用出处
    ,'0' AS camp_type_cd
    ,dealer_name
    ,dealer_id
    ,'0' AS dealer_level
    ,is_direct,
    system_name,
sum(before_disc_amt) before_disc_amt,
sum(before_disc_amt_ly) before_disc_amt_ly,
case when bg_wid=1 then sum(after_disc_amt) else sum(before_disc_amt-re_attribute6) end after_disc_amt,
sum(sales_cost) sales_cost,
sum(sales_cost_ly) sales_cost_ly,
sum(sales_cost_lm) sales_cost_lm,
sum(cost_budget_year) cost_budget_year,
sum(before_disc_amt_ytd) before_disc_amt_ytd,
sum(before_disc_amt_ly_ytd) before_disc_amt_ly_ytd,
case when bg_wid=1 then sum(after_disc_amt_ytd) else sum(before_disc_amt_ytd-re_attribute7) end after_disc_amt_ytd,
sum(sales_cost_ytd) sales_cost_ytd,
sum(sales_cost_ly_ytd) sales_cost_ly_ytd,
sum(cost_budget_year_ytd) cost_budget_year_ytd,
sum(task_amt_before) task_amt_before,
sum(task_amt_before_ytd) task_amt_before_ytd,
sum(task_amt_after) task_amt_after,
sum(task_amt_after_ytd) task_amt_after_ytd,
sum(budget_amt_before) budget_amt_before,
sum(budget_amt_before_ytd) budget_amt_before_ytd,
sum(before_disc_amt_lm) before_disc_amt_lm,
sum(cost_budget_year_ly) cost_budget_year_ly,
sum(cost_budget_year_ly_ytd) cost_budget_year_ly_ytd,
sum(task_amt_before_ly) task_amt_before_ly,
sum(task_amt_before_ly_ytd) task_amt_before_ly_ytd,
sum(sales_cost_lly) sales_cost_lly,
sum(cost_budget_year_lm) cost_budget_year_lm,
null re_attribute1,
null re_attribute2,
null re_attribute3,
null re_attribute4,
null re_attribute5,
sum(re_attribute6) re_attribute6,--xzj
sum(re_attribute7) re_attribute7,--xzj_ytd
sum(re_attribute8) re_attribute8,--budget_amt_af_without
sum(re_attribute9) re_attribute9,--budget_amt_af_without_ytd
sum(re_attribute10) re_attribute10,--budget_amt_af_without_ytd_all
sum(re_attribute11) re_attribute11,--task_amt_af_without_ytd_all
0.0 re_attribute12,
0.0 re_attribute13,
0.0 re_attribute14,
0.0 re_attribute15,
0.0 re_attribute16,
0.0 re_attribute17,
0.0 re_attribute18,
null re_attribute19,
null re_attribute20,
null re_attribute21,
null re_attribute22,
null re_attribute23,
null re_attribute24,
from_unixtime(unix_timestamp(), 'yyyy-MM-dd HH:mm:ss') insert_date,
date_
from 
(select 
    0 AS date_wid
    ,0 AS area_wid
    ,0 AS dealer_wid
    ,0 AS channel_wid
    ,0 AS active_type_wid
    ,0 AS account_wid
    ,bg_name
    ,dep_name--部门
    ,cast(regexp_replace(bug_month, '-', '') AS BIGINT) AS bug_month
    ,function_type_name
    ,'0' AS function_type_cd
    ,area_name AS area_name
    ,region_name AS region_name
    ,'0' AS city_group
    ,'0' AS channel_type
    ,exp_subj_name
    ,'0' AS exp_subj_id
    ,camp_type_name
    ,exp_from_name--费用出处
    ,'0' AS camp_type_cd
    ,dealer_name
    ,dealer_id
    ,'0' AS dealer_level
    ,is_direct,
    system_name,
0.0 before_disc_amt,
0.0 before_disc_amt_ly,
0.0 after_disc_amt,
sales_cost,
sales_cost_ly,
sales_cost_lm,
cost_budget_year,
0.0 before_disc_amt_ytd,
0.0 before_disc_amt_ly_ytd,
0.0 after_disc_amt_ytd,
sales_cost_ytd,
sales_cost_ly_ytd,
cost_budget_year_ytd,
0.0 task_amt_before,
0.0 task_amt_before_ytd,
0.0 task_amt_after,
0.0 task_amt_after_ytd,
0.0 budget_amt_before,
0.0 budget_amt_before_ytd,
0.0 before_disc_amt_lm,
cost_budget_year_ly,
cost_budget_year_ly_ytd,
0.0 task_amt_before_ly,
0.0 task_amt_before_ly_ytd,
0.0 sales_cost_lly,
cost_budget_year_lm,
xzj re_attribute6,--xzj
xzj_ytd re_attribute7,--xzj_ytd
0.0 re_attribute8,--budget_amt_af_without
0.0 re_attribute9,--budget_amt_af_without_ytd
0.0 re_attribute10,--budget_amt_af_without_ytd_all
0.0 re_attribute11,--task_amt_af_without_ytd_all
bg_wid,
concat(bug_month,'01') date_
from bigdata_dm.fact_tpm_cost_ytd
union all
select 
    0 AS date_wid
    ,0 AS area_wid
    ,0 AS dealer_wid
    ,0 AS channel_wid
    ,0 AS active_type_wid
    ,0 AS account_wid
    ,bg_name
    ,'收入数据缺省' as dep_name--部门
    ,sales_month_wid AS bug_month
    ,'缺省' as function_type_name
    ,'0' AS function_type_cd
    ,big_area_name AS area_name
    ,area_name AS region_name
    ,'0' AS city_group
    ,'0' AS channel_type
    ,'' as exp_subj_name
    ,'0' AS exp_subj_id
    ,'' as camp_type_name
    ,'' as exp_from_name--费用出处
    ,'0' AS camp_type_cd
    ,daler_name
    ,e.integration_id
    ,'0' AS dealer_level
    ,case when e.attribute1 = '非直营' then 0 else 1 end AS is_direct,
    '缺省'  AS system_name,
amt_bf_without_tax+dc_amt_bf_without_tax before_disc_amt,
yago_amt_bf_without_tax+yago_dc_amt_bf_without_tax before_disc_amt_ly,
amt_af_without_tax after_disc_amt,
0.0 sales_cost,
0.0 sales_cost_ly,
0.0 sales_cost_lm,
0.0 cost_budget_year,
amt_bf_without_tax_ytd+dc_amt_bf_without_tax_ytd before_disc_amt_ytd,
yago_amt_bf_without_tax_ytd+yago_dc_amt_bf_without_tax_ytd before_disc_amt_ly_ytd,
amt_af_without_tax_ytd after_disc_amt_ytd,
0.0 sales_cost_ytd,
0.0 sales_cost_ly_ytd,
0.0 cost_budget_year_ytd,
task_amt_bf_without_tax task_amt_before,
task_amt_bf_without_tax_ytd task_amt_before_ytd,
task_amt_af_without_tax task_amt_after,
task_amt_af_without_tax_ytd task_amt_after_ytd,
budget_amt_bf_without_tax budget_amt_before,
budget_amt_bf_without_tax_ytd budget_amt_before_ytd,
mago_amt_bf_without_tax+mago_dc_amt_bf_without_tax before_disc_amt_lm,
0.0 cost_budget_year_ly,
0.0 cost_budget_year_ly_ytd,
yago_task_amt_bf_no_tax task_amt_before_ly,
yago_task_amt_bf_no_tax_ytd task_amt_before_ly_ytd,
0.0 sales_cost_lly,
0.0 cost_budget_year_lm,
0.0 re_attribute6,--xzj
0.0 re_attribute7,--xzj_ytd
budget_amt_af_without_tax re_attribute8,--budget_amt_af_without_tax
budget_amt_af_without_tax_ytd re_attribute9,--budget_amt_af_without_tax_ytd
0.0 re_attribute10,--budget_amt_af_without_tax_ytd_all
task_amt_bf_without_tax_ytd_all re_attribute11,--task_amt_af_without_tax_ytd_all
bg_wid,
concat(date_,'01') date_
from bigdata_dm.pj_sales_ytd_tmp a
inner join bigdata_dw.w_bg_d bg on a.bg_wid = bg.row_wid
inner join bigdata_dw.w_area_d b on a.area_wid = b.row_wid
inner join bigdata_dw.w_date_d c on a.sales_month_wid = c.row_wid
inner join bigdata_dw.w_dealer_d e on a.dealer_wid = e.row_wid
where date_>='201811' and (a.bg_wid <> 5 or 
(a.bg_wid = 5 and a.prod_wid not in(19526,17608,20063,20159,20062,20061,17067,17066,3537,3515,3532,3528,3534,3502,3484,3519,3544,3530,3526,3539,17752)))
union all
select 
0 AS date_wid
    ,0 AS area_wid
    ,0 AS dealer_wid
    ,0 AS channel_wid
    ,0 AS active_type_wid
    ,0 AS account_wid
    ,bg_name
    ,'收入数据缺省' as dep_name--部门
    ,t2.row_wid AS bug_month
    ,'缺省' as function_type_name
    ,'0' AS function_type_cd
    ,area_name AS area_name
    ,region_name AS region_name
    ,'0' AS city_group
    ,'0' AS channel_type
    ,'' as exp_subj_name
    ,'0' AS exp_subj_id
    ,'' as camp_type_name
    ,'' as exp_from_name--费用出处
    ,'0' AS camp_type_cd
    ,dealer_name
    ,dealer_id
    ,'0' AS dealer_level
    ,is_direct, 
    system_name,
0.0 before_disc_amt,
0.0 before_disc_amt_ly,
0.0 after_disc_amt,
0.0 sales_cost,
0.0 sales_cost_ly,
0.0 sales_cost_lm,
0.0 cost_budget_year,
0.0 before_disc_amt_ytd,
0.0 before_disc_amt_ly_ytd,
0.0 after_disc_amt_ytd,
0.0 sales_cost_ytd,
0.0 sales_cost_ly_ytd,
0.0 cost_budget_year_ytd,
0.0 task_amt_before,
0.0 task_amt_before_ytd,
0.0 task_amt_after,
0.0 task_amt_after_ytd,
0.0 budget_amt_before,
0.0 budget_amt_before_ytd,
0.0 before_disc_amt_lm,
0.0 cost_budget_year_ly,
0.0 cost_budget_year_ly_ytd,
0.0 task_amt_before_ly,
0.0 task_amt_before_ly_ytd,
0.0 sales_cost_lly,
0.0 cost_budget_year_lm,
0.0 re_attribute6,--xzj
0.0 re_attribute7,--xzj_ytd
0.0 re_attribute8,--budget_amt_af_without
0.0 re_attribute9,--budget_amt_af_without_ytd
t1.cost_budget_year re_attribute10,--budget_amt_af_without_ytd_all
0.0 re_attribute11,--task_amt_af_without_ytd_all
bg_wid,
concat(t2.row_wid,'01') date_
 from 
(SELECT t6.row_wid AS bg_wid
    ,T6.bg_name AS BG_NAME
    ,'budget' as data_src
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
    ,'缺省' AS system_name
    ,substr(t2.name,1,4) AS year_id--预算月份
    ,sum(cast(T1.MONTH_EXPENSE AS DECIMAL(38, 10))) AS cost_budget_year --年度预算分解数
FROM sdata_full.tpm_CX_YEAR_BUD_LN T1
INNER JOIN sdata_full.tpm_S_PERIOD T2 ON T1.MONTH_PERIOD_ID = T2.ROW_ID
LEFT OUTER JOIN sdata_full.tpm_CX_EXP_SUBJECT T3 ON T1.EXP_SUBJ_ID = T3.ROW_ID
INNER JOIN bigdata_dw.dm_tpm_area_d area on t1.org_id = area.tpm_region_id --and area.div_type = 'area'
INNER JOIN bigdata_dw.w_bg_d t6 ON t6.bg_name = area.tpm_bu_name
where t2.name>='2018-11'
group by 
    t6.row_wid
    ,T6.bg_name
    ,area.big_area_name--执行大区
    ,case when area.div_type = 'area' then null else area.area_name end--执行区域
    ,T3.Shot_Name
    ,substr(t2.name,1,4)
) t1 
left join (select row_wid,year_code from bigdata_dw.w_date_d where dt_type='M') t2
on t1.year_id=t2.year_code
) T  where area_name not in('酸奶华东大区','酸奶上海直辖区域')
group by
bg_wid,
bg_name
    ,dep_name--部门
    ,bug_month
    ,function_type_name
    ,area_name
    ,region_name
    ,exp_subj_name
    ,camp_type_name
    ,exp_from_name
    ,dealer_name
    ,dealer_id
    ,is_direct
    ,system_name    
    ,date_;


insert overwrite table bigdata_dm.fact_tpm_cost_anay_f partition(bg_wid,date_)
select bg_wid,
date_wid,
area_wid,
dealer_wid,
channel_wid,
active_type_wid,
account_wid,
bg_name,
dep_name,
bug_month,
function_type_name,
function_type_cd,
area_name,
case when bg_wid = 7 and area_name = '冷饮事业部销售大区' and region_name = '缺省' then '软冰直属' else region_name end as region_name,
city_group,
channel_type,
exp_subj_name,
exp_subj_id,
camp_type_name,
exp_from_name,
camp_type_cd,
dealer_name,
dealer_id,
dealer_level,
is_direct,
system_name,
before_disc_amt,
before_disc_amt_ly,
after_disc_amt,
sales_cost,
sales_cost_ly,
sales_cost_lm,
cost_budget_year,
before_disc_amt_ytd,
before_disc_amt_ly_ytd,
after_disc_amt_ytd,
sales_cost_ytd,
sales_cost_ly_ytd,
cost_budget_year_ytd,
task_amt_before,
task_amt_before_ytd,
task_amt_after,
task_amt_after_ytd,
budget_amt_before,
budget_amt_before_ytd,
before_disc_amt_lm,
cost_budget_year_ly,
cost_budget_year_ly_ytd,
task_amt_before_ly,
task_amt_before_ly_ytd,
sales_cost_lly,
cost_budget_year_lm,
re_attribute1,
re_attribute2,
re_attribute3,
re_attribute4,
re_attribute5,
re_attribute6,
re_attribute7,
re_attribute8,
re_attribute9,
re_attribute10,
re_attribute11,
re_attribute12,
re_attribute13,
re_attribute14,
re_attribute15,
re_attribute16,
re_attribute17,
re_attribute18,
re_attribute19,
re_attribute20,
re_attribute21,
re_attribute22,
re_attribute23,
re_attribute24,
insert_date,
bg_wid,
date_
from bigdata_dm.fact_tpm_cost_anay_f_temp where area_name <> '缺省' and region_name <> '缺省';

