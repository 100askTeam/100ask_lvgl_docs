```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/sleep.md
```
# Sleep management（睡眠管理）

<details>
<summary>查看原文</summary>
<p>

The MCU can go to sleep when no user input happens. In this case, the main `while(1)` should look like this:

</p>
</details>

当没有用户输入发生时，MCU 可以进入睡眠状态。在这种情况下，主要的 `while(1)` 应该是这样的：

```c
while(1) {
  /*Normal operation (no sleep) in < 1 sec inactivity*/
  if(lv_disp_get_inactive_time(NULL) < 1000) {
	  lv_task_handler();
  }
  /*Sleep after 1 sec inactivity*/
  else {
	  timer_stop();   /*Stop the timer where lv_tick_inc() is called*/
	  sleep();		    /*Sleep the MCU*/
  }
  my_delay_ms(5);
}
```

<details>
<summary>查看原文</summary>
<p>

You should also add the below lines to your input device read function to signal a wake-up (press, touch or click etc.) happened:

</p>
</details>

您还应该将以下几行添加到您的输入设备读取功能中，以表示发生了唤醒（按下、触摸或点击等）：

```c
lv_tick_inc(LV_DISP_DEF_REFR_PERIOD);  /*Force task execution on wake-up*/
timer_start();                         /*Restart the timer where lv_tick_inc() is called*/
lv_task_handler();                     /*Call `lv_task_handler()` manually to process the wake-up event*/
```

<details>
<summary>查看原文</summary>
<p>

In addition to `lv_disp_get_inactive_time()` you can check `lv_anim_count_running()` to see if all animations have finished.

</p>
</details>

除了 `lv_disp_get_inactive_time()` 之外，你还可以检查 `lv_anim_count_running()` 以查看是否所有动画都已完成。
