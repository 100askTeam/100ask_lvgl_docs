=============================================================
OpenGL ES Display/Inputs driver（OpenGL ES 显示/输入驱动程序）
=============================================================

Overview（概述）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

| The **OpenGL ES** display/input `driver <https://github.com/lvgl/lvgl/src/drivers/opengles>`__ offers support for simulating the LVGL display and keyboard/mouse inputs in an desktop window created via GLFW.
| It is an alternative to **Wayland**, **XCB**, **SDL** or **Qt**.

The main purpose for this driver is for testing/debugging the LVGL application in an **OpenGL** simulation window.

.. raw:: html

   </details>
   <br>


| OpenGL ES 显示/输入 驱动程序 <https://github.com/lvgl/lvgl/src/drivers/opengles>__ 为通过GLFW创建的桌面窗口中的LVGL显示和键盘/鼠标输入提供模拟支持。
| 它是 Wayland、XCB、SDL 或 Qt 的替代方案。

这个驱动程序的主要目的是在 OpenGL 模拟窗口中测试/调试LVGL应用程序。


Prerequisites（先决条件）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The OpenGL driver uses GLEW GLFW to access the OpenGL window manager.

1. Install GLEW and GLFW: ``sudo apt-get install libglew-dev libglfw3-dev``

.. raw:: html

   </details>
   <br>


OpenGL驱动程序使用GLEW GLFW来访问OpenGL窗口管理器。

1. 安装GLEW和GLFW： ``sudo apt-get install libglew-dev libglfw3-dev``


Configure OpenGL driver（配置OpenGL驱动程序）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

1. Required linked libraries: -lGL -lGLEW -lglfw
2. Enable the OpenGL driver support in lv_conf.h, by cmake compiler define or by KConfig
    .. code:: c

        #define LV_USE_OPENGLES  1

.. raw:: html

   </details>
   <br>


1. 需要链接的库：-lGL -lGLEW -lglfw
2. 在 lv_conf.h 中通过cmake编译器定义或KConfig启用OpenGL驱动程序支持
    .. code:: c

        #define LV_USE_OPENGLES  1

Usage
-----

.. code:: c

    #include "lvgl/lvgl.h"
    #include "lvgl/examples/lv_examples.h"
    #include "lvgl/demos/lv_demos.h"

    int main()
    {
        lv_init();

        lv_display_t * disp = lv_glfw_window_create(480, 272);

        lv_indev_t * mouse = lv_glfw_mouse_create();
        lv_indev_set_group(mouse, lv_group_get_default());
        lv_indev_set_display(mouse, disp);

        lv_display_set_default(disp);

        LV_IMAGE_DECLARE(mouse_cursor_icon); /*Declare the image file.*/
        lv_obj_t * cursor_obj;
        cursor_obj = lv_image_create(lv_screen_active());   /*Create an image object for the cursor */
        lv_image_set_src(cursor_obj, &mouse_cursor_icon);   /*Set the image source*/
        lv_indev_set_cursor(mouse, cursor_obj);             /*Connect the image  object to the driver*/

        lv_demo_widgets();

        while (1)
        {
            uint32_t time_till_next = lv_timer_handler();
            lv_delay_ms(time_till_next);
        }

        return 0;
    }
