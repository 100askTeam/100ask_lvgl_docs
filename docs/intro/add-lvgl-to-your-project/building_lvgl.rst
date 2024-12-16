.. _building_lvgl:

=========================
Building LVGL（构建 LVGL）
=========================


Make and CMake
**************
.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL also supports ``make`` and ``CMake`` build systems out of the box.
To add LVGL to your Makefile based build system add these lines to your
main Makefile:

.. code-block:: make

    LVGL_DIR_NAME ?= lvgl     #The name of the lvgl folder (change this if you have renamed it)
    LVGL_DIR ?= ${shell pwd}  #The path where the lvgl folder is
    include $(LVGL_DIR)/$(LVGL_DIR_NAME)/lvgl.mk

For integration with CMake take a look this section of the
:ref:`Documentation <build_cmake>`.

.. raw:: html

   </details> 
   <br>

LVGL 开箱即用，同样支持 ``make`` 和 ``CMake`` 构建系统。
要将 LVGL 添加到基于 Makefile 的构建系统中，需将以下几行内容添加到主 Makefile 文件里：

.. code-block:: make

    LVGL_DIR_NAME?= lvgl    #LVGL 文件夹的名称（如果已重命名则更改此项）
    LVGL_DIR?= ${shell pwd} #LVGL文件夹所在的路径
    include $(LVGL_DIR)/$(LVGL_DIR_NAME)/lvgl.mk

若要与 CMake 进行集成，请查看 :ref:`Documentation <build_cmake>` 部分的相关内容。

Managed builds
**************
TODO

