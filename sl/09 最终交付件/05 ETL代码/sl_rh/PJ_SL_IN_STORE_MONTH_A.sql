-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               pj_sl_in_store_month_a/h.sql
-- source table:            bigdata_dm.pj_sl_in_store_day_a
-- target table:            bigdata_dm.pj_sl_in_store_month_a
-- project:
-- note:
-- purpose:                 分仓有货率M月报表
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
-- 2018-10-21   capgemini       
-------------------------------------------------------------------------------
---------------

truncate table bigdata_dm.pj_sl_in_store_month_a;

insert overwrite table bigdata_dm.pj_sl_in_store_month_a
partition(date_)
--create table bigdata_ld.pj_sl_in_store_month_a as
select 
substr(month_wid,1,4) as sales_year,
*,
case when a.ly_plan_sku_qty is not null and a.ly_plan_sku_qty<>0 then a.ly_sku_qty end pre_plan_j,
case when a.ly_plan_sales_t is not null and a.ly_plan_sales_t<>0 then a.ly_in_store_t end pre_plan_t,
case when a.plan_sku_qty is not null and a.plan_sku_qty<>0 then a.sku_qty end plan_j,
case when a.plan_sales_t is not null and a.plan_sales_t<>0 then a.in_store_t end plan_t,
current_date as w_insert_dt,
month_wid
from (
select 
       cast(nvl(c.month_wid,l.month_wid+100) as bigint) month_wid,
       nvl(c.bu_wid,l.bu_wid) bu_wid,
       nvl(c.wh_wid,l.wh_wid) wh_wid,
       nvl(c.product_wid,l.product_wid) product_wid,
       c.sku_qty,         --有货品项个数
       c.plan_sku_qty,    --计划品项
       c.inventory_t,     --库存量（吨）
       c.plan_sales_t,    --计划销量（吨）
       c.in_store_t,      --有货量（吨
       c.out_store_t,     --缺货量（吨）
       c.out_store_qty,     --缺货品项个数
       c.wh_plan_sale_t,  --分仓计划销量汇总
       l.ly_sku_qty,      --同期有货品项个数
       l.ly_plan_sku_qty,   --同期计划品项
       l.ly_inventory_t,    --同期库存量（吨）
       l.ly_plan_sales_t,   --同期计划销量（吨）
       l.ly_in_store_t,     --同期有货量（吨）
       c.target_in_store,   --有货率目标值(%)
       c.target_in_store_sku, --有货率品项目标值(%)
       c.target_in_store_t   --有货率货量目标值(%)
     from
 ( --本期
 select substr(day_wid, 1, 6) as month_wid,
          bu_wid,
          wh_wid,
          product_wid,
          count(sku_qty) as sku_qty,
          count(plan_sku_qty) as plan_sku_qty, 
          sum(case when day_wid = regexp_replace(last_day(concat_ws('-', substr(day_wid, 1, 4), substr(day_wid, 5, 2),substr(day_wid, 7, 2))), '-', '') then
                 inventory_t
                else
                 0
              end) as inventory_t, 
          sum(plan_sales_t) as plan_sales_t, 
          sum(in_store_t) as in_store_t, 
          sum(out_store_t) as out_store_t, 
          count(out_store_qty) as out_store_qty,
          sum(wh_plan_sale_t) as wh_plan_sale_t,
          target_in_store,
          target_in_store_sku,
          target_in_store_t
    from bigdata_dm.pj_sl_in_store_day_a
   group by substr(day_wid, 1, 6),
             bu_wid,
             wh_wid,
             product_wid,
             target_in_store,
             target_in_store_sku,
             target_in_store_t 
  )  c
    full join 
 ( --同期
  select substr(day_wid, 1, 6) as month_wid,
          bu_wid,
          wh_wid,
          product_wid,
          count(sku_qty) as ly_sku_qty, --有货品项个数
          count(plan_sku_qty) as ly_plan_sku_qty, --计划品项
          sum(case when day_wid = regexp_replace(last_day(concat_ws('-', substr(day_wid, 1, 4), substr(day_wid, 5, 2),substr(day_wid, 7, 2))), '-', '') then
                 inventory_t
                else
                 0
              end) as ly_inventory_t, --库存量（吨）取每月最后一天，其他日期取0后按月聚合
          sum(plan_sales_t) as ly_plan_sales_t, --计划销量（吨）按月聚合
          sum(in_store_t) as ly_in_store_t --有货量（吨）按月聚合
    from bigdata_dm.pj_sl_in_store_day_a
   where 1 = 1
   group by substr(day_wid, 1, 6),
             bu_wid,
             wh_wid,
             product_wid 
  )   l
   on c.month_wid - 100 = l.month_wid
   and c.bu_wid = l.bu_wid
   and c.product_wid = l.product_wid
   and c.wh_wid = l.wh_wid    
   where nvl(c.month_wid,l.month_wid+100) <=  cast(substr(regexp_replace(current_date,'-',''),1,6) as bigint)) a;
