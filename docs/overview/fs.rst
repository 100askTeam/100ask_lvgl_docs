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

.. raw:: html

   </details>
   <br>


LVGL有一个“文件系统”抽象模块，可以让你连接任何类型的文件系统。文件系统通过分配的驱动器号来识别。
例如，如果SD卡与字母 ``'S'``关联，可以使用 ``"S:path/to/file.txt"`` 来访问文件。


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
了解更多信息，请参阅:ref:`这里 <libs_filesystem>`。


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


添加驱动程序时，需要像下面这样初始化一个:cpp:type:`lv_fs_drv_t` 类型的变量。
:cpp:type:`lv_fs_drv_t` 变量需要是静态的、全局的或者动态分配的，不能是局部变量。

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


``open_cb``的原型如下：

.. code:: c

   void * (*open_cb)(lv_fs_drv_t * drv, const char * path, lv_fs_mode_t mode);

``path``是驱动器字母后的路径（例如"S:path/to/file.txt" -> "path/to/file.txt"）。
``mode`` 可以是:cpp:enumerator: `LV_FS_MODE_WR`或:cpp:enumerator:`LV_FS_MODE_RD`，用于进行写入或读取打开。

返回值是指向描述打开文件的 *文件对象*的指针，如果存在任何问题（例如文件未找到），则返回 ``NULL``。
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

在 :cpp:func:`lv_fs_open`中的模式可以是 :cpp:enumerator:`LV_FS_MODE_WR` ，用于仅打开写入，或:cpp:enumerator:`LV_FS_MODE_RD` ``|`` :cpp:enumerator:`LV_FS_MODE_WR` 用于两者都可以

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


:ref:`Image <lv_image>`对象也可以从文件中打开（除了编译程序中存储的变量）。

要在图像小部件中使用文件，需要以下回调函数：

- 打开
- 关闭
- 读取
- 定位
- 告诉


.. _overview_file_system_api:

API
***
