.. _lv_spinner:

==============================
Spinner（环形加载器） (lv_spinner)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Spinner object is a spinning arc over a ring.

.. raw:: html

   </details> 
   <br>


Spinner（环形加载器）对象是在环上旋转的圆弧。


.. _lv_spinner_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The parts are identical to the parts of :ref:`lv_arc`.

.. raw:: html

   </details> 
   <br>


这些部分与 :ref:`lv_arc` 的部分相同。


.. _lv_spinner_usage:

Usage（用法）
*************

Create a spinner（创建环形加载器）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To create a spinner use
:cpp:expr:`lv_spinner_create(parent)`.

Using :cpp:expr:`lv_spinner_set_anim_params(spinner, spin_duration, angle)` the duration
of one revolution and the length of he arc can be customized.

.. raw:: html

   </details> 
   <br>


若要创建环形加载器，请使用 :cpp:expr:`lv_spinner_create(parent)`。

使用 :cpp:expr:`lv_spinner_set_anim_params(spinner, spin_duration, angle)` 设置环形加载器的动画时间和弧长角度。


.. _lv_spinner_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent to the Spinner.

See the events of the `Arc </widgets/arc>`__ too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


LVGL库本身不会向环形加载器发送任何特殊事件。

另请参阅 `圆弧 </widgets/arc>`__ 的事件。

详细了解更多 :ref:`events`。


.. _lv_spinner_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by the object type.

Learn more about :ref:`indev_keys`.

.. raw:: html

   </details> 
   <br>


本控件不处理任何 *按键* 。

了解有关 :ref:`indev_keys` 的更多信息。


.. _lv_spinner_example:

Example
*******

.. include:: ../examples/widgets/spinner/index.rst

.. _lv_spinner_api:

API
***
