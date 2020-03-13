
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


insert overwrite table bigdata_dw.dm_sl_sales_order_ds
select
oh.header_id as header_id,
oh.order_no as order_number,
regexp_replace(oh.order_booked_dt, '/', '-') as BOOKED_DATE,
null as ordered_date,
OT.NAME as ORDER_TYPE,
current_date as w_insert_dt,
case when rt.segment1='冷饮事业部' then rt.segment1
     when rt1.segment1<>'冷饮事业部' then rt1.segment1
end bg_name,
case when rt.segment1='冷饮事业部' then rt.segment2
     when rt1.segment1<>'冷饮事业部' then rt1.segment2
end BIG_AREA_NAME,
case when rt.segment1='冷饮事业部' then rt.segment3
     when rt1.segment1<>'冷饮事业部' then rt1.segment3
end AREA_NAME,
case when rt.segment1='冷饮事业部' then rt.segment4
     when rt1.segment1<>'冷饮事业部' then rt1.segment4
end CITES_NAME,
case when rt.segment1='冷饮事业部' then rt.segment5
     when rt1.segment1<>'冷饮事业部' then rt1.segment5
end CITY_NAME,
case when rt.segment1='冷饮事业部' then concat(rt.segment1,'-',rt.segment2,'-',rt.SEGMENT3,'-',rt.SEGMENT4,'-',rt.SEGMENT5)
     when rt1.segment1<>'冷饮事业部' then concat(rt1.segment1,'-',rt1.segment2,'-',rt1.SEGMENT3,'-',rt1.SEGMENT4,'-',rt1.SEGMENT5)
end AREA_FIVE_COEE,
party.partner_name as dealer_name,
cust_acct.acct_no as dealer_CODE,
case when rt.segment1='冷饮事业部' then rt.region_id
     when rt1.segment1<>'冷饮事业部' then rt1.region_id
end site_id,
regexp_replace(oh.upd_dt,'-','/') as last_update_date,
regexp_replace(oh.order_req_dt,'-','/') as REQUEST_DATE
from data_lake.d_evt_sale_order_header OH
left join data_lake.d_pty_client_acct cust_acct on OH.SOLD_TO_ORG_ID=cust_acct.client_acct_id and cust_acct.src_table_name = 'erp_hz_cust_accounts'
--left join bigdata_ld.hz_cust_accounts_ebs cust_acct on OH.SOLD_TO_ORG_ID=cust_acct.cust_account_id
left join data_lake.d_pty_partner party on party.partner_id = cust_acct.partner_id
left join data_lake.d_par_sale_transaction_type_mul_lang OT on  OH.ORDER_TYPE_ID = OT.TRANSACTION_TYPE_ID and OT.lang = 'ZHS'
left join data_lake.d_loc_client_site_use_info csu on oh.ship_to_org_id=csu.site_use_id and CSU.distr_client_site_biz = 'SHIP_TO'
left join data_lake.d_loc_client_region rt on csu.territory_id = rt.region_id
LEFT JOIN data_lake.d_loc_client_site_use_info CSU1 ON OH.INVOICE_TO_ORG_ID = CSU1.SITE_USE_ID AND CSU1.distr_client_site_biz = 'BILL_TO'
LEFT JOIN data_lake.d_loc_client_region  RT1 ON CSU1.TERRITORY_ID = RT1.region_id
where substr(oh.create_dt,1,10)>='2017-01-01' and oh.BOOKED_FLAG='1' and substr(oh.upd_dt,1,10)>=date_sub(current_date,11);


