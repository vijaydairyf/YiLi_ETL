-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_ld_dms_inventory_snap/h.sql
-- source table:            bigdata_ld.cx_awk_snaps_standing,bigdata_ld.CX_AWK_PRODUCT,bigdata_ld.CX_PARTNER_BASE,bigdata_ld.CX_AWK_STORAGE,bigdata_ld.fact_sl_ld_zkt_inventory_snaps,bigdata_dw.dm_sl_zkt_dealer_d,bigdata_dw.fact_sl_zkt_to_dms,bigdata_ld.fact_sl_ld_dms_st_business
-- target table:            bigdata_ld.fact_sl_ld_dms_inventory_snap
-- project:
-- note:
-- purpose:                 DMS库存余额表
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

insert overwrite table bigdata_ld.fact_sl_ld_dms_inventory_snap partition(dt_wid)
select
null as integration_id,
concat_ws('-',substr(date_id,1,4),substr(date_id,5,2),substr(date_id,7,2)) balance_dt,
CASE SUBSTR(product_id, 1, 2)
         WHEN '20' THEN
          'YN'
         WHEN '21' THEN
          'SN'
         WHEN '22' THEN
          'LY'
         WHEN '24' THEN
          'NF'
         WHEN '28' THEN
          'YP'
       END AS BG_CODE,
product_id product_code,
dealer_id as dealer_code,
null warehouse_name,
null as quantity,
null as minunit,
null  individual_uom,
null inter_segment_ex_rate,
on_hand_qty_ct as qty_pack,
on_hand_qty_wt  as qty_ton,
'库存快照' source_type,
null created_by_id,
null created_on_dt,
current_date w_insert_dt,
concat_ws('-',substr(date_id,1,4),substr(date_id,5,2),substr(date_id,7,2))
from dm.fact_inv_dealer_stock where date_id>= regexp_replace(date_sub(current_date,4),'-','');

