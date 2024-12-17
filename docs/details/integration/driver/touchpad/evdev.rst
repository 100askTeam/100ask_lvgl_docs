=====================================
Linux Evdev Driver（Linux Evdev 驱动）
=====================================

Overview（概览）
---------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Linux event device (evdev) is a hardware-independent API that gives access to input events from, 
for example, a mouse or touchscreen. It is exposed via the Linux device file system interface. 

.. raw:: html

   </details>
   <br>

Linux 事件设备 (evdev) 是一个与硬件无关的 API，提供对输入事件的访问，例如来自鼠标或触摸屏的输入。它通过 Linux 设备文件系统接口进行暴露。

Prerequisites（前提条件）
------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Your system has an input device configured (usually under ``/dev/input/`` such as ``/dev/input/event0``).

.. raw:: html

   </details>
   <br>

您的系统配置了输入设备（通常在 ``/dev/input/`` 下，例如 ``/dev/input/event0`` ）。

Configuring the driver（配置驱动程序）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable the Linux LVGL evdev driver support in ``lv_conf.h``.    

.. code-block:: c

	#define LV_USE_EVDEV 1

.. raw:: html

   </details>
   <br>

在 ``lv_conf.h`` 中启用 Linux LVGL evdev 驱动程序支持。

.. code-block:: c

	#define LV_USE_EVDEV 1

Usage（用法）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To set up an event input, first create an input device with ``lv_edev_create`` setting it to the correct Linux event device.
Then link this to the LVGL display with ``lv_indev_set_display``.   

.. code-block:: c

	lv_indev_t *touch = lv_evdev_create(LV_INDEV_TYPE_POINTER, "/dev/input/event0");
	lv_indev_set_display(touch, disp);

Ensure that an ``lv_display_t`` object is already created for ``disp``. An example for this is shown below, using the Linux framebuffer driver. 

.. code-block:: c

	lv_display_t * disp = lv_linux_fbdev  
	lv_linux_fbdev_set_file(disp, "/dev/fb0");_create();

.. raw:: html

   </details>
   <br>

要设置事件输入，首先使用 ``lv_edev_create`` 创建一个输入设备，并将其设置为正确的 Linux 事件设备。  
然后使用 ``lv_indev_set_display`` 将其连接到 LVGL 显示器。  

.. code-block:: c  

	lv_indev_t *touch = lv_evdev_create(LV_INDEV_TYPE_POINTER, "/dev/input/event0");  
	lv_indev_set_display(touch, disp);  

确保已经为 ``disp`` 创建了一个 ``lv_display_t`` 对象。下面是使用 Linux 帧缓冲驱动的示例：  

.. code-block:: c  

	lv_display_t * disp = lv_linux_fbdev_create();  
	lv_linux_fbdev_set_file(disp, "/dev/fb0");  

Locating your input device（找到您的输入设备）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>


If you can't determine your input device, first run   

```$cat /proc/bus/input/devices```

This should show input devices and there will be entries with the word ``event`` which give a clue as to the device to use eg. ``event1`` would be ``/dev/input/event1``.  

You can use ``evtest`` to show data from that event source to see if it is actually the one you want.

Try:   

``$evtest /dev/input/event1`` replacing ``eventX`` with your event device from above.   

.. raw:: html

   </details>
   <br>

如果无法确定您的输入设备，首先运行  

```$cat /proc/bus/input/devices```  

这将显示输入设备，其中会有包含 ``event`` 的条目，提示要使用的设备，例如 ``event1`` 对应于 ``/dev/input/event1``。  

您可以使用 ``evtest`` 来显示该事件源的数据，以确认它是否是您需要的设备。  

尝试：  

``$evtest /dev/input/event1`` 将 ``eventX`` 替换为您从上一步获取的事件设备。  
