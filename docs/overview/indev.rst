.. _indev:

========================
Input devices（输入设备）
========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

An input device usually means:

- Pointer-like input device like touchpad or mouse
- Keypads like a normal keyboard or simple numeric keypad
- Encoders with left/right turn and push options
- External hardware buttons which are assigned to specific points on the screen

:important: Before reading further, please read the `Porting </porting/indev>`__ section of Input devices

.. raw:: html

   </details>
   <br>


输入设备通常指：

- 像触摸板或鼠标这样的类似指针的输入设备
- 像普通键盘或简单数字键盘这样的键盘
- 左/右旋转和推按钮的编码器
- 分配给屏幕特定点的外部硬件按钮

:important: 在继续阅读前，请阅读「输入设备」的 `移植 </porting/indev>`__ 部分


Pointers（光标）
****************

.. _indev_cursor:

Cursor（光标）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Pointer input devices (like a mouse) can have a cursor.

.. code:: c

   ...
   lv_indev_t * mouse_indev = lv_indev_create();
   ...
   LV_IMG_DECLARE(mouse_cursor_icon);                          /*Declare the image source.*/
   lv_obj_t * cursor_obj = lv_image_create(lv_screen_active());      /*Create an image object for the cursor */
   lv_image_set_src(cursor_obj, &mouse_cursor_icon);           /*Set the image source*/
   lv_indev_set_cursor(mouse_indev, cursor_obj);               /*Connect the image  object to the driver*/

Note that the cursor object should have
:cpp:expr:`lv_obj_remove_flag(cursor_obj, LV_OBJ_FLAG_CLICKABLE)`. For images,
*clicking* is disabled by default.

.. raw:: html

   </details>
   <br>


指针输入设备（如鼠标）可以有一个指针。

代码示例：

.. code:: c

  ...
  lv_indev_t *mouse_indev = lv_indev_create();
  ...
  LV_IMG_DECLARE(mouse_cursor_icon);                           /*  声明图片源   */
  lv_obj_t *cursor_obj = lv_image_create(lv_screen_active());    /*  为光标创建一个图片对象  */
  lv_image_set_src(cursor_obj, &mouse_cursor_icon);            /*  设置图片源  */
  lv_indev_set_cursor(mouse_indev, cursor_obj);                /*  将图片对象与驱动程序连接  */

注意，光标对象应该有这样的设置 `lv_obj_remove_flag(cursor_obj, LV_OBJ_FLAG_CLICKABLE)`。对于图片，默认情况下是不能 *点击* 的。


.. _indev_gestures:

Gestures (手势)
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Pointer input devices can detect basic gestures. By default, most of the
widgets send the gestures to its parent, so finally the gestures can be
detected on the screen object in a form of an :cpp:enumerator:`LV_EVENT_GESTURE`
event. For example:

.. code:: c

   void my_event(lv_event_t * e)
   {
     lv_obj_t * screen = lv_event_get_current_target(e);
     lv_dir_t dir = lv_indev_get_gesture_dir(lv_indev_active());
     switch(dir) {
       case LV_DIR_LEFT:
         ...
         break;
       case LV_DIR_RIGHT:
         ...
         break;
       case LV_DIR_TOP:
         ...
         break;
       case LV_DIR_BOTTOM:
         ...
         break;
     }
   }

   ...

   lv_obj_add_event_cb(screen1, my_event, LV_EVENT_GESTURE, NULL);

To prevent passing the gesture event to the parent from an object use
:cpp:expr:`lv_obj_remove_flag(obj, LV_OBJ_FLAG_GESTURE_BUBBLE)`.

Note that, gestures are not triggered if an object is being scrolled.

If you did some action on a gesture you can call
:cpp:expr:`lv_indev_wait_release(lv_indev_active())` in the event handler to
prevent LVGL sending further input device related events.

.. raw:: html

   </details>
   <br>


指针输入设备可以检测基本手势。默认情况下，大多数小部件将手势发送给其父对象，因此最终手势可以以 :cpp:enumerator:`LV_EVENT_GESTURE` 事件的形式在屏幕对象上被检测到。例如：

.. code:: c

   void my_event(lv_event_t * e)
   {
     lv_obj_t * screen = lv_event_get_current_target(e);
     lv_dir_t dir = lv_indev_get_gesture_dir(lv_indev_active());
     switch(dir) {
       case LV_DIR_LEFT:
         ...
         break;
       case LV_DIR_RIGHT:
         ...
         break;
       case LV_DIR_TOP:
         ...
         break;
       case LV_DIR_BOTTOM:
         ...
         break;
     }
   }

   ...

   lv_obj_add_event_cb(screen1, my_event, LV_EVENT_GESTURE, NULL);

要阻止将手势事件从对象传递给其父对象，请使用 :cpp:expr:`lv_obj_remove_flag(obj, LV_OBJ_FLAG_GESTURE_BUBBLE)`。

注意，如果对象正在滚动，手势不会触发。

如果您在手势上执行了某个操作，可以在事件处理程序中调用 :cpp:expr:`lv_indev_wait_release(lv_indev_active())` 来防止 LVGL 发送进一步的与输入设备相关的事件。


.. _indev_keypad_and_encoder:

Keypad and encoder（键盘和编码器）
*********************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can fully control the user interface without a touchpad or mouse by
using a keypad or encoder(s). It works similar to the *TAB* key on the
PC to select an element in an application or a web page.

.. raw:: html

   </details>
   <br>


您可以通过使用键盘或编码器来完全控制用户界面，而无需触摸板或鼠标。它类似于在电脑上使用 *TAB* 键来选择应用程序或网页中的元素。


.. _indev_groups:

Groups（组）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Objects you want to control with a keypad or encoder need to be added to
a *Group*. In every group there is exactly one focused object which
receives the pressed keys or the encoder actions. For example, if a
:ref:`Text area <lv_textarea>` is focused and you press some letter
on a keyboard, the keys will be sent and inserted into the text area.
Similarly, if a :ref:`Slider <lv_slider>` is focused and you press
the left or right arrows, the slider's value will be changed.

You need to associate an input device with a group. An input device can
send key events to only one group but a group can receive data from more
than one input device.

To create a group use :cpp:expr:`lv_group_t * g = lv_group_create()` and to add
an object to the group use :cpp:expr:`lv_group_add_obj(g, obj)`.

To associate a group with an input device use
:cpp:expr:`lv_indev_set_group(indev, g)`.

.. raw:: html

   </details>
   <br>


你想要使用键盘或编码器控制的对象需要添加到一个 *Group* 中。每个组中只有一个焦点对象，它接收按键或编码器动作。例如，如果一个 :ref:`文本区域 <lv_textarea>` 被聚焦，你按键盘上的字母，这些按键会被发送并插入到文本区域中。同样，如果一个 :ref:`滑块 <lv_slider>` 被聚焦，你按下左右箭头键，滑块的数值会改变。

你需要将输入设备与一个组关联起来。一个输入设备只能发送按键事件到一个组，但一个组可以接收来自多个输入设备的数据。

使用 :cpp:expr:`lv_group_t * g = lv_group_create()` 来创建一个组，使用 :cpp:expr:`lv_group_add_obj(g, obj)` 来将一个对象添加到组中。

使用 :cpp:expr:`lv_indev_set_group(indev, g)` 来将一个组与一个输入设备关联起来。


.. _indev_keys:

Keys（按键）
^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are some predefined keys which have special meaning:

- :cpp:enumerator:`LV_KEY_NEXT`: Focus on the next object
- :cpp:enumerator:`LV_KEY_PREV`: Focus on the previous object
- :cpp:enumerator:`LV_KEY_ENTER`: Triggers :cpp:enumerator:`LV_EVENT_PRESSED`, :cpp:enumerator:`LV_EVENT_CLICKED`, or :cpp:enumerator:`LV_EVENT_LONG_PRESSED` etc. events
- :cpp:enumerator:`LV_KEY_UP`: Increase value or move upwards
- :cpp:enumerator:`LV_KEY_DOWN`: Decrease value or move downwards
- :cpp:enumerator:`LV_KEY_RIGHT`: Increase value or move to the right
- :cpp:enumerator:`LV_KEY_LEFT`: Decrease value or move to the left
- :cpp:enumerator:`LV_KEY_ESC`: Close or exit (E.g. close a :ref:`Drop down list <lv_dropdown>`)
- :cpp:enumerator:`LV_KEY_DEL`: Delete (E.g. a character on the right in a :ref:`Text area <lv_textarea>`)
- :cpp:enumerator:`LV_KEY_BACKSPACE`: Delete a character on the left (E.g. in a :ref:`Text area <lv_textarea>`)
- :cpp:enumerator:`LV_KEY_HOME`: Go to the beginning/top (E.g. in a :ref:`Text area <lv_textarea>`)
- :cpp:enumerator:`LV_KEY_END`: Go to the end (E.g. in a :ref:`Text area <lv_textarea>`)

The most important special keys in your :cpp:func:`read_cb` function are:

- :cpp:enumerator:`LV_KEY_NEXT`
- :cpp:enumerator:`LV_KEY_PREV`
- :cpp:enumerator:`LV_KEY_ENTER`
- :cpp:enumerator:`LV_KEY_UP`
- :cpp:enumerator:`LV_KEY_DOWN`
- :cpp:enumerator:`LV_KEY_LEFT`
- :cpp:enumerator:`LV_KEY_RIGHT`

You should translate some of your keys to these special keys to support navigation
in a group and interact with selected objects.

Usually, it's enough to use only :cpp:enumerator:`LV_KEY_LEFT` and :cpp:enumerator:`LV_KEY_RIGHT` because most
objects can be fully controlled with them.

With an encoder you should use only :cpp:enumerator:`LV_KEY_LEFT`, :cpp:enumerator:`LV_KEY_RIGHT`,
and :cpp:enumerator:`LV_KEY_ENTER`.

.. raw:: html

   </details>
   <br>


有一些预定义的键具有特殊含义：

- :cpp:enumerator:`LV_KEY_NEXT`：焦点移至下一个对象
- :cpp:enumerator:`LV_KEY_PREV`：焦点移至上一个对象
- :cpp:enumerator:`LV_KEY_ENTER`：触发 :cpp:enumerator:`LV_EVENT_PRESSED` 、:cpp:enumerator:`LV_EVENT_CLICKED` 或 :cpp:enumerator:`LV_EVENT_LONG_PRESSED` 等事件
- :cpp:enumerator:`LV_KEY_UP`：增加值或向上移动
- :cpp:enumerator:`LV_KEY_DOWN`：减少值或向下移动
- :cpp:enumerator:`LV_KEY_RIGHT`：增加值或向右移动
- :cpp:enumerator:`LV_KEY_LEFT`：减少值或向左移动
- :cpp:enumerator:`LV_KEY_ESC`：关闭或退出（例如，关闭 :ref:`下拉列表 <lv_dropdown>`）
- :cpp:enumerator:`LV_KEY_DEL`：删除（例如，在 :ref:`文本区 <lv_textarea>` 中删除右侧的字符）
- :cpp:enumerator:`LV_KEY_BACKSPACE`：删除左侧的字符（例如，在 :ref:`文本区 <lv_textarea>` 中）
- :cpp:enumerator:`LV_KEY_HOME`：跳至开头/顶部（例如，在 :ref:`文本区 <lv_textarea>` 中）
- :cpp:enumerator:`LV_KEY_END`：跳至末尾（例如，在 :ref:`文本区 <lv_textarea>` 中）

在你的 :cpp:func:`read_cb` 函数中，最重要的特殊键是：

- :cpp:enumerator:`LV_KEY_NEXT`
- :cpp:enumerator:`LV_KEY_PREV`
- :cpp:enumerator:`LV_KEY_ENTER`
- :cpp:enumerator:`LV_KEY_UP`
- :cpp:enumerator:`LV_KEY_DOWN`
- :cpp:enumerator:`LV_KEY_LEFT`
- :cpp:enumerator:`LV_KEY_RIGHT`

你应该将一些键转换为这些特殊键，以支持在组内导航和与选定对象交互。

通常，只使用 :cpp:enumerator:`LV_KEY_LEFT` 和 :cpp:enumerator:`LV_KEY_RIGHT` 就足够了，因为大多数对象可以完全通过它们进行控制。

在使用编码器时，只需使用 :cpp:enumerator:`LV_KEY_LEFT`、:cpp:enumerator:`LV_KEY_RIGHT` 和 :cpp:enumerator:`LV_KEY_ENTER`。


Edit and navigate mode（编辑和导航模式）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Since a keypad has plenty of keys, it's easy to navigate between objects
and edit them using the keypad. But encoders have a limited number of
"keys" and hence it is difficult to navigate using the default options.
*Navigate* and *Edit* modes are used to avoid this problem with
encoders.

In *Navigate* mode, an encoder's :cpp:enumerator:`LV_KEY_LEFT` or :cpp:enumerator:`LV_KEY_RIGHT` is translated to
:cpp:enumerator:`LV_KEY_NEXT` or :cpp:enumerator:`LV_KEY_PREV`. Therefore, the next or previous object will be
selected by turning the encoder. Pressing :cpp:enumerator:`LV_KEY_ENTER` will change
to *Edit* mode.

In *Edit* mode, :cpp:enumerator:`LV_KEY_NEXT` and :cpp:enumerator:`LV_KEY_PREV` is usually used to modify an
object. Depending on the object's type, a short or long press of
:cpp:enumerator:`LV_KEY_ENTER` changes back to *Navigate* mode. Usually, an object
which cannot be pressed (like a :ref:`Slider <lv_slider>`) leaves
*Edit* mode upon a short click. But with objects where a short click has
meaning (e.g. :ref:`Button <lv_button>`), a long press is required.

.. raw:: html

   </details>
   <br>


由于键盘有大量按键，因此可以轻松使用键盘在对象之间导航并对其进行编辑。但是编码器的“按键”数量有限，因此使用默认选项进行导航很困难。
*导航* 和 *编辑* 模式被用来避免这一问题。

在 *导航* 模式下，编码器的 :cpp:enumerator:`LV_KEY_LEFT` 或 :cpp:enumerator:`LV_KEY_RIGHT` 被转换为 :cpp:enumerator:`LV_KEY_NEXT` 或 :cpp:enumerator:`LV_KEY_PREV`。
因此，可以通过旋转编码器选择下一个或上一个对象。按下 :cpp:enumerator:`LV_KEY_ENTER` 将切换到 *编辑* 模式。

在 *编辑* 模式下，通常使用 :cpp:enumerator:`LV_KEY_NEXT` 和 :cpp:enumerator:`LV_KEY_PREV` 来修改对象。
根据对象的类型，短按或长按 :cpp:enumerator:`LV_KEY_ENTER` 可切换回 *导航* 模式。
通常，无法按压的对象（比如 :ref:`滑块<lv_slider>`）在短按时会离开 *编辑* 模式。
但是需要在有短按功能的对象上进行长按，比如 :ref:`按钮<lv_button>`。


Default group（默认组）
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

Interactive widgets - such as buttons, checkboxes, sliders, etc. - can
be automatically added to a default group. Just create a group with
:cpp:expr:`lv_group_t * g = lv_group_create()` and set the default group with
:cpp:expr:`lv_group_set_default(g)`

Don't forget to assign one or more input devices to the default group
with :cpp:expr:`lv_indev_set_group(my_indev, g)`.

.. raw:: html

   </details>
   <br>


交互式小部件，比如按钮、复选框、滑块等，可以自动添加到默认组中。只需创建一个组 :cpp:expr:`lv_group_t * g = lv_group_create()` 并将默认组设为 :g:cpp:expr:`lv_group_set_default(g)`。

不要忘记用 :cpp:expr:`lv_indev_set_group(my_indev, g)` 将一个或多个输入设备分配给默认组。


Styling（风格样式）
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If an object is focused either by clicking it via touchpad or focused
via an encoder or keypad it goes to the :cpp:enumerator:`LV_STATE_FOCUSED` state.
Hence, focused styles will be applied to it.

If an object switches to edit mode it enters the
:cpp:expr:`LV_STATE_FOCUSED | LV_STATE_EDITED` states so these style properties
will be shown.

For a more detailed description read the
`Style <https://docs.lvgl.io/master/overview/style.html>`__ section.

.. raw:: html

   </details>
   <br>


如果通过触控板点击或通过编码器或键盘输入来聚焦一个对象，它会进入 :cpp:enumerator:`LV_STATE_FOCUSED` 状态。因此，聚焦的样式将被应用于该对象。

如果一个对象切换到编辑模式，它会进入:cpp:expr:`LV_STATE_FOCUSED | LV_STATE_EDITED` 状态，因此这些样式属性将会显示出来。

要获取更详细的描述，请阅读 `Style（样式）<https://docs.lvgl.io/master/overview/style.html>`__ 部分。


.. _indev_api:

API
***
