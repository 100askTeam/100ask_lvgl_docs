.. _file_explorer:

=============================
File Explorer（文件资源管理器）
=============================

.. raw:: html

   <details>
     <summary>显示原文</summary>

``lv_file_explorer`` provides an API to browse the contents of the file
system. ``lv_file_explorer`` only provides the file browsing function,
but does not provide the actual file operation function. In other words,
you can't click a picture file to open and view the picture like a PC.
``lv_file_explorer`` will tell you the full path and name of the
currently clicked file. The file operation function needs to be
implemented by the user.

The file list in ``lv_file_explorer`` is based on
:ref:`lv_table`, and the quick access bar is based on
:ref:`lv_list`. Therefore, care should be taken to ensure
that :ref:`lv_table` and :ref:`lv_list` are
enabled.

.. raw:: html

   </details>
   <br>

``lv_file_explorer`` 提供了一个用于浏览文件系统内容的 API。 ``lv_file_explorer`` 仅提供文件浏览功能，但不提供实际的文件操作功能。换句话说，您无法像在 PC 上一样点击图片文件来打开和查看图片。
``lv_file_explorer`` 会告诉您当前点击文件的完整路径和名称。文件操作功能需要由用户自行实现。

``lv_file_explorer`` 中的文件列表基于 :ref:`lv_table`，而快速访问栏基于 :ref:`lv_list`。因此，需要确保 :ref:`lv_table` 和 :ref:`lv_list` 已启用。


.. _file_explorer_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FILE_EXPLORER` in ``lv_conf.h``.

First use :cpp:expr:`lv_file_explorer_create(lv_screen_active())` to create a file
explorer, The default size is the screen size. After that, you can
customize the style like widget.

.. raw:: html

   </details>
   <br>

在 ``lv_conf.h`` 中启用 :c:macro:`LV_USE_FILE_EXPLORER`。

首先使用 :cpp:expr:`lv_file_explorer_create(lv_screen_active())` 创建一个文件浏览器，默认尺寸为屏幕大小。之后，您可以像自定义其他部件一样自定义样式。


Quick access（快速访问）
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

The quick access bar is optional. You can turn off
:c:macro:`LV_FILE_EXPLORER_QUICK_ACCESS` in ``lv_conf.h`` so that the quick
access bar will not be created. This can save some memory, but not much.
After the quick access bar is created, it can be hidden by clicking the
button at the top left corner of the browsing area, which is very useful
for small screen devices.

You can use
:cpp:expr:`lv_file_explorer_set_quick_access_path(file_explorer, LV_FILE_EXPLORER_QA_XX, "path")`
to set the path of the quick access bar. The items of the quick access
bar are fixed. Currently, there are the following items:

-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_HOME`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_MUSIC`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_PICTURES`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_VIDEO`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_DOCS`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_MNT`
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_FS`

.. raw:: html

   </details>
   <br>


快速访问栏是可选的。您可以在 ``lv_conf.h`` 中关闭 :c:macro:`LV_FILE_EXPLORER_QUICK_ACCESS`，这样就不会创建快速访问栏。这可以节省一些内存，但不会太多。
快速访问栏创建后，可以通过点击浏览区域左上角的按钮来隐藏，这对于小屏幕设备非常有用。

您可以使用  
:cpp:expr:`lv_file_explorer_set_quick_access_path(file_explorer, LV_FILE_EXPLORER_QA_XX, "path")`  
来设置快速访问栏的路径。快速访问栏的项目是固定的。目前包括以下项目：

-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_HOME`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_MUSIC`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_PICTURES`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_VIDEO`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_DOCS`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_MNT`  
-  :cpp:enumerator:`LV_FILE_EXPLORER_QA_FS`  


.. _file_explorer_sort:

Sort（排序）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can use
:cpp:expr:`lv_file_explorer_set_sort(file_explorer, LV_EXPLORER_SORT_XX)` to set
sorting method.

There are the following sorting methods:

-  :cpp:enumerator:`LV_EXPLORER_SORT_NONE`
-  :cpp:enumerator:`LV_EXPLORER_SORT_KIND`

You can customize the sorting. Before custom sort, please set the
default sorting to :cpp:enumerator:`LV_EXPLORER_SORT_NONE`. The default is
:cpp:enumerator:`LV_EXPLORER_SORT_NONE`.

.. raw:: html

   </details>
   <br>

您可以使用  
:cpp:expr:`lv_file_explorer_set_sort(file_explorer, LV_EXPLORER_SORT_XX)`  
来设置排序方法。

以下是可用的排序方法：

-  :cpp:enumerator:`LV_EXPLORER_SORT_NONE`  
-  :cpp:enumerator:`LV_EXPLORER_SORT_KIND`  

您可以自定义排序。在自定义排序之前，请将默认排序设置为 :cpp:enumerator:`LV_EXPLORER_SORT_NONE`。
默认排序方式为 :cpp:enumerator:`LV_EXPLORER_SORT_NONE`。

.. _file_explorer_events:

Events（事件）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  :cpp:enumerator:`LV_EVENT_READY` Sent when a directory is opened. You can customize
   the sort.
-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` Sent when an item (file) in the file list
   is clicked.

You can use :cpp:func:`lv_file_explorer_get_cur_path` to get the current path
and :cpp:func:`lv_file_explorer_get_sel_fn` to get the name of the currently
selected file in the event processing function. For example:

.. code-block:: c

   static void file_explorer_event_handler(lv_event_t * e)
   {
       lv_event_code_t code = lv_event_get_code(e);
       lv_obj_t * obj = lv_event_get_target(e);

       if(code == LV_EVENT_VALUE_CHANGED) {
           char * cur_path =  lv_file_explorer_get_cur_path(widget);
           char * sel_fn = lv_file_explorer_get_sel_fn(widget);
           LV_LOG_USER("%s%s", cur_path, sel_fn);
       }
   }

You can also save the obtained **path** and **file** name into an array
through functions such as :cpp:func:`strcpy` and :cpp:func:`strcat` for later use.

.. raw:: html

   </details>
   <br>

-  :cpp:enumerator:`LV_EVENT_READY` 在打开目录时发送。您可以自定义排序。  
-  :cpp:enumerator:`LV_EVENT_VALUE_CHANGED` 在文件列表中的某个项目（文件）被点击时发送。

您可以在事件处理函数中使用 :cpp:func:`lv_file_explorer_get_cur_path` 获取当前路径，并使用 :cpp:func:`lv_file_explorer_get_sel_fn` 获取当前选中文件的名称。例如：

.. code-block:: c

   static void file_explorer_event_handler(lv_event_t * e)
   {
       lv_event_code_t code = lv_event_get_code(e);
       lv_obj_t * obj = lv_event_get_target(e);

       if(code == LV_EVENT_VALUE_CHANGED) {
           char * cur_path =  lv_file_explorer_get_cur_path(widget);
           char * sel_fn = lv_file_explorer_get_sel_fn(widget);
           LV_LOG_USER("%s%s", cur_path, sel_fn);
       }
   }

您还可以通过 :cpp:func:`strcpy` 和 :cpp:func:`strcat` 等函数，将获取到的 **路径** 和 **文件名** 保存到数组中以供后续使用。

.. _file_explorer_example:

Example
-------

.. include:: ../../examples/others/file_explorer/index.rst

.. _file_explorer_api:

API
---

