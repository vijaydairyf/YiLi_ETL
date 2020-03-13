-------------------------------------------------------------------------------
-- (c) copyright capgemini
-- file name:               EC_CREATE_TABLE.sql
-- source table:            
-- target table:            
-- project:
-- note:
-- purpose:                 电商建表语句
--=============================================================================
-- creation date:       2019-3-7
-- origin author:       capgemini
--no
-- version: %1.0%
--
-- modification history
-- --------------------
-- date         byperson        description
-- ----------   --------------  -----------------------------------------------
-- 2019-3-7  capgemini       
-------------------------------------------------------------------------------
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=10000;
insert overwrite table bigdata_dw.w_ec_product_d_tmp partition(dual_)
select
trim(attr2) as row_wid,
trim(seq_num) as seq_num,
trim(categ_name) as categ_name,
nvl(if(trim(import_no)='',null,trim(import_no)),'-1') as sku_id,
nvl(if(trim(pro_no)='',null,trim(pro_no)),'-1') as erp_id,
trim(pro_name)  as erp_name,
trim(pro_specfc) as erp_unit,
trim(import_full)  as platform_name,
trim(import_specfc) as platform_unit,
nvl(if(trim(pro_name_complt)='',null,trim(pro_name_complt)),'-1') as final_name,
'-1' as pro_categ_cd,
if(trim(pro_categ)='',null,trim(pro_categ)) as pro_categ_name,
'-1' as pro_brand_cd,
if(trim(pro_brand_name)='',null,trim(pro_brand_name)) as pro_brand_name,
if(trim(pro_grade)='',null,trim(pro_grade)) as pro_grade,
'1' as proc_coef,
'0' as if_comb_flag,
row_number() over (partition by trim(import_no) order by trim(attr2)) as skuid_seq,
'-1' as attr1,
'-1' as attr2,
'-1' as attr3,
'-1' as attr4,
'-1' as attr5,
'-1' as attr6,
'-1' as attr7,
'-1' as attr8,
'-1' as attr9,
'-1' as attr10,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss') as w_insert_dt,
1 as dual_
from datalake_md.d_dm_ec_pro

union all

select
t.row_wid,
t.seq_num,
t.categ_name,
t.sku_id,
t.erp_id,
t.erp_name                        ,
t.erp_unit,
t.platform_name,
t.platform_unit,
t.final_name,
t.pro_categ_cd,
t.pro_categ_name,
t.pro_brand_cd,
t.pro_brand_name,
t.pro_grade,
t.proc_coef,
t.if_comb_flag,
t.skuid_seq,
t.attr1,
t.attr2,
t.attr3,
t.attr4,
t.attr5,
t.attr6,
t.attr7,
t.attr8,
t.attr9,
t.attr10,
t.w_insert_dt,
t.dual_
from
(select
'-1' as row_wid,
'-1' as seq_num,
'-1' as categ_name,
'-1'  as sku_id,
'-1'  as erp_id,
'-1'  as erp_name                        ,
'-1' as erp_unit,
'-1'  as platform_name,
'-1' as platform_unit,
'-1'  as final_name,
'-1' as pro_categ_cd,
'-1'  as pro_categ_name,
'-1' as pro_brand_cd,
'-1' as pro_brand_name,
'-1' as pro_grade,
'1' as proc_coef,
'0' as if_comb_flag,
1 as skuid_seq,
'-1' as attr1,
'-1' as attr2,
'-1' as attr3,
'-1' as attr4,
'-1' as attr5,
'-1' as attr6,
'-1' as attr7,
'-1' as attr8,
'-1' as attr9,
'-1' as attr10,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss') as w_insert_dt,
0 as dual_
from datalake_md.d_dm_ec_pro limit 1) t;

insert overwrite table bigdata_dw.w_ec_product_d partition(dual_)
select 
sku_id,
seq_num,
categ_name,
sku_id,
erp_id,
erp_name,
erp_unit,
platform_name,
platform_unit,
nvl(final_name,'-1') as final_name,
pro_categ_cd,
nvl(pro_categ_name,'-1') as pro_categ_name,
pro_brand_cd,
nvl(pro_brand_name,'-1') as pro_brand_name,
nvl(pro_grade,'-1') as pro_grade,
proc_coef,
if_comb_flag,
skuid_seq,
attr1,
attr2,
attr3,
attr4,
attr5,
attr6,
attr7,
attr8,
attr9,
attr10,
w_insert_dt,
dual_
from
bigdata_dw.w_ec_product_d_tmp
where skuid_seq = '1';


insert overwrite table bigdata_dw.w_ec_product_d1
select 
t1.row_wid as product_row_wid,
t.erp_id,
nvl(t.erp_name,'-1') as erp_name,
t.erp_unit,
nvl(t.pro_categ_name,'-1') as pro_categ_name,
nvl(t.pro_brand_name,'-1') as pro_brand_name,
nvl(t.pro_grade,'-1') as pro_grade,
t.w_insert_dt
from (
select
nvl(if(trim(pro_no)='',null,trim(pro_no)),'-1') as erp_id,
nvl(trim(pro_specfc),'-1') as erp_unit,
nvl(trim(pro_name_complt),'-1')  as erp_name,
nvl(if(trim(pro_categ)='',null,trim(pro_categ)),'-1') as pro_categ_name,
nvl(if(trim(pro_brand_name)='',null,trim(pro_brand_name)),'-1') as pro_brand_name,
nvl(if(trim(pro_grade)='',null,trim(pro_grade)),'-1') as pro_grade,
row_number() over (partition by nvl(if(trim(pro_no)='',null,trim(pro_no)),'-1') order by trim(attr2)) as skuid_seq,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss') as w_insert_dt
from datalake_md.d_dm_ec_pro) t
left join bigdata_dw.w_product_d t1
on t.erp_id = t1.product_code
where t.skuid_seq=1

union all

select 
t2.row_wid as product_row_wid,
t2.product_code as erp_id,
t2.prod_int_name as erp_name,
t2.product_unit_primary_name as erp_unit,
--nvl(t2.item_category_one,'-1') as pro_categ_name,
'其他' as pro_categ_name,
nvl(t2.product_child_brand,'-1') as pro_brand_name,
nvl(t2.product_grade,'-1') as pro_grade,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss')  as w_insert_dt
from bigdata_dw.w_product_d t2
left join (select erp_id from (
select
nvl(if(trim(pro_no)='',null,trim(pro_no)),'-1') as erp_id,
row_number() over (partition by nvl(if(trim(pro_no)='',null,trim(pro_no)),'-1') order by trim(attr2)) as skuid_seq
from datalake_md.d_dm_ec_pro) t
left join bigdata_dw.w_product_d t1
on t.erp_id = t1.product_code
where t.skuid_seq=1) t3
on t2.product_code=t3.erp_id
where t3.erp_id is null;


insert overwrite table bigdata_dw.w_ec_area_d_tmp
select
distinct level1 as bg_name,
level2 as platform_name,
level3 as sale_area_name,
level4 as final_name,
attr1 as org_name,
flag as platform_type,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss')  as w_insert_dt
from datalake_md.d_dm_ec_store;


insert overwrite table bigdata_dw.w_ec_area_d
select distinct bg_name,
platform_name,
final_name,
org_name,
platform_type,
from_unixtime(unix_timestamp(),'yyyy-MM-dd HH:mm:ss')  as w_insert_dt
from bigdata_dw.w_ec_area_d_tmp;