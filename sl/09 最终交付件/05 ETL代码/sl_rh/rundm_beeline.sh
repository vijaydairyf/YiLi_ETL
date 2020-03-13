#!/bin/bash
#source ~/.bash_profile
######################################################################
#                                                                    #
# 程    序: rundm_beeline.sh                                         #
# 创建时间: 2018年10月13日                                           #
# 创 建 者: CAPGEMINI                                                #
# 参数:                                                              #
#    2个参数：                                                       #
# 补充说明: ods数据加工加载至dm库中                                  #
# 修改说明:                                                          #
######################################################################

if [ $# -ne 2 ]; then
  echo "parameter err!"
  echo "Usage: $0 ETL_DT filename.sql"
  echo "Usage: $0 YYYYMMDD filename.sql"
  exit -1
fi

#if [ -f /home/yilibd/etl/conf/global_para.env ];then
#  . /home/yilibd/etl/conf/global_para.env
#else
#  echo "Can not find config file!"
#  exit -1
#fi

if [ -f $2 ];then
  echo "The filename is $2"
else
  echo "Can not find the file!"
  exit -1
fi

biz_dt=$1
filename=$2

#运行日志
#LogDir="/DATA01/yilibd_opt/logs/${biz_dt}/dm"
LogDir="/DATA01/yilibd_opt/logs/"
[ -d ${LogDir} ] || mkdir -p ${LogDir};
LogFile=${LogDir}/rundm_beeline.log


echo ${filename}

logfile1=$(basename $filename .sql)
echo ${logfile1}

###############################运行脚本#####################################
beeline -u jdbc:hive2://hdpmntr02.yili.com:10000 -n yilibd -p 2017yili!  -f ${filename}

ret=$?
if [ "$ret" -ne "0" ];then
  echo "Run script error!"
  exit -1
fi
