==========
NuttX RTOS
==========

What is NuttX?（NuttX是什么？）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`NuttX <https://nuttx.apache.org/>`__ is a mature and secure real-time
operating system (RTOS) with an emphasis on technical standards
compliance and small size. It is scalable from 8-bit to 64-bit
microcontrollers and microprocessors and compliant with the Portable
Operating System Interface (POSIX) and the American National Standards
Institute (ANSI) standards and with many Linux-like subsystems. The best
way to think about NuttX is to think of it as a small Unix/Linux for
microcontrollers.

.. raw:: html

   </details>
   <br>


`NuttX <https://nuttx.apache.org/>`__ 是一个成熟且安全的实时操作系统（RTOS），它强调技术标准的符合性和小巧的尺寸。
它可以从8位扩展到64位微控制器和微处理器，并符合可移植操作系统接口（POSIX）和美国国家标准协会（ANSI）标准，以及许多类似Linux的子系统。
将NuttX视为微控制器上的小型Unix/Linux是最佳的思考方式。


Highlights of NuttX（NuttX 的亮点）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  **Small** - Fits and runs in microcontrollers as small as 32 kB Flash
   and 8 kB of RAM.
-  **Compliant** - Strives to be as compatible as possible with POSIX
   and Linux.
-  **Versatile** - Supports many architectures (ARM, ARM Thumb, AVR,
   MIPS, OpenRISC, RISC-V 32-bit and 64-bit, RX65N, x86-64, Xtensa,
   Z80/Z180, etc.).
-  **Modular** - Its modular design allows developers to select only
   what really matters and use modules to include new features.
-  **Popular** - NuttX is used by many companies around the world.
   Probably you already used a product with NuttX without knowing it was
   running NuttX.
-  **Predictable** - NuttX is a preemptible Realtime kernel, so you can
   use it to create predictable applications for realtime control.

.. raw:: html

   </details>
   <br>


- **小巧** - 适合并能在小至32kB闪存和8kB内存的微控制器上运行。
- **兼容** - 致力于尽可能与POSIX和Linux兼容。
- **多功能** - 支持多种架构（ARM、ARM Thumb、AVR、MIPS、OpenRISC、RISC-V 32位和64位、RX65N、x86-64、Xtensa、Z80/Z180等）。
- **模块化** - 其模块化设计允许开发人员仅选择真正重要的部分，并使用模块添加新功能。
- **受欢迎** - NuttX被世界各地的许多公司所使用。你可能已经在使用带有NuttX的产品，而不知道它正在运行NuttX。
- **可预测** - NuttX是一个可抢占的实时内核，因此你可以使用它来创建可预测的实时控制应用程序。


--------------

Why NuttX + LVGL?（为什么选择NuttX + LVGL？）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Although NuttX has its own graphic library called
`NX <https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=139629474>`__,
LVGL is a good alternative because users could find more eye-candy demos
and they can reuse code from previous projects. LVGL is an
`Object-Oriented Component
Based <https://blog.lvgl.io/2018-12-13/extend-lvgl-objects>`__
high-level GUI library, that could fit very well for a RTOS with
advanced features like NuttX. LVGL is implemented in C and its APIs are
in C.

.. raw:: html

   </details>
   <br>


尽管NuttX有自己的图形库名为 `NX <https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=139629474>`__，
但LVGL是一个很好的替代选择，因为用户可以找到更多具有吸引力的演示，并且可以重用以前项目的代码。
LVGL是一个基于 `面向对象组件`的 `<https://blog.lvgl.io/2018-12-13/extend-lvgl-objects>`__高级GUI库，
非常适合像NuttX这样具有高级功能的RTOS。LVGL是用C语言编写的，其API也是用C语言编写的。


Here are some advantages of using LVGL in NuttX（以下是在NuttX中使用LVGL的一些优势）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Develop GUI in Linux first and when it is done just compile it for
   NuttX. Nothing more, no wasting of time.
-  Usually, GUI development for low level RTOS requires multiple
   iterations to get things right, where each iteration consists of
   **``Change code`` > ``Build`` > ``Flash`` > ``Run``**. Using LVGL,
   Linux and NuttX you can reduce this process and just test everything
   on your computer and when it is done, compile it on NuttX and that is
   it.

.. raw:: html

   </details>
   <br>


-  首先在Linux上开发GUI，当开发完成后，只需为其编译NuttX版本。无需浪费时间。  
-  通常，为低级RTOS开发GUI需要多次迭代才能正确完成，每个迭代过程包括 **``更改代码``>``构建``>``闪存``>``运行``**。
   使用LVGL、Linux和NuttX，您可以简化此过程，只需在计算机上测试所有内容，当完成后，在NuttX上编译即可。  
  

NuttX + LVGL could be used for（NuttX + LVGL可用于 ）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  GUI demos to demonstrate your board graphics capacities.
-  Fast prototyping GUI for MVP (Minimum Viable Product) presentation.
-  visualize sensor data directly and easily on the board without using
   a computer.
-  Final products with a GUI without a touchscreen (i.e. 3D Printer
   Interface using Rotary Encoder to Input data).
-  Final products with a touchscreen (and all sorts of bells and
   whistles).

.. raw:: html

   </details>
   <br>


-  GUI演示，展示您的板卡图形功能。  
-  用于MVP（最小可行产品）演示的快速原型GUI。  
-  直接在板上可视化传感器数据，无需使用计算机。  
-  没有触摸屏的最终产品（例如，使用旋转编码器输入数据的3D打印机界面）。  
-  具有触摸屏的最终产品（以及各种花哨功能）。


--------------

How to get started with NuttX and LVGL?（如何开始使用NuttX和LVGL？）
---------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are many boards in the `NuttX
mainline <https://github.com/apache/incubator-nuttx>`__ with support for
LVGL. Let's use the
`STM32F429IDISCOVERY <https://www.st.com/en/evaluation-tools/32f429idiscovery.html>`__
as an example because it is a very popular board.

.. raw:: html

   </details>
   <br>


`NuttX主线 <https://github.com/apache/incubator-nuttx>`__中有很多支持LVGL的板卡。
让我们以 `STM32F429IDISCOVERY <https://www.st.com/en/evaluation-tools/32f429idiscovery.html>`__为例，
因为它是一个非常受欢迎的板卡。


First you need to install the pre-requisites on your system
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Let's use the `Windows Subsystem for
Linux <https://acassis.wordpress.com/2018/01/10/how-to-build-nuttx-on-windows-10/>`__

.. raw:: html

   </details>
   <br>


让我们使用 `Windows Subsystem for Linux <https://acassis.wordpress.com/2018/01/10/how-to-build-nuttx-on-windows-10/>`__


.. code:: shell

   $ sudo apt-get install automake bison build-essential flex gcc-arm-none-eabi gperf git libncurses5-dev libtool libusb-dev libusb-1.0.0-dev pkg-config kconfig-frontends openocd

Now let's create a workspace to save our files（现在，我们创建一个工作区来保存我们的文件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

   $ mkdir ~/nuttxspace
   $ cd ~/nuttxspace

Clone the NuttX and Apps repositories:（克隆NuttX和Apps存储库：）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

   $ git clone https://github.com/apache/incubator-nuttx nuttx
   $ git clone https://github.com/apache/incubator-nuttx-apps apps

Configure NuttX to use the stm32f429i-disco board and the LVGL Demo（配置NuttX以使用stm32f429i-disco板和LVGL演示）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

   $ ./tools/configure.sh stm32f429i-disco:lvgl
   $ make

.. raw:: html

   <details>
     <summary>显示原文</summary>

If everything went fine you should have now the file ``nuttx.bin`` to
flash on your board:

.. raw:: html

   </details>
   <br>

如果一切正常，您现在应该拥有名为 ``nuttx.bin``的文件，可以将其刷写到您的板卡上：


.. code:: shell

   $ ls -l nuttx.bin
   -rwxrwxr-x 1 alan alan 287144 Jun 27 09:26 nuttx.bin

Flashing the firmware in the board using OpenOCD:（使用OpenOCD将固件刷写到板卡上：）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: shell

   $ sudo openocd -f interface/stlink-v2.cfg -f target/stm32f4x.cfg -c init -c "reset halt" -c "flash write_image erase nuttx.bin 0x08000000"

.. raw:: html

   <details>
     <summary>显示原文</summary>

Reset the board and using the 'NSH>' terminal start the LVGL demo:

.. raw:: html

   </details>
   <br>


重置板卡并使用'NSH>'终端启动LVGL演示：


.. code:: shell

   nsh> lvgldemo

Where can I find more information?（在哪里可以找到更多信息？）
----------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  This blog post: `LVGL on
   LPCXpresso54628 <https://acassis.wordpress.com/2018/07/19/running-nuttx-on-lpcxpresso54628-om13098/>`__
-  NuttX mailing list: `Apache NuttX Mailing
   List <http://nuttx.incubator.apache.org/community/>`__

.. raw:: html

   </details>
   <br>


- 这篇博客文章： `LVGL on LPCXpresso54628 <https://acassis.wordpress.com/2018/07/19/running-nuttx-on-lpcxpresso54628-om13098/>`__
- NuttX邮件列表： `Apache NuttX Mailing List <http://nuttx.incubator.apache.org/community/>`__

