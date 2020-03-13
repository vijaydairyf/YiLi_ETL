with
temp01 as (
select
--t01.report_month,
--适繁青年牛数=青年牛头数-禁配青年牛头数
sum(t01.last_year_youth_cows)-sum(t01.youth_forbid_cows) forbid 
from bigdata_dm.PJ_COW_HERD_DAY_INFO t01 
where 1=1
and
t01.report_month=201801
--group by
--t01.report_month
)
,temp02 as(
select 
--t02.report_month,
--繁殖青年牛牛数
sum(t02.breed_youth_cows)  total_breed_youth_cows
from bigdata_dm.PJ_FEEDING_RATE_INFO  t02
where 1=1
and
t02.report_month>=201801
and
t02.report_month<=201812
--group by
--t02.report_month
)

select
--temp01.report_month AS "年月",
temp02.total_breed_youth_cows  AS  "繁殖青年牛牛数_分子",
temp01.forbid AS "适繁青年牛数_分母",
case when temp01.forbid !=0 then round(temp02.total_breed_youth_cows/temp01.forbid,4)*100  else 0  end  AS  "青年牛繁殖率"
from
temp01 
join
temp02
on
2=2
--and
--temp01.report_month=temp02.report_month
--order by
--temp01.report_month