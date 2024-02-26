======
Zephyr
======

What is Zephyr?（Zephyr是什么？）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

`Zephyr <https://zephyrproject.org/>`__ is an `open
source <https://github.com/zephyrproject-rtos/zephyr>`__ real-time operating
system (RTOS) that is easy to deploy, secure, connect and manage.
It has a growing set of software libraries that can be used
across various applications and industry sectors such as
Industrial IoT, wearables, machine learning and more.
Zephyr is built with an emphasis on broad chipset support,
security, dependability, longterm support releases and a
growing open source ecosystem.

.. raw:: html

   </details>
   <br>


Zephyr `<https://zephyrproject.org/>`__是一个 `开源
 <https://github.com/zephyrproject-rtos/zephyr>`__的实时操作系统（RTOS），它易于部署、安全、可连接和管理。
 它拥有一套不断增长的软件库，可用于各种应用和行业领域，如工业物联网、可穿戴设备、机器学习等。
 Zephyr的构建重点在于广泛的芯片组支持、安全性、可靠性、长期支持发布和不断增长的开源生态系统。


Highlights of Zephyr（Zephyr的亮点）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  **Small** - Runs on microcontrollers as small as 8 kB Flash
   and 5 kB of RAM.
-  **Scalable** - Usable for complex multicore systems.
-  **Customizable** - Out-of-the-box support for 500+ boards
   and high portability.
-  **Secure** - Built with safety and security in mind,
   offers Long-term support.
-  **Ecosystem** - Zephyr not only provides the RTOS kernel but
   also developer tooling, device drivers, connectivity, logging,
   tracing, power management and much more.
-  **Decoupling** - Leverages devicetree to describe and
   configure the target system.
-  **Compliant** - Apps are runnable as native Linux applications,
   which simplifies debugging and profiling.

.. raw:: html

   </details>
   <br>


-  **小巧** - 可运行在仅8 kB Flash和5 kB RAM的微控制器上。  
-  **可扩展** - 可用于复杂的多核系统。  
-  **可定制** - 提供500多个板卡的开箱即用支持和高度可移植性。  
-  **安全** - 在构建时考虑到安全性和可靠性，提供长期支持。  
-  **生态系统** - Zephyr不仅提供RTOS内核，还提供开发工具、设备驱动程序、连接性、日志记录、跟踪、电源管理等。  
-  **解耦** - 利用设备树描述和配置目标系统。  
-  **兼容** - 应用程序可作为本地Linux应用程序运行，从而简化调试和性能分析。


How to run LVGL on Zephyr?（如何在Zephyr上运行LVGL？）
--------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To setup your development environment refer to the
`getting started guide <https://docs.zephyrproject.org/latest/develop/getting_started/index.html>`__.

After you completed the setup above you can check out all of the `provided samples <https://docs.zephyrproject.org/latest/samples/>`__ for various boards.
You can check the list of available boards using:

.. raw:: html

   </details>
   <br>



要设置您的开发环境，请参阅 `入门指南 <https://docs.zephyrproject.org/latest/develop/getting_started/index.html>`__。  
  
完成上述设置后，您可以查看各种板卡的 `提供的示例 <https://docs.zephyrproject.org/latest/samples/>`__。  
您可以使用以下命令查看可用板卡的列表：


.. code:: shell

   $ west boards

.. raw:: html

   <details>
     <summary>显示原文</summary>

After you chose a board you can build one of the LVGL demos for it. Here we are using the :code:`native_posix`
board, which allows for running the application on your posix compliant host system:

.. raw:: html

   </details>
   <br>


选择板卡后，您可以为其构建LVGL演示之一。在此，我们使用的是 :code:`native_posix`板卡，
它允许在符合POSIX标准的主机系统上运行应用程序：


.. code:: shell

   $ west build -b native_posix samples/modules/lvgl/demos

.. raw:: html

   <details>
     <summary>显示原文</summary>

To run the application on your host:

.. raw:: html

   </details>
   <br>


要在主机上运行应用程序，您需要执行以下步骤：


.. code:: shell

   $ west build -t run

.. raw:: html

   <details>
     <summary>显示原文</summary>

In case you chose any of the other supported boards you can flash to the device with:

.. raw:: html

   </details>
   <br>


如果您选择了其他受支持的板卡之一，您可以使用以下命令将应用程序闪存到设备中：


.. code:: shell

    $ west flash

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you want to build any of the other demo applications check out the samples
`README <https://docs.zephyrproject.org/latest/samples/modules/lvgl/demos/README.html>`__.

.. raw:: html

   </details>
   <br>


如果您想构建其他任何演示应用程序，
请查阅示例的 `README <https://docs.zephyrproject.org/latest/samples/modules/lvgl/demos/README.html>`__ 文件。


Leveraging Zephyr Features（利用Zephyr特性）
-------------------------------------------

Shell
~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Zephyr includes a powerful shell implementation that can be enabled with the Kconfig symbols
:code:`CONFIG_SHELL` and :code:`CONFIG_LV_Z_SHELL` (the demos from above have it enabled by default).

The shell offers enabling/disabling of LVGL monkeys:

.. raw:: html

   </details>
   <br>


Zephyr包含了一个强大的shell实现，可以通过Kconfig符号
:code:`CONFIG_SHELL`和 :code:`CONFIG_LV_Z_SHELL`（上面的演示默认启用了它们）来启用。  
  
shell提供了启用/禁用LVGL猴子的功能：


.. code:: shell

    # Create a new monkey with the given indev type
    uart$ lvgl monkey create [pointer|keypad|button|encoder]

    # Enable/Disable a monkey
    uart$ lvgl monkey set <index> <inactive/active>

.. raw:: html

   <details>
     <summary>显示原文</summary>

This is useful for checking your application for memory leaks and other bugs.
Speaking of memory leaks, you can also acquire stats of the memory used by LVGL

.. raw:: html

   </details>
   <br>


这对于检查应用程序是否存在内存泄漏和其他错误非常有用。说到内存泄漏，您还可以获取LVGL使用的内存统计信息。


.. code:: shell

    uart$ lvgl stats memory

.. raw:: html

   <details>
     <summary>显示原文</summary>

For more details refer to the `shell documentation <https://docs.zephyrproject.org/latest/services/shell/index.html>`__.

.. raw:: html

   </details>
   <br>


更多详细信息，请参阅`shell文档 <https://docs.zephyrproject.org/latest/services/shell/index.html>`__。


Devicetree（设备树）
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Zephyr uses the devicetree description language to create and manage LVGL input devices.

The pseudo device binding descriptions can be found at:

- `button input <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-button-input.html>`__
- `pointer input <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-pointer-input.html>`__
- `encoder input <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-encoder-input.html>`__

Essentially those buffer the :code:`input_event` generated by the device pointed to by the :code:`input` phandle or if left
empty the binding captures all events regardless of the source. You do not have to instantiate or manage the devices yourself,
they are created at application start up before :code:`main()` is executed.

Most boards or shields that have a display or display connector have the pointer input device already declared:

.. raw:: html

   </details>
   <br>


Zephyr使用devicetree描述语言来创建和管理LVGL输入设备。

伪设备绑定描述可以在以下位置找到：

- `按钮输入 <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-button-input.html>`__
- `指针输入 <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-pointer-input.html>`__
- `编码器输入 <https://docs.zephyrproject.org/latest/build/dts/api/bindings/input/zephyr,lvgl-encoder-input.html>`__

这些设备本质上缓冲了由 :code:`input phandle`指向的设备生成的 :code:`input_event`，
如果留空，则绑定会捕获所有事件，而不管其来源如何。
您不必自己实例化或管理设备，它们在应用程序启动并在执行 :code:`main()`之前创建。

大多数板卡或带有显示屏或显示连接器的挡板都已经声明了指针输入设备：


.. code::

    lvgl_pointer {
        compatible = "zephyr,lvgl-pointer-input";
        input = <&ft5336_touch>;
    };

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can access the underlying lvgl :code:`lv_indev_t` for configuration.
Example with the encoder device to assign a :code:`lv_group_t`:

.. raw:: html

   </details>
   <br>


您可以通过访问底层的lvgl :code:`lv_indev_t`来进行配置。以下是一个示例，使用编码器设备分配一个 :code:`lv_group_t`：


.. code:: c

    const struct device *lvgl_encoder = DEVICE_DT_GET(DT_COMPAT_GET_ANY_STATUS_OKAY(zephyr_lvgl_encoder_input));

    lv_obj_t *arc;
    lv_group_t *arc_group;

    arc = lv_arc_create(lv_screen_active());
    lv_obj_align(arc, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_size(arc, 150, 150);

    arc_group = lv_group_create();
    lv_group_add_obj(arc_group, arc);
    lv_indev_set_group(lvgl_input_get_indev(lvgl_encoder), arc_group);


Kconfig（配置）
~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Aside from enabling the shell you can also use Kconfig to finetune
the footprint of your application.

.. raw:: html

   </details>
   <br>


除了启用shell外，您还可以使用Kconfig来微调应用程序的占用空间。  


.. code::

    # Size of the memory region from which lvgl memory is allocated
    CONFIG_LV_Z_MEM_POOL_SIZE=8192

    # Do not include every widget/theme by default, enable them as needed.
    CONFIG_LV_CONF_MINIMAL=y

.. raw:: html

   <details>
     <summary>显示原文</summary>

Overlays can be used to enable/disable features for specific boards or build
targets. For more information refer to the
`application development guide <https://docs.zephyrproject.org/latest/develop/application/index.html#application-configuration>`__.

.. raw:: html

   </details>
   <br>


可以通过Overlays启用或禁用特定板卡或构建目标的特性。
更多信息请参阅`应用程序开发指南 `<https://docs.zephyrproject.org/latest/develop/application/index.html#application-configuration>`__。  
  

Where can I find more information?（在哪里可以找到更多信息？ ）
-----------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  Zephyr Documentation: `Zephyr Documentation <https://docs.zephyrproject.org/latest/index.html>`__
-  Zephyr mailing list: `Zepyhr Mailing
   List <https://lists.zephyrproject.org/g/main>`__
-  Zephyr Discord server: `Zepyhr Discord
   server <https://chat.zephyrproject.org/>`__

.. raw:: html

   </details>
   <br>


-  Zephyr文档： `Zephyr文档 <https://docs.zephyrproject.org/latest/index.html>`__  
-  Zephyr邮件列表： `Zephyr邮件列表 <https://lists.zephyrproject.org/g/main>`__  
-  Zephyr Discord服务器： `Zephyr Discord服务器 <https://chat.zephyrproject.org/>`__
   
