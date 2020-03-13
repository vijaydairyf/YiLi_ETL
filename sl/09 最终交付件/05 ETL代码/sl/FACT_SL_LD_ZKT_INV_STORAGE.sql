
--临时表数据写入正式表
insert overwrite table bigdata_ld.fact_sl_ld_zkt_inv_storage partition
  (dt_wid)
  select *,substr(CREATEDATE,1,10) from bigdata_ld.fact_sl_ld_zkt_inv_storage_tmp;
