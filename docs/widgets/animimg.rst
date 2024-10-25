.. _lv_animimg:

=========================================
Animation Image （动画图像） (lv_animimg)
=========================================

Overview（概述）
******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The animation image is similar to the normal 'Image' object. The only
difference is that instead of one source image, you set an array of
multiple source images.

You can specify a duration and repeat count.

.. raw:: html

   </details> 
   <br>


动画图像对象类似于普通的 “图像” 对象。唯一区别是，设置的不是一个图像源，而是设置由多个源图像组成的数组。

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

To set the image in a state, use the
:cpp:expr:`lv_animimg_set_src(imagebutton, dsc[], num)`.

.. raw:: html

   </details> 
   <br>


使用接口 :cpp:expr:`lv_animimg_set_src(imagebutton, dsc[], num)` 为动画图像设置图像源，参数 ``dsc`` 是包含一个或多个图像源的数组，参数num是图像源的个数。

.. _lv_animimg_events:

Events（事件）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by image objects.

See the events of the Base object too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


图像对象不会发送任何特殊事件。

另请参阅基础对象的事件。

详细了解阅读 :ref:`events`。


.. _lv_animimg_keys:

Keys（按键）
*************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No Keys are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>

对象类型不处理任何键。

阅读了解有关 :ref:`indev_keys` 的更多信息。
  
.. _lv_animimg_example:

Example
*********

.. include:: ../examples/widgets/animimg/index.rst

.. _lv_animimg_api:

API
***
