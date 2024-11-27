.. _gridnav:

===========================
Grid navigation（网格导航）
===========================

.. raw:: html

   <details>
     <summary>显示原文</summary>

Grid navigation (gridnav for short) is a feature that changes the
currently focused child object as arrow keys are pressed.

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

Gridnav assumes that the object to which gridnav is added is part of a
:ref:`group <indev_groups>`. This way, if the object with
gridnav is focused, the arrow key presses are automatically forwarded to
the object so that gridnav can process the arrow keys.

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


网格导航（简称gridnav）是一个功能，它会随着箭头键的按下而改变当前焦点对象。

如果子对象被排列成类似网格的布局，那么上、下、左、右箭头将会把焦点移动到相应方向上最近的兄弟节点。

孩子们的位置并不重要，因为只有当前的x和y坐标被考虑在内。这意味着gridnav适用于手动定位的子对象，以及 :ref:`flex` 和 :ref:`grid` 布局。

如果孩子们被排列成单行或单列，gridnav也能正常工作。例如，在 :ref:`List widget <lv_list>` 上简化导航就很有用。

Gridnav假设添加了gridnav的对象是 :ref:`group <indev_groups>` 的一部分。这样，如果带有gridnav的对象被聚焦，箭头键的按下就会自动转发到对象上，以便gridnav能够处理这些箭头键。

使用 :cpp:enumerator:`LV_KEY_NEXT` 或 :cpp:enumerator:`LV_KEY_PREV` 可以将焦点移到组的下一个部件。此外，你也可以像往常一样使用 :cpp:func:`lv_group_focus_next` 或 :cpp:func:`lv_group_focus_prev` 或键盘上的 ``TAB`` 键。

如果容器可以滚动，且焦点子对象在视野之外，gridnav将自动滚动子对象到视野中。


.. _gridnav_usage:

Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

To add the gridnav feature to an object use
:cpp:expr:`lv_gridnav_add(cont, flags)`.

``flags`` control the behavior of gridnav:

- :cpp:enumerator:`LV_GRIDNAV_CTRL_NONE`: Default settings
- :cpp:enumerator:`LV_GRIDNAV_CTRL_ROLLOVER`: If there is no next/previous object in a
  direction, the focus goes to the object in the next/previous row (on
  left/right keys) or first/last row (on up/down keys)
- :cpp:enumerator:`LV_GRIDNAV_CTRL_SCROLL_FIRST`: If an arrow is pressed and the focused
  object can be scrolled in that direction then it will be scrolled instead of
  going to the next/previous object. If there is no more room for scrolling the
  next/previous object will be focused normally
- :cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY`: Only use the left/right keys
  for grid navigation. Up/down key events will be sent to the focused object.
- :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`: Only use the up/down keys
  for grid navigation. Left/right key events will be sent to the focused object.
:cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY` and :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`
should not be used together.
:cpp:expr:`lv_gridnav_remove(cont)` Removes gridnav from an object.

.. raw:: html

   </details>
   <br>


要给对象添加gridnav功能，请使用 :cpp:expr:`lv_gridnav_add(cont, flags)`。

``flags`` 控制gridnav的行为：

- :cpp:enumerator:`LV_GRIDNAV_CTRL_NONE`：默认设置
- :cpp:enumerator:`LV_GRIDNAV_CTRL_ROLLOVER`：如果在某个方向上没有下一个/上一个对象，焦点将转移到下一行/上一行的对象（在左/右键上）或第一行/最后一行的对象（在上/下键上）
- :cpp:enumerator:`LV_GRIDNAV_CTRL_SCROLL_FIRST`：如果按下箭头并且焦点对象可以在该方向上滚动，则它将滚动而不是转到下一个/上一个对象。如果没有更多的滚动空间，则正常情况下将对下一个/上一个对象进行聚焦
- :cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY`：仅使用左/右键,用于网格导航。 向上/向下键事件将被发送到焦点对象。
- :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`：仅使用向上/向下键,用于网格导航。 左/右键事件将被发送到焦点对象。
:cpp:enumerator:`LV_GRIDNAV_CTRL_HORIZONTAL_MOVE_ONLY` 和 :cpp:enumerator:`LV_GRIDNAV_CTRL_VERTICAL_MOVE_ONLY`不应该一起使用。
:cpp:expr:`lv_gridnav_remove(cont)` 从对象中移除gridnav。


Focusable objects（可以聚焦的对象）
----------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

An object needs to be clickable or click focusable
(:cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE` or :cpp:enumerator:`LV_OBJ_FLAG_CLICK_FOCUSABLE`) and not
hidden (:cpp:enumerator:`LV_OBJ_FLAG_HIDDEN`) to be focusable by gridnav.

.. raw:: html

   </details>
   <br>


一个对象需要是可点击的或者有点击焦点 (:cpp:enumerator:`LV_OBJ_FLAG_CLICKABLE`) 和未隐藏 (:cpp:enumerator:`LV_OBJ_FLAG_HIDDEN`) 才能被gridnav聚焦。


.. _gridnav_example:

Example
-------

.. include:: ../examples/others/gridnav/index.rst

.. _gridnav_api:

API
---

