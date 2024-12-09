.. _lv_animimg:

=========================================
Animation Image （动画图像） (lv_animimg)
=========================================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The animation image is similar to the normal 'Image' Widget. The only
difference is that instead of one source image, you set an array of
multiple source images that supply "frames" in an animation.

You can specify a duration and repeat count.

.. raw:: html

   </details> 
   <br>


动画图像与普通的 “图像” 部件类似。唯一的区别在于，你设置的不是一张源图像，而是一组多张源图像，这些源图像为动画提供了 “帧”。

可以指定持续时间和重复次数。


.. _lv_animimg_parts_and_styles:

Parts and Styles（部分和样式）
*******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_PART_MAIN` A background rectangle that uses the typical
   background style properties and the image itself using the image
   style properties.

.. raw:: html

   </details> 
   <br>


:cpp:enumerator:`LV_PART_MAIN` 一个背景矩形，它使用典型的背景样式属性，而图像本身使用图像样式属性。

.. _lv_animimg_usage:

Usage（用法）
**************

Image sources（图片来源）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set the image animation images sources, use
:cpp:expr:`lv_animimg_set_src(imagebutton, dsc[], num)`.

.. raw:: html

   </details> 
   <br>
Using the inner animation
-------------------------

For more advanced use cases, the animation used internally by the image can be
retrieved using :cpp:expr:`lv_animimg_get_anim(animimg)`.  Using this, you can
use the :ref:`Animation <animation>` functions, for example, to
override the animation values using the
:cpp:expr:`lv_anim_set_values(anim, start, end)` or to set a callback
on the animation completed event.

使用接口 :cpp:expr:`lv_animimg_set_src(imagebutton, dsc[], num)` 为动画图像设置图像源，参数 ``dsc`` 是包含一个或多个图像源的数组，参数num是图像源的个数。

.. _lv_animimg_events:

Events（事件）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Animation-Image Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


动画图像部件不会发送任何特殊事件。

了解更多关于所有部件发出的 :ref:lv_obj_events（对象事件）的相关内容。

详细了解阅读 :ref:`events`。


.. _lv_animimg_keys:

Keys（按键）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Animation-Image Widgets.

.. admonition::  Further Reading

    Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>

动画图像部件不会处理任何 “键”。

阅读了解有关 :ref:`indev_keys` 的更多信息。
  
.. _lv_animimg_example:

Example
*********

.. include:: ../examples/widgets/animimg/index.rst

.. _lv_animimg_api:

API
***
