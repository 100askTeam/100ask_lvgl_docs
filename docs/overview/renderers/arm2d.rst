==========
Arm-2D GPU
==========

    Arm-2D 本身并非GPU，而是一个**针对微控制器上常用2DGPU的硬件抽象层**，支持从Cortex-M0到最新Cortex-M85的所有Cortex-M处理器。

    Arm-2D提供两种加速方式：**同步模式（Synchronouse Mode）**和**异步模式（Asynchronous Mode）**。

 - 当芯片支持**Helium**或者**ACI(Arm Custom Instruction)**时，推荐使用**同步模式**来加速LVGL；
 - 当芯片中存在Arm-2D所支持的2D GPU时，（例如：基于Arm DMAC-350所派生出来的2D GPU），推荐使用**异步模式**来加速LVGL。


    Arm-2D是一个托管在Github上的开源项目，更多信息请参考：https://github.com/ARM-software/Arm-2D

如何使用
*******

    总的来说：
    - 你可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC` 设置为 ``1``、将宏 :c::macro:`LV_DRAW_SW_ASM` 设置为 ``LV_DRAW_SW_ASM_HELIUM`` 来为LVGL开启Arm-2D同步加速模式。
    - 你可以在 ``lv_conf.h`` 中将宏 :c:macro:`LV_USE_DRAW_ARM2D_ASYNC` 设置为 ``1`` 为LVGL开启Arm-2D的异步加速模式。

    如果你是使用 `CMSIS-Pack <https://github.com/lvgl/lvgl/tree/master/env_support/cmsis-pack>`__ 来部署LVGL，则不需要手动的定义宏 :c:macro:`LV_USE_DRAW_ARM2D_SYNC`，因为 lv_conf_cmsis.h 会根据当前的编译环境自动的对其进行配置。


设计建议
*******

    正如前面所说的那样，Arm-2D是一个针对2D GPU的硬件抽象层，因此，如果系统中既没有硬件加速器、也没有诸如Helium或者ACI这样能够起到加速作用的指令集，那么对普通的Cortex-M处理器来说Arm-2D几乎就无法为LVGL起到任何加速作用（有时甚至还有相反的效果）。
    因此，我们**推荐大家只在如下所示的情形中为LVGL开启Arm-2D加速**：
    
    - 目标处理器为**Cortex-M55**、**Cortex-M52**或者**Cortex-M85**；
    - 目标处理器支持 `Helium <https://developer.arm.com/documentation/102102/0103/?lang=en>`__；
    - 芯片厂商为自己的2D GPU或者ACI指令集提供了针对Arm-2D的驱动适配；
    - 芯片中包含 `DMAC-350 <https://community.arm.com/arm-community-blogs/b/internet-of-things-blog/posts/arm-corelink-dma-350-next-generation-direct-memory-access-for-endpoint-ai>`__

例子工程
*******

- 基于Cortex-M55 FVP仿真的MDK工程 <https://github.com/lvgl/lv_port_an547_cm55_sim>`__


API
***

:ref:`lv_gpu_arm2d`
