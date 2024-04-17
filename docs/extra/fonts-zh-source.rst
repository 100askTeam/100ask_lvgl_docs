.. \_fonts-zh-source:

=========
显示中文
=========

要在lvgl中使用中文显示，我们需要用到两个东西：字体文件和字体转换器。

字体文件我们可以使用开源的字体或者自己制作出来，准备好了字体文件之后使用字体转换器即可转换成可以在lvgl上使用的字体格式。

下面给提供了开源可免费商用的字体文件共大家使用，下载好字体文件之后，再使用字体转换器转换字体即可。

中文字体文件
============

中文使用unicode编码 [1]_。

思源字体
--------

+---------------------------------------+-------------------------------+
| 字体预览                              | 下载字体                      |
+=======================================+===============================+
| |SiYuanHeiTi-Bold|                    | `SiYuanHeiTi-Bold             |
|                                       | <http://photos.100ask.net/lvg |
|                                       | l/00_100ask_tools/fonts-zh-so |
|                                       | urce/SiYuanHeiTi-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-CN-VF|                   | `SiYuanHeiTi-CN-VF            |
|                                       | <http://photos.100ask.net/lvgl|
|                                       | /00_100ask_tools/fonts-zh-sou |
|                                       | rce/SiYuanHeiTi-CN-VF.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-ExtraLight|              |                               |
|                                       | `SiYuanHeiTi-ExtraLight <http:|
|                                       | //photos.100ask.net/lvgl/00_1 |
|                                       | 00ask_tools/fonts-zh-source/S |
|                                       | iYuanHeiTi-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-Heavy|                   | `SiYuanHeiTi-Heavy            |
|                                       | <http://photos.100ask.net/lvgl|
|                                       | /00_100ask_tools/fonts-zh-sou |
|                                       | rce/SiYuanHeiTi-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-Light|                   | `SiYuanHeiTi-Light <          |
|                                       | http://photos.100ask.net/lvgl |
|                                       | /00_100ask_tools/fonts-zh-sou |
|                                       | rce/SiYuanHeiTi-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-Medium|                  | `SiYuanHeiTi-Medium <h        |
|                                       | ttp://photos.100ask.net/lvgl/ |
|                                       | 00_100ask_tools/fonts-zh-sour |
|                                       | ce/SiYuanHeiTi-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-Normal|                  | `SiYuanHeiTi-Normal <h        |
|                                       | ttp://photos.100ask.net/lvgl/ |
|                                       | 00_100ask_tools/fonts-zh-sour |
|                                       | ce/SiYuanHeiTi-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTi-Regular|                 | `SiYuanHeiTi-Regular <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanHeiTi-Regular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiGoogleBan|                | `SiYuanHeiTiGoogleBan <htt    |
|                                       | p://photos.100ask.net/lvgl/00 |
|                                       | _100ask_tools/fonts-zh-source |
|                                       | /SiYuanHeiTiGoogleBan.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Bold|           | `SiYuan                       |
|                                       | HeiTiJiuZiXing-Bold <http://p |
|                                       | hotos.100ask.net/lvgl/00_100a |
|                                       | sk_tools/fonts-zh-source/SiYu |
|                                       | anHeiTiJiuZiXing-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-ExtraLight|     | `SiYuanHeiTiJiuZiXi           |
|                                       | ng-ExtraLight <http://photos. |
|                                       | 100ask.net/lvgl/00_100ask_too |
|                                       | ls/fonts-zh-source/SiYuanHeiT |
|                                       | iJiuZiXing-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Heavy|          | `SiYuanHe                     |
|                                       | iTiJiuZiXing-Heavy <http://ph |
|                                       | otos.100ask.net/lvgl/00_100as |
|                                       | k_tools/fonts-zh-source/SiYua |
|                                       | nHeiTiJiuZiXing-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Light|          | `SiYuanHe                     |
|                                       | iTiJiuZiXing-Light <http://ph |
|                                       | otos.100ask.net/lvgl/00_100as |
|                                       | k_tools/fonts-zh-source/SiYua |
|                                       | nHeiTiJiuZiXing-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Medium|         | `SiYuanHeiT                   |
|                                       | iJiuZiXing-Medium <http://pho |
|                                       | tos.100ask.net/lvgl/00_100ask |
|                                       | _tools/fonts-zh-source/SiYuan |
|                                       | HeiTiJiuZiXing-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Normal|         | `SiYuanHeiT                   |
|                                       | iJiuZiXing-Normal <http://pho |
|                                       | tos.100ask.net/lvgl/00_100ask |
|                                       | _tools/fonts-zh-source/SiYuan |
|                                       | HeiTiJiuZiXing-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanHeiTiJiuZiXing-Regular|        | `SiYuanHeiTiJ                 |
|                                       | iuZiXing-Regular <http://phot |
|                                       | os.100ask.net/lvgl/00_100ask_ |
|                                       | tools/fonts-zh-source/SiYuanH |
|                                       | eiTiJiuZiXing-Regular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Bold|                   | `SiYuanRouHei-Bold            |
|                                       | <http://photos.100ask.net/lvgl|
|                                       | /00_100ask_tools/fonts-zh-sou |
|                                       | rce/SiYuanRouHei-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-ExtraLight|             | `Si                           |
|                                       | YuanRouHei-ExtraLight <http:/ |
|                                       | /photos.100ask.net/lvgl/00_10 |
|                                       | 0ask_tools/fonts-zh-source/Si |
|                                       | YuanRouHei-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Heavy|                  | `SiYuanRouHei-Heavy  <h       |
|                                       | ttp://photos.100ask.net/lvgl/ |
|                                       | 00_100ask_tools/fonts-zh-sour |
|                                       | ce/SiYuanRouHei-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-IOS8|                   | `SiYuanRouHei-IOS8            |
|                                       | <http://photos.100ask.net/lvgl|
|                                       | /00_100ask_tools/fonts-zh-sou |
|                                       | rce/SiYuanRouHei-IOS8.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Light|                  | `SiYuanRouHei-Light <h        |
|                                       | ttp://photos.100ask.net/lvgl/ |
|                                       | 00_100ask_tools/fonts-zh-sour |
|                                       | ce/SiYuanRouHei-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Medium|                 | `SiYuanRouHei-Medium <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanRouHei-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Normal|                 | `SiYuanRouHei-Normal <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanRouHei-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHei-Regular|                | `SiYuanRouHei-Regular <htt    |
|                                       | p://photos.100ask.net/lvgl/00 |
|                                       | _100ask_tools/fonts-zh-source |
|                                       | /SiYuanRouHei-Regular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Bold|        | `SiYuanRouHei                 |
|                                       | DengKuanBan-Bold <http://phot |
|                                       | os.100ask.net/lvgl/00_100ask_ |
|                                       | tools/fonts-zh-source/SiYuanR |
|                                       | ouHeiDengKuanBan-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-ExtraLight|  | `SiYuanRouHeiDengKuanBan-     |
|                                       | ExtraLight <http://photos.100 |
|                                       | ask.net/lvgl/00_100ask_tools/ |
|                                       | fonts-zh-source/SiYuanRouHeiD |
|                                       | engKuanBan-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Heavy|       | `SiYuanRouHeiDe               |
|                                       | ngKuanBan-Heavy <http://photo |
|                                       | s.100ask.net/lvgl/00_100ask_t |
|                                       | ools/fonts-zh-source/SiYuanRo |
|                                       | uHeiDengKuanBan-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Light|       | `SiYuanRouHeiDe               |
|                                       | ngKuanBan-Light <http://photo |
|                                       | s.100ask.net/lvgl/00_100ask_t |
|                                       | ools/fonts-zh-source/SiYuanRo |
|                                       | uHeiDengKuanBan-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Medium|      | `SiYuanRouHeiDeng             |
|                                       | KuanBan-Medium <http://photos |
|                                       | .100ask.net/lvgl/00_100ask_to |
|                                       | ols/fonts-zh-source/SiYuanRou |
|                                       | HeiDengKuanBan-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Normal|      | `SiYuanRouHeiDeng             |
|                                       | KuanBan-Normal <http://photos |
|                                       | .100ask.net/lvgl/00_100ask_to |
|                                       | ols/fonts-zh-source/SiYuanRou |
|                                       | HeiDengKuanBan-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanRouHeiDengKuanBan-Regular|     | `SiYuanRouHeiDengKu           |
|                                       | anBan-Regular <http://photos. |
|                                       | 100ask.net/lvgl/00_100ask_too |
|                                       | ls/fonts-zh-source/SiYuanRouH |
|                                       | eiDengKuanBan-Regular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanSongTiRegular|                 | `SiYuanSongTiRegular <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanSongTiRegular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Bold|                  | `SiYuanZhenHei-Bold <h        |
|                                       | ttp://photos.100ask.net/lvgl/ |
|                                       | 00_100ask_tools/fonts-zh-sour |
|                                       | ce/SiYuanZhenHei-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-ExtraLight|            | `SiYu                         |
|                                       | anZhenHei-ExtraLight <http:// |
|                                       | photos.100ask.net/lvgl/00_100 |
|                                       | ask_tools/fonts-zh-source/SiY |
|                                       | uanZhenHei-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Heavy|                 | `SiYuanZhenHei-Heavy <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanZhenHei-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Light|                 | `SiYuanZhenHei-Light <ht      |
|                                       | tp://photos.100ask.net/lvgl/0 |
|                                       | 0_100ask_tools/fonts-zh-sourc |
|                                       | e/SiYuanZhenHei-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Medium|                | `SiYuanZhenHei-Medium <htt    |
|                                       | p://photos.100ask.net/lvgl/00 |
|                                       | _100ask_tools/fonts-zh-source |
|                                       | /SiYuanZhenHei-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Normal|                | `SiYuanZhenHei-Normal <htt    |
|                                       | p://photos.100ask.net/lvgl/00 |
|                                       | _100ask_tools/fonts-zh-source |
|                                       | /SiYuanZhenHei-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHei-Regular|               | `SiYuanZhenHei-Regular <http  |
|                                       | ://photos.100ask.net/lvgl/00_ |
|                                       | 100ask_tools/fonts-zh-source/ |
|                                       | SiYuanZhenHei-Regular.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Bold|       | `SiYuanZhenHeiD               |
|                                       | engKuanBan-Bold <http://photo |
|                                       | s.100ask.net/lvgl/00_100ask_t |
|                                       | ools/fonts-zh-source/SiYuanZh |
|                                       | enHeiDengKuanBan-Bold.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-ExtraLight| | `SiYuanZhenHeiDengKuanBan-E   |
|                                       | xtraLight <http://photos.100a |
|                                       | sk.net/lvgl/00_100ask_tools/f |
|                                       | onts-zh-source/SiYuanZhenHeiD |
|                                       | engKuanBan-ExtraLight.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Heavy|      | `SiYuanZhenHeiDen             |
|                                       | gKuanBan-Heavy <http://photos |
|                                       | .100ask.net/lvgl/00_100ask_to |
|                                       | ols/fonts-zh-source/SiYuanZhe |
|                                       | nHeiDengKuanBan-Heavy.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Light|      | `SiYuanZhenHeiDen             |
|                                       | gKuanBan-Light <http://photos |
|                                       | .100ask.net/lvgl/00_100ask_to |
|                                       | ols/fonts-zh-source/SiYuanZhe |
|                                       | nHeiDengKuanBan-Light.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Medium|     | `SiYuanZhenHeiDengK           |
|                                       | uanBan-Medium <http://photos. |
|                                       | 100ask.net/lvgl/00_100ask_too |
|                                       | ls/fonts-zh-source/SiYuanZhen |
|                                       | HeiDengKuanBan-Medium.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Normal|     | `SiYuanZhenHeiDengK           |
|                                       | uanBan-Normal <http://photos. |
|                                       | 100ask.net/lvgl/00_100ask_too |
|                                       | ls/fonts-zh-source/SiYuanZhen |
|                                       | HeiDengKuanBan-Normal.zip>`__ |
+---------------------------------------+-------------------------------+
| |SiYuanZhenHeiDengKuanBan-Regular|    | `SiYuanZhenHeiDengKua         |
|                                       | nBan-Regular <http://photos.1 |
|                                       | 00ask.net/lvgl/00_100ask_tool |
|                                       | s/fonts-zh-source/SiYuanZhenH |
|                                       | eiDengKuanBan-Regular.zip>`__ |
+---------------------------------------+-------------------------------+

更多字体
--------

-  `Adobe开源字体github主页 <https://github.com/adobe-fonts>`__
-  `等宽字体 </tools/monospaced-font>`__

常用汉字
=========

常用495个汉字
-------------

.. code:: shell

   雕虎的一了是我不在人们有来他这上着个地到大里说就去子得也和那要下看天时过出小么起你都把好还多没为又可家学只以主会样年想生同老中十从自面前头道它后然走很像见两用她国动进成回什边作对开而己些现山民候经发工向事命给长水几义三声于高手知理眼志点心战二问但身方实吃做叫当住听革打呢真全才四已所敌之最光产情路分总条白话东席次亲如被花口放儿常气黄五第使写军木珍吧文运再果怎定许快明行因别飞外树物活部门无往船望新带队先力完却站代员机更九您每风级跟笑啊孩万少直意夜比阶连车重便斗马哪化太指变社似士者干石满梅日决百原拿群究各六本思解立河村八难早论吗根共让相研今其书坐接应关信觉步反处记将千找争领或师结块跑谁草越字加脚紧爱等习阵怕月青半火法题建赶位唱海七女任件感准张团屋离色脸片科倒睛利世刚且由送切星导晚表够整认响雪流未场该并底深刻平伟忙提确近亮轻讲农古黑告界拉名呀土清阳照办史改历转画造嘴此治北必服雨穿内识验传业菜爬睡兴形量咱观苦体众通冲合破友度术饭公旁房极南枪读沙岁线野坚空收算至政城劳落钱特围弟胜教热展包歌类渐强数乡呼音答哥际旧神座章帮啦受系令跳非何牛取入岸敢掉忽种装顶急戴林停息句区衣般报叶压慢叔背细艳佐

常用3500个汉字
--------------

.. code:: shell

   一丁七万丈三三上下不与丐丑专且世丘丙业丛东丝丢两严丧个中丰串临丸丹为主丽举乃久么义之乌乍乎乏乐乒乓乔乖乘乙九乞也习乡书买乱乳了予争事二于亏云互五井亚些亡交亥亦产亩享京亭亮亲人亿什仁仅仆仇今介仍从仑仓仔他仗付仙代令以仪们仰仲件价任份仿企伊伍伏伐休众优伙会伞伟传伤伦伪伯估伴伶伸伺似佃但位低住佑体何余佛作你佣佩佳使侄侈例侍供依侠侣侥侦侧侨侮侯侵便促俄俊俏俐俗俘保信俩俭修俯俱俺倍倒倔倘候倚借倡倦债值倾假偎偏做停健偶偷偿傀傅傍储催傲傻像僚僧僵僻儒儡儿允元兄充兆先光克免兑兔党兜兢入全八公六兰共关兴兵其具典养兼兽冀内冈册再冒冕冗写军农冠冤冬冯冰冲决况冶冷冻净凄准凉凌减凑凛凝几凡凤凫凭凯凰凳凶凸凹出击函凿刀刁刃分切刊刑划列刘则刚创初删判刨利别刮到制刷券刹刺刻刽剂剃削前剑剔剖剥剧剩剪副割剿劈力劝办功加务劣动助努劫励劲劳势勃勇勉勋勒勘募勤勺勾勿匀包匆匈匕化北匙匠匣匪匹区医匾匿十千升午半华协卑卒卓单卖南博卜占卡卢卤卦卧卫印危即却卵卷卸卿厂厅历厉压厌厕厘厚原厢厦厨去县参又叉及友双反发叔取受变叙叛叠口古句另叨只叫召叭叮可台史右叶号司叹叼叽吁吃各吆合吉吊同名后吏吐向吓吕吗君吝吞吟吠否吧吨吩含听吭吮启吱吴吵吸吹吻吼呀呆呈告呐呕员呛呜呢周味呵呻呼命咆和咏咐咒咕咖咙咧咨咪咬咱咳咸咽哀品哄哆哈响哎哑哗哟哥哨哩哪哭哮哲哺哼唁唆唇唉唐唠唤唧唬售唯唱唾啃啄商啊啡啤啥啦啰啸啼喂善喇喉喊喘喜喝喧喳喷喻嗅嗓嗜嗡嗤嗦嗽嘀嘁嘉嘱嘲嘴嘶嘹嘿器噩噪嚎嚣嚷嚼囊囚四回因团囤园困囱围固国图圃圆圈土圣在地场圾址均坊坎坏坐坑块坚坛坝坞坟坠坡坤坦坪坯坷垂垃垄型垒垛垢垦垫垮埂埃埋城域埠培基堂堆堕堡堤堪堰堵塌塑塔塘塞填境墅墓墙增墨墩壁壕壤士壮声壳壶壹处备复夏夕外多夜够大天太夫夭央夯失头夷夸夹夺奄奇奈奉奋奏契奔奕奖套奠奢奥女奴奶奸她好如妄妆妇妈妒妓妖妙妥妨妹妻姆姊始姐姑姓委姚姜姥姨姻姿威娃娄娇娘娜娩娱娶婆婉婚婴婶婿媒媚媳嫁嫂嫉嫌嫡嫩嬉子孔孕字存孙孝孟季孤学孩孵孽宁它宅宇守安宋完宏宗官宙定宛宜宝实宠审客宣室宦宪宫宰害宴宵家容宽宾宿寂寄密寇富寒寓寝寞察寡寥寨寸对寺寻导寿封射将尉尊小少尔尖尘尚尝尤就尸尺尼尽尾尿局屁层居屈屉届屋屎屏屑展属屠屡履屯山屹屿岁岂岔岖岗岛岩岭岳岸峡峦峭峰峻崇崎崔崖崩崭嵌巍川州巡巢工左巧巨巩巫差己已巴巷巾币市布帅帆师希帐帕帖帘帚帜帝带席帮常帽幅幌幔幕幢干干平年并幸幻幼幽广庄庆庇床序庐库应底店庙府庞废度座庭庵庶康庸廉廊廓延廷建开异弃弄弊式弓引弛弟张弥弦弧弯弱弹强归当录形彤彩彪彬彭彰影役彻彼往征径待很徊律徐徒徒得徘御循微德徽心必忆忌忍志忘忙忠忧快忱念忽忿怀态怎怒怔怕怖怜思怠急性怨怪怯总恃恋恍恐恒恕恢恤恨恩恬恭息恰恳恶恼悄悉悍悔悟悠患悦您悬悯悲悴悼情惊惋惑惕惜惠惦惧惨惩惫惭惯惰想惶惹愁愈愉意愕愚感愤愧愿慈慌慎慕慢慧慨慰慷憋憎憔憨憾懂懈懊懒懦戈戏成我戒或战戚截戳戴户房所扁扇手才扎扑扒打扔托扛扣执扩扫扬扭扮扯扰扳扶批扼找承技抄把抑抒抓投抖抗折抚抛抠抡抢护报披抬抱抵抹押抽拂拄担拆拇拉拌拍拐拒拓拔拖拗拘拙招拜拟拢拣拥拦拧拨择括拭拯拱拳拴拷拼拾拿持挂指按挎挑挖挚挟挠挡挣挤挥挨挪挫振挺挽捂捅捆捉捌捍捎捏捐捕捞损捡换捣捧据捶捷捺捻掀掂授掉掌掏掐排掖掘掠探接控推掩措掰掷掸掺揉揍描提插揖握揣揩揪揭援揽搀搁搂搅搏搓搔搜搞搪搬搭携摄摆摇摊摔摘摧摩摸摹撇撑撒撕撞撤撩撬播撮撰撵撼擂擅操擎擒擦攀攒攘支收改攻放政故效敌敏救教敛敞敢散敦敬数敲整敷文斋斑斗料斜斟斤斥斧斩断斯新方施旁旅旋族旗无既日旦旧旨早旬旭旱时旷旺昂昆昌明昏易昔昙星映春昧昨昭是昵昼显晃晋晌晒晓晕晚晤晦晨普景晰晴晶智晾暂暇暑暖暗暮暴曙曲更曹曼曾替最月有朋服朗望朝期朦木未末本术朱朴朵机朽杀杂权杆杈杉李杏材村杖杜束杠条来杨杭杯杰松板极构枉析枕林枚果枝枢枣枪枫枯架枷柄柏某柑柒染柔柜柠查柬柱柳柴柿栅标栈栋栏树栓栖栗校株样核根格栽桂桃桅框案桌桐桑档桥桦桨桩桶梁梅梆梗梢梦梧梨梭梯械梳检棉棋棍棒棕棘棚棠森棱棵棺椅植椎椒椭椰椿楔楚楞楣楷楼概榄榆榔榕榛榜榨榴槐槽樊樟模横樱橄橘橙橡橱檀檐檩檬欠次欢欣欧欲欺款歇歉歌止正此步武歧歪歹死歼殃殉殊残殖殴段殷殿毁毅母每毒比毕毙毛毡毫毯氏民氓气氛氢氧氨氮氯水永汁求汇汉汗汛汞江池污汤汪汰汹汽沃沈沉沐沙沛沟没沥沦沧沪沫沮河沸油治沼沽沾沿泄泉泊泌法泛泞泡波泣泥注泪泰泳泵泻泼泽洁洋洒洗洛洞津洪洲活洼洽派流浅浆浇浊测济浑浓浙浦浩浪浮浴海浸涂消涉涌涎涕涛涝涡涣涤润涧涨涩涮涯液涵淀淆淋淌淑淘淡淤淫淮深淳混淹添清渊渐渔渗渠渡渣渤温港渴游渺湃湖湘湾湿溃溅溉源溜溢溪溯溶溺滋滑滓滔滚滞满滤滥滨滩滴漂漆漏漓演漠漩漫漱漾潘潜潦潭潮澄澈澎澜澡澳激濒瀑灌火灭灯灰灵灶灸灼灾灿炉炊炎炒炕炫炬炭炮炸点炼烁烂烈烘烙烛烟烤烦烧烫热烹焊焕焙焚焦焰然煌煎煞煤照煮熄熊熏熔熙熟熬燃燎燕燥爆爪爬爱爵父爷爸爹爽片版牌牍牙牛牡牢牧物牲牵特牺犀犁犬犯状犹狂狈狐狗狞狠狡独狭狮狰狱狸狼猎猖猛猜猩猪猫猬献猴猾猿玄率玉王玖玛玩玫环现玲玷玻珊珍珠班球琅理琉琐琢琳琴琼瑞瑟瑰璃璧瓜瓢瓣瓤瓦瓮瓶瓷甘甚甜生甥用甩甫田由甲申电男甸画畅界畏畔留畜略畦番畴畸疆疏疑疗疙疚疟疤疫疮疯疲疹疼疾病症痊痒痕痘痛痢痪痰痴痹瘟瘤瘦瘩瘪瘫瘸瘾癌癞癣登白百皂的皆皇皮皱皿盅盆盈益盏盐监盒盔盖盗盘盛盟目盯盲直相盹盼盾省眉看真眠眨眯眶眷眼着睁睛睡督睦睬睹瞄瞎瞒瞧瞪瞬瞭瞳瞻矗矛矢知矩矫短矮石矾矿码砂砌砍研砖砚砰破砸砾础硅硕硝硫硬确硼碉碌碍碎碑碗碘碟碧碰碱碳碴碾磁磅磕磨磷磺礁示礼社祈祖祝神祟祠祥票祭祷祸禀禁福离禽禾秀私秃秆秉秋种科秒秕秘租秤秦秧秩秫积称秸移秽稀程稍税稚稠稳稻稼稽稿穆穗穴究穷空穿突窃窄窍窑窒窖窗窘窜窝窟窥窿立竖站竞竟章竣童竭端竹竿笆笋笑笔笙笛笤符笨第笼等筋筏筐筑筒答策筛筝筷筹签简箍箕算管箩箫箭箱篇篓篙篡篮篱篷簇簸簿籍米类籽粉粒粗粘粟粤粥粪粮粱粹精糊糕糖糙糜糟糠糯系紊素索紧紫累絮繁纠红纤约级纪纫纬纯纱纲纳纵纷纸纹纺纽线练组绅细织终绊绍绎经绑绒结绕绘给络绝绞统绢绣继绩绪续绰绳维绵绷绸综绽绿缀缅缆缎缓缔缕编缘缚缝缠缤缨缩缭缰缴缸缺罐网罕罗罚罢罩罪置署羊美羔羞羡群羹羽翁翅翎翔翘翠翩翰翻翼耀老考者而耍耐耕耕耗耙耳耸耻耽耿聂聊聋职联聘聚聪肃肄肆肉肋肌肖肘肚肛肝肠股肢肤肥肩肪肮肯育肴肺肾肿胀胁胃胆背胎胖胚胜胞胡胧胯胰胳胶胸能脂脆脉脊脏脐脑脓脖脚脯脱脸脾腊腋腌腐腔腕腥腮腰腹腺腻腾腿膀膊膏膘膛膜膝膨膳臀臂臊臣自臭至致臼舀舅舆舌舍舒舔舞舟航般舰舱舵舶舷船艇艘良艰色艳艺艾节芋芍芒芙芜芝芥芦芬芭芯花芳芹芽苇苍苏苔苗苛苞苟若苦苫英苹茁茂范茄茅茉茎茧茫茬茴茵茶茸荆草荐荒荔荚荞荠荡荣荤荧药荷荸莉莫莱莲获莹莺莽菇菊菌菜菠菩菱菲萄萌萍萎萝萤营萧萨落著葛葡董葫葬葱葵蒂蒋蒙蒜蒲蒸蒿蓄蓉蓖蓝蓬蔑蔓蔗蔚蔫蔬蔼蔽蕉蕊蕴蕾薄薇薛薪薯藏藐藕藤藻蘑蘸虎虏虐虑虚虫虱虹虽虾蚀蚁蚂蚊蚌蚓蚕蚜蚣蚤蚪蚯蛀蛆蛇蛉蛋蛔蛙蛛蛤蛮蛹蛾蜀蜂蜈蜒蜓蜕蜗蜘蜜蜡蜻蝇蝉蝌蝎蝗蝙蝠蝴蝶螃融螟螺蟀蟆蟋蟹蠕蠢血衅行衍衔街衙衡衣补表衩衫衬衰衷袁袄袋袍袒袖袜被袭袱裁裂装裆裉裕裙裤裳裸裹褂褐褒褥襟西要覆见观规觅视览觉角解触言誉誊誓警譬计订认讥讨让训议讯记讲讳讶许讹论讼讽设访诀证评诅识诈诉诊词译试诗诚话诞诡询该详诫诬语误诱诲说诵请诸诺读诽课谁调谅谆谈谊谋谍谎谐谒谓谚谜谢谣谤谦谨谬谭谱谴谷豁豆豌象豪豫豹豺貌贝贞负贡财责贤败账货货质贩贪贫贬购贮贯贰贱贴贵贸费贺贼贾贿赁赂赃资赊赋赌赎赏赐赔赖赘赚赛赞赠赡赢赤赦赫走赴赵赶起趁超越趋趟趣足趴趾跃跋跌跑跛距跟跨跪路跳践跷跺踊踏踢踩踪踱蹂蹄蹈蹋蹦蹬蹭蹲躁躏身躬躯躲躺车轧轨轩转轮软轰轴轻载轿较辅辆辈辉辐辑输辕辖辙辛辜辞辟辣辨辩辫辰辱边辽达迁迂迄迅过迈迎运近返还这进远违连迟迫述迷迹追退送适逃逆选逊透逐递途逗通逛逝逞速造逢逮逸逻逼逾遂遇遍遏道遗遣遥遭遮遵避邀邑邓邢那邦邪邮邻郁郊郎郑部郭都鄙酌配酒酗酝酣酥酪酬酱酵酷酸酿醇醉醋醒采释里重野量金鉴针钉钓钙钝钞钟钠钢钥钦钧钩钮钱钳钻钾铁铃铅铆铐铛铜铝铡铣铭铲银铸铺链销锁锄锅锈锉锋锌锐错锚锡锣锤锥锦锨锭键锯锰锹锻镀镇镊镐镜镣镰镶长门闪闭问闯闰闲间闷闸闹闺闻闽阀阁阅阎阐阔队阱防阳阴阵阶阻阿附际陆陈陋陌降限陕陡院除陨险陪陵陶陷隅隆随隐隔隘隙障隧隶难雀雁雄雅集雇雌雏雕雨雪雳零雷雹雾需震霉霍霎霜霞露霸霹青靖静非靠靡面革靴靶鞋鞍鞠鞭韧韩韭音韵页顶顷项顺须顽顾顿颁颂预颅领颇颈颊频颓颖颗题颜额颠颤风飒飘飞食餐饥饭饮饰饱饲饵饶饺饼饿馁馅馆馋馍馏馒首香马驮驯驰驱驳驴驶驹驻驼驾骂骄骆骇验骏骑骗骚骡骤骨髓高鬓鬼魁魂魄魏魔鱼鲁鲜鲤鲫鲸鳄鳍鳖鳞鸟鸠鸡鸣鸥鸦鸭鸯鸳鸵鸽鸿鹃鹅鹉鹊鹏鹤鹦鹰鹿麦麸麻黄黍黎黑黔默鼎鼓鼠鼻齐齿龄龙龟

字符集编码范围

汉字 Unicode 编码范围
---------------------

Unicode
是全球文字统一编码。它把世界上的各种文字的每一个字符指定唯一编码，实现跨语种、跨平台的应用。

中文用户最常接触的是汉字 Unicode
编码。中文字符数量巨大，日常使用的汉字数量有数千个，再加上生僻字，数量达到数万个。下面这个表格将中文字符集的
Unicode 编码范围列出 [2]_：

更详细的内容请参考：
`中日韓統一表意文字 <https://zh.wikipedia.org/wiki/%E4%B8%AD%E6%97%A5%E9%9F%93%E7%B5%B1%E4%B8%80%E8%A1%A8%E6%84%8F%E6%96%87%E5%AD%97>`__

+--------------------------------------------------+-----+------------+
| **字符集**                                       | *   | **Unicode  |
|                                                  | *字 | 编码**     |
|                                                  | 数  |            |
|                                                  | **  |            |
+==================================================+=====+============+
| `基本汉字 <https://www.qqx                       | 2   | 4E00-9FA5  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhz>`__ | 090 |            |
|                                                  | 2字 |            |
+--------------------------------------------------+-----+------------+
| `基本汉字补充 <https://www.qqxiu                 | 9   | 9FA6-9FFF  |
| zi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhzbc>`__ | 0字 |            |
+--------------------------------------------------+-----+------------+
| `扩展A <https://www.qq                           | 659 | 3400-4DBF  |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kza>`__ | 2字 |            |
+--------------------------------------------------+-----+------------+
| `扩展B <https://www.qq                           | 4   | 2          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzb>`__ | 272 | 0000-2A6DF |
|                                                  | 0字 |            |
+--------------------------------------------------+-----+------------+
| `扩展C <https://www.qq                           | 415 | 2          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzc>`__ | 3字 | A700-2B738 |
+--------------------------------------------------+-----+------------+
| `扩展D <https://www.qq                           | 22  | 2          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzd>`__ | 2字 | B740-2B81D |
+--------------------------------------------------+-----+------------+
| `扩展E <https://www.qq                           | 576 | 2          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kze>`__ | 2字 | B820-2CEA1 |
+--------------------------------------------------+-----+------------+
| `扩展F <https://www.qq                           | 747 | 2          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzf>`__ | 3字 | CEB0-2EBE0 |
+--------------------------------------------------+-----+------------+
| `扩展G <https://www.qq                           | 493 | 3          |
| xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzg>`__ | 9字 | 0000-3134A |
+--------------------------------------------------+-----+------------+
| `康熙部首 <https://www.qqx                       | 21  | 2F00-2FD5  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kxbs>`__ | 4字 |            |
+--------------------------------------------------+-----+------------+
| `部首扩展 <https://www.qqx                       | 11  | 2E80-2EF3  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=bskz>`__ | 5字 |            |
+--------------------------------------------------+-----+------------+
| `兼容汉字 <https://www.qqx                       | 47  | F900-FAD9  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jrhz>`__ | 7字 |            |
+--------------------------------------------------+-----+------------+
| `兼容扩展 <https://www.qqx                       | 54  | 2          |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jrkz>`__ | 2字 | F800-2FA1D |
+--------------------------------------------------+-----+------------+
| `PUA(GBK)部件 <https://www.qqxi                  | 8   | E815-E86F  |
| uzi.cn/zh/hanzi-unicode-bianma.php?zfj=puabj>`__ | 1字 |            |
+--------------------------------------------------+-----+------------+
| `部件扩展 <https://www.qqx                       | 45  | E400-E5E8  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=bjkz>`__ | 2字 |            |
+--------------------------------------------------+-----+------------+
| `PUA增补 <https://www.qqxi                       | 20  | E600-E6CF  |
| uzi.cn/zh/hanzi-unicode-bianma.php?zfj=puazb>`__ | 7字 |            |
+--------------------------------------------------+-----+------------+
| `汉字笔画 <https://www.qqx                       | 3   | 31C0-31E3  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hzbh>`__ | 6字 |            |
+--------------------------------------------------+-----+------------+
| `汉字结构 <https://www.qqx                       | 1   | 2FF0-2FFB  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hzjg>`__ | 2字 |            |
+--------------------------------------------------+-----+------------+
| `汉语注音 <https://www.qqx                       | 4   | 3105-312F  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hyzy>`__ | 3字 |            |
+--------------------------------------------------+-----+------------+
| `注音扩展 <https://www.qqx                       | 2   | 31A0-31BA  |
| iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=zykz>`__ | 2字 |            |
+--------------------------------------------------+-----+------------+
| 〇                                               | 1字 | 3007       |
+--------------------------------------------------+-----+------------+


==================================================== =============== =====================
 **字符集**                                           **字数**        **Unicode编码**                                                                                          
==================================================== =============== ===================== 
 `基本汉字 <https://www.qqx                            20902字         4E00-9FA5           
  iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhz>`__   
==================================================== =============== =====================
 `基本汉字补充 <https://www.qqxiu                      90字             9FA6-9FFF           
  zi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhzbc>`__   
==================================================== =============== =====================
 `扩展A <https://www.qq                               6592字           3400-4DBF           
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kza>`__ 
==================================================== =============== =====================
 `扩展A <https://www.qq                               42720字          20000-2A6DF         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzb>`__ 
==================================================== =============== =====================
 `扩展B <https://www.qq                               4153字           2A700-2B738         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzc>`__  
==================================================== =============== =====================
 `扩展C <https://www.qq                               222字            2B740-2B81D         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzd>`__ 
==================================================== =============== =====================
 `扩展D <https://www.qq                               5762字           2B820-2CEA1         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kze>`__  
==================================================== =============== =====================
 `扩展E <https://www.qq                               7473字           2CEB0-2EBE0         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzf>`__ 
==================================================== =============== =====================
 `扩展F <https://www.qq                               4939字           30000-3134A         
  xiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzg>`__ 
==================================================== =============== =====================
 `康熙部首 <https://www.qqx                            214字           2F00-2FD5           
  iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kxbs>`__ 
==================================================== =============== =====================
 `部首扩展 <https://www.qqx                           115字           2E80-2EF3           
 iuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kxbs>`__     
==================================================== =============== =====================


拉丁字母 Unicode 编码范围
-------------------------

基本拉丁字母共有95个字符，其中52个属于拉丁字母，剩下的43个属于基本字符。

有33个字符被定义为“ASCII 标点及符号”，有时也被称为“ASCII 特殊字符”。

下面这个表格将基本拉丁字母字符集的 Unicode 编码范围列出 [3]_：

更详细的内容请参考：
`Unicode字符列表 <https://zh.wikipedia.org/wiki/Unicode%E5%AD%97%E7%AC%A6%E5%88%97%E8%A1%A8>`__

+-----+----+-----+-----------------------------------------------------+
| 代  | 显 | 十  | 描述                                                |
| 码  | 示 | 进  |                                                     |
|     |    | 制  |                                                     |
+=====+====+=====+=====================================================+
| U+0 |    | `   | `空格 <https://zh.wikipedia.org/wiki/空格>`__       |
| 020 |    | `&# |                                                     |
|     |    | 032 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | !  | `   | `叹号 <https://zh.wikipedia.org/wiki/叹号>`__       |
| 021 |    | `&# |                                                     |
|     |    | 033 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ”  | `   | `双引号 <https://zh.wikipedia.org/wiki/双引号>`__   |
| 022 |    | `&# |                                                     |
|     |    | 034 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | #  | `   | `井号 <https://zh.wikipedia.org/wiki/井號>`__       |
| 023 |    | `&# |                                                     |
|     |    | 035 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | $  | `   | 价钱/货币符号                                       |
| 024 |    | `&# |                                                     |
|     |    | 036 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | %  | `   | `百                                                 |
| 025 |    | `&# | 分比符号 <https://zh.wikipedia.org/wiki/百分比>`__  |
|     |    | 037 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | &  | `   | `& <https://zh.wikipedia.org/wiki/%26>`__           |
| 026 |    | `&# |                                                     |
|     |    | 038 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ’  | `   | `引号 <https://zh.wikipedia.org/wiki/引號>`__       |
| 027 |    | `&# |                                                     |
|     |    | 039 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | (  | `   | `左圆括号 <https://zh.wikipedia.org/wiki/圓括號>`__ |
| 028 |    | `&# |                                                     |
|     |    | 040 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | )  | `   | `右圆括号 <https://zh.wikipedia.org/wiki/圓括號>`__ |
| 029 |    | `&# |                                                     |
|     |    | 041 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | \* | `   | `星号 <https://zh.wikipedia.org/wiki/星號>`__       |
| 02A |    | `&# |                                                     |
|     |    | 042 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | +  | `   | `加号 <https://zh.wikipedia.org/wiki/數學符號>`__   |
| 02B |    | `&# |                                                     |
|     |    | 043 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ,  | `   | `逗号 <https://zh.wikipedia.org/wiki/逗號>`__       |
| 02C |    | `&# |                                                     |
|     |    | 044 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | -  | `   | 连字号/减号                                         |
| 02D |    | `&# |                                                     |
|     |    | 045 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | .  | `   | `句号 <https://zh.wikipedia.org/wiki/句號>`__       |
| 02E |    | `&# |                                                     |
|     |    | 046 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | /  | `   | 正斜杠                                              |
| 02F |    | `&# |                                                     |
|     |    | 047 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 0  | `   | `数字0 <https://zh.wikipedia.org/wiki/0>`__         |
| 030 |    | `&# |                                                     |
|     |    | 048 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 1  | `   | `数字1 <https://zh.wikipedia.org/wiki/1>`__         |
| 031 |    | `&# |                                                     |
|     |    | 049 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 2  | `   | `数字2 <https://zh.wikipedia.org/wiki/2>`__         |
| 032 |    | `&# |                                                     |
|     |    | 050 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 3  | `   | `数字3 <https://zh.wikipedia.org/wiki/3>`__         |
| 033 |    | `&# |                                                     |
|     |    | 051 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 4  | `   | `数字4 <https://zh.wikipedia.org/wiki/4>`__         |
| 034 |    | `&# |                                                     |
|     |    | 052 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 5  | `   | `数字5 <https://zh.wikipedia.org/wiki/5>`__         |
| 035 |    | `&# |                                                     |
|     |    | 053 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 6  | `   | `数字6 <https://zh.wikipedia.org/wiki/6>`__         |
| 036 |    | `&# |                                                     |
|     |    | 054 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 7  | `   | `数字7 <https://zh.wikipedia.org/wiki/7>`__         |
| 037 |    | `&# |                                                     |
|     |    | 055 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 8  | `   | `数字8 <https://zh.wikipedia.org/wiki/8>`__         |
| 038 |    | `&# |                                                     |
|     |    | 056 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | 9  | `   | `数字9 <https://zh.wikipedia.org/wiki/9>`__         |
| 039 |    | `&# |                                                     |
|     |    | 057 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | :  | `   | `冒号 <https://zh.wikipedia.org/wiki/冒號>`__       |
| 03A |    | `&# |                                                     |
|     |    | 058 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ;  | `   | `分号 <https://zh.wikipedia.org/wiki/分號>`__       |
| 03B |    | `&# |                                                     |
|     |    | 059 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | <  | `   | `小                                                 |
| 03C |    | `&# | 于符号 <https://zh.wikipedia.org/wiki/數學符號>`__  |
|     |    | 060 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | =  | `   | `等于号 <https://zh.wikipedia.org/wiki/數學符號>`__ |
| 03D |    | `&# |                                                     |
|     |    | 061 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | >  | `   | `大                                                 |
| 03E |    | `&# | 于符号 <https://zh.wikipedia.org/wiki/數學符號>`__  |
|     |    | 062 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ?  | `   | `问号 <https://zh.wikipedia.org/wiki/問號>`__       |
| 03F |    | `&# |                                                     |
|     |    | 063 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | @  | `   | `英文“at                                            |
| 040 |    | `&# | ”的简写符号 <https://zh.wikipedia.org/wiki/英文>`__ |
|     |    | 064 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | A  | `   | `拉丁字母A <https://zh.wikipedia.org/wiki/A>`__     |
| 041 |    | `&# |                                                     |
|     |    | 065 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | B  | `   | `拉丁字母B <https://zh.wikipedia.org/wiki/B>`__     |
| 042 |    | `&# |                                                     |
|     |    | 066 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | C  | `   | `拉丁字母C <https://zh.wikipedia.org/wiki/C>`__     |
| 043 |    | `&# |                                                     |
|     |    | 067 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | D  | `   | `拉丁字母D <https://zh.wikipedia.org/wiki/D>`__     |
| 044 |    | `&# |                                                     |
|     |    | 068 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | E  | `   | `拉丁字母E <https://zh.wikipedia.org/wiki/E>`__     |
| 045 |    | `&# |                                                     |
|     |    | 069 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | F  | `   | `拉丁字母F <https://zh.wikipedia.org/wiki/F>`__     |
| 046 |    | `&# |                                                     |
|     |    | 070 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | G  | `   | `拉丁字母G <https://zh.wikipedia.org/wiki/G>`__     |
| 047 |    | `&# |                                                     |
|     |    | 071 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | H  | `   | `拉丁字母H <https://zh.wikipedia.org/wiki/H>`__     |
| 048 |    | `&# |                                                     |
|     |    | 072 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | I  | `   | `拉丁字母I <https://zh.wikipedia.org/wiki/I>`__     |
| 049 |    | `&# |                                                     |
|     |    | 073 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | J  | `   | `拉丁字母J <https://zh.wikipedia.org/wiki/J>`__     |
| 04A |    | `&# |                                                     |
|     |    | 074 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | K  | `   | `拉丁字母K <https://zh.wikipedia.org/wiki/K>`__     |
| 04B |    | `&# |                                                     |
|     |    | 075 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | L  | `   | `拉丁字母L <https://zh.wikipedia.org/wiki/L>`__     |
| 04C |    | `&# |                                                     |
|     |    | 076 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | M  | `   | `拉丁字母M <https://zh.wikipedia.org/wiki/M>`__     |
| 04D |    | `&# |                                                     |
|     |    | 077 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | N  | `   | `拉丁字母N <https://zh.wikipedia.org/wiki/N>`__     |
| 04E |    | `&# |                                                     |
|     |    | 078 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | O  | `   | `拉丁字母O <https://zh.wikipedia.org/wiki/O>`__     |
| 04F |    | `&# |                                                     |
|     |    | 079 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | P  | `   | `拉丁字母P <https://zh.wikipedia.org/wiki/P>`__     |
| 050 |    | `&# |                                                     |
|     |    | 080 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | Q  | `   | `拉丁字母Q <https://zh.wikipedia.org/wiki/Q>`__     |
| 051 |    | `&# |                                                     |
|     |    | 081 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | R  | `   | `拉丁字母R <https://zh.wikipedia.org/wiki/R>`__     |
| 052 |    | `&# |                                                     |
|     |    | 082 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | S  | `   | `拉丁字母S <https://zh.wikipedia.org/wiki/S>`__     |
| 053 |    | `&# |                                                     |
|     |    | 083 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | T  | `   | `拉丁字母T <https://zh.wikipedia.org/wiki/T>`__     |
| 054 |    | `&# |                                                     |
|     |    | 084 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | U  | `   | `拉丁字母U <https://zh.wikipedia.org/wiki/U>`__     |
| 055 |    | `&# |                                                     |
|     |    | 085 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | V  | `   | `拉丁字母V <https://zh.wikipedia.org/wiki/V>`__     |
| 056 |    | `&# |                                                     |
|     |    | 086 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | W  | `   | `拉丁字母W <https://zh.wikipedia.org/wiki/W>`__     |
| 057 |    | `&# |                                                     |
|     |    | 087 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | X  | `   | `拉丁字母X <https://zh.wikipedia.org/wiki/X>`__     |
| 058 |    | `&# |                                                     |
|     |    | 088 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | Y  | `   | `拉丁字母Y <https://zh.wikipedia.org/wiki/Y>`__     |
| 059 |    | `&# |                                                     |
|     |    | 089 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | Z  | `   | `拉丁字母Z <https://zh.wikipedia.org/wiki/Z>`__     |
| 05A |    | `&# |                                                     |
|     |    | 090 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | [  | `   | `左方括号 <https://zh.wikipedia.org/wiki/括號>`__   |
| 05B |    | `&# |                                                     |
|     |    | 091 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | \\ | `   | 反斜杠                                              |
| 05C |    | `&# |                                                     |
|     |    | 092 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ]  | `   | 右方括号                                            |
| 05D |    | `&# |                                                     |
|     |    | 093 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ^  | `   | `抑扬（重音）符号 <https:                           |
| 05E |    | `&# | //zh.wikipedia.org/wiki/變音符號#變音符號的種類>`__ |
|     |    | 094 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | \_ | `   | 下划线                                              |
| 05F |    | `&# |                                                     |
|     |    | 095 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | \` | `   | `重音符 <https://zh.wikipedia.org/wiki/重音符>`__   |
| 060 |    | `&# |                                                     |
|     |    | 096 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | a  | `   | 拉丁字母a                                           |
| 061 |    | `&# |                                                     |
|     |    | 097 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | b  | `   | 拉丁字母b                                           |
| 062 |    | `&# |                                                     |
|     |    | 098 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | c  | `   | 拉丁字母c                                           |
| 063 |    | `&# |                                                     |
|     |    | 099 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | d  | `   | 拉丁字母d                                           |
| 064 |    | `&# |                                                     |
|     |    | 100 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | e  | `   | 拉丁字母e                                           |
| 065 |    | `&# |                                                     |
|     |    | 101 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | f  | `   | 拉丁字母f                                           |
| 066 |    | `&# |                                                     |
|     |    | 102 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | g  | `   | 拉丁字母g                                           |
| 067 |    | `&# |                                                     |
|     |    | 103 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | h  | `   | 拉丁字母h                                           |
| 068 |    | `&# |                                                     |
|     |    | 104 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | i  | `   | 拉丁字母i                                           |
| 069 |    | `&# |                                                     |
|     |    | 105 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | j  | `   | 拉丁字母j                                           |
| 06A |    | `&# |                                                     |
|     |    | 106 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | k  | `   | 拉丁字母k                                           |
| 06B |    | `&# |                                                     |
|     |    | 107 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | l  | `   | 拉丁字母l                                           |
| 06C |    | `&# |                                                     |
|     |    | 108 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | m  | `   | 拉丁字母m                                           |
| 06D |    | `&# |                                                     |
|     |    | 109 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | n  | `   | 拉丁字母n                                           |
| 06E |    | `&# |                                                     |
|     |    | 110 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | o  | `   | 拉丁字母o                                           |
| 06F |    | `&# |                                                     |
|     |    | 111 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | p  | `   | 拉丁字母p                                           |
| 070 |    | `&# |                                                     |
|     |    | 112 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | q  | `   | 拉丁字母q                                           |
| 071 |    | `&# |                                                     |
|     |    | 113 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | r  | `   | 拉丁字母r                                           |
| 072 |    | `&# |                                                     |
|     |    | 114 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | s  | `   | 拉丁字母s                                           |
| 073 |    | `&# |                                                     |
|     |    | 115 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | t  | `   | 拉丁字母t                                           |
| 074 |    | `&# |                                                     |
|     |    | 116 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | u  | `   | 拉丁字母u                                           |
| 075 |    | `&# |                                                     |
|     |    | 117 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | v  | `   | 拉丁字母v                                           |
| 076 |    | `&# |                                                     |
|     |    | 118 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | w  | `   | 拉丁字母w                                           |
| 077 |    | `&# |                                                     |
|     |    | 119 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | x  | `   | 拉丁字母x                                           |
| 078 |    | `&# |                                                     |
|     |    | 120 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | y  | `   | 拉丁字母y                                           |
| 079 |    | `&# |                                                     |
|     |    | 121 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | z  | `   | 拉丁字母z                                           |
| 07A |    | `&# |                                                     |
|     |    | 122 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | {  | `   | `左花括号 <https://zh.wikipedia.org/wiki/花括號>`__ |
| 07B |    | `&# |                                                     |
|     |    | 123 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | \| | `   | `竖线 <https://zh.wikipedia.org/wiki/豎線>`__       |
| 07C |    | `&# |                                                     |
|     |    | 124 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | }  | `   | `右花括号 <https://zh.wikipedia.org/wiki/花括號>`__ |
| 07D |    | `&# |                                                     |
|     |    | 125 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+
| U+0 | ~  | `   | 波浪纹                                              |
| 07E |    | `&# |                                                     |
|     |    | 126 |                                                     |
|     |    | ;`` |                                                     |
+-----+----+-----+-----------------------------------------------------+

综上所述，我们可以这样简单总结下来：

+--------------------------------------------------------+---+---------+
| 字符集                                                 | 字 | Unicode |
|                                                        | 数 | 编码   |
+========================================================+===+=========+
| 数字0-9                                                | 1 | 30-39   |
|                                                        | 0 |         |
|                                                        | 字 |        |
+--------------------------------------------------------+---+---------+
| 小写英文字母                                           | 2 | 61-7a   |
|                                                        | 6 |         |
|                                                        | 字 |        |
+--------------------------------------------------------+---+---------+
| 大写英文字母                                           | 2 | 41-5a   |
|                                                        | 6 |         |
|                                                        | 字 |        |
+--------------------------------------------------------+---+---------+
| 标点及符号                                             | 3 | 20-2F   |
|                                                        | 2 | 3A-40   |
|                                                        | 字 | 5B-60  |
|                                                        |   | 7B-7E   |
+--------------------------------------------------------+---+---------+

-  数字0-9： 0123456789
-  小写英文字母： abcdefghijklmnopqrstuvwxyz
-  大写英文字母： ABCDEFGHIJKLMNOPQRSTUVWXYZ
-  标点及符号： :literal:`!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~`

.. code:: shell


    !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

ASCII码表
---------

ASCII 码使用指定的7 位或8 位二进制数组合来表示128 或256
种可能的字符。标准ASCII 码也叫基础ASCII码，使用7
位二进制数（剩下的1位二进制为0）来表示所有的大写和小写字母，数字0
到9、标点符号，以及在美式英语中使用的特殊控制字符 [4]_。

更详细的内容请参考： `ASCII <https://zh.wikipedia.org/wiki/ASCII>`__

+--------+--------+--------+----------+---------------------+---------+
| Bin(二 | Oct(八 | Dec(十 | Hex(十   | 缩写/字符           | 解释    |
| 进制)  | 进制)  | 进制)  | 六进制)  |                     |         |
+========+========+========+==========+=====================+=========+
| 0000   | 00     | 0      | 0x00     | NUL(null)           | 空字符  |
| 0000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 01     | 1      | 0x01     | SOH(start of        | 标      |
| 0001   |        |        |          | headline)           | 题开始  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 02     | 2      | 0x02     | STX (start of text) | 正      |
| 0010   |        |        |          |                     | 文开始  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 03     | 3      | 0x03     | ETX (end of text)   | 正      |
| 0011   |        |        |          |                     | 文结束  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 04     | 4      | 0x04     | EOT (end of         | 传      |
| 0100   |        |        |          | transmission)       | 输结束  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 05     | 5      | 0x05     | ENQ (enquiry)       | 请求    |
| 0101   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 06     | 6      | 0x06     | ACK (acknowledge)   | 收      |
| 0110   |        |        |          |                     | 到通知  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 07     | 7      | 0x07     | BEL (bell)          | 响铃    |
| 0111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 010    | 8      | 0x08     | BS (backspace)      | 退格    |
| 1000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 011    | 9      | 0x09     | HT (horizontal tab) | 水平    |
| 1001   |        |        |          |                     | 制表符  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 012    | 10     | 0x0A     | LF (NL line feed,   | 换行键  |
| 1010   |        |        |          | new line)           |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 013    | 11     | 0x0B     | VT (vertical tab)   | 垂直    |
| 1011   |        |        |          |                     | 制表符  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 014    | 12     | 0x0C     | FF (NP form feed,   | 换页键  |
| 1100   |        |        |          | new page)           |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 015    | 13     | 0x0D     | CR (carriage        | 回车键  |
| 1101   |        |        |          | return)             |         |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 016    | 14     | 0x0E     | SO (shift out)      | 不      |
| 1110   |        |        |          |                     | 用切换  |
+--------+--------+--------+----------+---------------------+---------+
| 0000   | 017    | 15     | 0x0F     | SI (shift in)       | 启      |
| 1111   |        |        |          |                     | 用切换  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 020    | 16     | 0x10     | DLE (data link      | 数据链  |
| 0000   |        |        |          | escape)             | 路转义  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 021    | 17     | 0x11     | DC1 (device control | 设      |
| 0001   |        |        |          | 1)                  | 备控制1 |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 022    | 18     | 0x12     | DC2 (device control | 设      |
| 0010   |        |        |          | 2)                  | 备控制2 |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 023    | 19     | 0x13     | DC3 (device control | 设      |
| 0011   |        |        |          | 3)                  | 备控制3 |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 024    | 20     | 0x14     | DC4 (device control | 设      |
| 0100   |        |        |          | 4)                  | 备控制4 |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 025    | 21     | 0x15     | NAK (negative       | 拒      |
| 0101   |        |        |          | acknowledge)        | 绝接收  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 026    | 22     | 0x16     | SYN (synchronous    | 同      |
| 0110   |        |        |          | idle)               | 步空闲  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 027    | 23     | 0x17     | ETB (end of trans.  | 结束    |
| 0111   |        |        |          | block)              | 传输块  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 030    | 24     | 0x18     | CAN (cancel)        | 取消    |
| 1000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 031    | 25     | 0x19     | EM (end of medium)  | 媒      |
| 1001   |        |        |          |                     | 介结束  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 032    | 26     | 0x1A     | SUB (substitute)    | 代替    |
| 1010   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 033    | 27     | 0x1B     | ESC (escape)        | 换码    |
| 1011   |        |        |          |                     | (溢出)  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 034    | 28     | 0x1C     | FS (file separator) | 文件    |
| 1100   |        |        |          |                     | 分隔符  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 035    | 29     | 0x1D     | GS (group           | 分组符  |
| 1101   |        |        |          | separator)          |         |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 036    | 30     | 0x1E     | RS (record          | 记录    |
| 1110   |        |        |          | separator)          | 分隔符  |
+--------+--------+--------+----------+---------------------+---------+
| 0001   | 037    | 31     | 0x1F     | US (unit separator) | 单元    |
| 1111   |        |        |          |                     | 分隔符  |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 040    | 32     | 0x20     | (space)             | 空格    |
| 0000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 041    | 33     | 0x21     | !                   | 叹号    |
| 0001   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 042    | 34     | 0x22     | ”                   | 双引号  |
| 0010   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 043    | 35     | 0x23     | #                   | 井号    |
| 0011   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 044    | 36     | 0x24     | $                   | 美元符  |
| 0100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 045    | 37     | 0x25     | %                   | 百分号  |
| 0101   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 046    | 38     | 0x26     | &                   | 和号    |
| 0110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 047    | 39     | 0x27     | ’                   | 闭      |
| 0111   |        |        |          |                     | 单引号  |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 050    | 40     | 0x28     | (                   | 开括号  |
| 1000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 051    | 41     | 0x29     | )                   | 闭括号  |
| 1001   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 052    | 42     | 0x2A     | \*                  | 星号    |
| 1010   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 053    | 43     | 0x2B     | +                   | 加号    |
| 1011   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 054    | 44     | 0x2C     | ,                   | 逗号    |
| 1100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 055    | 45     | 0x2D     | -                   | 减号    |
| 1101   |        |        |          |                     | /破折号 |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 056    | 46     | 0x2E     | .                   | 句号    |
| 1110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0010   | 057    | 47     | 0x2F     | /                   | 斜杠    |
| 1111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 060    | 48     | 0x30     | 0                   | 字符0   |
| 0000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 061    | 49     | 0x31     | 1                   | 字符1   |
| 0001   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 062    | 50     | 0x32     | 2                   | 字符2   |
| 0010   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 063    | 51     | 0x33     | 3                   | 字符3   |
| 0011   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 064    | 52     | 0x34     | 4                   | 字符4   |
| 0100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 065    | 53     | 0x35     | 5                   | 字符5   |
| 0101   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 066    | 54     | 0x36     | 6                   | 字符6   |
| 0110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 067    | 55     | 0x37     | 7                   | 字符7   |
| 0111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 070    | 56     | 0x38     | 8                   | 字符8   |
| 1000   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 071    | 57     | 0x39     | 9                   | 字符9   |
| 1001   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 072    | 58     | 0x3A     | :                   | 冒号    |
| 1010   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 073    | 59     | 0x3B     | ;                   | 分号    |
| 1011   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 074    | 60     | 0x3C     | <                   | 小于    |
| 1100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 075    | 61     | 0x3D     | =                   | 等号    |
| 1101   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 076    | 62     | 0x3E     | >                   | 大于    |
| 1110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0011   | 077    | 63     | 0x3F     | ?                   | 问号    |
| 1111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0100   | 64     | 0x40     | @                   | 电子邮  |
| 0000   |        |        |          |                     | 件符号  |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0101   | 65     | 0x41     | A                   | 大      |
| 0001   |        |        |          |                     | 写字母A |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0102   | 66     | 0x42     | B                   | 大      |
| 0010   |        |        |          |                     | 写字母B |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0103   | 67     | 0x43     | C                   | 大      |
| 0011   |        |        |          |                     | 写字母C |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0104   | 68     | 0x44     | D                   | 大      |
| 0100   |        |        |          |                     | 写字母D |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0105   | 69     | 0x45     | E                   | 大      |
| 0101   |        |        |          |                     | 写字母E |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0106   | 70     | 0x46     | F                   | 大      |
| 0110   |        |        |          |                     | 写字母F |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0107   | 71     | 0x47     | G                   | 大      |
| 0111   |        |        |          |                     | 写字母G |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0110   | 72     | 0x48     | H                   | 大      |
| 1000   |        |        |          |                     | 写字母H |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0111   | 73     | 0x49     | I                   | 大      |
| 1001   |        |        |          |                     | 写字母I |
+--------+--------+--------+----------+---------------------+---------+
| 01     | 0112   | 74     | 0x4A     | J                   | 大      |
| 001010 |        |        |          |                     | 写字母J |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0113   | 75     | 0x4B     | K                   | 大      |
| 1011   |        |        |          |                     | 写字母K |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0114   | 76     | 0x4C     | L                   | 大      |
| 1100   |        |        |          |                     | 写字母L |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0115   | 77     | 0x4D     | M                   | 大      |
| 1101   |        |        |          |                     | 写字母M |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0116   | 78     | 0x4E     | N                   | 大      |
| 1110   |        |        |          |                     | 写字母N |
+--------+--------+--------+----------+---------------------+---------+
| 0100   | 0117   | 79     | 0x4F     | O                   | 大      |
| 1111   |        |        |          |                     | 写字母O |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0120   | 80     | 0x50     | P                   | 大      |
| 0000   |        |        |          |                     | 写字母P |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0121   | 81     | 0x51     | Q                   | 大      |
| 0001   |        |        |          |                     | 写字母Q |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0122   | 82     | 0x52     | R                   | 大      |
| 0010   |        |        |          |                     | 写字母R |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0123   | 83     | 0x53     | S                   | 大      |
| 0011   |        |        |          |                     | 写字母S |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0124   | 84     | 0x54     | T                   | 大      |
| 0100   |        |        |          |                     | 写字母T |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0125   | 85     | 0x55     | U                   | 大      |
| 0101   |        |        |          |                     | 写字母U |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0126   | 86     | 0x56     | V                   | 大      |
| 0110   |        |        |          |                     | 写字母V |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0127   | 87     | 0x57     | W                   | 大      |
| 0111   |        |        |          |                     | 写字母W |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0130   | 88     | 0x58     | X                   | 大      |
| 1000   |        |        |          |                     | 写字母X |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0131   | 89     | 0x59     | Y                   | 大      |
| 1001   |        |        |          |                     | 写字母Y |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0132   | 90     | 0x5A     | Z                   | 大      |
| 1010   |        |        |          |                     | 写字母Z |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0133   | 91     | 0x5B     | [                   | 开      |
| 1011   |        |        |          |                     | 方括号  |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0134   | 92     | 0x5C     | \\                  | 反斜杠  |
| 1100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0135   | 93     | 0x5D     | ]                   | 闭      |
| 1101   |        |        |          |                     | 方括号  |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0136   | 94     | 0x5E     | ^                   | 脱字符  |
| 1110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0101   | 0137   | 95     | 0x5F     | \_                  | 下划线  |
| 1111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0140   | 96     | 0x60     | \`                  | 开      |
| 0000   |        |        |          |                     | 单引号  |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0141   | 97     | 0x61     | a                   | 小      |
| 0001   |        |        |          |                     | 写字母a |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0142   | 98     | 0x62     | b                   | 小      |
| 0010   |        |        |          |                     | 写字母b |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0143   | 99     | 0x63     | c                   | 小      |
| 0011   |        |        |          |                     | 写字母c |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0144   | 100    | 0x64     | d                   | 小      |
| 0100   |        |        |          |                     | 写字母d |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0145   | 101    | 0x65     | e                   | 小      |
| 0101   |        |        |          |                     | 写字母e |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0146   | 102    | 0x66     | f                   | 小      |
| 0110   |        |        |          |                     | 写字母f |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0147   | 103    | 0x67     | g                   | 小      |
| 0111   |        |        |          |                     | 写字母g |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0150   | 104    | 0x68     | h                   | 小      |
| 1000   |        |        |          |                     | 写字母h |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0151   | 105    | 0x69     | i                   | 小      |
| 1001   |        |        |          |                     | 写字母i |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0152   | 106    | 0x6A     | j                   | 小      |
| 1010   |        |        |          |                     | 写字母j |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0153   | 107    | 0x6B     | k                   | 小      |
| 1011   |        |        |          |                     | 写字母k |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0154   | 108    | 0x6C     | l                   | 小      |
| 1100   |        |        |          |                     | 写字母l |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0155   | 109    | 0x6D     | m                   | 小      |
| 1101   |        |        |          |                     | 写字母m |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0156   | 110    | 0x6E     | n                   | 小      |
| 1110   |        |        |          |                     | 写字母n |
+--------+--------+--------+----------+---------------------+---------+
| 0110   | 0157   | 111    | 0x6F     | o                   | 小      |
| 1111   |        |        |          |                     | 写字母o |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0160   | 112    | 0x70     | p                   | 小      |
| 0000   |        |        |          |                     | 写字母p |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0161   | 113    | 0x71     | q                   | 小      |
| 0001   |        |        |          |                     | 写字母q |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0162   | 114    | 0x72     | r                   | 小      |
| 0010   |        |        |          |                     | 写字母r |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0163   | 115    | 0x73     | s                   | 小      |
| 0011   |        |        |          |                     | 写字母s |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0164   | 116    | 0x74     | t                   | 小      |
| 0100   |        |        |          |                     | 写字母t |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0165   | 117    | 0x75     | u                   | 小      |
| 0101   |        |        |          |                     | 写字母u |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0166   | 118    | 0x76     | v                   | 小      |
| 0110   |        |        |          |                     | 写字母v |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0167   | 119    | 0x77     | w                   | 小      |
| 0111   |        |        |          |                     | 写字母w |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0170   | 120    | 0x78     | x                   | 小      |
| 1000   |        |        |          |                     | 写字母x |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0171   | 121    | 0x79     | y                   | 小      |
| 1001   |        |        |          |                     | 写字母y |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0172   | 122    | 0x7A     | z                   | 小      |
| 1010   |        |        |          |                     | 写字母z |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0173   | 123    | 0x7B     | {                   | 开      |
| 1011   |        |        |          |                     | 花括号  |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0174   | 124    | 0x7C     | \|                  | 垂线    |
| 1100   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0175   | 125    | 0x7D     | }                   | 闭      |
| 1101   |        |        |          |                     | 花括号  |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0176   | 126    | 0x7E     | ~                   | 波浪号  |
| 1110   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+
| 0111   | 0177   | 127    | 0x7F     | DEL (delete)        | 删除    |
| 1111   |        |        |          |                     |         |
+--------+--------+--------+----------+---------------------+---------+

.. code:: shell

   !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

字体转换工具

lvgl官方在线转换工具
--------------------

lvgl官方提供的字体转换器已经非常好了，只要手里有字体文件之后就可以提取转换想要的字体。

lvgl官方字体转换器地址： https://lvgl.io/tools/fontconverter

使用教程
--------

-  https://www.bilibili.com/video/BV1Ya411r7K2?p=15

--------------

本站提供的内容仅用于个人学习、研究或欣赏。我们不保证内容的正确性。通过使用本站内容随之而来的风险与本站无关！

访问者可将本网站提供的内容或服务用于个人学习、研究或欣赏，以及其他非商业性或非盈利性用途，但同时应遵守著作权法及其他相关法律的规定，不得侵犯本网站及相关权利人的合法权利。

本网站内容原作者如不愿意在本网站刊登内容，请及时通知本站，予以删除。

.. [1]
   https://zh.wikipedia.org/wiki/Unicode

.. [2]
   https://zh.wikipedia.org/wiki/%E4%B8%AD%E6%97%A5%E9%9F%93%E7%B5%B1%E4%B8%80%E8%A1%A8%E6%84%8F%E6%96%87%E5%AD%97

.. [3]
   https://zh.wikipedia.org/wiki/Unicode%E5%AD%97%E7%AC%A6%E5%88%97%E8%A1%A8

.. [4]
   https://zh.wikipedia.org/wiki/ASCII

.. |SiYuanHeiTi-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Bold.jpg
.. |SiYuanHeiTi-CN-VF| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-CN-VF.jpg
.. |SiYuanHeiTi-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-ExtraLight.jpg
.. |SiYuanHeiTi-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Heavy.jpg
.. |SiYuanHeiTi-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Light.jpg
.. |SiYuanHeiTi-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Medium.jpg
.. |SiYuanHeiTi-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Normal.jpg
.. |SiYuanHeiTi-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Regular.jpg
.. |SiYuanHeiTiGoogleBan| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiGoogleBan.jpg
.. |SiYuanHeiTiJiuZiXing-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Bold.jpg
.. |SiYuanHeiTiJiuZiXing-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-ExtraLight.jpg
.. |SiYuanHeiTiJiuZiXing-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Heavy.jpg
.. |SiYuanHeiTiJiuZiXing-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Light.jpg
.. |SiYuanHeiTiJiuZiXing-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Medium.jpg
.. |SiYuanHeiTiJiuZiXing-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Normal.jpg
.. |SiYuanHeiTiJiuZiXing-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Regular.jpg
.. |SiYuanRouHei-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Bold.jpg
.. |SiYuanRouHei-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-ExtraLight.jpg
.. |SiYuanRouHei-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Heavy.jpg
.. |SiYuanRouHei-IOS8| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-IOS8.jpg
.. |SiYuanRouHei-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Light.jpg
.. |SiYuanRouHei-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Medium.jpg
.. |SiYuanRouHei-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Normal.jpg
.. |SiYuanRouHei-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Regular.jpg
.. |SiYuanRouHeiDengKuanBan-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Bold.jpg
.. |SiYuanRouHeiDengKuanBan-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-ExtraLight.jpg
.. |SiYuanRouHeiDengKuanBan-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Heavy.jpg
.. |SiYuanRouHeiDengKuanBan-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Light.jpg
.. |SiYuanRouHeiDengKuanBan-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Medium.jpg
.. |SiYuanRouHeiDengKuanBan-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Normal.jpg
.. |SiYuanRouHeiDengKuanBan-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Regular.jpg
.. |SiYuanSongTiRegular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanSongTiRegular.jpg
.. |SiYuanZhenHei-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Bold.jpg
.. |SiYuanZhenHei-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-ExtraLight.jpg
.. |SiYuanZhenHei-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Heavy.jpg
.. |SiYuanZhenHei-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Light.jpg
.. |SiYuanZhenHei-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Medium.jpg
.. |SiYuanZhenHei-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Normal.jpg
.. |SiYuanZhenHei-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Regular.jpg
.. |SiYuanZhenHeiDengKuanBan-Bold| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Bold.jpg
.. |SiYuanZhenHeiDengKuanBan-ExtraLight| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-ExtraLight.jpg
.. |SiYuanZhenHeiDengKuanBan-Heavy| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Heavy.jpg
.. |SiYuanZhenHeiDengKuanBan-Light| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Light.jpg
.. |SiYuanZhenHeiDengKuanBan-Medium| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Medium.jpg
.. |SiYuanZhenHeiDengKuanBan-Normal| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Normal.jpg
.. |SiYuanZhenHeiDengKuanBan-Regular| image:: http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Regular.jpg
