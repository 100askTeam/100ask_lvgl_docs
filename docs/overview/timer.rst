.. _timer:

===============
Timers（定时器）
===============

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has a built-in timer system. You can register a function to have it
be called periodically. The timers are handled and called in
:cpp:func:`lv_timer_handler`, which needs to be called every few milliseconds.
See `Porting </porting/timer-handler>`__ for more information.

Timers are non-preemptive, which means a timer cannot interrupt another
timer. Therefore, you can call any LVGL related function in a timer.

.. raw:: html

   </details>
   <br>


LVGL有一个内置的计时器系统。您可以注册一个函数，让它定期被调用。这些计时器在 :cpp:func:`lv_timer_handler` 中进行处理和调用，需要每隔几毫秒调用一次。更多信息请参阅 `Porting </porting/timer-handler>`__ 。

计时器是非抢占式的，这意味着一个计时器不能中断另一个计时器。因此，您可以在计时器中调用任何与LVGL相关的函数。


Create a timer（创建定时器）
***************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create a new timer, use
:cpp:expr:`lv_timer_create(timer_cb, period_ms, user_data)`. It will create an
:cpp:type:`lv_timer_t` ``*`` variable, which can be used later to modify the
parameters of the timer. :cpp:func:`lv_timer_create_basic` can also be used.
This allows you to create a new timer without specifying any parameters.

A timer callback should have a ``void (*lv_timer_cb_t)(lv_timer_t *)``
prototype.

For example:

.. code:: c

   void my_timer(lv_timer_t * timer)
   {
     /*Use the user_data*/
     uint32_t * user_data = timer->user_data;
     printf("my_timer called with user data: %d\n", *user_data);

     /*Do something with LVGL*/
     if(something_happened) {
       something_happened = false;
       lv_button_create(lv_screen_active(), NULL);
     }
   }

   ...

   static uint32_t user_data = 10;
   lv_timer_t * timer = lv_timer_create(my_timer, 500,  &user_data);


.. raw:: html

   </details>
   <br>


要创建一个新定时器，使用 :cpp:expr:`lv_timer_create(timer_cb, period_ms, user_data)`。这将创建一个 :cpp:type:`lv_timer_t` ``*`` 变量，可以稍后用来修改定时器的参数。 :cpp:func:`lv_timer_create_basic` 也可以使用。这允许您在不指定任何参数的情况下创建一个新定时器。
 
定时器回调函数应该有一个 ``void (*lv_timer_cb_t)(lv_timer_t *)`` 原型。

例如：

.. code:: c
  void my_timer(lv_timer_t * timer)
  {
    /* 使用用户数据 */
    uint32_t * user_data = timer->user_data;
    printf("my_timer called with user data: %d\n", *user_data);

    /* 使用LVGL进行某些操作 */
    if(something_happened) {
      something_happened = false;
      lv_button_create(lv_screen_active(), NULL);
    }
  }

  ...

  static uint32_t user_data = 10;
  lv_timer_t * timer = lv_timer_create(my_timer, 500,  &user_data);


Ready and Reset（准备与重置）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_timer_ready(timer)` makes a timer run on the next call of
:cpp:func:`lv_timer_handler`.

:cpp:expr:`lv_timer_reset(timer)` resets the period of a timer. It will be
called again after the defined period of milliseconds has elapsed.

.. raw:: html

   </details>
   <br>


:cpp:expr:`lv_timer_ready(timer)` 使计时器在下一次调用 :cpp:func:`lv_timer_handler` 时运行。

:cpp:expr:`lv_timer_reset(timer)` 重置计时器的周期。在定义的毫秒周期过去后，它将再次被调用。


Set parameters(参数设置)
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can modify some timer parameters later:

- :cpp:expr:`lv_timer_set_cb(timer, new_cb)`
- :cpp:expr:`lv_timer_set_period(timer, new_period)`

.. raw:: html

   </details>
   <br>


您可以稍后修改一些计时器参数：

- :cpp:expr:`lv_timer_set_cb(timer, new_cb)` （设置新的回调函数）
- :cpp:expr:`lv_timer_set_period(timer, new_period)` （设置新的时间周期）


Repeat count(设置重复次数)
*************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can make a timer repeat only a given number of times with
:cpp:expr:`lv_timer_set_repeat_count(timer, count)`. The timer will
automatically be deleted after it's called the defined number of times.
Set the count to ``-1`` to repeat indefinitely.

.. raw:: html

   </details>
   <br>


你可以使用 :cpp:expr:`lv_timer_set_repeat_count(timer, count)` 来让一个定时器只重复指定次数。
当定时器调用了定义的次数后，它会自动被删除。将计数设置为 ``-1`` 表示无限重复。


Enable and Disable（启用和禁用）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can enable or disable a timer with :cpp:expr:`lv_timer_enable(en)`.

.. raw:: html

   </details>
   <br>


你可以使用 `lv_timer_enable(en)` 来启用或禁用一个定时器。


Pause and Resume（暂停和恢复）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_timer_pause(timer)` pauses the specified timer.

:cpp:expr:`lv_timer_resume(timer)` resumes the specified timer.

.. raw:: html

   </details>
   <br>


:cpp:expr:`lv_timer_pause(timer)` 暂停指定的定时器。

:cpp:expr:`lv_timer_resume(timer)` 恢复指定的定时器。


Measure idle time(测量空闲时间)
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can get the idle percentage time of :cpp:func:`lv_timer_handler` with
:cpp:func:`lv_timer_get_idle`. Note that, it doesn't measure the idle time of
the overall system, only :cpp:func:`lv_timer_handler`. It can be misleading if
you use an operating system and call :cpp:func:`lv_timer_handler` in a timer, as
it won't actually measure the time the OS spends in an idle thread.

.. raw:: html

   </details>
   <br>


您可以使用 `lv_timer_get_idle` 函数获取 :cpp:func:`lv_timer_handler` 函数的空闲百分比时间。
请注意，它并不测量整个系统的空闲时间，仅测量 :cpp:func:`lv_timer_handler` 的空闲时间。
如果您在操作系统中使用定时器调用 :cpp:func:`lv_timer_handler`，这可能会产生误导，因为它实际上不能测量操作系统在空闲线程中的消耗时间。


Timer handler resume callback（计时器处理程序恢复回调）
*****************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

When the `lv_timer_handler` is stopped, if you want to pay attention to the wake-up
timing of the `lv_timer_handler`, you can set a resume callback using
:cpp:expr:`lv_timer_handler_set_resume_cb(cb, user_data)`.
The callback should have a ``void (*lv_timer_handler_resume_cb_t)(void*)`` prototype.

.. raw:: html

   </details>
   <br>


`lv_timer_handler` 被停止后，如果你想要关注 `lv_timer_handler` 的唤醒时机，你可以使用 `lv_timer_handler_set_resume_cb(cb, user_data)` 来设置一个恢复回调函数。
回调函数的原型应该是 `void (*lv_timer_handler_resume_cb_t)(void*)`。


Asynchronous calls(异步调用)
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In some cases, you can't perform an action immediately. For example, you
can't delete an object because something else is still using it, or you
don't want to block the execution now. For these cases,
:cpp:expr:`lv_async_call(my_function, data_p)` can be used to call
``my_function`` on the next invocation of :cpp:func:`lv_timer_handler`.
``data_p`` will be passed to the function when it's called. Note that
only the data pointer is saved, so you need to ensure that the variable
will be "alive" while the function is called. It can be *static*, global
or dynamically allocated data. If you want to cancel an asynchronous
call, call :cpp:expr:`lv_async_call_cancel(my_function, data_p)`, which will
clear all asynchronous calls matching ``my_function`` and ``data_p``.

For example:

.. code:: c

   void my_screen_clean_up(void * scr)
   {
     /*Free some resources related to `scr`*/

     /*Finally delete the screen*/
     lv_obj_delete(scr);
   }

   ...

   /*Do something with the object on the current screen*/

   /*Delete screen on next call of `lv_timer_handler`, not right now.*/
   lv_async_call(my_screen_clean_up, lv_screen_active());

   /*The screen is still valid so you can do other things with it*/

If you just want to delete an object and don't need to clean anything up
in ``my_screen_cleanup`` you could just use :cpp:func:`lv_obj_delete_async` which
will delete the object on the next call to :cpp:func:`lv_timer_handler`.

.. raw:: html

   </details>
   <br>


在某些情况下，您不能立即执行某个操作。例如，如果还有其他东西在使用该对象，或者您不希望阻塞执行。
对于这些情况，可以使用 :cpp:expr:`lv_async_call(my_function, data_p)` 在下一次调用 :cpp:func:`lv_timer_handler` 时调用 ``my_function``。
当调用函数时，将传递 ``data_p``。请注意，只保存数据指针，因此您需要确保在调用函数时变量仍然有效。
它可以是 *静态*、全局或动态分配的数据。如果您想要取消异步调用，请调用 :cpp:expr:`lv_async_call_cancel(my_function, data_p)`，
它将清除与 ``my_function`` 和 ``data_p`` 匹配的所有异步调用。

例如：

.. code:: c

   void my_screen_clean_up(void * scr)
   {
     /*释放与`scr`相关的一些资源*/

     /*最后删除屏幕*/
     lv_obj_delete(scr);
   }

   ...

   /*在当前屏幕上执行一些操作*/

   /*在下一次调用`lv_timer_handler`时删除屏幕，而不是立即删除。*/
   lv_async_call(my_screen_clean_up, lv_screen_active());

   /*屏幕仍然有效，因此您可以对其进行其他操作*/

如果您只想删除一个对象，而不需要在 ``my_screen_cleanup`` 中进行任何清理操作，
可以直接使用 :cpp:func:`lv_obj_delete_async` ，它将在下一次调用 :cpp:func:`lv_timer_handler` 时删除该对象。


.. _timer_api:

API
***
