-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_ERP_SALES_ORDER_PRE.sql
-- source table:            bigdata_ld.CUX_OE_ORDER_LINES_BIGDATA_B_SL,bigdata_ld.OE_ORDER_HEADERS_ALL,bigdata_ld.OE_TRANSACTION_TYPES_TL,bigdata_ld.HR_ALL_ORGANIZATION_UNITS,bigdata_ld.INV_ORGANIZATION_INFO_V,bigdata_ld.CUX_CUSTOMER,bigdata_ld.OE_DEMAND_CLASSES_V,bigdata_ld.hz_cust_site_uses_all,bigdata_ld.PO_LOCATION_ASSOCIATIONS_ALL,bigdata_ld.hr_locations_all,bigdata_ld.HR_ALL_ORGANIZATION_UNITS,bigdata_ld.ORG_ORGANIZATION_DEFINITIONS
-- target table:            bigdata_dw.FACT_SL_LD_ERP_SALES_ORDER
-- project:
-- note:
-- purpose:                 ERP销售订单ld层表
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

insert overwrite table bigdata_ld.OL1
select OL.REQUEST_DATE  REQUEST_DATE,
       OL.DEMAND_CLASS_CODE as DEMAND_CLASS_CODE, --分配工厂代码
       OL.INVOICE_TO_ORG_ID as INVOICE_TO_ORG_ID, --客户地址编号
       OL.FLOW_STATUS_CODE as FLOW_STATUS_CODE, --行状态
       OL.INVENTORY_ITEM_ID as INVENTORY_ITEM_ID, --品项
       OL.ORDERED_ITEM as ORDERED_ITEM, --品项代码 （12位表示）
       OL.LINE_CATEGORY_CODE,
       OL.ORDERED_QUANTITY,
       OL.QUANTITY_BOX,
       OL.QUANTITY_TON,
       OL.UNIT_SELLING_PRICE as UNIT_SELLING_PRICE, --销售单价
       OL.UNIT_LIST_PRICE as UNIT_LIST_PRICE, --价目表
       OL.LATEST_ACCEPTABLE_DATE as LATEST_ACCEPTABLE_DATE, --要求到货时间
       OL.ATTRIBUTE18 as ATTRIBUTE18,
       OL.ACTUAL_SHIPMENT_DATE as ACTUAL_SHIPMENT_DATE,
       OL.HEADER_ID as HEADER_ID,
       OL.LINE_ID as LINE_ID,
       OL.SHIPPING_METHOD_CODE as SHIPPING_METHOD_CODE,
       OL.SHIP_TO_ORG_ID as SHIP_TO_ORG_ID,
       OL.CANCELLED_FLAG as CANCELLED_FLAG,
       OL.SHIPPED_QUANTITY as SHIPPED_QUANTITY,
       OL.ORDER_QUANTITY_UOM as ORDER_QUANTITY_UOM,
       OL.CANCELLED_QUANTITY as CANCELLED_QUANTITY,
       OL.ATTRIBUTE19 as ATTRIBUTE19,
       OL.ATTRIBUTE20 as ATTRIBUTE20,
       OL.CREATION_DATE as CREATION_DATE,
       OL.LAST_UPDATE_DATE as LAST_UPDATE_DATE,
       OL.SHIP_FROM_ORG_ID, 
       (case when OL.LINE_CATEGORY_CODE='RETURN' then -1 else 1 end)*OL.ORDERED_QUANTITY as SALES_QTY,
       (case when OL.LINE_CATEGORY_CODE='RETURN' then -1 else 1 end)*OL.QUANTITY_BOX as SALES_QTY_BOX,
      (case when OL.LINE_CATEGORY_CODE='RETURN' then -1 else 1 end)*OL.QUANTITY_TON as SALES_QTY_TOM      
from
   data_lake.d_nct_cux_oe_order_lines_bigdata_b ol where substr(LAST_UPDATE_DATE,1,10) >= concat(substr(add_months(current_date,-1),1,8),'01');

insert overwrite table bigdata_ld.FACT_SL_LD_ERP_SALES_ORDER_PRE
SELECT
OL.REQUEST_DATE  REQUEST_DATE,
--TO_CHAR(OL.REQUEST_DATE, 'YYYYMMDD') REQUEST_DATE, --订单时间
       CUST.SEGMENT1 business_name, --事业部
       IOI.oper_unit_code OPERATING_UNIT, --机构（公司，工厂）
       HOU.org_NAME OU_NAME,
       HOU.org_id as OU_ID,
       IOI.ORG_ID as ORGANIZATION_ID , --仓库
       IOI.ORG_CODE as ORGANIZATION_CODE, --仓库代码
       OT.NAME as ORDER_TYPE, --订单类型
       OH.ORDER_NO as ORDER_NUMBER, --订单编号
       OL.DEMAND_CLASS_CODE as DEMAND_CLASS_CODE, --分配工厂代码
       DC.demand_type_name as DEMAND_CLASS, --分配工厂
       CUST.CUST_ACCOUNT_ID as CUST_ACCOUNT_ID, --客户编号
       CUST.CUSTOMER_TYPE as CUSTOMER_TYPE, --客户类型
       CUST.TERRITORY_ID as TERRITORY_ID, --区域编号
       OL.INVOICE_TO_ORG_ID as INVOICE_TO_ORG_ID, --客户地址编号
       OL.FLOW_STATUS_CODE as FLOW_STATUS_CODE, --行状态
       OL.INVENTORY_ITEM_ID as INVENTORY_ITEM_ID, --品项
       OL.ORDERED_ITEM as ORDERED_ITEM, --品项代码 （12位表示）
       ol.SALES_QTY,
       ol.SALES_QTY_BOX,
       ol.SALES_QTY_TOM,
       OL.UNIT_SELLING_PRICE as UNIT_SELLING_PRICE, --销售单价
       OL.UNIT_LIST_PRICE as UNIT_LIST_PRICE, --价目表
       case when OH.BOOKED_FLAG = '1' then 'Y' else 'N' end as BOOKED_FLAG, --订单登记标志
       regexp_replace(OH.order_booked_dt,'-','/') as BOOKED_DATE, --订单登记时间
       OL.LATEST_ACCEPTABLE_DATE as LATEST_ACCEPTABLE_DATE, --要求到货时间
       OL.ATTRIBUTE18 as ATTRIBUTE18,
       OL.ACTUAL_SHIPMENT_DATE as ACTUAL_SHIPMENT_DATE,
       OH.client_po_no as CUST_PO_NUMBER,
       OL.HEADER_ID as HEADER_ID,
       OL.LINE_ID as LINE_ID,
       OL.SHIPPING_METHOD_CODE as SHIPPING_METHOD_CODE,
       OL.SHIP_TO_ORG_ID as SHIP_TO_ORG_ID,
       regexp_replace(OH.order_dt,'-','/') as ORDERED_DATE,
       OH.ATTR1 as ATTRIBUTE1,
       OL.CANCELLED_FLAG as CANCELLED_FLAG,
       OL.SHIPPED_QUANTITY as SHIPPED_QUANTITY,
       OL.ORDER_QUANTITY_UOM as ORDER_QUANTITY_UOM,
       OH.ATTR2 as ATTRIBUTE2,
       OL.CANCELLED_QUANTITY as CANCELLED_QUANTITY,
       OL.ATTRIBUTE19 as ATTRIBUTE19,
       OL.ATTRIBUTE20 as ATTRIBUTE20,
       OL.CREATION_DATE as CREATION_DATE,
       OL.LAST_UPDATE_DATE as LAST_UPDATE_DATE,
       ood.ORG_id as receive_wh_id,--收货仓库
       ood.ORG_code as receive_wh_code, --收货仓库
       current_date as INSERT_DT
  FROM bigdata_ld.OL1
  OL inner join  data_lake.d_evt_sale_order_header OH on OH.HEADER_ID = OL.HEADER_ID
       inner join data_lake.d_par_sale_transaction_type_mul_lang    OT  on  OH.ORDER_TYPE_ID = OT.TRANSACTION_TYPE_ID and OT.lang = 'ZHS'
       left join data_lake.d_org_erp_org_info   HOU on  OH.ORG_ID = HOU.org_id
       left join data_lake.d_org_inv_org_info     IOI on  OL.SHIP_FROM_ORG_ID = IOI.ORG_ID
       left join data_lake.d_nct_cux_customer   CUST on  OL.INVOICE_TO_ORG_ID = CUST.SITE_USE_ID
       left join data_lake.d_par_sale_order_demand_type  DC on OL.DEMAND_CLASS_CODE = DC.demand_type_code
       left join data_lake.d_loc_client_site_use_info csu on ol.SHIP_TO_ORG_ID = csu.site_use_id
       left join data_lake.d_loc_purc_order_rela_client_addr PLA on csu.site_use_id = pla.site_use_id
       left join data_lake.d_loc_org_loc hll on pla.loc_id = hll.org_loc_id
       left join data_lake.d_org_erp_org_info  hou1 on  hll.org_loc_id = hou1.loc_id and hll.inv_org_id = hou1.org_id
       left join data_lake.d_org_inv_organization_def ood on hou1.org_id = ood.ORG_ID;

