.. _coord:

===============================================
Positions, sizes, and layouts（位置、大小和布局）
===============================================

Overview（概述）
***************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Similar to many other parts of LVGL, the concept of setting the
coordinates was inspired by CSS. LVGL has by no means a complete
implementation of CSS but a comparable subset is implemented (sometimes
with minor adjustments).

In short this means:

- Explicitly set coordinates are stored in styles (position, size, layouts, etc.)
- support min-width, max-width, min-height, max-height
- have pixel, percentage, and "content" units
- x=0; y=0 coordinate means the top-left corner of the parent plus the left/top padding plus border width
- width/height means the full size, the "content area" is smaller with padding and border width
- a subset of flexbox and grid layouts are supported

.. raw:: html

   </details>
   <br>


与LVGL的许多其他部分类似，设置坐标的概念受到了CSS的启发。LVGL绝不是对CSS的完整实现，而是实现了一个类似的子集（有的地方进行了微小调整）。

简而言之，这意味着：

- 显式设置的坐标存储在样式中（尺寸、位置、布局等）
- 支持最小宽度、最大宽度、最小高度、最大高度
- 有像素、百分比和“内容（content）”单位
- x=0；y=0坐标表示父对象的 左上角 + 左或上内边距 + 边框的宽度
- 宽/高（width/height）表示完整的尺寸，“内容区域”在加上内边距和边框宽度后会变小
- 支持flexbox和grid布局的部分功能（子集）


.. _coord_unites:

Units（单位）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  pixel: Simply a position in pixels. An integer always means pixels.
   E.g. :cpp:expr:`lv_obj_set_x(btn, 10)`
-  percentage: The percentage of the size of the Widget or its parent
   (depending on the property). :cpp:expr:`lv_pct(value)` converts a value to
   percentage. E.g. :cpp:expr:`lv_obj_set_width(btn, lv_pct(50))`
-  :c:macro:`LV_SIZE_CONTENT`: Special value to set the width/height of an
   Widget to involve all the children. It's similar to ``auto`` in CSS.
   E.g. :cpp:expr:`lv_obj_set_width(btn, LV_SIZE_CONTENT)`.

.. raw:: html

   </details>
   <br>


- 像素（pixel）：简单地说就是一个以像素为单位的位置。整数总是指像素。
   例如 :cpp:expr:`lv_obj_set_x(btn, 10)` （设置按钮的横（x）坐标为10个像素）
- 百分比（percentage）：是对象自身或其父对象大小的百分比（取决于具体的属性）。 :cpp:expr:`lv_pct(value)` 将一个值转换为百分比。
   例如 :cpp:expr:`lv_obj_set_width(btn, lv_pct(50))` （将按钮的宽度设置为父级宽度的50%）
- :c:macro:`LV_SIZE_CONTENT`：一个特殊的值，用于讲对象的宽度/高度设置为包含所有子对象所需要的大小。类似于CSS中的 ``auto``。
   例如 :cpp:expr:`lv_obj_set_width(btn, LV_SIZE_CONTENT)`（将按钮的宽度设置为能容纳其所有子对象的大小）


.. _boxing_model:

Boxing Model（盒子模型）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL follows CSS's `border-box <https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing>`__
model. A Widget's "box" is built from the following parts:

- bounding box: the width/height of the elements.
- border width: the width of the border.
- padding: space between the sides of the Widget and its children.
- margin: space outside of the Widget (considered only by some layouts)
- content: the content area which is the size of the bounding box reduced by the border width and padding.

.. image:: /misc/boxmodel.png
    :alt: The box models of LVGL: The content area is smaller than the bounding box with the padding and border width

The border is drawn inside the bounding box. Inside the border LVGL
keeps a "padding margin" when placing a Widget's children.

The outline is drawn outside the bounding box.

.. raw:: html

   </details>
   <br>


LVGL遵循CSS的 `border-box <https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing>`__ 模型。一个对象的“盒子”由以下部分构成：

- 边界框：元素的宽度/高度。
- 边框宽度：边框的宽度。
- 内边距：对象与其子元素之间的间距。
- 外边距：对象外部的间距（仅由某些布局考虑）
- 内容：内容区域，即边界框减去边框宽度和内边距的大小。

.. image:: /misc/boxmodel.png
    :alt: The box models of LVGL: The content area is smaller than the bounding box with the padding and border width


.. raw:: html

   <details>
     <summary>显示原文</summary>

The border is drawn inside the bounding box. Inside the border LVGL
keeps a "padding margin" when placing an object's children.

The outline is drawn outside the bounding box.

.. raw:: html

   </details>
   <br>


边界绘制在边界框内。在边界内部，LVGL在放置对象的子对象时会保留一个“内边距边距”。

轮廓绘制在边界框之外。


.. _coord_notes:

Important Notes（重要笔记）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

This section describes special cases in which LVGL's behavior might be
unexpected.

.. raw:: html

   </details>
   <br>


本节描述LVGL的行为可能会出现出乎意料的特殊情况。


.. _coord_postponed_coordinate_calculation:

Postponed coordinate calculation（坐标会被延迟计算）
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL doesn't recalculate all the coordinate changes immediately. This is
done to improve performance. Instead, the Widgets are marked as "dirty"
and before redrawing the screen LVGL checks if there are any "dirty"
Widgets. If so it refreshes their position, size and layout.

In other words, if you need to get the coordinate of a Widget and the
coordinates were just changed, LVGL needs to be forced to recalculate
the coordinates. To do this call :cpp:func:`lv_obj_update_layout`.

The size and position might depend on the parent or layout. Therefore
:cpp:func:`lv_obj_update_layout` recalculates the coordinates of all Widgets on
the screen of ``obj``.

.. raw:: html

   </details>
   <br>


LVGL不会立即重新计算所有坐标变化，这样做是为了提高性能。相反，对象会被标记为"脏（dirty）"，在重新绘制屏幕之前，LVGL会检查是否有任何"dirty"对象。如果有，则会刷新它们的位置、大小和布局。

换句话说，如果您需要获取一个对象的坐标，并且坐标刚刚发生了变化，需要强制LVGL重新计算坐标。要做到这一点，请调用 :cpp:func:`lv_obj_update_layout`。

大小和位置可能取决于父级或布局。因此，:cpp:func:`lv_obj_update_layout` 会重新计算 ``obj`` 屏幕上所有对象的坐标。


.. _coord_removing styles:

Removing styles（删除样式）
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <details>
     <summary>显示原文</summary>

As it's described in the :ref:`coord_using_styles` section,
coordinates can also be set via style properties. To be more precise,
under the hood every style coordinate related property is stored as a
style property. If you use :cpp:expr:`lv_obj_set_x(widget, 20)` LVGL saves ``x=20``
in the local style of the Widget.

This is an internal mechanism and doesn't matter much as you use LVGL.
However, there is one case in which you need to be aware of the
implementation. If the style(s) of a Widget are removed by

.. code-block:: c

   lv_obj_remove_style_all(widget)

or

.. code-block:: c

   lv_obj_remove_style(widget, NULL, LV_PART_MAIN);

the earlier set coordinates will be removed as well.

For example:

.. code-block:: c

   /* The size of obj1 will be set back to the default in the end */
   lv_obj_set_size(widget1, 200, 100);  /* Now obj1 has 200;100 size */
   lv_obj_remove_style_all(widget1);    /* It removes the set sizes */


   /* widget2 will have 200;100 size in the end */
   lv_obj_remove_style_all(widget2);
   lv_obj_set_size(widget2, 200, 100);

.. raw:: html

   </details>
   <br>


根据 :ref:`coord_using_styles` 章节的内容，
坐标也可以通过样式属性进行设置。更准确地说，实际上每个与样式坐标相关的属性都会以样式属性的方式存储在内部（RAM）。
如果你使用 :cpp:expr:`lv_obj_set_x(obj, 20)`，LVGL会将 ``x=20`` 存储在对象的局部样式中（RAM）。

这是一个内部机制，在你使用LVGL时并不太需要重点关注。
然而，有一个情况下你需要注意实现方式。
如果通过以下方式移除对象的样式：

.. code:: c

   lv_obj_remove_style_all(obj)

或者

.. code:: c

   lv_obj_remove_style(obj, NULL, LV_PART_MAIN);

那么会导致之前设置的坐标也将被移除。

例如：

.. code:: c

   /* obj1 的大小将在最后被设置回默认值 */
   lv_obj_set_size(obj1, 200, 100);  /* 现在 obj1 的大小为 200;100 */
   lv_obj_remove_style_all(obj1);    /* 它会移除设置的大小 */


   /* obj2 最后将会有 200;100 的大小 */
   lv_obj_remove_style_all(obj2);
   lv_obj_set_size(obj2, 200, 100);  


.. _positioning_widgets:

Positioning Widgets
*******************


Direct
------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To simply set the x and y coordinates of a Widget use:

.. code-block:: c

   lv_obj_set_x(widget, 10);          /* Separate... */
   lv_obj_set_y(widget, 20);
   lv_obj_set_pos(widget, 10, 20);    /* Or in one function */

By default, the x and y coordinates are measured from the top left
corner of the parent's content area. For example if the parent has five
pixels of padding on every side the above code will place ``obj`` at
(15, 25) because the content area starts after the padding.

Percentage values are calculated from the parent's content area size.

.. code-block:: c

   lv_obj_set_x(btn, lv_pct(10)); //x = 10 % of parent content area width

.. raw:: html

   </details>
   <br>


如果想最简单地设置对象的x和y坐标，可以这样操作：

.. code:: c

   lv_obj_set_x(obj, 10);        //单独设置...
   lv_obj_set_y(obj, 20);
   lv_obj_set_pos(obj, 10, 20);    //或者使用一个函数

默认情况下，x和y坐标是从父对象的内容区域的左上角开始计算的。例如，如果父对象的每一边都有五个像素的内边距（padding），那么上面的代码会把 ``obj`` 放置在(15, 25)，因为内容区域在填充之后开始计算。

百分比值是通过父对象的内容（content）区域的大小来计算的。

.. code:: c

   lv_obj_set_x(btn, lv_pct(10)); //x = 父元素内容区域宽度的10%


Alignment（对齐）
------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Inside parent widget
~~~~~~~~~~~~~~~~~~~~
In many cases it is more convenient to tell LVGL to align your object relative to
an "anchor" in its parent *other* than its upper left corner.  To establish
that "anchor", call :cpp:expr:`lv_obj_set_align(widget, LV_ALIGN_...)`.  After
that call, that "anchor" will be remembered until another one is established.
In other words, every futire x and y setting for that Widget will be relative to the
that "anchor".

Example:  Position Widget (10,20) px relative to the center of its parent:

.. code-block:: c

   lv_obj_set_align(widget, LV_ALIGN_CENTER);
   lv_obj_set_pos(widget, 10, 20);

   /* Or combine the above in one function... */
   lv_obj_align(widget, LV_ALIGN_CENTER, 10, 20);

9 convenient "anchors" can be used with these functions:

- :cpp:enumerator:`LV_ALIGN_TOP_LEFT`
- :cpp:enumerator:`LV_ALIGN_TOP_MID`
- :cpp:enumerator:`LV_ALIGN_TOP_RIGHT`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_LEFT`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_MID`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_RIGHT`
- :cpp:enumerator:`LV_ALIGN_LEFT_MID`
- :cpp:enumerator:`LV_ALIGN_RIGHT_MID`
- :cpp:enumerator:`LV_ALIGN_CENTER`

See illustration below to visualize what these mean.

It's quite common to align a child to the center of its parent,
therefore a dedicated function exists:

.. code-block:: c

   lv_obj_center(widget);

   //Has the same effect
   lv_obj_align(widget, LV_ALIGN_CENTER, 0, 0);

If the parent's size changes, the set alignment and position of the
children is updated automatically.


Relative to another Widget
~~~~~~~~~~~~~~~~~~~~~~~~~~
Alternately, you can choose an "anchor" on another Widget.

.. code-block:: c

   lv_obj_align_to(widget, reference_widget, align, x, y);

where ``align`` can be done of the following:

-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_LEFT`
-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_RIGHT`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_LEFT`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_RIGHT`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_TOP`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_BOTTOM`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_TOP`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_BOTTOM`

Example:  to horizontally center a label 10 pixels above a button:

.. code-block:: c

   lv_obj_align_to(label, btn, LV_ALIGN_OUT_TOP_MID, 0, -10);

Note that, unlike with :cpp:func:`lv_obj_align`, :cpp:func:`lv_obj_align_to`
does not remember the "anchor" used, and so will not automatically reposition
the aligned widget if the reference widget later moves.

The following illustration shows the meaning of each "anchor" mentioned above.

.. image:: /misc/align.png

.. raw:: html

   </details>
   <br>


在某些情况下，可以方便地从对象默认的左上角更改其定位原点。如果改变了原点，比如改成右下角，那么(0,0)位置的意思是：与右下角对齐。要改变原点，使用如下代码：

.. code:: c

   lv_obj_set_align(obj, align);

改变对齐方式并设置新的坐标：

.. code:: c

   lv_obj_align(obj, align, x, y);

有以下对齐选项可用：

- :cpp:enumerator:`LV_ALIGN_TOP_LEFT`
- :cpp:enumerator:`LV_ALIGN_TOP_MID`
- :cpp:enumerator:`LV_ALIGN_TOP_RIGHT`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_LEFT`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_MID`
- :cpp:enumerator:`LV_ALIGN_BOTTOM_RIGHT`
- :cpp:enumerator:`LV_ALIGN_LEFT_MID`
- :cpp:enumerator:`LV_ALIGN_RIGHT_MID`
- :cpp:enumerator:`LV_ALIGN_CENTER`

将子对象对齐到其父对象的中心是非常常见的操作，因此存在专门的函数：

.. code:: c

   lv_obj_center(obj);

   //有相同的效果
   lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);

如果父对象的大小改变，则子对象的设置对齐和位置会根据父对象的变化自动调整更新。

上述介绍的功能使对象与其父对象对象。然而，也可以将对象与任意参考对象对其。

.. code:: c

   lv_obj_align_to(obj_to_align, reference_obj, align, x, y);

除了上述的对齐选项外，还可以使用以下选项将对象对齐到参考对象外部：

-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_LEFT`
-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_TOP_RIGHT`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_LEFT`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_BOTTOM_RIGHT`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_TOP`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_LEFT_BOTTOM`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_TOP`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_MID`
-  :cpp:enumerator:`LV_ALIGN_OUT_RIGHT_BOTTOM`

例如，将标签对齐到按钮上方并使标签水平居中：

.. code:: c

   lv_obj_align_to(label, btn, LV_ALIGN_OUT_TOP_MID, 0, -10);

请注意，与 :cpp:func:`lv_obj_align` 不同，:cpp:func:`lv_obj_align_to` 不能在对象的坐标或参考对象的坐标发生变化时重新对齐对象。


.. _coord_size:

Size（大小）
************

Sizing the simple way（最简单的方法）
------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

The width and the height of a Widget can be set easily as well:

.. code-block:: c

   lv_obj_set_width(widget, 200);         /* Separate... */
   lv_obj_set_height(widget, 100);
   lv_obj_set_size(widget, 200, 100);     /* Or in one function */

Percentage values are calculated based on the parent's content area
size. For example to set the Widget's height to the screen height:

.. code-block:: c

   lv_obj_set_height(widget, lv_pct(100));

The size settings support a special value: :c:macro:`LV_SIZE_CONTENT`. It means
the Widget's size in the respective direction will be set to the size of
its children. Note that only children on the right and bottom sides will
be considered and children on the top and left remain cropped. This
limitation makes the behavior more predictable.

Widgets with :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` or :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` will be
ignored by the :c:macro:`LV_SIZE_CONTENT` calculation.

The above functions set the size of a Widget's bounding box but the
size of the content area can be set as well. This means a Widget's
bounding box will be enlarged with the addition of padding.

.. code-block:: c

   lv_obj_set_content_width(widget, 50);  /* The actual width: padding left + 50 + padding right */
   lv_obj_set_content_height(widget, 30); /* The actual width: padding top + 30 + padding bottom */

The size of the bounding box and the content area can be retrieved with
the following functions:

.. code-block:: c

   int32_t w = lv_obj_get_width(widget);
   int32_t h = lv_obj_get_height(widget);
   int32_t content_w = lv_obj_get_content_width(widget);
   int32_t content_h = lv_obj_get_content_height(widget);

.. raw:: html

   </details>
   <br>


一个对象的宽度和高度也可以很容易地进行设置：

.. code:: c

   lv_obj_set_width(obj, 200);       //分别设置...
   lv_obj_set_height(obj, 100);
   lv_obj_set_size(obj, 200, 100);     //或者使用一个函数

百分比值是基于父对象的内容区域大小进行计算的。例如，要将对象的高度设置为屏幕高度：

.. code:: c

   lv_obj_set_height(obj, lv_pct(100));

大小设置支持特殊值：:c:macro:`LV_SIZE_CONTENT`。这意味着对象在相应方向上的大小将被设置为其子对象恰好所需的大小。请注意，只有右侧和底部的子对象才会被考虑，而顶部和左侧的子对象仍会被裁剪。这种限制使行为更可预测

具有 :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` 或 :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` 的对象将被 :c:macro:`LV_SIZE_CONTENT` 计算忽略。

上述函数设置对象边界框的大小，但内容区域的大小也可以设置。这也就是说，对象的边界框会根据内边距的增加而扩大。

.. code:: c

   lv_obj_set_content_width(obj, 50); //实际宽度：左内边距 + 50 + 右内边距
   lv_obj_set_content_height(obj, 30); //实际高度：顶部内边距 + 30 + 底部内边距

可以使用以下函数获取边界框和内容区域的大小：

.. code:: c

   int32_t w = lv_obj_get_width(obj);
   int32_t h = lv_obj_get_height(obj);
   int32_t content_w = lv_obj_get_content_width(obj);
   int32_t content_h = lv_obj_get_content_height(obj);


.. _extending_click_area:

Extending the click area
------------------------

By default, Widgets can be clicked only within their bounding area.  However,
especially with small Widgets, it can be helpful to make a Widget's "clickable" area
larger.  You can do this with :cpp:expr:`lv_obj_set_ext_click_area(widget, size)`.


.. _coord_using_styles:

Using styles（使用样式）
***********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Under the hood the position, size and alignment properties are style
properties. The above described "simple functions" hide the style
related code for the sake of simplicity and set the position, size, and
alignment properties in the local styles of the Widget.

However, using styles to set the coordinates has some great advantages:

- It makes it easy to set the width/height/etc. for several Widgets
  together. E.g. make all the sliders 100x10 pixels sized.
- It also makes possible to modify the values in one place.
- The values can be partially overwritten by other styles. For example
  ``style_btn`` makes the Widget ``100x50`` by default but adding
  ``style_full_width`` overwrites only the width of the Widget.
- The Widget can have different position or size depending on state.
  E.g. 100 px wide in :cpp:enumerator:`LV_STATE_DEFAULT` but 120 px
  in :cpp:enumerator:`LV_STATE_PRESSED`.
- Style transitions can be used to make the coordinate changes smooth.

Here are some examples to set a Widget's size using a style:

.. code-block:: c

   static lv_style_t style;
   lv_style_init(&style);
   lv_style_set_width(&style, 100);

   lv_obj_t * btn = lv_button_create(lv_screen_active());
   lv_obj_add_style(btn, &style, LV_PART_MAIN);

As you will see below there are some other great features of size and
position setting. However, to keep the LVGL API lean, only the most
common coordinate setting features have a "simple" version and the more
complex features can be used via styles.

.. raw:: html

   </details>
   <br>


在内部实现中，位置、大小和对齐属性是样式属性。上述描述的“简单函数”隐藏了与样式相关的代码来简化操作，实质上已经在对象的本地样式中设置位置、大小和对齐等属性。

然而，使用样式来设置坐标具有一些很大的优势：

- 使得可以很容易的为多个对象同时设置宽度/高度等。比如，使所有滑块的尺寸为 100x10 像素。
- 还可以在一个位置修改值。
- 这些数值可以部分地被其他样式覆盖。例如， ``style_btn`` 默认将对象的宽度设置为 ``100x50``，但添加 ``style_full_width`` 仅覆盖对象的宽度。
- 对象的位置或大小可以根据状态而有所不同。例如，在 :cpp:enumerator:`LV_STATE_DEFAULT` 状态下宽度为100像素，在 :cpp:enumerator:`LV_STATE_PRESSED` 状态下为120像素。
- 可以使用样式转换使坐标变化更加平滑。

以下是使用样式设置对象大小的一些示例代码：

.. code:: c

   static lv_style_t style;
   lv_style_init(&style);
   lv_style_set_width(&style, 100);

   lv_obj_t * btn = lv_button_create(lv_screen_active());
   lv_obj_add_style(btn, &style, LV_PART_MAIN);

正如您在下面看到的，在尺寸和位置设置方面还有一些其他很棒的功能。然而，为了保持 LVGL API 的精简，只有最常见的坐标设置功能有一个“简单”版本，更复杂的功能可以通过样式来实现。

.. _coord_translation:

Translation（位置转换）
**************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Let's say the there are 3 buttons next to each other. Their position is
set as described above. Now you want to move a button up a little when
it's pressed.

One way to achieve this is by setting a new Y coordinate for the pressed
state:

.. code-block:: c

   static lv_style_t style_normal;
   lv_style_init(&style_normal);
   lv_style_set_y(&style_normal, 100);

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_y(&style_pressed, 80);

   lv_obj_add_style(btn1, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn1, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn2, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn2, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn3, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn3, &style_pressed, LV_STATE_PRESSED);

This works, but it's not really flexible because the pressed coordinate
is hard-coded. If the buttons are not at y=100, ``style_pressed`` won't
work as expected. Translations can be used to solve this:

.. code-block:: c

   static lv_style_t style_normal;
   lv_style_init(&style_normal);
   lv_style_set_y(&style_normal, 100);

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_translate_y(&style_pressed, -20);

   lv_obj_add_style(btn1, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn1, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn2, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn2, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn3, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn3, &style_pressed, LV_STATE_PRESSED);

Translation is applied from the current position of the Widget.

Percentage values can be used in translations as well. The percentage is
relative to the size of the Widget (and not to the size of the parent).
For example :cpp:expr:`lv_pct(50)` will move the Widget with half of its
width/height.

The translation is applied after the layouts are calculated. Therefore,
even laid out Widgets' position can be translated.

The translation actually moves the Widget. That means it makes the
scrollbars and :c:macro:`LV_SIZE_CONTENT` sized Widgets react to the position
change.

.. raw:: html

   </details>
   <br>

现在假设有3个相邻的按钮。它们的位置如上所述。现在你想要在按下按钮时将按钮上移一点。

实现这一目标的一种方法是为其按下状态设置一个新的Y坐标：

.. code:: c

   static lv_style_t style_normal;
   lv_style_init(&style_normal);
   lv_style_set_y(&style_normal, 100);

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_y(&style_pressed, 80);

   lv_obj_add_style(btn1, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn1, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn2, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn2, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn3, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn3, &style_pressed, LV_STATE_PRESSED);

这种方法有效，但不够灵活，因为按下时的坐标是硬编码的。如果按钮不在y=100处， ``style_pressed`` 就不会如预期般工作。可以使用平移来解决这个问题：

.. code:: c

   static lv_style_t style_normal;
   lv_style_init(&style_normal);
   lv_style_set_y(&style_normal, 100);

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_translate_y(&style_pressed, -20);

   lv_obj_add_style(btn1, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn1, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn2, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn2, &style_pressed, LV_STATE_PRESSED);

   lv_obj_add_style(btn3, &style_normal, LV_STATE_DEFAULT);
   lv_obj_add_style(btn3, &style_pressed, LV_STATE_PRESSED);

平移是相对于对象当前位置进行应用的。

百分比值也可以在平移中使用。百分比是相对于对象的大小（而不是相对于父对象的大小）。例如 :cpp:expr:`lv_pct(50)` 将使对象移动其宽度/高度的一半。

平移是在布局计算之后应用。因此，即使对象的位置总是被布局计算，也可以进行平移。

平移实际上移动了对象。这意味着它会使滚动条和 :c:macro:`LV_SIZE_CONTENT` 大小的对象对位置变化做出反应。


.. _coord_transformation:

Transformation（大小转换）
**********************

.. raw:: html

   <details>
     <summary>显示原文</summary>

Similarly to position, a Widget's size can be changed relative to the
current size as well. The transformed width and height are added on both
sides of the Widget. This means a 10 px transformed width makes the
Widget 2x10 pixels wider.

Unlike position translation, the size transformation doesn't make the
Widget "really" larger. In other words scrollbars, layouts, and
:c:macro:`LV_SIZE_CONTENT` will not react to the transformed size. Hence, size
transformation is "only" a visual effect.

This code enlarges a button when it's pressed:

.. code-block:: c

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_transform_width(&style_pressed, 10);
   lv_style_set_transform_height(&style_pressed, 10);

   lv_obj_add_style(btn, &style_pressed, LV_STATE_PRESSED);

.. raw:: html

   </details>
   <br>


与位置类似，对象的大小也可以相对于当前大小进行改变。变换后的宽度和高度会分别加在对象的两侧。这意味着，一个 10 像素的变换宽度会使对象宽 20 像素（两侧各增加 10 像素）。

与位置平移不同，大小转换并不会使对象“真正”变大。换句话说，滚动条、布局和 :c:macro:`LV_SIZE_CONTENT` 不会对变换后的大小做出反应。因此，大小转换 “只是” 一种视觉效果。

下面的代码会在按钮被按下时放大：

.. code:: c

   static lv_style_t style_pressed;
   lv_style_init(&style_pressed);
   lv_style_set_transform_width(&style_pressed, 10);
   lv_style_set_transform_height(&style_pressed, 10);

   lv_obj_add_style(btn, &style_pressed, LV_STATE_PRESSED);


.. _coord_min_max_size:

Min and Max size（最小和最大尺寸）
---------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Similarly to CSS, LVGL also supports ``min-width``, ``max-width``,
``min-height`` and ``max-height``. These are limits preventing a
Widget's size from becoming smaller/larger than these values. They are
especially useful if the size is set by percentage or
:c:macro:`LV_SIZE_CONTENT`.

.. code-block:: c

   static lv_style_t style_max_height;
   lv_style_init(&style_max_height);
   lv_style_set_y(&style_max_height, 200);

   lv_obj_set_height(widget, lv_pct(100));
   lv_obj_add_style(widget, &style_max_height, LV_STATE_DEFAULT); //Limit the  height to 200 px

Percentage values can be used as well which are relative to the size of
the parent's content area.

.. code-block:: c

   static lv_style_t style_max_height;
   lv_style_init(&style_max_height);
   lv_style_set_y(&style_max_height, lv_pct(50));

   lv_obj_set_height(widget, lv_pct(100));
   lv_obj_add_style(widget, &style_max_height, LV_STATE_DEFAULT); //Limit the height to half parent height

.. raw:: html

   </details>
   <br>


与CSS类似，LVGL也支持 ``min-width``、 ``max-width``、 ``min-height``和 ``max-height``。这些限制了对象的大小，防止其变得比这些值更小/更大。如果通过百分比或 :c:macro:`LV_SIZE_CONTENT` 来设置大小，它们尤其有用。

.. code:: c

   static lv_style_t style_max_height;
   lv_style_init(&style_max_height);
   lv_style_set_y(&style_max_height, 200);

   lv_obj_set_height(obj, lv_pct(100));
   lv_obj_add_style(obj, &style_max_height, LV_STATE_DEFAULT); //将高度限制为200像素

也可以使用百分比值，相对于父对象的内容区域的大小。

.. code:: c

   static lv_style_t style_max_height;
   lv_style_init(&style_max_height);
   lv_style_set_y(&style_max_height, lv_pct(50));

   lv_obj_set_height(obj, lv_pct(100));
   lv_obj_add_style(obj, &style_max_height, LV_STATE_DEFAULT); //将高度限制为父容器高度的一半


.. _coord_layout:

Layout（布局）
**************

Layout Overview（布局概述）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Layouts can update the position and size of a Widget's children. They
can be used to automatically arrange the children into a line or column,
or in much more complicated forms.

The position and size set by the layout overwrites the "normal" x, y,
width, and height settings.

There is only one function that is the same for every layout:
:cpp:func:`lv_obj_set_layout` ``(widget, <LAYOUT_NAME>)`` sets the layout on a Widget.
For further settings of the parent and children see the documentation of
the given layout.

.. raw:: html

   </details>
   <br>


布局可以更新对象子对象的位置和大小。它们可以用于自动排列子对象成一行或一列，或者以更复杂的形式排列。

布局设置的位置和大小会覆盖“正常”的x、y、宽度和高度设置。

每个布局都有一个相同的函数：
:cpp:func:`lv_obj_set_layout` ``(obj, <布局名称>)`` 用于在对象上设置布局。
关于父级和子级的其他设置，请参阅指定布局的文档。


Built-in layouts（内置布局）
--------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL comes with two very powerful layouts:

* Flexbox: arrange Widgets into rows or columns, with support for wrapping and expanding items.
* Grid: arrange Widgets into fixed positions in 2D table.

Both are heavily inspired by the CSS layouts with the same name.
Layouts are described in detail in their own section of documentation.

.. raw:: html

   </details>
   <br>


LVGL带有两种非常强大的布局：

* Flexbox：将对象排列成行或列，支持换行和扩展项目。
* Grid：在二维表中将对象排列成固定位置。

这两种布局都受到了同名的CSS布局的启发。
布局在文档的相应部分有详细描述。


Flags（标志）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

There are some flags that can be used on Widgets to affect how they
behave with layouts:

- :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` Hidden Widgets are ignored in layout calculations.
- :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` The Widget is simply ignored by the layouts. Its coordinates can be set as usual.
- :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` Same as :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` but the Widget with :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` will be ignored in :c:macro:`LV_SIZE_CONTENT` calculations.

These flags can be added/removed with :cpp:expr:`lv_obj_add_flag(widget, FLAG)` and :cpp:expr:`lv_obj_remove_flag(widget, FLAG)`

.. raw:: html

   </details>
   <br>


有一些标志可以用于对象，以影响它们与布局的行为：

- :cpp:enumerator:`LV_OBJ_FLAG_HIDDEN` 隐藏的对象在布局计算中被忽略。
- :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` 该对象被布局简单地忽略。它的坐标可以像常规那样设置。
- :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` 与 :cpp:enumerator:`LV_OBJ_FLAG_IGNORE_LAYOUT` 相同，但具有 :cpp:enumerator:`LV_OBJ_FLAG_FLOATING` 标志的对象将在 :c:macro:`LV_SIZE_CONTENT` 计算中被忽略。

这些标志可以使用 :cpp:expr:`lv_obj_add_flag(obj, FLAG)` 和 :cpp:expr:`lv_obj_remove_flag(obj, FLAG)` 添加/移除。


Adding new layouts（添加新布局）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL can be freely extended by a custom layout like this:

.. code-block:: c

   uint32_t MY_LAYOUT;

   ...

   MY_LAYOUT = lv_layout_register(my_layout_update, &user_data);

   ...

   void my_layout_update(lv_obj_t * widget, void * user_data)
   {
       /* Will be called automatically if it's required to reposition/resize the children of "obj" */
   }

Custom style properties can be added which can be retrieved and used in
the update callback. For example:

.. code-block:: c

   uint32_t MY_PROP;
   ...

   LV_STYLE_MY_PROP = lv_style_register_prop();

   ...
   static inline void lv_style_set_my_prop(lv_style_t * style, uint32_t value)
   {
       lv_style_value_t v = {
           .num = (int32_t)value
       };
       lv_style_set_prop(style, LV_STYLE_MY_PROP, v);
   }

.. raw:: html

   </details>
   <br>


LVGL可以通过自定义布局自由扩展，如下所示：

.. code:: c

   uint32_t MY_LAYOUT;

   ...

   MY_LAYOUT = lv_layout_register(my_layout_update, &user_data);

   ...

   void my_layout_update(lv_obj_t * obj, void * user_data)
   {
       /*如果需要重新定位/调整“obj”的子对象，则会自动调用该函数*/
   }

可以添加自定义样式属性，并在更新回调函数中检索和使用它们。例如：

.. code:: c

   uint32_t MY_PROP;
   ...

   LV_STYLE_MY_PROP = lv_style_register_prop();

   ...
   static inline void lv_style_set_my_prop(lv_style_t * style, uint32_t value)
   {
       lv_style_value_t v = {
           .num = (int32_t)value
       };
       lv_style_set_prop(style, LV_STYLE_MY_PROP, v);
   }
   

.. _coord_example:

Examples
********

.. _coord_api:

API
***
