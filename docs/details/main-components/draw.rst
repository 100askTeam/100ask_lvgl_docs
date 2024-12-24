.. _draw:

================
Drawing Pipeline
================

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL has a flexible and extendable drawing pipeline.  You can hook it to do
some rendering with a GPU or even completely replace the built-in
software renderer.

.. raw:: html

   </details>
   <br>

LVGL 拥有一个灵活且可扩展的绘制管线。您可以通过挂钩将其与GPU一起渲染，甚至完全替换内置的软件渲染器。

.. raw:: html

   <details>
     <summary>显示原文</summary>

Overview
********

Draw task
---------


When :cpp:expr:`lv_draw_rect`, :cpp:expr:`lv_draw_label` or similar functions are called
LVGL creates a so called draw task.

Draw unit
---------

The draw tasks are collected in a list and periodically dispatched to draw units. A
draw unit can a CPU core, a GPU, just a new rendering library for certain or all draw tasks,
or basically anything that can draw somehow.

Draw task evaluation
--------------------

Different draw units might render slight different output for example for an image transformation or
a gradient. If such a draw task were assigned to a different draw units, the screen might jitter a
little bit. To resolve it each draw unit has an ``evaluate_cb`` which is called when a draw task is created.
Based on the type and parameters of the draw task each draw unit can decide if it want to assign the
draw task to itself. This way a certain type of draw task (e.g. rounded rectangle with horizontal
gradient) will be always assigned to the same draw unit. It avoid the above mentioned issue of
slight difference between draw units.


Dispatching
-----------

While collecting draw tasks LVGL frequently tries to dispatch the collected draw tasks to the draw units.
This handles via the ``dispatch_cb`` of the draw units.

If a draw unit is busy with another draw task, it just returns. However, it is available it can take a draw task.

:cpp:expr:`lv_draw_get_next_available_task(layer, previous_task, draw_unit_id)` is a useful helper function which
returns an available draw task. "Available draw task" means that, all the draw tasks which should be drawn under a draw task
are ready and it is assigned to the given draw unit.


Layers
------

A layer is a buffer with a given area on which rendering happens. Each display has a "main" layer, but
during rendering additional layers might be created internally to handle for example arbitrary widget transformations.


Hierarchy of modules
--------------------

All these together looks like this

- list of draw units
- display(s)

   - layer(s): Each display has its own list of layers

      - draw tasks: Each layer has its own list of draw tasks

.. raw:: html

   </details>
   <br>

概述
********

绘制任务
---------

当调用 :cpp:expr:`lv_draw_rect`、:cpp:expr:`lv_draw_label` 或类似函数时，LVGL会创建一个所谓的绘制任务（draw task）。  

绘制单元
---------

绘制任务会被收集到一个列表中，并周期性地分配给绘制单元。绘制单元可以是一个CPU核心、一个GPU、一个专门用于某些或所有绘制任务的新渲染库，或者基本上任何可以执行绘制工作的设备。  

绘制任务评估
--------------------

不同的绘制单元可能会对输出产生略微不同的渲染效果，例如图像变换或渐变效果。如果某个绘制任务分配给了不同的绘制单元，屏幕可能会出现轻微的抖动现象。为了解决这个问题，每个绘制单元都有一个 ``evaluate_cb`` 回调函数，该函数会在创建绘制任务时被调用。  

根据绘制任务的类型和参数，每个绘制单元可以决定是否将该绘制任务分配给自己。通过这种方式，某种特定类型的绘制任务（例如带有水平渐变的圆角矩形）将始终分配给相同的绘制单元。这可以避免因绘制单元差异导致的轻微渲染问题。  

任务分配
-----------

在收集绘制任务时，LVGL会频繁尝试将收集到的绘制任务分配给绘制单元。这通过绘制单元的 ``dispatch_cb`` 回调函数进行处理。  

如果绘制单元正忙于其他绘制任务，则它会返回。然而，如果它空闲，则可以接受一个绘制任务。  

:cpp:expr:`lv_draw_get_next_available_task(layer, previous_task, draw_unit_id)` 是一个有用的辅助函数，可返回一个可用的绘制任务。“可用的绘制任务”是指，所有应在某绘制任务下方绘制的任务已完成，并且该任务已分配给指定的绘制单元。  

图层
------

图层是具有特定区域的缓冲区，渲染工作在该缓冲区上进行。每个显示器都有一个“主”图层，但在渲染期间可能会内部创建额外的图层，例如用于处理任意小部件的变换。  

模块层次结构
--------------------

所有这些模块共同构成了以下层次结构：  

- 绘制单元列表  
- 显示器  

   - 图层：每个显示器都有其自己的图层列表  

      - 绘制任务：每个图层都有其自己的绘制任务列表  

.. raw:: html

   <details>
     <summary>显示原文</summary>

References
**********

As a reference take a look at `lv_draw_sw.c <https://github.com/lvgl/lvgl/blob/master/src/draw/sw/lv_draw_sw.c>`__

.. raw:: html

   </details>
   <br>

参考资料
**********

作为参考，可以查看 `lv_draw_sw.c <https://github.com/lvgl/lvgl/blob/master/src/draw/sw/lv_draw_sw.c>`__

API
***

