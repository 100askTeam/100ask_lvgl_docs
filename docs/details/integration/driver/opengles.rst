.. _opengl_es_driver:

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
    .. code-block:: c

        #define LV_USE_OPENGLES  1

.. raw:: html

   </details>
   <br>


1. 需要链接的库：-lGL -lGLEW -lglfw
2. 在 lv_conf.h 中通过cmake编译器定义或KConfig启用OpenGL驱动程序支持
    .. code-block:: c

        #define LV_USE_OPENGLES  1

Basic usage（基本用法）
-----------------------

.. code-block:: c

    #include "lvgl/lvgl.h"
    #include "lvgl/examples/lv_examples.h"
    #include "lvgl/demos/lv_demos.h"

    #define WIDTH 640
    #define HEIGHT 480

    int main()
    {
        /* initialize lvgl */
        lv_init();

        /* create a window and initialize OpenGL */
        lv_glfw_window_t * window = lv_glfw_window_create(WIDTH, HEIGHT, true);

        /* create a display that flushes to a texture */
        lv_display_t * texture = lv_opengles_texture_create(WIDTH, HEIGHT);
        lv_display_set_default(texture);

        /* add the texture to the window */
        unsigned int texture_id = lv_opengles_texture_get_texture_id(texture);
        lv_glfw_texture_t * window_texture = lv_glfw_window_add_texture(window, texture_id, WIDTH, HEIGHT);

        /* get the mouse indev of the window texture */
        lv_indev_t * mouse = lv_glfw_texture_get_mouse_indev(window_texture);

        /* add a cursor to the mouse indev */
        LV_IMAGE_DECLARE(mouse_cursor_icon);
        lv_obj_t * cursor_obj = lv_image_create(lv_screen_active());
        lv_image_set_src(cursor_obj, &mouse_cursor_icon);
        lv_indev_set_cursor(mouse, cursor_obj);

        /* create Widgets on the screen */
        lv_demo_widgets();

        while (1)
        {
            uint32_t time_until_next = lv_timer_handler();
            lv_delay_ms(time_until_next);
        }

        return 0;
    }

Advanced usage（高级用法）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The OpenGL driver can draw textures from the user. A third-party library could be
used to add content to a texture and the driver will draw the texture in the window.

.. code-block:: c

    #include "lvgl/lvgl.h"
    #include <GL/glew.h>
    #include <GLFW/glfw3.h>

    #define WIDTH 640
    #define HEIGHT 480

    void custom_texture_example(void)
    {
        /*****************
        *  MAIN WINDOW
        *****************/

        /* create a window and initialize OpenGL */
        /* multiple windows can be created */
        lv_glfw_window_t * window = lv_glfw_window_create(WIDTH, HEIGHT, true);

        /****************************
        *   OPTIONAL MAIN TEXTURE
        ****************************/

        /* create a main display that flushes to a texture */
        lv_display_t * main_texture = lv_opengles_texture_create(WIDTH, HEIGHT);
        lv_display_set_default(main_texture);

        /* add the main texture to the window */
        unsigned int main_texture_id = lv_opengles_texture_get_texture_id(main_texture);
        lv_glfw_texture_t * window_main_texture = lv_glfw_window_add_texture(window, main_texture_id, WIDTH, HEIGHT);

        /* get the mouse indev of this main texture */
        lv_indev_t * main_texture_mouse = lv_glfw_texture_get_mouse_indev(window_main_texture);

        /* add a cursor to the mouse indev */
        LV_IMAGE_DECLARE(mouse_cursor_icon);
        lv_obj_t * cursor_obj = lv_image_create(lv_screen_active());
        lv_image_set_src(cursor_obj, &mouse_cursor_icon);
        lv_indev_set_cursor(main_texture_mouse, cursor_obj);

        /* create Widgets on the screen of the main texture */
        lv_demo_widgets();

        /**********************
        *   ANOTHER TEXTURE
        **********************/

        /* create a sub display that flushes to a texture */
        const int32_t sub_texture_w = 300;
        const int32_t sub_texture_h = 300;
        lv_display_t * sub_texture = lv_opengles_texture_create(sub_texture_w, sub_texture_h);

        /* add the sub texture to the window */
        unsigned int sub_texture_id = lv_opengles_texture_get_texture_id(sub_texture);
        lv_glfw_texture_t * window_sub_texture = lv_glfw_window_add_texture(window, sub_texture_id, sub_texture_w, sub_texture_h);

        /* create Widgets on the screen of the sub texture */
        lv_display_set_default(sub_texture);
        lv_example_keyboard_2();
        lv_display_set_default(main_texture);

        /* position the sub texture within the window */
        lv_glfw_texture_set_x(window_sub_texture, 250);
        lv_glfw_texture_set_y(window_sub_texture, 150);

        /* optionally change the opacity of the sub texture */
        lv_glfw_texture_set_opa(window_sub_texture, LV_OPA_80);

        /*********************************************
        *   USE AN EXTERNAL OPENGL TEXTURE IN LVGL
        *********************************************/

        unsigned int external_texture_id;
        glGenTextures(1, &external_texture_id);
        glBindTexture(GL_TEXTURE_2D, external_texture_id);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
        LV_IMAGE_DECLARE(img_cogwheel_argb);
    #if LV_COLOR_DEPTH == 8
        const int texture_format = GL_R8;
    #elif LV_COLOR_DEPTH == 16
        const int texture_format = GL_RGB565;
    #elif LV_COLOR_DEPTH == 24
        const int texture_format = GL_RGB;
    #elif LV_COLOR_DEPTH == 32
        const int texture_format = GL_RGBA;
    #else
    #error("Unsupported color format")
    #endif
        glTexImage2D(GL_TEXTURE_2D, 0, texture_format, img_cogwheel_argb.header.w, img_cogwheel_argb.header.h, 0, GL_BGRA, GL_UNSIGNED_BYTE, img_cogwheel_argb.data);
        glGenerateMipmap(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);

        /* add the external texture to the window */
        lv_glfw_texture_t * window_external_texture = lv_glfw_window_add_texture(window, external_texture_id, img_cogwheel_argb.header.w, img_cogwheel_argb.header.h);

        /* set the position and opacity of the external texture within the window */
        lv_glfw_texture_set_x(window_external_texture, 20);
        lv_glfw_texture_set_y(window_external_texture, 20);
        lv_glfw_texture_set_opa(window_external_texture, LV_OPA_70);

        /*********************************************
        *   USE AN LVGL TEXTURE IN ANOTHER LIBRARY
        *********************************************/

        lv_refr_now(sub_texture);

        /* the texture is drawn on by LVGL and can be used by anything that uses OpenGL textures */
        third_party_lib_use_texture(sub_texture_id);
    }

.. raw:: html

   </details>
   <br>

OpenGL 驱动程序能够从用户那里绘制纹理。可以使用第三方库向纹理添加内容，然后驱动程序将在窗口中绘制该纹理。

.. code-block:: c

    #include "lvgl/lvgl.h"
    #include <GL/glew.h>
    #include <GLFW/glfw3.h>
    #define WIDTH 640
    #define HEIGHT 480
    void custom_texture_example(void)
    {
        /*****************
        *  MAIN WINDOW
        *****************/
        /* create a window and initialize OpenGL */
        /* multiple windows can be created */
        lv_glfw_window_t * window = lv_glfw_window_create(WIDTH, HEIGHT, true);
        /****************************
        *   OPTIONAL MAIN TEXTURE
        ****************************/
        /* create a main display that flushes to a texture */
        lv_display_t * main_texture = lv_opengles_texture_create(WIDTH, HEIGHT);
        lv_display_set_default(main_texture);
        /* add the main texture to the window */
        unsigned int main_texture_id = lv_opengles_texture_get_texture_id(main_texture);
        lv_glfw_texture_t * window_main_texture = lv_glfw_window_add_texture(window, main_texture_id, WIDTH, HEIGHT);
        /* get the mouse indev of this main texture */
        lv_indev_t * main_texture_mouse = lv_glfw_texture_get_mouse_indev(window_main_texture);
        /* add a cursor to the mouse indev */
        LV_IMAGE_DECLARE(mouse_cursor_icon);
        lv_obj_t * cursor_obj = lv_image_create(lv_screen_active());
        lv_image_set_src(cursor_obj, &mouse_cursor_icon);
        lv_indev_set_cursor(main_texture_mouse, cursor_obj);
        /* create objects on the screen of the main texture */
        lv_demo_widgets();
        /**********************
        *   ANOTHER TEXTURE
        **********************/
        /* create a sub display that flushes to a texture */
        const int32_t sub_texture_w = 300;
        const int32_t sub_texture_h = 300;
        lv_display_t * sub_texture = lv_opengles_texture_create(sub_texture_w, sub_texture_h);
        /* add the sub texture to the window */
        unsigned int sub_texture_id = lv_opengles_texture_get_texture_id(sub_texture);
        lv_glfw_texture_t * window_sub_texture = lv_glfw_window_add_texture(window, sub_texture_id, sub_texture_w, sub_texture_h);
        /* create objects on the screen of the sub texture */
        lv_display_set_default(sub_texture);
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_black(), 0);
        lv_example_anim_2();
        lv_display_set_default(main_texture);
        /* position the sub texture within the window */
        lv_glfw_texture_set_x(window_sub_texture, 250);
        lv_glfw_texture_set_y(window_sub_texture, 150);
        /* optionally change the opacity of the sub texture */
        lv_glfw_texture_set_opa(window_sub_texture, LV_OPA_80);
        /*********************************************
        *   USE AN EXTERNAL OPENGL TEXTURE IN LVGL
        *********************************************/
        unsigned int external_texture_id;
        glGenTextures(1, &external_texture_id);
        glBindTexture(GL_TEXTURE_2D, external_texture_id);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
        LV_IMAGE_DECLARE(img_cogwheel_argb);
    #if LV_COLOR_DEPTH == 8
        const int texture_format = GL_R8;
    #elif LV_COLOR_DEPTH == 16
        const int texture_format = GL_RGB565;
    #elif LV_COLOR_DEPTH == 24
        const int texture_format = GL_RGB;
    #elif LV_COLOR_DEPTH == 32
        const int texture_format = GL_RGBA;
    #else
    #error("Unsupported color format")
    #endif
        glTexImage2D(GL_TEXTURE_2D, 0, texture_format, img_cogwheel_argb.header.w, img_cogwheel_argb.header.h, 0, GL_BGRA, GL_UNSIGNED_BYTE, img_cogwheel_argb.data);
        glGenerateMipmap(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);
        /* add the external texture to the window */
        lv_glfw_texture_t * window_external_texture = lv_glfw_window_add_texture(window, external_texture_id, img_cogwheel_argb.header.w, img_cogwheel_argb.header.h);
        /* set the position and opacity of the external texture within the window */
        lv_glfw_texture_set_x(window_external_texture, 20);
        lv_glfw_texture_set_y(window_external_texture, 20);
        lv_glfw_texture_set_opa(window_external_texture, LV_OPA_70);
        /*********************************************
        *   USE AN LVGL TEXTURE IN ANOTHER LIBRARY
        *********************************************/
        lv_refr_now(sub_texture);
        /* the texture is drawn on by LVGL and can be used by anything that uses OpenGL textures */
        third_party_lib_use_texture(sub_texture_id);
    }

OpenGL Texture Caching Renderer（OpenGL 纹理缓存渲染器）
------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There is a renderer in LVGL which caches software-rendered areas as OpenGL textures.
The textures are retrieved from the cache and reused when there is a match.
The performance will be drastically improved in most cases.

.. code-block:: c

    #define LV_USE_DRAW_OPENGLES 1

.. raw:: html

   </details>
   <br>

在 LVGL 中有一个渲染器，它将软件渲染的区域缓存为 OpenGL 纹理。  
当存在匹配时，这些纹理会从缓存中获取并被重复使用。  
在大多数情况下，性能将得到显著提升。  

.. code-block:: c  

    #define LV_USE_DRAW_OPENGLES 1  


Known Limitations（已知限制）
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Performance will be the same or slightly worse if the drawn areas are never found in the cache
  due to Widgets with continuously varying colors or shapes. One example is a label whose color
  is set to a random value every frame, as in the "Multiple labels" scene of the benchmark demo.
- Layers with transparent pixels and an overall layer transparency will not blend correctly.
  The effect can be observed in the "Containers with opa_layer" scene of the benchmark demo
  in the border corners.
- Layers with rotation are not currently supported. Images with rotation are fine.


.. Comment:  The above blank line is necessary for Sphinx to not complain,
    since it looks for the blank line after a bullet list.

.. raw:: html

   </details>
   <br>

- 如果绘制区域在缓存中从未找到匹配项，由于控件的颜色或形状持续变化，性能将保持不变或略有下降。例如，将标签的颜色每帧设置为随机值的情况，就像基准演示的 "Multiple labels" 场景中所示。  
- 带有透明像素和整体透明度的图层不会正确混合。这种效果可以在基准演示的 "Containers with opa_layer" 场景的边框角落处观察到。  
- 目前不支持带有旋转的图层，但带有旋转的图像可以正常工作。  

.. 注释:  上面的空行是必要的，否则 Sphinx 会报错，因为它会检查项目列表后是否有空行。  
