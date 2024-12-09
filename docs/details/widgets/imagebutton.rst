.. _lv_imagebutton:

========================================
Image button （图像按钮）(lv_imagebutton)
========================================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Image Button is very similar to the simple 'Button' Widget. The only
difference is that it displays user-defined images for each state instead
of drawing a rectangle.  The list of states is covered below.

You can set a left, right and center image, and the center image will be
repeated to match the width of the Widget.

.. raw:: html

   </details> 
   <br>


图像按钮与简单的 “按钮” 部件非常相似。唯一的区别在于，它会针对每个状态显示用户定义的图像，而不是绘制一个矩形。以下涵盖了各状态的相关内容。

可以设置左、右和中心图像，中心图像将重复以匹配部件的宽度。


.. _lv_imagebutton_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Refers to the image(s). If background style
   properties are used, a rectangle will be drawn behind the image
   Button.

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

The image sources work the same as described in the :ref:`Image Widget <lv_image>`
except that "Symbols" are not supported by the Image button. Any of the sources can ``NULL``.
Typically the middle image should be one of the set image sources.

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

The image sources set for state :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED` are
used for any state that has not had image sources set for it.  If an image sources
have been set for other states, e.g. :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`,
they will be used instead when the Image Button is in that state.

.. raw:: html

   </details> 
   <br>


要将图像设置为某个状态，请使用 :cpp:expr:`lv_imagebutton_set_src(imagebutton, LV_IMAGEBUTTON_STATE_..., src_left, src_center, src_right)` 。

图像源的工作方式与 :ref:`Image Widget <lv_image>`中所描述的相同，不过图像按钮不支持 “符号”。任何图像源都可以设置为 ``NULL``。通常来说，中间图像应该是已设置的图像源之一。

如果只指定了 ``src_center`` ，则控件的宽度将自动设置为图像的宽度。但是，如果设置了所有三个源，则宽度需要由用户设置（例如使用 :cpp:expr:`lv_obj_set_width` ），并且中心图像将被平铺以填充给定的大小。

状态可以是：

- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_DISABLED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_DISABLED`

为 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`状态设置的图像源，可用于任何尚未为其设置图像源的其他状态。如果已经为其他状态（例如 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`）设置了图像源，那么当图像按钮处于相应状态时，就会改用为该状态所设置的图像源。

Setting State Programmatically（以编程方式设置状态）
----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


Instead of the regular :cpp:func:`lv_obj_add_state` and :cpp:func:`lv_obj_remove_state` functions,
use :cpp:expr:`lv_imagebutton_set_state(imagebutton, LV_IMAGEBUTTON_STATE_...)` to
set the state of Image Buttons.

.. raw:: html

   </details> 
   <br>


不要使用常规的 :cpp:func:`lv_obj_add_state` 和 :cpp:func:`lv_obj_remove_state` 函数，而是使用 :cpp:expr:`lv_imagebutton_set_state(imagebutton, LV_IMAGEBUTTON_STATE_...)`来设置图像按钮的状态。

.. _lv_imagebutton_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when Image Button's CHECKED state is toggled.
   This requires the Image Button's :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` flag to be set.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED`：当图像按钮的 “已选中（CHECKED）” 状态被切换时会发送该事件。这需要将图像按钮的 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`标志设置好才行。
详细了解更多阅读 :ref:`events`。

了解更多关于所有部件都会发出的 :ref:`lv_obj_events` 的相关内容。

了解更多关于 :ref:`events` 的相关内容。

.. _lv_imagebutton_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>


-  ``LV_KEY_RIGHT/UP`` Go to CHECKED state if :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`
   is enabled.
-  ``LV_KEY_LEFT/DOWN`` Go to un-CHECKED state if
   :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` is enabled.
-  :cpp:enumerator:`LV_KEY_ENTER` Clicks the Image Button

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


-  ``LV_KEY_RIGHT/UP`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 已启用，则切换至 “已选中（CHECKED）” 状态。
-  ``LV_KEY_LEFT/DOWN`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 已启用，则切换至 “未选中（un-CHECKED）” 状态。
-  :cpp:enumerator:`LV_KEY_ENTER` 点击图像按钮


.. _lv_imagebutton_example:

Example
********

.. include:: ../examples/widgets/imagebutton/index.rst

.. _lv_imagebutton_api:

API
***
