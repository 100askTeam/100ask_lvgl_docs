.. _lv_imagebutton:

========================================
Image button （图像按钮）(lv_imagebutton)
========================================

Overview（概述）
****************

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


图像按钮与简单的“Button”对象非常相似。唯一的 不同之处在于，它以每种状态显示用户定义的图像 绘制矩形。

您可以设置左、右和中心图像，中心图像将是 重复以匹配对象的宽度。


.. _lv_imagebutton_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` Refers to the image(s). If background style
   properties are used, a rectangle will be drawn behind the image
   button.

.. raw:: html

   </details> 
   <br>


-  :cpp:enumerator:`LV_PART_MAIN`  指图像。如果背景样式属性，将在图像后面绘制一个矩形按钮。

.. _lv_imagebutton_usage:

Usage（用法）
*************

Image sources（图片来源）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


To set the image in a state, use the
:cpp:expr:`lv_imagebutton_set_src(imagebutton, LV_IMAGEBUTTON_STATE_..., src_left, src_center, src_right)`.

The image sources work the same as described in the `Image object </widgets/image>`__
except that "Symbols" are not supported by the Image button. Any of the sources can ``NULL``.

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


若要将图像设置为状态，请使用:cpp:expr:`lv_imagebutton_set_src(imagebutton, LV_IMAGEBUTTON_STATE_..., src_left, src_center, src_right)`。

图像源的工作方式与 `图片对象 </widgets/image>`__中所述的工作方式相同，只是“图像”按钮不支持“符号”。任何来源都可以为 ``NULL``。

可能的状态包括：

- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_DISABLED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_RELEASED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_PRESSED`
- :cpp:enumerator:`LV_IMAGEBUTTON_STATE_CHECKED_DISABLED`

如果仅在 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_RELEASED` 中设置源，则这些源也将在其他状态使用。如果设置例如 :cpp:enumerator:`LV_IMAGEBUTTON_STATE_PRESSED`它们将在按下状态下使用，而不是在发布的图像中使用。


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


代替常规的 :cpp:func:`lv_obj_add_state` 和 :cpp:func:`lv_obj_remove_state` 函数，应使用 :cpp:expr:`lv_imagebutton_set_state(imagebutton, LV_IMAGEBUTTON_STATE_...)` 函数手动设置状态。


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


-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 切换按钮时发送。

详细了解更多 :ref:`事件`。


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


-  ``LV_KEY_RIGHT/UP`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE`已启用，则转到切换状态。
-  ``LV_KEY_LEFT/DOWN`` 如果 :cpp:enumerator:`LV_OBJ_FLAG_CHECKABLE` 已启用，则转到非切换状态。
-  :cpp:enumerator:`LV_KEY_ENTER` 点击按钮


.. _lv_imagebutton_example:

Example
*******

.. include:: ../examples/widgets/imagebutton/index.rst

.. _lv_imagebutton_api:

API
***
