.. _fragment:

================
Fragment（片段）
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Fragment is a concept copied from
`Android <https://developer.android.com/guide/fragments>`__.

It represents a reusable portion of your app's UI. A fragment defines
and manages its own layout, has its own lifecycle, and can handle its
own events. Like Android's Fragment that must be hosted by an activity
or another fragment, Fragment in LVGL needs to be hosted by an object,
or another fragment. The fragment's view hierarchy becomes part of, or
attaches to, the host's view hierarchy.

Such concept also has some similarities to `UiViewController on
iOS <https://developer.apple.com/documentation/uikit/uiviewcontroller>`__.

Fragment Manager is a manager holding references to fragments attached
to it, and has an internal stack to achieve navigation. You can use
fragment manager to build navigation stack, or multi pane application
easily.

.. raw:: html

   </details>
   <br>


碎片（Fragment）是一个从Android的 `开发者指南 <https://developer.android.com/guide/fragments>`__ 上复制过来的概念。

它表示你的应用程序界面的可重用部分。一个碎片定义和管理自己的布局，有自己的生命周期，并且可以处理自己的事件。就像Android的碎片必须由一个活动或另一个碎片托管一样，LVGL中的碎片也需要由一个对象或另一个碎片托管。
碎片的视图层次结构成为宿主的视图层次结构的一部分，或者依附于宿主的视图层次结构上。

这个概念与iOS上的 `UiViewController <https://developer.apple.com/documentation/uikit/uiviewcontroller>`__ 也有一些相似之处。

碎片管理器（Fragment Manager）是一个持有对附加的碎片的引用的管理器，它有一个内部堆栈来实现导航。您可以使用碎片管理器轻松构建导航堆栈或多窗格应用程序。


.. _fragment_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FRAGMENT` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


在 `lv_conf.h` 中启用 :c:macro:`LV_USE_FRAGMENT` 宏。


Create Fragment Class（创建片段类）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: c

   struct sample_fragment_t {
       /* IMPORTANT: don't miss this part */
       lv_fragment_t base;
       /* States, object references and data fields for this fragment */
       const char *title;
   };

   const lv_fragment_class_t sample_cls = {
           /* Initialize something needed */
           .constructor_cb = sample_fragment_ctor,
           /* Create view objects */
           .create_obj_cb = sample_fragment_create_obj,
           /* IMPORTANT: size of your fragment struct */
           .instance_size = sizeof(struct sample_fragment_t)
   };

Use（使用） ``lv_fragment_manager``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: c

   /* Create fragment instance, and objects will be added to container */
   lv_fragment_manager_t *manager = lv_fragment_manager_create(container, NULL);
   /* Replace current fragment with instance of sample_cls, and init_argument is user defined pointer */
   lv_fragment_manager_replace(manager, &sample_cls, init_argument);

Fragment Based Navigation（片段式导航）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: c

   /* Add one instance into manager stack. View object of current fragment will be destroyed,
    * but instances created in class constructor will be kept.
    */
   lv_fragment_manager_push(manager, &sample_cls, NULL);

   /* Remove the top most fragment from the stack, and bring back previous one. */
   lv_fragment_manager_pop(manager);

.. _fragment_example:

Example
-------

.. include:: ../examples/others/fragment/index.rst

.. _fragment_api:

API
---

