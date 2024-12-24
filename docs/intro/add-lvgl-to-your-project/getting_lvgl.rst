.. _getting_lvgl:

========================
Getting LVGL（获取 LVGL）
========================
.. raw:: html

   <details>
     <summary>显示原文</summary>
     
LVGL is available on GitHub: https://github.com/lvgl/lvgl.

You can clone it or
`Download <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__
the latest version of the library from GitHub.

The graphics library itself is the ``lvgl`` directory.  It contains several
directories but to use LVGL you only need the ``.c`` and ``.h`` files under
the ``src`` directory, plus ``lvgl/lvgl.h``, and ``lvgl/lv_version.h``.

.. raw:: html

   </details> 
   <br>

LVGL 在 GitHub 上可用：https://github.com/lvgl/lvgl。

您可以克隆它，或者从 `Download <https://github.com/lvgl/lvgl/archive/refs/heads/master.zip>`__ 库的最新版本。

图形库本身是 ``lvgl`` 目录。它包含几个目录，但要使用 LVGL，您只需要 ``src`` 目录下的 ``.c`` 和 ``.h`` 文件，以及 ``lvgl/lvgl.h`` 和 ``lvgl/lv_version.h``。

Demos and Examples（演示与示例）
--------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``lvgl`` directory also contains an ``examples`` and a ``demos``
directory.  If your project needs examples and/or demos, add the these
directories to your project.  If ``make`` or :ref:`build_cmake` handle the
examples and demos directories, no extra action is required.

.. raw:: html

   </details> 
   <br>

``lvgl`` 目录还包含一个 ``examples``（示例）目录和一个 ``demos``（演示）目录。如果您的项目需要示例和 / 或演示程序，将这些目录添加到您的项目中。如果 ``make``（构建工具）或 :ref:`build_cmake`（CMake 构建方式）能够处理示例和演示目录，则无需额外操作。