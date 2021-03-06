-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               pj_sl_dealer_in_store_day_a/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dm.pj_sl_dealer_in_store_day_a
-- project:
-- note:
-- purpose:                 经销商有货率M表
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


------------------

insert overwrite table bigdata_dm.pj_sl_dealer_in_store_day_a_temp
--create table bigdata_dm.pj_sl_dealer_in_store_day_a_temp as 
  select 
       k.balance_dt_wid as day_wid,
       k.bg_wid,
       k.product_wid,
       0 as area_wid,
       k.dms_dealer_wid,
       sum(k.qty_ton) as inventory_t, --经销商库存量
       0 as sales_qty_t,
       0 as sales_mtd_t,
       0 as sales_30_qty_t
  from bigdata_dw.fact_sl_dealer_inventory_snaps k 
left join bigdata_dw.w_product_d b
  on k.product_wid = b.row_wid
   where b.product_type in ('NFCP','CPCP','RPCP')--液奶取日配和常陪产品，奶粉只取奶粉产品
   and b.valid_flg = 'Active' --只取生效产品
   and (k.bg_wid = 2
    or (k.bg_wid = 5 and k.balance_dt_wid >= '20171001') --液奶只取17年10月及以后的数据
    or k.bg_wid = 6
    )
   and k.qty_pack <> 0
   and k.qty_ton <> 0 --库存去除为0的值
   --and k.balance_dt_wid >= regexp_replace(date_sub(current_date, 365),'-','')
   and k.balance_dt_wid >= concat_ws('',substr(add_months(current_date,-12),1,4),'01','01')
 group by k.balance_dt_wid, k.bg_wid, k.product_wid, k.dms_dealer_wid 
union all
 select
       k.balance_dt_wid as day_wid,
       k.bg_wid,
       k.product_wid,
       0 as area_wid,
       k.dms_dealer_wid,
       sum(k.qty_ton) as inventory_t, --经销商库存量
       0 as sales_qty_t,
       0 as sales_mtd_t,
       0 as sales_30_qty_t
  from bigdata_dw.fact_sl_dealer_inventory_snaps k
left join bigdata_dw.w_product_d b
  on k.product_wid = b.row_wid
   where 
   b.valid_flg = 'Active' --只取生效产品
   and (k.bg_wid = 6 and k.balance_dt_wid >= '20171001') --液奶只取17年10月及以后的数据
   and k.qty_pack <> 0
   and k.qty_ton <> 0 --库存去除为0的值
   --and k.balance_dt_wid >= regexp_replace(date_sub(current_date, 365),'-','')
   and k.balance_dt_wid >= concat_ws('',substr(add_months(current_date,-12),1,4),'01','01')
 group by k.balance_dt_wid, k.bg_wid, k.product_wid, k.dms_dealer_wid
union all
--经销商销售数据-奶粉
select 
       cast(s.business_dt_wid as bigint) as day_wid,
       s.bg_wid,
       s.product_wid,
       s.area_wid,
       s.dms_dealer_wid,
       0 as inventory_t,
       s.quantity_ton as sales_qty_t,
       s.quantity_mtd_ton as sales_mtd_t,
       s.quantity_30_ton as sales_30_qty_t
  from bigdata_dm.pj_sl_dealer_in_store_temp s
 where s.business_dt_wid < regexp_replace(current_date,'-','') --去除mtd产生的冗余数据
    and (s.bg_wid = 2 or (s.bg_wid in( 5,6) and s.business_dt_wid >= '20171001'));

-----------
--truncate table bigdata_dm.pj_sl_dealer_in_store_day_a;

insert overwrite table bigdata_dm.pj_sl_dealer_in_store_day_a partition(date_)
select * from (
select substr(a.day_wid,1,4) as sales_year,
       a.day_wid,
       a.bg_wid as bu_wid,
       a.product_wid,
       a.area_wid,
       a.dms_dealer_wid,
       sum(a.inventory_t) as inventory_t, --经销商库存量
       sum(a.sales_qty_t) as sales_qty_t, --经销商销量
       sum(a.sales_mtd_t) as sales_mtd_t, --经销商月累计销量
       sum(a.sales_30_qty_t) as sales_30_qty_t, --经销商往前30天销售
       (case
         when sum(a.sales_30_qty_t) > 0 then
          1
         else
          0
       end) as sku_30_qty, --经销商往前30有销售sku数量,经销商有货率分母

       case a.bg_wid
          when 2 then

               (case when sum(a.sales_30_qty_t) <= 0 then
                    0
                else
                    sum(a.inventory_t) / (sum(a.sales_30_qty_t) / 30)
               end)
          when 5 then
                (case when sum(a.sales_mtd_t) <= 0 then
                --无销量有库存并且往前推30天有销量的场景可销天数为无穷大-液奶增加逻辑
                     (case when sum(a.inventory_t) > 0 and sum(a.sales_30_qty_t) > 0  then 999 else 0 end)
                 else
                     sum(a.inventory_t) / (sum(a.sales_mtd_t) / cast(substr(a.day_wid, 7, 2) as int))
                 end)
          when 6 then
                (case when sum(a.sales_mtd_t) <= 0 then
                --无销量有库存并且往前推30天有销量的场景可销天数为无穷大-液奶增加逻辑
                     (case when sum(a.inventory_t) > 0 and sum(a.sales_30_qty_t) > 0  then 999 else 0 end)
                 else
                     sum(a.inventory_t) / (sum(a.sales_mtd_t) / cast(substr(a.day_wid, 7, 2) as int))
                 end)
        else 0 end as inventory_use_day, --库存可销天数

       case
          when case a.bg_wid
          when 2 then
                 (case
                  when sum(a.sales_30_qty_t) <= 0 then
                       0
                  else sum(a.inventory_t) / (sum(a.sales_30_qty_t) / 30)
                  end)
          when 5 then
                 (case
                  when sum(a.sales_mtd_t) <= 0   then
                       (case when sum(a.inventory_t) > 0 and sum(a.sales_30_qty_t) > 0  then 999 else 0 end)
                  else sum(a.inventory_t) / (sum(a.sales_mtd_t) / cast(substr(a.day_wid, 7, 2) as int) )
                  end)
          when 6 then
                 (case
                  when sum(a.sales_mtd_t) <= 0   then
                       (case when sum(a.inventory_t) > 0 and sum(a.sales_30_qty_t) > 0  then 999 else 0 end)
                  else sum(a.inventory_t) / (sum(a.sales_mtd_t) / cast(substr(a.day_wid, 7, 2) as int) )
                  end)
          else 0 end > 1
        then 1
        else 0
        end as inventory_sku_qty, --经销商有货率分子

       min(b.value) as target_in_store_rate,
       current_date as insert_dt,
       a.day_wid as date_
  from bigdata_dm.pj_sl_dealer_in_store_day_a_temp a
  inner join (
--目标值
select bg_wid, name, value
  from bigdata_dw.w_bigdata_p
 where name = '日报-经销商有货率'
) b
 on a.bg_wid = cast(b.bg_wid as bigint)
 group by a.day_wid, a.bg_wid, a.product_wid, a.area_wid, a.dms_dealer_wid) t
 where t.day_wid>= regexp_replace(date_sub(current_date,60),'-','');

