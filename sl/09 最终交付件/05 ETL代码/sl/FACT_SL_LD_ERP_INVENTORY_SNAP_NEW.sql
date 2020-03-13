-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_ERP_INVENTORY_SNAP_NEW.sql
-- source table:            bigdata_ld.w_sl_ld_erp_inventory_snap
-- target table:            bigdata_dw.FACT_SL_YILI_INVENTORY_SNAPS_TMP
-- project:
-- note:
-- purpose:                 ERP库存余额LD层
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
insert overwrite table bigdata_ld.FACT_SL_LD_ERP_INVENTORY_SNAP_NEW partition(date_)
select * from bigdata_ld.FACT_SL_LD_ERP_INVENTORY_SNAP_NEW where f_date<date_sub(current_date, 31)
union all
SELECT f_date, whse_code, location, inventory_item_id, item_no,item_desc1,cast(null as string),cast(loct_onhand as string), primary_uom_code, item_um, quantity_box, quantity_ton,cast(current_timestamp as string) W_INSERT_DT,substr(regexp_replace(f_date,'-',''),1,6) date_ FROM bigdata_ld.w_sl_ld_erp_inventory_snap;
