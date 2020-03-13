
--临时表数据写入正式表
insert overwrite table bigdata_ld.fact_sl_ld_zkt_inv_qcs partition
  (dt_wid)
  select *,substr(period_date,1,10) from bigdata_ld.fact_sl_ld_zkt_inv_qcs_tmp;



