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


Arm-2D 不是 GPU，而是专用于 **2D GPU 的抽象层，专用于微控制器** 。它支持所有 Cortex-M 处理器，包括 Cortex-M0 到最新的 Cortex-M85。

Arm-2D 使用两种模式加速 LVGL9：同步模式和异步模式。 
- 当 Helium 和 ACI（Arm Custom Instruction）可用时，建议使用使用同步模式加速LVGL。
- 当 Arm-2D 支持的 2D-GPU 可用时，例如，基于 DMAC-350 的 2D GPU，建议使用异步模式加速LVGL。

Arm-2D 是 Github 上的一个开源项目。欲了解更多信息，请参阅：https://github.com/ARM-software/Arm-2D。


How to Use （如何使用）
**********************

.. raw:: html

   <details>
     <summary>显示原文</summary>


In general:
- you can set the macro :c:macro:`LV_USE_DRAW_ARM2D_SYNC` to ``1`` in
  ``lv_conf.h`` to enable Arm-2D synchronous acceleration for LVGL. 
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


通常：  
- 您可以将 :c:macro:`LV_USE_DRAW_ARM2D_SYNC` 设置 ``lv_conf.h`` 为 ``1`` 以启用LVGL的Arm-2D同步加速。
- 您可以将 :c:macro:`LV_USE_DRAW_ARM2D_ASYNC` 设置 ``lv_conf.h`` 为 ``1`` 以启用LVGL的Arm-2D异步加速。

如果您正在使用
`CMSIS-Pack <https://github.com/lvgl/lvgl/tree/master/env_support/cmsis-pack>`__
以部署LVGL。您不必手动定义宏
:c:macro:`LV_USE_DRAW_ARM2D_SYNC` ，而LV_conf_cmsis.h将
检查环境并相应地设置 :c:macro:`LV_USE_DRAW_ARM2D_SYNC` 。


Design Considerations（设计注意事项）
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


如前所述，Arm-2D是2D GPU的抽象层；因此，如果没有可用于 Arm-2D 的加速器或专用指令集（例如 Helium 或 ACI），那么它为常规 Cortex-M 处理器提供的 LVGL 性能提升可以忽略不计（有时更糟）。

**我们强烈建议您在以下情况下为 LVGL 启用 Arm-2D 加速** ：

- 目标处理器是 **Cortex-M55** 、 **Cortex-M52** 和 **Cortex-M85**
- 目标处理器支持 `Helium <https://developer.arm.com/documentation/102102/0103/?lang=en>`__。
- 设备供应商为其专有的 2D 加速器和/或 ACI（Arm 定制指令）提供兼容 ARM-2D 的驱动程序。
- 目标设备包含 `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__


Examples（示例）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  `A Cortex-M55 (supports Helium) based MDK Project, PC emulation is
   available. <https://github.com/lvgl/lv_port_an547_cm55_sim>`__

.. raw:: html

   </details>
   <br>


`基于 Cortex-M55（支持 Helium）的 MDK 项目，可进行 PC 仿真。 <https://github.com/lvgl/lv_port_an547_cm55_sim>`__


API
***

:ref:`lv_gpu_arm2d`
