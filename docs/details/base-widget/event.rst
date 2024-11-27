.. _events:

=============
Events（事件）
=============

.. raw:: html

   <details>
     <summary>显示原文</summary>

Events are triggered in LVGL when something happens which might be
interesting to the user, e.g. when an object:

- is clicked
- is scrolled
- has its value changed
- is redrawn, etc.

Besides widgets, events can registered from displays and input devices too.

.. raw:: html

   </details>
   <br>


当发生某些对用户可能感兴趣的事情时，LVGL中的事件将被触发，例如：

- 被点击
- 被滚动
- 值发生改变
- 重新绘制等。

除了部件，事件还可以从显示和输入设备进行注册。


Add events to a widget（添加事件到对象）
***************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The user can assign callback functions to an object to see its events.
In practice, it looks like this:

.. code:: c

   lv_obj_t * btn = lv_button_create(lv_screen_active());
   lv_obj_add_event_cb(btn, my_event_cb, LV_EVENT_CLICKED, NULL);   /*Assign an event callback*/

   ...

   static void my_event_cb(lv_event_t * event)
   {
       printf("Clicked\n");
   }

In the example :cpp:enumerator:`LV_EVENT_CLICKED` means that only the click event will
call ``my_event_cb``. See the :ref:`list of event codes <events_codes>` for
all the options. :cpp:enumerator:`LV_EVENT_ALL` can be used to receive all events.

The last parameter of :cpp:func:`lv_obj_add_event` is a pointer to any custom
data that will be available in the event. It will be described later in
more detail.

More events can be added to an object, like this:

.. code:: c

   lv_obj_add_event_cb(obj, my_event_cb_1, LV_EVENT_CLICKED, NULL);
   lv_obj_add_event_cb(obj, my_event_cb_2, LV_EVENT_PRESSED, NULL);
   lv_obj_add_event_cb(obj, my_event_cb_3, LV_EVENT_ALL, NULL);       /*No filtering, receive all events*/

Even the same event callback can be used on an object with different
``user_data``. For example:

.. code:: c

   lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num1);
   lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num2);

The events will be called in the order as they were added.

Other objects can use the same *event callback*.

In the very same way events can attached to the input devices and displays like this

.. code:: c

   lv_display_add_event_cb(disp, event_cb, LV_EVENT_RESOLUTION_CHANGED, NULL);
   lv_indev_add_event_cb(indev, event_cb, LV_EVENT_CLICKED, NULL);

.. raw:: html

   </details>
   <br>


用户可以为对象指定回调函数以查看其事件。
实际操作是这样的：

.. code:: c

   lv_obj_t * btn = lv_button_create(lv_screen_active());
   lv_obj_add_event_cb(btn, my_event_cb, LV_EVENT_CLICKED, NULL);   /*分配一个事件回调*/

   ...

   static void my_event_cb(lv_event_t * event)
   {
       printf("Clicked\n");
   }

在示例中 :cpp:enumerator:`LV_EVENT_CLICKED` 意味着只有点击事件会调用 ``my_event_cb``。查看 :ref:`事件代码列表 <events_codes>` 以获取所有选项。 :cpp:enumerator:`LV_EVENT_ALL` 可用于接收所有事件。

:cpp:func:`lv_obj_add_event` 的最后一个参数是指向事件中可用的任何自定义数据的指针。稍后将更详细地描述它。

可以向对象添加更多事件，像这样：

.. code:: c

   lv_obj_add_event_cb(obj, my_event_cb_1, LV_EVENT_CLICKED, NULL);
   lv_obj_add_event_cb(obj, my_event_cb_2, LV_EVENT_PRESSED, NULL);
   lv_obj_add_event_cb(obj, my_event_cb_3, LV_EVENT_ALL, NULL);       /*无过滤，接收所有事件*/

甚至相同的事件回调也可以在具有不同“user_data”的对象上使用。例如：

.. code:: c

   lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num1);
   lv_obj_add_event_cb(obj, increment_on_click, LV_EVENT_CLICKED, &num2);

事件将按其被添加的顺序调用。

其他对象可以使用相同的 *事件回调*。

以完全相同的方式，事件可以附加到输入设备和显示器上，像这样：

.. code:: c

   lv_display_add_event_cb(disp, event_cb, LV_EVENT_RESOLUTION_CHANGED, NULL);
   lv_indev_add_event_cb(indev, event_cb, LV_EVENT_CLICKED, NULL);


Remove event(s) from widgets(从对象中删除事件)
**********************************************

.. code:: c

   uint32_t i;
   uint32_t event_cnt = lv_obj_get_event_count(obj);
   for(i = 0; i < event_cnt; i++) {
       lv_event_dsc_t * event_dsc = lv_obj_get_event_dsc(obj, i);
       if(lv_event_dsc_get_cb(event_dsc) == some_event_cb) {
           lv_obj_remove_event(obj, i);
           break;
       }
   }

.. _events_codes:

Event codes（事件代码）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The event codes can be grouped into these categories: - Input device
events - Drawing events - Other events - Special events - Custom events

All objects (such as Buttons/Labels/Sliders etc.) regardless their type
receive the *Input device*, *Drawing* and *Other* events.

However, the *Special events* are specific to a particular widget type.
See the :ref:`widgets' documentation <widgets>` to learn when they
are sent,

*Custom events* are added by the user and are never sent by LVGL.

The following event codes exist:

.. raw:: html

   </details>
   <br>


事件代码可以分为以下类别：- 输入设备事件 - 绘图事件 - 其他事件 - 特殊事件 - 自定义事件

所有对象（如按钮/标签/滑块等）无论其类型，都会接收 *输入设备*、 *绘图* 和 *其他* 事件。

然而， *特殊事件* 是特定于特定部件类型的。请参阅 :ref:`widgets' documentation <widgets>` 以了解它们何时被发送。

*自定义事件* 是用户添加的，并且永远不会被LVGL发送。

存在以下事件代码：  


Input device events（输入设备事件）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_PRESSED`: The object has been pressed
-  :cpp:enumerator:`LV_EVENT_PRESSING`: The object is being pressed (called continuously while pressing)
-  :cpp:enumerator:`LV_EVENT_PRESS_LOST`: The object is still being pressed but slid cursor/finger off of the object
-  :cpp:enumerator:`LV_EVENT_SHORT_CLICKED`: The object was pressed for a short period of time, then released it. Not called if scrolled.
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED`: Object has been pressed for at least `long_press_time`.  Not called if scrolled.
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT`: Called after `long_press_time` in every `long_press_repeat_time` ms.  Not called if scrolled.
-  :cpp:enumerator:`LV_EVENT_CLICKED`: Called on release if not scrolled (regardless to long press)
-  :cpp:enumerator:`LV_EVENT_RELEASED`: Called in every cases when the object has been released
-  :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`: Scrolling begins. The event parameter is a pointer to the animation of the scroll. Can be modified
-  :cpp:enumerator:`LV_EVENT_SCROLL_THROW_BEGIN`:
-  :cpp:enumerator:`LV_EVENT_SCROLL_END`: Scrolling ends
-  :cpp:enumerator:`LV_EVENT_SCROLL`: Scrolling
-  :cpp:enumerator:`LV_EVENT_GESTURE`: A gesture is detected. Get the gesture with :cpp:expr:`lv_indev_get_gesture_dir(lv_indev_active());`
-  :cpp:enumerator:`LV_EVENT_KEY`: A key is sent to the object. Get the key with :cpp:expr:`lv_indev_get_key(lv_indev_active());`
-  :cpp:enumerator:`LV_EVENT_FOCUSED`: The object is focused
-  :cpp:enumerator:`LV_EVENT_DEFOCUSED`: The object is defocused
-  :cpp:enumerator:`LV_EVENT_LEAVE`: The object is defocused but still selected
-  :cpp:enumerator:`LV_EVENT_HIT_TEST`: Perform advanced hit-testing
-  :cpp:enumerator:`LV_EVENT_INDEV_RESET`: Indev has been reset
-  :cpp:enumerator:`LV_EVENT_HOVER_OVER`: Indev hover over object
-  :cpp:enumerator:`LV_EVENT_HOVER_LEAVE`: Indev hover leave object

.. raw:: html

   </details>
   <br>


-  :cpp:enumerator:`LV_EVENT_PRESSED`: 对象已被按下
-  :cpp:enumerator:`LV_EVENT_PRESSING`: 对象正在被按下（在按下期间持续调用）
-  :cpp:enumerator:`LV_EVENT_PRESS_LOST`: 对象仍在被按下，但滑动光标/手指离开对象
-  :cpp:enumerator:`LV_EVENT_SHORT_CLICKED`: 对象被按下一小段时间，然后释放。如果被滚动，则不会被调用。
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED`: 对象至少被按下`long_press_time`。如果被滚动，则不会被调用。
-  :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT`: 在每`long_press_repeat_time`（长按重复时间）毫秒后，调用一次。如果被滚动，则不会被调用。
-  :cpp:enumerator:`LV_EVENT_CLICKED`: 如果没有被滚动，在释放时被调用（与长按无关）
-  :cpp:enumerator:`LV_EVENT_RELEASED`: 在任何对象释放时被调用
-  :cpp:enumerator:`LV_EVENT_SCROLL_BEGIN`: 滚动开始。事件参数是滚动动画的指针。可以被修改
-  :cpp:enumerator:`LV_EVENT_SCROLL_THROW_BEGIN`: 
-  :cpp:enumerator:`LV_EVENT_SCROLL_END`: 滚动结束
-  :cpp:enumerator:`LV_EVENT_SCROLL`: 滚动中
-  :cpp:enumerator:`LV_EVENT_GESTURE`: 检测到手势。使用 :cpp:expr:`lv_indev_get_gesture_dir(lv_indev_active());` 获取手势
-  :cpp:enumerator:`LV_EVENT_KEY`: 将键发送给对象。使用 :cpp:expr:`lv_indev_get_key(lv_indev_active());` 获取键值
-  :cpp:enumerator:`LV_EVENT_FOCUSED`: 对象获得焦点
-  :cpp:enumerator:`LV_EVENT_DEFOCUSED`: 对象失去焦点
-  :cpp:enumerator:`LV_EVENT_LEAVE`: 对象失去焦点但仍然被选中
-  :cpp:enumerator:`LV_EVENT_HIT_TEST`: 执行高级点击测试
-  :cpp:enumerator:`LV_EVENT_INDEV_RESET`: 输入设备已重置
-  :cpp:enumerator:`LV_EVENT_HOVER_OVER`: 输入设备悬停在对象上方。
-  :cpp:enumerator:`LV_EVENT_HOVER_LEAVE`: 输入设备离开对象上方的悬停状态。



Drawing events（绘图事件）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_COVER_CHECK`: Check if the object fully covers an area. The event parameter is :cpp:type:`lv_cover_check_info_t *`.
-  :cpp:enumerator:`LV_EVENT_REFR_EXT_DRAW_SIZE`: Get the required extra draw area around the object (e.g. for shadow). The event parameter is :cpp:type:`int32_t *` to store the size.
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN`: Starting the main drawing phase
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN`: Perform the main drawing
-  :cpp:enumerator:`LV_EVENT_DRAW_MAIN_END`: Finishing the main drawing phase
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_BEGIN`: Starting the post draw phase (when all children are drawn)
-  :cpp:enumerator:`LV_EVENT_DRAW_POST`: Perform the post draw phase (when all children are drawn)
-  :cpp:enumerator:`LV_EVENT_DRAW_POST_END`: Finishing the post draw phase (when all children are drawn)
-  :cpp:enumerator:`LV_EVENT_DRAW_TASK_ADDED`: Adding a draw task

.. raw:: html

   </details>
   <br>


- :cpp:enumerator:`LV_EVENT_COVER_CHECK`: 检查对象是否完全覆盖了一个区域。事件参数是 :cpp:type:`lv_cover_check_info_t *`类型的指针。
- :cpp:enumerator:`LV_EVENT_REFR_EXT_DRAW_SIZE`: 获取对象周围所需的额外绘制区域（例如用于阴影）。事件参数是 :cpp:type:`int32_t *` 类型的指针，用于存储大小值。
- :cpp:enumerator:`LV_EVENT_DRAW_MAIN_BEGIN`: 开始主绘制阶段
- :cpp:enumerator:`LV_EVENT_DRAW_MAIN`: 执行主绘制
- :cpp:enumerator:`LV_EVENT_DRAW_MAIN_END`: 完成主绘制阶段
- :cpp:enumerator:`LV_EVENT_DRAW_POST_BEGIN`: 开始后绘制阶段（当所有子对象都绘制完成时）
- :cpp:enumerator:`LV_EVENT_DRAW_POST`: 执行后绘制阶段（当所有子对象都绘制完成时）
- :cpp:enumerator:`LV_EVENT_DRAW_POST_END`: 完成后绘制阶段（当所有子对象都绘制完成时）
- :cpp:enumerator:`LV_EVENT_DRAW_TASK_ADDED`: 添加绘制任务


Special events（特殊事件）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: The object's value has changed (i.e. slider moved)
-  :cpp:enumerator:`LV_EVENT_INSERT`: A text is inserted to the object. The event data is `char *` being inserted.
-  :cpp:enumerator:`LV_EVENT_REFRESH`: Notify the object to refresh something on it (for the user)
-  :cpp:enumerator:`LV_EVENT_READY`: A process has finished
-  :cpp:enumerator:`LV_EVENT_CANCEL`: A process has been cancelled

.. raw:: html

   </details>
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`: 对象的值已更改（例如，滑块移动）
-  :cpp:enumerator:`LV_EVENT_INSERT`: 文本已插入到对象中。事件数据是被插入的 `char *`类型的文本。
-  :cpp:enumerator:`LV_EVENT_REFRESH`: 通知对象刷新其上的某些内容（用户用）
-  :cpp:enumerator:`LV_EVENT_READY`: 进程已结束
-  :cpp:enumerator:`LV_EVENT_CANCEL`: 进程已取消


Other events（其他事件）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_CREATE`: Object is being created
-  :cpp:enumerator:`LV_EVENT_DELETE`: Object is being deleted
-  :cpp:enumerator:`LV_EVENT_CHILD_CHANGED`: Child was removed, added, or its size, position were changed
-  :cpp:enumerator:`LV_EVENT_CHILD_CREATED`: Child was created, always bubbles up to all parents
-  :cpp:enumerator:`LV_EVENT_CHILD_DELETED`: Child was deleted, always bubbles up to all parents
-  :cpp:enumerator:`LV_EVENT_SCREEN_UNLOAD_START`: A screen unload started, fired immediately when scr_load is called
-  :cpp:enumerator:`LV_EVENT_SCREEN_LOAD_START`: A screen load started, fired when the screen change delay is expired
-  :cpp:enumerator:`LV_EVENT_SCREEN_LOADED`: A screen was loaded
-  :cpp:enumerator:`LV_EVENT_SCREEN_UNLOADED`: A screen was unloaded
-  :cpp:enumerator:`LV_EVENT_SIZE_CHANGED`: Object coordinates/size have changed
-  :cpp:enumerator:`LV_EVENT_STYLE_CHANGED`: Object's style has changed
-  :cpp:enumerator:`LV_EVENT_LAYOUT_CHANGED`: The children position has changed due to a layout recalculation
-  :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE`: Get the internal size of a widget

.. raw:: html

   </details>
   <br>


-  :cpp:enumerator:`LV_EVENT_CREATE`: 对象正在被创建
-  :cpp:enumerator:`LV_EVENT_DELETE`: 对象正在被删除
-  :cpp:enumerator:`LV_EVENT_CHILD_CHANGED`: 子对象已被移除、添加，或其大小、位置已被修改
-  :cpp:enumerator:`LV_EVENT_CHILD_CREATED`: 子对象已被创建，总是向上冒泡到所有父对象
-  :cpp:enumerator:`LV_EVENT_CHILD_DELETED`: 子对象已被删除，总是向上冒泡到所有父对象
-  :cpp:enumerator:`LV_EVENT_SCREEN_UNLOAD_START`: 屏幕卸载已开始，在调用scr_load时立即触发
-  :cpp:enumerator:`LV_EVENT_SCREEN_LOAD_START`: 屏幕加载已开始，在屏幕切换延迟过后触发
-  :cpp:enumerator:`LV_EVENT_SCREEN_LOADED`: 屏幕已加载
-  :cpp:enumerator:`LV_EVENT_SCREEN_UNLOADED`: 屏幕已卸载
-  :cpp:enumerator:`LV_EVENT_SIZE_CHANGED`: 对象坐标/大小已更改
-  :cpp:enumerator:`LV_EVENT_STYLE_CHANGED`: 对象的样式已更改
-  :cpp:enumerator:`LV_EVENT_LAYOUT_CHANGED`: 由于布局重新计算，子对象位置已更改
-  :cpp:enumerator:`LV_EVENT_GET_SELF_SIZE`: 获取部件的内部大小


Display events（展示时间）
-------------------------

-  :cpp:enumerator:`LV_EVENT_INVALIDATE_AREA`
-  :cpp:enumerator:`LV_EVENT_RESOLUTION_CHANGED`
-  :cpp:enumerator:`LV_EVENT_COLOR_FORMAT_CHANGED`
-  :cpp:enumerator:`LV_EVENT_REFR_REQUEST`
-  :cpp:enumerator:`LV_EVENT_REFR_START`
-  :cpp:enumerator:`LV_EVENT_REFR_READY`
-  :cpp:enumerator:`LV_EVENT_RENDER_START`
-  :cpp:enumerator:`LV_EVENT_RENDER_READY`
-  :cpp:enumerator:`LV_EVENT_FLUSH_START`
-  :cpp:enumerator:`LV_EVENT_FLUSH_FINISH`

Custom events（自定义事件）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Any custom event codes can be registered by
``uint32_t MY_EVENT_1 =`` :cpp:func:`lv_event_register_id`

They can be sent to any object with
:cpp:expr:`lv_event_send(obj, MY_EVENT_1, &some_data)`

.. raw:: html

   </details>
   <br>


任何自定义事件代码都可以通过
``uint32_t MY_EVENT_1 =`` :cpp:func:`lv_event_register_id` 
来注册。

它们可以发送到任何对象中，使用
:cpp:expr:`lv_event_send(obj, MY_EVENT_1, &some_data)`


Sending events（发送事件）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To manually send events to an object, use
:cpp:expr:`lv_obj_send_event(obj, <EVENT_CODE>, &some_data)`.

For example, this can be used to manually close a message box by
simulating a button press (although there are simpler ways to do this):

.. code:: c

   /*Simulate the press of the first button (indexes start from zero)*/
   uint32_t btn_id = 0;
   lv_event_send(mbox, LV_EVENT_VALUE_CHANGED, &btn_id);

The same works for display and input devices with
:cpp:expr:`lv_display_send_event(obj, <EVENT_CODE>, &some_data)` and
:cpp:expr:`lv_indev_send_event(obj, <EVENT_CODE>, &some_data)`.

.. raw:: html

   </details>
   <br>


手动发送事件到对象，使用以下代码 :cpp:expr:`lv_obj_send_event(obj, <EVENT_CODE>, &some_data)`。

例如，这可以用于通过模拟按钮按下来手动关闭消息框（尽管有更简单的方法来做到这一点）：

.. code:: c

   /*模拟第一个按钮的按下（索引从零开始）*/
   uint32_t btn_id = 0;
   lv_event_send(mbox, LV_EVENT_VALUE_CHANGED, &btn_id);

对于显示器和输入设备也同样适用：
:cpp:expr:`lv_display_send_event(obj, <EVENT_CODE>, &some_data)` 和
:cpp:expr:`lv_indev_send_event(obj, <EVENT_CODE>, &some_data)`。


Refresh event（刷新事件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:enumerator:`LV_EVENT_REFRESH` is a special event because it's designed to let the
user notify an object to refresh itself. Some examples:

- notify a label to refresh its text according to one or more variables (e.g. current time)
- refresh a label when the language changes
- enable a button if some conditions are met (e.g. the correct PIN is entered)
- add/remove styles to/from an object if a limit is exceeded, etc

.. raw:: html

   </details>
   <br>


:cpp:enumerator:`LV_EVENT_REFRESH` 是一个特殊事件，因为它被设计用来让用户通知对象刷新自身。一些例子包括：

- 通知标签根据一个或多个变量刷新其文本（比如当前时间）
- 当语言发生变化时刷新标签
- 如果满足一些条件（比如输入了正确的PIN码），则启用一个按钮
- 当超出限制时，为对象添加/移除样式，等等


Fields of lv_event_t（lv_event_t 的字段）
****************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>
     
:cpp:type:`lv_event_t` is the only parameter passed to the event callback and it
contains all data about the event. The following values can be gotten from it:

- :cpp:expr:`lv_event_get_code(e)`: get the event code
- :cpp:expr:`lv_event_get_current_target(e)`: get the object to which an event was sent. I.e. the object whose event handler is being called.
- :cpp:expr:`lv_event_get_target(e)`: get the object that originally triggered the event (different from :cpp:func:`lv_event_get_target` if :ref:`event bubbling <events_bubbling>` is enabled)
- :cpp:expr:`lv_event_get_user_data(e)`: get the pointer passed as the last parameter of :cpp:func:`lv_obj_add_event`.
- :cpp:expr:`lv_event_get_param(e)`: get the parameter passed as the last parameter of :cpp:func:`lv_event_send`

.. raw:: html

   </details>
   <br>


:cpp:type:`lv_event_t` 是传递给事件回调函数的唯一参数，它包含了该事件的所有数据。可以从中获取以下值：

- :cpp:expr:`lv_event_get_code(e)`：获取事件代码
- :cpp:expr:`lv_event_get_current_target(e)`：获取事件被发送到的对象。即，正在被调用其事件处理程序的对象。 
- :cpp:expr:`lv_event_get_target(e)`： 获取最初触发事件的对象（如果启用了 :ref:`event bubbling <events_bubbling>` ，则与 :cpp:func:`lv_event_get_target` 不同）
- :cpp:expr:`lv_event_get_user_data(e)`： 获取作为 :cpp:func:`lv_obj_add_event` 的最后一个参数传递的指针。
- :cpp:expr:`lv_event_get_param(e)`： 获取作为 :cpp:func:`lv_event_send` 的最后一个参数传递的参数。


.. _events_bubbling:

Event bubbling（事件冒泡）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

If :cpp:expr:`lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE)` is enabled all
events will be sent to an object's parent too. If the parent also has
:cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE` enabled the event will be sent to its
parent and so on.

The *target* parameter of the event is always the current target object,
not the original object. To get the original target call
:cpp:expr:`lv_event_get_target_obj(e)` in the event handler.

.. raw:: html

   </details>
   <br>


如果启用了 :cpp:expr:`lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE)`，那么所有事件也会发送给对象的父对象。如果父对象也启用了 :cpp:enumerator:`LV_OBJ_FLAG_EVENT_BUBBLE`，那么该事件将继续被发送给其父对象，依此类推。

事件的 *target* 参数始终是当前的目标对象，而不是原始对象。要获取原始目标对象，可以在事件处理函数中调用 :cpp:expr:`lv_event_get_target_obj(e)`。


.. _events_examples:

Examples
********

.. include:: ../examples/event/index.rst

.. _events_api:

API
***
