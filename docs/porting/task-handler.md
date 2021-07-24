```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/task-handler.md
```
# Task Handler（任务处理器）


<details>
<summary>查看原文</summary>
<p>

To handle the tasks of LVGL you need to call `lv_timer_handler()` periodically in one of the following:
- *while(1)* of *main()* function 
- timer interrupt periodically (lower priority than `lv_tick_inc()`)
- an OS task periodically

The timing is not critical but it should be about 5 milliseconds to keep the system responsive.

Example:

</p>
</details>

要处理 LVGL 的任务，您需要以下列方式之一定期调用 `lv_timer_handler()`：
- *main()* 函数的 *while(1)*
- 定时器定期中断（比 `lv_tick_inc()` 优先级低）
- 定期执行操作系统任务

时间并不重要，但它应该是大约 5 毫秒以保持系统响应。

示例：

```c
while(1) {
  lv_timer_handler();
  my_delay_ms(5);
}
```


<details>
<summary>查看原文</summary>
<p>

To learn more about timers visit the [Timer](/overview/timer) section.

</p>
</details>

要了解有关计时器的更多信息，请访问 [Timer](/overview/timer) 部分。

