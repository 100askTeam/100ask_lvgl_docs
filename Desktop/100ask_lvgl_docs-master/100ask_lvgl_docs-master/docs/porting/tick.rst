.. _tick:

=========================
Tick interface（心跳接口）
=========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL needs a system tick to know the elapsed time for animations and other
tasks.

There are two ways to provide the tick to LVGL:

1. Call ``lv_tick_set_cb(my_get_milliseconds_function);``: `my_get_milliseconds_function` needs to tell how many milliseconds have elapsed since start up. Most of the platforms have built-in functions that can be used as they are. For example

   - SDL: ``lv_tick_set_cb(SDL_GetTicks);``
   - Arduino: ``lv_tick_set_cb(my_tick_get_cb);``, where ``my_tick_get_cb`` is: ``static uint32_t my_tick_get_cb(void) { return millis(); }``
   - FreeRTOS: ``lv_tick_set_cb(xTaskGetTickCount);``
   - STM32: ``lv_tick_set_cb(HAL_GetTick);``
   - ESP32: ``lv_tick_set_cb(my_tick_get_cb);``, where ``my_tick_get_cb`` is a wrapper for ``esp_timer_get_time() / 1000;``

2. Call ``lv_tick_inc(x)`` periodically, where ``x`` is the elapsed milliseconds since the last call. ``lv_tick_inc`` should be called from a high priority interrupt.

The ticks (milliseconds)  should be independent from any other activities of the MCU.

For example this works, but LVGL's timing will be incorrect as the execution time of ``lv_timer_handler`` is not considered:

.. code:: c
   // Bad idea
   lv_timer_handler();
   lv_tick_inc(5);
   my_delay_ms(5);

.. raw:: html

   </details> 
   <br>


LVGL 需要一个系统滴答时钟来了解动画和其他任务所用的时间。

有两种方法可以向 LVGL 提供刻度：

1. 调用 ``lv_tick_set_cb(my_get_milliseconds_function);``： `my_get_milliseconds_function` 需要告知自启动以来已经过去了多少毫秒。大多数平台都有内置功能，可以直接使用。例如

   - SDL: ``lv_tick_set_cb(SDL_GetTicks);``
   - Arduino: ``lv_tick_set_cb(millis);``
   - FreeRTOS: ``lv_tick_set_cb(xTaskGetTickCount);``
   - STM32: ``lv_tick_set_cb(HAL_GetTick);``
   - ESP32: ``lv_tick_set_cb(my_tick_get_cb);``, 其中 ``my_tick_get_cb`` 是 ``esp_timer_get_time() / 1000 的包装函数;``

2. 定期调用 ``lv_tick_inc(x)`` 其中 ``x`` 是自上次调用以来经过的毫秒数。 ``lv_tick_inc`` 应从高优先级中断调用。

刻度（毫秒）应独立于 MCU 的任何其他活动。

例如，这种方法可行，但 LVGL 的计时将不正确，因为 ``lv_timer_handler`` 未考虑 的执行时间：

API
---
