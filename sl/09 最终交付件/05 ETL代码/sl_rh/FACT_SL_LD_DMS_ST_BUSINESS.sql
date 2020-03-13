-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_ld_dms_st_business/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.cx_st_business,bigdata_ld.cx_partner_base
-- target table:            bigdata_ld.fact_sl_ld_dms_st_business
-- project:
-- note:
-- purpose:                 DMS库存事务表
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



set hive.exec.dynamic.partition.mode=nonstrict;
insert overwrite table bigdata_ld.fact_sl_ld_dms_st_business    partition
  (dt_wid)
select
a.business_id as row_id,
null as erpid,
a.receipts_no as receipts_no,
a.business_dt as business_date,
a.business_type as order_type,
a.business_unit  as business_unit,
a.business_qty as business_quantity,
f.prod_code as prodnum,
f.ou_id as bg_code,
b.erp_id as dealer_code,
a.supplier_id as supplier_id,
a.creator_id as created_by_id,
a.creator_id as changed_by_id,
a.create_dt created_on_dt,
a.create_dt changed_on_dt,
'DMS' as datasource_id,
nvl(a.business_qty/nvl(f.pack_factor,'1')/nvl(f.indiv_unit_exchg_factor,'1'),0) as qty_pack,
nvl(a.business_qty/nvl(f.pack_factor,'1')/nvl(f.indiv_unit_exchg_factor,'1') * nvl(f.inter_seg_exchg_rate,'0')/1000,0) as qty_ton,
current_date as w_insert_dt,
i.erp_line_id as erp_line_id,
a.org_id as dealer_id,
null as erpno,
substr(a.create_dt,1,10) as dt_wid
from data_lake.d_evt_business a
inner join data_lake.d_pty_dealer_base b  on a.org_id = b.dealer_id and b.sale_type='Dealer'
inner join data_lake.d_prd_ys_product f on a.prod_id = f.prod_id and  f.src_table_name = 'dms_cx_awk_product'
inner join data_lake.d_evt_out_in_inventory_dtl g on a.receipts_row_id=g.out_in_inventory_dtl_id
inner join data_lake.d_evt_product_order_dtl i on  g.prod_order_dtl_id=i.prod_order_dtl_id
where a.partition_key>= regexp_replace(date_sub(current_date,1),'-','')
union all
select
a.business_id as row_id,
null as erpid,
a.receipts_no as receipts_no,
a.business_dt as business_date,
a.business_type as order_type,
a.business_unit  as business_unit,
a.business_qty as business_quantity,
f.prod_code as prodnum,
f.ou_id as bg_code,
b.erp_id as dealer_code,
a.supplier_id as supplier_id,
a.creator_id as created_by_id,
a.creator_id as changed_by_id,
a.create_dt created_on_dt,
a.create_dt changed_on_dt,
'DMS' as datasource_id,
--nvl(a.business_qty/nvl(f.pack_factor,1)/nvl(f.indiv_unit_exchg_factor,1),0) as qty_pack,
--nvl(a.business_qty/nvl(f.pack_factor,1)/nvl(f.indiv_unit_exchg_factor,1) * nvl(f.INTER_SEGMENT_EX_RATE,0)/1000,0) as qty_ton,
nvl(a.business_qty/nvl(f.pack_factor,'1')/nvl(f.indiv_unit_exchg_factor,'1'),0) as qty_pack,
nvl(a.business_qty/nvl(f.pack_factor,'1')/nvl(f.indiv_unit_exchg_factor,'1') * nvl(f.inter_seg_exchg_rate,'0')/1000,0) as qty_ton,
current_date as w_insert_dt,
'' as erp_line_id,
a.org_id as dealer_id,
null as erpno,
substr(a.create_dt,1,10) as dt_wid
from
data_lake.d_evt_business a
inner join data_lake.d_pty_dealer_base b  on a.org_id = b.dealer_id and b.sale_type='Dealer'
inner join data_lake.d_prd_ys_product f on a.prod_id = f.prod_id and  f.src_table_name = 'dms_cx_awk_product'
where a.partition_key>= regexp_replace(date_sub(current_date,1),'-','')  and a.business_type in ('销售出库', '退货入库', '积分订单出库', '回货入库', '回单入库') and f.ou_id in( 'YN','YP')
;

