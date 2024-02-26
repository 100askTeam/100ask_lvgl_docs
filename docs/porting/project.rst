===========================
Set up a project（设置项目）
===========================

Get the library（获取LVGL图形库）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL is available on GitHub: https://github.com/lvgl/lvgl.

You can clone it or
`Download <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__
the latest version of the library from GitHub.

.. raw:: html

   </details> 
   <br>


LVGL 可在 GitHub 上获得：https://github.com/lvgl/lvgl。

您可以克隆它或从 GitHub `下载 <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__ 最新版本的库。


Add lvgl to your project（将 lvgl 添加到您的项目）
------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The graphics library itself is the ``lvgl`` directory. It contains a
couple of folders but to use ``lvgl`` you only need the ``.c`` and ``.h``
files in the ``src`` folder.

.. raw:: html

   </details> 
   <br>


图形库本身就是 ``lvgl`` 目录。它包含一个几个文件夹，但要使用 ``lvgl`` ，您只需要文件夹中的 ``.c`` and ``.h``文件。


Automatically add files（自动添加文件）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

If your IDE automatically adds the files from the folders copied to the
project folder (as Eclipse or VSCode does), you can simply copy the
``lvgl`` folder as it is into your project.

.. raw:: html

   </details> 
   <br>


如果 IDE 自动将复制到的文件夹中的文件添加到 project 文件夹（就像 Eclipse 或 VSCode 一样），您只需将文件夹原封不动地复制 ``lvgl`` 到您的项目中即可。


Make and CMake
~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL also supports ``make`` and ``CMake`` build systems out of the box.
To add LVGL to your Makefile based build system add these lines to your
main Makefile:

.. code:: make

   LVGL_DIR_NAME ?= lvgl     #The name of the lvgl folder (change this if you have renamed it)
   LVGL_DIR ?= ${shell pwd}  #The path where the lvgl folder is
   include $(LVGL_DIR)/$(LVGL_DIR_NAME)/lvgl.mk

For integration with CMake take a look this section of the
`Documentation </integration/build/cmake>`__.

.. raw:: html

   </details> 
   <br>


LVGL 还支持 ``make`` 和 ``CMake`` 构建开箱即用的系统。 要将 LVGL 添加到基于 Makefile 的构建系统中，请将以下行添加到您的 main Makefile：

.. code:: make

   LVGL_DIR_NAME ?= lvgl     #The name of the lvgl folder (change this if you have renamed it)
   LVGL_DIR ?= ${shell pwd}  #The path where the lvgl folder is
   include $(LVGL_DIR)/$(LVGL_DIR_NAME)/lvgl.mk

要与 CMake 集成，请查看 `文档 </integration/build/cmake>`__ 的这一部分。


Other platforms and tools（其它平台和工具）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The `Get started </integartion/index>`__ section contains many platform
specific descriptions e.g. for ESP32, Arduino, NXP, RT-Thread, NuttX,
etc.

.. raw:: html

   </details> 
   <br>


`入门 </integartion/index>`__ 部分包含许多平台具体描述，例如 ESP32、Arduino、NXP、RT-Thread、NuttX、 等。


Demos and Examples（演示和示例）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``lvgl`` folder also contains an ``examples`` and a ``demos``
folder. If you needed to add the source files manually to your project,
you can do the same with the source files of these two folders too.
``make`` and ``CMake`` handles the examples and demos, so no extra
action required in these cases.

.. raw:: html

   </details> 
   <br>


该 ``lvgl`` 文件夹还包含一个 ``examples`` 和一个 ``demos``文件夹。如果您需要手动将源文件添加到您的项目中， 您也可以对这两个文件夹的源文件执行相同的操作。 ``make`` 和 ``CMake`` 并处理示例和演示，因此无需额外在这些情况下需要采取的行动。


Configuration file（修改配置文件）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There is a configuration header file for LVGL called **lv_conf.h**. You
can modify this header to set the library's basic behavior, disable unused
modules and features, adjust the size of buffers in compile-time,
etc.

To get ``lv_conf.h`` **copy lvgl/lv_conf_template.h** next to the
``lvgl`` directory and rename it to *lv_conf.h*. Open the file and
change the ``#if 0`` at the beginning to ``#if 1`` to enable its
content. So the layout of the files should look like this:

::

   |-lvgl
   |-lv_conf.h
   |-other files and folders

Comments in the config file explain the meaning of the options. Be sure
to set at least :c:macro:`LV_COLOR_DEPTH` according to your display's color
depth. Note that, the examples and demos explicitly need to be enabled
in ``lv_conf.h``.

Alternatively, ``lv_conf.h`` can be copied to another place but then you
should add the :c:macro:`LV_CONF_INCLUDE_SIMPLE` define to your compiler
options (e.g. ``-DLV_CONF_INCLUDE_SIMPLE`` for GCC compiler) and set the
include path manually (e.g. ``-I../include/gui``). In this case LVGL
will attempt to include ``lv_conf.h`` simply with
``#include "lv_conf.h"``.

You can even use a different name for ``lv_conf.h``. The custom path can
be set via the :c:macro:`LV_CONF_PATH` define. For example
``-DLV_CONF_PATH="/home/joe/my_project/my_custom_conf.h"``

If :c:macro:`LV_CONF_SKIP` is defined, LVGL will not try to include
``lv_conf.h``. Instead you can pass the config defines using build
options. For example ``"-DLV_COLOR_DEPTH=32 -DLV_USE_BUTTON=1"``. The unset
options will get a default value which is the same as the content of
``lv_conf_template.h``.

LVGL also can be used via ``Kconfig`` and ``menuconfig``. You can use
``lv_conf.h`` together with Kconfig too, but keep in mind that the value
from ``lv_conf.h`` or build settings (``-D...``) overwrite the values
set in Kconfig. To ignore the configs from ``lv_conf.h`` simply remove
its content, or define :c:macro:`LV_CONF_SKIP`.

To enable multi-instance feature, set :c:macro:`LV_GLOBAL_CUSTOM` in
``lv_conf.h`` and provide a custom function to
:cpp:func:`lv_global_default` using ``__thread`` or ``pthread_key_t``.
It will allow running multiple LVGL instances by storing the global variables
in TLS (Thread Local Storage).

For example:

.. raw:: html

   </details> 
   <br>


有一个名为 **lv_conf.h** 的 LVGL 配置头文件。您可以修改此标头以设置库的基本行为、禁用未使用的模块和功能、在编译时调整内存缓冲区的大小等。

要获取 ``lv_conf.h``，复制 lvgl 目录旁边的 **lvgl/lv_conf_template.h ** 并将其重命名为 lv_conf.h。打开文件并将开头的“#if 0”更改为“#if 1”以启用其内容。因此，文件的布局应如下所示：

::

   |-lvgl
   |-lv_conf.h
   |-other files and folders

配置文件中的注释解释了选项的含义。确定至少 :c:macro:`LV_COLOR_DEPTH` 根据显示器的颜色进行设置深度。请注意，明确需要启用示例和演示在 `lv_conf.h``中。

或者， ``lv_conf.h``  可以复制到另一个地方，但随后你应该将:c:macro:`LV_CONF_INCLUDE_SIMPLE` 定义添加到编译器中选项（例如 ``-DLV_CONF_INCLUDE_SIMPLE``  对于GCC编译器），并手动包含路径（例如 ``-I../include/gui`` ）。在本例中为 LVGL 将尝试简单地将 ``lv_conf.h`` 包含在 ``#include "lv_conf.h"``。

您甚至可以为 ``lv_conf.h``使用不同的名称。自定义路径可以通过 :c:macro:`LV_CONF_PATH` 定义进行设置。例如 ``-DLV_CONF_PATH="/home/joe/my_project/my_custom_conf.h"``。

如果 :c:macro:`LV_CONF_SKIP` 已定义，则 LVGL 不会尝试包含 ``lv_conf.h``。相反，您可以使用 build 传递配置定义选项。例如 ``"-DLV_COLOR_DEPTH=32 -DLV_USE_BUTTON=1"``。未设置 options 将获得一个默认值，该值与 ``lv_conf_template.h``的内容相同。

LVGL 也可以通过 ``Kconfig`` 和 ``menuconfig`` 使用。您也可以 ``lv_conf.h`` 与 Kconfig 一起使用，但请记住，值从 ``lv_conf.h`` 或 生成设置 (``-D...``) 覆盖值在 Kconfig 中设置。要忽略配置，只需删除 ``lv_conf.h`` 其内容，或定义:c:macro:`LV_CONF_SKIP`。

要启用多实例功能，需要在 ``lv_conf.h`` 文件中设置 :c:macro:`LV_GLOBAL_CUSTOM` , 并使用 ``__thread`` 或 ``pthread_key_t`` 为 :cpp:func:`lv_global_default` 提供自定义函数。 它将允许通过存储全局变量来运行多个 LVGL 实例 在 TLS（线程本地存储）中。

例如：


.. code:: c

   lv_global_t * lv_global_default(void)
   {
     static __thread lv_global_t lv_global;
     return &lv_global;
   }


Initialization（初始化）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To use the graphics library you have to initialize it and setup required
components. The order of the initialization is:

1. Call :cpp:func:`lv_init`.
2. Initialize your drivers.
3. Register the display and input devices drivers in LVGL. Learn more
   about `Display </porting/display>`__ and `Input
   device </porting/indev>`__ registration.
4. Call :cpp:expr:`lv_tick_inc(x)` every ``x`` milliseconds in an interrupt to
   report the elapsed time to LVGL. `Learn more </porting/tick>`__.
5. Call :cpp:func:`lv_timer_handler` every few milliseconds to handle LVGL
   related tasks. `Learn more </porting/timer-handler>`__.

.. raw:: html

   </details> 
   <br>


要使用图形库，您必须对其进行初始化并进行必要的设置其他组件。初始化的顺序为：

1. 调用lv_init()。

2. 初始化您的驱动程序。

3. 在 LVGL 中注册显示和输入设备驱动程序。详细了解 `显示 </porting/display>`__ 和 `输入设备 </porting/indev>`__ 注册。

4. 在中断中每隔 ``x`` 毫秒调用 :cpp:expr:`lv_tick_inc(x)` 以告知经过的时间。  `了解更多 </porting/tick>`__。

5. 每隔几毫秒调用`lv_timer_handler` 来处理LVGL相关的任务。 `了解更多 </porting/timer-handler>`__ 。