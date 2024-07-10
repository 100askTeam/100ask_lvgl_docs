.. _os_interrupt:

================================================
Operating system and interrupts（操作系统和中断）
================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL is **not thread-safe** by default.

However, in the following conditions it's valid to call LVGL related
functions:

- In *events*. Learn more in :ref:`events`.
- In *lv_timer*. Learn more in :ref:`timer`.

.. raw:: html

   </details> 
   <br>


默认情况下，LVGL **非线程安全** 。

但是，在以下情况下调用 LVGL 相关函数是有效的：

- 在 *事件* 中。在 :ref:`events` 中了解更多信息。
- 在 *lv_timer* 中。在 :ref:`timer` 中了解更多信息。


Tasks and threads（任务和线程）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you need to use real tasks or threads, you need a mutex which should
be invoked before the call of :cpp:func:`lv_timer_handler` and released after
it. Also, you have to use the same mutex in other tasks and threads
around every LVGL (``lv_...``) related function call and code. This way
you can use LVGL in a real multitasking environment. Just make use of a
mutex to avoid the concurrent calling of LVGL functions.

LVGL has a built-in mutex which can be used with:
- :cpp:func:`lv_lock()` and :cpp:func:`lv_lock_isr()`
- :cpp:func:`lv_unlock()`

These functions are called internally in :cpp:func:`lv_timer_handler`
and the users need to call them only from their own threads.

To enable ``lv_lock/lv_unlock`` ``LV_USE_OS`` needs to be set to other
than ``LV_OS_NONE``.


Here is some pseudocode to illustrate the concept:

.. raw:: html

   </details> 
   <br>


如果你需要使用真正的任务或线程，你需要一个互斥锁，它应该在调用 :cpp:func:`lv_timer_handler` 之前被调用并在它之后释放。 此外，您必须在每个 LVGL  (``lv_...``) 相关函数调用和代码周围的其他任务和线程中使用相同的互斥锁。 这样你就可以在真正的多任务环境中使用 LVGL。只需使用互斥锁来避免并发调用 LVGL 函数。

LVGL 有一个内置的互斥锁，可以与以下函数一起使用：

- :cpp:func:`lv_lock()` and :cpp:func:`lv_lock_isr()`
- :cpp:func:`lv_unlock()`

这些函数在 :cpp:func:`lv_timer_handler` 中被内部调用，用户只需要在自己的线程中调用它们。

要启用 ``lv_lock/lv_unlock`` ，需要将 ``LV_USE_OS`` 设置为除 ``LV_OS_NONE`` 之外的其他值。

下面是一些伪代码来说明这个概念：


.. code:: c

   void lvgl_thread(void)
   {
       while(1) {
           uint32_t time_till_next;
           time_till_next = lv_timer_handler(); /*lv_lock/lv_unlock is called internally*/
           thread_sleep(time_till_next); /* sleep for a while */
       }
   }

   void other_thread(void)
   {
       /* You must always hold the mutex while using LVGL APIs */
       lv_lock();
       lv_obj_t *img = lv_image_create(lv_screen_active());
       lv_unlock();

       while(1) {
           lv_lock();
           /* change to the next image */
           lv_image_set_src(img, next_image);
           lv_unlock();
           thread_sleep(2000);
       }
   }

Interrupts（中断）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Try to avoid calling LVGL functions from interrupt handlers (except
:cpp:func:`lv_tick_inc` and :cpp:func:`lv_display_flush_ready`). But if you need to do
this you have to disable the interrupt which uses LVGL functions while
:cpp:func:`lv_timer_handler` is running.

It's a better approach to simply set a flag or some value in the
interrupt, and periodically check it in an LVGL timer (which is run by
:cpp:func:`lv_timer_handler`).

.. raw:: html

   </details> 
   <br>


尽量避免从中断处理程序调用 LVGL 函数（除了 :cpp:func:`lv_tick_inc`  和 :cpp:func:`lv_display_flush_ready`）。但是如果你需要这样做，你必须在 :cpp:func:`lv_timer_handler` 运行时禁用使用 LVGL 函数的中断。 

这是一种更好的方法，只需在中断，并在LVGL计时器中定期检查它（由 :cpp:func:`lv_timer_handler` 运行）。

