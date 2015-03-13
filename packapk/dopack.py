# encoding=utf8
import os
import sys
import urllib 
import urllib2 
from oss.oss_api import *

download_buf = '''pps	1号脚本	http://cdn.data.video.iqiyi.com/cdn/ppsgame/20141107/upload/unite/pps/android/fknsg/1107/fknsg_ppslist.apk
pptv	1号脚本	http://dl4.vas.pptv.com/mobgame/fknsg/4.2.0/fknsg_4.2.0_225.apk
官方内	1号脚本	http://static.zuiyouxi.com/client/fknsg_zyx_4.2.0_gwphone_1411061022.apk
官方外	1号脚本	http://bzclk.baidu.com/adrc.php?t=00KL00c00fA-ek00w1-a0KIEHsKjJgNR00000rPE46300000jMInYQ.THvLkUSJknxcOUMl0A3qmh7GuZNCUvd-gLKM0Znqm1m3mvfkuH6snj0drHn4msKd5H61wRPanDRvnYfzwj6swRmkPWRsPjDsPH6zPHwarRn30ADquZCsUyPlnyGrph9JybwAUDqDfgIPw7RdHgG_pbGVnyG9NdD4HNwKnDdliHNrpbbkHRPpIvPVryV9NdD4HNwuUN-RnZ9mXb7VuDTsrRG8NMwfRdGvmvdorRdHyMGbNYGvmvdorRG8fM-9NjK4ihdApvn1ihGfNDD-nYf0uHdCIZwsrBtEmyf8XMNGXyqdXAb8mvqVQvGdUg0E5vCqXZNdIMTkTL9EufKWThnqPWDdPWc
小米 	1号脚本	http://file.market.xiaomi.com/download/AppStore/7c64489f-2c03-440d-bfab-1ef81e3de77b/%E6%94%BE%E5%BC%80%E9%82%A3%E4%B8%89%E5%9B%BD.apk
豌豆荚	1号脚本	http://stat.ouwan.com/chn/cdn/download/815/
华为	1号脚本	http://appdl.hicloud.com/dl/appdl/application/apk/17/176d0050bbbc400d8567b751caf3687a/com.babeltime.fknsango.huawei.1411121049.apk?sign=mw@mw1417078228120
金山	1号脚本	http://stat.ouwan.com/chn/cdn/download/865/
联想	1号脚本	http://www.lenovomm.com/appdown/15533322-2
木蚂蚁	1号脚本	http://down.mumayi.com/591639
益玩	1号脚本	http://tg.ewan.cn/downapp.jsp?aid=10084&pid=19885&plat=1
oppo	1号脚本	http://storefs.nearme.com.cn/uploadFiles/Pfiles/201411/24/311c5706fdd3b4e71c46e0a858ddea8a.apk
37玩	1号脚本	http://download.37wan.cn/pingtai/fangkainasanguo_sy00001_1.apk
偶玩	1号脚本	http://stat.ouwan.com/chn/cdn/pkg/download/2000064/38/
九游	1号脚本	http://ugame.uc.cn/game/downloadGame?pack.cooperateModelId=39727&pack.id=2366264
当乐	1号脚本	http://res5.d.cn/b93edb2c564f24691a3f4abb9e53f5adcabcebe547a2d853744b056a3fe1d090fcc12c2a2f1415e89361dc13a4c0437855f32ce4c9a362f60e51da54fa4e6be6.apk

多酷	1号脚本	http://dl.m.duoku.com/game/62000/62926/20140604154729_13798.apk 
91	1号脚本	http://NewGameCenter.sj.91.com/ChannelPackService/downloadnewpack?id=30182
360	1号脚本	http://api.np.mobilem.360.cn/redirect/down/?from=youmi_60&sid=1570738
分割线		
偶玩	2号脚本	http://stat.ouwan.com/chn/cdn/pkg/download/2000064/38/
分割线		
九游	3号脚本	http://ugame.uc.cn/game/downloadGame?pack.cooperateModelId=37838&pack.gameId=527432&pack.platformId=2
'''


downloadlist = [ s.split() for s in download_buf.split("\n") ]

for t in downloadlist:
	if not len(t) == 3 :continue 
	name , url = t[0] , t[2]
	res = urllib2.urlopen(url)
	print name,url 
	urllib.urlretrieve(url, name+".apk")
	print name , "ok" 


oss = OssAPI("oss.aliyuncs.com", "OaFMOWwWfqKCN2If", "gu3ig8lFho8m91boUZ7vknxHaXRIYy")


#res = oss.put_object_from_file("gh-game", "fk/test.pdf", "OSS_Python_SDK.pdf")
#print "%s\n%s" % (res.status, res.read())