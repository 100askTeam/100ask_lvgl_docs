.. _lv_spinner:

==============================
Spinner（环形加载器） (lv_spinner)
==============================

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Spinner Widget is a spinning arc over a ring, typically used to show some type of
activity is in progress.

.. raw:: html

   </details> 
   <br>


微调器部件（Spinner Widget）是位于圆环上方的一个旋转弧线，通常用于指示某项活动正在进行中。


.. _lv_spinner_parts_and_styles:

Parts and Styles（部分和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Spinner's parts are identical to those of :ref:`Arc <lv_arc_parts_and_styles>`.


.. raw:: html

   </details> 
   <br>


微调器（Spinner）的部件与:ref:`Arc <lv_arc_parts_and_styles>`的部件相同。



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

Use :cpp:expr:`lv_spinner_set_anim_params(spinner, spin_duration, angle)` to
customize the duration of one revolution and the length of the arc.

.. raw:: html

   </details> 
   <br>


若要创建环形加载器，请使用 :cpp:expr:`lv_spinner_create(parent)`。

使用 :cpp:expr:`lv_spinner_set_anim_params(spinner, spin_duration, angle)`来自定义旋转一周的时长以及弧线的长度。

.. _lv_spinner_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

No special events are sent by Spinner Widgets.

.. admonition::  Further Reading

    :ref:`Arc Events <lv_arc_events>`

    Learn more about :ref:`lv_obj_events` emitted by all Widgets.

    Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


微调器部件（Spinner Widgets）不会发送特殊事件。

    :ref:`Arc Events <lv_arc_events>`
    
    进一步了解所有部件发出的 :ref:`lv_obj_events`（对象事件）。
    
    深入学习有关 :ref:`events`的更多内容。


.. _lv_spinner_keys:

Keys（按键）
***********

.. raw:: html

   <details>
     <summary>显示原文</summary>

No *Keys* are processed by Spinner Widgets.

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
