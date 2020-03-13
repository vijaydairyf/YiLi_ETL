-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               pj_sl_in_store_day_a/h.sql
-- source table:            bigdata_dw.fact_sl_sales_plan,bigdata_dw.fact_sl_yili_inventory_snaps,bigdata_dw.w_bigdata_p
-- target table:            bigdata_dm.pj_sl_in_store_day_a
-- project:
-- note:
-- purpose:                 分仓有货率M表
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

--create table bigdata_dm.pj_sl_in_store_day_a_tempa as 
insert overwrite table bigdata_dm.pj_sl_in_store_day_a_tempa
select cast(t2.day_wid as string) as day_wid,
       t2.bg_wid,
       t2.product_wid,
       t2.warehouse_wid,
       t2.inventory_t, --库存量（吨）
       t2.plan_sales_t, --库存量（吨）
       t2.plan_sku_qty, --计划品项个数
       (case
         when t2.inventory_t >= t2.plan_sales_t then
          t2.plan_sales_t
         else
          t2.inventory_t
       end) as in_store_t, --有货量（吨）
       (case
         when t2.inventory_t >= t2.plan_sales_t then
          t2.product_wid
         else
          null
       end) as sku_qty, --有货品项个数
       (case
         when t2.inventory_t < t2.plan_sales_t then
          t2.plan_sales_t - t2.inventory_t
         else
          0
       end) as out_store_t, --缺货量（吨）
       (case
         when t2.inventory_t < t2.plan_sales_t then
          t2.product_wid
         else
          null
       end) as out_store_qty, --缺货品项个数
       (case
         when t2.inventory_t < t2.plan_sales_t then
          1
         else
          0
       end) as out_store_qty_flag
  from (select a1.day_wid,
               a1.bg_wid,
               a1.product_wid,
               a1.warehouse_wid as warehouse_wid,
               nvl(sum(b1.qty_ton),0) as inventory_t, 
               sum(a1.plan_qty_ton_day) as plan_sales_t,
               a1.product_wid as plan_sku_qty 
          from bigdata_dw.fact_sl_sales_plan a1
          left join
               (select balance_dt_wid,
       bg_wid,
       product_wid,
       warehouse_wid,
       sum(qty_ton) as qty_ton
  from bigdata_dw.fact_sl_yili_inventory_snaps
 where (bg_wid = 2 and location in ('发货区', '合格区'))
    or (bg_wid in( 5,6) and location = '合格区') 
 group by balance_dt_wid, bg_wid, product_wid, warehouse_wid
) b1
         on  a1.day_wid = b1.balance_dt_wid
           and a1.bg_wid = b1.bg_wid
           and a1.product_wid = b1.product_wid
           and a1.warehouse_wid = b1.warehouse_wid
           --where a1.plan_qty_ton_day<>0
         group by a1.day_wid, a1.bg_wid, a1.product_wid, a1.warehouse_wid
         order by a1.day_wid
         ) t2;

----------
--create table bigdata_dm.pj_sl_in_store_day_a_tempb  as
insert overwrite table bigdata_dm.pj_sl_in_store_day_a_tempb
 select m.bg_wid,
        sum(m.target_in_store) as target_in_store,
        sum(m.target_in_store_sku) as target_in_store_sku,
        sum(m.target_in_store_t) as target_in_store_t
   from (select bg_wid,
                value as target_in_store,
                0 as target_in_store_sku,
                0 as target_in_store_t
           from bigdata_dw.w_bigdata_p
          where name = '日报-分仓有货率'
         union all
         select bg_wid,
                0 as target_in_store,
                value as target_in_store_sku,
                0 as target_in_store_t
           from bigdata_dw.w_bigdata_p
          where name = '日报-分仓有货率-品项'
         union all
         select bg_wid,
                0 as target_in_store,
                0 as target_in_store_sku,
                value as target_in_store_t
           from bigdata_dw.w_bigdata_p
          where name = '日报-分仓有货率-货量'
         ) m
  group by m.bg_wid;
  
--------------------
--truncate table bigdata_dm.pj_sl_in_store_day_a;
insert overwrite table bigdata_dm.pj_sl_in_store_day_a partition(date_)
select * from (
select substr(t.day_wid,1,4) as sales_year,
       t.day_wid,
       t.bu_wid,
       t.product_wid,
       t.wh_wid,
       case when t.out_store_qty is not null then t.wh_wid else 0 end out_store_wh_wid,
       t.inventory_t, --库存量（吨）
       t.plan_sales_t, --计划销量（吨）
       t.in_store_t, --有货量（吨）
       t.sku_qty, --有货品项个数
       t.plan_sku_qty, --计划品项个数
       t.out_store_t, --缺货量（吨）
       t.out_store_qty, --缺货品项个数
       sum(out_store_qty_flag) over(partition by t.out_store_by_wh, t.bu_wid, t.product_wid, t.wh_wid, t.out_store_qty_flag order by t.day_wid) as out_store_by_wh,
       sum(out_store_qty_flag) over(partition by t.out_store_by_all, t.bu_wid, t.product_wid, t.out_store_qty_flag order by t.day_wid) as out_store_by_all,
       t.target_in_store, --有货率目标值(%)
       t.target_in_store_sku, --有货率品项目标值(%)
       t.target_in_store_t,
       sum(t.plan_sales_t) over(partition by t.day_wid, t.bu_wid,t.wh_wid order by t.day_wid) as wh_plan_sale_t,


      case when t.OUT_STORE_QTY is null then 0 else 1 end plan_j,
           case when t.sku_qty is null then 0 else 1 end plan_j_flag,
       case when t.plan_sales_t is not null then t.in_store_t end plan_t,
           case when t.plan_sales_t is not null then 1 else 0 end plan_t_flag,
       case when t.out_store_qty is not null then t.plan_sales_t else 0 end out_store_plan_sales_t,












           current_date as insert_dt,
       t.day_wid as date_
  from (select a.day_wid,
               a.bg_wid as bu_wid,
               a.product_wid,
               a.warehouse_wid as wh_wid,
               a.inventory_t, --库存量（吨）
               a.plan_sales_t, --计划销量（吨）
               a.in_store_t, --有货量（吨）
               a.sku_qty, --有货品项个数
               a.plan_sku_qty, --计划品项个数
               a.out_store_t, --缺货量（吨）
               a.out_store_qty, --缺货品项个数
               a.out_store_qty_flag,
               date_sub(concat_ws('-',substr(a.day_wid,1,4),substr(a.day_wid,5,2),substr(a.day_wid,7,2)),row_number() over(partition by a.bg_wid, a.product_wid, a.warehouse_wid, a.out_store_qty_flag order by a.day_wid)) as out_store_by_wh, --连续缺货天数（分仓）
               date_sub(concat_ws('-',substr(a.day_wid,1,4),substr(a.day_wid,5,2),substr(a.day_wid,7,2)),row_number() over(partition by a.bg_wid, a.product_wid, a.out_store_qty_flag order by a.day_wid)) as out_store_by_all, --连续缺货天数(all)
               b.target_in_store, --有货率目标值(%)
               b.target_in_store_sku, --有货率品项目标值(%)
               b.target_in_store_t

          from bigdata_dm.pj_sl_in_store_day_a_tempa a left join bigdata_dm.pj_sl_in_store_day_a_tempb b
         on a.bg_wid = b.bg_wid) t) t
         where t.day_wid>= regexp_replace(date_sub(current_date,60),'-','');

