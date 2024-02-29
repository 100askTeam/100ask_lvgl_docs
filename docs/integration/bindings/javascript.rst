==========
JavaScript
==========

.. raw:: html

   <details>
     <summary>显示原文</summary>

With `lv_binding_js <https://github.com/lvgl/lv_binding_js>`__ you can
write lvgl with JavaScript.

It uses React's virtual DOM concept to manipulate lvgl UI components,
providing a familiar React-like experience to users.

**Code**

**Code Running on Real Device**

.. raw:: html

   </details>
   <br>


使用 `lv_binding_js <https://github.com/lvgl/lv_binding_js>`__ 你可以用JavaScript编写lvgl。

它利用了React的虚拟DOM概念来操纵lvgl的UI组件，为用户提供了一个熟悉的类React体验。

**代码**

**代码在真实设备上运行**


Table of Contents（目录）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `Features <#features>`__
-  `Demo <#demo>`__
-  `Building <#building>`__
-  `Components <#components>`__
-  `Font <#font>`__
-  `Animation <#animation>`__
-  `Style <#style>`__
-  `JSAPI <#jsapi>`__
-  `Thanks <#thanks>`__

.. raw:: html

   </details>
   <br>


-  `功能 <#features>`__
-  `演示 <#demo>`__
-  `构建 <#building>`__
-  `组件 <#components>`__
-  `字体 <#font>`__
-  `动画 <#animation>`__
-  `样式 <#style>`__
-  `JSAPI <#jsapi>`__
-  `感谢 <#thanks>`__


Features（功能）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Support all lvgl built-in components
-  Fully support lvgl flex and grid style
-  support most lvgl style, just write like html5 css
-  support dynamic load image
-  Fully support lvgl animation

.. raw:: html

   </details>
   <br>


- 支持所有LVGL内置组件
- 完全支持LVGL的flex和grid样式
- 支持大多数LVGL样式，只需像HTML5 CSS一样编写
- 支持动态加载图片
- 完全支持LVGL动画功能


Demo（演示）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

See the
`demo <https://github.com/lvgl/lv_binding_js/tree/master/demo>`__ folder

.. raw:: html

   </details>
   <br>


查看
`演示 <https://github.com/lvgl/lv_binding_js/tree/master/demo>`__ 文件夹

   
Building（构建）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following are developer notes on how to build lvgljs on your native
platform. They are not complete guides, but include notes on the
necessary libraries, compile flags, etc.

.. raw:: html

   </details>
   <br>


以下是有关如何在本地平台上构建 lvgljs 的开发者注释。这些不是完整的指南，但包括了必要的库、编译标志等方面的注释。


lvgljs
~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `ubuntu build Notes for sdl
   simulator <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-ubuntu-arm.md>`__
-  `macos x86 build Notes for sdl
   simulator <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-macos-x86-simulator.md>`__
-  `ubuntu build Notes for platform
   arm <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-ubuntu-x86-simulator.md>`__

.. raw:: html

   </details>
   <br>


- `在SDL模拟器上构建Ubuntu的说明，请参考此链接: <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-ubuntu-arm.md>`__
- `在SDL模拟器上构建macOS x86的说明，请参考此链接: <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-macos-x86-simulator.md>`__
- `在ARM平台上构建Ubuntu的说明，请参考此链接: <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/build-ubuntu-x86-simulator.md>`__


JS Bundle（JS捆绑）
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `JS Bundle build
   Notes <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/js-bundle.md>`__

.. raw:: html

   </details>
   <br>


-  `JS捆绑构建
   注意 <https://github.com/lvgl/lv_binding_js/blob/master/doc/build/js-bundle.md>`__


Components（部件）
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `View <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/View.md>`__
-  `Image <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Image.md>`__
-  `Button <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Button.md>`__
-  `Text <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Text.md>`__
-  `Input <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Input.md>`__
-  `Textarea <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Textarea.md>`__
-  `Switch <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Switch.md>`__
-  `Checkbox <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Checkbox.md>`__
-  `Dropdownlist <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Dropdownlist.md>`__
-  `ProgressBar <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/ProgressBar.md>`__
-  `Line <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Line.md>`__
-  `Roller <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Roller.md>`__
-  `Keyboard <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Keyboard.md>`__
-  `Calendar <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Calendar.md>`__
-  `Chart <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Chart.md>`__

.. raw:: html

   </details>
   <br>


- `查看 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/View.md>`__
- `图像 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Image.md>`__
- `按钮 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Button.md>`__
- `文本 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Text.md>`__
- `输入 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Input.md>`__
- `文本区 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Textarea.md>`__
- `开关 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Switch.md>`__
- `复选框 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Checkbox.md>`__
- `下拉列表 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Dropdownlist.md>`__
- `进度条 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/ProgressBar.md>`__
- `线条 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Line.md>`__
- `滚轮 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Roller.md>`__
- `键盘 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Keyboard.md>`__
- `日历 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Calendar.md>`__
- `图表 <https://github.com/lvgl/lv_binding_js/blob/master/doc/component/Chart.md>`__


Font（字体）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Builtin-Symbol <https://github.com/lvgl/lv_binding_js/blob/master/doc/Symbol/symbol.md>`__

.. raw:: html

   </details>
   <br>


`内置符号 <https://github.com/lvgl/lv_binding_js/blob/master/doc/Symbol/symbol.md>`__


Animation（动画）
---------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Animation <https://github.com/lvgl/lv_binding_js/blob/master/doc/animate/animate.md>`__

.. raw:: html

   </details>
   <br>


`动画 <https://github.com/lvgl/lv_binding_js/blob/master/doc/animate/animate.md>`__


Style（风格）
-------------

.. include::https://github.com/lvgl/lv_binding_js/blob/master/doc/style/position-size-layout.md

-  `position-size-layout <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/position-size-layout.md>`__
-  `boxing-model <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/boxing-model.md>`__
-  `color <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/color.md>`__
-  `flex <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/flex.md>`__
-  `grid <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/grid.md>`__
-  `font <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/font.md>`__
-  `opacity <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/opacity.md>`__
-  `display <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/display.md>`__
-  `background <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/background.md>`__
-  `scroll <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/scroll.md>`__
-  `shadow <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/shadow.md>`__
-  `recolor <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/recolor.md>`__
-  `line <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/line.md>`__
-  `transition <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/transition.md>`__
-  `transform <https://github.com/lvgl/lv_binding_js/blob/master/doc/style/transform.md>`__

JSAPI
-----

-  `network <https://github.com/lvgl/lv_binding_js/blob/master/doc/jsapi/network.md>`__
-  `filesystem <https://github.com/lvgl/lv_binding_js/blob/master/doc/jsapi/fs.md>`__
-  `dimension <https://github.com/lvgl/lv_binding_js/blob/master/doc/jsapi/dimension.md>`__

Thanks（感谢）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

lvgljs depends on following excellent work

`lvgl <https://github.com/lvgl/lvgl>`__: Create beautiful UIs for any
MCU, MPU and display type `QuickJS <https://bellard.org/quickjs/>`__:
JavaScript engine `libuv <https://github.com/libuv/libuv>`__: platform
abstraction layer `curl <https://github.com/curl/curl>`__: HTTP client
`txiki.js <https://github.com/saghul/txiki.js>`__: Tiny JavaScript
runtime

.. raw:: html

   </details>
   <br>


lvgljs依赖于以下优秀的工作：

`lvgl <https://github.com/lvgl/lvgl>`__：为任何MCU、MPU和显示类型创建美观的用户界面

`QuickJS <https://bellard.org/quickjs/>`__：JavaScript引擎

`libuv <https://github.com/libuv/libuv>`__：平台抽象层

`curl <https://github.com/curl/curl>`__：HTTP客户端

`txiki.js <https://github.com/saghul/txiki.js>`__：微型JavaScript运行时



