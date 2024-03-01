.. _lv_led:

============
LED (lv_led)
============

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The LEDs are rectangle-like (or circle) object whose brightness can be
adjusted. With lower brightness the colors of the LED become darker.

.. raw:: html

   </details> 
   <br>


LED是矩形（或圆形）对象。它的亮度可以调节。亮度降低时，LED的颜色会变暗。


.. _lv_led_parts_and_styles:

Parts and Styles（零件和样式）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_LED_PART_MAIN` uses all the typical background style properties.

.. raw:: html

   </details> 
   <br>

-  :cpp:enumerator:`LV_LED_PART_MAIN` 它使用所有典型的背景样式属性。


.. _lv_led_usage:

Usage（用法）
************

Color（颜色）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set the color of the LED with
:cpp:expr:`lv_led_set_color(led, lv_color_hex(0xff0080))`. This will be used as
background color, border color, and shadow color.

.. raw:: html

   </details> 
   <br>


您可以使用 :cpp:expr:`lv_led_set_color(led, lv_color_hex(0xff0080))` 设置 LED 的颜色。这将用作背景颜色、边框颜色和阴影颜色。


Brightness（亮度）
------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can set their brightness with :cpp:expr:`lv_led_set_bright(led, bright)`.
The brightness should be between 0 (darkest) and 255 (lightest).

.. raw:: html

   </details> 
   <br>


可以使用 :cpp:expr:`lv_led_set_bright(led, bright)` 设置它们的亮度。亮度应介于0（最暗）和255（最亮）之间。


Toggle（切换）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use :cpp:expr:`lv_led_on(led)` and :cpp:expr:`lv_led_off(led)` to set the brightness to
a predefined ON or OFF value. The :cpp:expr:`lv_led_toggle(led)` toggles between
the ON and OFF state.

.. raw:: html

   </details> 
   <br>

使用 :cpp:expr:`lv_led_on(led)` 和 :cpp:expr:`lv_led_off(led)` 将亮度设置为预定义的ON或OFF值。 :cpp:expr:`lv_led_toggle(led)` 在ON和OFF状态之间切换。


.. _lv_led_events:

Events（事件）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

See the events of the :ref:`Base object <lv_obj>` too.

Learn more about :ref:`events`.

.. raw:: html

   </details> 
   <br>


另请参阅 :ref:`基础对象 <lv_obj>` 的事件。

了解有关 :ref:`events` 的更多内容。


.. _lv_led_keys:

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


对象类型不处理任何 *按键* 。

了解有关 :ref:`indev_keys` 的更多内容。


.. _lv_led_example:

Example
*******

.. include:: ../examples/widgets/led/index.rst

.. _lv_led_api:

API
***
