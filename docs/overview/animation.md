```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/animation.md
```
# Animations（动画）

<details>
<summary>查看原文</summary>
<p>

You can automatically change the value of a variable between a start and an end value using animations.
The animation will happen by periodically calling an "animator" function with the corresponding value parameter.

The *animator* functions have the following prototype:
 
</p>
</details>

您可以使用动画在开始值和结束值之间自动更改变量的值。
动画将通过使用相应的 value 参数定期调用 “animator” 函数来发生。

*animator* 函数具有以下原型：

```c
void func(void * var, lv_anim_var_t value);
```


<details>
<summary>查看原文</summary>
<p>

This prototype is compatible with the majority of the *set* functions of LVGL. For example `lv_obj_set_x(obj, value)` or `lv_obj_set_width(obj, value)`
 
</p>
</details>

该原型与 LVGL 的大多数 *set* 函数兼容。例如`lv_obj_set_x(obj, value)` 或`lv_obj_set_width(obj, value)`

## Create an animation（创建动画）

<details>
<summary>查看原文</summary>
<p>

To create an animation an `lv_anim_t` variable has to be initialized and configured with `lv_anim_set_...()` functions.

要创建动画，必须使用 `lv_anim_set_...()` 函数初始化和配置 `lv_anim_t` 变量。

</p>
</details>

```c

/* INITIALIZE AN ANIMATION
 *-----------------------*/

lv_anim_t a;
lv_anim_init(&a);

/* MANDATORY SETTINGS
 *------------------*/

/*Set the "animator" function*/
lv_anim_set_exec_cb(&a, (lv_anim_exec_xcb_t) lv_obj_set_x); 

/*Set the "animator" function*/
lv_anim_set_var(&a, obj); 

/*Length of the animation [ms]*/
lv_anim_set_time(&a, duration);

/*Set start and end values. E.g. 0, 150*/
lv_anim_set_values(&a, start, end);

/* OPTIONAL SETTINGS
 *------------------*/

/*Time to wait before starting the animation [ms]*/
lv_anim_set_delay(&a, delay);

/*Set path (curve). Default is linear*/
lv_anim_set_path(&a, lv_anim_path_ease_in);

/*Set a callback to call when animation is ready.*/
lv_anim_set_ready_cb(&a, ready_cb);

/*Set a callback to call when animation is started (after delay).*/
lv_anim_set_start_cb(&a, start_cb);

/*Play the animation backward too with this duration. Default is 0 (disabled) [ms]*/
lv_anim_set_playback_time(&a, wait_time); 

/*Delay before playback. Default is 0 (disabled) [ms]*/
lv_anim_set_playback_delay(&a, wait_time);

/*Number of repetitions. Default is 1.  LV_ANIM_REPEAT_INFINIT for infinite repetition*/
lv_anim_set_repeat_count(&a, wait_time);

/*Delay before repeat. Default is 0 (disabled) [ms]*/
lv_anim_set_repeat_delay(&a, wait_time);

/*true (default): apply the start vale immediately, false: apply start vale after delay when then anim. really starts. */
lv_anim_set_early_apply(&a, true/false);

/* START THE ANIMATION
 *------------------*/
lv_anim_start(&a);                             /*Start the animation*/
```


<details>
<summary>查看原文</summary>
<p>

You can apply multiple different animations on the same variable at the same time.
For example, animate the x and y coordinates with `lv_obj_set_x` and `lv_obj_set_y`. However, only one animation can exist with a given variable and function pair.
Therefore `lv_anim_start()` will delete the already existing variable-function animations.
 
</p>
</details>

您可以同时对同一个变量应用多个不同的动画。
例如，使用 `lv_obj_set_x` 和 `lv_obj_set_y` 为 x 和 y 坐标设置动画。但是，对于给定的变量和函数对，只能存在一个动画。
因此`lv_anim_start()` 将删除已经存在的可变函数动画。

## Animation path（动画轨迹）

<details>
<summary>查看原文</summary>
<p>

You can determinate the path of animation. The most simple case is linear, meaning the current value between *start* and *end* is changed with fixed steps.
A *path* is a function which calculates the next value to set based on the current state of the animation. Currently, there are the following built-in paths functions:

- `lv_anim_path_linear` linear animation
- `lv_anim_path_step` change in one step at the end
- `lv_anim_path_ease_in` slow at the beginning
- `lv_anim_path_ease_out` slow at the end
- `lv_anim_path_ease_in_out` slow at the beginning and at the end
- `lv_anim_path_overshoot` overshoot the end value
- `lv_anim_path_bounce` bounce back a little from the end value (like hitting a wall)
 
</p>
</details>

您可以确定动画的路径。最简单的情况是线性的，这意味着 *start* 和 *end* 之间的当前值以固定步长变化。
*path* 是一个函数，它根据动画的当前状态计算要设置的下一个值。目前，有以下内置路径函数：

- `lv_anim_path_linear` 线性动画
- `lv_anim_path_step`最后一步改变
- `lv_anim_path_ease_in` 开始时很慢
- `lv_anim_path_ease_out` 最后慢
- `lv_anim_path_ease_in_out` 开始和结束都很慢
- `lv_anim_path_overshoot` 超过结束值
- `lv_anim_path_bounce` 从最终值反弹一点（比如撞墙）

## Speed vs time（速度与时间）

<details>
<summary>查看原文</summary>
<p>

By default, you set the animation time. But in some cases, setting the animation speed is more practical.

The `lv_anim_speed_to_time(speed, start, end)` function calculates the required time in milliseconds to reach the end value from a start value with the given speed.
The speed is interpreted in _unit/sec_ dimension. For example,  `lv_anim_speed_to_time(20,0,100)` will yield 5000 milliseconds. For example, in case of `lv_obj_set_x` *unit* is pixels so *20* means *20 px/sec* speed.
 
</p>
</details>

默认情况下，您设置动画时间。但在某些情况下，设置动画速度更实用。

`lv_anim_speed_to_time(speed, start, end)` 函数计算从给定速度的起始值到达结束值所需的时间（以毫秒为单位）。
速度以 _unit/sec_ 维度解释。例如，`lv_anim_speed_to_time(20,0,100)` 将产生 5000 毫秒。例如，在 `lv_obj_set_x` 的情况下 *unit* 是像素，所以 *20* 意味着 *20 px/sec* 速度。

## Delete animations（删除动画）

<details>
<summary>查看原文</summary>
<p>

You can delete an animation with `lv_anim_del(var, func)` if you provide the animated variable and its animator function.
 
</p>
</details>

如果您提供动画变量及其动画器函数，您可以使用 `lv_anim_del(var, func)` 删除动画。

## Timeline（时间线）

<details>
<summary>查看原文</summary>
<p>

Timeline is a collection of multiple Animations, which makes it easy to create complex composite animations.

Firstly, create the animation element, but don’t call `lv_anim_start()`.

Secondly, create an animation timeline object, by calling `lv_anim_timeline_create()`.

Thirdly, add animation elements to the animation timeline, by calling `lv_anim_timeline_add(at, start_time, &a)`. `start_time` is the start time of the animation on the timeline. Note that `start_time` will override the value of `delay`.

Finally, call `lv_anim_timeline_start(at)` to start the animation timeline.
 
</p>
</details>

时间线是多个动画的集合，可以轻松创建复杂的复合动画。

首先，创建动画元素，但不要调用`lv_anim_start()`。

其次，通过调用`lv_anim_timeline_create()`创建一个动画时间线对象。

第三，通过调用`lv_anim_timeline_add(at, start_time, &a)`将动画元素添加到动画时间线。 `start_time` 是时间线上动画的开始时间。请注意，`start_time` 将覆盖 `delay` 的值。

最后，调用`lv_anim_timeline_start(at)`启动动画时间线。

<details>
<summary>查看原文</summary>
<p>

It supports forward and backward playback of the entire animation group, using `lv_anim_timeline_set_reverse(at, reverse)`.

Call the `lv_anim_timeline_set_progress(at, progress)` function to set the state of the object corresponding to the progress of the timeline.

Call the `lv_anim_timeline_get_playtime(at)` function to get the total duration of the entire animation timeline.

Call the `lv_anim_timeline_get_reverse(at)` function to get whether to reverse the animation timeline.

Call the `lv_anim_timeline_del(at)` function to delete the animation timeline.
 
</p>
</details>

它支持整个动画组的向前和向后播放，使用`lv_anim_timeline_set_reverse(at, reverse)`。


调用`lv_anim_timeline_set_progress(at,progress)`函数设置时间线进度对应的对象状态。

调用`lv_anim_timeline_get_playtime(at)`函数获取整个动画时间线的总时长。

调用`lv_anim_timeline_get_reverse(at)`函数获取是否反转动画时间线。

调用`lv_anim_timeline_del(at)`函数删除动画时间线。

![](/misc/anim-timeline.png "timeline diagram")

## Examples

```eval_rst

.. include:: ../../examples/anim/index.rst

```
## API

```eval_rst

.. doxygenfile:: lv_anim.h
  :project: lvgl

```
