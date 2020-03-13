-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_ld_zkt_inventory_snaps/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_ld.fact_sl_ld_zkt_inventory_snaps
-- project:
-- note:
-- purpose:                 ZKT智客通库存余额表(日)
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

------建立临时表
select current_date;

