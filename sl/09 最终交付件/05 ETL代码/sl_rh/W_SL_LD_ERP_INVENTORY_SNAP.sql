SET parquet.compression=GZIP;
INSERT OVERWRITE table bigdata_ld.w_sl_ld_erp_inventory_snap
SELECT H_time.f_date,
       MMT_L.WHSE_CODE,
       MIL.inventory_areas LOCATION,
       MSI.material_id,
       MSI.prod_code ITEM_NO,
       MSI.material_desc ITEM_DESC1,
       SUM(CASE
             WHEN H_time.f_date < MMT_L.ONHAND_DATE THEN
              MMT_L.LOCT_ONHAND
             ELSE
              0
           END) LOCT_ONHAND,
       MSI.primary_unit_code,
       MSI.primary_unit_desc ITEM_UM,
 SUM(CASE
             WHEN H_time.f_date < MMT_L.ONHAND_DATE THEN
              MMT_L.QUANTITY_BOX
             ELSE
              0
           END) QUANTITY_BOX,
    SUM(CASE
             WHEN H_time.f_date < MMT_L.ONHAND_DATE THEN
              MMT_L.QUANTITY_TON
             ELSE
              0
           END) QUANTITY_TON
  FROM (SELECT substr(date_add(current_date, 1), 1, 10) ONHAND_DATE,
               MOQ.SUBINVENTORY_CODE WHSE_CODE,
               MOQ.ORGANIZATION_ID,
               MOQ.LOCATOR_ID,
               MOQ.INVENTORY_ITEM_ID,
               SUM(NVL(MOQ.primary_transaction_quantity, 0)) LOCT_ONHAND,
               SUM(NVL(MOQ.QUANTITY_BOX,0)) QUANTITY_BOX,
               SUM(NVL(MOQ.QUANTITY_TON,0)) QUANTITY_TON
          FROM data_lake.d_nct_cux_mtl_onhand_quantities MOQ
         WHERE NVL(MOQ.TRANSACTION_QUANTITY, 0) <> 0
         GROUP BY MOQ.SUBINVENTORY_CODE,
                  MOQ.ORGANIZATION_ID,
                  MOQ.LOCATOR_ID,
                  MOQ.INVENTORY_ITEM_ID
        UNION ALL
        SELECT substr(MMT.transaction_date, 1, 10) ONHAND_DATE,
               MMT.SUBINVENTORY_CODE WHSE_CODE,
               MMT.ORGANIZATION_ID,
               MMT.LOCATOR_ID,
               MMT.INVENTORY_ITEM_ID,
               -1 * MMT.Primary_Quantity LOCT_ONHAND,
               -1*QUANTITY_BOX QUANTITY_BOX,
               -1*QUANTITY_TON QUANTITY_TON
          FROM data_lake.d_nct_cux_mtl_material_transactions MMT
         WHERE SUBSTR(MMT.transaction_date, 1, 10) >date_sub(current_date,31)
               and partition_key >= regexp_replace(substr(date_sub(current_date,31), 1, 7),'-','')) MMT_L

 inner join data_lake.d_prd_material_main MSI
    on MMT_L.INVENTORY_ITEM_ID = MSI.material_id
   and MSI.ORG_ID=383
   AND MSI.prod_code LIKE '2%'
 inner join data_lake.d_loc_material_loc MIL
    on MMT_L.LOCATOR_ID = MIL.inventory_loc_id
  left join (select regexp_replace(day_dt, "/", "-") f_date
               from bigdata_dw.w_date_d) H_time
    on H_time.f_date BETWEEN H_time.f_date AND MMT_L.ONHAND_DATE
   AND H_time.f_date BETWEEN date_sub(current_date,31) AND substr(current_date,1, 10)  
 GROUP BY H_time.f_date,
          MMT_L.WHSE_CODE,
          MIL.inventory_areas,
          MSI.material_id,
          MSI.prod_code,
          MSI.material_desc,
          MSI.primary_unit_code,
          MSI.primary_unit_desc;

