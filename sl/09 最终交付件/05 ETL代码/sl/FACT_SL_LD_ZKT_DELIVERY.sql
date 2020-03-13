

drop table bigdata_ld.fact_sl_ld_zkt_delivery_tmp1;

create table bigdata_ld.fact_sl_ld_zkt_delivery_tmp1 as 
select * from  bigdata_ld.fact_sl_ld_zkt_delivery 
where substr(last_update_date,1,10)< date_sub(current_date,31) ;


   insert overwrite table bigdata_ld.fact_sl_ld_zkt_delivery 
   select * from bigdata_ld.fact_sl_ld_zkt_delivery_tmp1;
   
   insert into table bigdata_ld.fact_sl_ld_zkt_delivery
   select * from bigdata_ld.fact_sl_ld_zkt_delivery_tmp;
