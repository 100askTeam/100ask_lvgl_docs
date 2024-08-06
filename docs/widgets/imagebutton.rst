.. _lv_imagebutton:

========================================
Image button （图像按钮）(lv_imagebutton)
========================================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Image button is very similar to the simple 'Button' object. The only
difference is that it displays user-defined images in each state instead
of drawing a rectangle.

You can set a left, right and center image, and the center image will be
repeated to match the width of the object.

.. raw:: html

   </details> 
   <br>


图像按钮与简单的 “Button” 对象非常相似。唯一的区别是，它在每个状态下显示用户定义的图像，而不是绘制矩形。

可以设置左、右和中心图像，中心图像将重复以匹配对象的宽度。


.. _lv_imagebutton_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Refers to the image(s). If background style
   properties are used, a rectangle will be drawn behind the image
   button.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`  指图像。如果使用背景样式属性，将在图像按钮后面绘制一个矩形。

.. _lv_imagebutton_usage:

Usage（用法）
***************

Image sources（图片来源）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


To set the image in a state, use the
:cpp:expr:`lv_imagebutton_set_src(imagebutton, LV_IMAGEBUTTON_STATE_..., src_left, src_center, src_right)`.

The image sources work the same as described in the `Image object </widgets/image>`__
except that "Symbols" are not supported by the Image button. Any of the sources can ``NULL``.

If only ``src_center`` is specified, the width of the widget will be set automatically to the
width of the image. However, if all three sources are set, the width needs to be set by the user
(using e.g. :cpp:expr:`lv_obj_set_width`) and the center image will be tiled to fill the given size.

The possible states are:

- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_DISABLED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_DISABLED`

If you set sources only in :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`, these sources
will be used in other states too. If you set e.g. :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`
they will be used in pressed state instead of the released images.

.. raw:: html

   </details> 
   <br>


要将图像设置为某个状态，请使用 :cpp:expr:`lv_imagebutton_set_src(imagebutton, LV_IMAGEBUTTON_STATE_..., src_left, src_center, src_right)` 。

图像源的工作原理与 `图片对象 </widgets/image>`__ 中所述的相同，但是 "图像" 按钮不支持 "Symbols（符号）" 。任何源都可以为 ``NULL`` 。

如果只指定了 ``src_center`` ，则控件的宽度将自动设置为图像的宽度。但是，如果设置了所有三个源，则宽度需要由用户设置（例如使用 :cpp:expr:`lv_obj_set_width` ），并且中心图像将被平铺以填充给定的大小。

状态可以是：

- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_DISABLED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_DISABLED`

如果只给状态 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED` 设置源，这些源也将在其他状态使用。如果设置了例如 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED` ，它们将在按下状态下使用图像源，而不是在 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED` 中使用。

States（状态）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


Instead of the regular :cpp:func:`lv_obj_add_state` and :cpp:func:`lv_obj_remove_state` functions,
the :cpp:expr:`lv_imagebutton_set_state(imagebutton, LV_IMAGEBUTTON_STATE_...)` function should be
used to manually set a state.

.. raw:: html

   </details> 
   <br>


应使用 :cpp:expr:`lv_imagebutton_set_state(imagebutton, LV_IMAGEBUTTON_STATE_...)` 函数来手动设置状态，而不是常规的 :cpp:func:`lv_obj_add_state` 和 :cpp:func:`lv_obj_remove_state` 函数。


.. _lv_imagebutton_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when the button is toggled.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 切换按钮时发送该事件。

详细了解更多阅读 :ref:`events`。


.. _lv_imagebutton_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  ``LV_KEY_RIGHT/UP`` Go to toggled state if :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`
   is enabled.
-  ``LV_KEY_LEFT/DOWN`` Go to non-toggled state if
   :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` is enabled.
-  :cpp:enumerator:`LV_KEY_ENTER` Clicks the button

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 已启用，则转到切换状态。
-  ``LV_KEY_LEFT/DOWN`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 已启用，则转到非切换状态。
-  :cpp:enumerator:`LV_KEY_ENTER` 点击按钮


.. _lv_imagebutton_example:

Example
********

.. include:: ../examples/widgets/imagebutton/index.rst

.. _lv_imagebutton_api:

API
***
