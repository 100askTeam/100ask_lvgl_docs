```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/100ask_project/espressif-esp32.md
```

# 显示中文

要在lvgl中使用中文显示，我们需要用到两个东西：字体文件和字体转换器。

字体文件我们可以使用开源的字体或者自己制作出来，准备好了字体文件之后使用字体转换器即可转换成可以在lvgl上使用的字体格式。

下面给提供了开源可免费商用的字体文件共大家使用，下载好字体文件之后，再使用字体转换器转换字体即可。


## 中文字体文件

### 思源字体


|  字体预览   |  下载字体  |
|  :----  | ----  |
| ![SiYuanHeiTi-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Bold.jpg)  | [SiYuanHeiTi-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Bold.zip) |
| ![SiYuanHeiTi-CN-VF](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-CN-VF.jpg)  | [SiYuanHeiTi-CN-VF](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-CN-VF.zip) |
| ![SiYuanHeiTi-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-ExtraLight.jpg)  | [SiYuanHeiTi-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-ExtraLight.zip) |
| ![SiYuanHeiTi-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Heavy.jpg)  | [SiYuanHeiTi-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Heavy.zip) |
| ![SiYuanHeiTi-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Light.jpg)  | [SiYuanHeiTi-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Light.zip) |
| ![SiYuanHeiTi-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Medium.jpg)  | [SiYuanHeiTi-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Medium.zip) |
| ![SiYuanHeiTi-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Normal.jpg)  | [SiYuanHeiTi-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Normal.zip) |
| ![SiYuanHeiTi-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Regular.jpg)  | [SiYuanHeiTi-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTi-Regular.zip) |
| ![SiYuanHeiTiGoogleBan](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiGoogleBan.jpg)  | [SiYuanHeiTiGoogleBan](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiGoogleBan.zip) |
| ![SiYuanHeiTiJiuZiXing-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Bold.jpg)  | [SiYuanHeiTiJiuZiXing-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Bold.zip) |
| ![SiYuanHeiTiJiuZiXing-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-ExtraLight.jpg)  | [SiYuanHeiTiJiuZiXing-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-ExtraLight.zip) |
| ![SiYuanHeiTiJiuZiXing-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Heavy.jpg)  | [SiYuanHeiTiJiuZiXing-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Heavy.zip) |
| ![SiYuanHeiTiJiuZiXing-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Light.jpg)  | [SiYuanHeiTiJiuZiXing-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Light.zip) |
| ![SiYuanHeiTiJiuZiXing-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Medium.jpg)  | [SiYuanHeiTiJiuZiXing-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Medium.zip) |
| ![SiYuanHeiTiJiuZiXing-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Normal.jpg)  | [SiYuanHeiTiJiuZiXing-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Normal.zip) |
| ![SiYuanHeiTiJiuZiXing-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Regular.jpg)  | [SiYuanHeiTiJiuZiXing-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanHeiTiJiuZiXing-Regular.zip) |
| ![SiYuanRouHei-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Bold.jpg)  | [SiYuanRouHei-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Bold.zip) |
| ![SiYuanRouHei-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-ExtraLight.jpg)  | [SiYuanRouHei-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-ExtraLight.zip) |
| ![SiYuanRouHei-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Heavy.jpg)  | [SiYuanRouHei-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Heavy.zip) |
| ![SiYuanRouHei-IOS8](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-IOS8.jpg)  | [SiYuanRouHei-IOS8](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-IOS8.zip) |
| ![SiYuanRouHei-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Light.jpg)  | [SiYuanRouHei-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Light.zip) |
| ![SiYuanRouHei-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Medium.jpg)  | [SiYuanRouHei-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Medium.zip) |
| ![SiYuanRouHei-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Normal.jpg)  | [SiYuanRouHei-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Normal.zip) |
| ![SiYuanRouHei-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Regular.jpg)  | [SiYuanRouHei-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHei-Regular.zip) |
| ![SiYuanRouHeiDengKuanBan-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Bold.jpg)  | [SiYuanRouHeiDengKuanBan-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Bold.zip) |
| ![SiYuanRouHeiDengKuanBan-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-ExtraLight.jpg)  | [SiYuanRouHeiDengKuanBan-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-ExtraLight.zip) |
| ![SiYuanRouHeiDengKuanBan-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Heavy.jpg)  | [SiYuanRouHeiDengKuanBan-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Heavy.zip) |
| ![SiYuanRouHeiDengKuanBan-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Light.jpg)  | [SiYuanRouHeiDengKuanBan-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Light.zip) |
| ![SiYuanRouHeiDengKuanBan-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Medium.jpg)  | [SiYuanRouHeiDengKuanBan-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Medium.zip) |
| ![SiYuanRouHeiDengKuanBan-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Normal.jpg)  | [SiYuanRouHeiDengKuanBan-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Normal.zip) |
| ![SiYuanRouHeiDengKuanBan-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Regular.jpg)  | [SiYuanRouHeiDengKuanBan-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanRouHeiDengKuanBan-Regular.zip) |
| ![SiYuanSongTiRegular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanSongTiRegular.jpg)  | [SiYuanSongTiRegular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanSongTiRegular.zip) |
| ![SiYuanZhenHei-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Bold.jpg)  | [SiYuanZhenHei-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Bold.zip) |
| ![SiYuanZhenHei-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-ExtraLight.jpg)  | [SiYuanZhenHei-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-ExtraLight.zip) |
| ![SiYuanZhenHei-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Heavy.jpg)  | [SiYuanZhenHei-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Heavy.zip) |
| ![SiYuanZhenHei-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Light.jpg)  | [SiYuanZhenHei-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Light.zip) |
| ![SiYuanZhenHei-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Medium.jpg)  | [SiYuanZhenHei-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Medium.zip) |
| ![SiYuanZhenHei-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Normal.jpg)  | [SiYuanZhenHei-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Normal.zip) |
| ![SiYuanZhenHei-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Regular.jpg)  | [SiYuanZhenHei-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHei-Regular.zip) |
| ![SiYuanZhenHeiDengKuanBan-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Bold.jpg)  | [SiYuanZhenHeiDengKuanBan-Bold](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Bold.zip) |
| ![SiYuanZhenHeiDengKuanBan-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-ExtraLight.jpg)  | [SiYuanZhenHeiDengKuanBan-ExtraLight](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-ExtraLight.zip) |
| ![SiYuanZhenHeiDengKuanBan-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Heavy.jpg)  | [SiYuanZhenHeiDengKuanBan-Heavy](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Heavy.zip) |
| ![SiYuanZhenHeiDengKuanBan-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Light.jpg)  | [SiYuanZhenHeiDengKuanBan-Light](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Light.zip) |
| ![SiYuanZhenHeiDengKuanBan-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Medium.jpg)  | [SiYuanZhenHeiDengKuanBan-Medium](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Medium.zip) |
| ![SiYuanZhenHeiDengKuanBan-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Normal.jpg)  | [SiYuanZhenHeiDengKuanBan-Normal](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Normal.zip) |
| ![SiYuanZhenHeiDengKuanBan-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Regular.jpg)  | [SiYuanZhenHeiDengKuanBan-Regular](http://photos.100ask.net/lvgl/00_100ask_tools/fonts-zh-source/SiYuanZhenHeiDengKuanBan-Regular.zip) |


### 更多字体

TODO

## 字符集编码范围
### 汉字 Unicode 编码范围

Unicode 是全球文字统一编码。它把世界上的各种文字的每一个字符指定唯一编码，实现跨语种、跨平台的应用。

中文用户最常接触的是汉字 Unicode 编码。中文字符数量巨大，日常使用的汉字数量有数千个，再加上生僻字，数量达到数万个。这个表格将中文字符集的 Unicode 编码范围列出：


| **字符集**                                                   | **字数** | **Unicode 编码** |
| ------------------------------------------------------------ | -------- | ---------------- |
| [基本汉字](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhz) | 20902字  | 4E00-9FA5        |
| [基本汉字补充](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jbhzbc) | 90字     | 9FA6-9FFF        |
| [扩展A](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kza) | 6592字   | 3400-4DBF        |
| [扩展B](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzb) | 42720字  | 20000-2A6DF      |
| [扩展C](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzc) | 4153字   | 2A700-2B738      |
| [扩展D](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzd) | 222字    | 2B740-2B81D      |
| [扩展E](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kze) | 5762字   | 2B820-2CEA1      |
| [扩展F](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzf) | 7473字   | 2CEB0-2EBE0      |
| [扩展G](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kzg) | 4939字   | 30000-3134A      |
| [康熙部首](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=kxbs) | 214字    | 2F00-2FD5        |
| [部首扩展](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=bskz) | 115字    | 2E80-2EF3        |
| [兼容汉字](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jrhz) | 477字    | F900-FAD9        |
| [兼容扩展](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=jrkz) | 542字    | 2F800-2FA1D      |
| [PUA(GBK)部件](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=puabj) | 81字     | E815-E86F        |
| [部件扩展](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=bjkz) | 452字    | E400-E5E8        |
| [PUA增补](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=puazb) | 207字    | E600-E6CF        |
| [汉字笔画](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hzbh) | 36字     | 31C0-31E3        |
| [汉字结构](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hzjg) | 12字     | 2FF0-2FFB        |
| [汉语注音](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=hyzy) | 43字     | 3105-312F        |
| [注音扩展](https://www.qqxiuzi.cn/zh/hanzi-unicode-bianma.php?zfj=zykz) | 22字     | 31A0-31BA        |
| 〇                                                           | 1字      | 3007             |


### ASCII码表

ASCII 码使用指定的7 位或8 位二进制数组合来表示128 或256 种可能的字符。标准ASCII 码也叫基础ASCII码，使用7 位二进制数（剩下的1位二进制为0）来表示所有的大写和小写字母，数字0 到9、标点符号，以及在美式英语中使用的特殊控制字符。

| Bin(二进制) | Oct(八进制) | Dec(十进制) | Hex(十六进制) | 缩写/字符                   | 解释         |
| ----------- | ----------- | ----------- | ------------- | --------------------------- | ------------ |
| 0000 0000   | 00          | 0           | 0x00          | NUL(null)                   | 空字符       |
| 0000 0001   | 01          | 1           | 0x01          | SOH(start of headline)      | 标题开始     |
| 0000 0010   | 02          | 2           | 0x02          | STX (start of text)         | 正文开始     |
| 0000 0011   | 03          | 3           | 0x03          | ETX (end of text)           | 正文结束     |
| 0000 0100   | 04          | 4           | 0x04          | EOT (end of transmission)   | 传输结束     |
| 0000 0101   | 05          | 5           | 0x05          | ENQ (enquiry)               | 请求         |
| 0000 0110   | 06          | 6           | 0x06          | ACK (acknowledge)           | 收到通知     |
| 0000 0111   | 07          | 7           | 0x07          | BEL (bell)                  | 响铃         |
| 0000 1000   | 010         | 8           | 0x08          | BS (backspace)              | 退格         |
| 0000 1001   | 011         | 9           | 0x09          | HT (horizontal tab)         | 水平制表符   |
| 0000 1010   | 012         | 10          | 0x0A          | LF (NL line feed, new line) | 换行键       |
| 0000 1011   | 013         | 11          | 0x0B          | VT (vertical tab)           | 垂直制表符   |
| 0000 1100   | 014         | 12          | 0x0C          | FF (NP form feed, new page) | 换页键       |
| 0000 1101   | 015         | 13          | 0x0D          | CR (carriage return)        | 回车键       |
| 0000 1110   | 016         | 14          | 0x0E          | SO (shift out)              | 不用切换     |
| 0000 1111   | 017         | 15          | 0x0F          | SI (shift in)               | 启用切换     |
| 0001 0000   | 020         | 16          | 0x10          | DLE (data link escape)      | 数据链路转义 |
| 0001 0001   | 021         | 17          | 0x11          | DC1 (device control 1)      | 设备控制1    |
| 0001 0010   | 022         | 18          | 0x12          | DC2 (device control 2)      | 设备控制2    |
| 0001 0011   | 023         | 19          | 0x13          | DC3 (device control 3)      | 设备控制3    |
| 0001 0100   | 024         | 20          | 0x14          | DC4 (device control 4)      | 设备控制4    |
| 0001 0101   | 025         | 21          | 0x15          | NAK (negative acknowledge)  | 拒绝接收     |
| 0001 0110   | 026         | 22          | 0x16          | SYN (synchronous idle)      | 同步空闲     |
| 0001 0111   | 027         | 23          | 0x17          | ETB (end of trans. block)   | 结束传输块   |
| 0001 1000   | 030         | 24          | 0x18          | CAN (cancel)                | 取消         |
| 0001 1001   | 031         | 25          | 0x19          | EM (end of medium)          | 媒介结束     |
| 0001 1010   | 032         | 26          | 0x1A          | SUB (substitute)            | 代替         |
| 0001 1011   | 033         | 27          | 0x1B          | ESC (escape)                | 换码(溢出)   |
| 0001 1100   | 034         | 28          | 0x1C          | FS (file separator)         | 文件分隔符   |
| 0001 1101   | 035         | 29          | 0x1D          | GS (group separator)        | 分组符       |
| 0001 1110   | 036         | 30          | 0x1E          | RS (record separator)       | 记录分隔符   |
| 0001 1111   | 037         | 31          | 0x1F          | US (unit separator)         | 单元分隔符   |
| 0010 0000   | 040         | 32          | 0x20          | (space)                     | 空格         |
| 0010 0001   | 041         | 33          | 0x21          | !                           | 叹号         |
| 0010 0010   | 042         | 34          | 0x22          | "                           | 双引号       |
| 0010 0011   | 043         | 35          | 0x23          | #                           | 井号         |
| 0010 0100   | 044         | 36          | 0x24          | $                           | 美元符       |
| 0010 0101   | 045         | 37          | 0x25          | %                           | 百分号       |
| 0010 0110   | 046         | 38          | 0x26          | &                           | 和号         |
| 0010 0111   | 047         | 39          | 0x27          | '                           | 闭单引号     |
| 0010 1000   | 050         | 40          | 0x28          | (                           | 开括号       |
| 0010 1001   | 051         | 41          | 0x29          | )                           | 闭括号       |
| 0010 1010   | 052         | 42          | 0x2A          | *                           | 星号         |
| 0010 1011   | 053         | 43          | 0x2B          | +                           | 加号         |
| 0010 1100   | 054         | 44          | 0x2C          | ,                           | 逗号         |
| 0010 1101   | 055         | 45          | 0x2D          | -                           | 减号/破折号  |
| 0010 1110   | 056         | 46          | 0x2E          | .                           | 句号         |
| 0010 1111   | 057         | 47          | 0x2F          | /                           | 斜杠         |
| 0011 0000   | 060         | 48          | 0x30          | 0                           | 字符0        |
| 0011 0001   | 061         | 49          | 0x31          | 1                           | 字符1        |
| 0011 0010   | 062         | 50          | 0x32          | 2                           | 字符2        |
| 0011 0011   | 063         | 51          | 0x33          | 3                           | 字符3        |
| 0011 0100   | 064         | 52          | 0x34          | 4                           | 字符4        |
| 0011 0101   | 065         | 53          | 0x35          | 5                           | 字符5        |
| 0011 0110   | 066         | 54          | 0x36          | 6                           | 字符6        |
| 0011 0111   | 067         | 55          | 0x37          | 7                           | 字符7        |
| 0011 1000   | 070         | 56          | 0x38          | 8                           | 字符8        |
| 0011 1001   | 071         | 57          | 0x39          | 9                           | 字符9        |
| 0011 1010   | 072         | 58          | 0x3A          | :                           | 冒号         |
| 0011 1011   | 073         | 59          | 0x3B          | ;                           | 分号         |
| 0011 1100   | 074         | 60          | 0x3C          | <                           | 小于         |
| 0011 1101   | 075         | 61          | 0x3D          | =                           | 等号         |
| 0011 1110   | 076         | 62          | 0x3E          | >                           | 大于         |
| 0011 1111   | 077         | 63          | 0x3F          | ?                           | 问号         |
| 0100 0000   | 0100        | 64          | 0x40          | @                           | 电子邮件符号 |
| 0100 0001   | 0101        | 65          | 0x41          | A                           | 大写字母A    |
| 0100 0010   | 0102        | 66          | 0x42          | B                           | 大写字母B    |
| 0100 0011   | 0103        | 67          | 0x43          | C                           | 大写字母C    |
| 0100 0100   | 0104        | 68          | 0x44          | D                           | 大写字母D    |
| 0100 0101   | 0105        | 69          | 0x45          | E                           | 大写字母E    |
| 0100 0110   | 0106        | 70          | 0x46          | F                           | 大写字母F    |
| 0100 0111   | 0107        | 71          | 0x47          | G                           | 大写字母G    |
| 0100 1000   | 0110        | 72          | 0x48          | H                           | 大写字母H    |
| 0100 1001   | 0111        | 73          | 0x49          | I                           | 大写字母I    |
| 01001010    | 0112        | 74          | 0x4A          | J                           | 大写字母J    |
| 0100 1011   | 0113        | 75          | 0x4B          | K                           | 大写字母K    |
| 0100 1100   | 0114        | 76          | 0x4C          | L                           | 大写字母L    |
| 0100 1101   | 0115        | 77          | 0x4D          | M                           | 大写字母M    |
| 0100 1110   | 0116        | 78          | 0x4E          | N                           | 大写字母N    |
| 0100 1111   | 0117        | 79          | 0x4F          | O                           | 大写字母O    |
| 0101 0000   | 0120        | 80          | 0x50          | P                           | 大写字母P    |
| 0101 0001   | 0121        | 81          | 0x51          | Q                           | 大写字母Q    |
| 0101 0010   | 0122        | 82          | 0x52          | R                           | 大写字母R    |
| 0101 0011   | 0123        | 83          | 0x53          | S                           | 大写字母S    |
| 0101 0100   | 0124        | 84          | 0x54          | T                           | 大写字母T    |
| 0101 0101   | 0125        | 85          | 0x55          | U                           | 大写字母U    |
| 0101 0110   | 0126        | 86          | 0x56          | V                           | 大写字母V    |
| 0101 0111   | 0127        | 87          | 0x57          | W                           | 大写字母W    |
| 0101 1000   | 0130        | 88          | 0x58          | X                           | 大写字母X    |
| 0101 1001   | 0131        | 89          | 0x59          | Y                           | 大写字母Y    |
| 0101 1010   | 0132        | 90          | 0x5A          | Z                           | 大写字母Z    |
| 0101 1011   | 0133        | 91          | 0x5B          | [                           | 开方括号     |
| 0101 1100   | 0134        | 92          | 0x5C          | \                           | 反斜杠       |
| 0101 1101   | 0135        | 93          | 0x5D          | ]                           | 闭方括号     |
| 0101 1110   | 0136        | 94          | 0x5E          | ^                           | 脱字符       |
| 0101 1111   | 0137        | 95          | 0x5F          | _                           | 下划线       |
| 0110 0000   | 0140        | 96          | 0x60          | `                           | 开单引号     |
| 0110 0001   | 0141        | 97          | 0x61          | a                           | 小写字母a    |
| 0110 0010   | 0142        | 98          | 0x62          | b                           | 小写字母b    |
| 0110 0011   | 0143        | 99          | 0x63          | c                           | 小写字母c    |
| 0110 0100   | 0144        | 100         | 0x64          | d                           | 小写字母d    |
| 0110 0101   | 0145        | 101         | 0x65          | e                           | 小写字母e    |
| 0110 0110   | 0146        | 102         | 0x66          | f                           | 小写字母f    |
| 0110 0111   | 0147        | 103         | 0x67          | g                           | 小写字母g    |
| 0110 1000   | 0150        | 104         | 0x68          | h                           | 小写字母h    |
| 0110 1001   | 0151        | 105         | 0x69          | i                           | 小写字母i    |
| 0110 1010   | 0152        | 106         | 0x6A          | j                           | 小写字母j    |
| 0110 1011   | 0153        | 107         | 0x6B          | k                           | 小写字母k    |
| 0110 1100   | 0154        | 108         | 0x6C          | l                           | 小写字母l    |
| 0110 1101   | 0155        | 109         | 0x6D          | m                           | 小写字母m    |
| 0110 1110   | 0156        | 110         | 0x6E          | n                           | 小写字母n    |
| 0110 1111   | 0157        | 111         | 0x6F          | o                           | 小写字母o    |
| 0111 0000   | 0160        | 112         | 0x70          | p                           | 小写字母p    |
| 0111 0001   | 0161        | 113         | 0x71          | q                           | 小写字母q    |
| 0111 0010   | 0162        | 114         | 0x72          | r                           | 小写字母r    |
| 0111 0011   | 0163        | 115         | 0x73          | s                           | 小写字母s    |
| 0111 0100   | 0164        | 116         | 0x74          | t                           | 小写字母t    |
| 0111 0101   | 0165        | 117         | 0x75          | u                           | 小写字母u    |
| 0111 0110   | 0166        | 118         | 0x76          | v                           | 小写字母v    |
| 0111 0111   | 0167        | 119         | 0x77          | w                           | 小写字母w    |
| 0111 1000   | 0170        | 120         | 0x78          | x                           | 小写字母x    |
| 0111 1001   | 0171        | 121         | 0x79          | y                           | 小写字母y    |
| 0111 1010   | 0172        | 122         | 0x7A          | z                           | 小写字母z    |
| 0111 1011   | 0173        | 123         | 0x7B          | {                           | 开花括号     |
| 0111 1100   | 0174        | 124         | 0x7C          | \|                          | 垂线         |
| 0111 1101   | 0175        | 125         | 0x7D          | }                           | 闭花括号     |
| 0111 1110   | 0176        | 126         | 0x7E          | ~                           | 波浪号       |
| 0111 1111   | 0177        | 127         | 0x7F          | DEL (delete)                | 删除         |


```shell
!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
```


## 字体转换工具

### lvgl官方在线转换工具

lvgl官方提供的字体转换器已经非常好了，只要手里有字体文件之后就可以提取转换想要的字体。

lvgl官方字体转换器地址： [https://lvgl.io/tools/fontconverter](https://lvgl.io/tools/fontconverter)



使用教程： TODO




-----------------------------------
> 本站提供的内容仅用于个人学习、研究或欣赏。我们不保证内容的正确性。通过使用本站内容随之而来的风险与本站无关
>
> 访问者可将本网站提供的内容或服务用于个人学习、研究或欣赏，以及其他非商业性或非盈利性用途，但同时应遵守著作权法及其他相关法律的规定，不得侵犯本网站及相关权利人的合法权利。
>
> 本网站内容原作者如不愿意在本网站刊登内容，请及时通知本站，予以删除。