.. _monkey:

=====================
Monkey测试（压力测试）
=====================

.. raw:: html

   <details>
     <summary>显示原文</summary>

A simple monkey test. Use random input to stress test the application.

.. raw:: html

   </details>
   <br>


这里提供一个简单的 monkey 测试接口，其使用随机输入来对应用程序进行压力测试。


.. _monkey_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_MONKEY` in ``lv_conf.h``.

First configure monkey, use :c:struct:`lv_monkey_config_t` to define the
configuration structure, set the ``type`` (check :ref:`Input Devices <indev>`
for the supported types), and then set the
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


在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_MONKEY`。

首先配置 monkey，使用 :c:struct:`lv_monkey_config_t` 定义配置结构，设置 ``type``（查看 :ref:`Input Devices <indev>` 了解支持的类型），然后设置 ``period_range`` 和 ``input_range`` 的范围，monkey 将在该范围内随机时间输出随机操作。调用 :cpp:func:`lv_monkey_create` 创建 monkey。最后调用 :cpp:expr:`lv_monkey_set_enable(monkey, true)` 启用 monkey。

如果需要暂停 monkey，调用 :cpp:expr:`lv_monkey_set_enable(monkey, false)`。如需删除 monkey，调用 :cpp:expr:`lv_monkey_delete(monkey)`。

需要注意的是，``input_range`` 在不同 ``type`` 中的含义不同：

- :cpp:enumerator:`LV_INDEV_TYPE_POINTER`: 无影响，在屏幕分辨率的像素范围内随机点击。
- :cpp:enumerator:`LV_INDEV_TYPE_ENCODER`: ``enc_diff`` 的最小值和最大值。
- :cpp:enumerator:`LV_INDEV_TYPE_BUTTON`: ``btn_id`` 的最小值和最大值。
  使用 :cpp:func:`lv_monkey_get_indev` 获取输入设备，并使用 :cpp:func:`lv_indev_set_button_points` 将按键 ID 映射到坐标。
- :cpp:enumerator:`LV_INDEV_TYPE_KEYPAD`: 无影响，发送随机 :ref:`indev_keys`。

.. _monkey_example:

Example
-------

.. include:: ../../examples/others/monkey/index.rst

.. _monkey_api:

API
---
