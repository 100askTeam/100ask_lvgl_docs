.. _obj_id:

================
OBJ ID（对象ID）
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL provides an optional field in :cpp:type:`lv_obj_t` to store the object ID.
Object ID can be used in many cases, for example, to identify the object.
Or we can store a program backtrace to where the object is created.

.. raw:: html

   </details>
   <br>


LVGL提供了一个可选的字段，在 :cpp:type:`lv_obj_t` 类型中用来存储对象ID。
对象ID可以在许多情况下使用，例如用于标识对象。
或者我们可以存储一个程序的回溯，指向对象的创建位置。


.. _obj_id_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable this feature by setting :c:macro:`LV_USE_OBJ_ID` to `1` in ``lv_conf.h``.

Enable :c:macro:`LV_OBJ_ID_AUTO_ASSIGN` to automatically assign an ID to object when it's created.
It's done by calling function :cpp:func:`lv_obj_assign_id` from :cpp:func:`lv_obj_constructor`.

You can either use your own ID generator by defining the function :cpp:func:`lv_obj_assign_id` or you can utilize the built-in one.
To use the builtin ID generator, set :c:macro:`LV_USE_OBJ_ID_BUILTIN` to `1`.

You can directly access the ID by :cpp:expr:`lv_obj_get_id(obj)` or use API :cpp:expr:`lv_obj_stringify_id(obj, buf, len)`
to get a string representation of the ID.

.. raw:: html

   </details>
   <br>


通过在 ``lv_conf.h`` 中将 :c:macro:`LV_USE_OBJ_ID` 设置为 `1`，启用此功能。
启用 :c:macro:`LV_OBJ_ID_AUTO_ASSIGN` 可以在创建对象时自动分配一个ID给它。
这是通过在 :cpp:func:`lv_obj_constructor` 函数中调用 :cpp:func:`lv_obj_assign_id` 函数来完成的。

您可以选择使用自己的ID生成器，方法是定义 :cpp:func:`lv_obj_assign_id` 函数，或者您可以利用内置的ID生成器。
要使用内置的ID生成器，请将 :c:macro:`LV_USE_OBJ_ID_BUILTIN` 设置为 `1`。

您可以直接访问ID，通过 :cpp:expr:`obj->id` 或使用API :cpp:expr:`lv_obj_stringify_id(obj, buf, len)` 获取ID的字符串表示形式。


Use custom ID generator（使用自定义的ID生成器）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Set :c:macro:`LV_USE_OBJ_ID_BUILTIN` to `0` in ``lv_conf.h``.

Below APIs needed to be implemented and linked to lvgl.

.. code:: c

    void lv_obj_assign_id(const lv_obj_class_t * class_p, lv_obj_t * obj);
    void lv_obj_free_id(lv_obj_t * obj);
    const char * lv_obj_stringify_id(lv_obj_t * obj, char * buf, uint32_t len);
    int lv_obj_id_compare(void * id1, void * id2);

:cpp:func:`lv_obj_assign_id` is called when an object is created. The object final class is passed from
parameter ``class_p``. Note it may be different than :cpp:expr:`obj->class_p` which is the class
currently being constructed.

:cpp:func:`lv_obj_free_id` is called when object is deconstructed. Free any resource allocated in :cpp:func:`lv_obj_assign_id`.

:cpp:func:`lv_obj_stringify_id` converts id to a string representation. The string is stored in ``buf``.

.. raw:: html

   </details>
   <br>


在 ``lv_conf.h`` 中的 `LV_USE_OBJ_ID_BUILTIN` 宏被设置为 `0`。

需要实现并链接到lvgl的以下API。

.. code:: c

    void lv_obj_assign_id(const lv_obj_class_t * class_p, lv_obj_t * obj);
    void lv_obj_free_id(lv_obj_t * obj);
    const char * lv_obj_stringify_id(lv_obj_t * obj, char * buf, uint32_t len);
    int lv_obj_id_compare(void * id1, void * id2);

当创建一个对象时，会调用 :cpp:func:`lv_obj_assign_id` 函数。对象的最终类别从参数 ``class_p`` 传递进来。
注意：它可能与 :cpp:expr:`obj->class_p` 不同，后者是当前正在构建的类别。

当对象被析构时，会调用 :cpp:func:`lv_obj_free_id` 函数。释放在 :cpp:func:`lv_obj_assign_id` 中分配的任何资源。

:cpp:func:`lv_obj_stringify_id` 函数将ID转换为字符串表示。字符串存储在 ``buf`` 中。


Dump obj tree（转储对象树）
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use API :cpp:expr:`lv_obj_dump_tree(lv_obj_t * obj, int depth)` to dump the object tree.
It will walk through all children and print the object ID together with object address.

This is useful to debug UI crash. From log we can rebuilt UI the moment before crash.
For example, if the obj is stored to a :cpp:expr:`timer->user_data`, but obj is deleted when timer expired.
Timer callback will crash because of accessing wild pointer.
From the dump log we can clearly see that the obj does not exist.

.. raw:: html

   </details>
   <br>


使用API :cpp:expr:`lv_obj_dump_tree(lv_obj_t * obj, int depth)` 可以转储对象树。
它会遍历所有子对象，并打印对象ID和对象地址。

这对于调试UI崩溃非常有用。通过日志，我们可以在崩溃前重建UI的状态。
例如，如果将obj存储在 :cpp:expr:`timer->user_data` 中，但是当定时器到期时删除了obj。
定时器回调会因为访问无效指针而崩溃。
通过转储日志，我们可以清楚地看到obj不存在。


Find child by ID（通过ID查找子对象）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

Use API :cpp:expr:`lv_obj_t * lv_obj_get_child_by_id(const lv_obj_t * obj, void * id);` to find a child by ID.
It will walk through all children and return the first child with the given ID.

.. raw:: html

   </details>
   <br>


使用API :cpp:expr:`lv_obj_t * lv_obj_get_child_by_id(const lv_obj_t * obj, void * id);` 可以通过ID查找子对象。
该函数将遍历所有的子对象，并返回第一个具有给定ID的子对象。