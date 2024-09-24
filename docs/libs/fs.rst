.. _libs_filesystem:

=====================================
File System Interfaces（文件系统接口）
=====================================

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
- Arduino ESP LITTLEFS (a little fail-safe filesystem designed for Arduino ESP)
- Arduino SD (allows for reading from and writing to SD cards)

You still need to provide the drivers and libraries, this extension
provides only the bridge between FATFS, STDIO, POSIX, WIN32 and LVGL.

.. raw:: html

   </details>
   <br>


LVGL 有一个文件系统模块，为各种文件系统驱动程序提供抽象层。

LVGL 内置支持以下文件系统：

- `FATFS <http://elm-chan.org/fsw/ff/00index_e.html>`__
- STDIO (Linux 和 Windows 都可以使用的 C 标准函数接口，比如： ``fopen``, ``fread``)
- POSIX (Linux 和 Windows 都可以使用的 POSIX 函数接口，比如： ``open``, ``read``)
- WIN32 (Windows 使用 Win32 API 函数接口比如： ``CreateFileA``, ``ReadFile``)
- MEMFS (从内存缓冲区读取文件)
- LITTLEFS (一种为微控制器设计的小型故障安全文件系统)
- Arduino ESP LITTLEFS（专为 Arduino ESP 设计的小型故障安全文件系统）
- Arduino SD (允许读取和写入 SD 卡)

在实际使用时需要提供相应文件系统的驱动程序和库，此扩展仅提供上述这些文件系统和 LVGL 之间的API统一抽象对接。


.. _libs_filesystem_usage:

Usage（用法）
************

.. raw:: html

   <details>
     <summary>显示原文</summary>

In ``lv_conf.h`` enable ``LV_USE_FS_...`` and assign an upper cased
letter to ``LV_FS_..._LETTER`` (e.g. ``'S'``). After that you can access
files using that driver letter. E.g. ``"S:path/to/file.txt"``.

Working with common prefixes
""""""""""""""""""""""""""""""""""""""""""""

A **default driver letter** can be set by ``LV_FS_DEFAULT_DRIVE_LETTER``,
which allows skipping the drive prefix in file paths.

For example if ``LV_FS_DEFAULT_DRIVE_LETTER`` is set the ``'S'`` *"path/to/file.txt"* will mean *"S:path/to/file.txt"*. 

This feature is useful if you have only a single driver and don't want to bother with LVGL's driver layer in the file paths.
It also helps to use a unified path with LVGL's file system and normal file systems. 
The original mechanism is not affected, so a path starting with drive letter will still work.

The **working directory** can be set with ``LV_FS_..._PATH``. E.g.
``"/home/joe/projects/"`` The actual file/directory paths will be
appended to it, allowing to skip the common part.

.. raw:: html

   </details>
   <br>


如果你使用的是上面说到的几种文件系统(并且本身可以正常工作)，那么可以根据自己的文件系统在 ``lv_conf.h`` 中打开 ``LV_USE_FS_...`` 然后在 ``LV_FS_..._LETTER`` 分配一个盘符(驱动程序号) (一般是大写字母，比如： ``'S'`` )

之后，您就可以通过lvgl提供的文件系统接口访问指定的盘符中的文件。例如： ``"S:path/to/file.txt"`` 。


Working with common prefixes（处理通用前缀）
""""""""""""""""""""""""""""""""""""""""""""


可以通过 ``LV_FS_DEFAULT_DRIVE_LETTER`` 设置一个默认盘符字母，这允许在文件路径中省略盘符前缀。

例如，如果 ``LV_FS_DEFAULT_DRIVE_LETTER`` 设置为 ``'S'`` ， *"path/to/file.txt"* 将表示 *"S:path/to/file.txt"* 。

如果你只有一个盘符并且不想在文件路径中使用 LVGL 的盘符，这个特性非常有用。
它还有助于使用 LVGL 文件系统和普通文件系统的统一路径。
原始机制不受影响，因此以盘符字母开头的路径仍然有效。

工作目录可以通过 ``LV_FS_..._PATH`` 设置。例如 ``"/home/joe/projects/"`` 实际的文件/目录路径将附加到它后面，允许省略公共部分。


Caching（缓存）
"""""""""""""""

.. raw:: html

   <details>
     <summary>显示原文</summary>

:ref:`Cached reading <overview_file_system_cache>` is also supported if ``LV_FS_..._CACHE_SIZE`` is set to
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


如果将 ``LV_FS_..._CACHE_SIZE`` 设置为非 ``0`` 值，那么会支持 :ref:`Cached reading <overview_file_system_cache>` 。  :cpp:func:`lv_fs_read` 会缓存 ``LV_FS_..._CACHE_SIZE`` 设置的数据大小，以减少实际从存储中读取的次数。

要使用内存映射文件模拟，必须创建并初始化一个 ``lv_fs_path_ex_t`` 对象。这个对象可以作为文件名传递给 :cpp:func:`lv_fs_open` :

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

