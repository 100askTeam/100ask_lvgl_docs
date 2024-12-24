.. _arm2d:

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

Arm-2D is an open-source project on GitHub. For more, please refer to:
https://github.com/ARM-software/Arm-2D.

.. raw:: html

   </details>
   <br>


Arm-2D 不是 GPU，而是 **为微控制器专用的 2D GPU 抽象层**。它支持所有 Cortex-M 处理器，从 Cortex-M0 到最新的 Cortex-M85。

Arm-2D 通过两种模式加速 LVGL9： **同步模式** 和 **异步模式**。

- 当 **Helium** 和 **ACI (Arm Custom Instruction)** 可用时，推荐使用 **同步模式** 来加速 LVGL。
- 当 Arm-2D 支持的 2D-GPU 可用时，例如 **基于 DMAC-350 的 2D GPU**，推荐使用 **异步模式** 来加速 LVGL。

Arm-2D 是一个开源项目，托管在 GitHub 上。更多信息，请参考：  
https://github.com/ARM-software/Arm-2D。

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

一般来说：  

- 您可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC` 设置为 ``1``，并将 :c:macro:`LV_DRAW_SW_ASM` 设置为 ``LV_DRAW_SW_ASM_HELIUM`` 来启用 Arm-2D 同步加速以加速 LVGL。  
- 您可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_ASYNC` 设置为 ``1`` 来启用 Arm-2D 异步加速以加速 LVGL。

如果您使用 `CMSIS-Pack <https://github.com/lvgl/lvgl/tree/master/env_support/cmsis-pack>`__ 来部署 LVGL，则不需要手动定义宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC`，而是通过 lv_conf_cmsis.h 检查环境并相应地设置 :c:macro:`LV_USE_DRAW_ARM2D_SYNC`。


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
   proprietary 2D accelerators and/or ACI (Arm Customized Instruction).
-  The target device contains
   `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__

.. raw:: html

   </details>
   <br>


如前所述，Arm-2D 是一个 2D GPU 抽象层；因此，如果没有加速器或专用指令集（如 Helium 或 ACI）可供 Arm-2D 使用，它对常规 Cortex-M 处理器的 LVGL 性能提升微乎其微（有时甚至更差）。

**我们强烈建议在以下情况下启用 Arm-2D 加速来加速 LVGL：**

- 目标处理器为 **Cortex-M55**、 **Cortex-M52** 和 **Cortex-M85**
- 目标处理器支持 `Helium <https://developer.arm.com/documentation/102102/0103/?lang=en>`__。
- 设备厂商提供与 arm-2d 兼容的驱动程序，以支持其专有 2D 加速器和/或 ACI（Arm 定制指令）。
- 目标设备包含 `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__。

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

:ref:`lv_draw_sw_arm2d_h`

:ref:`lv_blend_arm2d_h`
