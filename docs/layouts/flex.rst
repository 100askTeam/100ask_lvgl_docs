.. _flex:

================
Flex（弹性布局）
================

Overview（概述）
*****************

.. raw:: html

   <details>
     <summary>显示原文</summary>

The Flexbox (or Flex for short) is a subset of `CSS Flexbox <https://css-tricks.com/snippets/css/a-guide-to-flexbox/>`__.

It can arrange items into rows or columns (tracks), handle wrapping,
adjust the spacing between the items and tracks, handle *grow* to make
the item(s) fill the remaining space with respect to min/max width and
height.

To make an object flex container call
:cpp:expr:`lv_obj_set_layout(obj, LV_LAYOUT_FLEX)`.

Note that the flex layout feature of LVGL needs to be globally enabled
with :c:macro:`LV_USE_FLEX` in ``lv_conf.h``.

.. raw:: html

   </details>
   <br>


Flexbox（弹性布局）（或简称 Flex）是 `CSS Flexbox <https://css-tricks.com/snippets/css/a-guide-to-flexbox/>`__ 的一个子集。

它可以将项目排列成行或列（轨道(tracks)），处理包裹，调整项目和轨道之间的间距，处理 grow 以使项目填充相对于最小/最大宽度和高度的剩余空间。

要使对象变为 flex 容器请调用 :cpp:expr:`lv_obj_set_layout(obj, LV_LAYOUT_FLEX)` 。

请注意，LVGL 的 flex 布局功能需要打开 ``lv_conf.h`` 中的宏 :c:macro:`LV_USE_FLEX` 启用。


Terms（约定）
**************

.. raw:: html

   <details>
     <summary>显示原文</summary>

-  **tracks**: the rows or columns
-  **main direction**: row or column, the direction in which the items are
   placed
-  **cross direction**: perpendicular to the main direction
-  **wrap**: if there is no more space in the track a new track is started
-  **grow**: if set on an item it will grow to fill the remaining space on
   the track. The available space will be distributed among items
   respective to their grow value (larger value means more space)
-  **gap**: the space between the rows and columns or the items on a track

.. raw:: html

   </details>
   <br>

术语约定：

- **tracks（轨道）**：行或列
- **main direction（主要方向）**：行或列，项目放置的方向
- **cross direction（横向）**：垂直于主方向
- **wrap（包裹）**：如果轨道中没有更多空间，则开始新的轨道放置项目
- **grow（增长）**：如果设置在一个项目上，它将增长以填充轨道上的剩余空间。 可用空间将根据其增长值分配给各个项目（值越大意味着空间越大）
- **gap（间隙）**：行和列或轨道上的项目之间的空间


Simple interface（简单接口）
******************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

With the following functions you can set a Flex layout on any parent.

.. raw:: html

   </details>
   <br>


使用以下功能，可以在任何父级上设置 Flex 布局。


.. _flex_flow:

Flex flow（布局流向）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

:cpp:expr:`lv_obj_set_flex_flow(obj, flex_flow)`

The possible values for ``flex_flow`` are:

- :cpp:enumerator:`LV_FLEX_FLOW_ROW`: Place the children in a row without wrapping
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN`: Place the children in a column without wrapping
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP`: Place the children in a row with wrapping
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_WRAP`: Place the children in a column with wrapping
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_REVERSE`: Place the children in a row without wrapping but in reversed order
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_REVERSE`: Place the children in a column without wrapping but in reversed order
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP_REVERSE`: Place the children in a row with wrapping but in reversed order
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_WRAP_REVERSE`: Place the children in a column with wrapping but in reversed order

.. raw:: html

   </details>
   <br>


设置接口 :cpp:expr:`lv_obj_set_flex_flow(obj, flex_flow)`，其中 ``flex_flow`` 的值可以是：

- :cpp:enumerator:`LV_FLEX_FLOW_ROW`: 将孩子排成一排，不包裹起来
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN`: 将孩子放在一列，不包裹起来
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP`:将孩子按行排列并包裹起来
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_WRAP`:将孩子按列排列并包裹起来
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_REVERSE`: 将孩子排成一排，不包裹起来，但顺序相反
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_REVERSE`: 将孩子放在一列，不包裹起来，但顺序相反
- :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP_REVERSE`: 将孩子按行排列并包裹起来，但顺序相反
- :cpp:enumerator:`LV_FLEX_FLOW_COLUMN_WRAP_REVERSE`: 将孩子按列排列并包裹起来，但顺序相反

（注：flex-flow是flex-direction 与 flex-wrap的结合）


.. _flex_align:

Flex align（对齐方式）
-----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To manage the placement of the children use
:cpp:expr:`lv_obj_set_flex_align(obj,  main_place, cross_place, track_cross_place)`

-  ``main_place`` determines how to distribute the items in their track
   on the main axis. E.g. flush the items to the right on :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP`. (It's called
   ``justify-content`` in CSS)
-  ``cross_place`` determines how to distribute the items in their track
   on the cross axis. E.g. if the items have different height place them
   to the bottom of the track. (It's called ``align-items`` in CSS)
-  ``track_cross_place`` determines how to distribute the tracks (It's
   called ``align-content`` in CSS)

The possible values are:

- :cpp:enumerator:`LV_FLEX_ALIGN_START`: means left on a horizontally and top vertically (default)
- :cpp:enumerator:`LV_FLEX_ALIGN_END`: means right on a horizontally and bottom vertically
- :cpp:enumerator:`LV_FLEX_ALIGN_CENTER`: simply center
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_EVENLY`: items are distributed so
  that the spacing between any two items (and the space to the edges) is
  equal. Does not apply to ``track_cross_place``.
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_AROUND`: items are evenly
  distributed in the track with equal space around them. Note that
  visually the spaces aren't equal, since all the items have equal space
  on both sides. The first item will have one unit of space against the
  container edge, but two units of space between the next item because
  that next item has its own spacing that applies. Not applies to
  ``track_cross_place``.
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_BETWEEN`: items are evenly distributed in
  the track: first item is on the start line, last item on the end line. Not applies to ``track_cross_place``.

.. raw:: html

   </details>
   <br>


要管理孩子的对齐，请使用 :cpp:expr:`lv_obj_set_flex_align(obj,  main_place, cross_place, track_cross_place)`

- ``main_place`` 决定纵向轨道在横向上的分布。 例如。 将 :cpp:enumerator:`LV_FLEX_FLOW_ROW_WRAP` 上的项目向右刷新。 （它在 CSS 中称为 ``justify-content`` ）
- ``cross_place`` 决定横向轨道的项目的分布。 例如。 如果项目具有不同的高度，则将它们放置在轨道的底部。 （在 CSS 中称为 ``align-items`` ）
- ``track_cross_place`` 决定横向轨道在纵向上的分布（在 CSS 中称为  ``align-content`` ）

可能的值为：

- :cpp:enumerator:`LV_FLEX_ALIGN_START`: 表示左侧水平，顶部垂直（默认）
- :cpp:enumerator:`LV_FLEX_ALIGN_END`: 表示右侧水平，底部垂直
- :cpp:enumerator:`LV_FLEX_ALIGN_CENTER`: 只是居中
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_EVENLY`: 项目的分布使得任意两个项目之间的间距（以及到边缘的间距）相等。不适用于 ``cross_place``。
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_AROUND`: 项目在轨道上均匀分布，周围有相等的空间。请注意，从视觉上看，空间并不相等，因为所有项目的两侧都有相等的空间。第一个项目在容器边缘有一个单位的空间，但下一个项目之间有两个单位的间隔，因为下一个项有自己的适用间距。不适用于 ``cross_place``。
- :cpp:enumerator:`LV_FLEX_ALIGN_SPACE_BETWEEN`:  项目在轨道中均匀分布：第一个项目在开始行，最后一个项目在结束行。不适用于 ``cross_place``。


.. _flex_grow:

Flex grow（弹性增长）
----------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Flex grow can be used to make one or more children fill the available
space on the track. When more children have grow parameters, the
available space will be distributed proportionally to the grow values.
For example, there is 400 px remaining space and 4 objects with grow: 

- ``A`` with grow = 1
- ``B`` with grow = 1
- ``C`` with grow = 2

``A`` and ``B`` will have 100 px size, and ``C`` will have 200 px size.

Flex grow can be set on a child with
:cpp:expr:`lv_obj_set_flex_grow(child, value)`. ``value`` needs to be >
1 or 0 to disable grow on the child.

.. raw:: html

   </details>
   <br>


Flex grow（弹性增长）可用于让一个或多个孩子填满轨道上的可用空间。当很多孩子都有生长参数时，可用空间将按比例分配给生长值。例如，还有400像素的剩余空间和4个带有grow的对象：

- ``A`` 增长 = 1
- ``B`` 增长 = 1
- ``C`` 增长 = 2

``A`` 和 ``B`` 的大小为 100 px，而 ``C`` 的大小为 200 px。

可以使用 :cpp:expr:`lv_obj_set_flex_grow(child, value)` 在子节点上设置 Flex 增长值。 ``value`` 需要 > 1 或 0 才能禁用在孩子身上生长。


.. _flex_style:

Style interface（样式接口）
*****************************

.. raw:: html

   <details>
     <summary>显示原文</summary>

All the Flex-related values are style properties under the hood and you
can use them similarly to any other style property.

The following flex related style properties exist:

-  :cpp:enumerator:`FLEX_FLOW`
-  :cpp:enumerator:`FLEX_MAIN_PLACE`
-  :cpp:enumerator:`FLEX_CROSS_PLACE`
-  :cpp:enumerator:`FLEX_TRACK_PLACE`
-  :cpp:enumerator:`FLEX_GROW`

.. raw:: html

   </details>
   <br>


所有与 Flex 相关的值都是底层的样式属性，可以像使用任何其他样式属性一样使用它们。 存在以下与 flex 相关的样式属性：

- :cpp:enumerator:`FLEX_FLOW`
- :cpp:enumerator:`FLEX_MAIN_PLACE`
- :cpp:enumerator:`FLEX_CROSS_PLACE`
- :cpp:enumerator:`FLEX_TRACK_PLACE`
- :cpp:enumerator:`FLEX_GROW`


.. _flex_padding:

Internal padding（内部填充）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To modify the minimum space flexbox inserts between objects, the
following properties can be set on the flex container style:

-  ``pad_row`` Sets the padding between the rows.

-  ``pad_column`` Sets the padding between the columns.

These can for example be used if you don't want any padding between your
objects: :cpp:expr:`lv_style_set_pad_column(&row_container_style,0)`

.. raw:: html

   </details>
   <br>

要修改对象之间的间距，可以在 flex 容器上设置以下样式属性：

-  ``pad_row`` 设置行之间的内边距。
-  ``pad_column`` 设置列之间的内边距。

例如，如果你不希望对象之间有任何填充，可以这样设置： :cpp:expr:`lv_style_set_pad_column(&row_container_style,0)`


.. _flex_other:

Other features（其它功能）
****************************

RTL
-----

.. raw:: html

   <details>
     <summary>显示原文</summary>

If the base direction of the container is set the
:cpp:enumerator:`LV_BASE_DIR_RTL` the meaning of
:cpp:enumerator:`LV_FLEX_ALIGN_START` and
:cpp:enumerator:`LV_FLEX_ALIGN_END` is swapped on ``ROW`` layouts. I.e.
``START`` will mean right.

The items on ``ROW`` layouts, and tracks of ``COLUMN`` layouts will be
placed from right to left.

.. raw:: html

   </details>
   <br>


如果容器的基本方向设置为 :cpp:enumerator:`LV_BASE_DIR_RTL` ，那么 :cpp:enumerator:`LV_FLEX_ALIGN_START` 和 :cpp:enumerator:`LV_FLEX_ALIGN_END` 的意思是在 ``ROW`` 布局上交换，``START`` 的意思是右。 

``ROW`` 布局上的项目和 ``COLUMN`` 布局的轨道将从右向左放置。


New track（新轨道）
---------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

You can force Flex to put an item into a new line with
:cpp:expr:`lv_obj_add_flag(child, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK)`.

.. raw:: html

   </details>
   <br>


可以使用接口 :cpp:expr:`lv_obj_add_flag(child, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK)` 强制 Flex 将项目放入新行。


.. _flex_example:

Example
**********

.. include:: ../examples/layouts/flex/index.rst

.. _flex_api:

API
******
