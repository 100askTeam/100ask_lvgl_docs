.. _gridnav:

===========================
Grid navigation（网格导航）
===========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Grid navigation (gridnav for short) is a feature that changes the
currently focused child Widget as arrow keys are pressed.

If the children are arranged into a grid-like layout then the up, down,
left and right arrows move focus to the nearest sibling in the
respective direction.

It doesn't matter how the children are positioned, as only the current x
and y coordinates are considered. This means that gridnav works with
manually positioned children, as well as :ref:`flex` and
:ref:`grid` layouts.

Gridnav also works if the children are arranged into a single row or
column. That makes it useful, for example, to simplify navigation on a
:ref:`List widget <lv_list>`.

Gridnav assumes that the Widget to which gridnav is added is part of a
:ref:`group <indev_groups>`. This way, if the Widget with
gridnav has focus, the arrow key presses are automatically forwarded to
the Widget so that gridnav can process the arrow keys.

To move the focus to the next widget of the group use
:cpp:enumerator:`LV_KEY_NEXT` or :cpp:enumerator:`LV_KEY_PREV`.
Optionally you can also use :cpp:func:`lv_group_focus_next`
or :cpp:func:`lv_group_focus_prev` or the ``TAB``
key on keyboard as usual.

If the container is scrollable and the focused child is out of the view,
gridnav will automatically scroll the child into view.

.. raw:: html

   </details>
   <br>


Grid navigation（简称 gridnav）是一项功能，可以在按下方向键时更改当前聚焦的子 Widget。

如果子元素排列成网格状布局，则向上、向下、向左和向右的箭头会将焦点移动到相应方向上最近的兄弟节点。

子元素的实际位置无关紧要，因为只考虑当前的 x 和 y 坐标。这意味着 gridnav 可用于手动定位的子元素，也可用于 :ref:`flex` 和 :ref:`grid` 布局。

即使子元素排列成单行或单列，gridnav 也能正常工作。例如，这使其可以简化在 :ref:`List widget <lv_list>` 上的导航。

Gridnav 假设添加了 gridnav 的 Widget 是 :ref:`group <indev_groups>` 的一部分。这样，当具有 gridnav 的 Widget 获得焦点时，方向键的按键事件会自动转发给该 Widget，从而让 gridnav 可以处理方向键。

要将焦点移动到组的下一个 Widget，可以使用 :cpp:enumerator:`LV_KEY_NEXT` 或 :cpp:enumerator:`LV_KEY_PREV`。也可以选择使用 :cpp:func:`lv_group_focus_next` 或 :cpp:func:`lv_group_focus_prev`，或者像通常一样使用键盘上的 ``TAB`` 键。

如果容器是可滚动的，并且聚焦的子元素不在视图范围内，gridnav 会自动将子元素滚动到视图内。


.. _gridnav_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To add the gridnav feature to a Widget use
:cpp:expr:`lv_gridnav_add(cont, flags)`.

``flags`` control the behavior of gridnav:

- :cpp:enumerator:`LV_GRIDNAV_CTRL_NONE`: Default settings
- :cpp:enumerator:`LV_GRIDNAV_CTRL_ROLLOVER`: If there is no next/previous Widget in a
  direction, the focus goes to the Widget in the next/previous row (on
  left/right keys) or first/last row (on up/down keys)
- :cpp:enumerator:`LV_GRIDNAV_CTRL_SCROLL_FIRST`: If an arrow is pressed and the focused
  Widget can be scrolled in that direction then it will be scrolled instead of
  going to the next/previous Widget. If there is no more room for scrolling the
  next/previous Widget will be focused normally
- :cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY`: Only use the left/right keys
  for grid navigation. Up/down key events will be sent to the focused Widget.
- :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`: Only use the up/down keys
  for grid navigation. Left/right key events will be sent to the focused Widget.

:cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY` and :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`
should not be used together.

:cpp:expr:`lv_gridnav_remove(cont)` Removes gridnav from a Widget.

.. raw:: html

   </details>
   <br>


要向 Widget 添加 gridnav 功能，请使用 :cpp:expr:`lv_gridnav_add(cont, flags)`。

``flags`` 用于控制 gridnav 的行为：

- :cpp:enumerator:`LV_GRIDNAV_CTRL_NONE`: 默认设置
- :cpp:enumerator:`LV_GRIDNAV_CTRL_ROLLOVER`: 如果在某个方向上没有下一个/上一个 Widget，则焦点会移动到下一行/上一行（对于左右方向键）或第一行/最后一行（对于上下方向键）的 Widget。
- :cpp:enumerator:`LV_GRIDNAV_CTRL_SCROLL_FIRST`: 如果按下箭头键并且聚焦的 Widget 可以向该方向滚动，则会滚动而不是移动到下一个/上一个 Widget。如果没有更多的滚动空间，则会正常聚焦到下一个/上一个 Widget。
- :cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY`: 仅使用左右方向键进行网格导航。上下方向键事件将发送到聚焦的 Widget。
- :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`: 仅使用上下方向键进行网格导航。左右方向键事件将发送到聚焦的 Widget。

:cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY` 和 :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY` 不应同时使用。

使用 :cpp:expr:`lv_gridnav_remove(cont)` 可从 Widget 移除 gridnav。


Focusable objects（可以聚焦的对象）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A Widget needs to be clickable or click focusable
(:cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` or :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE`) and not
hidden (:cpp:enumerator:`LV_OBJ_FLAG_HIDDEN`) to be focusable by gridnav.

.. raw:: html

   </details>
   <br>

一个 Widget 需要是可点击或可点击聚焦的 (:cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` 或 :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE`)，且未被隐藏 (:cpp:enumerator:`LV_OBJ_FLAG_HIDDEN`)，才能被 gridnav 聚焦。

.. _gridnav_example:

Example
-------

.. include:: ../../examples/others/gridnav/index.rst

.. _gridnav_api:

API
---

