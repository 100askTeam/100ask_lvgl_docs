```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/nuttx.md
```
# NuttX RTOS

## What is NuttX?（什么是NuttX）

<details>
<summary>查看原文</summary>
<p>

[NuttX](https://nuttx.apache.org/) is a mature and secure real-time operating system (RTOS) with an emphasis on technical standards compliance and small size. 
It is scalable from 8-bit to 64-bit microcontrollers and microprocessors and compliant with the Portable Operating System Interface (POSIX) and the American National Standards Institute (ANSI) standards and with many Linux-like subsystems.
The best way to think about NuttX is to think of it as a small Unix/Linux for microcontrollers.

</p>
</details>

[NuttX](https://nuttx.apache.org/) 是一个成熟且安全的实时操作系统 (RTOS)，强调技术标准合规性和小尺寸。
它可以从 8 位扩展到 64 位微控制器和微处理器，并符合便携式操作系统接口 (POSIX) 和美国国家标准协会 (ANSI) 标准以及许多类似 Linux 的子系统。
考虑 NuttX 的最佳方式是将其视为用于微控制器的小型 Unix/Linux。

### Highlights of NuttX（NuttX 的亮点）

<details>
<summary>查看原文</summary>
<p>

- **Small** - Fits and runs in microcontrollers as small as 32KB Flash and 8KB of RAM.
- **Compliant** - Strives to be as compatible as possible with POSIX and Linux.
- **Versatile** - Supports many architectures (ARM, ARM Thumb, AVR, MIPS, OpenRISC, RISC-V 32-bit and 64-bit, RX65N, x86-64, Xtensa, Z80/Z180, etc).
- **Modular** - Its modular design allows developers to select only what really matters and use modules to include new features.
- **Popular** - NuttX is used by many companies around the world. Probably you already used a product with NuttX without knowing it was running NuttX.
- **Predictable** - NuttX is a preemptible Realtime kernel, so you can use it to create predictable applications for realtime control.

---

</p>
</details>

- **小** - 适合并在小至 32KB 闪存和 8KB RAM 的微控制器中运行。
- **Compliant** - 力求尽可能与 POSIX 和 Linux 兼容。
- **多功能** - 支持多种架构（ARM、ARM Thumb、AVR、MIPS、OpenRISC、RISC-V 32 位和 64 位、RX65N、x86-64、Xtensa、Z80/Z180 等）。
- **模块化** - 其模块化设计允许开发人员仅选择真正重要的内容并使用模块来包含新功能。
- **流行** - NuttX 被世界各地的许多公司使用。可能您已经使用 NuttX 的产品，但不知道它正在运行 NuttX。
- **Predictable** - NuttX 是一个抢占式实时内核，因此您可以使用它来创建可预测的应用程序以进行实时控制。

---

## Why NuttX + LVGL?（为什么是 NuttX + LVGL？）

<details>
<summary>查看原文</summary>
<p>

Although NuttX has its own graphic library called [NX](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=139629474), LVGL is a good alternative because users could find more eye-candy demos and they can reuse code from previous projects. 
LVGL is an [Object Oriented Component Based](https://blog.lvgl.io/2018-12-13/extend-lvgl-objects) high-level GUI library, that could fit very well for a RTOS with advanced features like NuttX. 
LVGL is implemented in C and its APIs are in C.

</p>
</details>

尽管 NuttX 有自己的图形库，称为 [NX](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=139629474)，但 LVGL 是一个不错的选择，因为用户可以找到更多吸引眼球的演示和他们可以重用以前项目中的代码。
LVGL 是一个 [Object Oriented Component Based](https://blog.lvgl.io/2018-12-13/extend-lvgl-objects) 高级 GUI 库，它非常适合具有高级功能的 RTOS，例如坚果X。
LVGL 是用 C 实现的，它的 API 是用 C 编写的。

### Here are some advantages of using LVGL in NuttX（以下是在 NuttX 中使用 LVGL 的一些优势）

<details>
<summary>查看原文</summary>
<p>

- Develop GUI in Linux first and when it is done just compile it for NuttX. Nothing more, no wasting of time.
- Usually, GUI development for low level RTOS requires multiple iterations to get things right, where each iteration consists of **`Change code` > `Build` > `Flash` > `Run`**.
Using LVGL, Linux and NuttX you can reduce this process and just test everything on your computer and when it is done, compile it on NuttX and that is it.

</p>
</details>

- 首先在 Linux 中开发 GUI，完成后只需为 NuttX 编译它。不多说了，不浪费时间了。
- 通常，低级 RTOS 的 GUI 开发需要多次迭代才能使事情正确，其中每次迭代包括**`更改代码`>`构建`>`Flash`>`运行`**。
使用 LVGL、Linux 和 NuttX，您可以减少这个过程，只需在您的计算机上测试所有内容，完成后，在 NuttX 上编译它，就是这样。


### NuttX + LVGL could be used for（NuttX + LVGL 可用于）

<details>
<summary>查看原文</summary>
<p>

- GUI demos to demonstrate your board graphics capacities.
- Fast prototyping GUI for MVP (Minimum Viable Product) presentation.
- visualize sensor data directly and easily on the board without using a computer.
- Final products with a GUI without a touchscreen (i.e. 3D Printer Interface using Rotary Encoder to Input data).
- Final products with a touchscreen (and all sorts of bells and whistles).

---

</p>
</details>

- GUI 演示来展示您的电路板图形能力。
- MVP（最小可行产品）演示的快速原型设计 GUI。
- 无需使用计算机即可在板上直接轻松地可视化传感器数据。
- 带 GUI 且不带触摸屏的最终产品（即使用旋转编码器输入数据的 3D 打印机界面）。
- 带有触摸屏的最终产品（以及各种花里胡哨的东西）。

---

## How to get started with NuttX and LVGL?（如何开始使用 NuttX 和 LVGL？）

<details>
<summary>查看原文</summary>
<p>

There are many boards in the NuttX mainline (https://github.com/apache/incubator-nuttx) with support for LVGL.
Let's use the [STM32F429IDISCOVERY](https://www.st.com/en/evaluation-tools/32f429idiscovery.html) as example because it is a very popular board.

</p>
</details>

NuttX 主线（https://github.com/apache/incubator-nuttx）中有很多支持 LVGL 的开发板。
我们以 [STM32F429IDISCOVERY](https://www.st.com/en/evaluation-tools/32f429idiscovery.html) 为例，因为它是一款非常受欢迎的开发板。

### First you need to install the pre-requisite on your system（首先，您需要在系统上安装依赖）

<details>
<summary>查看原文</summary>
<p>

Let's use the [Windows Subsystem for Linux](https://acassis.wordpress.com/2018/01/10/how-to-build-nuttx-on-windows-10/)

</p>
</details>

让我们使用 [适用于 Linux 的 Windows 子系统](https://acassis.wordpress.com/2018/01/10/how-to-build-nuttx-on-windows-10/)

```shell
$ sudo apt-get install automake bison build-essential flex gcc-arm-none-eabi gperf git libncurses5-dev libtool libusb-dev libusb-1.0.0-dev pkg-config kconfig-frontends openocd
```

### Now let's to create a workspace to save our files（现在让我们创建一个工作区来保存我们的文件）

```shell
$ mkdir ~/nuttxspace
$ cd ~/nuttxspace
```

### Clone the NuttX and Apps repositories:（克隆 NuttX 和 Apps 存储库：）

```shell
$ git clone https://github.com/apache/incubator-nuttx nuttx
$ git clone https://github.com/apache/incubator-nuttx-apps apps
```

### Configure NuttX to use the stm32f429i-disco board and the LVGL Demo（配置 NuttX 以使用 stm32f429i-disco 板和 LVGL Demo）

```shell
$ ./tools/configure.sh stm32f429i-disco:lvgl
$ make
```

<details>
<summary>查看原文</summary>
<p>

If everything went fine you should have now the file `nuttx.bin` to flash on your board:

</p>
</details>

如果一切顺利，你现在应该有文件 `nuttx.bin` 在你的板上的LED灯闪烁：

```shell
$ ls -l nuttx.bin 
-rwxrwxr-x 1 alan alan 287144 Jun 27 09:26 nuttx.bin
```

### Flashing the firmware in the board using OpenOCD:（使用 OpenOCD 刷新板上的固件：）

```shell
$ sudo openocd -f interface/stlink-v2.cfg -f target/stm32f4x.cfg -c init -c "reset halt" -c "flash write_image erase nuttx.bin 0x08000000"
```

<details>
<summary>查看原文</summary>
<p>

Reset the board and using the 'NSH>' terminal start the LVGL demo:

</p>
</details>

重启开发板并使用“NSH>”终端启动 LVGL 演示：

```shell
nsh> lvgldemo
```

## Where can I find more information?（我在哪里可以找到更多信息？）

<details>
<summary>查看原文</summary>
<p>

- This blog post: [LVGL on LPCXpresso54628](https://acassis.wordpress.com/2018/07/19/running-nuttx-on-lpcxpresso54628-om13098/)
- NuttX mailing list: [Apache NuttX Mailing List](http://nuttx.incubator.apache.org/community/)

</p>
</details>

- 这篇博文：[LPCXpresso54628 上的 LVGL](https://acassis.wordpress.com/2018/07/19/running-nuttx-on-lpcxpresso54628-om13098/)
- NuttX 邮件列表：[Apache NuttX 邮件列表](http://nuttx.incubator.apache.org/community/)