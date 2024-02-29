.. _timer:

=============
Timer Handler
=============

.. raw:: html

   <details>
     <summary>显示原文</summary>

To handle the tasks of LVGL you need to call :cpp:func:`lv_timer_handler`
periodically in one of the following:

- *while(1)* of *main()* function
- timer interrupt periodically (lower priority than :cpp:func:`lv_tick_inc`)
- an OS task periodically

Example:

.. raw:: html

   </details> 
   <br>


要处理 LVGL 的任务，您需要以下列方式之一定期调用 :cpp:func:`lv_timer_handler`：

-  *main()* 函数的 *while(1)* 
- 定时器定期中断（比 :cpp:func:`lv_tick_inc` 优先级低）
- 定期执行操作系统任务

示例：


.. code:: c

   while(1) {
     uint32_t time_till_next = lv_timer_handler();
     my_delay_ms(time_till_next);
   }

.. raw:: html

   <details>
     <summary>显示原文</summary>


If you want to use :cpp:func:`lv_timer_handler` in a super-loop, a helper
function :cpp:func:`lv_timer_handler_run_in_period` is provided to simplify
the porting:

.. raw:: html

   </details> 
   <br>


如果要在超级循环中使用 :cpp:func:`lv_timer_handler` ，则需要帮助程序 :cpp:func:`lv_timer_handler_run_in_period` 提供功能以简化移植：


.. code:: c

   while(1) {
      ...
      lv_timer_handler_run_in_period(5); /* run lv_timer_handler() every 5ms */
      ...
   }

.. raw:: html

   <details>
     <summary>显示原文</summary>

Or use the sleep time automatically calculated by LVGL:

.. raw:: html

   </details> 
   <br>


或者使用LVGL自动计算的睡眠时间：


.. code:: c

   while(1) {
     ...
     lv_timer_periodic_handler();
     ...
   }

.. raw:: html

   <details>
     <summary>显示原文</summary>

In an OS environment, you can use it together with the **delay** or
**sleep** provided by OS to release CPU whenever possible:

.. raw:: html

   </details> 
   <br>


在操作系统环境中，您可以将其与操作系统提供的 **延迟** 或 **睡眠** 一起使用，以尽可能释放 CPU：


.. code:: c

   while (1) {
      uint32_t time_till_next = lv_timer_handler(); 
      os_delay_ms(time_till_next); /* delay to avoid unnecessary polling */
   }

.. raw:: html

   <details>
     <summary>显示原文</summary>

To learn more about timers visit the :ref:`timer`
section.

.. raw:: html

   </details> 
   <br>


若要了解有关计时器的详细信息，请访问 :ref:`timer` 部分。


API
***
