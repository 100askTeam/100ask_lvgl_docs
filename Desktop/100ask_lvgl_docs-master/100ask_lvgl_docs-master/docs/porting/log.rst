.. _logging:

==============
Logging（日志）
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has a built-in *Log* module to inform the user about what is
happening in the library.

.. raw:: html

   </details>
   <br>


LVGL 有内置的 *Log* 模块来向用户告知库中发生的事情。


Log level（日志等级）
********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

To enable logging, set :c:macro:`LV_USE_LOG` in ``lv_conf.h`` and set
:c:macro:`LV_LOG_LEVEL` to one of the following values:

- :c:macro:`LV_LOG_LEVEL_TRACE`: A lot of logs to give detailed information
- :c:macro:`LV_LOG_LEVEL_INFO`: Log important events
- :c:macro:`LV_LOG_LEVEL_WARN`: Log if something unwanted happened but didn't cause a problem
- :c:macro:`LV_LOG_LEVEL_ERROR`: Only critical issues, where the system may fail
- :c:macro:`LV_LOG_LEVEL_USER`: Only user messages
- :c:macro:`LV_LOG_LEVEL_NONE`: Do not log anything

The events which have a higher level than the set log level will be
logged too. E.g. if you :c:macro:`LV_LOG_LEVEL_WARN`, errors will be also
logged.

.. raw:: html

   </details>
   <br>


要启用日志记录，请在 ``lv_conf.h`` 中设置 :c:macro:`LV_USE_LOG` 并将 :c:macro:`LV_LOG_LEVEL` 设置为以下值之一：

- :c:macro:`LV_LOG_LEVEL_TRACE`: 大量日志提供详细信息
- :c:macro:`LV_LOG_LEVEL_INFO`: 记录重要事件
- :c:macro:`LV_LOG_LEVEL_WARN`: 记录是否发生了不想要的事情但没有引起问题
- :c:macro:`LV_LOG_LEVEL_ERROR`: 只有关键问题，系统可能会失败
- :c:macro:`LV_LOG_LEVEL_USER`: 仅用户消息
- :c:macro:`LV_LOG_LEVEL_NONE`: 不记录任何内容

级别高于设置的日志级别的事件也将被记录。例如。如果你 :c:macro:`LV_LOG_LEVEL_WARN`，错误也会被记录。


Printing logs（打印日志）
************************

Logging with printf（使用 printf 记录）
--------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If your system supports ``printf``, you just need to enable
:c:macro:`LV_LOG_PRINTF` in ``lv_conf.h`` to send the logs with ``printf``.

.. raw:: html

   </details>
   <br>


如果你的系统支持 ``printf``，你只需要在 ``lv_conf.h`` 中启用 :c:macro:`LV_LOG_PRINTF` 就可以发送带有 ``printf`` 的日志。


Custom log function（自定义日志功能）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

If you can't use ``printf`` or want to use a custom function to log, you
can register a "logger" callback with :cpp:func:`lv_log_register_print_cb`.

For example:

.. raw:: html

   </details>
   <br>


如果你不能使用 ``printf`` 或者想使用自定义函数来记录日志，你可以使用 :cpp:func:`lv_log_register_print_cb` 注册一个“记录器”回调。

例如：

.. code:: c

   void my_log_cb(lv_log_level_t level, const char * buf)
   {
     serial_send(buf, strlen(buf));
   }

   ...


   lv_log_register_print_cb(my_log_cb);

Add logs（添加日志）
*******************

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can also use the log module via the
``LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)`` or ``LV_LOG(text)``
functions. Here:

-  ``LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)`` append following information to your ``text``
-  Log Level
-  \__FILE\_\_
-  \__LINE\_\_
-  \__func\_\_
-  ``LV_LOG(text)`` is similar to ``LV_LOG_USER`` but has no extra information attached.

.. raw:: html

   </details>
   <br>


您还可以通过 ``LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)`` 和 ``LV_LOG(text)`` 函数使用日志模块。这里：


-  ``LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)`` append following information to your ``text``
-  Log Level（日志级别）
-  \__FILE\_\_（文件名）
-  \__LINE\_\_（行号）
-  \__func\_\_（函数名）
-  ``LV_LOG(text)`` 与 ``LV_LOG_USER`` 类似，但没有附加额外信息.


API
***
