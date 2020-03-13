-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_dealer_inventory_snaps/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_dw.fact_sl_dealer_inventory_snaps
-- project:
-- note:
-- purpose:                 经销商库存余额F表
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

--create table fact_sl_dealer_inventory_snaps as
insert overwrite table bigdata_dw.fact_sl_dealer_inventory_snaps partition
  (dt_wid)
select substr(regexp_replace(t1.balance_dt,'-',''),1,8) as balance_dt_wid,
       nvl(bd.row_wid,-1) bg_wid,
       nvl(wpd.row_wid,-1) product_wid,
       nvl(ad.row_wid,-1) area_wid,
       nvl(dealer_zkt.row_wid,0) dms_dealer_wid,
       null as warehouse_wid,
       t1.qty_pack,
       t1.qty_ton,
       null as qty_amt,
       cast(t1.created_on_dt as string) as created_on_dt,
       t1.datasource_id,
       t1.integration_id,
       t1.source,
       t1.w_insert_dt,
substr(regexp_replace(t1.balance_dt,'-',''),1,8)
from(
select t.inv_dt as balance_dt,
       '液态奶事业部' as bg_name,
       t.wlbh as product_code,
       d.area_code,
       d.dealer_code,
       d.bg_region_name as inventory_code,
       t.sl_qty as qty_pack,
       t.sl_wht as qty_ton,
       current_date as created_on_dt,
       'ZKT' as datasource_id,
       concat_ws('_', cast(t.inv_dt as string), t.khbh, t.wlbh) as integration_id,
       d.bg_area_name as source,
       current_date as w_insert_dt
  from bigdata_ld.fact_sl_ld_zkt_inventory_snaps t
  left join bigdata_dw.dm_sl_zkt_dealer_d d
    on t.khbh = d.cust_account_id
 where t.inv_dt <= regexp_replace(current_date, '-', '')
   and t.inv_dt >= regexp_replace(date_sub(current_date, 4), '-', '')
) t1
  left join bigdata_dw.dm_sl_zkt_dealer_d dealer_zkt
    on t1.dealer_code = dealer_zkt.dealer_code and dealer_zkt.datasource_id = t1.datasource_id
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on t1.bg_name = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t1.product_code

union all
select substr(regexp_replace(t.balance_dt,'-',''),1,8) as balance_dt_wid,
       nvl(bd.row_wid,-1) bg_wid,
       nvl(wpd.row_wid,-1) product_wid,
       nvl(ad.row_wid,-1) area_wid,
       nvl(dealer_zkt.row_wid,0) dms_dealer_wid,
       null as warehouse_wid,
       t.qty_pack,
       t.qty_ton,
       null as qty_amt,
       t.created_on_dt,
       'DMS' as datasource_id,
       t.integration_id,
       '' as source,
       current_date as w_insert_dt,
substr(regexp_replace(t.BALANCE_DT,'-',''),1,8)
    from bigdata_ld.fact_sl_ld_dms_inventory_snap t
  left join bigdata_dw.dm_dms_dealer_d dealer_zkt
    on t.dealer_code = dealer_zkt.dealer_erp_code and dealer_zkt.datasource_id = 'DMS' and t.bg_code = dealer_zkt.bg_code
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on case when t.bg_code = 'SN' then '酸奶事业部' when t.bg_code = 'NF' then '奶粉事业部' when t.bg_code = 'YP' then '健康饮品事业部' end = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t.product_code
where t.bg_code ='NF'  and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')


union all
select substr(regexp_replace(t.balance_dt,'-',''),1,8) as balance_dt_wid,
       nvl(bd.row_wid,-1) bg_wid,
       nvl(wpd.row_wid,-1) product_wid,
       nvl(ad.row_wid,-1) area_wid,
       nvl(dealer_zkt.row_wid,0) dms_dealer_wid,
       null as warehouse_wid,
       t.qty_pack,
       t.qty_ton,
       null as qty_amt,
       t.created_on_dt,
       'DMS' as datasource_id,
       t.integration_id,
       '' as source,
       current_date as w_insert_dt,
substr(regexp_replace(t.BALANCE_DT,'-',''),1,8)
    from bigdata_ld.fact_sl_ld_dms_inventory_snap t
  left join bigdata_dw.dm_dms_dealer_d dealer_zkt
    on t.dealer_code = dealer_zkt.integration_id and dealer_zkt.datasource_id = 'DMS' and t.bg_code = dealer_zkt.bg_code
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on case when t.bg_code = 'SN' then '酸奶事业部' when t.bg_code = 'NF' then '奶粉事业部' when t.bg_code = 'YP' then '健康饮品事业部' end = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t.product_code
where t.bg_code in('SN')  and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')


union all
select substr(regexp_replace(t.balance_dt,'-',''),1,8) as balance_dt_wid,
       nvl(bd.row_wid,-1) bg_wid,
       nvl(wpd.row_wid,-1) product_wid,
       nvl(ad.row_wid,-1) area_wid,
       nvl(dealer_zkt.row_wid,0) dms_dealer_wid,
       null as warehouse_wid,
       t.qty_pack,
       t.qty_ton,
       null as qty_amt,
       t.created_on_dt,
       'DMS' as datasource_id,
       t.integration_id,
       '' as source,
       current_date as w_insert_dt,
substr(regexp_replace(t.BALANCE_DT,'-',''),1,8)
    from bigdata_ld.fact_sl_ld_dms_inventory_snap t
  left join bigdata_dw.dm_dms_dealer_d dealer_zkt
    on t.dealer_code = dealer_zkt.dealer_erp_code and dealer_zkt.datasource_id = 'DMS' and t.bg_code = dealer_zkt.bg_code
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on case when t.bg_code = 'SN' then '酸奶事业部' when t.bg_code = 'NF' then '奶粉事业部' when t.bg_code = 'YP' then '健康饮品事业部' end = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t.product_code
where t.bg_code in('YP')  and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')


union all
select substr(regexp_replace(t.balance_dt,'-',''),1,8) as balance_dt_wid,
       nvl(bd.row_wid,-1) bg_wid,
       nvl(wpd.row_wid,-1) product_wid,
       nvl(ad.row_wid,-1) area_wid,
       nvl(dealer_zkt.row_wid,0) dms_dealer_wid,
       null as warehouse_wid,
       t.qty_pack,
       t.qty_ton,
       null as qty_amt,
       t.created_on_dt,
       'ZKT' as datasource_id,
       t.integration_id,
       '' as source,
       current_date as w_insert_dt,
substr(regexp_replace(t.balance_dt,'-',''),1,8)
    from 
    (select t.*
from bigdata_ld.fact_sl_ld_dms_inventory_snap t  WHERE t.BG_CODE = 'YN' and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')
) t
  left join bigdata_dw.dm_sl_zkt_dealer_d dealer_zkt
    on t.dealer_code = dealer_zkt.dealer_code and dealer_zkt.datasource_id = 'ZKT'
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on '液态奶事业部' = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t.product_code;
	
