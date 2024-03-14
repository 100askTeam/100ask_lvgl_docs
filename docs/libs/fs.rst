.. _libs_filesystem:

====================================
File System Interfaces（文件系统接口）
====================================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has a :ref:`overview_file_system` module
to provide an abstraction layer for various file system drivers.

LVG has built in support for:

- `FATFS <http://elm-chan.org/fsw/ff/00index_e.html>`__
- STDIO (Linux and Windows using C standard function .e.g ``fopen``, ``fread``)
- POSIX (Linux and Windows using POSIX function .e.g ``open``, ``read``)
- WIN32 (Windows using Win32 API function .e.g ``CreateFileA``, ``ReadFile``)
- MEMFS (read a file from a memory buffer)
- LITTLEFS (a little fail-safe filesystem designed for microcontrollers)

You still need to provide the drivers and libraries, this extension
provides only the bridge between FATFS, STDIO, POSIX, WIN32 and LVGL.

.. raw:: html

   </details>
   <br>


LVGL 有一个文件系统模块，可为各种类型的文件系统驱动程序提供一个通用的抽象层接口。

LVG 内置支持以下文件系统：

- `FATFS <http://elm-chan.org/fsw/ff/00index_e.html>`__
- STDIO (Linux 和 Windows 都可以使用的 C 标准函数接口，比如： ``fopen``, ``fread``)
- POSIX (Linux 和 Windows 都可以使用的 POSIX 函数接口，比如： ``open``, ``read``)
- WIN32 (Windows 使用 Win32 API 函数接口比如： ``CreateFileA``, ``ReadFile``)
- MEMFS (从内存缓冲区读取文件)
- LITTLEFS (一种为微控制器设计的小型故障安全文件系统)

您仍然需要提供驱动程序和库，此扩展 仅提供 FATFS、STDIO、POSIX、WIN32 和 LVGL 之间的桥梁。


.. _libs_filesystem_usage:

Usage（用法）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In ``lv_conf.h`` enable ``LV_USE_FS_...`` and assign an upper cased
letter to ``LV_FS_..._LETTER`` (e.g. ``'S'``). After that you can access
files using that driver letter. E.g. ``"S:path/to/file.txt"``.

The work directory can be set with ``LV_FS_..._PATH``. E.g.
``"/home/joe/projects/"`` The actual file/directory paths will be
appended to it.

Cached reading is also supported if ``LV_FS_..._CACHE_SIZE`` is set to
not ``0`` value. :cpp:func:`lv_fs_read` caches this size of data to lower the
number of actual reads from the storage.

To use the memory-mapped file emulation an ``lv_fs_path_ex_t`` object must be
created and initialized. This object can be passed to :cpp:func:`lv_fs_open` as
the file name:

.. code:: c

  lv_fs_path_ex_t mempath;
  lv_fs_file_t file;
  uint8_t *buffer;
  uint32_t size;

  /*Initialize buffer*/
  ...

  lv_fs_make_path_from_buffer(&mempath, LV_FS_MEMFS_LETTER, (void*)buffer, size);
  lv_fs_res_t res = lv_fs_open(&file, (const char *)&mempath, LV_FS_MODE_RD);

.. raw:: html

   </details>
   <br>


如果你使用的是上面说到的几种文件系统(并且本身可以正常工作)，那么可以根据自己的文件系统在 ``lv_conf.h`` 中打开 ``LV_USE_FS_...`` 然后在 ``LV_FS_..._LETTER`` 分配一个盘符(驱动程序号) (一般是大写字母，比如： ``'S'``)

之后，您就可以通过lvgl提供的文件系统接口访问指定的盘符中的文件。例如： ``"S:path/to/file.txt"``。

你可以通过设置 ``LV_FS_..._PATH`` 来指定一个工作目录，比如： ``"/home/joe/projects/"`` 。 实际的文件/目录路径将附加到它上面， 比如：访问  ``"/home/joe/projects/file.txt"`` 时，直接写  ``"file.txt"`` 即可。

lvgl的文件系统抽象接口支持设置文件访问缓冲区，可以通过设置 ``LV_FS_..._CACHE_SIZE`` 的值来指定缓冲区的大小(默认是0)，这样的好处是可以减少对从存储设备的实际操作次数，提高效率。

要使用内存映射文件仿真，对象必须创建并初始化。此对象可以作为文件名： ``lv_fs_path_ex_t`` 

若要使用内存映射文件仿真，必须为 ``lv_fs_path_ex_t`` 对象创建并初始化。此对象可以传递给 :cpp:func:`lv_fs_open` 作为文件名：

.. code:: c

  lv_fs_path_ex_t mempath;
  lv_fs_file_t file;
  uint8_t *buffer;
  uint32_t size;

  /*Initialize buffer*/
  ...

  lv_fs_make_path_from_buffer(&mempath, LV_FS_MEMFS_LETTER, (void*)buffer, size);
  lv_fs_res_t res = lv_fs_open(&file, (const char *)&mempath, LV_FS_MODE_RD);


.. _libs_filesystem_api:

API
***

