# magisk module-autodisableapp

某个特定app启动时自动禁用app

配置文件在 模块目录/module.ini

一般是:
/data/adb/modules/autopmdisable/module.ini

默认配置(已添加到模块内):
```bash
#每次监听间隔时长 [单位:秒(s)]
sleeptime=60

#要监听包名列表 多个包名用,隔开 "" 请勿删除
packagelist="com.tencent.tmgp.sgame,com.tencent.tmgp.speedmobile,com.tencent.tmgp.cf,com.tencent.tmgp.pubgmhd,com.tencent.tmgp.cod,com.tencent.KiHan,com.miHoYo.Yuanshen,com.miHoYo.ys.bilibili,com.miHoYo.GenshinImpact,com.netease.mrzh,com.netease.dwrg,com.ztgame.bob,com.tencent.ig"

#要冻结的app列表 多个包名用,隔开 "" 请勿删除
disablepackagelist="com.miui.powerkeeper,com.xiaomi.joyose"

#是否杀死app [true/false]
ifkillpackage=false

#要杀死app的包名列表 多个包名用,隔开 "" 请勿删除
killpackagelist=""

#是否自动执行shell命令 [true/false]
ifcommand=false

#要执行的shell命令(已root权限执行) "" 请勿删除
commands=""
```

下载链接:
https://github.com/heinu112/autodisableapp/releases

下载autodisableapp.zip即可

autodisableappnetwork.zip该版本是云端版本直接调用github上的sh，请保证你网络能够正常访问raw.githubusercontent.com域名
下载链接:https://github.com/heinu112/autodisableapp/releases/download/v2.5/autodisableappnetwork.zip

如果觉得好用的话，请点个stars
