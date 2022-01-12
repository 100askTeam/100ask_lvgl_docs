```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/100ask_project/espressif-esp32.md
```

# 显示中文

要在lvgl中使用中文显示，我们需要用到两个东西：字体文件和字体转换器。

字体文件我们可以使用开源的字体或者自己制作出来，准备好了字体文件之后使用字体转换器即可转换成可以在lvgl上使用的字体格式。

下面给提供了开源可免费商用的字体文件共大家使用，下载好字体文件之后，再使用字体转换器转换字体即可。


## 中文字体文件

### 思源字体(简体中文)


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

## 字体转换工具

### lvgl官方在线转换工具
lvgl官方提供的字体转换器已经非常好了，只要手里有字体文件之后就可以提取转换想要的字体。

lvgl官方字体转换器地址： https://lvgl.io/tools/fontconverter

使用教程： TODO

