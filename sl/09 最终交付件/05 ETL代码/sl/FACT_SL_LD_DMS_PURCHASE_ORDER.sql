
-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               fact_sl_ld_dms_purchase_order/h.sql
-- source table:            bigdata_ld.CX_INDENT_APPLY,bigdata_ld.cx_indent_line,bigdata_ld.cx_awk_product,bigdata_ld.CX_AWK_STORAGE,bigdata_ld.cx_partner_base
-- target table:            bigdata_ld.fact_sl_ld_dms_purchase_order
-- project:
-- note:
-- purpose:                 DMS采购单表
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
--drop table bigdata_ld.fact_sl_ld_dms_purchase_order_tmp;
--create table bigdata_ld.fact_sl_ld_dms_purchase_order_tmp as
insert overwrite table bigdata_ld.fact_sl_ld_dms_purchase_order_tmp
select
a.prod_order_id head_id,
b.prod_order_dtl_id line_id,
a.dealer_id dealer_id,
a.total_qty amount_summary,
to_date(a.appr_dt)  approve_dt,
a.collect_qty collect_number,
e.wh_name delivery_warehouse,
a.prod_order_stat_cd indent_flag,
a.erp_no erpno,
a.erp_id erpid,
a.biz_unit_cd ou_type,
a.plan_shipping_dt plan_ship_dt,
to_date(a.shipping_dt)  ship_dt,
to_date(a.erp_order_dt) erp_order_dt,
a.prod_order_biz_type_cd ordertype,
a.source source,
b.prod_code product_no,
b.prod_order_dtl_type_cd gift_flag,
b.row_qty quantity,
b.row_amt row_money,
b.supply_price supply_price,
b.unit measure,
b.ship_qty quantitysend,
b.req_qty quantitybuy,
b.prod_order_stat_cd state,
b.receipt_qty quantityreceived,
b.erp_line_id erp_line_id,
d.erp_id erp_dealer_code,
case when a.biz_unit_cd='SN' then '酸奶事业部'
     when a.biz_unit_cd='YN' then '液态奶事业部'
     when a.biz_unit_cd='NF' then '奶粉事业部'
     when a.biz_unit_cd='LY' then '冷饮事业部'
     when A.biz_unit_cd='YP' THEN '健康饮品事业部'
end bg_name,
case when b.unit=c.retail_prod_pak_unit_cd then b.row_qty * c.inter_seg_exchg_rate / 1000
     when b.unit=c.primary_prod_unit_cd  then nvl(b.row_qty * c.inter_seg_exchg_rate / 1000,0)
     when b.unit=c.unit_type then nvl(b.row_qty / nvl(c.pack_factor, '1') * c.inter_seg_exchg_rate / 1000,0)
     else b.row_qty / nvl(c.pack_factor, '1') / nvl(c.indiv_unit_exchg_factor, '1') * c.inter_seg_exchg_rate / 1000
 end ton,
a.prod_order_no orderno,
to_date(a.order_dt) order_date,
a.shipping_cycle ship_cycle,
to_date(greatest(a.create_dt,b.create_dt,a.upd_dt)) last_update,
'DMS' datasource_id,
current_date as w_insert_dt,
case when b.unit=c.retail_prod_pak_unit_cd then b.req_qty * c.inter_seg_exchg_rate / 1000
     when b.unit=c.primary_prod_unit_cd  then nvl(b.req_qty * c.inter_seg_exchg_rate / 1000,0)
     when b.unit=c.unit_type then nvl(b.req_qty / nvl(c.pack_factor, '1') * c.inter_seg_exchg_rate / 1000,0)
     else b.req_qty / nvl(c.pack_factor, '1') / nvl(c.indiv_unit_exchg_factor, '1') * c.inter_seg_exchg_rate / 1000
 end quantitybuy_ton,
case when b.unit=c.retail_prod_pak_unit_cd then b.audit_qty * c.inter_seg_exchg_rate / 1000
     when b.unit=c.primary_prod_unit_cd  then nvl(b.audit_qty * c.inter_seg_exchg_rate / 1000,0)
     when b.unit=c.unit_type then nvl(b.audit_qty / nvl(c.pack_factor, '1') * c.inter_seg_exchg_rate / 1000,0)
     else b.audit_qty / nvl(c.pack_factor, '1') / nvl(c.indiv_unit_exchg_factor, '1') * c.inter_seg_exchg_rate / 1000
 end audit_quantity_ton,
b.audit_qty audit_quantity,
case when b.unit=c.retail_prod_pak_unit_cd then nvl(b.audit_qty,0)
     when b.unit=c.primary_prod_unit_cd  then nvl(b.audit_qty,0)
     when b.unit=c.unit_type then nvl(b.audit_qty / c.pack_factor,0)
     else b.audit_qty / c.pack_factor / nvl(c.indiv_unit_exchg_factor, '1')
 end audit_quantity_pack,
case when b.unit=c.retail_prod_pak_unit_cd then nvl(b.row_qty,0)
     when b.unit=c.primary_prod_unit_cd  then nvl(b.row_qty,0)
     when b.unit=c.unit_type then nvl(b.row_qty / c.pack_factor,0)
     else b.row_qty / c.pack_factor / nvl(c.indiv_unit_exchg_factor, '1')
 end quantity_pack,
case when b.unit=c.retail_prod_pak_unit_cd then nvl(b.req_qty,0)
     when b.unit=c.primary_prod_unit_cd  then nvl(b.req_qty,0)
     when b.unit=c.unit_type then nvl(b.req_qty / c.pack_factor,0)
     else b.req_qty / c.pack_factor / nvl(c.indiv_unit_exchg_factor, '1')
 end quantity_buy_pack
from data_lake.d_evt_product_order a
inner join data_lake.d_evt_product_order_dtl b on a.prod_order_id=b.prod_order_id
inner join data_lake.d_prd_ys_product c on b.prod_id = c.prod_id and  c.src_table_name = 'dms_cx_awk_product'
inner join data_lake.d_pty_dealer_base d on a.dealer_id = d.dealer_id
left join data_lake.d_fac_warehouse e on a.wh_id=e.wh_id
where a.prod_order_biz_type_cd='purchase_order'
and b.partition_key >= regexp_replace(date_sub(current_date,66),'-','');








---------------

----------------增量数据放入全量表

drop table bigdata_ld.fact_sl_ld_dms_purchase_order_pre;
create table bigdata_ld.fact_sl_ld_dms_purchase_order_pre as
select * from bigdata_ld.fact_sl_ld_dms_purchase_order aa
where not exists(select 1 from bigdata_ld.fact_sl_ld_dms_purchase_order_tmp bb
where aa.line_id = bb.line_id)
union
select * from bigdata_ld.fact_sl_ld_dms_purchase_order_tmp;

-----------
insert overwrite table bigdata_ld.fact_sl_ld_dms_purchase_order
select * from bigdata_ld.fact_sl_ld_dms_purchase_order_pre;

