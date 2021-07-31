```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/timer.md
```
# Timers（定时器）

<details>
<summary>查看原文</summary>
<p>

LVGL has a built-in timer system. You can register a function to have it be called periodically. The timers are handled and called in `lv_timer_handler()`, which needs to be called every few milliseconds.
See [Porting](/porting/task-handler) for more information.

The timers are non-preemptive, which means a timer cannot interrupt another timer. Therefore, you can call any LVGL related function in a timer.
 
</p>
</details>

LVGL 有一个内置的定时器系统。您可以注册一个函数以定期调用它。定时器在`lv_timer_handler()`中被处理和调用，它需要每隔几毫秒调用一次。
有关详细信息，请参阅 [移植](/porting/task-handler)。

定时器是非抢占式的，这意味着一个定时器不能中断另一个定时器。因此，您可以在计时器中调用任何与 LVGL 相关的函数。

## Create a timer（创建定时器）

<details>
<summary>查看原文</summary>
<p>

To create a new timer, use `lv_timer_create(timer_cb, period_ms, user_data)`. It will create an `lv_timer_t *` variable, which can be used later to modify the parameters of the timer.
`lv_timer_create_basic()` can also be used. This allows you to create a new timer without specifying any parameters.

A timer callback should have `void (*lv_timer_cb_t)(lv_timer_t *);` prototype.

For example:
 
</p>
</details>

要创建一个新的计时器，请使用 `lv_timer_create(timer_cb, period_ms, user_data)`。它将创建一个 `lv_timer_t *` 变量，以后可以使用它来修改定时器的参数。
也可以使用`lv_timer_create_basic()`。这允许您在不指定任何参数的情况下创建新计时器。

一个定时器回调应该有 `void (*lv_timer_cb_t)(lv_timer_t *);` 原型。

例如：

```c
void my_timer(lv_timer_t * timer)
{
  /*Use the user_data*/
  uint32_t * user_data = timer->user_data;
  printf("my_timer called with user data: %d\n", *user_data);

  /*Do something with LVGL*/
  if(something_happened) {
    something_happened = false;
    lv_btn_create(lv_scr_act(), NULL);
  }
}

...

static uint32_t user_data = 10;
lv_timer_t * timer = lv_timer_create(my_timer, 500,  &user_data);

```

## Ready and Reset（准备与重置）

<details>
<summary>查看原文</summary>
<p>

`lv_timer_ready(timer)` makes the timer run on the next call of `lv_timer_handler()`.

`lv_timer_reset(timer)` resets the period of a timer. It will be called again after the defined period of milliseconds has elapsed.
 
</p>
</details>

`lv_timer_ready(timer)` 使计时器在下一次调用 `lv_timer_handler()` 时运行。

`lv_timer_reset(timer)` 重置计时器的周期。它将在定义的毫秒时间段过去后再次调用。

## Set parameters（参数设置）

<details>
<summary>查看原文</summary>
<p>

You can modify some parameters of the timers later:
- `lv_timer_set_cb(timer, new_cb)`
- `lv_timer_set_period(timer, new_period)`
 
</p>
</details>

您可以修改定时器的一些参数：
- `lv_timer_set_cb(timer, new_cb)`
- `lv_timer_set_period(timer, new_period)`

## Repeat count（设置重复次数）

<details>
<summary>查看原文</summary>
<p>

You can make a timer repeat only a given number of times with `lv_timer_set_repeat_count(timer, count)`. The timer will automatically be deleted after being called the defined number of times. Set the count to `-1` to repeat indefinitely. 
 
</p>
</details>

您可以使用 `lv_timer_set_repeat_count(timer, count)` 使计时器仅重复给定次数。定时器在调用定义的次数后将自动删除。将计数设置为“-1”以无限重复。

## Measure idle time（测量空闲时间）

<details>
<summary>查看原文</summary>
<p>

You can get the idle percentage time of `lv_timer_handler` with `lv_timer_get_idle()`. Note that, it doesn't measure the idle time of the overall system, only `lv_timer_handler`.
It can be misleading if you use an operating system and call `lv_timer_handler` in a timer, as it won't actually measure the time the OS spends in an idle thread.
 
</p>
</details>

你可以通过 `lv_timer_get_idle()` 获取 `lv_timer_handler` 的空闲百分比时间。请注意，它不测量整个系统的空闲时间，只测量 `lv_timer_handler`。
如果您使用操作系统并在计时器中调用 `lv_timer_handler`，这可能会产生误导，因为它实际上不会测量操作系统在空闲线程中花费的时间。

## Asynchronous calls（异步调用）

<details>
<summary>查看原文</summary>
<p>

In some cases, you can't do an action immediately. For example, you can't delete an object because something else is still using it or you don't want to block the execution now.
For these cases, `lv_async_call(my_function, data_p)` can be used to make `my_function` be called on the next call of `lv_timer_handler`. `data_p` will be passed to function when it's called.
Note that, only the pointer of the data is saved so you need to ensure that the variable will be "alive" while the function is called. It can be *static*, global or dynamically allocated data.

For example:
 
</p>
</details>

在某些情况下，您无法立即执行操作。例如，您不能删除一个对象，因为其他东西仍在使用它，或者您现在不想阻止执行。
对于这些情况，可以使用 `lv_async_call(my_function, data_p)` 使 `my_function` 在下一次调用 `lv_timer_handler` 时被调用。 `data_p` 将在调用时传递给函数。
请注意，仅保存数据的指针，因此您需要确保在调用函数时该变量将“处于活动状态”。它可以是*静态*、全局或动态分配的数据。

例如：

```c
void my_screen_clean_up(void * scr)
{
  /*Free some resources related to `scr`*/

  /*Finally delete the screen*/
  lv_obj_del(scr);  
}

...

/*Do somethings with the object on the current screen*/

/*Delete screen on next call of `lv_timer_handler`, so not now.*/
lv_async_call(my_screen_clean_up, lv_scr_act());

/*The screen is still valid so you can do other things with it*/

```

<details>
<summary>查看原文</summary>
<p>

If you just want to delete an object, and don't need to clean anything up in `my_screen_cleanup`, you could just use `lv_obj_del_async`, which will delete the object on the next call to `lv_timer_handler`.
 
</p>
</details>

如果你只是想删除一个对象，而不需要在 `my_screen_cleanup` 中清理任何东西，你可以使用 `lv_obj_del_async`，它会在下次调用 `lv_timer_handler` 时删除该对象。

## API

```eval_rst

.. doxygenfile:: lv_timer.h
  :project: lvgl

.. doxygenfile:: lv_async.h
  :project: lvgl

```
