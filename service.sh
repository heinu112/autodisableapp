#!/system/bin/sh
source ${0%/*}/module.ini
stop=0
start=0
while true
do
if [ -f ${0%/*}/disable ];then
sed -i "s/\[.*\]/\[模块已禁用\]/g" ${0%/*}/module.prop
else
sed -i "s/\[.*\]/\[运行中...\]/g" ${0%/*}/module.prop
fi
    for package in ${packagelist}
    do
    if [[ $(pidof $package) ]];then
    disable="true"
    break
    else
    disable="false"
    fi
    done
    if [ $disable == "true" ];then
    if [ $start == "0" ];then
    {
    for disablepackage in ${disablepackagelist}
    do
    if [ ${ifcommand} ];then
    su -c eval "${command}"
    fi
    if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ];then
    pm disable-user ${disablepackage}
    else
    echo "${disablepackage}未安装 跳过"
    fi
    done }&
    {
    if [ ${ifkillpackage} ];then
    for killpackage in ${killpackagelist}
    do
    kill -9 ${killpackage}
    done
    fi }&
    stop=0
    start=1
    fi
    else
    if [ $stop == "0" ];then
    {
    for disablepackage in ${disablepackagelist}
    do
    if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ];then
    pm enable ${disablepackage}
    else
    echo "${disablepackage}未安装 跳过"
    fi
    done }&
    fi
    stop=1
    start=0
    fi
done