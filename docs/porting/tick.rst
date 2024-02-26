.. _tick:

=========================
Tick interface（心跳接口）
=========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL needs a system tick to know elapsed time for animations and other
tasks.

If you want to use a custom function to :cpp:func:`lv_tick_get`, you can
register a "tick_get_cb" with :cpp:func:`lv_tick_set_cb`.

For example:

.. raw:: html

   </details> 
   <br>


LVGL 需要一个系统滴答来了解动画和其他任务所用的时间。

如果要使用自定义函数来 :cpp:func:`lv_tick_get` ，你可以使用 :cpp:func:`lv_tick_set_cb`注册“tick_get_cb”。

例如：


.. code:: c

   lv_tick_set_cb(SDL_GetTicks);


.. raw:: html

   <details>
     <summary>显示原文</summary>

You need to call the :cpp:expr:`lv_tick_inc(tick_period)` function periodically
and provide the call period in milliseconds. For example,
:cpp:expr:`lv_tick_inc(1)` when calling every millisecond.

:cpp:func:`lv_tick_inc` should be called in a higher priority routine than
:cpp:func:`lv_task_handler` (e.g. in an interrupt) to precisely know the
elapsed milliseconds even if the execution of :cpp:func:`lv_task_handler` takes
more time.

With FreeRTOS :cpp:func:`lv_tick_inc` can be called in ``vApplicationTickHook``.

On Linux based operating systems (e.g. on Raspberry Pi) :cpp:func:`lv_tick_inc`
can be called in a thread like below:

.. raw:: html

   </details> 
   <br>


您需要定期调用 :cpp:expr:`lv_tick_inc(tick_period)` 函数并提供以毫秒为单位的调用周期。例如，:cpp:expr:`lv_tick_inc(1)` 每毫秒调用一次。

:cpp:func:`lv_tick_inc` 应该在比 :cpp:func:`lv_task_handler` 更高优先级的例程中调用（例如在中断中），以精确知道经过的毫秒数，即使 :cpp:func:`lv_task_handler` 的执行需要更多时间。

使用 FreeRTOS，可以在 ``vApplicationTickHook`` 中调用 :cpp:func:`lv_tick_inc` 。

在基于 Linux 的操作系统（例如在 Raspberry Pi 上）可以在如下线程中调用 :cpp:func:`lv_tick_inc`：


.. code:: c

   void * tick_thread (void *args)
   {
         while(1) {
           usleep(5*1000);   /*Sleep for 5 millisecond*/
           lv_tick_inc(5);      /*Tell LVGL that 5 milliseconds were elapsed*/
       }
   }

API
---
