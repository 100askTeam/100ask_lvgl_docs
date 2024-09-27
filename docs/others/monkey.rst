.. _monkey:

=======
Monkey
=======

.. raw:: html

   <details>
     <summary>显示原文</summary>

A simple monkey test. Use random input to stress test the application.

.. raw:: html

   </details>
   <br>


一个简单的 monkey 测试。使用随机输入来对应用程序进行压力测试。


.. _monkey_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_MONKEY` in ``lv_conf.h``.

First configure monkey, use :c:struct:`lv_monkey_config_t` to define the
configuration structure, set the ``type`` (check `input devices </overview/indev>`__ for the supported types), and then set the
range of ``period_range`` and ``input_range``, the monkey will output
random operations at random times within this range. Call
:cpp:func:`lv_monkey_create` to create monkey. Finally call
:cpp:expr:`lv_monkey_set_enable(monkey, true)` to enable monkey.

If you want to pause the monkey, call
:cpp:expr:`lv_monkey_set_enable(monkey, false)`. To delete the monkey, call
:cpp:expr:`lv_monkey_delete(monkey)`.

Note that ``input_range`` has different meanings in different ``type``:

- :cpp:enumerator:`LV_INDEV_TYPE_POINTER`: No effect, click randomly within the pixels of the screen resolution.
- :cpp:enumerator:`LV_INDEV_TYPE_ENCODER`: The minimum and maximum values of ``enc_diff``.
- :cpp:enumerator:`LV_INDEV_TYPE_BUTTON`: The minimum and maximum values of ``btn_id``.
  Use :cpp:func:`lv_monkey_get_indev` to get the input device, and use
  :cpp:func:`lv_indev_set_button_points` to map the key ID to the coordinates.
- :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD`: No effect, Send random :ref:`indev_keys`.

.. raw:: html

   </details>
   <br>


请在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_MONKEY`。

首先配置monkey，使用 :c:struct:`lv_monkey_config_t` 定义配置结构，设置 ``type``（查看 `input devices</overview/indev>`__ 以获取支持的类型），然后设置 ``period_range`` 和 ``input_range`` 的范围，monkey会在此范围内随机时间输出随机操作。调用 :cpp:func:`lv_monkey_create` 创建monkey。最后调用 :cpp:expr:`lv_monkey_set_enable(monkey, true)` 启用monkey。

如果要暂停monkey，请调用 :cpp:expr:`lv_monkey_set_enable(monkey, false)`。要删除monkey，请调用 :cpp:expr:`lv_monkey_delete(monkey)`。

请注意， ``input_range`` 在不同的 ``type`` 中有不同的含义：

- :cpp:enumerator:`LV_INDEV_TYPE_POINTER`：无效果，在屏幕分辨率的像素内随机点击。
- :cpp:enumerator:`LV_INDEV_TYPE_ENCODER`： ``enc_diff`` 的最小值和最大值。
- :cpp:enumerator:`LV_INDEV_TYPE_BUTTON` ： ``btn_id`` 的最小值和最大值。使用 :cpp:func:`lv_monkey_get_indev` 获取输入设备，并使用:cpp:func:`lv_indev_set_button_points`将按键ID映射到坐标上。
- :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD` ：无效果，发送随机的 :ref:`indev_keys`。


.. _monkey_example:

Example
-------

.. include:: ../examples/others/monkey/index.rst

.. _monkey_api:

API
---

