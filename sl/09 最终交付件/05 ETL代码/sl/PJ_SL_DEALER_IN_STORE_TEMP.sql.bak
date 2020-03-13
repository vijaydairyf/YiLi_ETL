-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               pj_sl_dealer_in_store_temp/h.sql
-- source table:            bigdata_dw.fact_sl_dealer_sales_order,bigdata_dw.w_product_d,bigdata_dw.w_date_d
-- target table:            bigdata_dm.pj_sl_dealer_in_store_temp
-- project:
-- note:
-- purpose:                 经销商有货率过程表
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
insert overwrite table bigdata_dm.pj_sl_dealer_in_store_temp_a1 
--create table bigdata_dm.pj_sl_dealer_in_store_temp_a1 as
select a.business_dt_wid,
       a.bg_wid,
       a.product_wid,
       0 as area_wid,
       a.dms_dealer_wid,
       sum(a.quantity_pack) as quantity_pack,
       sum(a.quantity_ton) as quantity_ton
  from bigdata_dw.fact_sl_dealer_sales_order a
  left join bigdata_dw.w_product_d b
 on a.product_wid = b.row_wid
   where b.product_type in ('NFCP','CPCP','RPCP') --液奶取日配和常陪产品，奶粉只取奶粉产品
   and b.valid_flg = 'Active' --只取生效产品
   and a.ordertype in ('正常出库', '销售出库') --确定销售
   and a.bg_wid in (2, 5,6) --液奶和奶粉事业部
   and a.quantity_pack<>0--去除交易为0的数据
   and a.quantity_ton <>0
   and a.business_dt_wid >= regexp_replace(date_sub(current_date, 365),'-','')
 group by a.business_dt_wid, a.bg_wid, a.product_wid, a.dms_dealer_wid
union all
select a.business_dt_wid,
       a.bg_wid,
       a.product_wid,
       0 as area_wid,
       a.dms_dealer_wid,
       sum(a.quantity_pack) as quantity_pack,
       sum(a.quantity_ton) as quantity_ton
  from bigdata_dw.fact_sl_dealer_sales_order a
  left join bigdata_dw.w_product_d b
 on a.product_wid = b.row_wid
   where 
    b.valid_flg = 'Active' --只取生效产品
   and a.ordertype in ('正常出库', '销售出库') --确定销售
   and a.bg_wid = 6 --液奶和奶粉事业部
   and a.quantity_pack<>0--去除交易为0的数据
   and a.quantity_ton <>0
   and a.business_dt_wid >= regexp_replace(date_sub(current_date, 365),'-','')
 group by a.business_dt_wid, a.bg_wid, a.product_wid, a.dms_dealer_wid;

---------------------
insert overwrite table bigdata_dm.pj_sl_dealer_in_store_temp_d 
--create table bigdata_dm.pj_sl_dealer_in_store_temp_d as 
select cast(row_wid as string) as date_id,
        regexp_replace(date_sub(regexp_replace(day_dt,'/','-'), 29),'-','') as date_30_id
  from bigdata_dw.w_date_d
 where dt_type = 'D'
   and row_wid between 20170101 and
       regexp_replace(current_date,'-','');

--------------------
insert overwrite table bigdata_dm.pj_sl_dealer_in_store_temp
--create table bigdata_dm.pj_sl_dealer_in_store_temp as 
select t.business_dt_wid,
       t.bg_wid,
       t.product_wid,
       t.area_wid,
       t.dms_dealer_wid as dms_dealer_wid,
       sum(t.quantity_pack) as quantity_pack,
       sum(t.quantity_ton) as quantity_ton,
       sum(t.quantity_30_pack) as quantity_30_pack,
       sum(t.quantity_30_ton) as quantity_30_ton,
       sum(quantity_mtd_pack) as quantity_mtd_pack,
       sum(quantity_mtd_ton) as quantity_mtd_ton,
       current_date as insert_dt
  from (         select a1.business_dt_wid,
                a1.bg_wid,
                a1.product_wid,
                a1.area_wid,
                a1.dms_dealer_wid,
                a1.quantity_pack,
                a1.quantity_ton,
                0 as quantity_30_pack,
                0 as quantity_30_ton,
                0 as quantity_mtd_pack,
                0 as quantity_mtd_ton
          from  bigdata_dm.pj_sl_dealer_in_store_temp_a1 a1 
        --月累计销售值
        union all
        select cast(d.date_id as bigint) as business_dt_wid,
               a1.bg_wid,
               a1.product_wid,
               a1.area_wid,
               a1.dms_dealer_wid,
               0 as quantity_pack,
               0 as quantity_ton,
               0 as quantity_30_pack,
               0 as quantity_30_ton,
               sum(a1.quantity_pack) as quantity_mtd_pack,
               sum(a1.quantity_ton) as quantity_mtd_ton
          from bigdata_dm.pj_sl_dealer_in_store_temp_a1 a1,  bigdata_dm.pj_sl_dealer_in_store_temp_d d
         where substr(a1.business_dt_wid, 0, 6) = substr(d.date_id, 0, 6)
           and a1.business_dt_wid <= d.date_id
         group by d.date_id,
                  a1.bg_wid,
                  a1.product_wid,
                  a1.area_wid,
                  a1.dms_dealer_wid

        union all
        --30天销售值
        select cast(d.date_id as bigint) as business_dt_wid,
               a1.bg_wid,
               a1.product_wid,
               a1.area_wid,
               a1.dms_dealer_wid,
               0 as quantity_pack,
               0 as quantity_ton,
               sum(a1.quantity_pack) as quantity_30_pack,
               sum(a1.quantity_ton) as quantity_30_ton,
               0 as quantity_mtd_pack,
               0 as quantity_mtd_ton
          from  bigdata_dm.pj_sl_dealer_in_store_temp_a1 a1,
               bigdata_dm.pj_sl_dealer_in_store_temp_d d
         where a1.business_dt_wid >= d.date_30_id
           and a1.business_dt_wid <= d.date_id
         group by d.date_id,
                  a1.bg_wid,
                  a1.product_wid,
                  a1.area_wid,
                  a1.dms_dealer_wid ) t
 where t.business_dt_wid < regexp_replace(current_date,'-','')
 group by t.business_dt_wid,
          t.bg_wid,
          t.product_wid,
          t.area_wid,
          t.dms_dealer_wid;
