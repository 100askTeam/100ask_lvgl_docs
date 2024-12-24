.. _obj_id:

==================
Widget ID（对象ID）
==================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL provides an optional field in :cpp:type:`lv_obj_t` to store the Widget ID.
Widget ID can be used in many cases, for example, to identify the Widget.
Or we can store a program backtrace to where the Widget is created.

.. raw:: html

   </details>
   <br>


LVGL 在 :cpp:type:`lv_obj_t` 中提供了一个可选字段，用于存储 Widget ID。  
Widget ID 可以在许多情况下使用，例如，用于标识 Widget。  
或者我们可以存储 Widget 创建时的程序回溯信息。


.. _obj_id_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable this feature by setting :c:macro:`LV_USE_OBJ_ID` to `1` in ``lv_conf.h``.

Enable :c:macro:`LV_OBJ_ID_AUTO_ASSIGN` to automatically assign an ID to Widget when it's created.
It's done by calling function :cpp:func:`lv_obj_assign_id` from :cpp:func:`lv_obj_constructor`.

You can either use your own ID generator by defining the function :cpp:func:`lv_obj_assign_id` or you can utilize the built-in one.
To use the builtin ID generator, set :c:macro:`LV_USE_OBJ_ID_BUILTIN` to `1`.

You can directly access the ID by :cpp:expr:`lv_obj_get_id(widget)` or use API :cpp:expr:`lv_obj_stringify_id(widget, buf, len)`
to get a string representation of the ID.

.. raw:: html

   </details>
   <br>


通过在 ``lv_conf.h`` 中将 :c:macro:`LV_USE_OBJ_ID` 设置为 `1` 来启用此功能。

启用 :c:macro:`LV_OBJ_ID_AUTO_ASSIGN` 可以在创建 Widget 时自动分配一个 ID。这是通过在 :cpp:func:`lv_obj_constructor` 中调用函数 :cpp:func:`lv_obj_assign_id` 实现的。

你可以通过定义自己的 :cpp:func:`lv_obj_assign_id` 函数来自定义 ID 生成器，或者使用内置的生成器。若要使用内置 ID 生成器，请将 :c:macro:`LV_USE_OBJ_ID_BUILTIN` 设置为 `1`。

可以通过 :cpp:expr:`lv_obj_get_id(widget)` 直接访问 ID，或者使用 API :cpp:expr:`lv_obj_stringify_id(widget, buf, len)` 获取 ID 的字符串表示形式。


Use custom ID generator（使用自定义的ID生成器）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Set :c:macro:`LV_USE_OBJ_ID_BUILTIN` to `0` in ``lv_conf.h``.

Below APIs needed to be implemented and linked to lvgl.

.. code-block:: c

    void lv_obj_set_id(lv_obj_t * widget, void * id);
    void lv_obj_assign_id(const lv_obj_class_t * class_p, lv_obj_t * widget);
    void lv_obj_free_id(lv_obj_t * widget);
    const char * lv_obj_stringify_id(lv_obj_t * widget, char * buf, uint32_t len);
    int lv_obj_id_compare(void * id1, void * id2);


:cpp:func:`lv_obj_assign_id` is called when a Widget is created. The Widget final class is passed from
parameter ``class_p``. Note it may be different than :cpp:expr:`obj->class_p` which is the class
currently being constructed.

:cpp:func:`lv_obj_free_id` is called when Widget is deconstructed. Free any resource allocated in :cpp:func:`lv_obj_assign_id`.

:cpp:func:`lv_obj_stringify_id` converts id to a string representation. The string is stored in ``buf``.

.. raw:: html

   </details>
   <br>


设置 :c:macro:`LV_USE_OBJ_ID_BUILTIN` 为 `0` 在 ``lv_conf.h`` 中。

以下 API 需要被实现并链接到 lvgl 中。

.. code-block:: c

    void lv_obj_set_id(lv_obj_t * widget, void * id);
    void lv_obj_assign_id(const lv_obj_class_t * class_p, lv_obj_t * widget);
    void lv_obj_free_id(lv_obj_t * widget);
    const char * lv_obj_stringify_id(lv_obj_t * widget, char * buf, uint32_t len);
    int lv_obj_id_compare(void * id1, void * id2);

:cpp:func:`lv_obj_assign_id` 在创建 Widget 时被调用。参数 ``class_p`` 传入最终的 Widget 类。注意，它可能与 :cpp:expr:`obj->class_p` 不同，后者是当前正在构建的类。

:cpp:func:`lv_obj_free_id` 在 Widget 被析构时调用。释放在 :cpp:func:`lv_obj_assign_id` 中分配的任何资源。

:cpp:func:`lv_obj_stringify_id` 将 id 转换为字符串表示形式。字符串存储在 ``buf`` 中。


Dump Widget Tree（转储对象树）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use API ``lv_obj_dump_tree(lv_obj_t * widget, int depth)`` to dump the Widget Tree.
It will walk through all children and print the Widget ID together with Widget address.

This is useful to debug UI crash. From log we can rebuilt UI the moment before crash.
For example, if the obj is stored to a :cpp:expr:`timer->user_data`, but obj is deleted when timer expired.
Timer callback will crash because of accessing wild pointer.
From the dump log we can clearly see that the obj does not exist.

.. raw:: html

   </details>
   <br>


使用 API ``lv_obj_dump_tree(lv_obj_t * widget, int depth)`` 来导出 Widget Tree。

该函数会遍历所有子节点，并打印出 Widget ID 和 Widget 地址。

这对于调试 UI 崩溃非常有用。从日志中可以重建崩溃前一刻的 UI 状态。  
例如，如果某个 obj 被存储在 :cpp:expr:`timer->user_data` 中，但在定时器到期后 obj 被删除。  
此时，定时器回调函数由于访问了野指针而导致崩溃。  
通过导出日志，我们可以清楚地看到该 obj 已经不存在。


Find child by ID（通过ID查找子对象）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use API ``lv_obj_t * lv_obj_get_child_by_id(const lv_obj_t * widget, void * id)`` to find a child by ID.
It will walk through all children and return the first child with the given ID.

.. raw:: html

   </details>
   <br>


使用API ``lv_obj_t * lv_obj_get_child_by_id(const lv_obj_t * widget, void * id)`` 可以通过ID查找子对象。
该函数将遍历所有的子对象，并返回第一个具有给定ID的子对象。
