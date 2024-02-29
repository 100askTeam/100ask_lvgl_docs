=========================================================
Espressif (ESP32 chip series)（乐鑫科技（ESP32芯片系列））
=========================================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can be used and configured as a standard `ESP-IDF <https://github.com/espressif/esp-idf>`__ component.

More information about ESP-IDF build system can be found `here <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html>`__.

.. raw:: html

   </details>
   <br>


LVGL可以被用作并配置为标准的 `ESP-IDF <https://github.com/espressif/esp-idf>`__ 组件。

有关ESP-IDF构建系统的更多信息，请点击 `这里 <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html>`__。


LVGL demo project for ESP32（ESP32的LVGL演示项目）
--------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

We've created `lv_port_esp32 <https://github.com/lvgl/lv_port_esp32>`__,
a project using ESP-IDF and LVGL to show one of the demos from
`demos <https://github.com/lvgl/lvgl/demos>`__. You can configure the
project to use one of the many supported display controllers and targets
(chips).

See `lvgl_esp32_drivers <https://github.com/lvgl/lvgl_esp32_drivers>`__
repository for a complete list of supported display and indev (touch)
controllers and targets.

.. raw:: html

   </details>
   <br>


我们创建了 `lv_port_esp32 <https://github.com/lvgl/lv_port_esp32>`__，这是一个使用ESP-IDF和LVGL的项目，用于展示来自 `demos <https://github.com/lvgl/lvgl/demos>`__ 中的一个演示。您可以配置该项目以使用众多支持的显示控制器和目标（芯片）。

请参考 `lvgl_esp32_drivers <https://github.com/lvgl/lvgl_esp32_drivers>`__ 仓库，了解所有受支持的显示和输入设备（触摸）控制器以及目标的完整列表。


Using LVGL in your ESP-IDF project（在您的 ESP-IDF 项目中使用 LVGL）
-------------------------------------------------------------------

Prerequisites（先决条件）
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  ESP-IDF v4.1 and above
-  ESP evaluation board with a display

.. raw:: html

   </details>
   <br>


- ESP-IDF v4.1 及更高版本
- 带有显示屏的 ESP 开发板


Obtaining LVGL（获取LVGL）
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

**Option 1:** git submodule

Simply clone LVGL into your ``project_root/components`` directory and it
will be automatically integrated into the project. If the project is a
git repository you can include LVGL as a git submodule:

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl.git components/lvgl

The above command will clone LVGL's main repository into the
``components/lvgl`` directory. LVGL includes a ``CMakeLists.txt`` file
that sets some configuration options so you can use LVGL right away.

**Option 2:** IDF Component Manager

LVGL is also distributed through `IDF Component Manager <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-component-manager.html>`__.
It allows users to seamlessly integrate `LVGL component <https://components.espressif.com/component/lvgl/lvgl>`__ into
their project with following command:

.. code:: sh

   idf.py add-dependency lvgl/lvgl>=8.*

During next project build, LVGL component will be fetched from the
component registry and added to project build.

.. raw:: html

   </details>
   <br>


**选项1：** git 子模块

将 LVGL 简单地克隆到你的 ``project_root/components`` 目录中，它将自动集成到项目中。如果项目是一个 git 仓库，你可以将 LVGL 作为 git 子模块包含进来：

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl.git components/lvgl

上述命令将 LVGL 的主要仓库克隆到 ``components/lvgl`` 目录中。LVGL 包括一个 ``CMakeLists.txt`` 文件，设置了一些配置选项，这样你就可以立即使用 LVGL。

**选项2：** IDF 组件管理器

LVGL 也通过 `IDF 组件管理器 <https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-component-manager.html>`__ 进行分发。
它允许用户通过以下命令无缝地将 `LVGL 组件 <https://components.espressif.com/component/lvgl/lvgl>`__ 集成到他们的项目中：

.. code:: sh

   idf.py add-dependency lvgl/lvgl>=8.*

在下次项目构建期间，LVGL 组件将从组件注册表中获取，并添加到项目构建中。


Configuration（配置）
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

When you are ready to configure LVGL, launch the configuration menu with
``idf.py menuconfig`` in your project root directory, go to
``Component config`` and then ``LVGL configuration``.

.. raw:: html

   </details>
   <br>


当你准备配置LVGL时，在项目根目录中使用 ``idf.py menuconfig`` 命令打开配置菜单，进入 ``Component config``，然后进入 ``LVGL configuration``。


Using lvgl_esp32_drivers in ESP-IDF project（在ESP-IDF项目中使用lvgl_esp32_drivers）
------------------------------------------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can also add ``lvgl_esp32_drivers`` as a "component". This component
should be located inside a directory named "components" in your project
root directory.

When your project is a git repository you can include
``lvgl_esp32_drivers`` as a git submodule:

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl_esp32_drivers.git components/lvgl_esp32_drivers

.. raw:: html

   </details>
   <br>


你还可以将 ``lvgl_esp32_drivers`` 添加为一个 "组件"。这个组件应该位于你项目根目录下名为 "components" 的文件夹中。

当你的项目是一个git仓库时，你可以将 ``lvgl_esp32_drivers`` 作为一个git子模块加入：

.. code:: sh

   git submodule add https://github.com/lvgl/lvgl_esp32_drivers.git components/lvgl_esp32_drivers

