-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               PJ_SALES_MTD_TMP_INC.sql
-- source table:            pj_sales_rate_daily_tmp
-- target table:            bigdata_dm.pj_sales_daily_tmp
-- project:
-- note:
-- purpose:                 销售日报月累计报表
--=============================================================================
-- creation date:       2018-10-21
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
-- 2018-10-21   capgemini       pj_sales_daily_tmp
-------------------------------------------------------------------------------
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=10000;
SET parquet.compression=GZIP;
insert overwrite table bigdata_dm.pj_ec_sales_gmv_mtd_init partition(date_)
select
day_id as sales_dt_wid,
bg_wid,
platform_name,
sale_area_name,
dealer_wid,
erp_id,
pro_id,
pro_categ_name,
pro_brand_name,
pro_grade,
'MTD' as type,
site_wid,
sum(sales_qty_ton) sales_qty_ton,
sum(sales_qty_box) sales_qty_box,
sum(sales_amt_before) sales_amt_before,
sum(sales_amt_after) sales_amt_after,
sum(amt_bf_without_tax) amt_bf_without_tax,
sum(amt_af_without_tax) amt_af_without_tax,
sum(plan_qty_ton) plan_qty_ton,
sum(plan_qty_box) plan_qty_box,
sum(plan_amt_bf_without_tax) plan_amt_bf_without_tax,
sum(plan_amt_af_without_tax) plan_amt_af_without_tax,
sum(task_qty_ton) task_qty_ton,
sum(task_qty_box) task_qty_box,
sum(task_amt_bf_without_tax) task_amt_bf_without_tax,
sum(task_amt_af_without_tax) task_amt_af_without_tax,
sum(budget_qty_ton) budget_qty_ton,
sum(budget_qty_box) budget_qty_box,
sum(budget_amt_bf_without_tax) budget_amt_bf_without_tax,
sum(budget_amt_af_without_tax) budget_amt_af_without_tax,
sum(plan_amt_before) plan_amt_before,
sum(plan_amt_after) plan_amt_after,
sum(task_amt_before) task_amt_before,
sum(task_amt_after) task_amt_after,
sum(budget_amt_before) budget_amt_before,
sum(budget_amt_after) budget_amt_after,
sum(mago_sales_qty_ton) mago_sales_qty_ton,
sum(mago_sales_qty_box) mago_sales_qty_box,
sum(mago_amt_before) mago_amt_before,
sum(mago_amt_bf_without_tax) mago_amt_bf_without_tax,
sum(mago_amt_after) mago_amt_after,
sum(mago_amt_af_without_tax) mago_amt_af_without_tax,
sum(mago_plan_amt_before) mago_plan_amt_before,
sum(mago_plan_amt_after) mago_plan_amt_after,
sum(mago_task_amt_before) mago_task_amt_before,
sum(mago_task_amt_after) mago_task_amt_after,
sum(mago_budget_amt_before) mago_budget_amt_before,
sum(mago_budget_amt_after) mago_budget_amt_after,
sum(tmago_sales_qty_ton) tmago_sales_qty_ton,
sum(tmago_sales_qty_box) tmago_sales_qty_box,
sum(tmago_sales_amt_before) tmago_sales_amt_before,
sum(tmago_sales_amt_after) tmago_sales_amt_after,
sum(tmago_amt_bf_without_tax) tmago_amt_bf_without_tax,
sum(tmago_amt_af_without_tax) tmago_amt_af_without_tax,
sum(tmago_plan_amt_before) tmago_plan_amt_before,
sum(tmago_plan_amt_after) tmago_plan_amt_after,
sum(tmago_task_amt_before) tmago_task_amt_before,
sum(tmago_task_amt_after) tmago_task_amt_after,
sum(tmago_budget_amt_before) tmago_budget_amt_before,
sum(tmago_budget_amt_after) tmago_budget_amt_after,
sum(yago_sales_qty_ton) yago_sales_qty_ton,
sum(yago_sales_qty_box) yago_sales_qty_box,
sum(yago_amt_before) yago_amt_before,
sum(yago_amt_bf_without_tax) yago_amt_bf_without_tax,
sum(yago_amt_after) yago_amt_after,
sum(yago_amt_af_without_tax) yago_amt_af_without_tax,
sum(yago_plan_qty_ton) yago_plan_qty_ton,
sum(yago_plan_qty_box) yago_plan_qty_box,
sum(yago_plan_amt_bf_no_tax) yago_plan_amt_bf_no_tax,
sum(yago_plan_amt_af_no_tax) yago_plan_amt_af_no_tax,
sum(yago_task_qty_ton) yago_task_qty_ton,
sum(yago_task_qty_box) yago_task_qty_box,
sum(yago_task_amt_bf_no_tax) yago_task_amt_bf_no_tax,
sum(yago_task_amt_af_no_tax) yago_task_amt_af_no_tax,
sum(yago_budget_qty_ton) yago_budget_qty_ton,
sum(yago_budget_qty_box) yago_budget_qty_box,
sum(yago_budget_amt_bf_without_tax) yago_budget_amt_bf_without_tax,
sum(yago_budget_amt_af_without_tax) yago_budget_amt_af_without_tax,
sum(yago_plan_amt_before) yago_plan_amt_before,
sum(yago_plan_amt_after) yago_plan_amt_after,
sum(yago_task_amt_before) yago_task_amt_before,
sum(yago_task_amt_after) yago_task_amt_after,
sum(yago_budget_amt_before) yago_budget_amt_before,
sum(yago_budget_amt_after) yago_budget_amt_after,
floor(b.day_id / 100)
 from (select row_wid day_id from bigdata_dw.w_date_d where dt_type='D' and row_wid>=cast('20180101' as bigint) and row_wid<=cast(regexp_replace(last_day(date_sub(current_date,1)),'-','') as bigint)) b
left join (select * from bigdata_dm.pj_ec_sales_gmv_ago where date_ >='201801' and date_ <= regexp_replace(substr(date_sub(current_date,1),1,7),'-','')) a
on a.sales_dt_wid <= b.day_id and a.sales_dt_wid >= floor(b.day_id / 100) * 100 + 1
group by
day_id,
bg_wid,
platform_name,
sale_area_name,
dealer_wid,
erp_id,
pro_id,
pro_categ_name,
pro_brand_name,
pro_grade,
site_wid;