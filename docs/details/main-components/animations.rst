.. _animations:

================
Animations(动画)
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can automatically change the value of a variable between a start and
an end value using animations. Animation will happen by periodically
calling an "animator" function with the corresponding value parameter.

The *animator* functions have the following prototype:

.. code-block:: c

   void func(void * var, lv_anim_var_t value);

This prototype is compatible with the majority of the property *set*
functions in LVGL. For example :cpp:expr:`lv_obj_set_x(widget, value)` or
:cpp:expr:`lv_obj_set_width(widget, value)`

.. raw:: html

   </details>
   <br>


你可以通过动画在起始值和结束值之间自动改变变量的值。动画将通过定期调用“动画函数”，并传递相应的值参数来发生。

*动画器*函数具有以下原型：

.. code-block:: c

   void func(void * var, lv_anim_var_t value);

这个原型与大多数 LVGL 属性 *set* 函数兼容。例如 :cpp:expr:`lv_obj_set_x(widget, value)` 或 :cpp:expr:`lv_obj_set_width(widget, value)`

.. _animations_create:

Create an animation(创建动画)
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create an animation an :cpp:type:`lv_anim_t` variable has to be initialized
and configured with ``lv_anim_set_...()`` functions.

.. code-block:: c


   /* INITIALIZE AN ANIMATION
    *-----------------------*/

   lv_anim_t a;
   lv_anim_init(&a);

   /* MANDATORY SETTINGS
    *------------------*/

   /* Set the "animator" function */
   lv_anim_set_exec_cb(&a, (lv_anim_exec_xcb_t) lv_obj_set_x);

   /* Set target of the animation */
   lv_anim_set_var(&a, widget);

   /* Length of the animation [ms] */
   lv_anim_set_duration(&a, duration);

   /* Set start and end values. E.g. 0, 150 */
   lv_anim_set_values(&a, start, end);

   /* OPTIONAL SETTINGS
    *------------------*/

   /* Time to wait before starting the animation [ms] */
   lv_anim_set_delay(&a, delay);

   /* Set path (curve). Default is linear */
   lv_anim_set_path_cb(&a, lv_anim_path_ease_in);

   /* Set a callback to indicate when the animation is completed. */
   lv_anim_set_completed_cb(&a, completed_cb);

   /* Set a callback to indicate when the animation is deleted (idle). */
   lv_anim_set_deleted_cb(&a, deleted_cb);

   /* Set a callback to indicate when the animation is started (after delay). */
   lv_anim_set_start_cb(&a, start_cb);

   /* When ready, play the animation backward with this duration. Default is 0 (disabled) [ms] */
   lv_anim_set_playback_duration(&a, time);

   /* Delay before playback. Default is 0 (disabled) [ms] */
   lv_anim_set_playback_delay(&a, delay);

   /* Number of repetitions. Default is 1. LV_ANIM_REPEAT_INFINITE for infinite repetition */
   lv_anim_set_repeat_count(&a, cnt);

   /* Delay before repeat. Default is 0 (disabled) [ms] */
   lv_anim_set_repeat_delay(&a, delay);

   /* true (default): apply the start value immediately, false: apply start value after delay when the anim. really starts. */
   lv_anim_set_early_apply(&a, true/false);

   /* START THE ANIMATION
    *------------------*/
   lv_anim_start(&a);                             /* Start the animation */

You can apply multiple different animations on the same variable at the
same time. For example, animate the x and y coordinates with
:cpp:func:`lv_obj_set_x` and :cpp:func:`lv_obj_set_y`. However, only one animation can
exist with a given variable and function pair and :cpp:func:`lv_anim_start`
will remove any existing animations for such a pair.

.. raw:: html

   </details>
   <br>

要创建一个动画，必须初始化一个 :cpp:type:`lv_anim_t` 变量，并通过 ``lv_anim_set_...()`` 函数进行配置。

.. code-block:: c

   /* 初始化动画
    *-----------------------*/

   lv_anim_t a;
   lv_anim_init(&a);

   /* 必要设置
    *------------------*/

   /* 设置“动画器”函数 */
   lv_anim_set_exec_cb(&a, (lv_anim_exec_xcb_t) lv_obj_set_x);

   /* 设置动画的目标 */
   lv_anim_set_var(&a, widget);

   /* 动画的持续时间 [ms] */
   lv_anim_set_duration(&a, duration);

   /* 设置起始值和结束值。例如 0, 150 */
   lv_anim_set_values(&a, start, end);

   /* 可选设置
    *------------------*/

   /* 动画开始前的等待时间 [ms] */
   lv_anim_set_delay(&a, delay);

   /* 设置路径（曲线）。默认是线性 */
   lv_anim_set_path_cb(&a, lv_anim_path_ease_in);

   /* 设置回调函数，指示动画何时完成。 */
   lv_anim_set_completed_cb(&a, completed_cb);

   /* 设置回调函数，指示动画何时被删除（空闲）。 */
   lv_anim_set_deleted_cb(&a, deleted_cb);

   /* 设置回调函数，指示动画何时开始（延迟后）。 */
   lv_anim_set_start_cb(&a, start_cb);

   /* 动画准备好后，以此时长反向播放动画。默认值为 0（禁用）[ms] */
   lv_anim_set_playback_duration(&a, time);

   /* 播放前的延迟。默认值为 0（禁用）[ms] */
   lv_anim_set_playback_delay(&a, delay);

   /* 重复次数。默认值为 1。LV_ANIM_REPEAT_INFINITE 表示无限重复 */
   lv_anim_set_repeat_count(&a, cnt);

   /* 重复前的延迟。默认值为 0（禁用）[ms] */
   lv_anim_set_repeat_delay(&a, delay);

   /* true（默认）：立即应用起始值，false：在延迟后应用起始值，动画真正开始时。 */
   lv_anim_set_early_apply(&a, true/false);

   /* 启动动画
    *------------------*/
   lv_anim_start(&a);                             /* 启动动画 */

你可以在同一个变量上同时应用多个不同的动画。例如，使用 :cpp:func:`lv_obj_set_x` 和 :cpp:func:`lv_obj_set_y` 来分别动画化 x 和 y 坐标。然而，给定的变量和函数对只能存在一个动画，且 :cpp:func:`lv_anim_start` 会删除该对已有的任何动画。


.. _animations_path:

Animation path（动画轨迹）
*************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can control the path of an animation. The most simple case is
linear, meaning the current value between *start* and *end* is changed
with fixed steps. A *path* is a function which calculates the next value
to set based on the current state of the animation. Currently, there are
the following built-in path functions:

-  :cpp:func:`lv_anim_path_linear`: linear animation
-  :cpp:func:`lv_anim_path_step`: change in one step at the end
-  :cpp:func:`lv_anim_path_ease_in`: slow at the beginning
-  :cpp:func:`lv_anim_path_ease_out`: slow at the end
-  :cpp:func:`lv_anim_path_ease_in_out`: slow at the beginning and end
-  :cpp:func:`lv_anim_path_overshoot`: overshoot the end value
-  :cpp:func:`lv_anim_path_bounce`: bounce back a little from the end value (like
   hitting a wall)

.. raw:: html

   </details>
   <br>


你可以控制动画的路径。最简单的情况是线性路径，意味着在 *start* 和 *end* 之间的当前值是通过固定的步长来改变的。*路径* 是一个函数，它根据动画的当前状态计算下一个需要设置的值。目前，以下是内置的路径函数：

-  :cpp:func:`lv_anim_path_linear`：线性动画
-  :cpp:func:`lv_anim_path_step`：在结束时一步变化
-  :cpp:func:`lv_anim_path_ease_in`：开始时慢
-  :cpp:func:`lv_anim_path_ease_out`：结束时慢
-  :cpp:func:`lv_anim_path_ease_in_out`：开始和结束时都慢
-  :cpp:func:`lv_anim_path_overshoot`：超出结束值
-  :cpp:func:`lv_anim_path_bounce`：从结束值稍微反弹（像撞到墙一样）

.. _animations_speed_vs_time:

Speed vs time（速度与时间）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, you set the animation time directly. But in some cases,
setting the animation speed is more practical.

The :cpp:expr:`lv_anim_speed_to_time(speed, start, end)` function calculates the
required time in milliseconds to reach the end value from a start value
with the given speed. The speed is interpreted in *unit/sec* dimension.
For example, :cpp:expr:`lv_anim_speed_to_time(20, 0, 100)` will yield 5000
milliseconds. For example, in the case of :cpp:func:`lv_obj_set_x` *unit* is
pixels so *20* means *20 px/sec* speed.

.. raw:: html

   </details>
   <br>


默认情况下，你直接设置动画时间。但在某些情况下，设置动画速度更为实际。

:cpp:expr:`lv_anim_speed_to_time(speed, start, end)` 函数计算在给定速度下，从起始值到结束值所需的时间（以毫秒为单位）。
速度的单位是 *单位/秒*。例如，:cpp:expr:`lv_anim_speed_to_time(20, 0, 100)` 将返回 5000 毫秒。
例如，在 :cpp:func:`lv_obj_set_x` 的情况下，*单位* 是像素，所以 *20* 意味着 *20 像素/秒* 的速度。

.. _animations_delete:

Delete animations（删除动画）
****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can delete an animation with :cpp:expr:`lv_anim_delete(var, func)` if you
provide the animated variable and its animator function.

.. raw:: html

   </details>
   <br>


如果您提供了被动画的变量及其动画器函数，您可以使用 :cpp:expr:`lv_anim_delete(var, func)` 删除动画。


.. _animations_timeline:

Timeline（时间轴）
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

A timeline is a collection of multiple animations which makes it easy to
create complex composite animations.

Firstly, create an animation element but don't call :cpp:func:`lv_anim_start`.

Secondly, create an animation timeline object by calling
:cpp:func:`lv_anim_timeline_create`.

Thirdly, add animation elements to the animation timeline by calling
:cpp:expr:`lv_anim_timeline_add(at, start_time, &a)`. ``start_time`` is the
start time of the animation on the timeline. Note that ``start_time``
will override the value of ``delay``.

Finally, call :cpp:expr:`lv_anim_timeline_start(at)` to start the animation
timeline.

It supports forward and backward playback of the entire animation group,
using :cpp:expr:`lv_anim_timeline_set_reverse(at, reverse)`.
Note that if you want to play in reverse from the end of the timeline,
you need to call :cpp:expr:`lv_anim_timeline_set_progress(at, LV_ANIM_TIMELINE_PROGRESS_MAX)`
after adding all animations and before starting to play.

Call :cpp:expr:`lv_anim_timeline_stop(at)` to stop the animation timeline.

Call :cpp:expr:`lv_anim_timeline_set_progress(at, progress)` function to set the
state of the Widget corresponding to the progress of the timeline.

Call :cpp:expr:`lv_anim_timeline_get_playtime(at)` function to get the total
duration of the entire animation timeline.

Call :cpp:expr:`lv_anim_timeline_get_reverse(at)` function to get whether to
reverse the animation timeline.

Call :cpp:expr:`lv_anim_timeline_delete(at)` function to delete the animation timeline.
**Note**: If you need to delete a Widget during animation, be sure to delete the
anim timeline before deleting the Widget. Otherwise, the program may crash or behave abnormally.

.. image:: /misc/anim-timeline.png

.. raw:: html

   </details>
   <br>

时间轴是多个动画的集合，使得创建复杂的复合动画变得更加容易。

首先，创建一个动画元素，但不要调用 :cpp:func:`lv_anim_start`。

其次，通过调用 :cpp:func:`lv_anim_timeline_create` 创建一个动画时间轴对象。

第三，通过调用 :cpp:expr:`lv_anim_timeline_add(at, start_time, &a)` 将动画元素添加到动画时间轴中。 ``start_time`` 是动画在时间轴上的开始时间。注意，``start_time`` 会覆盖 ``delay`` 的值。

最后，调用 :cpp:expr:`lv_anim_timeline_start(at)` 启动动画时间轴。

它支持整个动画组的正向和反向播放，可以使用 :cpp:expr:`lv_anim_timeline_set_reverse(at, reverse)` 来控制。注意，如果你想从时间轴的末尾开始反向播放，需在添加所有动画后并在开始播放之前调用 :cpp:expr:`lv_anim_timeline_set_progress(at, LV_ANIM_TIMELINE_PROGRESS_MAX)`。

调用 :cpp:expr:`lv_anim_timeline_stop(at)` 停止动画时间轴。

调用 :cpp:expr:`lv_anim_timeline_set_progress(at, progress)` 函数来设置与时间轴进度对应的 Widget 状态。

调用 :cpp:expr:`lv_anim_timeline_get_playtime(at)` 函数来获取整个动画时间轴的总时长。

调用 :cpp:expr:`lv_anim_timeline_get_reverse(at)` 函数来获取是否反向播放动画时间轴。

调用 :cpp:expr:`lv_anim_timeline_delete(at)` 函数来删除动画时间轴。
**注意**：如果你需要在动画过程中删除 Widget，务必在删除 Widget 之前删除动画时间轴。否则，程序可能会崩溃或出现异常行为。

.. image:: /misc/anim-timeline.png

.. _animations_example:

Examples
********

.. include:: ../../examples/anim/index.rst

.. _animations_api:

API
***
