.. _porting_indev:

=====================================
Input device interface（输入设备接口）
=====================================

Types of input devices（输入设备的类型）
***************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create an input device use

.. code:: c

   /*Register at least one display before you register any input devices*/
   lv_indev_t * indev = lv_indev_create();
   lv_indev_set_type(indev, LV_INDEV_TYPE_...);   /*See below.*/
   lv_indev_set_read_cb(indev, read_cb);  /*See below.*/

The ``type`` member can be:

- :cpp:enumerator:`LV_INDEV_TYPE_POINTER`: touchpad or mouse
- :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD`: keyboard or keypad
- :cpp:enumerator:`LV_INDEV_TYPE_ENCODER`: encoder with left/right turn and push options
- :cpp:enumerator:`LV_INDEV_TYPE_BUTTON`: external buttons virtually pressing the screen

``read_cb`` is a function pointer which will be called periodically to
report the current state of an input device.

Visit :ref:`Input devices <indev>` to learn more about input
devices in general.

.. raw:: html

   </details>
   <br>


要创建输入设备，请使用

.. code:: c

   /*Register at least one display before you register any input devices*/
   lv_indev_t * indev = lv_indev_create();
   lv_indev_set_type(indev, LV_INDEV_TYPE_...);   /*See below.*/
   lv_indev_set_read_cb(indev, read_cb);  /*See below.*/

``type`` 成员可以是：

- :cpp:enumerator:`LV_INDEV_TYPE_POINTER`: 触摸板或鼠标
- :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD`: 键盘或小键盘
- :cpp:enumerator:`LV_INDEV_TYPE_ENCODER`: 编码器，带有左/右转和推动选项
- :cpp:enumerator:`LV_INDEV_TYPE_BUTTON`: 外部按钮虚拟按下屏幕

``read_cb`` 是一个函数指针，它将被定期调用以报告输入设备的当前状态。

访问 :ref:`输入设备 <indev>` 以了解有关输入设备的更多信息。


Touchpad, mouse or any pointer（触摸板、鼠标或任何指针）
------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Input devices that can click points on the screen belong to this
category.

.. code:: c

   lv_indev_set_type(indev, LV_INDEV_TYPE_POINTER);
   ...

   void my_input_read(lv_indev_t * indev, lv_indev_data_t*data)
   {
     if(touchpad_pressed) {
       data->point.x = touchpad_x;
       data->point.y = touchpad_y;
       data->state = LV_INDEV_STATE_PRESSED;
     } else {
       data->state = LV_INDEV_STATE_RELEASED;
     }
   }

.. raw:: html

   </details>
   <br>


可以点击屏幕上的点的输入设备属于这一类。

.. code:: c

   lv_indev_set_type(indev, LV_INDEV_TYPE_POINTER);
   ...

   void my_input_read(lv_indev_t * indev, lv_indev_data_t*data)
   {
     if(touchpad_pressed) {
       data->point.x = touchpad_x;
       data->point.y = touchpad_y;
       data->state = LV_INDEV_STATE_PRESSED;
     } else {
       data->state = LV_INDEV_STATE_RELEASED;
     }
   }

Mouse cursor（鼠标光标）
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set a mouse cursor use :cpp:expr:`lv_indev_set_cursor(indev, &img_cursor)`.

.. raw:: html

   </details>
   <br>


要设置鼠标光标，请使用 :cpp:expr:`lv_indev_set_cursor(indev, &img_cursor)`。

Crown behavior（皇冠行为）
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The "Crown" is a rotary device typically found on smart watches.

When the user clicks somewhere and after that turns the rotary
the last clicked widget will be either scrolled or it's value will be incremented/decremented
(e.g. in case of a slider).

As this behavior is tightly related to the last clicked widget, the crown support is
an extension of the pointer input device.  Just set ``data->diff`` to the number of
turned steps and LVGL will automatically send :cpp:enum:`LV_EVENT_ROTARY` or scroll the widget based on the
``editable`` flag in the widget's class. Non-editable widgets are scrolled and for editable widgets the event is sent.

To get the steps in an event callback use :cpp:func:`int32_t diff = lv_event_get_rotary_diff(e)`

The rotary sensitivity can be adjusted on 2 levels:

1. In the input device by the `indev->rotary_sensitivity` element (1/256 unit)
2. By the `rotary_sensitivity` style property in the widget (1/256 unit)

The final diff is calculated like this:

``diff_final = diff_in * (indev_sensitivity / 256) +  (widget_sensitivity / 256);``
For example, if both the indev and widget sensitivity is set to 128 (0.5), the input diff. will be
multiplied by 0.25 (divided by 4). The value of the widget will be incremented by this value or
the widget will be scrolled this amount of pixels.

.. raw:: html

   </details>
   <br>


“表冠”是智能手表上常见的旋转装置。

当用户单击某处并转动旋转器后，最后单击的小部件将滚动或者其值将递增/递减（例如，在滑块的情况下）。

由于此行为与最后单击的小部件紧密相关，因此表冠支撑是指针输入设备的扩展。只需设置 ``data->diff`` 转动的步数，LVGL 将 :cpp:enum:`LV_EVENT_ROTARY` 根据 ``editable`` 小部件类中的标志自动发送或滚动小部件。不可编辑的小部件会滚动，而对于可编辑的小部件，则会发送事件。

要获取事件回调中的步骤，请使用 :cpp:func:`int32_t diff = lv_event_get_rotary_diff(e)`

旋转灵敏度可以在 2 个级别上进行调整：

1. 在输入设备中由 `indev->rotary_sensitvity` 元素（1/256 单位）组成

2. 通过小部件中的 `rotary_sensitivity` 样式属性（1/256单位）

最终的差异计算如下：

``diff_final = diff_in * (indev_sensitivity / 256) +  (widget_sensitivity / 256); ``

例如，如果 indev 和 widget 灵敏度均设置为 128 (0.5)，则输入 diff。将乘以 0.25（除以 4）。小部件的值将按此值递增，或者小部件将滚动此像素量。


Keypad or keyboard（小键盘或键盘）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Full keyboards with all the letters or simple keypads with a few
navigation buttons belong here.

To use a keyboard/keypad:

- Register a ``read_cb`` function and use :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD` type.
- An object group has to be created: ``lv_group_t * g = lv_group_create()`` and objects have to be added to
  it with :cpp:expr:`lv_group_add_obj(g, obj)`
- The created group has to be assigned to an input device: :cpp:expr:`lv_indev_set_group(indev, g)`
- Use ``LV_KEY_...`` to navigate among the objects in the group. See
  ``lv_core/lv_group.h`` for the available keys.

.. raw:: html

   </details>
   <br>


带有所有字母的全键盘或带有几个导航按钮的简单键盘都属于这里。

要使用键盘/小键盘：

- 注册一个带有 :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD` 类型的 ``read_cb`` 函数。
- 必须创建一个对象组： ``lv_group_t * g = lv_group_create()`` 并且对象必须使用 :cpp:expr:`lv_group_add_obj(g, obj)` 添加到其中
- 创建的组必须分配给输入设备： :cpp:expr:`lv_indev_set_group(indev, g)`
- 使用 ``LV_KEY_...`` 在组中的对象之间导航。有关可用密钥，请参阅 ``lv_core/lv_group.h`` 。


.. code:: c


   lv_indev_set_type(indev, LV_INDEV_TYPE_KEYPAD);

   ...

   void keyboard_read(lv_indev_t * indev, lv_indev_data_t*data){
     data->key = last_key();            /*Get the last pressed or released key*/

     if(key_pressed()) data->state = LV_INDEV_STATE_PRESSED;
     else data->state = LV_INDEV_STATE_RELEASED;
   }

Encoder（编码器）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

With an encoder you can do the following:

1. Press its button
2. Long-press its button
3. Turn left
4. Turn right

In short, the Encoder input devices work like this:

- By turning the encoder you can focus on the next/previous object.
- When you press the encoder on a simple object (like a button), it will be clicked.
- If you press the encoder on a complex object (like a list, message box, etc.)
  the object will go to edit mode whereby you can navigate inside the
  object by turning the encoder.
- To leave edit mode, long press the button.

To use an *Encoder* (similarly to the *Keypads*) the objects should be
added to groups.

.. raw:: html

   </details>
   <br>


使用编码器，您可以执行以下操作：

1. 按下它的按钮
2. 长按它的按钮
3. 左转
4. 右转

简而言之，编码器输入设备的工作方式如下：

- 通过转动编码器，您可以专注于下一个/上一个对象。
- 当您在一个简单的对象（如按钮）上按下编码器时，它将被点击。
- 如果您按下复杂对象（如列表、消息框等）上的编码器，该对象将进入编辑模式，从而转动编码器您可以在对象内部导航。
- 要退出编辑模式，请长按按钮。

要使用 *Encoder* （类似于 *Keypads* ），应将对象添加到组中。


.. code:: c

   lv_indev_set_type(indev, LV_INDEV_TYPE_ENCODER);

   ...

   void encoder_read(lv_indev_t * indev, lv_indev_data_t*data){
     data->enc_diff = enc_get_new_moves();

     if(enc_pressed()) data->state = LV_INDEV_STATE_PRESSED;
     else data->state = LV_INDEV_STATE_RELEASED;
   }


Using buttons with Encoder logic（使用带有编码器逻辑的按钮）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

In addition to standard encoder behavior, you can also utilize its logic
to navigate(focus) and edit widgets using buttons. This is especially
handy if you have only few buttons available, or you want to use other
buttons in addition to encoder wheel.

You need to have 3 buttons available:

- :cpp:enumerator:`LV_KEY_ENTER`: will simulate press or pushing of the encoder button
- :cpp:enumerator:`LV_KEY_LEFT`: will simulate turning encoder left
- :cpp:enumerator:`LV_KEY_RIGHT`: will simulate turning encoder right
- other keys will be passed to the focused widget

If you hold the keys it will simulate an encoder advance with period
specified in ``indev_drv.long_press_repeat_time``.

.. raw:: html

   </details>
   <br>


除了标准编码器行为之外，您还可以利用其逻辑来使用按钮导航（聚焦）和编辑小部件。 如果您只有几个按钮可用，或者您想使用除编码轮之外的其他按钮，这将特别方便。

您需要有 3 个按钮可用：

- :cpp:enumerator:`LV_KEY_ENTER`: 将模拟按下或按下编码器按钮
- :cpp:enumerator:`LV_KEY_LEFT`: 将模拟向左转动编码器
- :cpp:enumerator:`LV_KEY_RIGHT`: 将模拟向右旋转编码器
- 其他键将传递给聚焦的小部件

如果您按住这些键，它将模拟编码器随周期前进，并在 ``indev_drv.long_press_repeat_time`` 中指定。


.. code:: c


   lv_indev_set_type(indev, LV_INDEV_TYPE_ENCODER);

   ...

   void encoder_with_keys_read(lv_indev_t * indev, lv_indev_data_t*data){
     data->key = last_key();            /*Get the last pressed or released key*/
                                        /* use LV_KEY_ENTER for encoder press */
     if(key_pressed()) data->state = LV_INDEV_STATE_PRESSED;
     else {
         data->state = LV_INDEV_STATE_RELEASED;
         /* Optionally you can also use enc_diff, if you have encoder*/
         data->enc_diff = enc_get_new_moves();
     }
   }

Button（按钮）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

*Buttons* mean external "hardware" buttons next to the screen which are
assigned to specific coordinates of the screen. If a button is pressed
it will simulate the pressing on the assigned coordinate. (Similarly to a touchpad)

To assign buttons to coordinates use ``lv_indev_set_button_points(my_indev, points_array)``. ``points_array``
should look like ``const lv_point_t points_array[] = { {12,30},{60,90}, ...}``

:important: The points_array can't go out of scope. Either declare it as a global variable
            or as a static variable inside a function.`

.. code:: c


   lv_indev_set_type(indev, LV_INDEV_TYPE_BUTTON);

   ...

   void button_read(lv_indev_t * indev, lv_indev_data_t*data){
       static uint32_t last_btn = 0;   /*Store the last pressed button*/
       int btn_pr = my_btn_read();     /*Get the ID (0,1,2...) of the pressed button*/
       if(btn_pr >= 0) {               /*Is there a button press? (E.g. -1 indicated no button was pressed)*/
          last_btn = btn_pr;           /*Save the ID of the pressed button*/
          data->state = LV_INDEV_STATE_PRESSED;  /*Set the pressed state*/
       } else {
          data->state = LV_INDEV_STATE_RELEASED; /*Set the released state*/
       }

       data->btn_id = last_btn;         /*Save the last button*/
   }

When the ``button_read`` callback in the example above changes the ``data->btn_id`` to ``0``
a press/release action at the first index of the ``points_array`` will be performed (``{12,30}``).

.. raw:: html

   </details>
   <br>


*按钮* 表示屏幕旁边的外部“硬件”按钮，这些按钮分配给屏幕的特定坐标。 如果按下按钮，它将模拟按下指定坐标。 （类似于触摸板）

要将按钮分配给坐标，请使用 ``lv_indev_set_button_points(my_indev, points_array)``。 ``points_array`` 应该看起来像 ``const lv_point_t points_array[] = { {12,30},{60,90}, ...}``

:重要: points_array 不能超出作用域。可以将其声明为全局变量，或者在函数内部声明为静态变量。

.. code:: c


   lv_indev_set_type(indev, LV_INDEV_TYPE_BUTTON);

   ...

   void button_read(lv_indev_t * indev, lv_indev_data_t*data){
       static uint32_t last_btn = 0;   /*Store the last pressed button*/
       int btn_pr = my_btn_read();     /*Get the ID (0,1,2...) of the pressed button*/
       if(btn_pr >= 0) {               /*Is there a button press? (E.g. -1 indicated no button was pressed)*/
          last_btn = btn_pr;           /*Save the ID of the pressed button*/
          data->state = LV_INDEV_STATE_PRESSED;  /*Set the pressed state*/
       } else {
          data->state = LV_INDEV_STATE_RELEASED; /*Set the released state*/
       }

       data->btn_id = last_btn;         /*Save the last button*/
   }

当上例中的 ``button_read`` 回调将 ``data->btn_id`` 更改为 ``0``

将在 ``points_array`` 的第一索引处执行新闻发布动作(``{12,30}``)。


.. _porting_indev_other_features:

Other features（其它功能）
*************************

Parameters（参数）
-----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The default value of the following parameters can be changed in :cpp:type:`lv_indev_t`:

- ``scroll_limit`` Number of pixels to slide before actually scrolling the object.
- ``scroll_throw`` Scroll throw (momentum) slow-down in [%]. Greater value means faster slow-down.
- ``long_press_time`` Press time to send :cpp:enumerator:`LV_EVENT_LONG_PRESSED` (in milliseconds)
- ``long_press_repeat_time`` Interval of sending :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT` (in milliseconds)
- ``read_timer`` pointer to the ``lv_timer`` which reads the input device. Its parameters
  can be changed by ``lv_timer_...()`` functions. :c:macro:`LV_DEF_REFR_PERIOD`
  in ``lv_conf.h`` sets the default read period.

.. raw:: html

   </details>
   <br>


以下参数的默认值可以在 :cpp:type:`lv_indev_t` 中更改：

- ``scroll_limit`` 在实际滚动对象之前要滑动的像素数量。
- ``scroll_throw`` 滚动抛（动量）的减速百分比 [%]。值越大表示减数越快。
- ``long_press_time`` 发送 :cpp:enumerator:`LV_EVENT_LONG_PRESSED` 事件的按下时间（以毫秒为单位）
- ``long_press_repeat_time`` 发送 :cpp:enumerator:`LV_EVENT_LONG_PRESSED_REPEAT` 的时间间隔（以毫秒为单位）
- ``read_timer`` 指向读取输入设备的 ``lv_timer`` 的指针。它的参数可以通过 ``lv_timer_...()`` 函数改变。  ``lv_conf.h`` 中的 :c:macro:`LV_DEF_REFR_PERIOD` 设置了默认读取周期。


Feedback（回调处理）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Besides ``read_cb`` a ``feedback_cb`` callback can be also specified in
:cpp:type:`lv_indev_t`. ``feedback_cb`` is called when any type of event is sent
by the input devices (independently of its type). This allows generating
feedback for the user, e.g. to play a sound on :cpp:enumerator:`LV_EVENT_CLICKED`.

.. raw:: html

   </details>
   <br>


除了 ``read_cb`` 一个 ``feedback_cb`` 回调也可以在 :cpp:type:`lv_indev_t` 中指定。 ``feedback_cb`` 在输入设备发送任何类型的事件时被调用（与其类型无关）。这允许为用户生成反馈，例如在 :cpp:enumerator:`LV_EVENT_CLICKED` 上播放声音。


Associating with a display（与显示器关联）
-----------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Every input device is associated with a display. By default, a new input
device is added to the last display created or explicitly selected
(using :cpp:func:`lv_display_set_default`). The associated display is stored and
can be changed in ``disp`` field of the driver.

.. raw:: html

   </details>
   <br>


每个输入设备都与一个显示器相关联。默认情况下，一个新的输入设备被添加到最后创建的或明确选择的（使用 lv_disp_set_default()）显示。 相关的显示被存储并可在驱动程序的“disp”字段中更改。


Buffered reading（缓冲读取）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

By default, LVGL calls ``read_cb`` periodically. Because of this
intermittent polling there is a chance that some user gestures are
missed.

To solve this you can write an event driven driver for your input device
that buffers measured data. In ``read_cb`` you can report the buffered
data instead of directly reading the input device. Setting the
``data->continue_reading`` flag will tell LVGL there is more data to
read and it should call ``read_cb`` again.

.. raw:: html

   </details>
   <br>


默认情况下，LVGL 会定期调用 ``read_cb`` 。正因如此，这个间歇性轮询可能会错过某些用户手势。

为了解决这个问题，你可以为你的输入设备编写一个事件驱动的驱动程序来缓冲测量数据。在 ``read_cb`` 中，您可以设置缓冲数据而不是读取输入设备。 可以设置 ``data->continue_reading`` 标志来告诉 LVGL 有更多的数据要读取，它应该再次调用 ``read_cb`` 。


Switching the input device to event-driven mode（将输入设备切换到事件驱动模式）
----------------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Normally the input event is read every :c:macro:`LV_DEF_REFR_PERIOD`
milliseconds (set in ``lv_conf.h``).  However, in some cases, you might
need more control over when to read the input device. For example, you
might need to read it by polling file descriptor (fd).

You can do this in the following way:

.. code:: c

   /*Update the input device's running mode to LV_INDEV_MODE_EVENT*/
   lv_indev_set_mode(indev, LV_INDEV_MODE_EVENT);

   ...

   /*Call this anywhere you want to read the input device*/
   lv_indev_read(indev);

.. note:: that :cpp:func:`lv_indev_read`, :cpp:func:`lv_timer_handler` and :cpp:func:`_lv_display_refr_timer` cannot run at the same time.

.. note:: For devices in event-driven mode, `data->continue_reading` is ignored.

.. raw:: html

   </details>
   <br>


通常，输入事件每 :c:macro:`LV_DEF_REFR_PERIOD` 毫秒读取一次（在 ``lv_conf.h`` 中设置）。但是，在某些情况下，您可能会需要更好地控制何时读取输入设备。例如，您可能需要通过轮询文件描述符 （FD） 来读取它。

您可以通过以下方式执行此操作：

.. code:: c

   /*Update the input device's running mode to LV_INDEV_MODE_EVENT*/
   lv_indev_set_mode(indev, LV_INDEV_MODE_EVENT);

   ...

   /*Call this anywhere you want to read the input device*/
   lv_indev_read(indev);


.. 注意:: 不能同时运行 :cpp:func:`lv_indev_read`，:cpp:functionc:`lv_timer_handler` 和 :cpp:func:`_lv_display_refr_timer`。

.. 注意:: 对于处于事件驱动模式的设备，将忽略 `data->continue_reading` 。


Further reading（深入学习）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

- `lv_port_indev_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_indev_template.c>`__ for a template for your own driver.
- `INdev features <indev>` to learn more about higher level input device features.

.. raw:: html

   </details>
   <br>


- `lv_port_indev_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_indev_template.c>`__  用于您自己的驱动程序的模板。
- `INdev features <indev>` 以了解有关更高级别输入设备功能的更多信息。


API
***
