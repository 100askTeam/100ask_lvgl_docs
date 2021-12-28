```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/event.md
```
# Events（事件）

<details>
<summary>查看原文</summary>
<p>

Events are triggered in LVGL when something happens which might be interesting to the user, e.g. when an object
- is clicked
- is scrolled
- has its value changed
- is redrawn, etc.

</p>
</details>

当发生用户可能感兴趣的事情时，LVGL 中会触发事件，例如当一个对象
- 被点击
- 滚动
- 数值被改变
- 重绘等。


## Add events to the object

<details>
<summary>查看原文</summary>
<p>

The user can assign callback functions to an object to see its events. In practice, it looks like this:

</p>
</details>

用户可以为对象分配回调函数以查看其事件。在实践中，它看起来像这样：

```c
lv_obj_t * btn = lv_btn_create(lv_scr_act());
lv_obj_add_event_cb(btn, my_event_cb, LV_EVENT_CLICKED, NULL);   /*Assign an event callback*/

...

static void my_event_cb(lv_event_t * event)
{
    printf("Clicked\n");
}
```

<details>
<summary>查看原文</summary>
<p>

In the example `LV_EVENT_CLICKED` means that only the click event will call `my_event_cb`. See the [list of event codes](#event-codes) for all the options.
`LV_EVENT_ALL` can be used to receive all the events.

The last parameter of `lv_obj_add_event_cb` is a pointer to any custom data that will be available in the event. It will be described later in more detail.

More events can be added to an object, like this:

</p>
</details>

在示例中`LV_EVENT_CLICKED` 意味着只有点击事件会调用`my_event_cb`。有关所有选项，请参阅[事件代码列表](#event-codes)。
`LV_EVENT_ALL` 可用于接收所有事件。

`lv_obj_add_event_cb` 的最后一个参数是指向事件中可用的任何自定义数据的指针。稍后将更详细地描述。

可以向一个对象添加更多事件，如下所示：


```c
lv_obj_add_event_cb(obj, my_event_cb_1, LV_EVENT_CLICKED, NULL);
lv_obj_add_event_cb(obj, my_event_cb_2, LV_EVENT_PRESSED, NULL);
lv_obj_add_event_cb(obj, my_event_cb_3, LV_EVENT_ALL, NULL);		/*No filtering, receive all events*/
```

<details>
<summary>查看原文</summary>
<p>

Even the same event callback can be used on an object with different `user_data`. For example:

</p>
</details>

即使是相同的事件回调也可以用于具有不同“user_data”的对象。例如：

```c
lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num1);
lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num2);
```

<details>
<summary>查看原文</summary>
<p>

The events will be called in the order as they were added. 

More objects can use the same *event callback*.

</p>
</details>

事件将按照添加的顺序调用。

更多的对象可以使用相同的*事件回调*。

## Remove event(s) from an object(从对象中删除事件)

<details>
<summary>查看原文</summary>
<p>

Events can be removed from an object with the `lv_obj_remove_event_cb(obj, event_cb)` function or `lv_obj_remove_event_dsc(obj, event_dsc)`. `event_dsc` is a pointer returned by `lv_obj_add_event_cb`. 

</p>
</details>

可以使用 `lv_obj_remove_event_cb(obj, event_cb)` 函数或 `lv_obj_remove_event_dsc(obj, event_dsc)` 从对象中删除事件。 `event_dsc` 是一个由 `lv_obj_add_event_cb` 返回的指针。

## Event codes

<details>
<summary>查看原文</summary>
<p>

The event codes can be grouped into these categories:
- Input device events
- Drawing events
- Other events
- Special events
- Custom events

All objects (such as Buttons/Labels/Sliders etc.) regardless their type receive the *Input device*, *Drawing* and *Other* events. 

However the *Special events* are specific to a particular widget type. See the [widgets' documentation](/widgets/index) to learn when they are sent, 

*Custom events* are added by the user and therefore these are never sent by LVGL.

The following event codes exist:

</p>
</details>

事件代码可以分为以下几类：
- 输入设备事件
- 绘图事件
- 其他活动
- 特别活动
- 自定义事件

所有对象（例如按钮/标签/滑块等），无论其类型如何，都会接收 *Input device*、*Drawing* 和 *Other* 事件。

然而，*特殊事件* 特定于特定的小部件类型。查看 [widgets' 文档](/widgets/index) 了解何时发送，

*自定义事件*由用户添加，因此这些事件永远不会由 LVGL 发送。

存在以下事件代码：

### Input device events（输入设备事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_PRESSED`      The object has been pressed
- `LV_EVENT_PRESSING`     The object is being pressed (called continuously while pressing)
- `LV_EVENT_PRESS_LOST`   The object is still being pressed but slid cursor/finger off of the object 
- `LV_EVENT_SHORT_CLICKED`    The object was pressed for a short period of time, then released it. Not called if scrolled.
- `LV_EVENT_LONG_PRESSED` Object has been pressed for at least the `long_press_time` specified in the input device driver.  Not called if scrolled.
- `LV_EVENT_LONG_PRESSED_REPEAT`  Called after `long_press_time` in every `long_press_repeat_time` ms.  Not called if scrolled.
- `LV_EVENT_CLICKED`      Called on release if the object did not scroll (regardless of long press)
- `LV_EVENT_RELEASED`     Called in every case when the object has been released
- `LV_EVENT_SCROLL_BEGIN` Scrolling begins. The event paramter is `NULL` or an `lv_anim_t *` with the scroll animation descriptor to modify if required. 
- `LV_EVENT_SCROLL_END`   Scrolling ends.
- `LV_EVENT_SCROLL`       The object was scrolled
- `LV_EVENT_GESTURE`      A gesture is detected. Get the gesture with `lv_indev_get_gesture_dir(lv_indev_get_act());`
- `LV_EVENT_KEY`          A key is sent to the object. Get the key with `lv_indev_get_key(lv_indev_get_act());`
- `LV_EVENT_FOCUSED`      The object is focused 
- `LV_EVENT_DEFOCUSED`    The object is defocused
- `LV_EVENT_LEAVE`        The object is defocused but still selected
- `LV_EVENT_HIT_TEST`     Perform advanced hit-testing. Use `lv_hit_test_info_t * a = lv_event_get_hit_test_info(e)` and check if `a->point` can click the object or not. If not set `a->res = false` 

</p>
</details>

- `LV_EVENT_PRESSED` 对象已被按下
- `LV_EVENT_PRESSING` 对象被按下（按下时连续调用）
- `LV_EVENT_PRESS_LOST` 对象仍被按下，但光标/手指已滑离对象
- `LV_EVENT_SHORT_CLICKED` 对象被按下一小段时间，然后释放它。如果滚动则不会调用。
- `LV_EVENT_LONG_PRESSED` 对象已按下输入设备驱动程序中指定的至少 `long_press_time`。如果滚动则不会调用。
- `LV_EVENT_LONG_PRESSED_REPEAT` 在每个 `long_press_repeat_time` 毫秒的 `long_press_time` 之后调用。如果滚动则不会调用。
- `LV_EVENT_CLICKED` 如果对象没有滚动，则在释放时调用（无论是否长按）
- `LV_EVENT_RELEASED` 在对象被释放后的每种情况下调用
- `LV_EVENT_SCROLL_BEGIN` 开始滚动。事件参数是 `NULL` 或 `lv_anim_t *`，如果需要，可以修改滚动动画描述符。
- `LV_EVENT_SCROLL_END` 滚动结束。
- `LV_EVENT_SCROLL` 对象被滚动
- `LV_EVENT_GESTURE` 检测到手势。使用 `lv_indev_get_gesture_dir(lv_indev_get_act());` 获取手势
- `LV_EVENT_KEY` 一个密钥被发送到对象。使用 `lv_indev_get_key(lv_indev_get_act());` 获取密钥
- `LV_EVENT_FOCUSED` 对象被聚焦
- `LV_EVENT_DEFOCUSED` 对象散焦
- `LV_EVENT_LEAVE` 对象散焦但仍被选中
- `LV_EVENT_HIT_TEST` 执行高级命中测试。使用 `lv_hit_test_info_t * a = lv_event_get_hit_test_info(e)` 并检查 `a->point` 是否可以点击对象。如果没有则 `a->res = false`

### Drawing events（绘图事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_COVER_CHECK` Check if the object fully covers an area. The event parameter is `lv_cover_check_info_t *`.
- `LV_EVENT_REFR_EXT_DRAW_SIZE`  Get the required extra draw area around the object (e.g. for shadow). The event parameter is `lv_coord_t *` to store the size. Overwrite it only with a larger value.
- `LV_EVENT_DRAW_MAIN_BEGIN` Starting the main drawing phase.
- `LV_EVENT_DRAW_MAIN`   Perform the main drawing
- `LV_EVENT_DRAW_MAIN_END`   Finishing the main drawing phase
- `LV_EVENT_DRAW_POST_BEGIN` Starting the post draw phase (when all children are drawn)
- `LV_EVENT_DRAW_POST`   Perform the post draw phase (when all children are drawn)
- `LV_EVENT_DRAW_POST_END`   Finishing the post draw phase (when all children are drawn)
- `LV_EVENT_DRAW_PART_BEGIN` Starting to draw a part. The event parameter is `lv_obj_draw_dsc_t *`. Learn more [here](/overview/drawing).
- `LV_EVENT_DRAW_PART_END`   Finishing to draw a part. The event parameter is `lv_obj_draw_dsc_t *`. Learn more [here](/overview/drawing).

</p>
</details>

- `LV_EVENT_COVER_CHECK` 检查对象是否完全覆盖一个区域。事件参数是`lv_cover_check_info_t *`。
- `LV_EVENT_REFR_EXT_DRAW_SIZE` 获取对象周围所需的额外绘制区域（例如用于阴影）。事件参数是 `lv_coord_t *` 来存储大小。仅用更大的值覆盖它。
- `LV_EVENT_DRAW_MAIN_BEGIN` 开始主绘图阶段。
- `LV_EVENT_DRAW_MAIN` 执行主绘图
- `LV_EVENT_DRAW_MAIN_END` 完成主绘制阶段
- `LV_EVENT_DRAW_POST_BEGIN` 开始后期绘制阶段（当所有孩子都被绘制时）
- `LV_EVENT_DRAW_POST` 执行后期绘制阶段（当所有孩子都被绘制时）
- `LV_EVENT_DRAW_POST_END` 完成后期绘制阶段（当所有孩子都被绘制时）
- `LV_EVENT_DRAW_PART_BEGIN` 开始绘制零件。事件参数是`lv_obj_draw_dsc_t *`。了解更多 [此处](/overview/drawing)。
- `LV_EVENT_DRAW_PART_END` 完成绘制零件。事件参数是`lv_obj_draw_dsc_t *`。了解更多 [此处](/overview/drawing)。


### Other events（其他事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_DELETE`       Object is being deleted
- `LV_EVENT_CHILD_CHANGED`    Child was removed/added
- `LV_EVENT_SIZE_CHANGED`    Object coordinates/size have changed
- `LV_EVENT_STYLE_CHANGED`    Object's style has changed
- `LV_EVENT_BASE_DIR_CHANGED` The base dir has changed
- `LV_EVENT_GET_SELF_SIZE`    Get the internal size of a widget

</p>
</details>

- `LV_EVENT_DELETE` 对象正在被删除
- `LV_EVENT_CHILD_CHANGED` 孩子被移除/添加
- `LV_EVENT_SIZE_CHANGED` 对象坐标/大小已更改
- `LV_EVENT_STYLE_CHANGED` 对象的样式已更改
- `LV_EVENT_BASE_DIR_CHANGED` 基础目录已经改变
- `LV_EVENT_GET_SELF_SIZE` 获取小部件的内部尺寸


### Special events（特殊事件）

<details>
<summary>查看原文</summary>
<p>

- `LV_EVENT_VALUE_CHANGED`    The object's value has changed (i.e. slider moved)
- `LV_EVENT_INSERT`       A text is being inserted to the object. The event data is `char *` being inserted.
- `LV_EVENT_REFRESH`      Notify the object to refresh something on it (for the user)
- `LV_EVENT_READY`        A process has finished
- `LV_EVENT_CANCEL`       A process has been canceled 

</p>
</details>

- `LV_EVENT_VALUE_CHANGED` 对象的值已更改（即滑块移动）
- `LV_EVENT_INSERT` 正在向对象插入文本。事件数据是插入的`char *`。
- `LV_EVENT_REFRESH` 通知对象刷新其上的某些内容（对于用户）
- `LV_EVENT_READY` 一个过程已经完成
- `LV_EVENT_CANCEL` 一个过程被取消

### Custom events（自定义事件）

<details>
<summary>查看原文</summary>
<p>

Any custom event codes can be registered by `uint32_t MY_EVENT_1 = lv_event_register_id();` 

And can be sent to any object with `lv_event_send(obj, MY_EVENT_1, &some_data)`

</p>
</details>

任何自定义事件代码都可以通过`uint32_t MY_EVENT_1 = lv_event_register_id();`注册

并且可以使用`lv_event_send(obj, MY_EVENT_1, &some_data)`发送到任何对象

## Sending events（发送事件）

<details>
<summary>查看原文</summary>
<p>

To manually send events to an object, use `lv_event_send(obj, <EVENT_CODE> &some_data)`.

For example, this can be used to manually close a message box by simulating a button press (although there are simpler ways to do this):

</p>
</details>

要手动向对象发送事件，请使用 `lv_event_send(obj, <EVENT_CODE> &some_data)`。

例如，这可用于通过模拟按钮按下来手动关闭消息框（尽管有更简单的方法可以做到这一点）：

```c
/*Simulate the press of the first button (indexes start from zero)*/
uint32_t btn_id = 0;
lv_event_send(mbox, LV_EVENT_VALUE_CHANGED, &btn_id);
```

### Refresh event（刷新事件）

<details>
<summary>查看原文</summary>
<p>

`LV_EVENT_REFRESH` is special event because it's designed to be used by the user to notify an object to refresh itself. Some examples:
- notify a label to refresh its text according to one or more variables (e.g. current time)
- refresh a label when the language changes
- enable a button if some conditions are met (e.g. the correct PIN is entered)
- add/remove styles to/from an object if a limit is exceeded, etc

</p>
</details>

`LV_EVENT_REFRESH` 是一个特殊事件，因为它被设计为用户使用它来通知对象刷新自身。一些例子：
- 通知标签根据一个或多个变量（例如当前时间）刷新其文本
- 当语言改变时刷新标签
- 如果满足某些条件（例如输入正确的 PIN），则启用按钮
- 如果超出限制，则向/从对象添加/删除样式等


## Fields of lv_event_t（lv_event_t 的字段）

<details>
<summary>查看原文</summary>
<p>

`lv_event_t` is the only parameter passed to event callback and it contains all the data about the event. The following values can be gotten from it:
- `lv_event_get_code(e)` get the event code
- `lv_event_get_target(e)` get the object to which the event is sent
- `lv_event_get_original_target(e)` get the object to which the event is sent originally sent (different from `lv_event_get_target` if [event bubbling](#event-bubbling) is enabled)
- `lv_event_get_user_data(e)` get the pointer passed as the last parameter of `lv_obj_add_event_cb`.
- `lv_event_get_param(e)` get the parameter passed as the last parameter of `lv_event_send` 

</p>
</details>

`lv_event_t` 是传递给事件回调的唯一参数，它包含有关事件的所有数据。可以从中获得以下值：
- `lv_event_get_code(e)` 获取触发的事件代码
- `lv_event_get_target(e)` 获取事件发送到(关联)的对象
- `lv_event_get_original_target(e)` 获取事件最初发送到的对象（与 `lv_event_get_target` 不同，如果 [event bubbling](#event-bubbling) 被启用）
- `lv_event_get_user_data(e)` 获取作为 `lv_obj_add_event_cb` 的最后一个参数传递的指针。
- `lv_event_get_param(e)` 获取作为 `lv_event_send` 的最后一个参数传递的参数



## Event bubbling（事件冒泡）

<details>
<summary>查看原文</summary>
<p>

If `lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE)` is enabled all events will be sent to the object's parent too. If the parent also has `LV_OBJ_FLAG_EVENT_BUBBLE` enabled the event will be sent to its parent too, and so on. 

The *target* parameter of the event is always the current target object, not the original object. To get the original target call `lv_event_get_original_target(e)` in the event handler.  

</p>
</details>

如果启用了 `lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE)`，所有事件也将发送到对象的父级。如果父级也启用了`LV_OBJ_FLAG_EVENT_BUBBLE`，则事件也将发送到其父级，依此类推。

事件的 *target* 参数始终是当前目标对象，而不是原始对象。在事件处理程序中获取原始目标调用 `lv_event_get_original_target(e)`。

## Examples

```eval_rst

.. include:: ../../examples/event/index.rst

```
