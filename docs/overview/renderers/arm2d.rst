===============================
Arm-2D GPU （Arm-2D 图形处理器）
===============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Arm-2D is not a GPU but **an abstraction layer for 2D GPUs dedicated to
Microcontrollers**. It supports all Cortex-M processors ranging from
Cortex-M0 to the latest Cortex-M85.

Arm-2D accelerates LVGL9 with two modes: **Synchronous Mode** and
**Asynchronous Mode**. 
- When **Helium** and **ACI (Arm Custom Instruction)** are available, it is recommend
  to use **Synchronous Mode** to accelerate LVGL. 
- When Arm-2D backed 2D-GPUs are available, for example, **DMAC-350 based 2D
  GPUs**, it is recommend to use **Asynchronous Mode** to accelerate LVGL.

Arm-2D is an open-source project on Github. For more, please refer to:
https://github.com/ARM-software/Arm-2D.

.. raw:: html

   </details>
   <br>


Arm-2D 本身并非GPU，而是一个 **针对微控制器上常用2DGPU的硬件抽象层** ，支持从Cortex-M0到最新Cortex-M85的所有Cortex-M处理器。

Arm-2D提供两种加速方式： **同步模式（Synchronouse Mode）** 和 **异步模式（Asynchronous Mode）** 。

- 当芯片支持 **Helium** 或者 **ACI(Arm Custom Instruction)** 时，推荐使用 **同步模式** 来加速LVGL；
- 当芯片中存在Arm-2D所支持的2D GPU时，（例如：基于Arm DMAC-350所派生出来的2D GPU），推荐使用 **异步模式** 来加速LVGL。

Arm-2D是一个托管在Github上的开源项目，更多信息请参考：https://github.com/ARM-software/Arm-2D


How to Use （如何使用）
**********************

.. raw:: html

   <details>
     <summary>显示原文</summary>


In general:
- you can set the macro :c:macro:`LV_USE_DRAW_ARM2D_SYNC` to ``1`` and 
  :c:macro:`LV_DRAW_SW_ASM` to ``LV_DRAW_SW_ASM_HELIUM`` in ``lv_conf.h`` to 
  enable Arm-2D synchronous acceleration for LVGL. 
- You can set 
  the macro :c:macro:`LV_USE_DRAW_ARM2D_ASYNC` to ``1`` in ``lv_conf.h`` to enable 
  Arm-2D Asynchronous acceleration for LVGL. 

If you are using
`CMSIS-Pack <https://github.com/lvgl/lvgl/tree/master/env_support/cmsis-pack>`__
to deploy the LVGL. You don't have to define the macro
:c:macro:`LV_USE_DRAW_ARM2D_SYNC` manually, instead the lv_conf_cmsis.h will
check the environment and set the :c:macro:`LV_USE_DRAW_ARM2D_SYNC` accordingly.

.. raw:: html

   </details>
   <br>


总的来说：

- 你可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC` 设置为 ``1``、将宏 :c:macro:`LV_DRAW_SW_ASM` 设置为 ``LV_DRAW_SW_ASM_HELIUM`` 来为LVGL开启Arm-2D同步加速模式。
- 你可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_ASYNC` 设置为 ``1`` 为LVGL开启Arm-2D的异步加速模式。

如果你是使用 `CMSIS-Pack <https://github.com/lvgl/lvgl/tree/master/env_support/cmsis-pack>`__ 来部署LVGL，则不需要手动的定义宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC`，因为 lv_conf_cmsis.h 会根据当前的编译环境自动的对其进行配置。


Design Considerations（设计建议）
************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>


As mentioned before, Arm-2D is an abstraction layer for 2D GPU; hence if
there is no accelerator or dedicated instruction set (such as Helium or
ACI) available for Arm-2D, it provides negligible performance boost for
LVGL (sometimes worse) for regular Cortex-M processors.

**We highly recommend you enable Arm-2D acceleration for LVGL** when:

-  The target processors are **Cortex-M55**, **Cortex-M52** and **Cortex-M85**
-  The target processors support
   `Helium <https://developer.arm.com/documentation/102102/0103/?lang=en>`__.
-  The device vendor provides an arm-2d compliant driver for their
   propriotory 2D accelerators and/or ACI(Arm Customized Instruction).
-  The target device contains
   `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__

.. raw:: html

   </details>
   <br>


正如前面所说的那样，Arm-2D是一个针对2D GPU的硬件抽象层，因此，如果系统中既没有硬件加速器、也没有诸如Helium或者ACI这样能够起到加速作用的指令集，那么对普通的Cortex-M处理器来说Arm-2D几乎就无法为LVGL起到任何加速作用（有时甚至还有相反的效果）。

因此，我们 **推荐大家只在如下所示的情形中为LVGL开启Arm-2D加速** ：

- 目标处理器为 **Cortex-M55** 、 **Cortex-M52** 或者 **Cortex-M85** ；
- 目标处理器支持 `Helium <https://developer.arm.com/documentation/102102/0103/?lang=en>`__；
- 芯片厂商为自己的2D GPU或者ACI指令集提供了针对Arm-2D的驱动适配；
- 芯片中包含 `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__


Examples（示例工程）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `A Cortex-M55 (supports Helium) based MDK Project, PC emulation is
   available. <https://github.com/lvgl/lv_port_an547_cm55_sim>`__

.. raw:: html

   </details>
   <br>


- `基于Cortex-M55 FVP仿真的MDK工程 <https://github.com/lvgl/lv_port_an547_cm55_sim>`__


API
***

:ref:`lv_gpu_arm2d`
