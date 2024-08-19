=========================================================
Espressif (ESP32 Chip Series)（乐鑫科技（ESP32芯片系列））
=========================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can be used and configured as standard `ESP-IDF <https://github.com/espressif/esp-idf>`__ component.

If you are new to ESP-IDF, follow the instructions in the `ESP-IDF Programming guide <https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/index.html>`__ to install and set up ESP-IDF on your machine.

.. raw:: html

   </details>
   <br>


LVGL可以被用作并配置为标准的 `ESP-IDF <https://github.com/espressif/esp-idf>`__ 组件。

如果您是ESP-IDF的新用户，请按照ESP-IDF编程指南 <https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/index.html>__ 中的说明，在您的机器上安装并设置ESP-IDF。

LVGL Demo Projects for ESP32（ESP32的LVGL演示项目）
--------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

For a quick start with LVGL and ESP32, the following pre-configured demo projects are available for specific development boards:

-  `ESP-BOX-3 <https://github.com/lvgl/lv_port_espressif_esp-box-3>`__
-  `ESP32-S3-LCD-EV-BOARD <https://github.com/lvgl/lv_port_espressif_esp32-s3-lcd-ev-board>`__
-  `M5Stack-CoreS3 <https://github.com/lvgl/lv_port_espressif_M5Stack_CoreS3>`__

Refer to the README.md files in these repositories for build and flash instructions.

These demo projects use Espressif's Board Support Packages (BSPs). Additional BSPs and examples are available in the `esp-bsp <https://github.com/espressif/esp-bsp>`__ repository.


.. raw:: html

   </details>
   <br>


如果您想快速开始使用LVGL和ESP32，以下是为特定开发板提供的预配置演示项目：

-  `ESP-BOX-3 <https://github.com/lvgl/lv_port_espressif_esp-box-3>`__
-  `ESP32-S3-LCD-EV-BOARD <https://github.com/lvgl/lv_port_espressif_esp32-s3-lcd-ev-board>`__
-  `M5Stack-CoreS3 <https://github.com/lvgl/lv_port_espressif_M5Stack_CoreS3>`__

这些项目的README.md文件中包含了构建和烧录的说明。

这些演示项目使用了乐鑫（Espressif）的开发板支持包（Board Support Packages, BSPs）。在 esp-bsp <https://github.com/espressif/esp-bsp>__ 仓库中，您可以找到额外的BSPs和示例代码。



Using LVGL in your ESP-IDF project（在您的 ESP-IDF 项目中使用 LVGL）
-------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The simplest way to integrate LVGL into your ESP-IDF project is via the `esp_lvgl_port <https://components.espressif.com/components/espressif/esp_lvgl_port>`__ component. This component, used in the demo projects mentioned above, provides helper functions for easy installation of LVGL and display drivers. Moreover, it can add support for touch, rotary encoders, button or USB HID inputs. It simplifies power savings, screen rotation and other platform specific nuances.

The esp_lvgl_port supports LVGL versions 8 and 9 and is compatible with ESP-IDF v4.4 and above. To add it to your project, use the following command:

.. code:: sh

   idf.py add-dependency "espressif/esp_lvgl_port^2.3.0"
By default, esp_lvgl_port depends on the latest stable version of LVGL, so no additional steps are needed for new projects. If a specific LVGL version is required, specify this in your project to avoid automatic updates. LVGL can also be used without esp_lvgl_port, as described below.


.. raw:: html

   </details>
   <br>


要将LVGL集成到您的ESP-IDF项目中，最简单的方法是通过使用 `esp_lvgl_port <https://components.espressif.com/components/espressif/esp_lvgl_port>`__ 组件。这个组件在上述演示项目中使用，提供了辅助函数，可以轻松地安装LVGL和显示驱动程序。此外，它还可以添加对触摸、旋转编码器、按钮或USB HID输入的支持。它简化了节能、屏幕旋转和其他特定平台的细节。

esp_lvgl_port支持LVGL版本8和9，与ESP-IDF v4.4及以上版本兼容。要将其添加到您的项目中，请使用以下命令：

.. code:: sh

   idf.py add-dependency "espressif/esp_lvgl_port^2.3.0"

默认情况下，esp_lvgl_port依赖于LVGL的最新稳定版本，因此新项目不需要额外的步骤。如果需要特定版本的LVGL，请在项目中指定以避免自动更新。LVGL也可以在没有esp_lvgl_port的情况下使用，具体方法如下所述。

Obtaining LVGL（获取LVGL）
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL is distributed through `ESP Registry <https://components.espressif.com/>`__, where all LVGL releases are uploaded.
In case you do not want to use esp_lvgl_port, you can add `LVGL component <https://components.espressif.com/component/lvgl/lvgl>`__ into your project with following command:

.. code:: sh

   idf.py add-dependency lvgl/lvgl^9.*

Adjust the ``^9.*`` part to match your LVGL version requirement. More information on version specifications can be found in the `IDF Component Manager documentation <https://docs.espressif.com/projects/idf-component-manager/en/latest/reference/versioning.html#range-specifications>`__. During the next build, the LVGL component will be fetched from the component registry and added to the project.

**Advanced usage: Use LVGL as local component**

For LVGL development and testing, it may be useful to use LVGL as a local component instead of from the ESP Registry, which offers only released versions and does not allow local modifications. To do this, clone LVGL to your project with the following command:

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl.git components/lvgl

.. note::

   All components from ``${project_dir}/components`` are automatically added to build.

.. raw:: html

   </details>
   <br>


LVGL 通过 ESP Registry <https://components.espressif.com/>__ 进行分发，所有的 LVGL 版本都上传到了这里。
如果您不想使用 esp_lvgl_port，您可以使用以下命令将 LVGL 组件 <https://components.espressif.com/component/lvgl/lvgl>__ 添加到您的项目中：

.. code:: sh

   idf.py add-dependency lvgl/lvgl^9.*

请调整 ``^9.*`` 部分以匹配您的 LVGL 版本需求。关于版本规格的更多信息可以在 `IDF Component Manager 文档 <https://docs.espressif.com/projects/idf-component-manager/en/latest/reference/versioning.html#range-specifications>`__ 中找到。在下一次构建过程中，LVGL 组件将从组件注册表中获取并添加到项目中。

高级用法：将 LVGL 作为本地组件使用

对于 LVGL 的开发和测试，使用本地的 LVGL 组件而不是从 ESP Registry 获取可能很有用，因为 ESP Registry 只提供已发布的版本，不允许本地修改。要做到这一点，可以使用以下命令将 LVGL 克隆到您的项目中：

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl.git components/lvgl

.. note::

   所有来自 ``${project_dir}/components`` 的组件都会自动添加到构建中。


Configuration（配置）
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

To configure LVGL, launch the configuration menu with ``idf.py menuconfig`` in your project root directory. Navigate to ``Component config`` and then ``LVGL configuration``.


Support for Display and Touch Drivers（支持显示和触摸驱动）
-----------------------------------------------------------

For successful LVGL project you will need a display driver and optionally a touch driver. Espressif provides these drivers that are built on its `esp_lcd <https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-reference/peripherals/lcd/index.html>`__ component.

-  esp_lcd natively supports for some `basic displays <https://github.com/espressif/esp-idf/tree/master/components/esp_lcd/src>`__
-  Other displays are maintained in `esp-bsp repository <https://github.com/espressif/esp-bsp/tree/master/components/lcd>`__ and are uploaded to ESP Registry
-  Touch drivers are maintained in `esp-bsp repository <https://github.com/espressif/esp-bsp/tree/master/components/lcd_touch>`__ and are uploaded to ESP Registry

These components share a common public API, making it easy to migrate your projects across different display and touch drivers.

To add a display or touch driver to your project, use a command like:

.. code:: sh

   idf.py add-dependency "espressif/esp_lcd_gc9a01^2.0.0"

.. raw:: html

   </details>
   <br>


要配置LVGL，您可以在项目根目录下使用 idf.py menuconfig 命令启动配置菜单。然后，依次导航到 Component config 和 LVGL configuration。

为了成功运行LVGL项目，您将需要一个显示驱动程序，以及一个可选的触摸驱动程序。Espressif提供了构建在其 `esp_lcd <https://docs.espressif.com/projects/esp-idf/en/stable/esp32/api-reference/peripherals/lcd/index.html>`__ 组件上的这些驱动程序。

- esp_lcd 原生支持一些 基本显示设备 <https://github.com/espressif/esp-idf/tree/master/components/esp_lcd/src>。
- 其他显示设备则在 esp-bsp 仓库 <https://github.com/espressif/esp-bsp/tree/master/components/lcd> 中维护，并上传至 ESP Registry。
- 触摸驱动在 esp-bsp 仓库 <https://github.com/espressif/esp-bsp/tree/master/components/lcd_touch>__ 中维护，同样也上传至 ESP Registry。

这些组件共享一个公共的 API，这使得在不同的显示和触摸驱动之间迁移项目变得容易。

要向您的项目添加显示或触摸驱动，可以使用如下命令：

.. code:: sh

   idf.py add-dependency "espressif/esp_lcd_gc9a01^2.0.0"

