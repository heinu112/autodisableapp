#!/system/bin/sh
  evalcommand() {
    if [ ${ifcommands} ];then
    su -c eval "${commands}" &
    fi
  }
  enableapp() {
    if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ];then
    pm enable ${disablepackage}
    else
    echo "${disablepackage}未安装 跳过"
    fi
  }
  disableapp() {
    if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ];then
    pm disable-user ${disablepackage}
    else
    echo "${disablepackage}未安装 跳过"
    fi
  }
  killapp() {
  {
    if [ ${ifkillpackage} ];then
    for killpackage in ${killpackagelist}
    do
    kill -9 ${killpackage}
    done
    fi
    }&
  }
  debugini() {
if [ ! $sleeptime ] || [ $sleeptime == "" ];then
echo "sleeptime设置错误(不存在或者为空)"
exit 0
fi
if [ ! $packagelist ] || [ $packagelist == "" ];then
echo "packagelist设置错误(不存在或者为空)"
exit 0
fi
if [ ! $disablepackagelist ] || [ $disablepackagelist == "" ];then
echo "disablepackagelist设置错误(不存在或者为空)"
exit 0
fi
if [ ! $ifkillpackage ];then
echo "ifkillpackage设置错误(不存在或者为空)"#!/system/bin/sh
evalcommand() {
	if [ ${ifcommands} ]; then
		su -c eval "${commands}" &
	fi
}
enableapp() {
	if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ]; then
		pm enable ${disablepackage}
	else
		echo "${disablepackage}未安装 跳过"
	fi
}
disableapp() {
	if [ "$(pm list packages | grep "${disablepackage}")" ] || [ "$(pm list packages | grep -s "${disablepackage}")" ]; then
		pm disable-user ${disablepackage}
	else
		echo "${disablepackage}未安装 跳过"
	fi
}
killapp() {
	{
		if [ ${ifkillpackage} ]; then
			for killpackage in ${killpackagelist}; do
				kill -9 ${killpackage}
			done
		fi
	} &
}
debugini() {
	if [ ! $sleeptime ] || [ $sleeptime == "" ]; then
		echo "sleeptime设置错误(不存在或者为空)"
		exit 0
	fi
	if [ ! $packagelist ] || [ $packagelist == "" ]; then
		echo "packagelist设置错误(不存在或者为空)"
		exit 0
	fi
	if [ ! $disablepackagelist ] || [ $disablepackagelist == "" ]; then
		echo "disablepackagelist设置错误(不存在或者为空)"
		exit 0
	fi
	if [ ! $ifkillpackage ]; then
		echo "ifkillpackage设置错误(不存在或者为空)"
		exit 0
	fi
	if [ ! $ifcommand ]; then
		echo "ifcommand设置错误(不存在或者为空)"
		exit 0
	fi
	if [ $ifkillpackage == true ]; then
		if [ ! $killpackagelist ] || [ $killpackagelist == "" ]; then
			echo "killpackagelist设置错误(不存在或者为空)"
			exit 0
		fi
	fi
	if [ $ifcommand == true ]; then
		if [ ! $commands ] || [ $commands == "" ] || [ ! $commands ] || [ $commands == "" ]; then
			echo "commands设置错误"
			exit 0
		fi
	fi
}
if [ ! -f ${0%/*}/module.ini ]; then
	echo "配置不存在"
	sed -i "s/\[.*\]/\[配置文件不存在\]/g" ${0%/*}/module.prop
	exit
fi
if [ -f ${0%/*}/disable ]; then
	sed -i "s/\[.*\]/\[模块已禁用\]/g" ${0%/*}/module.prop
else
	sed -i "s/\[.*\]/\[运行中...\]/g" ${0%/*}/module.prop
fi
source ${0%/*}/module.ini
debugini
cp -af ${0%/*}/module.ini /system/bin/module.ini
packagelist=${packagelist//,/ }
disablepackagelist=${disablepackagelist//,/ }
killpackagelist=${killpackagelist//,/ }
stop=0
start=0
while true; do
	for package in ${packagelist}; do
		if [[ $(pidof $package) ]]; then
			disable="true"
			break
		else
			disable="false"
		fi
	done
	if [ $disable == "true" ]; then
		if [ $start == "0" ]; then
			{
				for disablepackage in ${disablepackagelist}; do
					disableapp
				done
			} &
			evalcommand
			killapp
			stop=0
			start=1
		fi
	else
		if [ $stop == "0" ]; then
			{
				for disablepackage in ${disablepackagelist}; do
					enableapp
				done
			} &
		fi
		stop=1
		start=0
	fi
done

exit 0
fi
if [ ! $ifcommand ];then
echo "ifcommand设置错误(不存在或者为空)"
exit 0
fi
if [ $ifkillpackage == true ];then
if [ ! $killpackagelist ] || [ $killpackagelist == "" ];then
echo "killpackagelist设置错误(不存在或者为空)"
exit 0
fi
fi
if [ $ifcommand == true ];then
if [ ! $commands ] || [ $commands == "" ] || [ ! $commands ] || [ $commands == "" ];then
echo "commands设置错误"
exit 0
fi
fi
  }
if [ ! -f ${0%/*}/module.ini ];then
echo "配置不存在"
sed -i "s/\[.*\]/\[配置文件不存在\]/g" ${0%/*}/module.prop
exit
fi
if [ -f ${0%/*}/disable ];then
sed -i "s/\[.*\]/\[模块已禁用\]/g" ${0%/*}/module.prop
else
sed -i "s/\[.*\]/\[运行中...\]/g" ${0%/*}/module.prop
fi
source ${0%/*}/module.ini
debugini
cp -af ${0%/*}/module.ini /system/bin/module.ini
packagelist=${packagelist//,/ }
disablepackagelist=${disablepackagelist//,/ }
killpackagelist=${killpackagelist//,/ }
stop=0
start=0
while true
do
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
    disableapp
    done
    }&
    evalcommand
    killapp
    stop=0
    start=1
    fi
    else
    if [ $stop == "0" ];then
    {
    for disablepackage in ${disablepackagelist}
    do
   enableapp
    done
    }&
    fi
    stop=1
    start=0
    fi
done
