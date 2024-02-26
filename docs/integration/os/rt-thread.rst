==============
RT-Thread RTOS
==============

What is RT-Thread?（RT-Thread是什么？）
---------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`RT-Thread <https://www.rt-thread.io/>`__ is an `open
source <https://github.com/RT-Thread/rt-thread>`__, neutral, and
community-based real-time operating system (RTOS). RT-Thread has
**Standard version** and **Nano version**. For resource-constrained
microcontroller (MCU) systems, the Nano version that requires only 3 KB
Flash and 1.2 KB RAM memory resources can be tailored with easy-to-use
tools. For resource-rich IoT devices, RT-Thread can use the **online
software package** management tool, together with system configuration
tools, to achieve intuitive and rapid modular cutting, seamlessly import
rich software packages; thus, achieving complex functions like Android's
graphical interface and touch sliding effects, smart voice interaction
effects, and so on.

.. raw:: html

   </details>
   <br>


`RT-Thread <https://www.rt-thread.io/>`__是一个开源 `<https://github.com/RT-Thread/rt-thread>`__、中立、基于社区的实时操作系统（RTOS）。
RT-Thread有 **标准版**和 **Nano版**。
对于资源受限的微控制器（MCU）系统，Nano版只需要3 KB的Flash和1.2 KB的RAM内存资源，并可使用易于使用的工具进行定制。
对于资源丰富的IoT设备，RT-Thread可以使用 **在线软件包管理工具**和 **系统配置工具**，实现直观的快速模块化切割，无缝导入丰富的软件包；
从而实现像Android的图形界面和触摸滑动效果、智能语音交互效果等复杂功能。


Key features（主要特点）
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Designed for resource-constrained devices, the minimum kernel
   requires only 1.2KB of RAM and 3 KB of Flash.
-  A variety of standard interfaces, such as POSIX, CMSIS, C++
   application environment.
-  Has rich components and a prosperous and fast growing `package ecosystem <https://packages.rt-thread.org/en/>`__
-  Elegant code style, easy to use, read and master.
-  High Scalability. RT-Thread has high-quality scalable software
   architecture, loose coupling, modularity, is easy to tailor and
   expand.
-  Supports high-performance applications.
-  Supports all mainstream compiling tools such as GCC, Keil and IAR.
-  Supports a wide range of `architectures and chips <https://www.rt-thread.io/board.html>`__

.. raw:: html

   </details>
   <br>


-  专为资源受限的设备设计，最小内核仅需1.2KB的RAM和3 KB的Flash。  
-  具有多种标准接口，如POSIX、CMSIS、C++应用环境。  
-  拥有丰富的组件和繁荣且快速发展的 `软件包生态系统 <https://packages.rt-thread.org/en/>`__。  
-  代码风格优雅，易于使用、阅读和掌握。  
-  高度可扩展。RT-Thread具有高质量的可扩展软件架构，耦合度低，模块化，易于定制和扩展。  
-  支持高性能应用。  
-  支持所有主流的编译工具，如GCC、Keil和IAR。  
-  支持广泛的 `架构和芯片 <https://www.rt-thread.io/board.html>`__。


How to run LVGL on RT-Thread?（如何在RT-Thread上运行LVGL）
---------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`中文文档 <https://www.rt-thread.org/document/site/#/rt-thread-version/rt-thread-standard/packages-manual/lvgl-docs/introduction>`__

LVGL has registered as a
`softwarepackage <https://packages.rt-thread.org/en/detail.html?package=LVGL>`__
of RT-Thread. By using
`Env tool <https://www.rt-thread.io/download.html?download=Env>`__ or
`RT-Thread Studio IDE <https://www.rt-thread.io/download.html?download=Studio>`__,
RT-Thread users can easily download LVGL source code and combine with
RT-Thread project.

.. raw:: html

   </details>
   <br>


`中文文档 <https://www.rt-thread.org/document/site/#/rt-thread-version/rt-thread-standard/packages-manual/lvgl-docs/introduction>`__

LVGL已在RT-Thread中注册为
`软件包 <https://packages.rt-thread.org/en/detail.html?package=LVGL>`。通过使用
`Env工具 <https://www.rt-thread.io/download.html?download=Env>`__ 或
`RT-Thread Studio IDE <https://www.rt-thread.io/download.html?download=Studio>`__，
RT-Thread用户可以轻松下载LVGL源代码并将其与RT-Thread项目结合。



.. raw:: html

   <details>
     <summary>显示原文</summary>

RT-Thread community has port LVGL to several BSPs:

.. raw:: html

   </details>
   <br>


RT-Thread社区已经将LVGL移植到了多个BSP（板级支持包）上：


+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| BSP                                                                                                                                  | BSP                                                                                                                                                  |
+======================================================================================================================================+======================================================================================================================================================+
| `QEMU simulator <https://github.com/RT-Thread/rt-thread/tree/master/bsp/qemu-vexpress-a9/applications/lvgl>`__                       | `Infineon psoc6-evaluationkit-062S2 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/Infineon/psoc6-evaluationkit-062S2/applications/lvgl>`__ |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Visual Studio simulator <https://github.com/RT-Thread/rt-thread/tree/master/bsp/simulator/applications/lvgl>`__                     | `Renesas ra6m3-ek <https://github.com/RT-Thread/rt-thread/tree/master/bsp/renesas/ra6m3-ek/board/lvgl>`__                                            |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-iot-m487 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-iot-m487/applications/lvgl>`__     | `Renesas ra6m4-cpk <https://github.com/RT-Thread/rt-thread/tree/master/bsp/renesas/ra6m4-cpk/board/lvgl>`__                                          |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-pfm-m487 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-pfm-m487/applications/lvgl>`__     | `Renesas ra6m3-hmi <https://github.com/RT-Thread/rt-thread/tree/master/bsp/renesas/ra6m3-hmi-board/board/lvgl>`__                                    |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton nk-980iot <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/nk-980iot/applications/lvgl>`__                   | `STM32H750 ART-Pi <https://github.com/RT-Thread/rt-thread/tree/master/bsp/stm32/stm32h750-artpi/applications/lvgl>`__                                |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-m2354 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-m2354/applications/lvgl>`__           | `STM32F469 Discovery <https://github.com/RT-Thread/rt-thread/tree/master/bsp/stm32/stm32f469-st-disco/applications/lvgl>`__                          |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton nk-n9h30 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/nk-n9h30/applications/lvgl>`__                     | `STM32F407 explorer <https://github.com/RT-Thread/rt-thread/tree/master/bsp/stm32/stm32f407-atk-explorer/applications/lvgl>`__                       |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-m032ki <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-m032ki/applications/lvgl>`__         | `STM32L475 pandora <https://github.com/RT-Thread/rt-thread/tree/master/bsp/stm32/stm32l475-atk-pandora/applications/lvgl>`__                         |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-hmi-ma35d1 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-hmi-ma35d1/applications/lvgl>`__ | `NXP imxrt1060-evk <https://github.com/RT-Thread/rt-thread/tree/master/bsp/imxrt/imxrt1060-nxp-evk/applications/lvgl>`__                             |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-iot-m467 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-iot-m467/applications/lvgl>`__     | `Raspberry PICO <https://github.com/RT-Thread/rt-thread/tree/master/bsp/raspberry-pico/applications/lvgl>`__                                         |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `Nuvoton numaker-m467hj <https://github.com/RT-Thread/rt-thread/tree/master/bsp/nuvoton/numaker-m467hj/applications/lvgl>`__         | `NXP LPC55S69 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/lpc55sxx/lpc55s69_nxp_evk/applications/lvgl>`__                                |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+
| `synwit swm341 <https://github.com/RT-Thread/rt-thread/tree/master/bsp/synwit/swm341/applications/lvgl>`__                                                                                                                                                                                  |
+--------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------+


Tutorials（教程）
~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `Introduce about RT-Thread and how to run LVGL on RT-Thread in simulators <https://www.youtube.com/watch?v=k7QYk6hSwnc>`__
-  `How to import a BSP project with latest code into RT-Thread Studio <https://www.youtube.com/watch?v=fREPLuh-h8k>`__
-  `How to Use LVGL with RT-Thread Studio in STM32F469 Discovery Board <https://www.youtube.com/watch?v=O_QA99BxnOE>`__
-  `RT-Thread Youtube Channel <https://www.youtube.com/channel/UCdDHtIfSYPq4002r27ffqPw>`__
-  `RT-Thread documentation center <https://www.rt-thread.io/document/site/>`__

.. raw:: html

   </details>
   <br>
   

-  `介绍RT-Thread以及如何在模拟器上运行LVGL <https://www.youtube.com/watch?v=k7QYk6hSwnc>`__
-  `如何将最新的BSP项目代码导入RT-Thread Studio <https://www.youtube.com/watch?v=fREPLuh-h8k>`__
-  `如何在STM32F469 Discovery板上使用RT-Thread Studio的LVGL <https://www.youtube.com/watch?v=O_QA99BxnOE>`__
-  `RT-Thread Youtube频道 <https://www.youtube.com/channel/UCdDHtIfSYPq4002r27ffqPw>`__
-  `RT-Thread文档中心 <https://www.rt-thread.io/document/site/>`__

