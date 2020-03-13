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

 
insert overwrite table bigdata_dw.dm_sl_warehouse_ds
select
cast(b.org_id as string) wh_id,
b.org_name wh_name,
b.org_code wh_code,
a.loc_id locaton,
a.start_dt,
a.end_dt,
a.create_dt,
a.org_id parent_id,
a.org_name parent_name,
a.upd_dt,
case when b.org_enabled_flag = '1' then 'Y' else 'N' end status,
c.orgn_type,
current_date W_INSERT_DT,
case when c.attribute4 is null then '非直营' else '直营' end attribute4,
d.ATTRIBUTE2,
d.ATTRIBUTE3,
c.orgn_name
from data_lake.d_org_erp_org_info a
inner join data_lake.d_org_inv_organization_def b
on a.org_id=b.operating_unit_id
left join
(select distinct orgn_type,orgn_name,whse_code,attribute4 from data_lake.d_nct_cux_bi_group_b where orgn_type is not null) c
on b.org_code=c.whse_code
left join
(SELECT WHSE_CODE,ATTRIBUTE2,ATTRIBUTE3 FROM data_lake.d_nct_cux_bi_group_b WHERE DEPARMENT='物流部' AND BUSINESS_UNIT_NAME='液态奶事业部') d
on b.org_code=d.whse_code;


