# autodisableapp

某个特定app启动时自动禁用app

配置文件在 模块目录/module.ini

一般是:
/data/adb/modules/autopmdisable/module.ini

默认配置(已添加到模块内):
```bash
#每次监听间隔时长 [单位:秒(s)]
sleeptime=3

#检测包名
#一行一个包名 "" 请勿删除
packagelist="com.tencent.tmgp.sgame
com.tencent.tmgp.speedmobile
com.tencent.tmgp.cf
com.tencent.tmgp.pubgmhd
com.tencent.tmgp.cod
com.tencent.KiHan
com.miHoYo.Yuanshen
com.netease.mrzh
com.netease.dwrg
com.ztgame.bob
com.tencent.ig"


#上面那些app启动时以下app会被冻结
disablepackagelist="com.miui.powerkeeper
com.xiaomi.joyose"
```

下载链接:
https://github.com/heinu112/autodisableapp/releases

下载autodisableapp.zip即可
