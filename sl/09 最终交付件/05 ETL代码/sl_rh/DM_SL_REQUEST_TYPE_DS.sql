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

--缓慢变化维实现方法
insert overwrite table bigdata_dw.dm_sl_request_type_ds
--insert overwrite table bigdata_ld.dm_sl_request_type_ds
select 
lookup_code,
lookup_meaning,
desc,
enabled_flag,
valid_dt start_date_active,
invalid_dt end_date_active,
upd_dt last_update_date
from data_lake.d_par_lookup_value 
where LOOKUP_TYPE = 'DEMAND_CLASS' and lang = 'ZHS';


