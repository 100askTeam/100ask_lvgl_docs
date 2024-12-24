.. _observer:

=================
Observer（观察者）
=================

.. _observer_overview:

Overview（概述）
****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The ``lv_observer`` module implements a standard `Observer pattern <https://en.wikipedia.org/wiki/Observer_pattern>`__.

It consists of:

- **subjects**: each containing a value
- **observers**: attached to subjects to be notified on value change


A typical use case looks like this:

.. code-block:: c

    //It's a global variable
    lv_subject_t my_subject;

    /*-------
     * main.c
     *-------*/

    extern lv_subject_t my_subject;

    void main(void)
    {
        //Initialize the subject as integer with the default value of 10
        lv_subject_init_int(&my_subject, 10);

        some_module_init();
    }

    /*--------------
     * some_module.c
     *--------------*/

    extern lv_subject_t some_subject;

    //Will be called when the related subject's value changes
    static void some_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        int32_t v = lv_subject_get_int(subject);
        do_something(v);
    }

    void some_module_init(void)
    {
        //Subscribe to a subject
        lv_subject_add_observer(&some_subject, some_observer_cb, NULL);
    }

    /*--------------
     * some_system.c
     *--------------*/

    extern lv_subject_t some_subject;

    void some_event(void)
    {
        //Set the subject's value to 30. It will notify `some_observer_cb`
        lv_subject_set_int(&some_subject, 30);
    }

.. raw:: html

   </details>
   <br>


``lv_observer`` 模块实现了一个标准的 `观察者模式 <https://en.wikipedia.org/wiki/Observer_pattern>`__。

它包含以下内容：

- **subject（被观察者）**：每个subject都包含一个值。
- **observer（观察者）**：附加到subject上，在值改变时得到通知。

一个典型的用例如下:

.. code-block:: c

    //It's a global variable
    lv_subject_t my_subject;

    /*-------
     * main.c
     *-------*/

    extern lv_subject_t my_subject;

    void main(void)
    {
        //Initialize the subject as integer with the default value of 10
        lv_subject_init_int(&my_subject, 10);

        some_module_init();
    }

    /*--------------
     * some_module.c
     *--------------*/

    extern lv_subject_t some_subject;

    //Will be called when the related subject's value changes
    static void some_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        int32_t v = lv_subject_get_int(subject);
        do_something(v);
    }

    void some_module_init(void)
    {
        //Subscribe to a subject
        lv_subject_add_observer(&some_subject, some_observer_cb, NULL);
    }

    /*--------------
     * some_system.c
     *--------------*/

    extern lv_subject_t some_subject;

    void some_event(void)
    {
        //Set the subject's value to 30. It will notify `some_observer_cb`
        lv_subject_set_int(&some_subject, 30);
    }


.. _observer_subject:

Subject（主题）
***************

Subject initialization（主题初始化）
-----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Subjects have to be static or global :cpp:type:`lv_subject_t` type variables.

To initialize a subject use ``lv_subject_init_<type>(&subject, params, init_value)``.
The following initializations exist for types:

- **Integer** ``void lv_subject_init_int(lv_subject_t * subject, int32_t value)``
- **String** ``void lv_subject_init_string(lv_subject_t * subject, char * buf, char * prev_buf, size_t size, const char * value)``
- **Pointer**  ``void lv_subject_init_pointer(lv_subject_t * subject, void * value)``
- **Color** ``void lv_subject_init_color(lv_subject_t * subject, lv_color_t color)``
- **Group** ``void lv_subject_init_group(lv_subject_t * subject, lv_subject_t * list[], uint32_t list_len)``

.. raw:: html

   </details>
   <br>

主题必须是静态或全局的 :cpp:type:`lv_subject_t` 类型变量。

要初始化一个 Subject，请使用 ``lv_subject_init_<type>(&subject, params, init_value)``。  
以下是不同类型的初始化方法：

- **Integer** ``void lv_subject_init_int(lv_subject_t * subject, int32_t value)``
- **String** ``void lv_subject_init_string(lv_subject_t * subject, char * buf, char * prev_buf, size_t size, const char * value)``
- **Pointer** ``void lv_subject_init_pointer(lv_subject_t * subject, void * value)``
- **Color** ``void lv_subject_init_color(lv_subject_t * subject, lv_color_t color)``
- **Group** ``void lv_subject_init_group(lv_subject_t * subject, lv_subject_t * list[], uint32_t list_len)``


Set subject value（设定主题值）
------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following functions can be used to set a subject's value:

- **Integer** ``void lv_subject_set_int(lv_subject_t * subject, int32_t value)``
- **String** ``void lv_subject_copy_string(lv_subject_t * subject, char * buf)``
- **Pointer**  ``void lv_subject_set_pointer(lv_subject_t * subject, void * ptr)``
- **Color** ``void lv_subject_set_color(lv_subject_t * subject, lv_color_t color)``

.. raw:: html

   </details>
   <br>


以下函数可以用于设置主题的值：

- **Integer** ``void lv_subject_set_int(lv_subject_t * subject, int32_t value)``
- **String** ``void lv_subject_copy_string(lv_subject_t * subject, char * buf)``
- **Pointer**  ``void lv_subject_set_pointer(lv_subject_t * subject, void * ptr)``
- **Color** ``void lv_subject_set_color(lv_subject_t * subject, lv_color_t color)``


Get subject's value（获取主题的值）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following functions can be used to get a subject's value:


- **Integer** ``int32_t lv_subject_get_int(lv_subject_t * subject)``
- **String** ``const char * lv_subject_get_string(lv_subject_t * subject)``
- **Pointer**  ``const void * lv_subject_get_pointer(lv_subject_t * subject)``
- **Color** ``lv_color_t lv_subject_get_color(lv_subject_t * subject)``

.. raw:: html

   </details>
   <br>


以下函数可用于获取主题值：

- **Integer** ``int32_t lv_subject_get_int(lv_subject_t * subject)``
- **String** ``const char * lv_subject_get_string(lv_subject_t * subject)``
- **Pointer**  ``const void * lv_subject_get_pointer(lv_subject_t * subject)``
- **Color** ``lv_color_t lv_subject_get_color(lv_subject_t * subject)``


Get subject's previous value（获取主题的以前的值）
------------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The following functions can be used to get a subject's previous value:


- **Integer** ``int32_t lv_subject_get_previous_int(lv_subject_t * subject)``
- **String** ``const char * lv_subject_get_previous_string(lv_subject_t * subject)``
- **Pointer** ``const void * lv_subject_get_previous_pointer(lv_subject_t * subject)``
- **Color** ``lv_color_t lv_subject_get_previous_color(lv_subject_t * subject)``


.. raw:: html

   </details>
   <br>


以下函数可用于获取主题的先前值：

- **Integer** ``int32_t lv_subject_get_previous_int(lv_subject_t * subject)``
- **String** ``const char * lv_subject_get_previous_string(lv_subject_t * subject)``
- **Pointer** ``const void * lv_subject_get_previous_pointer(lv_subject_t * subject)``
- **Color** ``lv_color_t lv_subject_get_previous_color(lv_subject_t * subject)``


.. _observer_observer:

Observer（观察者）
*****************

Subscribe to a subject（订阅一个主题）
-------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>

To subscribe to a subject the following function can be used:

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer(&some_subject, some_observer_cb, user_data);


Where the observer callback should look like this:

.. code-block:: c

    static void some_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        ...
    }


It's also possible to save a target widget when subscribing to a subject.
In this case when widget is deleted, it will automatically unsubscribe from the subject.

In the observer callback :cpp:expr:`lv_observer_get_target(observer)` can be used to get the saved widget.

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer_obj(&some_subject, some_observer_cb, widget, user_data);


In more generic case any pointer can be saved a target:

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer_with_target(&some_subject, some_observer_cb, some_pointer, user_data);

.. raw:: html

   </details>
   <br>


订阅主题时可以使用以下函数：

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer(&some_subject, some_observer_cb, user_data);


观察者回调函数应该如下所示：

.. code-block:: c

    static void some_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        ...
    }


在订阅主题时还可以保存目标部件。在这种情况下，当部件被删除时，它将自动取消对主题的订阅。

在观察者回调中 :cpp:expr:`lv_observer_get_target(observer)` 可以被用来获取保存的部件。

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer_obj(&some_subject, some_observer_cb, obj, user_data);


在更通用的情况下，任何指针都可以被保存为目标：

.. code-block:: c

    lv_observer_t * observer = lv_subject_add_observer_with_target(&some_subject, some_observer_cb, some_pointer, user_data);



Unsubscribe from a subject（取消订阅一个主题）
---------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

.. code-block:: c

    /* `observer` is the return value of `lv_subject_add_observer*` */
    lv_observer_remove(observer);

To unsubscribe a widget from a given or all subject use:

.. code-block:: c

    lv_obj_remove_from_subject(widget, subject); /* `subject` can be NULL to unsubcribe from all */

.. raw:: html

   </details>
   <br>


.. code-block:: c

    lv_observer_remove(observer)

要取消订阅主题上的所有小部件，可以使用以下代码：

.. code-block:: c

    lv_subject_remove_obj(subject, obj)


.. _observer_subject_groups:

Subject groups（主题组）
************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are cases when a subject changes and the value of some other subjects are also required by the observer.
As a practical example imagine an instrument which measures either voltage or current.
To display the measured value on a label 3 things are required:

1. What do we measure (current or voltage)?
2. What is the measured value?
3. What is the range or unit (mV, V, mA, A)?

When any of these 3 parameters changes the label needs to be updated,
and it needs to know all 3 parameters to compose its text.

To handle this you can create an array from some existing subjects and pass
this array as a parameter when you initialize a subject with group type.

.. code-block:: c

    static lv_subject_t * subject_list[3] = {&subject_1, &subject_2, &subject_3};
    lv_subject_init_group(&subject_all, subject_list, 3);  /*The last parameter is the number of elements */

You can add observers to subject groups in the regular way.
The trick is that when any element of the group is notified the subject group will be notified as well.

The above Voltage/Current measurement example looks like this in the practice:

.. code-block:: c

    lv_obj_t * label = lv_label_create(lv_screen_active());

    lv_subject_t subject_mode;  //Voltage or Current
    lv_subject_t subject_value; //Measured value
    lv_subject_t subject_unit;  //The unit
    lv_subject_t subject_all;   //It will be the subject group
    lv_subject_t * subject_list[3] = {&subject_mode, &subject_value, &subject_unit};  //The elements of the group

    lv_subject_init_int(&subject_mode, 0); //Let's say 0 is Voltage, 1 is Current
    lv_subject_init_int(&subject_value, 0);
    lv_subject_init_pointer(&subject_unit, "V");
    lv_subject_init_group(&subject_all, subject_list, 3);

    lv_subject_add_observer_obj(&subject_all, all_observer_cb, label, NULL);

    ...

    static void all_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        lv_obj_t * label = lv_observer_get_target(observer);
        lv_subject_t * subject_mode = lv_subject_get_group_element(subject, 0);
        lv_subject_t * subject_value = lv_subject_get_group_element(subject, 1);
        lv_subject_t * subject_unit = lv_subject_get_group_element(subject, 2);

        int32_t mode = lv_subject_get_int(subject_mode);
        int32_t value = lv_subject_get_int(subject_value);
        const char * unit = lv_subject_get_pointer(subject_unit);

        lv_label_set_text_fmt(label, "%s: %d %s", mode ? "Current" : "Voltage", value, unit);
    }

.. raw:: html

   </details>
   <br>


有时主题发生变化，观察者还需要其他一些主题的值。

实际示例中，想象一种仪器，它可以测量电压或电流。
要在标签上显示测量值，需要3样东西：

1. 要测量什么（电流或电压）？
2. 测量值是多少？
3. 范围或单位是什么（mV、V、mA、A）？

当这3个参数中的任何一个发生变化时，标签都需要更新，并且它需要知道所有3个参数才能组成文本。

要处理这个问题，可以从一些现有的主题中创建一个数组，并在初始化组类型的主题时将这个数组作为参数传递。

.. code-block:: c
    static lv_subject_t * subject_list[3] = {&subject_1, &subject_2, &subject_3};
    lv_subject_init_group(&subject_all, subject_list, 3);  /*The last parameter is the number of elements*/

可以以常规方式向主题组中添加观察者。
诀窍在于，组中的任何元素一旦被通知，组主题也会被通知。

上面的电压/电流测量示例在实际中看起来像这样：

.. code-block:: c

    lv_obj_t * label = lv_label_create(lv_screen_active());

    lv_subject_t subject_mode;  //Voltage or Current
    lv_subject_t subject_value; //Measured value
    lv_subject_t subject_unit;  //The unit
    lv_subject_t subject_all;   //It will be the subject group
    lv_subject_t * subject_list[3] = {&subject_mode, &subject_value, &subject_unit};  //The elements of the group

    lv_subject_init_int(&subject_mode, 0); //Let's say 0 is Voltage, 1 is Current
    lv_subject_init_int(&subject_value, 0);
    lv_subject_init_pointer(&subject_unit, "V");
    lv_subject_init_group(&subject_all, subject_list, 3);

    lv_subject_add_observer_obj(&subject_all, all_observer_cb, label, NULL);

    ...

    static void all_observer_cb(lv_observer_t * observer, lv_subject_t * subject)
    {
        lv_obj_t * label = lv_observer_get_target(observer);
        lv_subject_t * subject_mode = lv_subject_get_group_element(subject, 0);
        lv_subject_t * subject_value = lv_subject_get_group_element(subject, 1);
        lv_subject_t * subject_unit = lv_subject_get_group_element(subject, 2);

        int32_t mode = lv_subject_get_int(subject_mode);
        int32_t value = lv_subject_get_int(subject_value);
        const char * unit = lv_subject_get_pointer(subject_unit);

        lv_label_set_text_fmt(label, "%s: %d %s", mode ? "Current" : "Voltage", value, unit);
    }


.. _observer_widget_binding:

Widget binding（小部件绑定）
***************************

Base object（基本对象）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Set a Widget flag if an integer subject's value is equal to a reference value, clear the flag otherwise

.. code-block:: c

    observer = lv_obj_bind_flag_if_eq(widget, &subject, LV_OBJ_FLAG_*, ref_value);

Set a Widget flag if an integer subject's value is not equal to a reference value, clear the flag otherwise

.. code-block:: c

    observer = lv_obj_bind_flag_if_not_eq(widget, &subject, LV_OBJ_FLAG_*, ref_value);

Set a Widget state if an integer subject's value is equal to a reference value, clear the flag otherwise

.. code-block:: c

    observer = lv_obj_bind_state_if_eq(widget, &subject, LV_STATE_*, ref_value);

Set a Widget state if an integer subject's value is not equal to a reference value, clear the flag otherwise

.. code-block:: c

    observer = lv_obj_bind_state_if_not_eq(widget, &subject, LV_STATE_*, ref_value);

Set an integer subject to 1 when a Widget is checked and set it 0 when unchecked.

.. code-block:: c

    observer = lv_obj_bind_checked(widget, &subject);

.. raw:: html

   </details>
   <br>


如果一个整数 subject 的值等于参考值，则设置 Widget 的 flag，否则清除该 flag。

.. code-block:: c

    observer = lv_obj_bind_flag_if_eq(widget, &subject, LV_OBJ_FLAG_*, ref_value);

如果一个整数 subject 的值不等于参考值，则设置 Widget 的 flag，否则清除该 flag。

.. code-block:: c

    observer = lv_obj_bind_flag_if_not_eq(widget, &subject, LV_OBJ_FLAG_*, ref_value);

如果一个整数 subject 的值等于参考值，则设置 Widget 的 state，否则清除该 state。

.. code-block:: c

    observer = lv_obj_bind_state_if_eq(widget, &subject, LV_STATE_*, ref_value);

如果一个整数 subject 的值不等于参考值，则设置 Widget 的 state，否则清除该 state。

.. code-block:: c

    observer = lv_obj_bind_state_if_not_eq(widget, &subject, LV_STATE_*, ref_value);

当 Widget 被选中时，将一个整数 subject 设置为 1，当未选中时，将其设置为 0。

.. code-block:: c

    observer = lv_obj_bind_checked(widget, &subject);


.. raw:: html

   <details>
     <summary>显示原文</summary>

Set an integer subject to 1 when an object is checked and set it 0 when unchecked.

.. code:: c

    observer = lv_obj_bind_checked(obj, &subject);

.. raw:: html

   </details>
   <br>


当对象选中时，将整数主体设置为1，并在取消选中时将其设置为0。

.. code:: c

    observer = lv_obj_bind_checked(obj, &subject);

Label（标签）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bind an integer, string, or pointer (pointing to a string) subject to a label.
An optional format string can be added with 1 format specifier (e.g. ``"%d °C"``)
If the format string is ``NULL`` the value will be used directly. In this case on string and pointer type subjects can be used.

.. code-block:: c

    observer = lv_label_bind_text(widget, &subject, format_string);

.. raw:: html

   </details>
   <br>


将一个整数、字符串或指向字符串的指针与一个标签绑定。
可以使用一个可选的格式字符串，并添加一个格式说明符（例如 ``"%d °C"``）。
如果格式字符串为 ``NULL``，则将直接使用该值。在这种情况下，只能使用字符串和指针类型的主题。

.. code-block:: c

    observer = lv_label_bind_text(widget, &subject, format_string);


Arc（弧）
---------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bind an integer subject to an arc's value.

.. code-block:: c

    observer = lv_arc_bind_value(widget, &subject);

.. raw:: html

   </details>
   <br>


绑定一个整数变量到弧形对象的值。

.. code-block:: c

    observer = lv_arc_bind_value(widget, &subject);


Slider（滑动器）
----------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bind an integer subject to a slider's value

.. code-block:: c

    observer = lv_slider_bind_value(widget, &subject);

.. raw:: html

   </details>
   <br>


将一个整数值绑定到滑动条的值

.. code-block:: c

    observer = lv_slider_bind_value(widget, &subject);


Roller（滚筒）
--------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bind an integer subject to a roller's value

.. code-block:: c

    observer = lv_roller_bind_value(widget, &subject);

.. raw:: html

   </details>
   <br>


将整数对象绑定到滚轮的值

.. code-block:: c

    observer = lv_roller_bind_value(widget, &subject);



Drop-down（下拉菜单）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Bind an integer subject to a drop-down's value

.. code-block:: c

    observer = lv_dropdown_bind_value(widget, &subject);

.. raw:: html

   </details>
   <br>


绑定整数主题到下拉菜单的值

.. code-block:: c

    observer = lv_dropdown_bind_value(widget, &subject);

    
.. _observer_example:

Example
*******

.. include:: ../../examples/others/observer/index.rst

.. _observer_api:

API
***
