.. _gdb_plugin:

===========
GDB Plug-In
===========

Debugging LVGL with GDB
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To facilitate debugging LVGL with GDB, a GDB plugin is provided. This plugin
can be found in the ``lvgl/scripts/gdb`` directory. The GDB plugin can be used
with any target where GDB is available. For example, you can use it to debug a
device connected to a PC via JLink, which provides a GDB server. Additionally,
if your device crashes and you have a core dump, you can use GDB to analyze the
core dump. To load the LVGL GDB plugin within GDB's command line, type the
following command:

``source lvgl/scripts/gdb/gdbinit.py``


Example of usage:

.. code:: bash

    (gdb) source lvgl/scripts/gdb/gdbinit.py

    (gdb) dump obj -L 2
    obj@0x60700000dd10 (0,0,799,599)
    tabview@0x608000204ca0 (0,0,799,599)
        obj@0x607000025da0 (0,0,799,69)
        obj@0x607000025e80 (0,70,799,599)
        obj@0x60700002bd70 (743,543,791,591)
        btn@0x60700002c7f0 (747,547,787,587)
    keyboard@0x60d0000f7040 (0,300,799,599)
    dropdown-list@0x608000205420 (0,0,129,129)
        label@0x60d0000f7ba0 (22,22,56,39)
    (gdb)

The plugin provides the following commands.

- ``dump obj``: Dump the object tree.
- ``info style``: Show the object's style.

.. raw:: html

   </details>
   <br>

为了使用GDB调试LVGL，提供了一个GDB插件。该插件位于``lvgl/scripts/gdb``目录中。
GDB插件可以用于任何支持GDB的目标设备。
例如，可以用它调试通过JLink连接到PC的设备，该设备提供了一个GDB服务器。
此外，如果您的设备崩溃并生成了核心转储文件，还可以使用GDB分析核心转储文件。
要在GDB命令行中加载LVGL GDB插件，请输入以下命令：

``source lvgl/scripts/gdb/gdbinit.py``

使用示例：

.. code:: bash

    (gdb) source lvgl/scripts/gdb/gdbinit.py

    (gdb) dump obj -L 2
    obj@0x60700000dd10 (0,0,799,599)
    tabview@0x608000204ca0 (0,0,799,599)
        obj@0x607000025da0 (0,0,799,69)
        obj@0x607000025e80 (0,70,799,599)
        obj@0x60700002bd70 (743,543,791,591)
        btn@0x60700002c7f0 (747,547,787,587)
    keyboard@0x60d0000f7040 (0,300,799,599)
    dropdown-list@0x608000205420 (0,0,129,129)
        label@0x60d0000f7ba0 (22,22,56,39)
    (gdb)

该插件提供以下命令：

- ``dump obj``: 导出对象树。
- ``info style``: 显示对象的样式。


Dump obj tree
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

``dump obj``: Dump the object tree.

``dump obj -L 2``: Dump the object tree with a depth of 2.

``dump obj -a 0x60700000dd10``: Dump the object tree starting from the specified address.

.. raw:: html

   </details>
   <br>

``dump obj``: 导出对象树。

``dump obj -L 2``: 导出深度为2的对象树。

``dump obj -a 0x60700000dd10``: 从指定地址开始导出对象树。

Show obj's style
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This command can dump the object's local style, since style value is a union, it's displayed in all possible formats.

``info style address_of_obj``: Show the object's style.


Example:

.. code:: bash

    (gdb) info style 0x60700000dd10
      32 = {num = 90, ptr = 0x5a, color = {blue = 90 'Z', green = 0 '\000', red = 0 '\000'}}
      158 = {num = 32767, ptr = 0x7fff, color = {blue = 255 '\377', green = 127 '\177', red = 0 '\000'}}
    (gdb) p lv_global->disp_default->act_scr
    $4 = (lv_obj_t *) 0x60700000dd10
    (gdb) info style $4
      32 = {num = 90, ptr = 0x5a, color = {blue = 90 'Z', green = 0 '\000', red = 0 '\000'}}
      158 = {num = 32767, ptr = 0x7fff, color = {blue = 255 '\377', green = 127 '\177', red = 0 '\000'}}
    (gdb)

.. raw:: html

   </details>
   <br>


此命令可以导出对象的本地样式。由于样式值是一个联合体，因此会以所有可能的格式显示。

``info style address_of_obj``: 显示对象的样式。


示例：

.. code:: bash

    (gdb) info style 0x60700000dd10
      32 = {num = 90, ptr = 0x5a, color = {blue = 90 'Z', green = 0 '\000', red = 0 '\000'}}
      158 = {num = 32767, ptr = 0x7fff, color = {blue = 255 '\377', green = 127 '\177', red = 0 '\000'}}
    (gdb) p lv_global->disp_default->act_scr
    $4 = (lv_obj_t *) 0x60700000dd10
    (gdb) info style $4
      32 = {num = 90, ptr = 0x5a, color = {blue = 90 'Z', green = 0 '\000', red = 0 '\000'}}
      158 = {num = 32767, ptr = 0x7fff, color = {blue = 255 '\377', green = 127 '\177', red = 0 '\000'}}
    (gdb)


Connect to Debugger
-------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This command provides the ability to connect and debug GDB Python Script using IDE.

Connect to ``PyCharm`` / ``VSCode`` / ``Eclipse(not support yet)``

``debugger -t pycharm``

``debugger -t vscode``

``debugger -t eclipse``

How to use it specifically, search ``pydevd_pycharm`` / ``debugpy`` for details.

.. raw:: html

   </details>
   <br>

此命令提供通过IDE连接和调试GDB Python Script的能力。

连接到``PyCharm`` / ``VSCode`` / ``Eclipse(暂不支持)``

``debugger -t pycharm``

``debugger -t vscode``

``debugger -t eclipse``

具体使用方法，请搜索``pydevd_pycharm`` / ``debugpy``了解详情。
