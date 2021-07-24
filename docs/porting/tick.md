```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/tick.md
```
# Tick interface（心跳接口）

<details>
<summary>查看原文</summary>
<p>

LVGL needs a system tick to know elapsed time for animations and other tasks.

You need to call the `lv_tick_inc(tick_period)` function periodically and provide the call period in milliseconds. For example, `lv_tick_inc(1)` when calling every millisecond.

`lv_tick_inc` should be called in a higher priority routine than `lv_task_handler()` (e.g. in an interrupt) to precisely know the elapsed milliseconds even if the execution of `lv_task_handler` takes more time.

With FreeRTOS `lv_tick_inc` can be called in `vApplicationTickHook`.

On Linux based operating system (e.g. on Raspberry Pi) `lv_tick_inc` can be called in a thread like below:

</p>
</details>

LVGL 需要一个系统滴答来了解动画和其他任务所用的时间。


您需要定期调用 `lv_tick_inc(tick_period)` 函数并提供以毫秒为单位的调用周期。例如，`lv_tick_inc(1)` 每毫秒调用一次。

`lv_tick_inc` 应该在比 `lv_task_handler()` 更高优先级的例程中调用（例如在中断中），以精确知道经过的毫秒数，即使 `lv_task_handler` 的执行需要更多时间。

使用 FreeRTOS，可以在 `vApplicationTickHook` 中调用 `lv_tick_inc`。

在基于 Linux 的操作系统（例如在 Raspberry Pi 上）可以在如下线程中调用 `lv_tick_inc`：

```c
void * tick_thread (void *args)
{
      while(1) {
        usleep(5*1000);   /*Sleep for 5 millisecond*/
        lv_tick_inc(5);      /*Tell LVGL that 5 milliseconds were elapsed*/
    }
}
```



## API

```eval_rst

.. doxygenfile:: lv_hal_tick.h
  :project: lvgl

```
