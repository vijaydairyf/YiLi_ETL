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
where t.bg_code in('SN','NF','YP')  and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')
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
from bigdata_ld.fact_sl_ld_dms_inventory_snap t,bigdata_dw.fact_sl_zkt_to_dms a,bigdata_dw.dm_sl_zkt_dealer_d b
  WHERE t.BG_CODE = 'YN' 
  and t.dealer_code = b.dealer_code
  and b.bg_region_name = a.bg_region_name
  and b.bg_area_name = a.bg_area_name
  and a.c_date <= regexp_replace(t.balance_dt,'-','')
  and regexp_replace(t.balance_dt,'-','') >= regexp_replace(date_sub(current_date,4),'-','')
) t
  left join bigdata_dw.dm_sl_zkt_dealer_d dealer_zkt
    on t.dealer_code = dealer_zkt.dealer_code and dealer_zkt.datasource_id = 'ZKT'
  left join bigdata_dw.w_area_d ad
    on dealer_zkt.area_code = ad.code
  left join bigdata_dw.w_bg_d bd
    on '液态奶事业部' = bd.bg_name
  left join bigdata_dw.w_product_d wpd
    on wpd.integration_id = t.product_code;
	
