```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/micropython.md
```
# Micropython

## What is Micropython?（什么是Micropython？）

<details>
<summary>查看原文</summary>
<p>

[Micropython](http://micropython.org/) is Python for microcontrollers.  
Using Micropython, you can write Python3 code and run it even on a bare metal architecture with limited resources.

</p>
</details>

[Micropython](http://micropython.org/) 是用于微控制器的 Python。
使用 Micropython，即使在资源有限的裸机架构上，您也可以编写 Python3 代码并运行它。

### Highlights of Micropython（Micropython 的亮点）

<details>
<summary>查看原文</summary>
<p>

- **Compact** - Fits and runs within just 256k of code space and 16k of RAM. No OS is needed, although you can also run it with an OS, if you want.
- **Compatible** - Strives to be as compatible as possible with normal Python (known as CPython).
- **Versatile** - Supports many architectures (x86, x86-64, ARM, ARM Thumb, Xtensa).
- **Interactive** - No need for the compile-flash-boot cycle. With the REPL (interactive prompt) you can type commands and execute them immediately, run scripts etc.
- **Popular** - Many platforms are supported. The user base is growing bigger. Notable forks: [MicroPython](https://github.com/micropython/micropython), [CircuitPython](https://github.com/adafruit/circuitpython), [MicroPython_ESP32_psRAM_LoBo](https://github.com/loboris/MicroPython_ESP32_psRAM_LoBo)
- **Embedded Oriented** - Comes with modules specifically for embedded systems, such as the [machine module](https://docs.micropython.org/en/latest/library/machine.html#classes) for accessing low-level hardware (I/O pins, ADC, UART, SPI, I2C, RTC, Timers etc.)

---

</p>
</details>

- **紧凑** - 适合并在仅 256k 的代码空间和 16k 的 RAM 内运行。不需要操作系统，但如果需要，您也可以使用操作系统运行它。
- **兼容** - 努力与普通 Python（称为 CPython）尽可能兼容。
- **多功能** - 支持多种架构（x86、x86-64、ARM、ARM Thumb、Xtensa）。
- **交互式** - 不需要编译-闪存-启动循环。使用 REPL（交互式提示），您可以键入命令并立即执行它们、运行脚本等。
- **流行** - 支持许多平台。用户群越来越大。值得注意的分支：[MicroPython](https://github.com/micropython/micropython)、[CircuitPython](https://github.com/adafruit/circuitpython)、[MicroPython_ESP32_psRAM_LoBo](https://github.com/loboris) /MicroPython_ESP32_psRAM_LoBo)
- **Embedded Oriented** - 带有专门用于嵌入式系统的模块，例如 [machine module](https://docs.micropython.org/en/latest/library/machine.html#classes)，用于访问低级硬件（I/O 引脚、ADC、UART、SPI、I2C、RTC、定时器等）

---

## Why Micropython + LVGL?（为什么是 Micropython + LVGL？）

<details>
<summary>查看原文</summary>
<p>

Currently, Micropython [does not have a good high-level GUI library](https://forum.micropython.org/viewtopic.php?f=18&t=5543) by default. LVGL is an [Object Oriented Component Based](https://blog.lvgl.io/2018-12-13/extend-lvgl-objects) high-level GUI library, which seems to be a natural candidate to map into a higher level language, such as Python. LVGL is implemented in C and its APIs are in C.

</p>
</details>

目前，Micropython [没有一个好的高级 GUI 库](https://forum.micropython.org/viewtopic.php?f=18&t=5543) 默认情况下。 LVGL 是一个 [Object Oriented Component Based](https://blog.lvgl.io/2018-12-13/extend-lvgl-objects) 高级 GUI 库，它似乎是映射到更高级别的自然候选者级别语言，如 Python。 LVGL 是用 C 实现的，它的 API 是用 C 编写的。

### Here are some advantages of using LVGL in Micropython:（以下是在 Micropython 中使用 LVGL 的一些优势：）

<details>
<summary>查看原文</summary>
<p>

- Develop GUI in Python, a very popular high level language. Use paradigms such as Object Oriented Programming.
- Usually, GUI development requires multiple iterations to get things right. With C, each iteration consists of **`Change code` > `Build` > `Flash` > `Run`**.  
In Micropython it's just **`Change code` > `Run`** ! You can even run commands interactively using the [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (the interactive prompt)

</p>
</details>

- 用 Python 开发 GUI，这是一种非常流行的高级语言。使用诸如面向对象编程之类的范式。
- 通常，GUI 开发需要多次迭代才能把事情做好。使用 C，每次迭代都包含 **`Change code` > `Build` > `Flash` > `Run`**。
在 Micropython 中，它只是 **`Change code` > `Run`** ！您甚至可以使用 [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)（交互式提示）以交互方式运行命令

### Micropython + LVGL could be used for:（Micropython + LVGL 可用于：）

<details>
<summary>查看原文</summary>
<p>

- Fast prototyping GUI.  
- Shortening the cycle of changing and fine-tuning the GUI.
- Modelling the GUI in a more abstract way by defining reusable composite objects, taking advantage of Python's language features such as Inheritance, Closures, List Comprehension, Generators, Exception Handling, Arbitrary Precision Integers and others.
- Make LVGL accessible to a larger audience. No need to know C in order to create a nice GUI on an embedded system.  
This goes well with [CircuitPython vision](https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython). CircuitPython was designed with education in mind, to make it easier for new or unexperienced users to get started with embedded development.
- Creating tools to work with LVGL at a higher level (e.g. drag-and-drop designer).

---

</p>
</details>


- 快速原型设计 GUI。
- 缩短更改和微调 GUI 的周期。
- 通过定义可重用的复合对象，利用 Python 的语言特性，如继承、闭包、列表理解、生成器、异常处理、任意精度整数等，以更抽象的方式对 GUI 建模。
- 让更多的观众可以访问 LVGL。无需了解 C 即可在嵌入式系统上创建漂亮的 GUI。
这与 [CircuitPython 愿景](https://learn.adafruit.com/welcome-to-circuitpython/what-is-circuitpython) 相得益彰。 CircuitPython 的设计考虑了教育，使新用户或没有经验的用户更容易开始嵌入式开发。
- 创建工具以在更高级别使用 LVGL（例如拖放设计器）。
---

## So what does it look like?（它看起来像什么？）

<details>
<summary>查看原文</summary>
<p>

> TL;DR:
> It's very much like the C API, but Object Oriented for LVGL components.

Let's dive right into an example!  

</p>
</details>

> TL;DR:
> 它非常像 C API，但是 LVGL 组件是面向对象的。

让我们直接进入一个例子！

### A simple example（一个简单的例子）

```python
import lvgl as lv
lv.init()
scr = lv.obj()
btn = lv.btn(scr)
btn.align(lv.scr_act(), lv.ALIGN.CENTER, 0, 0)
label = lv.label(btn)
label.set_text("Button")
lv.scr_load(scr)
```

## How can I use it?（我怎样才能使用它？）

### Online Simulator（在线模拟器）

<details>
<summary>查看原文</summary>
<p>

If you want to experiment with LVGL + Micropython without downloading anything - you can use our online simulator!  
It's a fully functional LVGL + Micropython that runs entirely in the browser and allows you to edit a python script and run it.

[Click here to experiment on the online simulator](https://sim.lvgl.io/)

[Hello World](https://sim.lvgl.io/v7/micropython/ports/javascript/bundle_out/index.html?script=https://gist.githubusercontent.com/amirgon/51299ce9b6448328a855826149482ae6/raw/0f235c6d40462fd2f0e55364b874f14fe3fd613c/lvgl_hello_world.py&script_startup=https://gist.githubusercontent.com/amirgon/7bf15a66ba6d959bbf90d10f3da571be/raw/8684b5fa55318c184b1310663b187aaab5c65be6/init_lv_mp_js.py)

Note: the online simulator is available for lvgl v6 and v7.

</p>
</details>

如果你想在不下载任何东西的情况下试验 LVGL + Micropython - 你可以使用我们的在线模拟器！
它是一个功能齐全的 LVGL + Micropython，完全在浏览器中运行，并允许您编辑 Python 脚本并运行它。

【点击这里体验在线模拟器上实验】(https://sim.lvgl.io/)

[Hello World](https://sim.lvgl.io/v7/micropython/ports/javascript/bundle_out/index.html?script=https://gist.githubusercontent.com/amirgon/51299ce9b6448328a855826149482ae6/raw/0f235c6d40462fd2f0e55364b874f14fe3fd613c/lvgl_hello_world.py&script_startup=https://gist.githubusercontent.com/amirgon/7bf15a66ba6d959bbf90d10f3da571be/raw/8684b5fa55318c184b1310663b187aaab5c65be6/init_lv_mp_js.py)

注意：此在线模拟器适用于 lvgl v6 和 v7。

### PC Simulator（PC模拟器）

<details>
<summary>查看原文</summary>
<p>

Micropython is ported to many platforms. One notable port is "unix", which allows you to build and run Micropython (+LVGL) on a Linux machine. (On a Windows machine you might need Virtual Box or WSL or MinGW or Cygwin etc.)  

[Click here to know more information about building and running the unix port](https://github.com/lvgl/lv_micropython)

</p>
</details>

Micropython 被移植到许多平台。一个值得注意的端口是“unix”，它允许您在 Linux 机器上构建和运行 Micropython (+LVGL)。 （在 Windows 机器上，您可能需要 Virtual Box 或 WSL 或 MinGW 或 Cygwin 等）

[点击这里了解更多关于构建和运行unix端口的信息](https://github.com/lvgl/lv_micropython)

### Embedded platform（嵌入式平台）

<details>
<summary>查看原文</summary>
<p>

In the end, the goal is to run it all on an embedded platform.  
Both Micropython and LVGL can be used on many embedded architectures, such as stm32, ESP32 etc.  
You would also need display and input drivers. We have some sample drivers (ESP32+ILI9341, as well as some other examples), but chances are you would want to create your own input/display drivers for your specific hardware.
Drivers can be implemented either in C as a Micropython module, or in pure Micropython!

</p>
</details>

最后，目标是在嵌入式平台上运行它。
Micropython 和 LVGL 都可以用于许多嵌入式架构，例如 stm32、ESP32 等。
您还需要显示和输入驱动程序。我们有一些示例驱动程序（ESP32+ILI9341，以及其他一些示例），但您可能希望为您的特定硬件创建自己的输入/显示驱动程序。
驱动程序可以在 C 中实现为 Micropython 模块，也可以在纯 Micropython 中实现！

## Where can I find more information?（我在哪里可以找到更多的信息？）

<details>
<summary>查看原文</summary>
<p>

- In this [Blog Post](https://blog.lvgl.io/2019-02-20/micropython-bindings)
- `lv_micropython` [README](https://github.com/lvgl/lv_micropython)
- `lv_binding_micropython` [README](https://github.com/lvgl/lv_binding_micropython)
- The [LVGL micropython forum](https://forum.lvgl.io/c/micropython) (Feel free to ask anything!)
- At Micropython: [docs](http://docs.micropython.org/en/latest/) and [forum](https://forum.micropython.org/)

</p>
</details>


- 在这个[博客帖子](https://blog.lvgl.io/2019-02-20/micropython-bindings)
- `lv_micropython` [自述文件](https://github.com/lvgl/lv_micropython)
- `lv_binding_micropython` [自述文件](https://github.com/lvgl/lv_binding_micropython)
- [LVGL micropython 论坛](https://forum.lvgl.io/c/micropython)（请随意提问！）
- 在 Micropython：[docs](http://docs.micropython.org/en/latest/) 和 [forum](https://forum.micropython.org/)