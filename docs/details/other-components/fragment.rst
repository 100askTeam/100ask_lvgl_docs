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
or another fragment, Fragment in LVGL needs to be hosted by a Widget,
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


Fragment 是从 `Android <https://developer.android.com/guide/fragments>`__ 借鉴的概念。

它代表了应用程序界面中可重用的部分。一个 Fragment 定义并管理其自己的布局，具有自己的生命周期，并可以处理自己的事件。类似于 Android 的 Fragment 必须由 Activity 或其他 Fragment 托管一样，LVGL 中的 Fragment 必须由 Widget 或其他 Fragment 托管。Fragment 的视图层次结构会成为宿主视图层次结构的一部分，或者附加到宿主的视图层次结构中。

这一概念也与 `iOS 上的 UiViewController <https://developer.apple.com/documentation/uikit/uiviewcontroller>`__ 有一些相似之处。

Fragment Manager 是一个管理器，持有附加到其上的 Fragment 的引用，并有一个内部堆栈以实现导航功能。你可以使用 Fragment Manager 轻松构建导航堆栈或多窗格应用程序。

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

.. code-block:: c

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
           .instance_size = sizeof(struct sample_fragment_t),
   };

Use（使用） ``lv_fragment_manager``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: c

   /* Create fragment instance, and Widgets will be added to container */
   lv_fragment_manager_t *manager = lv_fragment_manager_create(container, NULL);
   /* Replace current fragment with instance of sample_cls, and init_argument is user defined pointer */
   lv_fragment_manager_replace(manager, &sample_cls, init_argument);

Fragment Based Navigation（片段式导航）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: c

   /* Add one instance into manager stack. View object of current fragment will be destroyed,
    * but instances created in class constructor will be kept.
    */
   lv_fragment_manager_push(manager, &sample_cls, NULL);

   /* Remove the top most fragment from the stack, and bring back previous one. */
   lv_fragment_manager_pop(manager);

.. _fragment_example:

Example
-------

.. include:: ../../examples/others/fragment/index.rst

.. _fragment_api:

API
---

