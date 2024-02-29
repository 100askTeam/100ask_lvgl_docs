========================================================
Windows Display/Inputs driver（Windows显示/输入驱动程序）
========================================================

Overview（概览）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The **Windows** display/input `driver <https://github.com/lvgl/lvgl/src/drivers/windows>`__ offers support for simulating the LVGL display and keyboard/mouse inputs in a Windows Win32 window.

The main purpose for this driver is for testing/debugging the LVGL application in a **Windows** simulation window via **simulator mode**, or developing a standard **Windows** desktop application with LVGL via **application mode**.

Here are the **similarity** for simulator mode and application mode.

- Support LVGL pointer, keypad and encoder devices integration.
- Support Windows touch input.
- Support Windows input method integration input.
- Support Per-monitor DPI Aware (both V1 and V2).

Here are the **differences** for simulator mode and application mode.

.. raw:: html

   </details>
   <br>


**模拟器模式** 和 **应用程序模式** 的区别如下：

- 模拟器模式下支持模拟LVGL的显示和键盘/鼠标输入，用于在Windows模拟窗口中测试/调试LVGL应用程序。
- 应用程序模式下支持在LVGL下开发标准的Windows桌面应用程序。

以下是模拟器模式和应用程序模式的相似之处：

- 支持LVGL指针、键盘和编码器设备的集成。
- 支持Windows触摸输入。
- 支持Windows输入法集成。
- 支持每个监视器的DPI自适应（V1和V2均可）。


Simulator Mode（模拟器模式）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Designed for LVGL simulation scenario.
- Keep the LVGL display resolution all time for trying best to simulate UI layout which will see in their production devices.
- When Windows DPI scaling setting is changed, Windows backend will stretch the display content.

.. raw:: html

   </details>
   <br>


- 设计用于LVGL模拟场景。
- 始终保持LVGL显示分辨率，以尽力模拟在产品设备上看到的UI布局。
- 当Windows DPI缩放设置改变时，Windows后端将会拉伸显示内容。


Application Mode（应用模式）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Designed for Windows desktop application development scenario.
- Have the Window resizing support and LVGL display resolution will be changed.
- When Windows DPI scaling setting is changed, the LVGL display DPI value will also be changed.

.. raw:: html

   </details>
   <br>


- 为Windows桌面应用程序开发场景设计。
- 具有窗口调整支持，LVGL显示分辨率将发生变化。
- 当更改Windows的DPI缩放设置时，LVGL显示的DPI值也将发生变化。


Prerequisites（先决条件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The tested minimum Windows OS requirement for this driver is Windows XP RTM.

According to the Windows GDI API this driver used. Maybe the minimum Windows OS requirement for this driver is Windows 2000 RTM.

.. raw:: html

   </details>
   <br>


这个驱动程序被测试的最低 Windows 操作系统要求是 Windows XP RTM。

根据 Windows GDI API 所使用的驱动程序。也许这个驱动程序的最低 Windows 操作系统要求是 Windows 2000 RTM。


Configure Windows driver（配置Windows驱动程序）
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the Windows driver support in lv_conf.h, by cmake compiler define or by KConfig

.. code:: c

    #define LV_USE_WINDOWS  1

.. raw:: html

   </details>
   <br>


在lv_conf.h中启用Windows驱动程序支持，可以通过cmake编译器定义或KConfig来实现。

.. code:: c

    #define LV_USE_WINDOWS  1
    

Usage（用法）
-------------

.. code:: c

    #include <Windows.h>
    #include "lvgl/lvgl.h"
    #include "lvgl/examples/lv_examples.h"
    #include "lvgl/demos/lv_demos.h"

    int main()
    {
        lv_init();

        int32_t zoom_level = 100;
        bool allow_dpi_override = false;
        bool simulator_mode = false;
        lv_display_t* display = lv_windows_create_display(
            L"LVGL Display Window",
            800,
            480,
            zoom_level,
            allow_dpi_override,
            simulator_mode);
        if (!display)
        {
            return -1;
        }

        lv_indev_t* pointer_device = lv_windows_acquire_pointer_indev(display);
        if (!pointer_device)
        {
            return -1;
        }

        lv_indev_t* keypad_device = lv_windows_acquire_keypad_indev(display);
        if (!keypad_device)
        {
            return -1;
        }

        lv_indev_t* encoder_device = lv_windows_acquire_encoder_indev(display);
        if (!encoder_device)
        {
            return -1;
        }

        lv_demo_widgets();

        while (1)
        {
            uint32_t time_till_next = lv_timer_handler();
            Sleep(time_till_next);
        }

        return 0;
    }
