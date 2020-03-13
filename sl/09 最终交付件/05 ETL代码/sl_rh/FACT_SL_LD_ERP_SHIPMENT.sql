-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               FACT_SL_LD_ERP_SHIPMENT.sql
-- source table:            bigdata_ld.FACT_SL_LD_ERP_SHIPMENT_PRE
-- target table:            bigdata_ld.FACT_SL_ERP_SHIPMENT
-- project:
-- note:
-- purpose:                 ERP发运LD层表
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
insert overwrite table bigdata_ld.FACT_SL_LD_ERP_SHIPMENT partition(date_)
select eq.* from (select f.* from bigdata_ld.FACT_SL_LD_ERP_SHIPMENT f where date_ in(select t.date_ from (SELECT date_format(CREATION_DATE,'yyyyMM') as date_ FROM bigdata_ld.FACT_SL_LD_ERP_SHIPMENT_PRE) t group by t.date_) union all select * from bigdata_ld.FACT_SL_LD_ERP_SHIPMENT where date_='__HIVE_DEFAULT_PARTITION__') eq 
where not exists (select tmp.delivery_detail_id from bigdata_ld.FACT_SL_LD_ERP_SHIPMENT_PRE tmp where eq.delivery_detail_id=tmp.delivery_detail_id)
union all
select cast(DELIVERY_DETAIL_ID as bigint),
       cast(HEADER_ID as bigint),
       cast(LINE_ID as bigint),
       cast(SHIPPED_QUANTITY as decimal(38, 10)),
       cast(SHIPPED_WEIGHT as decimal(38, 10)),
       date_format(CONFIRM_DATE, 'yyyy-MM-dd HH:mm:ss') AS CONFIRM_DATE,
       cast(INVENTORY_ITEM_ID as bigint),
       ITEM_NO,
       ITEM_DESCRIPTION,
       cast(CUSTOMER_ID as bigint),
       cast(ORGANIZATION_ID as bigint),
       SHIP_METHOD_CODE,
       date_format(CONFIRM_DATE, 'yyyy-MM-dd HH:mm:ss') AS CREATION_DATE,
       date_format(CONFIRM_DATE, 'yyyy-MM-dd HH:mm:ss') AS LAST_UPDATE_DATE,
       cast(current_timestamp as string) INSERT_DT,
       date_format(CREATION_DATE, 'yyyyMM') as date_
  from bigdata_ld.FACT_SL_LD_ERP_SHIPMENT_PRE;
