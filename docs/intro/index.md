```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/intro/index.md
```

# Introduction （介绍）

<details>
<summary>查看原文</summary>
<p>

LVGL (Light and Versatile Graphics Library) is a free and open-source graphics library providing everything you need to create embedded GUI with easy-to-use graphical elements, beautiful visual effects and low memory footprint.

</p>
</details>

LVGL(轻量级和通用图形库)是一个免费和开源的图形库，它提供了创建嵌入式GUI所需的一切，具有易于使用的图形元素，美丽的视觉效果和低内存占用。

```shell

#译者添加：

LVGL的项目作者是来自匈牙利首都布达佩斯的 Gábor Kiss-Vámosi 。Kiss 在2016年将其并发布在 [GitHub](https://github.com/lvgl) 上。

当时叫 LittlevGL而不是LVGL，后来作者统一修改为 LVGL 甚至连仓库地址都改了。 像一般的开源项目的那样，它是作为一个人的项目开始的。 从那时起，陆续有近 100 名贡献者参与了项目开发，使得 LVGL 逐渐成为最受欢迎的嵌入式图形库之一。

```

## Key features （主要特性）

<details>
<summary>查看原文</summary>
<p>

- Powerful building blocks such as buttons, charts, lists, sliders, images, etc.
- Advanced graphics with animations, anti-aliasing, opacity, smooth scrolling
- Various input devices such as touchpad, mouse, keyboard, encoder, etc.
- Multi-language support with UTF-8 encoding
- Multi-display support, i.e. use multiple TFT, monochrome displays simultaneously
- Fully customizable graphic elements with CSS-like styles
- Hardware independent: use with any microcontroller or display
- Scalable: able to operate with little memory (64 kB Flash, 16 kB RAM)
- OS, external memory and GPU are supported but not required
- Single frame buffer operation even with advanced graphic effects
- Written in C for maximal compatibility (C++ compatible)
- Simulator to start embedded GUI design on a PC without embedded hardware
- Binding to MicroPython
- Tutorials, examples, themes for rapid GUI design
- Documentation is available online and as PDF
- Free and open-source under MIT license

</p>
</details>

- 强大的构建块，例如按钮、图表、列表、滑块、图像等。
- 带有动画、抗锯齿、不透明度、平滑滚动的高级图形
- 各种输入设备，如触摸板、鼠标、键盘、编码器等。
- 多语言支持 UTF-8 编码
- 多显示器支持，即同时使用多个 TFT、单色显示器
- 具有类似 CSS 样式的完全可定制的图形元素
- 独立于硬件：与任何微控制器或显示器一起使用
- 可扩展：能够以很少的内存运行（64 kB Flash，16 kB RAM）
- 支持但不要求操作系统、外部存储器和 GPU
- 即使具有高级图形效果，也可进行单帧缓冲区操作
- 用 C 编写以获得最大的兼容性（C++ 兼容）
- 在没有嵌入式硬件的 PC 上启动嵌入式 GUI 设计的模拟器
- 绑定到 MicroPython
- 快速 GUI 设计的教程、示例、主题
- 文档可在线获取并以 PDF 格式提供
- 在 MIT 许可下免费和开源



## Requirements（配置要求）

<details>
<summary>查看原文</summary>
<p>

Basically, every modern controller which is able to drive a display is suitable to run LVGL. The minimal requirements are:

</p>
</details>

基本上，每个能够驱动显示器的现代控制器都适合运行 LVGL。 最低要求是：

<details>
<summary>查看原文</summary>
<p>

<ul>
<li> 16, 32 or 64 bit microcontroller or processor</li>
<li>&gt; 16 MHz clock speed is recommended</li>
<li> Flash/ROM: &gt; 64 kB for the very essential components (&gt; 180 kB is recommended)</li>
<li> RAM: 
  <ul>
    <li> Static RAM usage: ~2 kB depending on the used features and object types</li>
    <li> Stack: &gt; 2kB (&gt; 8 kB is recommended)</li>
    <li> Dynamic data (heap): &gt; 4 KB (&gt; 32 kB is recommended if using several objects).
	    Set by <em>LV_MEM_SIZE</em> in <em>lv_conf.h</em>. </li>
    <li> Display buffer:  &gt; <em>"Horizontal resolution"</em> pixels (&gt; 10 &times; <em>"Horizontal resolution"</em> is recommended) </li>
    <li> One frame buffer in the MCU or in an external display controller</li>
	</ul>
</li>
<li> C99 or newer compiler</li>
<li> Basic C (or C++) knowledge: 
          <a href="https://www.tutorialspoint.com/cprogramming/c_pointers.htm">pointers</a>, 
          <a href="https://www.tutorialspoint.com/cprogramming/c_structures.htm">structs</a>, 
          <a href="https://www.geeksforgeeks.org/callbacks-in-c/">callbacks</a>.</li>
</ul>
<em>Note that memory usage may vary depending on architecture, compiler and build options.</em>

</p>
</details>

<ul>
<li> 16、32 或 64 位微控制器或处理器</li>
<li> 建议使用 &gt;16 MHz 时钟速度</li>
<li> 闪存/ROM： &gt; 64 kB 用于非常重要的组件 (&gt; 建议使用 180 kB)</li>
<li> RAM: 
  <ul>
    <li> 静态 RAM 使用量：~2 kB，取决于使用的功能和对象类型</li>
    <li> 堆: &gt; 2kB (&gt; 建议使用 8 kB)</li>
    <li> 动态数据（堆）: &gt; 2 KB (&gt; 如果使用多个对象，建议使用 16 kB).
      在 <em>lv_conf.h</em> 文件中配置 <em>LV_MEM_SIZE</em> 生效。</li>
    <li> 显示缓冲区：&gt; <em>“水平分辨率”</em>像素（推荐 &gt;10 &times; <em>10×“ 水平分辨率”</em>）</li>
    <li>MCU或外部显示控制器中的一个帧缓冲区</li>
	</ul>
</li>
<li> C99 或更新的编译器</li>
<li> 具备基本的 C（或 C++）知识：
          <a href="https://www.tutorialspoint.com/cprogramming/c_pointers.htm">pointers</a>, 
          <a href="https://www.tutorialspoint.com/cprogramming/c_structures.htm">structs</a>, 
          <a href="https://www.geeksforgeeks.org/callbacks-in-c/">callbacks</a></li>
</ul>
<em>请注意，内存使用量可能因架构、编译器和构建选项而异。</em>

## License（许可证）

<details>
<summary>查看原文</summary>
<p>

The LVGL project (including all repositories) is licensed under [MIT license](https://github.com/lvgl/lvgl/blob/master/LICENCE.txt). 
This means you can use it even in commercial projects.

It's not mandatory but we highly appreciate it if you write a few words about your project in the [My projects](https://forum.lvgl.io/c/my-projects/10) category of the forum or a private message to [lvgl.io](https://lvgl.io/#contact).

Although you can get LVGL for free there is a massive amount of work behind it. It's created by a group of volunteers who made it available for you in their free time.

To make the LVGL project sustainable, please consider [contributing](/CONTRIBUTING) to the project. 
You can choose from [many different ways of contributing](/CONTRIBUTING) such as simply writing a tweet about you are using LVGL, fixing bugs, translating the documentation, or even becoming a maintainer.

</p>
</details>

LVGL 项目（包括所有存储库）在 [MIT license](https://github.com/lvgl/lvgl/blob/master/LICENCE.txt) 许可下获得许可。
这意味着您甚至可以在商业项目中使用它。


这不是强制性的，但如果您在论坛的 [My projects](https://forum.lvgl.io/c/my-projects/10) 类别或来自 [lvgl.io](https://lvgl.io/#contact) 的私人消息中写下有关您的项目的几句话，我们将不胜感激。


尽管您可以免费获得 LVGL，但它背后的工作量很大。它由一群志愿者创建，他们在空闲时间为您提供。


为了使 LVGL 项目可持续，请考虑为该项目做 [贡献](/CONTRIBUTING) 。您可以从 [多种投稿方式](/CONTRIBUTING) 中进行选择，例如简单地写一条关于您正在使用 LVGL 的推文、修复错误、翻译文档，甚至成为维护者。


## Repository layout （仓库布局）

<details>
<summary>查看原文</summary>
<p>

All repositories of the LVGL project are hosted n GitHub: https://github.com/lvgl

</p>
</details>

LVGL 项目的所有代码仓库都托管在 GitHub上：[https://github.com/lvgl](https://github.com/lvgl)


<details>
<summary>查看原文</summary>
<p>

You will find these repositories there:
- [lvgl](https://github.com/lvgl/lvgl) The library itself with many [examples](https://github.com/lvgl/lvgl/blob/master/examples/).
- [lv_demos](https://github.com/lvgl/lv_demos) Demos created with LVGL.
- [lv_drivers](https://github.com/lvgl/lv_drivers) Display and input device drivers
- [blog](https://github.com/lvgl/blog) Source of the blog's site (https://blog.lvgl.io)
- [sim](https://github.com/lvgl/sim) Source of the online simulator's site (https://sim.lvgl.io)
- [lv_sim_...](https://github.com/lvgl?q=lv_sim&type=&language=) Simulator projects for various IDEs and platforms
- [lv_port_...](https://github.com/lvgl?q=lv_port&type=&language=) LVGL ports to development boards
- [lv_binding_..](https://github.com/lvgl?q=lv_binding&type=&language=l) Bindings to other languages
- [lv_...](https://github.com/lvgl?q=lv_&type=&language=) Ports to other platforms

</p>
</details>

您可以从下面的列表获取到lvgl所有相关的代码仓库：

- [lvgl](https://github.com/lvgl/lvgl) 库本身有很多 [例子](https://github.com/lvgl/lvgl/blob/master/examples/)。
- [lv_demos](https://github.com/lvgl/lv_demos) 使用 LVGL 创建的演示。
- [lv_drivers](https://github.com/lvgl/lv_drivers) 显示和输入设备驱动程序
- [博客](https://github.com/lvgl/blog) 博客站点的来源 (https://blog.lvgl.io)
- [sim](https://github.com/lvgl/sim) 在线模拟器网站的来源 (https://sim.lvgl.io)
- [lv_sim_...](https://github.com/lvgl?q=lv_sim&type=&language=) 各种IDE和平台的模拟器项目
- [lv_port_...](https://github.com/lvgl?q=lv_port&type=&language=) LVGL 端口到开发板
- [lv_binding_..](https://github.com/lvgl?q=lv_binding&type=&language=l) 绑定到其他语言
- [lv_...](https://github.com/lvgl?q=lv_&type=&language=) 移植到其他平台


## Release policy（发布策略）

<details>
<summary>查看原文</summary>
<p>

The core repositories follow the rules of [Semantic versioning](https://semver.org/):
- Major versions for incompatible API changes. E.g. v5.0.0, v6.0.0
- Minor version for new but backward-compatible functionalities. E.g. v6.1.0, v6.2.0
- Patch version for backward-compatible bug fixes. E.g. v6.1.1, v6.1.2

Tags like `vX.Y.Z` are created for every release.
</p>
</details>

LVGL库遵循[语义版本管理](https://semver.org/)：
- 不兼容 API 更改的主要版本。 比如： v5.0.0, v6.0.0
- 新的但向后兼容的功能的次要版本。 比如： v6.1.0, v6.2.0
- 用于向后兼容错误修复的补丁版本。 比如： v6.1.1, v6.1.2

为每个版本创建诸如“vX.Y.Z”之类的标签。

### Release cycle（发布周期）

<details>
<summary>查看原文</summary>
<p>

- Bug fixes: Released on demand even weekly
- Minor releases: Every 3-4 months
- Major releases: Approximately yearly


</p>
</details>

- 错误修复：每周按需发布
- 次要版本：每 3-4 个月
- 主要版本：大约每年


### Branches（分支）

<details>
<summary>查看原文</summary>
<p>

The core repositories have at least the following branches:
- `master` latest version, patches are merged directly here. 
- `release/vX.Y` stable versions of the minor releases
- `fix/some-description` temporary branches for bug fixes
- `feat/some-description` temporary branches for features

</p>
</details>

代码仓库至少有以下分支：
- `master` 最新版本，补丁在这里直接合并。
- `release/vX.Y` 稳定版本的次要版本
- 用于错误修复的 `fix/some-description`临时分支
- 开发功能的 `feat/some-description` 临时分支


### Changelog（变更日志）

<details>
<summary>查看原文</summary>
<p>

The changes are recorded in [CHANGELOG.md](https://github.com/lvgl/lvgl/blob/master/CHANGELOG.md).

</p>
</details>

更改记录在 [CHANGELOG.md](https://github.com/lvgl/lvgl/blob/master/CHANGELOG.md) 中。

### Version support(版本支持)

<details>
<summary>查看原文</summary>
<p>

Before v8 every minor release of major releases is supported for 1 year.
Starting from v8, every minor release is supported for 1 year.

| Version | Release date | Support end | Active |
|---------|--------------|-------------|--------|
| v5.3    | Feb 1, 2019  |Feb 1, 2020  | No     |
| v6.1    | Nov 26, 2019 |Nov 26, 2020 | No     |
| v7.11   | Mar 16, 2021 |Mar 16, 2022 | Yes    |
| v8.0    | 1 Jun, 2021  |1 Jun, 2022  | Yes    |
| v8.1    | In progress  |   |     |

</p>
</details>

在v8之前，每个主要版本的次要版本都支持1年。从v8开始，每个次要版本都支持1年。

| 版本 | 发布日期 | 支持结束 | 活跃 |
|---------|--------------|-------------|--------|
| v5.3    | 2019 年 2 月 1 日  | 2020 年 2 月 1 日  | No     |
| v6.1    | 2019 年 11 月 26 日 | 2020 年 11 月 26 日 | No     |
| v7.11   | 2021 年 3 月 16 日 | 2022 年 3 月 16 日 | Yes    |
| v8.0    | 2021年6月1日  | 2022年6月1日  | Yes    |
| v8.1    | 进行中  |   |     |



## FAQ（常见问题）

### Where can I ask questions?（我可以在哪里提问？）

<details>
<summary>查看原文</summary>
<p>

You can ask questions in the forum: [https://forum.lvgl.io/](https://forum.lvgl.io/).

We use [GitHub issues](https://github.com/lvgl/lvgl/issues) for development related discussion. 
You should use them only if your question or issue is tightly related to the development of the library. 

</p>
</details>

可以在论坛提问：[https://forum.lvgl.io/](https://forum.lvgl.io/)。

我们使用 [GitHub 问题](https://github.com/lvgl/lvgl/issues) 进行开发相关讨论。
仅当您的问题或问题与库的开发密切相关时才应使用它们。

### Is my MCU/hardware supported?（LVGL是否支持我的 MCU/硬件？）

<details>
<summary>查看原文</summary>
<p>

Every MCU which is capable of driving a display via parallel port, SPI, RGB interface or anything else and fulfills the [Requirements](#requirements) is supported by LVGL.

This includes:
- "Common" MCUs like STM32F, STM32H, NXP Kinetis, LPC, iMX, dsPIC33, PIC32 etc. 
- Bluetooth, GSM, Wi-Fi modules like Nordic NRF and Espressif ESP32
- Linux with frame buffer device such as /dev/fb0. This includes Single-board computers like the Raspberry Pi
- Anything else with a strong enough MCU and a peripheral to drive a display

</p>
</details>

LVGL 支持每个能够通过并行端口、SPI、RGB 接口或其他任何方式驱动显示器并满足 [要求](#requirements) 的 MCU。

这包括：
- “通用” MCU，如 STM32F、STM32H、NXP Kinetis、LPC、IMX、dsPIC33、PIC32 等。
- 蓝牙、GSM、Wi-Fi 模块，如 Nordic NRF 和 Espressif ESP32
- 带有帧缓冲设备的 Linux，例如 /dev/fb0。 这包括单板计算机，如 Raspberry Pi
- 任何其他具有足够强大 MCU 和外围设备来驱动显示器的设备


### Is my display supported?（支持我的显示器吗？）

<details>
<summary>查看原文</summary>
<p>

LVGL needs just one simple driver function to copy an array of pixels into a given area of the display. 
If you can do this with your display then you can use it with LVGL.

Some examples of the supported display types:
- TFTs with 16 or 24 bit color depth 
- Monitors with an HDMI port
- Small monochrome displays
- Gray-scale displays
- even LED matrices
- or any other display where you can control the color/state of the pixels

See the [Porting](/porting/display) section to learn more.

</p>
</details>


LVGL 只需要一个简单的驱动程序函数即可将像素阵列复制到显示器的给定区域。
如果您可以在显示器上执行此操作，那么您可以将其与 LVGL 一起使用。

支持的显示类型的一些示例：
- 具有 16 位或 24 位色深的 TFT
- 带有 HDMI 端口的显示器
- 小型单色显示器
- 灰度显示
- 甚至 LED 矩阵
- 或任何其他可以控制像素颜色/状态的显示器

请参阅 [移植](/porting/display) 部分以了解更多信息。

### Nothing happens, my display driver is not called. What have I missed?（没有任何反应，我的显示驱动程序没有被调用。我错过了什么？）

<details>
<summary>查看原文</summary>
<p>

Be sure you are calling `lv_tick_inc(x)` in an interrupt and `lv_timer_handler()` in your main `while(1)`.

Learn more in the [Tick](/porting/tick) and [Task handler](/porting/task-handler) sections.

</p>
</details>

确保你在中断中调用了 `lv_tick_inc(x)`，在你的主 `while(1)` 中调用了 `lv_timer_handler()`。

在 [Tick](/porting/tick) 和 [任务处理程序](/porting/task-handler) 部分了解更多信息。

### Why the display driver is called only once? Only the upper part of the display is refreshed. （为什么显示驱动程序只调用一次？仅刷新显示的上部。）

<details>
<summary>查看原文</summary>
<p>

Be sure you are calling `lv_disp_flush_ready(drv)` at the end of your "*display flush callback*". 

</p>
</details>

确保在 “*显示刷新回调*” 结束时调用 `lv_disp_flush_ready(drv)` 。


### Why I see only garbage on the screen?（为什么我在屏幕上只看到垃圾？）

<details>
<summary>查看原文</summary>
<p>

Probably there a bug in your display driver. Try the following code without using LVGL. You should see a square with red-blue gradient

</p>
</details>

您的显示驱动程序中可能存在错误。在不使用 LVGL 的情况下尝试以下代码。你应该看到一个带有红蓝渐变的正方形


```c
#define BUF_W 20
#define BUF_H 10

lv_color_t buf[BUF_W * BUF_H];
lv_color_t * buf_p = buf;
uint16_t x, y;
for(y = 0; y &lt; BUF_H; y++) {
    lv_color_t c = lv_color_mix(LV_COLOR_BLUE, LV_COLOR_RED, (y * 255) / BUF_H);
    for(x = 0; x &lt; BUF_W; x++){
        (*buf_p) =  c;
        buf_p++;
    }
}

lv_area_t a;
a.x1 = 10;
a.y1 = 40;
a.x2 = a.x1 + BUF_W - 1;
a.y2 = a.y1 + BUF_H - 1;
my_flush_cb(NULL, &a, buf);
```

### Why I see non-sense colors on the screen? （为什么我在屏幕上看到无意义的颜色？）

<details>
<summary>查看原文</summary>
<p>

Probably LVGL's color format is not compatible with your display's color format. Check `LV_COLOR_DEPTH` in *lv_conf.h*.

If you are using 16-bit colors with SPI (or another byte-oriented interface) you probably need to set `LV_COLOR_16_SWAP  1` in *lv_conf.h*. 
It swaps the upper and lower bytes of the pixels.

</p>
</details>

可能 LVGL 的颜色格式与您的显示器的颜色格式不兼容。 检查 *lv_conf.h* 中的 `LV_COLOR_DEPTH`。

如果您在 SPI（或其他面向字节的接口）中使用 16 位颜色，您可能需要在 *lv_conf.h* 中设置“LV_COLOR_16_SWAP 1”。
它交换像素的高字节和低字节。

### How to speed up my UI?（如何加速我的用户界面？）

<details>
<summary>查看原文</summary>
<p>

- Turn on compiler optimization and enable cache if your MCU has it
- Increase the size of the display buffer
- Use two display buffers and flush the buffer with DMA (or similar peripheral) in the background 
- Increase the clock speed of the SPI or parallel port if you use them to drive the display
- If your display has a SPI port consider changing to a model with a parallel interface because it has much higher throughput
- Keep the display buffer in internal RAM (not in external SRAM) because LVGL uses it a lot and it should have a fast access time


</p>
</details>

- 如果您的 MCU 支持的话，请打开编译器优化并启用缓存
- 增加显示缓冲区的大小
- 使用 2 个显示缓冲区并在后台使用 DMA（或类似外围设备）刷新缓冲区
- 如果您使用 SPI 或并行端口来驱动显示器，请提高它们的时钟速度
- 如果您的显示器具有 SPI 端口，请考虑更改为并行模型，因为它具有更高的吞吐量
- 将显示缓冲区保留在内部 RAM（而不是外部 SRAM）中，因为 LVGL 经常使用它，并且访问时间应该很短


### How to reduce flash/ROM usage?（如何减少闪存/ROM的使用？）

<details>
<summary>查看原文</summary>
<p>

You can disable all the unused features (such as animations, file system, GPU etc.) and object types in *lv_conf.h*.

If you are using GCC you can add `-fdata-sections -ffunction-sections` compiler flags and `--gc-sections` linker flag to remove unused functions and variables from the final binary.

</p>
</details>

您可以在 *lv_conf.h* 中禁用所有未使用的功能（例如动画、文件系统、GPU 等）和对象类型。

如果您使用 GCC，您可以添加`-fdata-sections -ffunction-sections` 编译器标志和`--gc-sections` 链接器标志，以从最终二进制文件中删除未使用的函数和变量。


### How to reduce the RAM usage（如何减少内存使用）

<details>
<summary>查看原文</summary>
<p>

- Lower the size of the *Display buffer* 
- Reduce `LV_MEM_SIZE` in *lv_conf.h*. This memory is used when you create objects like buttons, labels, etc.
- To work with lower `LV_MEM_SIZE` you can create objects only when required and delete them when they are not needed anymore

</p>
</details>

- 降低*显示缓冲区*的大小
- 减少 *lv_conf.h* 中的 `LV_MEM_SIZE`。 当您创建按钮、标签等对象时会使用此内存。
- 要使用较低的“LV_MEM_SIZE”，您可以仅在需要时创建对象并在不再需要时将其删除



### How to work with an operating system?（如何使用操作系统？）

<details>
<summary>查看原文</summary>
<p>

To work with an operating system where tasks can interrupt each other (preemptively) you should protect LVGL related function calls with a mutex.
See the [Operating system and interrupts](/porting/os) section to learn more.

</p>
</details>

要使用任务可以相互中断（抢占式）的操作系统，您应该使用互斥锁保护与 LVGL 相关的函数调用。
请参阅 [操作系统和中断](/porting/os) 部分以了解更多信息。


