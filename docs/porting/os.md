```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/os.md
```
# Operating system and interrupts（操作系统和中断）

<details>
<summary>查看原文</summary>
<p>

LVGL is **not thread-safe** by default.

However, in the following conditions it's valid to call LVGL related functions:
- In *events*. Learn more in [Events](/overview/event).
- In *lv_timer*. Learn more in [Timers](/overview/timer).

</p>
</details>

默认情况下，LVGL **非线程安全**。

但是，在以下情况下调用 LVGL 相关函数是有效的：
- 在*事件*中。在 [事件](/overview/event) 中了解更多信息。
- 在 *lv_timer* 中。在 [计时器](/overview/timer) 中了解更多信息。

## Tasks and threads（任务和线程）

<details>
<summary>查看原文</summary>
<p>

If you need to use real tasks or threads, you need a mutex which should be invoked before the call of `lv_timer_handler` and released after it.
Also, you have to use the same mutex in other tasks and threads around every LVGL (`lv_...`) related function call and code.
This way you can use LVGL in a real multitasking environment. Just make use of a mutex to avoid the concurrent calling of LVGL functions.

</p>
</details>

如果你需要使用真正的任务或线程，你需要一个互斥锁，它应该在调用 `lv_timer_handler` 之前被调用并在它之后释放。
此外，您必须在每个 LVGL (`lv_...`) 相关函数调用和代码周围的其他任务和线程中使用相同的互斥锁。
这样你就可以在真正的多任务环境中使用 LVGL。只需使用互斥锁来避免并发调用 LVGL 函数。

## Interrupts（中断）

<details>
<summary>查看原文</summary>
<p>

Try to avoid calling LVGL functions from interrupt handlers (except `lv_tick_inc()` and `lv_disp_flush_ready()`). But if you need to do this you have to disable the interrupt which uses LVGL functions while `lv_timer_handler` is running.
It's a better approach to set a flag or some value and periodically check it in an `lv_timer`.

</p>
</details>

尽量避免从中断处理程序调用 LVGL 函数（除了 `lv_tick_inc()` 和 `lv_disp_flush_ready()`）。但是如果你需要这样做，你必须在 `lv_timer_handler` 运行时禁用使用 LVGL 函数的中断。
设置一个标志或某个值并在 `lv_timer` 中定期检查它是一种更好的方法。
