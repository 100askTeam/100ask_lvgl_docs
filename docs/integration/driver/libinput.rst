===============================
Libinput Driver（Libinput驱动）
===============================

Overview（概览）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Libinput is an input stack for processes that need to provide events from commonly used input devices. That includes mice, keyboards, touchpads,
touchscreens and graphics tablets. Libinput handles device-specific quirks and provides an easy-to-use API to receive events from devices.

.. raw:: html

   </details>
   <br>


Libinput是一个用于提供常用输入设备事件的进程输入堆栈。包括鼠标、键盘、触摸板、触摸屏和绘图板。Libinput处理设备特定的问题，并提供了一个易于使用的API来接收设备的事件。


Prerequisites（先决条件）
-------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You have the development version of libinput installed (usually ``libinput-dev``). If your input device requires quirks, make sure they are
installed as well (usually in ``/usr/share/libinput/*.quirks``). To test if your device is set up correctly for use with libinput, you can
run ``libinput list-devices``.

.. code:: console

    $ sudo libinput list-devices
    ...
    Device:           ETPS/2 Elantech Touchpad
    Kernel:           /dev/input/event5
    Group:            10
    Seat:             seat0, default
    Size:             102x74mm
    Capabilities:     pointer gesture
    Tap-to-click:     disabled
    Tap-and-drag:     enabled
    ...

If your device doesn't show up, you may have to configure udev and the appropriate udev rules to connect it.

Additionally, if you want full keyboard support, including letters and modifiers, you'll need the development version of libxkbcommon
installed (usually ``libxkbcommon-dev``).

.. raw:: html

   </details>
   <br>


你已经安装了libinput的开发版本（通常是 ``libinput-dev``）。如果你的输入设备需要quirks，请确保它们也被安装了（通常位于 ``/usr/share/libinput/*.quirks``）。为了测试你的设备是否正确设置为与libinput一起使用，你可以运行 ``libinput list-devices``。

.. code:: console

    $ sudo libinput list-devices
    ...
    设备:           ETPS/2 Elantech 触摸板
    内核:           /dev/input/event5
    组:            10
    座位:             seat0, 默认
    尺寸:             102x74mm
    功能:     指针 手势
    点按点击:     禁用
    点按拖动:     启用
    ...

如果你的设备没有显示出来，你可能需要配置udev和适当的udev规则来连接它。

另外，如果你想要完整的键盘支持，包括字母和修饰键，你将需要安装libxkbcommon的开发版本（通常是 ``libxkbcommon-dev``）。


Configuring the driver（配置驱动程序）
-------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the libinput driver support in lv_conf.h, by cmake compiler define or by KConfig.

.. code:: c

    #define LV_USE_LIBINPUT    1

Full keyboard support needs to be enabled separately.

.. code:: c

    #define LV_LIBINPUT_XKB            1
    #define LV_LIBINPUT_XKB_KEY_MAP    { .rules = NULL, .model = "pc101", .layout = "us", .variant = NULL, .options = NULL }
    
To find the right key map values, you may use the ``setxkbmap -query`` command.

.. raw:: html

   </details>
   <br>


在lv_conf.h中启用libinput驱动程序支持，可以通过cmake编译器定义或KConfig进行。

.. code:: c

    #define LV_USE_LIBINPUT    1

需要单独启用完整键盘支持。

.. code:: c

    #define LV_LIBINPUT_XKB            1
    #define LV_LIBINPUT_XKB_KEY_MAP    { .rules = NULL, .model = "pc101", .layout = "us", .variant = NULL, .options = NULL }
    
要找到正确的按键映射值，您可以使用 ``setxkbmap -query`` 命令。


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set up an input device via the libinput driver, all you need to do is call ``lv_libinput_create`` with the respective device type
(``LV_INDEV_TYPE_POINTER`` or ``LV_INDEV_TYPE_KEYPAD``) and device node path (e.g. ``/dev/input/event5``).

.. code:: c

    lv_indev_t *indev = lv_libinput_create(LV_INDEV_TYPE_POINTER, "/dev/input/event5");

Note that touchscreens are treated as (absolute) pointer devices by the libinput driver and require ``LV_INDEV_TYPE_POINTER``.

Depending on your system, the device node paths might not be stable across reboots. If this is the case, you can use ``lv_libinput_find_dev``
to find the first device that has a specific capability.

.. code:: c

    char *path = lv_libinput_find_dev(LV_LIBINPUT_CAPABILITY_TOUCH, true);

The second argument controls whether or not all devices are rescanned. If you have many devices connected this can get quite slow.
Therefore, you should only specify ``true`` on the first call when calling this method multiple times in a row. If you want to find
all devices that have a specific capability, use ``lv_libinput_find_devs``.

If you want to connect a keyboard device to a textarea, create a dedicated input group and set it on both the indev and textarea.

.. code:: c

    lv_obj_t *textarea = lv_textarea_create(...);
    ...
    lv_group_t *keyboard_input_group = lv_group_create();
    lv_indev_set_group(indev, keyboard_input_group);
    lv_group_add_obj(keyboard_input_group, textarea);

.. raw:: html

   </details>
   <br>


通过libinput驱动程序设置输入设备，您只需要使用对应的设备类型（ ``LV_INDEV_TYPE_POINTER`` 或 ``LV_INDEV_TYPE_KEYPAD``）和设备节点路径（例如 ``/dev/input/event5``）调用 ``lv_libinput_create`` 函数。

.. code:: c

    lv_indev_t *indev = lv_libinput_create(LV_INDEV_TYPE_POINTER, "/dev/input/event5");

请注意，libinput驱动程序将触摸屏设备视为（绝对）指针设备，需要使用 ``LV_INDEV_TYPE_POINTER``。

根据您的系统，设备节点路径可能在重新启动后不稳定。如果是这种情况，您可以使用 ``lv_libinput_find_dev``来查找具有特定功能的第一个设备。

.. code:: c

    char *path = lv_libinput_find_dev(LV_LIBINPUT_CAPABILITY_TOUCH, true);

第二个参数控制是否重新扫描所有设备。如果您连接了许多设备，这可能会变得相当缓慢。因此，在连续多次调用此方法时，只在第一次调用时指定 ``true`` 。如果要查找所有具有特定功能的设备，请使用 ``lv_libinput_find_devs``。

如果要将键盘设备连接到文本区域，请创建一个专用的输入组，并将其设置在indev和textarea上。

.. code:: c

    lv_obj_t *textarea = lv_textarea_create(...);
    ...
    lv_group_t *keyboard_input_group = lv_group_create();
    lv_indev_set_group(indev, keyboard_input_group);
    lv_group_add_obj(keyboard_input_group, textarea);

    
