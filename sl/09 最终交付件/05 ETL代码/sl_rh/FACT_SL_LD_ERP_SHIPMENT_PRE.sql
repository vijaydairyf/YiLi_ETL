-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_ERP_SHIPMENT_PRE.sql
-- source table:            bigdata_ld.wsh_delivery_details,bigdata_ld.wsh_delivery_assignments,bigdata_ld.wsh_new_deliveries,bigdata_ld.mtl_system_items_b
-- target table:            bigdata_ld.FACT_SL_LD_ERP_SHIPMENT
-- project:
-- note:
-- purpose:                 ERP发运LD层中间表
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
insert overwrite table bigdata_ld.FACT_SL_LD_ERP_SHIPMENT_PRE
select WDD.DELIVERY_DETAIL_ID as DELIVERY_DETAIL_ID,
       WDD.SOURCE_HEADER_ID as HEADER_ID,
       WDD.SOURCE_LINE_ID as LINE_ID,
       WDD.QUANTITY_BOX AS SHIPPED_QUANTITY,
       WDD.QUANTITY_TON AS SHIPPED_WEIGHT,
       WND.CONFIRM_DT AS CONFIRM_DATE,
       WDD.INVENTORY_ITEM_ID AS INVENTORY_ITEM_ID,
       msi.prod_code as item_no,
       WDD.ITEM_DESCRIPTION AS ITEM_DESCRIPTION,
       WDD.CUSTOMER_ID AS CUSTOMER_ID,
       WDD.ORGANIZATION_ID AS ORGANIZATION_ID,
       WDD.SHIP_METHOD_CODE AS SHIP_METHOD_CODE,
       wdd.creation_date AS creation_date,
       wdd.last_update_date AS last_update_date,
       current_timestamp AS INSERT_DT
  from
(SELECT * FROM data_lake.d_nct_cux_wsh_delivery_details WHERE partition_key >=substr(add_months(date_sub(current_date,-1),-5),1,7) and substr(last_update_date,1,10)>=date_sub(current_date,1))  WDD
  INNER JOIN data_lake.d_evt_delivery_assign WDA ON wdd.DELIVERY_DETAIL_ID = wda.DELIVERY_DTL_ID and WDA.partition_key>=regexp_replace(substr(add_months(date_sub(current_date,-1),-5),1,7),'-','')
  INNER JOIN data_lake.d_evt_sale_order_delivery       WND ON wda.delivery_id = wnd.delivery_id and WND.partition_key>=substr(add_months(date_sub(current_date,-1),-5),1,7)
  INNER JOIN data_lake.d_prd_material_main       msi ON (wdd.INVENTORY_ITEM_ID = msi.material_id AND msi.org_id = 383);


