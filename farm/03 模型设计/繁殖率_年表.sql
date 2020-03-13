---
-- 获取牛只 选择时间去年最后一天数据 和禁配牛数据
----繁殖率，取去年期末值
---


CREATE TABLE BIGDATA_DM.PJ_COW_HERD_YEAR_INFO(
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
  report_year bigint comment '报告年份',
 -- farm_id string comment '牛场Id',
--  farm_code string comment '牛场编号',
  farm_name string comment '牛场名称',
--  big_area_id string comment '大区ID',
--  big_area_code string comment '大区编号',
  big_area_name string comment '大区名',
--  area_id string comment '区域ID',
--  area_code string comment '区域编号',
  area_name string comment '区域名',
--  cities_id string comment '城市群ID',
--  cities_code string comment '城市群编号',
  cities_name string comment '城市名'
 )
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
  LINES TERMINATED BY '\n'   stored as ORC;