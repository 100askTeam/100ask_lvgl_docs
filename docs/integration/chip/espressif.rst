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


Using the File System under ESP-IDF（使用 ESP-IDF 下的文件系统）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

ESP-IDF uses the standard C functions (``fopen``, ``fread``) in all storage related APIs.
This allows seamless interoperability with LVGL when enabling the :c:macro:`LV_USE_FS_STDIO` configuration.
The process is described in details below, using ``SPIFFS`` as demonstration.

- **Decide what storage system you want to use**

   ESP-IDF has many, ready-to-use examples like
   `SPIFFS <https://github.com/espressif/esp-idf/tree/master/examples/storage/spiffsgen>`__
   , 
   `SD Card <https://github.com/espressif/esp-idf/tree/master/examples/storage/sd_card/sdspi>`__ 
   and 
   `LittleFS <https://github.com/espressif/esp-idf/tree/master/examples/storage/littlefs>`__
   .

- **Re-configure your own project**

   The example project should be examined for details, but in general the changes involve:

   - Enabling LVGL's STDIO file system in the configuration

      You can use ``menuconfig``:

         - ``Component config → LVGL configuration → 3rd Party Libraries``: enable ``File system on top of stdio API``
         - Then select ``Set an upper cased letter on which the drive will accessible`` and set it to ``65`` (ASCII **A**)
         - You can also set ``Default driver letter`` to 65 to skip the prefix in file paths.

   - Modifying the partition table

      The exact configuration depends on your flash size and existing partitions,
      but the new final result should look something like this:

      .. code:: csv
         nvs,      data, nvs,     0x9000,  0x6000,
         phy_init, data, phy,     0xf000,  0x1000,
         factory,  app,  factory, 0x10000, 1400k,
         storage,  data, spiffs,         ,  400k,
      .. note::

         If you are not using a custom ``parition.csv`` yet, it can be added
         via ``menuconfig`` (``Partition Table → Partition Table → Custom partition table CSV``).

   - Apply changes to the build system

      Some ESP file systems provide automatic generation from a host folder using CMake. The proper line(s) must be copied to ``main/CMakeLists.txt``

      .. note::

         ``LittleFS`` has extra dependencies that should be added to ``main/idf_component.yml``

- **Prepare the image files**

   LVGL's ``LVGLImage.py`` Python tool can be used to convert images to binary pixel map files.
   It supports various formats and compression.

   Meanwhile 3rd party libraries
   (like :ref:`LodePNG<lodepng>` and :ref:`Tiny JPEG<tjpgd>`)
   allow using image files without conversion.

   After preparing the files, they should be moved to the target device:

   - If properly activated a **SPIFFS** file system based on the ``spiffs_image`` folder should be automatically generated and later flashed to the target
   - Similar mechanism for **LittleFS** uses the ``flash_data`` folder, but it's only available for Linux hosts
   - For the **SD Card**, a traditional file browser can be used

- **Invoke proper API calls in the application code**

   The core functionality requires only a few lines. The following example draws the image as well.

   .. code:: c
      #include "esp_spiffs.h"
      void lv_example_image_from_esp_fs(void) {
         esp_vfs_spiffs_conf_t conf = {
            .base_path = "/spiffs",
            .partition_label = NULL,
            .max_files = 5,
            .format_if_mount_failed = false
         };
         esp_err_t ret = esp_vfs_spiffs_register(&conf);
         if (ret != ESP_OK) {
            ESP_LOGE(TAG, "Failed to register SPIFF filesystem");
            return;
         }
         lv_obj_t * obj = lv_image_create(lv_screen_active());
         lv_image_set_src(obj, "A:/spiffs/logo.bin");
         lv_obj_center(obj);
      }
- **Build and flash**

   After calling ``idf.py build flash`` the picture should be displayed on the screen.


.. note::

   Changes made by ``menuconfig`` are not being tracked in the repository if the ``sdkconfig`` file is added to ``.gitignore``, which is the default for many ESP-IDF projects.
   To make your configuration permanent, add the following lines to ``sdkconfig.defaults``:

   .. code:: c
      CONFIG_PARTITION_TABLE_CUSTOM=y
      CONFIG_LV_USE_FS_STDIO=y
      CONFIG_LV_FS_STDIO_LETTER=65
      CONFIG_LV_LV_FS_DEFAULT_DRIVE_LETTER=65

.. raw:: html

   </details>
   <br>

在 ESP-IDF 中使用标准 C 函数（如 ``fopen`` 和 ``fread``）进行所有与存储相关的 API 调用，可以让你在启用 LVGL 的 :c:macro:`LV_USE_FS_STDIO` 配置时实现无缝互操作性。以下是使用 ``SPIFFS`` 作为示例的详细过程：

- **决定您想要使用的存储系统**

   ESP-IDF 提供了许多现成的示例，例如 
   `SPIFFS <https://github.com/espressif/esp-idf/tree/master/examples/storage/spiffsgen>`__
   ， 
   `SD Card <https://github.com/espressif/esp-idf/tree/master/examples/storage/sd_card/sdspi>`__ 
  以及 
   `LittleFS <https://github.com/espressif/esp-idf/tree/master/examples/storage/littlefs>`__
   。

- **重新配置你的项目**

   应该检查示例项目以了解详细信息，但通常涉及的更改包括：

   - 在配置中启用 LVGL 的 STDIO 文件系统

     你可以使用 ``menuconfig``:

         - 在 ``Component config → LVGL configuration → 3rd Party Libraries``：中启用 ``File system on top of stdio API``
         - 然后选择 ``Set an upper cased letter on which the drive will accessible`` 并将其设置为 ``65`` (ASCII 字母 **A**)
         - 你也可以将 ``Default driver letter`` 设置为 65，以在文件路径中跳过前缀。

   - 修改分区表

     确切的配置取决于您的闪存大小和现有分区， 但新的最终结果应该看起来像这样：

      .. code:: csv
         nvs,      data, nvs,     0x9000,  0x6000,
         phy_init, data, phy,     0xf000,  0x1000,
         factory,  app,  factory, 0x10000, 1400k,
         storage,  data, spiffs,         ,  400k,
      .. note::

         如果您还没有使用自定义的 ``parition.csv``， 可以通过
         ``menuconfig`` 添加 (``Partition Table → Partition Table → Custom partition table CSV``).

   - 应用构建系统更改

      一些 ESP 文件系统提供了使用 CMake 从主机文件夹自动生成的功能。必须将正确的行复制到  ``main/CMakeLists.txt``

      .. note::

         ``LittleFS`` has extra dependencies that should be added to ``main/idf_component.yml``

- **准备图像文件**

   可以使用 LVGL 的 ``LVGLImage.py`` Python 工具将图像转换为二进制像素映射文件。
   它支持各种格式和压缩。

   同时，第三方库
   (如 :ref:`LodePNG<lodepng>` 和 :ref:`Tiny JPEG<tjpgd>`)
   允许在不转换的情况下使用图像文件。

   准备好文件后，应将它们移动到目标设备：

   - 如果正确激活，基于 ``spiffs_image`` 文件夹的 **SPIFFS** 文件系统应自动生成，然后烧录到目标设备
   - **LittleFS** 的类似机制使用 ``flash_data`` 文件夹，但仅适用于 Linux 主机
   - 对于 **SD Card** 卡，可以使用传统的文件浏览器

- **在应用程序代码中调用适当的 API**

   核心功能只需要几行代码。以下示例同时绘制图像。

   .. code:: c
      #include "esp_spiffs.h"
      void lv_example_image_from_esp_fs(void) {
         esp_vfs_spiffs_conf_t conf = {
            .base_path = "/spiffs",
            .partition_label = NULL,
            .max_files = 5,
            .format_if_mount_failed = false
         };
         esp_err_t ret = esp_vfs_spiffs_register(&conf);
         if (ret != ESP_OK) {
            ESP_LOGE(TAG, "Failed to register SPIFF filesystem");
            return;
         }
         lv_obj_t * obj = lv_image_create(lv_screen_active());
         lv_image_set_src(obj, "A:/spiffs/logo.bin");
         lv_obj_center(obj);
      }
- **构建和烧录**

   调用 ``idf.py build flash`` 后，图片应该会显示在屏幕上。

.. note::

   如果 ``sdkconfig`` 文件被添加到 ``.gitignore`` 中，那么通过 ``menuconfig`` 所做的更改将不会在仓库中被跟踪，这是许多 ESP-IDF 项目的默认设置。
   要使您的配置永久化，请在 ``sdkconfig.defaults``中添加以下行：

   .. code:: c
      CONFIG_PARTITION_TABLE_CUSTOM=y
      CONFIG_LV_USE_FS_STDIO=y
      CONFIG_LV_FS_STDIO_LETTER=65
      CONFIG_LV_LV_FS_DEFAULT_DRIVE_LETTER=65
