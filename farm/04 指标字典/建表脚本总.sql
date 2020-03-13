
----
--牛群分析建表语句
--
----
--- DW 层表

CREATE TABLE BIGDATA_DW.W_COW_HERD_INFO(

  total_cows decimal(38,10)  comment '总存栏牛头数', 
  adult_cows decimal(38,10)  comment '成母牛头数', 

  dry_cows decimal(38,10)  comment '干奶牛头数',
  locating_cows decimal(38,10)  comment '泌乳牛头数',
  milk_cows decimal(38,10) comment '上厅挤奶牛头数',
  perinatal_cows decimal(38,10)  comment '围产牛头数',
  gl_cows decimal(38,10)  comment '隔离牛数量',
  new_born_unresist decimal(38,10)  comment '隔离牛新产未过抗数量',
  medcine_cows decimal(38,10)  comment '隔离牛用药牛数量',
  quar_other_cows decimal(38,10)  comment '隔离牛其他数量', 
  reserve_cows decimal(38,10)  comment '后备牛头数',
  lactation_calf decimal(38,10)  comment '哺乳犊牛',
  weaning_calf decimal(38,10)  comment '断奶犊牛',
  bred_cows decimal(38,10)  comment '育成牛',
  youth_cows decimal(38,10)  comment '青年牛',
  new_cows decimal(38,10)  comment '新购牛头数',
  new_adult_cows decimal(38,10)  comment '新购成母牛头数',
  new_reserve_cows decimal(38,10)  comment '新购后备牛头数',
    new_lactation_calf decimal(38,10)  comment '新购哺乳犊牛',
  new_weaning_calf decimal(38,10)  comment '新购断奶犊牛',
  new_bred_cows decimal(38,10)  comment '新购育成牛',
  new_youth_cows decimal(38,10)  comment '新购青年牛',

   amount_1Lac decimal(38,10)  comment '一胎牛头数',
  amount_2Lac decimal(38,10)  comment '二胎牛头数',
  amount_3Lac decimal(38,10)  comment '三胎牛头数',
  amount_4Lac decimal(38,10)  comment '四胎牛头数',
  amount_5Lac decimal(38,10)  comment '五胎牛头数',
  fixed_start_date string comment '固定站开始时间',
  fixed_end_date string comment '固定站结束时间',
  report_date string comment '报告时间',
   farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  
  --- 成母牛分析  DM 层表
  
  CREATE TABLE BIGDATA_DM.PJ_COW_HERD_INFO(
  total_cows decimal(38,10)  comment '总存栏牛头数', 
  adult_cows decimal(38,10)  comment '成母牛头数', 
  dry_cows decimal(38,10)  comment '干奶牛头数',
  locating_cows decimal(38,10)  comment '泌乳牛头数',
   milk_cows decimal(38,10) comment '上厅挤奶牛头数',
  perinatal_cows decimal(38,10)  comment '围产牛头数',
  gl_cows decimal(38,10)  comment '隔离牛数量',
  new_born_unresist decimal(38,10)  comment '隔离牛新产未过抗数量',
  medcine_cows decimal(38,10)  comment '隔离牛用药牛数量',
  quar_other_cows decimal(38,10)  comment '隔离牛其他数量',
  reserve_cows decimal(38,10)  comment '后备牛头数',
  lactation_calf decimal(38,10)  comment '哺乳犊牛',
  weaning_calf decimal(38,10)  comment '断奶犊牛',
  bred_cows decimal(38,10)  comment '育成牛',
  youth_cows decimal(38,10)  comment '青年牛',
  new_cows decimal(38,10)  comment '新购牛头数',
  new_adult_cows decimal(38,10)  comment '新购成母牛头数',     
  new_reserve_cows decimal(38,10)  comment '新购后备牛头数',
  new_lactation_calf decimal(38,10)  comment '新购哺乳犊牛',
  new_weaning_calf decimal(38,10)  comment '新购断奶犊牛',
  new_bred_cows decimal(38,10)  comment '新购育成牛',
  new_youth_cows decimal(38,10)  comment '新购青年牛',
   amount_1Lac decimal(38,10)  comment '一胎牛头数',
  amount_2Lac decimal(38,10)  comment '二胎牛头数',
  amount_3Lac decimal(38,10)  comment '三胎牛头数',
  amount_4Lac decimal(38,10)  comment '四胎牛头数',
  amount_5Lac decimal(38,10)  comment '五胎牛头数',
  total_cows_period decimal(38,10)  comment '同期总存栏牛头数', 
  adult_cows_period decimal(38,10)  comment '同期成母牛头数',
  dry_cows_period decimal(38,10)  comment '同期干奶牛头数',
  perinatal_cows_period decimal(38,10)  comment '同期围产牛头数',
  gl_cows_period decimal(38,10)  comment '同期隔离牛头数',    
  reserve_cows_period decimal(38,10)  comment '同期后备牛头数',
  lactation_calf_period decimal(38,10)  comment '同期哺乳犊牛',
  weaning_calf_period decimal(38,10)  comment '同期断奶犊牛',
  bred_cows_period decimal(38,10)  comment '同期育成牛',
  youth_cows_period decimal(38,10)  comment '同期青年牛',
  amount_1Lac_period decimal(38,10)  comment '同期一胎牛头数',
  amount_2Lac_period decimal(38,10)  comment '同期二胎牛头数',
  amount_3Lac_period decimal(38,10)  comment '同期三胎牛头数',
  amount_4Lac_period decimal(38,10)  comment '同期四胎牛头数',
  amount_5Lac_period decimal(38,10)  comment '同期五胎牛头数',
  fixed_start_date decimal(38,10)  comment '固定站开始时间',
  fixed_end_date decimal(38,10)  comment '固定站结束时间',
  report_date bigint  comment '报告时间',
  estrus_period string comment '情期时间',
  report_month bigint  comment '报告月份',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
  
  
  
  --- 成母牛分析 月报 DM 层表
  
  CREATE TABLE BIGDATA_DM.PJ_COW_HERD_MONTH_INFO(
  total_cows decimal(38,10)  comment '总存栏牛头数', 
  adult_cows decimal(38,10)  comment '成母牛头数', 
  dry_cows decimal(38,10)  comment '干奶牛头数',
  locating_cows decimal(38,10)  comment '泌乳牛头数',
   milk_cows decimal(38,10) comment '上厅挤奶牛头数',
  perinatal_cows decimal(38,10)  comment '围产牛头数',
  gl_cows decimal(38,10)  comment '隔离牛数量',
  new_born_unresist decimal(38,10)  comment '隔离牛新产未过抗数量',
  medcine_cows decimal(38,10)  comment '隔离牛用药牛数量',
  quar_other_cows decimal(38,10)  comment '隔离牛其他数量',
  reserve_cows decimal(38,10)  comment '后备牛头数',
  lactation_calf decimal(38,10)  comment '哺乳犊牛',
  weaning_calf decimal(38,10)  comment '断奶犊牛',
  bred_cows decimal(38,10)  comment '育成牛',
  youth_cows decimal(38,10)  comment '青年牛',
  new_cows decimal(38,10)  comment '新购牛头数',
  new_adult_cows decimal(38,10)  comment '新购成母牛头数',     
  new_reserve_cows decimal(38,10)  comment '新购后备牛头数',
  new_lactation_calf decimal(38,10)  comment '新购哺乳犊牛',
  new_weaning_calf decimal(38,10)  comment '新购断奶犊牛',
  new_bred_cows decimal(38,10)  comment '新购育成牛',
  new_youth_cows decimal(38,10)  comment '新购青年牛',
   amount_1Lac decimal(38,10)  comment '一胎牛头数',
  amount_2Lac decimal(38,10)  comment '二胎牛头数',
  amount_3Lac decimal(38,10)  comment '三胎牛头数',
  amount_4Lac decimal(38,10)  comment '四胎牛头数',
  amount_5Lac decimal(38,10)  comment '五胎牛头数',

  total_cows_period decimal(38,10)  comment '同期总存栏牛头数', 
  adult_cows_period decimal(38,10)  comment '同期成母牛头数',
  dry_cows_period decimal(38,10)  comment '同期干奶牛头数',
  perinatal_cows_period decimal(38,10)  comment '同期围产牛头数',
  gl_cows_period decimal(38,10)  comment '同期隔离牛头数',    
  reserve_cows_period decimal(38,10)  comment '同期后备牛头数',
  lactation_calf_period decimal(38,10)  comment '同期哺乳犊牛',
  weaning_calf_period decimal(38,10)  comment '同期断奶犊牛',
  bred_cows_period decimal(38,10)  comment '同期育成牛',
  youth_cows_period decimal(38,10)  comment '同期青年牛',
  amount_1Lac_period decimal(38,10)  comment '同期一胎牛头数',
  amount_2Lac_period decimal(38,10)  comment '同期二胎牛头数',
  amount_3Lac_period decimal(38,10)  comment '同期三胎牛头数',
  amount_4Lac_period decimal(38,10)  comment '同期四胎牛头数',
  amount_5Lac_period decimal(38,10)  comment '同期五胎牛头数',
  fixed_start_date decimal(38,10)  comment '固定站开始时间',
  fixed_end_date decimal(38,10)  comment '固定站结束时间',
  report_date bigint  comment '报告时间',
  estrus_period bigint  comment '情期时间',
  report_month bigint  comment '报告月份',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;

  
  ---- 后备牛 柱状图 日月报表
  
  
CREATE TABLE BIGDATA_DM.PJ_RESERVE_COWS_INFO (
  cow_count decimal(38,10)  comment '牛头数', 
  reserve_cows decimal(38,10)  comment '后备牛头数', 
  grow_stat string  comment '牛只类别', 
  report_date bigint comment '报告日期',
  report_month bigint comment '报告月份',
  data_type bigint comment '数据类型(1 日报 2 月报)',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;

  
  --- 隔离牛饼图表
  
  
CREATE TABLE BIGDATA_DM.PJ_COW_GL_TABLE(
  cows_count decimal(38,10)  comment '牛数量',
  cows_type string  comment '隔离牛类型',
  report_date bigint  comment '报告时间',
  report_month bigint  comment '报告月份',
  data_type bigint  comment '数据类型1日报2月报',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
  
  
  
  ---- 成母牛 禁配牛数据表
  
  CREATE TABLE BIGDATA_DM.PJ_COW_HERD_DAY_INFO(
  last_year_adult_cows decimal(38,10)  comment '成母牛头数', 
  last_year_adult_cows_period decimal(38,10)  comment '同期成母牛头数', 
  last_year_youth_cows decimal(38,10)  comment '青年牛头数', 
  last_year_youth_cows_period decimal(38,10)  comment '同期青年牛头数',
  last_year_cows decimal(38,10)  comment '牛头数', 
  last_year_cows_period decimal(38,10)  comment '同期牛头数',
  adult_forbid_cows decimal(38,10)  comment '禁配成母牛头数', 
  youth_forbid_cows decimal(38,10)  comment '禁配青年牛头数', 
  forbid_cows decimal(38,10)  comment '禁配牛数', 
  adult_forbid_cows_period decimal(38,10)  comment '同期禁配成母牛头数', 
  youth_forbid_cows_period decimal(38,10)  comment '同期禁配青年牛头数', 
  forbid_cows_period decimal(38,10)  comment '同期禁配牛数', 
  report_month bigint comment '报告月份',
  report_year bigint comment '报告年份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
  
  ---- 新购牛 DW
  CREATE TABLE BIGDATA_DW.W_BUY_COW_INFO(
  ear_no string comment '牛号',
  entry_type string comment '入群类型',
  entry_src string comment '入群来源',
  grow_stat  string comment '生长状态',
  new_cows decimal(38,10)  comment '新购牛头数',
  new_adult_cows decimal(38,10)  comment '新购成母牛头数',
  new_reserve_cows decimal(38,10)  comment '新购后备牛头数',
  report_date string comment '报告时间',
  report_month string comment '报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  --- 新购牛 DM
  
  CREATE TABLE BIGDATA_DM.PJ_BUY_COW_INFO(
  new_cows decimal(38,10)  comment '新购牛头数',
  new_adult_cows decimal(38,10)  comment '新购成母牛头数',
  new_reserve_cows decimal(38,10)  comment '新购后备牛头数',
  report_date bigint comment '报告时间',
  report_month bigint comment '报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  ---- 新购牛 饼图
  
  CREATE TABLE BIGDATA_DM.PJ_BUY_COW_TABLE(

  new_cows decimal(38,10)  comment '牛只个数',
   grow_stat  string comment '牛只类别',
  report_date bigint comment '报告时间',
  report_month bigint comment '报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  ----
  -- 繁殖分析模块建表
  --
  ----
  
  --- 繁殖率 DW 层建表
  
  
CREATE TABLE BIGDATA_DW.W_FEEDING_RATE_INFO(
cow_id string comment '牛只id',
ear_no string comment '牛耳号',
grow_stat string comment'牛只类别',
lactation_cnt string comment'牛只胎次',
breed_youth_cows decimal(38,10) comment '繁殖青年牛牛数',
breed_adult_cows decimal(38,10) comment '繁殖成母牛数',
breed_cows decimal(38,10) comment '繁殖牛数',
report_date string comment'报告时间',
report_month string comment'报告月份',
report_year string comment'报告年份',
farm_name  string comment '牛场'
,big_area_name string comment '大区'
,area_name string comment '区域I'
,cities_name  string comment '地区'
)

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC; 


 

 --- 繁殖率 DM 层建表
  
  
  CREATE TABLE BIGDATA_DM.PJ_FEEDING_RATE_INFO(
breed_youth_cows decimal(38,10)  comment '繁殖青年牛牛数',
breed_adult_cows decimal(38,10)  comment '繁殖成母牛数',
breed_cows decimal(38,10)  comment '繁殖牛数',
breed_youth_cows_period decimal(38,10) comment '同期繁殖青年牛牛数',
breed_adult_cows_period decimal(38,10) comment '同期繁殖成母牛数',
breed_cows_period decimal(38,10) comment '同期繁殖牛数',
report_month bigint  comment'报告时间 -月度数据',
report_year bigint  comment'报告年份',
farm_name string comment '牧场名',
big_area_name string comment '大区名',
area_name string comment '区域名',
cities_name string comment '城市名'
)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC; 
  
  
  
  ---- 繁殖分析 怀孕率 DW 层建表
  
  CREATE TABLE BIGDATA_DW.W_PREGNANT_RATE_INFO(
  to_pregnancy_cow_qty  decimal(38,10)   comment '应怀孕牛数', 
  actual_pregnancy_cow_qty  decimal(38,10)   comment '实际怀孕牛数', 
  to_estrus_young_cow_qty  decimal(38,10)   comment '应发情牛',
  actual_insem_cow_qty  decimal(38,10)   comment '实际参配牛',
  to_pregnancy_cow_qty_period  decimal(38,10)   comment '同期应怀孕牛数', 
  actual_pregnancy_cow_qty_period  decimal(38,10)   comment '同期实际怀孕牛数', 
  to_estrus_young_cow_qty_period  decimal(38,10)   comment '同期应发情牛',
  actual_insem_cow_qty_period  decimal(38,10)   comment '同期实际参配牛',
  estrus_period_start string comment '情期开始时间',
  estrus_period_end string comment '情期结束时间',
  estrus_period string comment '情期',
  year bigint comment '年份',
  rank_num bigint comment '情期数',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
    ---- 繁殖分析 怀孕率 DM 层建表

CREATE TABLE BIGDATA_DM.PJ_PREGNANT_RATE_INFO(

  to_pregnancy_cow_qty  decimal(38,10)   comment '应怀孕牛数', 
  actual_pregnancy_cow_qty  decimal(38,10)   comment '实际怀孕牛数', 
  to_estrus_young_cow_qty  decimal(38,10)   comment '应发情牛',
  actual_insem_cow_qty  decimal(38,10)   comment '实际参配牛',
  to_pregnancy_cow_period  decimal(38,10)   comment '同期应怀孕牛数', 
  actual_pregnancy_cow_period  decimal(38,10)   comment '同期实际怀孕牛数', 
  to_estrus_young_cow_period  decimal(38,10)   comment '同期应发情牛',
  actual_insem_cow_period  decimal(38,10)   comment '同期实际参配牛',
  estrus_period_start  bigint comment '情期开始时间',
  estrus_period_end  bigint    comment '情期结束时间',
  estrus_period string  comment '情期',
  year bigint comment '年份',
  rank_num bigint comment '情期数',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  ---- 繁殖分析 早产流产  DW 表
  
  CREATE TABLE BIGDATA_DW.W_FETATION_ABORT_INFO(
cow_id string comment '牛只id',
ear_no string comment '牛耳号',
pregant_days bigint comment'怀孕天数',
lactation_cnt bigint comment'胎次',
grow_stat bigint comment'牛只类别',
calving_type string comment'产犊类型',
calving_cows decimal(38,10) comment '产犊母牛牛数',
premature_cows decimal(38,10) comment '早产牛数',
aborted_cows decimal(38,10) comment '流产牛数',
parity0_premature_cows decimal(38,10) comment '青年牛早产牛数',
parity0_aborted_cows decimal(38,10) comment '青年牛流产牛数',
parity1_premature_cows decimal(38,10) comment '一胎早产牛数',
parity1_aborted_cows decimal(38,10) comment '一胎流产牛数',
parity2_premature_cows decimal(38,10) comment '二胎早产牛数',
parity2_aborted_cows decimal(38,10) comment '二胎流产牛数',
parity3_premature_cows decimal(38,10) comment '三胎早产牛数',
parity3_aborted_cows decimal(38,10) comment '三胎流产牛数',
parity4_premature_cows decimal(38,10) comment '四胎早产牛数',
parity4_aborted_cows decimal(38,10) comment '四胎流产牛数',
parity5_premature_cows decimal(38,10) comment '五胎早产牛数',
parity5_aborted_cows decimal(38,10) comment '五胎流产牛数',
parity0_calving_cows decimal(38,10) comment '青年牛产犊母牛数',
parity1_calving_cows decimal(38,10) comment '一胎产犊母牛数',
parity2_calving_cows decimal(38,10) comment '二胎产犊母牛数',
parity3_calving_cows decimal(38,10) comment '三胎产犊母牛数',
parity4_calving_cows decimal(38,10) comment '四胎产犊母牛数',
parity5_calving_cows decimal(38,10) comment '五胎产犊母牛数',
days210_premature_cows decimal(38,10) comment '210-219天早产牛数',
days220_premature_cows decimal(38,10) comment '220-229天早产牛数',
days230_premature_cows decimal(38,10) comment '230-239天早产牛数',
days240_premature_cows decimal(38,10) comment '240-249天早产牛数',
days250_premature_cows decimal(38,10) comment '250-262天早产牛数',
days43_aborted_cows decimal(38,10) comment '43-62天流产牛数',
days63_aborted_cows decimal(38,10) comment '63-82天流产牛数',
days83_aborted_cows decimal(38,10) comment '83-102天流产牛数',
days103_aborted_cows decimal(38,10) comment '103-122天流产牛数',
days123_aborted_cows decimal(38,10) comment '123-142天流产牛数',
days143_aborted_cows decimal(38,10) comment '143-162天流产牛数',
days163_aborted_cows decimal(38,10) comment '163-182天流产牛数',
days183_aborted_cows decimal(38,10) comment '183-201天流产牛数',
report_date string comment'报告时间',
report_month string comment'报告月份',

  farm_code string comment '牛场编号'

)

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC; 
  
  
  
    
  ---- 繁殖分析 早产流产  DM 表
  
  CREATE TABLE BIGDATA_DM.PJ_FETATION_ABORT_INFO(
calving_cows decimal(38,10) comment '产犊母牛数',
premature_cows decimal(38,10) comment '早产牛数',
aborted_cows decimal(38,10) comment '流产牛数',
fetation_cows decimal(38,10) comment '怀孕牛数--流产率',
calving_cows_period decimal(38,10) comment '同期产犊怀孕牛数--早产率',
premature_cows_period decimal(38,10) comment '同期早产牛数',
aborted_cows_period decimal(38,10) comment '同期流产牛数',
fetation_cows_period decimal(38,10) comment '同期怀孕牛数--流产率',
fetation_cows_mon decimal(38,10) comment '怀孕牛数月度数据--流产率',
fetation_cows_mon_period decimal(38,10) comment '同期怀孕牛数月度数据--流产率',
parity0_premature_cows decimal(38,10) comment '青年牛早产牛数',
parity0_aborted_cows decimal(38,10) comment '青年牛流产牛数',      
parity1_premature_cows decimal(38,10) comment '一胎早产牛数',
parity1_aborted_cows decimal(38,10) comment '一胎流产牛数',      
parity2_premature_cows decimal(38,10) comment '二胎早产牛数',
parity2_aborted_cows decimal(38,10) comment '二胎流产牛数',      
parity3_premature_cows decimal(38,10) comment '三胎早产牛数',
parity3_aborted_cows decimal(38,10) comment '三胎流产牛数',      
parity4_premature_cows decimal(38,10) comment '四胎早产牛数',
parity4_aborted_cows decimal(38,10) comment '四胎流产牛数',      
parity5_premature_cows decimal(38,10) comment '五胎早产牛数',
parity5_aborted_cows decimal(38,10) comment '五胎流产牛数',      
parity0_calving_cows decimal(38,10) comment '青年牛产犊母牛数',
parity1_calving_cows decimal(38,10) comment '一胎产犊母牛数',
parity2_calving_cows decimal(38,10) comment '二胎产犊母牛数',
parity3_calving_cows decimal(38,10) comment '三胎产犊母牛数',
parity4_calving_cows decimal(38,10) comment '四胎产犊母牛数',
parity5_calving_cows decimal(38,10) comment '五胎产犊母牛数',      
parity0_fetation_cows decimal(38,10) comment '青年怀孕母牛数',
parity1_fetation_cows decimal(38,10) comment '一胎怀孕母牛数',
parity2_fetation_cows decimal(38,10) comment '二胎怀孕母牛数',
parity3_fetation_cows decimal(38,10) comment '三胎怀孕母牛数',
parity4_fetation_cows decimal(38,10) comment '四胎怀孕母牛数',
parity5_fetation_cows decimal(38,10) comment '五胎怀孕母牛数',
days210_premature_cows decimal(38,10) comment '210-219天早产牛数', 
days220_premature_cows decimal(38,10) comment '220-229天早产牛数',    
days230_premature_cows decimal(38,10) comment '230-239天早产牛数',    
days240_premature_cows decimal(38,10) comment '240-249天早产牛数',    
days250_premature_cows decimal(38,10) comment '250-262天早产牛数',
days43_aborted_cows decimal(38,10) comment '43-62天流产牛数',    
days63_aborted_cows decimal(38,10) comment '63-82天流产牛数',    
days83_aborted_cows decimal(38,10) comment '83-102天流产牛数',
days103_aborted_cows decimal(38,10) comment '103-122天流产牛数',    
days123_aborted_cows decimal(38,10) comment '123-142天流产牛数',    
days143_aborted_cows decimal(38,10) comment '143-162天流产牛数',    
days163_aborted_cows decimal(38,10) comment '163-182天流产牛数',    
days183_aborted_cows decimal(38,10) comment '183-201天流产牛数',
report_date bigint comment'报告时间',
report_month bigint comment'报告月份',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
)

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
  
  
  --- 早产 流产 柱状图 表
  
  CREATE TABLE BIGDATA_DM.PJ_FETATION_ABORT_TABLE(
calving_cows decimal(38,10) comment '产犊母牛数--早产率',
premature_cows decimal(38,10) comment '早产牛数',
aborted_cows decimal(38,10) comment '流产牛数',
fetation_cows decimal(38,10) comment '怀孕牛数--流产率',
fetation_cows_mon decimal(38,10) comment '怀孕牛数--流产率',
lactation_type String  comment '胎次类型',
labort_days_type String comment '流产天数类型',
prema_days_type String comment '早产天数类型',
data_type String comment '数据类型',
lactation_rank  int comment '胎次排序',
labort_rank  int comment '流产排序',
prema_rank  int comment '早产排序',
report_date bigint comment'报告时间',
report_month bigint comment'报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
)

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;

  
  --- 繁殖分析  预计产犊干奶 DW 表
  
  CREATE TABLE BIGDATA_DW.W_PREDICT_CALVE_DRYMILK_INFO(

  cow_id string comment '奶牛ID',
  grow_stat  string comment '生长状态',
  pre_wean_milk_dt string comment '预计干奶时间',
  pre_calving_dt string comment '预计产犊时间',
  pre_3mon_calve_cows decimal(38,10)  comment '未来三个月预计产犊牛数',
  pre_3mon_dry_cows decimal(38,10)  comment '未来三个月预计干奶牛数',
  next_1mon_calve_cows decimal(38,10)  comment '下月预计产犊牛数',
  next_1mon_dry_cows   decimal(38,10)  comment '下月预计干奶牛数',
  next_2mon_calve_cows  decimal(38,10)  comment '第二月预计产犊牛数',
  next_2mon_dry_cows    decimal(38,10)  comment '第二月预计干奶牛数',
  next_3mon_calve_cows  decimal(38,10)  comment '第三个月预计产犊牛数',
  next_3mon_dry_cows    decimal(38,10)  comment '第三个月预计干奶牛数',
  report_date string comment '报告时间',
  report_month string comment '报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )
 
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  --- 繁殖分析  预计产犊干奶 DM 表
    
CREATE TABLE BIGDATA_DM.PJ_PREDICT_CALVE_DRYMILK_INFO(
  pre_3mon_calve_cows decimal(38,10)  comment '未来三个月预计产犊牛数',
  pre_3mon_dry_cows decimal(38,10)  comment '未来三个月预计干奶牛数',
  next_1mon_calve_cows decimal(38,10)  comment '下月预计产犊牛数',
  next_1mon_dry_cows   decimal(38,10)  comment '下月预计干奶牛数',
  next_2mon_calve_cows  decimal(38,10)  comment '第二月预计产犊牛数',
  next_2mon_dry_cows    decimal      (38,10)  comment '第二月预计干奶牛数',
  next_3mon_calve_cows  decimal(38,10)  comment '第三个月预计产犊牛数',
  next_3mon_dry_cows    decimal(38,10)  comment '第三个月预计干奶牛数',
  report_month bigint comment '报告月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
    --- 繁殖分析  其他指标 DW 表

CREATE TABLE BIGDATA_DW.W_COW_BREEDING_INDEX_INFO(
cows bigint comment '牛数',
cows_period bigint comment '同期牛数',
index_days bigint comment '天数',
index_days_period bigint comment '同期天数',
data_type string comment '数据类型：产犊间隔，配准天数，首配天数，怀孕天数，空怀天数',
report_date string comment '产犊日期/确认怀孕日期/配种日期/确认怀孕日期/数据日期',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  --- 繁殖分析  其他指标 DM 表

CREATE TABLE BIGDATA_DM.PJ_COW_BREEDING_INDEX_INFO(
 hybrid_cow_count decimal(38,10) comment '配准牛只数量',
 first_cow_count decimal(38,10) comment '首配牛只数量',
 no_fetation_cow_count decimal(38,10) comment '空怀牛只数量',
 calving_cow_count decimal(38,10) comment '产犊牛只数量',
 fetation_cow_count decimal(38,10) comment '怀孕牛只数量',
 hybrid_cow_count_period decimal(38,10) comment '同期配准牛只数量',
 first_cow_count_period decimal(38,10) comment '同期首配牛只数量',
 no_fetation_cow_count_period decimal(38,10) comment '同期空怀牛只数量',
 calving_cow_count_period decimal(38,10) comment '同期产犊牛只数量',
 fetation_cow_count_period decimal(38,10) comment '同期怀孕牛只数量',
 hybrid_days  decimal(38,10) comment '配准天数',
 hybrid_days_period decimal(38,10) comment '同期配准天数',
 first_hybrid_days decimal(38,10) comment '首配天数',
 first_hybrid_days_period decimal(38,10) comment '同期首配天数',
 no_fetation_days decimal(38,10) comment '空怀天数',
 no_fetation_days_period decimal(38,10) comment '同期空怀天数',
 calving_days decimal(38,10) comment '产犊间隔',
 calving_days_period decimal(38,10) comment '同期产犊间隔',
 fetation_days decimal(38,10) comment '怀孕天数',
 fetation_days_period decimal(38,10) comment '同期怀孕天数',
 report_date  bigint comment '数据日期',
 report_month  bigint comment '数据月份',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  ----
  -- 保健分析 发病淘汰
  --
  ----
  
  -- 保健分析 发病淘汰 DW
  
  CREATE TABLE BIGDATA_DW.W_COW_DISEASE_WEEDOUT_INFO(
cow_id string comment '牛号',
ear_no string comment '耳号',
month_age  string comment '月龄',
milk_day string comment '泌乳天数',
growth_stat string comment '牛只类别',
disease_type string comment '疾病种类',
disease_name  string comment '疾病名称',
sick_cows decimal(38,10) comment '发病牛数',
breath_sys_sick_cows  decimal(38,10) comment '呼吸系统疾病发病牛数',
disgestive_sys_sick_cows  decimal(38,10) comment '消化系统疾病发病牛数',
mammitits_sick_cows  decimal(38,10) comment '乳房炎发病牛数',
limb_hoof_sick_cows  decimal(38,10) comment '肢蹄病发病牛数',
breed_sys_sick_cows  decimal(38,10) comment '繁殖系统疾病发病牛数',
other_sick_cows  decimal(38,10) comment '其他疾病发病牛数',
death_cows  decimal(38,10) comment '死亡牛数',
sick_weedout_cows  decimal(38,10) comment '疾病淘汰牛数',
breath_sys_weedout_cows  decimal(38,10) comment '呼吸系统疾病淘汰牛数',
disge_sys_weedout_cows  decimal(38,10) comment '消化系统疾病淘汰牛数',
mammit_weedout_cows  decimal(38,10) comment '乳房炎淘汰牛数',
limb_hoof_weedout_cows  decimal(38,10) comment '肢蹄病淘汰牛数',
breed_sys_weedout_cows  decimal(38,10) comment '繁殖系统疾病淘汰牛数',
other_sick_weedout_cows  decimal(38,10) comment '其他疾病淘汰牛数',
weedout_cows  decimal(38,10) comment '淘汰牛数',
exit_categ  string comment '离群类别',
exit_type  string comment '离群类型',
exit_reason  string comment '离群原因',
data_type string comment '数据类型：1发病牛数据2淘汰牛数据',
report_date string comment '发病日期/离群日期/报告时间',
report_month string comment '发病月份/离群月份/报告月份',
active_weedout_cows  decimal(38,10) comment '主动淘汰牛数',
change_farm_cows  decimal(38,10) comment '转场牛数',
sale_cows  decimal(38,10) comment '外卖牛数',
possive_weedout_cows  decimal(38,10) comment '被动淘汰牛数',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  ----  发病淘汰 DM  
  
  CREATE TABLE BIGDATA_DM.PJ_COW_DISEASE_WEEDOUT_INFO(

sick_cows decimal(38,10) comment '发病牛数',
breath_sys_sick_cows   decimal(38,10) comment '呼吸系统疾病发病牛数',
disgestive_sys_sick_cows   decimal(38,10) comment '消化系统疾病发病牛数',
mammitits_sick_cows   decimal(38,10) comment '乳房炎发病牛数',
limb_hoof_sick_cows   decimal(38,10) comment '肢蹄病发病牛数',
breed_sys_sick_cows   decimal(38,10) comment '繁殖系统疾病发病牛数',
other_sick_cows   decimal(38,10) comment '其他疾病发病牛数',
death_cows   decimal(38,10) comment '死淘牛数',
weedout_cows   decimal(38,10) comment '淘汰牛数',
sick_weedout_cows   decimal(38,10) comment '疾病淘汰牛数',
breath_sys_weedout_cows   decimal(38,10) comment '呼吸系统疾病淘汰牛数',
disge_sys_weedout_cows   decimal(38,10) comment '消化系统疾病淘汰牛数',
mammit_weedout_cows   decimal(38,10) comment '乳房炎淘汰牛数',
limb_hoof_weedout_cows   decimal(38,10) comment '肢蹄病淘汰牛数',
breed_sys_weedout_cows   decimal(38,10) comment '繁殖系统疾病淘汰牛数',
other_sick_weedout_cows   decimal(38,10) comment '其他疾病淘汰牛数',
active_weedout_cows   decimal(38,10) comment '主动淘汰牛数',
change_farm_cows   decimal(38,10) comment '转场牛数',
sale_cows   decimal(38,10) comment '外卖牛数',
possive_weedout_cows   decimal(38,10) comment '被动淘汰牛数',
sick_cows_period decimal(38,10) comment '同期发病牛数',
breath_sys_sick_cows_period   decimal(38,10) comment '同期呼吸系统疾病发病牛数',
disgestive_sys_sick_cows_period   decimal(38,10) comment '同期消化系统疾病发病牛数',
mammitits_sick_cows_period   decimal(38,10) comment '同期乳房炎发病牛数',
limb_hoof_sick_cows_period   decimal(38,10) comment '同期肢蹄病发病牛数',
breed_sys_sick_cows_period   decimal(38,10) comment '同期繁殖系统疾病发病牛数',
other_sick_cows_period   decimal(38,10) comment '同期其他疾病发病牛数',
death_cows_period   decimal(38,10) comment '同期死淘牛数',
sick_weedout_cows_period   decimal(38,10) comment '同期疾病淘汰牛数',
breath_sys_weedout_cows_period   decimal(38,10) comment '同期呼吸系统疾病淘汰牛数',
disge_sys_weedout_cows_period   decimal(38,10) comment '同期消化系统疾病淘汰牛数',
mammit_weedout_cows_period   decimal(38,10) comment '同期乳房炎淘汰牛数',
limb_hoof_weedout_cows_period   decimal(38,10) comment '同期肢蹄病淘汰牛数',
breed_sys_weedout_cows_period   decimal(38,10) comment '同期繁殖系统疾病淘汰牛数',
other_sick_weedout_cows_period   decimal(38,10) comment '同期其他疾病淘汰牛数',
weedout_cows_period   decimal(38,10) comment '同期淘汰牛数',
active_weedout_cows_period   decimal(38,10) comment '同期主动淘汰牛数',
change_farm_cows_period   decimal(38,10) comment '同期转场牛数',
sale_cows_period   decimal(38,10) comment '同期外卖牛数',
possive_weedout_cows_period   decimal(38,10) comment '同期被动淘汰牛数',
-- 筛选器 一类级别
cows_level1_code string comment '牛只一级类别',
cows_level2_code string comment '牛只二级类别',
disease_type string comment '疾病种类',
report_month  bigint  comment '发病日期/离群日期',
  farm_name string comment '牧场名',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  ---  发病淘汰 柱图
  CREATE TABLE BIGDATA_DM.PJ_COW_DISEASE_WEEDOUT_TABLE(
cow_num decimal(38,10) comment '牛数',
cow_num_period decimal(38,10) comment '同期牛数',
cows_level1_code  string comment '筛选器一级类别',
cows_level2_code  string comment '筛选器二级类别',
disease_type  string comment '疾病类型',
disease_name  string comment '疾病名称',
order_column  decimal(38,10) comment '排序字段',
data_type  bigint  comment '数据类别',
report_month  bigint  comment '发病日期/离群日期',
  farm_name string comment '牛场名称',
  big_area_name string comment '大区名',
  area_name string comment '区域名',
  cities_name string comment '城市名',
 exit_categ  string comment '离群类别',
exit_type  string comment '离群类型',
exit_reason  string comment '离群原因'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;

  
  
  ----  保健分析 兽药  DW 
  
CREATE TABLE BIGDATA_DW.W_VETERINARY_ANALYZE_INFO(
morbidity_count  bigint comment '发病记录数量',
drug_count  bigint comment '用药记录数量',
calving_count bigint comment '产犊记录数',
report_date string comment'数据时间-月度',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )                                         
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
  
  
  --保健分析 兽药  DM

CREATE TABLE BIGDATA_DM.PJ_VETERINARY_ANALYZE_INFO(

morbidity_count  bigint comment '发病记录数量',
drug_count  bigint comment '用药记录数量',
calving_count bigint comment '产犊记录数',
report_date bigint  comment'数据时间-月度',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )                                         
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;
    
 
 
 
 ---- 
 --
 --仪器分析 
 ----
 
 --  仪器 分析 挤奶机  DW
 
 CREATE TABLE BIGDATA_DW.W_FARM_MILKER_INFO(
id  string comment '数据id'
 ,cleaning_sys_flag string comment  '清洗系统控制单元'
 ,surge_dev_flag string comment  '浪涌装置'
 ,measure_method string comment  '计量方式'
--,auto_metering_sys string comment  '自动计量系统'
,auto_off_cup_flag string comment  '自动脱(收)杯'
,install_year string comment  '安装年份'
,install_month string comment  '安装月份'
,year_month string comment   '安装年月' 
,maintenance_agmt_flag string comment  '是否签署维保协议'
,maintenance_period string comment  '维保周期'
,oestrus_monitor_sys string comment  '发情监测系统'
,milking_spot_brand string comment  '挤奶点品牌'
,auto_type string comment  '自动化分类'
,auto_clean_type string comment  '自动化清洗分类'
,maintenance_type string comment  '维保 分类'
,install_years_type string comment '安装年份分类 '
,farm_name  string comment '牛场'
,big_area_name string comment '大区'
,area_name string comment '区域I'
,cities_name  string comment '地区'
 )                                         
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
 
 
  --  仪器 分析 挤奶机  DM
 
CREATE TABLE BIGDATA_DM.PJ_FARM_MILKER_INFO(
milker_count  decimal(38,10) comment   '挤奶机数量'  
,milker_count_total  decimal(38,10)  comment   '挤奶机总量'  
,year_month bigint comment   '安装年月' 
,milking_spot_brand string comment  '挤奶机品牌'
,auto_type string comment  '自动化分类'
,auto_clean_type string comment  '自动化清洗分类'
,maintenance_type string comment  '维保 分类'
,install_years_type string comment '安装年份分类'
,big_area_name string comment '大区'
,area_name string comment '区域I'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  -- 仪器 环保设施 DW
  
  CREATE TABLE BIGDATA_DW.W_FARM_GREEN_INFO(
env_assess_rpt_flag string comment    '环评报告标识'
, env_pro_facl_flag string comment    '有无环保设施标识'
,forbid_field_flag string comment    '是否有禁养区'
,limit_field_flag string comment    '是否有限养区'
,manure_deal_fac string comment    '环保粪污处理设施'
,manure_deal_method  string comment    '粪污处理方式'
,env_pro_fac_install_year string comment    '环保设施建设安装年份'
,env_pro_fac_install_month string comment    '环保设施建设安装月份'
,year_month string comment    '环保设施建设安装年月'
,eve_pro_farm string comment    '有环保设施牧场数'
,farm_pro_type  string comment    '牧场设备配备类型'
,farm_pro_fac_type  string comment    '环保设备设施配备类型'
,farm_pro_fac_year_type  string comment    '环保设备设施配备年限',
  farm_id string comment '牛场Id',
  farm_code string comment '牛场code',
farm_name  string comment '牛场名字',
  big_area_id string comment '大区ID',
  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_code string comment '区域编号',
  area_name string comment '区域名',
  cities_id string comment '城市群ID',
  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )                                         
 
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
    -- 仪器 环保设施 DM

  CREATE TABLE BIGDATA_DM.PJ_FARM_GREEN_INFO(
eve_pro_farm decimal(38,10)comment    '有环保设施牧场数'
,year_month bigint comment    '环保设施建设安装年月'
,farm_pro_type  string comment    '牧场类型'
,farm_pro_fac_type  string comment    '环保设备设施配备类型'
,farm_pro_fac_year_type  string comment    '环保设备设施配备年限',
  big_area_id string comment '大区ID',
  big_area_name string comment '大区名',
  area_id string comment '区域ID',
  area_name string comment '区域名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  -- 供应商牧场维度关联信息
  


CREATE TABLE BIGDATA_DM.PJ_FARM_AREA_INFO(

open_date bigint comment '开站时间'
,close_date bigint comment '关站时间'
,open_month bigint comment '开站月份'
,close_month bigint comment '关站月份'
,farm_id string comment '牧场id'
,farm_code string comment '牧场编号'
,farm_name string comment '牧场名'
,big_area_id  string comment '大区ID'
,big_area_code  string comment '大区编号'
,big_area_name string comment '大区'
,area_id  string comment '区域ID'
,area_code  string comment '区域编号'
,area_name string comment '区域名称'
,cities_id  string comment '地区ID'
,cities_code  string comment '地区编号'
,cities_name  string comment '地区名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;

  
  
----
--自己做的 情期维度表
--
----
--- DW 层表

CREATE TABLE BIGDATA_DW.W_ESTRUS_PERIOD_INFO(  
  year bigint comment '年',
  estrus_period_start string comment '情期开始',
  estrus_period_end string comment '情期结束',
  rank_num bigint comment '情期号'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
----
--挤奶机修改 
--
----
--- DW 层表
  
  drop table BIGDATA_DW.W_FARM_MILKER_INFO;
CREATE TABLE BIGDATA_DW.W_FARM_MILKER_INFO(
id  string comment '数据id'
 ,cleaning_sys_flag string comment  '清洗系统控制单元'
 ,surge_dev_flag string comment  '浪涌装置'
 ,measure_method string comment  '计量方式'
--,auto_metering_sys string comment  '自动计量系统'
,auto_off_cup_flag string comment  '自动脱(收)杯'
,install_year string comment  '安装年份'
,install_month string comment  '安装月份'
,year_month string comment   '安装年月' 
,maintenance_agmt_flag string comment  '是否签署维保协议'
,maintenance_period string comment  '维保周期'
,oestrus_monitor_sys string comment  '发情监测系统'
,milking_spot_brand string comment  '挤奶点品牌'
,auto_type string comment  '自动化分类'
,auto_clean_type string comment  '自动化清洗分类'
,maintenance_type string comment  '维保 分类'
,install_years_type string comment '安装年份分类 '
,open_date  string comment '开站时间'
,close_date  string comment '关站时间'
,farm_code  string comment '牛场编号'
,farm_name  string comment '牛场'
,big_area_name string comment '大区'
,area_name string comment '区域I'
,cities_name  string comment '地区'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
  
  
  
---- 仪器分析 数集 挤奶机 建表
--
----
  
  drop table BIGDATA_DM.PJ_FARM_MILKER_INFO;
CREATE TABLE BIGDATA_DM.PJ_FARM_MILKER_INFO(

year_month bigint comment   '安装年月' 
,milking_spot_brand string comment  '挤奶机品牌'
,auto_type string comment  '自动化分类'
,auto_clean_type string comment  '自动化清洗分类'
,maintenance_type string comment  '维保 分类'
,install_years_type string comment '安装年份分类'
,open_date  bigint comment '开站时间'
,close_date  bigint comment '关站时间'
,farm_code  string comment '牛场编号'
,farm_name  string comment '牛场'
,big_area_name string comment '大区'
,area_name string comment '区域I'
,cities_name  string comment '地区'

 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
  
 
 
 ---
 -- 供应商 数仓表信息
 --
 ----
 
 CREATE TABLE  BIGDATA_DW.W_FODDER_SUPPLIER_INFO (

   in_inv_amt  decimal(38,10) comment '入库金额',
   supplier_name  string comment '供应商名', 
   report_date  string comment '报告时间/入库日期',
   report_month  string comment '报告月份/入库月份',
   report_date_period  string comment '报告时间/入库日期',
   report_month_period  string comment '报告月份/入库月份',

   farm_code  string comment '牛场编号',
   farm_name  string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name  string comment '区域名',
   cities_name  string comment '城市名'
   
    )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' 
  stored as ORC;
  
  
  ----
  -- 供应商 数据集市柱状图 表
  --
  ----
  

CREATE TABLE  BIGDATA_DM.PJ_FODDER_SUPPLIER_TABLE (

    in_inv_amt  decimal(38,10) comment '入库金额',
   supplier_name  string comment '供应商名', 
   report_date  bigint comment '报告时间/入库日期',
   report_month  bigint comment '报告月份/入库月份',
   report_date_period  bigint comment '报告时间/入库日期',
   report_month_period  bigint  comment '报告月份/入库月份',
   farm_code  string comment '牛场名称',
   farm_name  string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name  string comment '区域名',
   cities_name  string comment '城市名'
   
    )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' 
  stored as ORC;
  
  
  
  ----
  -- 饲养分析数据仓库建表 
  --
  ----
  
  CREATE TABLE  BIGDATA_DW.W_FEED_ANALYSIS_INFO (

   fodder_cost  decimal(38,10) comment '饲料用量',
   fodder_lost  decimal(38,10) comment '饲料剩余量',
   actual_eat  decimal(38,10) comment '饲料采食量',
   group_price  decimal(38,10) comment '饲养成本',
   
   fodder_cost_period  decimal(38,10) comment '同期饲料用量',
   fodder_lost_period  decimal(38,10) comment '同期饲料剩余量',
   actual_eat_period  decimal(38,10) comment  '同期饲料采食量',
   group_price_period  decimal(38,10) comment '同期原料成本',
   total_milk  decimal(38,10)  comment '产奶量',
   total_milk_period  decimal(38,10)  comment '同期产奶量',  
   cows_count  decimal(38,10)  comment '牛头数', 
   cows_count_period  decimal(38,10)  comment '同期牛头数', 
   group_type  string comment '分群类型',

   dry_milk_price decimal(38,10) comment '干奶牛饲料成本',
   perin_cows_price   decimal(38,10) comment '围产牛饲料成本',
   milk_cows_price  decimal(38,10) comment '泌乳牛饲料成本',
   reserve_cows_price decimal(38,10) comment '后备牛饲料成本',
   calf_price decimal(38,10) comment '犊牛饲料成本',
   dry_milk_eat  decimal(38,10) comment '干奶牛采食量',
   perin_cows_eat  decimal(38,10)  comment '围产牛采食量',
   milk_cows_eat  decimal(38,10) comment '泌乳牛采食量',
   reserve_cows_eat  decimal(38,10) comment '后备牛采食量',
   calf_eat  decimal(38,10) comment '犊牛采食量',
   dry_milk_price_period decimal(38,10) comment '同期干奶牛饲料成本',
   perin_cows_price_period   decimal(38,10) comment '同期围产牛饲料成本',
   milk_cows_price_period  decimal(38,10) comment '同期泌乳牛饲料成本',
   reserve_cows_price_period decimal(38,10) comment '同期后备牛饲料成本',
   calf_price_period decimal(38,10) comment '同期犊牛饲料成本',
   dry_milk_eat_period  decimal(38,10) comment '同期干奶牛采食量',
   perin_cows_eat_period  decimal(38,10)  comment '同期围产牛采食量',
   milk_cows_eat_period  decimal(38,10) comment '同期泌乳牛采食量',
   reserve_cows_eat_period  decimal(38,10) comment '同期后备牛采食量',
   calf_eat_period  decimal(38,10) comment '同期犊牛采食量',
   

   atype_fodder_price  decimal(38,10) comment 'A类型饲料成本',
   btype_fodder_price  decimal(38,10) comment 'B类型饲料成本',
   ctype_fodder_price  decimal(38,10) comment 'C类型饲料成本',
   dtype_fodder_price  decimal(38,10) comment 'D类型饲料成本',
   
   atype_milk_prod  decimal(38,10) comment 'A类型奶产量',
   btype_milk_prod  decimal(38,10) comment 'B类型奶产量',
   ctype_milk_prod  decimal(38,10) comment 'C类型奶产量',
   dtype_milk_prod  decimal(38,10) comment 'D类型奶产量',
   
   atype_fodder_period  decimal(38,10) comment '同期A类型饲料成本',
   btype_fodder_period  decimal(38,10) comment '同期B类型饲料成本',
   ctype_fodder_period  decimal(38,10) comment '同期C类型饲料成本',
   dtype_fodder_period  decimal(38,10) comment '同期D类型饲料成本',
   
   atype_milk_period decimal(38,10) comment '同期A类型奶产量',
   btype_milk_period decimal(38,10) comment '同期B类型奶产量',
   ctype_milk_period decimal(38,10) comment '同期C类型奶产量',
   dtype_milk_period decimal(38,10) comment '同期D类型奶产量',
   
   
   
   dry_cows decimal(38,10)  comment '干奶牛头数',
   locating_cows decimal(38,10)  comment '泌乳牛头数',
   reserve_cows decimal(38,10)  comment '后备牛头数',
   calf decimal(38,10)  comment '犊牛数',
   dry_cows_period decimal(38,10)  comment '同期干奶牛头数',
   locating_cows_period decimal(38,10)  comment '泌乳牛头数',   
   reserve_cows_period decimal(38,10)  comment '同期后备牛',
   calf_period decimal(38,10)  comment '同期犊牛数',

   farm_type  string comment '模式等级（ABCD，大型）',
   report_date  string  comment '报告时间/搅拌时间',
   farm_code  string comment '牛场名称',
   farm_name  string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name  string comment '区域名',
   cities_name  string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' 
  stored as ORC;
  
  
  
  
  ----
  -- 饲养分析数据集市建表 
  --
  ----
  
  CREATE TABLE  BIGDATA_DM.PJ_FEED_ANALYSIS_INFO (

   fodder_cost  decimal(38,10) comment '饲料用量',
   fodder_lost  decimal(38,10) comment '饲料剩余量',
   actual_eat  decimal(38,10) comment '饲料采食量',
   group_price  decimal(38,10) comment '饲养成本',
   
   fodder_cost_period  decimal(38,10) comment '同期饲料用量',
   fodder_lost_period  decimal(38,10) comment '同期饲料剩余量',
   actual_eat_period  decimal(38,10) comment  '同期饲料采食量',
   group_price_period  decimal(38,10) comment '同期原料成本',
   total_milk  decimal(38,10)  comment '产奶量',
   total_milk_period  decimal(38,10)  comment '同期产奶量',  
   cows_count  decimal(38,10)  comment '牛头数', 
   cows_count_period  decimal(38,10)  comment '同期牛头数', 
   group_type  string comment '分群类型',

   dry_milk_price decimal(38,10) comment '干奶牛饲料成本',
   perin_cows_price   decimal(38,10) comment '围产牛饲料成本',
   milk_cows_price  decimal(38,10) comment '泌乳牛饲料成本',
   reserve_cows_price decimal(38,10) comment '后备牛饲料成本',
   calf_price decimal(38,10) comment '犊牛饲料成本',
   dry_milk_eat  decimal(38,10) comment '干奶牛采食量',
   perin_cows_eat  decimal(38,10)  comment '围产牛采食量',
   milk_cows_eat  decimal(38,10) comment '泌乳牛采食量',
   reserve_cows_eat  decimal(38,10) comment '后备牛采食量',
   calf_eat  decimal(38,10) comment '犊牛采食量',
   dry_milk_price_period decimal(38,10) comment '同期干奶牛饲料成本',
   perin_cows_price_period   decimal(38,10) comment '同期围产牛饲料成本',
   milk_cows_price_period  decimal(38,10) comment '同期泌乳牛饲料成本',
   reserve_cows_price_period decimal(38,10) comment '同期后备牛饲料成本',
   calf_price_period decimal(38,10) comment '同期犊牛饲料成本',
   dry_milk_eat_period  decimal(38,10) comment '同期干奶牛采食量',
   perin_cows_eat_period  decimal(38,10)  comment '同期围产牛采食量',
   milk_cows_eat_period  decimal(38,10) comment '同期泌乳牛采食量',
   reserve_cows_eat_period  decimal(38,10) comment '同期后备牛采食量',
   calf_eat_period  decimal(38,10) comment '同期犊牛采食量',
   
   atype_fodder_price  decimal(38,10) comment 'A类型饲料成本',
   btype_fodder_price  decimal(38,10) comment 'B类型饲料成本',
   ctype_fodder_price  decimal(38,10) comment 'C类型饲料成本',
   dtype_fodder_price  decimal(38,10) comment 'D类型饲料成本',
   
   atype_milk_prod  decimal(38,10) comment 'A类型奶产量',
   btype_milk_prod  decimal(38,10) comment 'B类型奶产量',
   ctype_milk_prod  decimal(38,10) comment 'C类型奶产量',
   dtype_milk_prod  decimal(38,10) comment 'D类型奶产量',
   
   atype_fodder_period  decimal(38,10) comment '同期A类型饲料成本',
   btype_fodder_period  decimal(38,10) comment '同期B类型饲料成本',
   ctype_fodder_period  decimal(38,10) comment '同期C类型饲料成本',
   dtype_fodder_period  decimal(38,10) comment '同期D类型饲料成本',
   
   atype_milk_period decimal(38,10) comment '同期A类型奶产量',
   btype_milk_period decimal(38,10) comment '同期B类型奶产量',
   ctype_milk_period decimal(38,10) comment '同期C类型奶产量',
   dtype_milk_period decimal(38,10) comment '同期D类型奶产量',
  
   dry_cows decimal(38,10)  comment '干奶牛头数',
   locating_cows decimal(38,10)  comment '泌乳牛头数',
   reserve_cows decimal(38,10)  comment '后备牛头数',
   calf decimal(38,10)  comment '犊牛数',
   dry_cows_period decimal(38,10)  comment '同期干奶牛头数',
   locating_cows_period decimal(38,10)  comment '泌乳牛头数',   
   reserve_cows_period decimal(38,10)  comment '同期后备牛',
   calf_period decimal(38,10)  comment '同期犊牛数',

   farm_type  string comment '模式等级（ABCD，大型）',
   report_date  bigint  comment '报告时间/搅拌时间',
   report_month  bigint  comment '报告时间/搅拌时间',
   farm_code  string comment '牛场名称',
   farm_name  string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name  string comment '区域名',
   cities_name  string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' 
  stored as ORC;
  
  
  
  
----
-- 饲喂分析 柱状图建表语句  
--
----
  
DROP TABLE IF EXISTS BIGDATA_DM.PJ_FEED_ANALYSIS_TABLE ;
CREATE TABLE  BIGDATA_DM.PJ_FEED_ANALYSIS_TABLE (
   fodder_cost  decimal(38,10) comment '饲料用量',
   fodder_lost  decimal(38,10) comment '饲料剩余量',
   actual_eat  decimal(38,10) comment '饲料采食量',
   group_price  decimal(38,10) comment '饲养成本',
   
   fodder_cost_period  decimal(38,10) comment '同期饲料用量',
   fodder_lost_period  decimal(38,10) comment '同期饲料剩余量',
   actual_eat_period  decimal(38,10) comment  '同期饲料采食量',
   group_price_period  decimal(38,10) comment '同期饲养成本',
   total_milk  decimal(38,10)  comment '产奶量',
   total_milk_period  decimal(38,10)  comment '同期产奶量',  
   cows_count  decimal(38,10)  comment '牛头数', 
   cows_count_period  decimal(38,10)  comment '同期牛头数', 
   group_type  string comment '分群类型',
   order_column bigint comment '分群排序',
   farm_type    string comment '模式等级（ABCD，大型）',
   report_date  bigint  comment '报告时间/搅拌时间',
   report_month  bigint  comment '报告月份',
   farm_code    string comment '牛场名称',
   farm_name     string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name     string comment '区域名',
   cities_name  string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   
  stored as ORC;




----
-- 饲料用量 和 偏差柱图 
--
----

DROP TABLE IF EXISTS BIGDATA_DM.PJ_FEED_ACTUAL_ERROR ;
CREATE TABLE  BIGDATA_DM.PJ_FEED_ACTUAL_ERROR (
   fodder_cost  decimal(38,10) comment '饲料计划用量',
   fodder_lost  decimal(38,10) comment '饲料实际用量',
   actual_eat  decimal(38,10) comment '混合误差',
   group_type  string comment '分群类型',
   order_column bigint comment '分群排序',
   report_date  bigint  comment '报告时间/搅拌时间',
   report_month  bigint  comment '报告月份',
   farm_code    string comment '牛场名称',
   farm_name     string comment '牛场名称',
   big_area_name  string comment '大区名',
   area_name     string comment '区域名',
   cities_name  string comment '城市名'
 )

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   
  stored as ORC;
  
  
  
  
  
  
  
  
  
  
  
  
-----  首页区域维度数据信息表
---
---
----


CREATE TABLE BIGDATA_DW.W_AREA_INFO(

farm_count bigint comment '牧场个数'
,big_area_id  string comment '大区ID'
,big_area_code  string comment '大区编号'
,big_area_name string comment '大区'
,area_id  string comment '区域ID'
,area_code  string comment '区域编号'
,area_name string comment '区域名称'
,cities_id  string comment '地区ID'
,cities_code  string comment '地区编号'
,cities_name  string comment '地区名'
 )                                         

ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n' stored as ORC;
