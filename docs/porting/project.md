```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/project.md
```

# Set-up a project（设置项目）

## Get the library（获取LVGL图形库）

<details>
<summary>查看原文</summary>
<p>

LVGL is available on GitHub: [https://github.com/lvgl/lvgl](https://github.com/lvgl/lvgl).

You can clone it or download the latest version of the library from GitHub.

The graphics library itself is the **lvgl** directory which should be copied into your project.

</p>
</details>

LVGL 可在 GitHub 上获得：[https://github.com/lvgl/lvgl](https://github.com/lvgl/lvgl)。

您可以克隆它或从 GitHub 下载最新版本的库。

图形库本身是 **lvgl** 目录，应将其复制到您的项目中。

## Configuration file（修改配置文件）

<details>
<summary>查看原文</summary>
<p>

There is a configuration header file for LVGL called **lv_conf.h**. In this you can set the library's basic behavior, disable unused modules and features, adjust the size of memory buffers in compile-time, etc.

Copy **lvgl/lv_conf_template.h** next to the *lvgl* directory and rename it to *lv_conf.h*. Open the file and change the `#if 0` at the beginning to `#if 1` to enable its content.

*lv_conf.h* can be copied to another place as well but then you should add `LV_CONF_INCLUDE_SIMPLE` define to your compiler options (e.g. `-DLV_CONF_INCLUDE_SIMPLE` for gcc compiler) and set the include path manually. 
In this case LVGL will attempt to include `lv_conf.h` simply with `#include "lv_conf.h"`.

In the config file comments explain the meaning of the options. Be sure to set at least `LV_COLOR_DEPTH` according to your display's color depth.

</p>
</details>


有一个名为 **lv_conf.h** 的 LVGL 配置头文件。在这里，您可以设置库的基本行为、禁用未使用的模块和功能、在编译时调整内存缓冲区的大小等。

复制 *lvgl* 目录旁边的 **lvgl/lv_conf_template.h** 并将其重命名为 *lv_conf.h*。打开文件并将开头的“#if 0”更改为“#if 1”以启用其内容。

*lv_conf.h* 也可以复制到另一个地方，但是你应该添加 `LV_CONF_INCLUDE_SIMPLE` 定义到你的编译器选项（例如 `-DLV_CONF_INCLUDE_SIMPLE` 用于 gcc 编译器）并手动设置包含路径。
在这种情况下，LVGL 将尝试使用 `#include "lv_conf.h"` 简单地包含 `lv_conf.h`。

在配置文件的注释中解释了选项的含义。请务必根据显示器的颜色深度至少设置“LV_COLOR_DEPTH”。

## Initialization（初始化）

<details>
<summary>查看原文</summary>
<p>

To use the graphics library you have to initialize it and the other components too. The order of the initialization is:

1. Call `lv_init()`.
2. Initialize your drivers.
3. Register the display and input devices drivers in LVGL.  Lear more about [Display](/porting/display) and [Input device](/porting/indev) registration.
4. Call `lv_tick_inc(x)` every `x` milliseconds in an interrupt to tell the elapsed time. [Learn more](/porting/tick).
5. Call `lv_timer_handler()` every few milliseconds to handle LVGL related tasks. [Learn more](/porting/task-handler).

</p>
</details>

要使用图形库，您必须初始化它和其他组件。初始化的顺序是：
1. 调用`lv_init()`。
2. 初始化您的驱动程序。
3. 在 LVGL 中注册显示和输入设备驱动程序。详细了解 [Display](/porting/display) 和 [Input device](/porting/indev) 注册。
4. 在中断中每隔 `x` 毫秒调用 `lv_tick_inc(x)` 以告知经过的时间。 [了解更多](/porting/tick)。
5. 每隔几毫秒调用`lv_timer_handler()`来处理LVGL相关的任务。 [了解更多](/porting/task-handler)。