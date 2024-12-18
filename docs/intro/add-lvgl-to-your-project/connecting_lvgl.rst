.. _connecting_lvgl:

=========================================================
Connecting LVGL to Your Hardware（将 LVGL 连接到您的硬件）
=========================================================


.. _initializing_lvgl:

Initializing LVGL（初始化LVGL）
******************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
After you have:

- :ref:`acquired LVGL <getting_lvgl>`,
- added the appropriate LVGL files to your project, and
- :ref:`created a lv_conf.h file <lv_conf>` for your project,

you will need to complete a few more steps to get your project up and running with LVGL.

1.  Initialize LVGL once early during system execution by calling :cpp:func:`lv_init`.
    This needs to be done before making any other LVGL calls.

2.  Initialize your drivers.

3.  Connect the :ref:`tick_interface`.

4.  Connect the :ref:`display_interface`.

5.  Connect the :ref:`indev_interface`.

6.  Drive LVGL time-related tasks by calling :cpp:func:`lv_timer_handler` every few
    milliseconds to manage LVGL timers.  See :ref:`timer_handler` for different ways
    to do this.

7.  Optionally set a theme with :cpp:func:`lv_display_set_theme`.

8.  Thereafter #include "lvgl/lvgl.h" in source files wherever you need to use LVGL
    functions.

.. raw:: html

   </details> 
   <br>
在完成以下操作后：
- :ref:`acquired LVGL <getting_lvgl>`，
- 将相应的 LVGL 文件添加到您的项目中，并且
- 为您的项目 :ref:`created a lv_conf.h file <lv_conf>`，

您还需要再完成几个步骤，才能让您的项目搭载 LVGL 启动并运行起来。

1.在系统执行的早期调用 :cpp:func:`lv_init` 对 LVGL 进行一次初始化。
  在进行任何其他 LVGL 调用之前，都需要先完成此项操作。

2.初始化您的驱动程序。

3.连接 :ref:`tick_interface`。

4.连接 :ref:`display_interface`。

5.连接 :ref:`indev_interface`。

6.每隔几毫秒调用一次 :cpp:func:`lv_timer_handler`来驱动 LVGL 中与时间相关的任务，以管理 LVGL 定时器。有关不同的实现方式，请参考 :ref:`timer_handler` 部分。

7.（可选）使用 :cpp:func:`lv_display_set_theme` 设置一个主题。

8.此后，在任何需要使用 LVGL 函数的源文件中包含 “lvgl/lvgl.h” 头文件。
.. _tick_interface:

Tick Interface（滴答（Tick）接口）
**********************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL needs awareness of what time it is (i.e. elapsed time in milliseconds) for
all of its tasks for which time is a factor:  refreshing displays, reading user
input, firing events, animations, etc.

.. image:: /misc/intro_data_flow.png
   :scale: 75 %
   :alt:  LVGL Data Flow
   :align:  center

There are two ways to provide this information to LVGL:

1.  Supply LVGL with a callback function to retrieve elapsed system milliseconds by
    calling :cpp:expr:`lv_tick_set_cb(my_get_milliseconds_function)`.
    :cpp:expr:`my_get_milliseconds_function()` needs to return the number of
    milliseconds elapsed since system start up.  Many platforms have built-in
    functions that can be used as they are.  For example:

    - SDL:  ``lv_tick_set_cb(SDL_GetTicks);``
    - Arduino:  ``lv_tick_set_cb(my_tick_get_cb);``, where ``my_tick_get_cb`` is:
      ``static uint32_t my_tick_get_cb(void) { return millis(); }``
    - FreeRTOS:  ``lv_tick_set_cb(xTaskGetTickCount);``
    - STM32:  ``lv_tick_set_cb(HAL_GetTick);``
    - ESP32:  ``lv_tick_set_cb(my_tick_get_cb);``, where ``my_tick_get_cb`` is a
      wrapper for ``esp_timer_get_time() / 1000;``

2.  Call :cpp:expr:`lv_tick_inc(x)` periodically, where ``x`` is the elapsed
    milliseconds since the last call.  If :cpp:func:`lv_tick_inc` is called from an
    ISR, it should be from either a high priority interrupt or an interrupt that
    cannot be missed when the system is under high load.

    .. note::  :cpp:func:`lv_tick_inc` is only one of two LVGL functions that may be
        called from an interrupt.  See the :ref:`threading` section to learn more.

The ticks (milliseconds) should be independent from any other activities of the MCU.

For example this works, but LVGL's timing will be incorrect as the execution time of
:c:func:`lv_timer_handler` is not considered:

.. code-block:: c

    // Bad idea
    lv_timer_handler();
    lv_tick_inc(5);
    my_delay_ms(5);

.. raw:: html

   </details> 
   <br>
LVGL 需要知晓当前时间（即已过去的毫秒数），因为对于所有受时间因素影响的任务来说这很关键，这些任务包括刷新显示屏、读取用户输入、触发事件、实现动画效果等等。

.. 图像：/misc/intro_data_flow.png
   : 缩放比例：75%
   : 替代文本：LVGL 数据流程
   : 对齐方式：居中
有两种方式可将此信息提供给 LVGL：

1.  通过调用 :cpp:expr:`lv_tick_set_cb(my_get_milliseconds_function)` 为 LVGL 提供一个回调函数，以获取系统已过去的毫秒数。
:cpp:expr:`my_get_milliseconds_function()` 需要返回自系统启动以来所经过的毫秒数。许多平台都有内置函数，可直接使用。例如：

    - SDL： ``lv_tick_set_cb(SDL_GetTicks);``
    - Arduino： ``lv_tick_set_cb(my_tick_get_cb);``; ，其中 ``my_tick_get_cb`` 是：
      ``static uint32_t my_tick_get_cb(void) { return millis(); }``
    - FreeRTOS： ``lv_tick_set_cb(xTaskGetTickCount);``
    - STM32： ``lv_tick_set_cb(HAL_GetTick);``
    - ESP32： ``lv_tick_set_cb(my_tick_get_cb);`` ，其中 ``my_tick_get_cb``是对 ``esp_timer_get_time() / 1000;`` 的一个封装函数。

2.  周期性地调用 :cpp:expr:`lv_tick_inc(x)`，其中 ``x`` 是自上次调用以来所经过的毫秒数。如果从一个中断服务程序（ISR）中调用 :cpp:func:`lv_tick_inc`，那么它应该来自高优先级中断，或者是在系统高负载时不能错过的中断。
    .. 注意： :cpp:func:lv_tick_inc 是可以从中断里调用的两个 LVGL 函数之一。如需了解更多信息，请参阅 :ref:`threading` 部分。

这些滴答数（毫秒数）应该独立于微控制器（MCU）的任何其他活动。

例如，下面这种做法可行，但由于没有考虑到 :c:func:`lv_timer_handler` 的执行时间，LVGL 的计时将会不准确：

.. code-block:: c

    // Bad idea
    lv_timer_handler();
    lv_tick_inc(5);
    my_delay_ms(5);
.. _display_interface:

Display Interface（显示接口）
*****************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL needs to be supplied with knowledge about each display panel you want it to use.
Specificially:

- its pixel format and size (:ref:`creating_a_display`),
- where to render pixels for it (:ref:`draw_buffers`), and
- how to send those rendered pixels to it (:ref:`flush_callback`).

See the respective links for how to supply LVGL with this knowledge.
.. raw:: html

   </details> 
   <br>
需要向 LVGL 提供有关您希望它使用的每个显示面板的相关信息。具体来说，需要提供以下信息：

- 其像素格式和尺寸(:ref:`creating_a_display`)；
- 应在何处为其渲染像素(:ref:`draw_buffers`)；
- 如何将那些渲染好的像素发送给它(:ref:`flush_callback`)。

有关如何向 LVGL 提供这些信息，请查看相应的链接内容。

.. _indev_interface:

Input-Device Interface
**********************
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL needs to know how to get input from all user-input devices that will be used in
your project.  LVGL supports a wide variety of user-input devices:

- touch-screens,
- touch-pads,
- mice,
- crowns,
- encoders,
- keypads,
- keyboards,
- etc.

See :ref:`indev_creation` to see how to do this.
.. raw:: html

   </details> 
   <br>
LVGL 需要知道如何从项目中将要使用的所有用户输入设备获取输入信息。LVGL 支持各种各样的用户输入设备：

- 触摸屏；
- 触摸板；
- 鼠标；
- 旋钮；
- 编码器；
- 小键盘；
- 键盘；
- 等等。

查看 :ref:`indev_creation` 部分，了解如何进行相关操作。

API
***
:ref:`lv_tick_h`
