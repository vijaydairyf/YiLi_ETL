
insert overwrite table bigdata_ld.FACT_CX_AWK_DEALER_FACTORY_SET
select
row_id                  ,
dealer_id               ,
dealer_name             ,
dealer_num              ,
cp_factory_id           ,
rp_factory_id           ,
create_dt               ,
creator_id              ,
lastupdate_dt           ,
lastupdator_id          ,
cp_factory_name         ,
rp_factory_name         ,
'null'  ,
'null'
from
data_lake.d_nct_cx_awk_dealer_factory_set       ;



