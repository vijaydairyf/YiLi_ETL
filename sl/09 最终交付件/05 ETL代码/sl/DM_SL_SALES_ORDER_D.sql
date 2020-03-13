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
--缓慢变化维实现方法

insert overwrite table bigdata_dw.dm_sl_sales_order_d_tmp
--create table bigdata_dw.dm_sl_sales_order_d as 
select nvl(t2.header_id, t1.header_id) as header_id,
       nvl(t2.order_number, t1.order_number) as order_number,
       nvl(t2.booked_date, t1.booked_date) as booked_date,
       t1.ordered_date as ordered_date,
       nvl(t2.order_type, t1.order_type) as order_type,
       current_date as w_insert_dt,
       created_on_dt,
       changed_on_dt,
       aux1_changed_on_dt,
       w_update_dt,
       row_wid,
       version,
       date_from,
       date_to,
       nvl(t2.big_area_name, t1.big_area_name) as big_area_name,
       nvl(t2.bg_name, t1.bg_name) as bg_name,
       nvl(t2.area_name, t1.area_name) as area_name,
       nvl(t2.cites_name, t1.cites_name) as cites_name,
       nvl(t2.city_name, t1.city_name) as city_name,
       nvl(t2.area_five_code, t1.area_five_code) as area_five_code,
       nvl(t2.dealer_name, t1.dealer_name) as dealer_name,
       nvl(t2.dealer_code, t1.dealer_code) as dealer_code,
       nvl(t2.site_id, t1.site_id) as site_id,
       nvl(t2.request_date, t1.request_date) as request_date
  from bigdata_dw.dm_sl_sales_order_d t1
  left join bigdata_dw.dm_sl_sales_order_ds t2
    on t1.header_id = t2.header_id;
	
	
insert into table bigdata_dw.dm_sl_sales_order_d_tmp
select header_id,
       order_number,
       booked_date,
       booked_date as ordered_date,
       order_type,
       current_date as w_insert_dt,
       '' created_on_dt,
       '' changed_on_dt,
       '' aux1_changed_on_dt,
       '' w_update_dt,
       row_number() over(partition by t2.version order by t2.header_id) + aa as row_wid,
       1 version,
       '1900/1/1' as date_from,
       '2199/12/31' as date_to,
       big_area_name,
       bg_name,
       area_name,
       cites_name,
       city_name,
       area_five_code,
       dealer_name,
       dealer_code,
       site_id,
       request_date
  from (select t2.*, 1 as version from bigdata_dw.dm_sl_sales_order_ds t2) t2,
       (select max(row_wid) aa, 1 as version from bigdata_dw.dm_sl_sales_order_d) t3
 where not exists (select 1
          from bigdata_dw.dm_sl_sales_order_d t1
         where t1.header_id = t2.header_id)
   and t2.version = t3.version ;
   
   
insert overwrite table bigdata_dw.dm_sl_sales_order_d
select header_id,          
order_number     ,  
booked_date       , 
ordered_date       ,
order_type         ,
w_insert_dt        ,
created_on_dt      ,
changed_on_dt      ,
aux1_changed_on_dt ,
w_update_dt        ,
row_wid            ,
version            ,
date_from          ,
date_to            ,
big_area_name      ,
bg_name            ,
area_name          ,
cites_name         ,
city_name          ,
area_five_code     ,
dealer_name        ,
dealer_code        ,
site_id            ,
regexp_replace(request_date,'/','-')        
from bigdata_dw.dm_sl_sales_order_d_tmp;



