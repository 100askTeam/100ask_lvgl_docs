```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/arduino.md
```

# Arduino

<details>
<summary>查看原文</summary>
<p>

The [core LVGL library](https://github.com/lvgl/lvgl) and the [demos](https://github.com/lvgl/lv_demos) are directly available as Arduino libraries.

Note that you need to choose a powerful enough board to run LVGL and your GUI.  See the [requirements of LVGL](https://docs.lvgl.io/latest/en/html/intro/index.html#requirements). 

For example ESP32 is a good candidate to create your UI with LVGL.

</p>
</details>

[LVGL 核心库](https://github.com/lvgl/lvgl) 和 [演示仓库](https://github.com/lvgl/lv_demos) 可直接作为 Arduino 库使用。

请注意，您需要选择一个足够强大的板来运行 LVGL 和您的 GUI。请参阅 [LVGL 的运行要求](https://docs.lvgl.io/latest/en/html/intro/index.html#requirements) 。

例如，ESP32 是使用 LVGL 创建 UI 的不错选择。

## Get the LVGL Arduino library（获取 LVGL Arduino 库）

<details>
<summary>查看原文</summary>
<p>

LVGL can be installed via the Arduino IDE Library Manager or as a .ZIP library.

</p>
</details>

LVGL 可以通过 Arduino IDE 库管理器安装或作为 .ZIP 库安装。

## Set up drivers（设置驱动程序）

<details>
<summary>查看原文</summary>
<p>

To get started it's recommended to use [TFT_eSPI](https://github.com/Bodmer/TFT_eSPI) library as a TFT driver to simplify testing. 
To make it work setup `TFT_eSPI` according to your TFT display type via editing either
- `User_Setup.h` 
- or by selecting a configuration in the `User_Setup_Select.h`

Both files are located in `TFT_eSPI` library's folder.

</p>
</details>

首先，建议使用 [TFT_eSPI](https://github.com/Bodmer/TFT_eSPI) 库作为 TFT 驱动程序以简化测试。
为了使其工作，根据您的 TFT 显示类型通过编辑设置“TFT_eSPI”
- `User_Setup.h`
- 或通过在“User_Setup_Select.h”中选择配置
这两个文件都位于`TFT_eSPI` 库的文件夹中。

## Configure LVGL（配置LVGL）

<details>
<summary>查看原文</summary>
<p>

LVGL has its own configuration file called `lv_conf.h`. When LVGL is installed the followings needs to be done to configure it:
1. Go to directory of the installed Arduino libraries
2. Go to `lvgl` and copy `lv_conf_template.h` as `lv_conf.h` into the Arduino Libraries directory next to the `lvgl` library folder.
3. Open `lv_conf.h` and change the first `#if 0` to `#if 1`
4. Set the color depth of you display in `LV_COLOR_DEPTH`
5. Set `LV_TICK_CUSTOM 1`

</p>
</details>

LVGL 有自己的配置文件，名为 `lv_conf.h`。安装 LVGL 后，需要进行以下配置：
1. 进入已安装的 Arduino 库目录
2. 转到`lvgl` 并将`lv_conf_template.h` 作为`lv_conf.h` 复制到`lvgl` 库文件夹旁边的Arduino Libraries 目录中。
3. 打开`lv_conf.h`，将第一个`#if 0`改为`#if 1`
4. 在`LV_COLOR_DEPTH`中设置你显示的颜色深度
5. 设置`LV_TICK_CUSTOM 1`

## Initialize LVGL and run an example（初始化 LVGL 并运行示例）

<details>
<summary>查看原文</summary>
<p>

Take a look at [LVGL_Arduino.ino](https://github.com/lvgl/lvgl/blob/master/examples/arduino/LVGL_Arduino/LVGL_Arduino.ino) to see how to initialize LVGL.
TFT_eSPI is used as the display driver.

In the INO file you can see how to register a display and a touch pad for LVGL and call an example.

Note that, there is no dedicated INO file for every example but you can call functions like `lv_example_btn_1()` or `lv_example_slider_1()` to run an example.
Most of the examples are available in the [`lvgl/examples`](https://github.com/lvgl/lvgl/tree/master/examples) folder. Some are also available in [`lv_demos`](https://github.com/lvgl/lv_demos), which needs to be installed and configured separately.

</p>
</details>

我们看看 [LVGL_Arduino.ino](https://github.com/lvgl/lvgl/blob/master/examples/arduino/LVGL_Arduino/LVGL_Arduino.ino) 是如何初始化 LVGL的。
TFT_eSPI 用作显示驱动程序。

在 INO 文件中，您可以看到如何为 LVGL 注册显示器和触摸板并调用示例。

请注意，每个示例都没有专用的 INO 文件，但您可以调用诸如“lv_example_btn_1()”或“lv_example_slider_1()”之类的函数来运行示例。
大多数示例都可以在 [`lvgl/examples`](https://github.com/lvgl/lvgl/tree/master/examples) 文件夹中找到。 [`lv_demos`](https://github.com/lvgl/lv_demos)中也有一些，需要单独安装配置。

## Debugging and logging（调试和日志）

<details>
<summary>查看原文</summary>
<p>

In case of trouble LVGL can display debug information. 
In the `LVGL_Arduino.ino` example there is `my_print` method, which allow to send this debug information to the serial interface. 
To enable this feature you have to edit `lv_conf.h` file and enable logging in the section `log settings`:

</p>
</details>

如果出现故障，LVGL 可以显示调试信息。
在 `LVGL_Arduino.ino` 示例中有 `my_print` 方法，它允许将此调试信息发送到串行接口。
要启用此功能，您必须编辑“lv_conf.h”文件并在“日志设置”部分启用日志记录：

```c
/*Log settings*/
#define USE_LV_LOG      1   /*Enable/disable the log module*/
#if LV_USE_LOG
/* How important log should be added:
 * LV_LOG_LEVEL_TRACE       A lot of logs to give detailed information
 * LV_LOG_LEVEL_INFO        Log important events
 * LV_LOG_LEVEL_WARN        Log if something unwanted happened but didn't cause a problem
 * LV_LOG_LEVEL_ERROR       Only critical issue, when the system may fail
 * LV_LOG_LEVEL_NONE        Do not log anything
 */
#  define LV_LOG_LEVEL    LV_LOG_LEVEL_WARN
```

<details>
<summary>查看原文</summary>
<p>

After enabling the log module and setting LV_LOG_LEVEL accordingly the output log is sent to the `Serial` port @ 115200 bps.

</p>
</details>

启用日志模块并相应地设置 LV_LOG_LEVEL 后，输出日志会以 115200 bps 的速度发送到“串行”端口。