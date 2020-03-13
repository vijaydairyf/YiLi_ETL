
insert overwrite table bigdata_dw.DM_SL_ZKT_DEALER_DS
select '液态奶事业部' as BG_NAME,
       a.biz_unit_cd as BG_CODE,
       c2.REGION_NAME BG_AREA_NAME,
       c1.REGION_NAME BG_REGION_NAME,
       c3.REGION_NAME BG_CITY_GROUP_NAME,
       c4.REGION_NAME BG_CITY_NAME,
       d2.admin_division_name CITY_NAME,
       d1.admin_division_name PROVINCE_NAME,
       current_date as w_insert_dt,
       current_date as w_update_dt,
       'ZKT' as DATASOURCE_ID,
       b.dealer_name as DEALER_ERP_NAME,
       d3.admin_division_name COUNTY_NAME,
       b.INTEGRATION_ID INTEGRATION_ID,
       b.INTEGRATION_ID row_id,
       b.dealer_name as DEALER_NAME,
       b.ERP_id DEALER_code,
       current_date CREATED_ON_DT,
       current_date CHANGED_ON_DT,
       current_date AUX1_CHANGED_ON_DT,
       b.INTEGRATION_ID,
       regexp_replace(c4.region_full_name, '\\.', '-') AS AREA_CODE,
       '' as id
  FROM data_lake.d_pty_dealer_mng a
 inner join data_lake.d_pty_dealer_base b
    on a.dealer_id = b.dealer_id
   and a.biz_unit_cd = 'YN'
  left outer join data_lake.d_par_region c1
    on a.YL_GRAND_ORG_ID = c1.region_id
  left outer join data_lake.d_par_region c2
    on a.YL_ORG_ID = c2.region_id
  left outer join data_lake.d_par_region c3
    on a.YL_CITY_GRP_ID = c3.region_id
  left outer join data_lake.d_par_region c4
    on a.YL_CITY_ID = c4.region_id
  left outer join data_lake.d_par_admin_division d1
    on b.PROVINCE_id = d1.admin_division_id
  left outer join data_lake.d_par_admin_division d2
    on b.CITY_id = d2.admin_division_id
  left outer join data_lake.d_par_admin_division d3
    on b.COUNTY_id = d3.admin_division_id
  left outer join data_lake.d_par_admin_division d4
    on b.TOWN_id = d4.admin_division_id;


