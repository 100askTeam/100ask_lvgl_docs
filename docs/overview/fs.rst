.. _overview_file_system:

=======================
File system（文件系统）
=======================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has a 'File system' abstraction module that enables you to attach
any type of file system. A file system is identified by an assigned
drive letter. For example, if an SD card is associated with the letter
``'S'``, a file can be reached using ``"S:path/to/file.txt"``.

.. note::

	If you want to skip the drive prefix from the path, you can use the :c:macro:`LV_FS_DEFAULT_DRIVE_LETTER` config parameter.


.. raw:: html

   </details>
   <br>


LVGL有一个“文件系统”抽象模块，可以让你连接任何类型的文件系统。文件系统通过分配的驱动器盘符来识别。
例如，如果SD卡与盘符 ``'S'`` 关联，可以使用 ``"S:path/to/file.txt"`` 来访问文件。

.. note::

	如果你想在路径中省略驱动器前缀，可以使用 :c:macro:`LV_FS_DEFAULT_DRIVE_LETTER` 配置参数。



Ready to use drivers（准备使用驱动程序）
***************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL contains prepared drivers for the API of POSIX, standard C,
Windows, and `FATFS <http://elm-chan.org/fsw/ff/00index_e.html>`__.
Learn more :ref:`here <libs_filesystem>`.

.. raw:: html

   </details>
   <br>


LVGL包含了对POSIX、标准C、Windows和 `FATFS <http://elm-chan.org/fsw/ff/00index_e.html>`__ API的预置驱动程序。
了解更多信息，请参阅 :ref:`这里 <libs_filesystem>`。


Adding a driver（添加驱动程序）
******************************

Registering a driver（注册驱动）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To add a driver, a :cpp:type:`lv_fs_drv_t` needs to be initialized like below.
The :cpp:type:`lv_fs_drv_t` needs to be static, global or dynamically allocated
and not a local variable.

.. code:: c

   static lv_fs_drv_t drv;                   /*Needs to be static or global*/
   lv_fs_drv_init(&drv);                     /*Basic initialization*/

   drv.letter = 'S';                         /*An uppercase letter to identify the drive */
   drv.cache_size = my_cache_size;           /*Cache size for reading in bytes. 0 to not cache.*/

   drv.ready_cb = my_ready_cb;               /*Callback to tell if the drive is ready to use */
   drv.open_cb = my_open_cb;                 /*Callback to open a file */
   drv.close_cb = my_close_cb;               /*Callback to close a file */
   drv.read_cb = my_read_cb;                 /*Callback to read a file */
   drv.write_cb = my_write_cb;               /*Callback to write a file */
   drv.seek_cb = my_seek_cb;                 /*Callback to seek in a file (Move cursor) */
   drv.tell_cb = my_tell_cb;                 /*Callback to tell the cursor position  */

   drv.dir_open_cb = my_dir_open_cb;         /*Callback to open directory to read its content */
   drv.dir_read_cb = my_dir_read_cb;         /*Callback to read a directory's content */
   drv.dir_close_cb = my_dir_close_cb;       /*Callback to close a directory */

   drv.user_data = my_user_data;             /*Any custom data if required*/

   lv_fs_drv_register(&drv);                 /*Finally register the drive*/

Any of the callbacks can be ``NULL`` to indicate that operation is not
supported.

.. raw:: html

   </details>
   <br>


添加驱动程序时，需要像下面这样初始化一个 :cpp:type:`lv_fs_drv_t` 类型的变量。
:cpp:type:`lv_fs_drv_t` 类型的变量需要是静态的、全局的或者动态分配的，不能是局部变量。

.. code:: c

   static lv_fs_drv_t drv;                   /* 需要是静态的或全局的 */
   lv_fs_drv_init(&drv);                     /* 基本初始化 */

   drv.letter = 'S';                         /* 用一个大写字母来标识驱动器 */
   drv.cache_size = my_cache_size;           /* 读取缓存大小（以字节为单位）。0 表示不进行缓存。*/

   drv.ready_cb = my_ready_cb;               /* 通知驱动器是否可以使用的回调函数 */
   drv.open_cb = my_open_cb;                 /* 打开文件的回调函数 */
   drv.close_cb = my_close_cb;               /* 关闭文件的回调函数 */
   drv.read_cb = my_read_cb;                 /* 读取文件的回调函数 */
   drv.write_cb = my_write_cb;               /* 写入文件的回调函数 */
   drv.seek_cb = my_seek_cb;                 /* 在文件中寻找（移动游标）的回调函数 */
   drv.tell_cb = my_tell_cb;                 /* 获取游标位置的回调函数 */

   drv.dir_open_cb = my_dir_open_cb;         /* 打开目录以读取其中内容的回调函数 */
   drv.dir_read_cb = my_dir_read_cb;         /* 读取目录内容的回调函数 */
   drv.dir_close_cb = my_dir_close_cb;       /* 关闭目录的回调函数 */

   drv.user_data = my_user_data;             /* 如有需要，可设置任意自定义数据 */

   lv_fs_drv_register(&drv);                 /* 最后注册驱动程序 */

任何回调函数都可以为 `NULL`，表示不支持该操作。


Implementing the callbacks（实现回调）
--------------------------------------

Open callback（打开回调）
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

The prototype of ``open_cb`` looks like this:

.. code:: c

   void * (*open_cb)(lv_fs_drv_t * drv, const char * path, lv_fs_mode_t mode);

``path`` is the path after the drive letter (e.g. "S:path/to/file.txt" -> "path/to/file.txt").
``mode`` can be :cpp:enumerator:`LV_FS_MODE_WR` or :cpp:enumerator:`LV_FS_MODE_RD` to open for writes or reads.

The return value is a pointer to a *file object* that describes the
opened file or ``NULL`` if there were any issues (e.g. the file wasn't
found). The returned file object will be passed to other file system
related callbacks. (see below)

.. raw:: html

   </details>
   <br>


``open_cb`` 的原型如下：

.. code:: c

   void * (*open_cb)(lv_fs_drv_t * drv, const char * path, lv_fs_mode_t mode);

``path`` 是盘符后的路径（例如"S:path/to/file.txt" -> "path/to/file.txt"）。
``mode`` 可以是 :cpp:enumerator:`LV_FS_MODE_WR` 或 :cpp:enumerator:`LV_FS_MODE_RD`，用于进行写入或读取方式打开。

返回值是指向描述打开文件的 *文件对象* 的指针，如果存在任何问题（例如文件未找到），则返回 ``NULL``。
返回的文件对象将传递给其他与文件系统相关的回调函数（见下文）。


Other callbacks（其他回调）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The other callbacks are quite similar. For example ``write_cb`` looks
like this:

.. code:: c

   lv_fs_res_t (*write_cb)(lv_fs_drv_t * drv, void * file_p, const void * buf, uint32_t btw, uint32_t * bw);

For ``file_p``, LVGL passes the return value of ``open_cb``, ``buf`` is
the data to write, ``btw`` is the Bytes To Write, ``bw`` is the actually
written bytes.

For a template of these callbacks see
`lv_fs_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_fs_template.c>`__.

.. raw:: html

   </details>
   <br>


其他的回调函数非常相似。例如， ``write_cb`` 的结构如下：

.. code:: c

   lv_fs_res_t (*write_cb)(lv_fs_drv_t * drv, void * file_p, const void * buf, uint32_t btw, uint32_t * bw);

对于 ``file_p`` 参数，LVGL 传递了 ``open_cb`` 的返回值； ``buf`` 是要写入的数据； ``btw`` 是要写入的字节数； ``bw`` 是实际写入的字节数。

关于这些回调函数的模板，请参考 `lv_fs_template.c <https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_fs_template.c>`__。


Usage example（使用示例）
*************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The example below shows how to read from a file:

.. code:: c

   lv_fs_file_t f;
   lv_fs_res_t res;
   res = lv_fs_open(&f, "S:folder/file.txt", LV_FS_MODE_RD);
   if(res != LV_FS_RES_OK) my_error_handling();

   uint32_t read_num;
   uint8_t buf[8];
   res = lv_fs_read(&f, buf, 8, &read_num);
   if(res != LV_FS_RES_OK || read_num != 8) my_error_handling();

   lv_fs_close(&f);

The mode in :cpp:func:`lv_fs_open` can be :cpp:enumerator:`LV_FS_MODE_WR` to open for writes
only or :cpp:enumerator:`LV_FS_MODE_RD` ``|`` :cpp:enumerator:`LV_FS_MODE_WR` for both

This example shows how to read a directory's content. It's up to the
driver how to mark directories in the result but it can be a good
practice to insert a ``'/'`` in front of each directory name.

.. code:: c

   lv_fs_dir_t dir;
   lv_fs_res_t res;
   res = lv_fs_dir_open(&dir, "S:/folder");
   if(res != LV_FS_RES_OK) my_error_handling();

   char fn[256];
   while(1) {
       res = lv_fs_dir_read(&dir, fn, sizeof(fn));
       if(res != LV_FS_RES_OK) {
           my_error_handling();
           break;
       }

       /*fn is empty, if not more files to read*/
       if(strlen(fn) == 0) {
           break;
       }

       printf("%s\n", fn);
   }

   lv_fs_dir_close(&dir);

.. raw:: html

   </details>
   <br>


以下示例显示如何从文件中读取：

.. code:: c

   lv_fs_file_t f;
   lv_fs_res_t res;
   res = lv_fs_open(&f, "S:folder/file.txt", LV_FS_MODE_RD);
   if(res != LV_FS_RES_OK) my_error_handling();

   uint32_t read_num;
   uint8_t buf[8];
   res = lv_fs_read(&f, buf, 8, &read_num);
   if(res != LV_FS_RES_OK || read_num != 8) my_error_handling();

   lv_fs_close(&f);

在 :cpp:func:`lv_fs_open` 函数中的模式可以是 :cpp:enumerator:`LV_FS_MODE_WR` ，用于仅打开写入，或 :cpp:enumerator:`LV_FS_MODE_RD` ``|`` :cpp:enumerator:`LV_FS_MODE_WR` 用于读写打开

该示例显示如何读取目录的内容。如何标记结果中的目录是由驱动程序决定的，但在每个目录名称前面加上 ``'/'`` 可能是一个很好的做法。

.. code:: c

   lv_fs_dir_t dir;
   lv_fs_res_t res;
   res = lv_fs_dir_open(&dir, "S:/folder");
   if(res != LV_FS_RES_OK) my_error_handling();

   char fn[256];
   while(1) {
       res = lv_fs_dir_read(&dir, fn, sizeof(fn));
       if(res != LV_FS_RES_OK) {
           my_error_handling();
           break;
       }

       /*fn为空，如果没有更多文件可读取*/
       if(strlen(fn) == 0) {
           break;
       }

       printf("%s\n", fn);
   }

   lv_fs_dir_close(&dir);


Use drives for images（使用图像驱动程序）
****************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

:ref:`Image <lv_image>` objects can be opened from files too (besides
variables stored in the compiled program).

To use files in image widgets the following callbacks are required:

- open
- close
- read
- seek
- tell

.. raw:: html

   </details>
   <br>


引用:ref:`Image <lv_image>` 对象也可以从文件中打开（除了编译程序中存储的变量）。

要在图像控件中使用文件，需要以下回调函数：

- 打开
- 关闭
- 读取
- 定位
- 告诉

.. _overview_file_system_cache:

Optional file buffering/caching（可选的文件缓冲/缓存）
****************************************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Files will buffer their reads if the corresponding ``LV_FS_*_CACHE_SIZE``
config option is set to a value greater than zero. Each open file will
buffer up to that many bytes to reduce the number of FS driver calls.

Generally speaking, file buffering can be optimized for different kinds
of access patterns. The one implemented here is optimal for reading large
files in chunks, which is what the image decoder does.
It has the potential to call the driver's ``read`` fewer
times than ``lv_fs_read`` is called. In the best case where the cache size is
\>= the size of the file, ``read`` will only be called once. This strategy is good
for linear reading of large files but less helpful for short random reads across a file bigger than the buffer
since data will be buffered that will be discarded after the next seek and read.
The cache should be sufficiently large or disabled in that case. Another case where the cache should be disabled
is if the file contents are expected to change by an external factor like with special OS files.

The implementation is documented below. Note that the FS functions make calls
to other driver FS functions when the cache is enabled. i.e., ``lv_fs_read`` may call the driver's ``seek``
so the driver needs to implement more callbacks when the cache is enabled.

``lv_fs_read`` :sub:`(behavior when the cache is enabled)`
-------------------------------------------------

.. mermaid::
   :zoom:

   %%{init: {'theme':'neutral'}}%%
   flowchart LR
       A["call lv_fs_read and
          the cache is enabled"] --> B{{"is there cached data
                                         at the file position?"}}
       B -->|yes| C{{"does the cache have
                      all required bytes available?"}}
       C -->|yes| D["copy all required bytes from
                     the cache to the destination
                     buffer"]
       C -->|no| F["copy the available
                    required bytes
                    until the end of the cache
                    into the destination buffer"]
             --> G["seek the real file to the end
                    of what the cache had available"]
             --> H{{"is the number of remaining bytes
                     larger than the size of the whole cache?"}}
       H -->|yes| I["read the remaining bytes
                     from the real file to the
                     destination buffer"]
       H -->|no| J["eagerly read the real file
                    to fill the whole cache
                    or as many bytes as the
                    read call can"]
             --> O["copy the required bytes
                    to the destination buffer"]
       B -->|no| K["seek the real file to
                    the file position"]
             --> L{{"is the number of required
                     bytes greater than the
                     size of the entire cache?"}}
       L -->|yes| M["read the real file to
                     the destination buffer"]
       L -->|no| N["eagerly read the real file
                    to fill the whole cache
                    or as many bytes as the
                    read call can"]
             --> P["copy the required bytes
                    to the destination buffer"]

``lv_fs_write`` :sub:`(behavior when the cache is enabled)`
--------------------------------------------------

The part of the cache that coincides with the written content
will be updated to reflect the written content.

``lv_fs_seek`` :sub:`(behavior when the cache is enabled)`
-------------------------------------------------

The driver's ``seek`` will not actually be called unless the ``whence``
is ``LV_FS_SEEK_END``, in which case ``seek`` and ``tell`` will be called
to determine where the end of the file is.

``lv_fs_tell`` :sub:`(behavior when the cache is enabled)`
-------------------------------------------------

The driver's ``tell`` will not actually be called.


.. raw:: html

   </details>
   <br>


如果相应的 ``LV_FS_*_CACHE_SIZE`` 配置选项设置为大于零的值，文件将缓冲其读取。每个打开的文件将缓冲最多这么多字节，以减少 FS 驱动程序调用的次数。

一般来说，文件缓冲可以针对不同类型的访问模式进行优化。这里实现的缓冲策略对于分块读取大文件是最优的，这就是图像解码器的作用。它有可能减少驱动程序的 ``read`` 比调用 ``lv_fs_read`` 的次数。在缓存大小 >= 文件大小的最佳情况下， ``read`` 只会被调用一次。此策略对于大文件的线性读取很有用，但对于跨大于缓冲区的文件的短随机读取帮助不大，因为数据将被缓冲，这些数据将在下一次查找和读取后被丢弃。在这种情况下，缓存应该足够大或禁用。应禁用缓存的另一种情况是，如果文件内容预计会因外部因素（例如特殊操作系统文件）而发生更改。

下面记录了实施情况。请注意，当启用缓存时，FS 函数会调用其他驱动程序 FS 函数。即， ``lv_fs_read`` 可能会调用驱动程序 ``seek``，因此驱动程序需要在启用缓存时实现更多回调函数。

``lv_fs_read`` :sub:`(启用缓存时的行为)`
-------------------------------------------------

.. mermaid::
   :zoom:

   %%{init: {'theme':'neutral'}}%%
   flowchart LR
       A["call lv_fs_read and
          the cache is enabled"] --> B{{"is there cached data
                                         at the file position?"}}
       B -->|yes| C{{"does the cache have
                      all required bytes available?"}}
       C -->|yes| D["copy all required bytes from
                     the cache to the destination
                     buffer"]
       C -->|no| F["copy the available
                    required bytes
                    until the end of the cache
                    into the destination buffer"]
             --> G["seek the real file to the end
                    of what the cache had available"]
             --> H{{"is the number of remaining bytes
                     larger than the size of the whole cache?"}}
       H -->|yes| I["read the remaining bytes
                     from the real file to the
                     destination buffer"]
       H -->|no| J["eagerly read the real file
                    to fill the whole cache
                    or as many bytes as the
                    read call can"]
             --> O["copy the required bytes
                    to the destination buffer"]
       B -->|no| K["seek the real file to
                    the file position"]
             --> L{{"is the number of required
                     bytes greater than the
                     size of the entire cache?"}}
       L -->|yes| M["read the real file to
                     the destination buffer"]
       L -->|no| N["eagerly read the real file
                    to fill the whole cache
                    or as many bytes as the
                    read call can"]
             --> P["copy the required bytes
                    to the destination buffer"]

``lv_fs_write`` :sub:`(启用缓存时的行为)`
--------------------------------------------------

缓存中与写入内容一致的部分将被更新以反映写入内容。

``lv_fs_seek`` :sub:`(启用缓存时的行为)`
-------------------------------------------------

驱动程序 ``seek`` 实际上不会被调用，除非 ``whence``， ``LV_FS_SEEK_END`` 在这种情况下 ``seek`` ， ``tell`` 将调用 来确定文件结尾在哪里。

The driver's ``seek`` will not actually be called unless the ``whence``
is ``LV_FS_SEEK_END``, in which case ``seek`` and ``tell`` will be called
to determine where the end of the file is.
``lv_fs_tell`` :sub:`(启用缓存时的行为)`
-------------------------------------------------

 ``tell`` 实际上不会调用驱动程序。

.. _overview_file_system_api:

API
***
