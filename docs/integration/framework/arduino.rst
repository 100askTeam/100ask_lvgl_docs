=======
Arduino
=======

.. raw:: html

   <details>
     <summary>显示原文</summary>

The `LVGL library <https://github.com/lvgl/lvgl>`__ is directly available as Arduino libraries.

Note that you need to choose a board powerful enough to run LVGL and
your GUI. See the `requirements of LVGL <https://docs.lvgl.io/master/intro/index.html#requirements>`__.

For example ESP32 is a good candidate to create UI's with LVGL.

.. raw:: html

   </details>
   <br>


`LVGL库<https://github.com/lvgl/lvgl>`__ 可直接作为Arduino库使用。

请注意，您需要选择一个功能足够强大的板卡来运行LVGL和您的GUI。请 `参阅LVGL的要求 <https://docs.lvgl.io/master/intro/index.html#requirements>`__ 。

例如，ESP32是使用LVGL创建UI的一个很好的选择。


Get the LVGL Arduino library （获取LVGL Arduino库）
----------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can be installed via the Arduino IDE Library Manager or as a .ZIP library.

You can `Download <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__
the latest version of LVGL from GitHub and simply copy it to Arduino's
library folder.

.. raw:: html

   </details>
   <br>


LVGL可以通过Arduino IDE库管理器或作为.ZIP库进行安装。

你可以从GitHub上 `下载 <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__ LVGL的最新版本，然后将其简单地复制到Arduino的库文件夹中。


Set up drivers（安装驱动程序）
-------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To get started it's recommended to use `TFT_eSPI <https://github.com/Bodmer/TFT_eSPI>`__ library as a TFT
driver to simplify testing. To make it work, setup ``TFT_eSPI``
according to your TFT display type via editing either:

- ``User_Setup.h``
- or by selecting a configuration in the ``User_Setup_Select.h``

Both files are located in ``TFT_eSPI``library's folder.

.. raw:: html

   </details>
   <br>


一开始使用，建议使用 `TFT_eSPI <https://github.com/Bodmer/TFT_eSPI>`__ 库作为TFT驱动程序，以简化测试。
为了使其工作，请根据您的TFT显示器类型通过编辑以下任一文件来设置 ``TFT_eSPI``：

- ``User_Setup.h``
- 或者在 ``User_Setup_Select.h`` 中选择一个配置

这两个文件都位于 ``TFT_eSPI`` 库的文件夹中。   


Configure LVGL（配置LVGL）
----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has its own configuration file called ``lv_conf.h``. When LVGL is
installed, follow these configuration steps:

1. Go to the directory of the installed Arduino libraries
2. Go to ``lvgl`` and copy ``lv_conf_template.h`` as ``lv_conf.h`` into the Arduino Libraries directory next to the ``lvgl`` library folder.
3. Open ``lv_conf.h`` and change the first ``#if 0`` to ``#if 1`` to enable the content of the file
4. Set the color depth of you display in :c:macro:`LV_COLOR_DEPTH`

Finally the layout with ``lv_conf.h`` should look like this:

.. raw:: html

   </details>
   <br>


LVGL 有一个名为 ``lv_conf.h`` 的配置文件。当安装 LVGL 时，请遵循以下配置步骤：

1. 进入已安装的 Arduino 库目录
2. 进入 ``lvgl`` 并复制 ``lv_conf_template.h`` 为 ``lv_conf.h`` 到 Arduino 库目录中，该文件应位于 ``lvgl`` 库文件夹旁边。
3. 打开 ``lv_conf.h`` 并将第一行的 ``#if 0`` 更改为 ``#if 1`` 以启用文件内容
4. 在 :c:macro:`LV_COLOR_DEPTH` 中设置显示器的颜色深度

最后，使用 ``lv_conf.h`` 的布局应如下所示：


::

   arduino
    |-libraries
      |-lvgl
      |-other_lib_1
      |-other_lib_2
      |-lv_conf.h


Initialize and run LVGL（初始化并运行LVGL）
------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Take a look at `LVGL_Arduino.ino <https://github.com/lvgl/lvgl/blob/master/examples/arduino/LVGL_Arduino/LVGL_Arduino.ino>`__
to see how to initialize LVGL. ``TFT_eSPI`` is used as the display driver.

In the INO file you can see how to register a display and a touchpad for
LVGL and call an example.

.. raw:: html

   </details>
   <br>


请查看 `LVGL_Arduino.ino <https://github.com/lvgl/lvgl/blob/master/examples/arduino/LVGL_Arduino/LVGL_Arduino.ino>`__ 
以了解如何初始化 LVGL。该示例中使用了 ``TFT_eSPI`` 作为显示驱动程序。

在 INO 文件中，您可以看到如何为 LVGL 注册一个显示屏和一个触摸板，并调用一个示例。


Use the examples and demos（使用示例和演示）
--------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Note that, there is no dedicated INO file for every example. Instead,
you can load an example by calling an ``lv_example_...`` function. For
example :cpp:func:`lv_example_btn_1`.

:important: Due to some the limitations of Arduino's build system you
            need to copy ``lvgl/examples`` to ``lvgl/src/examples``. Similarly for
            the demos ``lvgl/demos`` to ``lvgl/src/demos``.

.. raw:: html

   </details>
   <br>


请注意，并非每个示例都有专用的INO文件。相反，
您可以通过调用一个名为 ``lv_example_...`` 的函数来加载示例。
例如：:cpp:func:`lv_example_btn_1`。

:重要提示: 由于Arduino构建系统的一些限制，
          您需要将 ``lvgl/examples`` 目录复制到 ``vgl/src/examples``。
          对于演示，也需要将 ``lvgl/demos`` 目录复制到 ``lvgl/src/demos``。


Debugging and logging（调试和日志记录）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can display debug information in case of trouble. In the
``LVGL_Arduino.ino`` example there is a ``my_print`` method, which sends
this debug information to the serial interface. To enable this feature
you have to edit the ``lv_conf.h`` file and enable logging in the
section ``log settings``:

.. code:: c

   /*Log settings*/
   #define USE_LV_LOG      1   /*Enable/disable the log module*/
   #if LV_USE_LOG
   /* How important log should be added:
    * LV_LOG_LEVEL_TRACE       A lot of logs to give detailed information
    * LV_LOG_LEVEL_INFO        Log important events
    * LV_LOG_LEVEL_WARN        Log if something unwanted happened but didn't cause a problem
    * LV_LOG_LEVEL_ERROR       Only critical issue, when the system may fail
    * LV_LOG_LEVEL_NONE        Do not log anything
    */
   #  define LV_LOG_LEVEL    LV_LOG_LEVEL_WARN

After enabling the log module and setting :c:macro:`LV_LOG_LEVEL` accordingly, the
output log is sent to the ``Serial`` port @ 115200 bps.

.. raw:: html

   </details>
   <br>


LVGL 在遇到问题时可以显示调试信息。
在 ``LVGL_Arduino.ino`` 示例中，有一个名为 ``my_print`` 的方法，
它会将调试信息发送到串行接口。
要启用此功能，您需要编辑 ``lv_conf.h`` 文件，
并在 ``log settings`` （日志设置）部分启用日志记录：

.. code:: c

   /*Log settings*/
   #define USE_LV_LOG      1   /*Enable/disable the log module*/
   #if LV_USE_LOG
   /* How important log should be added:
    * LV_LOG_LEVEL_TRACE       A lot of logs to give detailed information
    * LV_LOG_LEVEL_INFO        Log important events
    * LV_LOG_LEVEL_WARN        Log if something unwanted happened but didn't cause a problem
    * LV_LOG_LEVEL_ERROR       Only critical issue, when the system may fail
    * LV_LOG_LEVEL_NONE        Do not log anything
    */
   #  define LV_LOG_LEVEL    LV_LOG_LEVEL_WARN

在启用日志模块并相应设置 :c:macro:`LV_LOG_LEVEL` 之后，
输出日志将通过 @ 115200 bps 的 ``Serial`` 端口发送。

