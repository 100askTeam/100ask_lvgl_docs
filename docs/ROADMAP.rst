
.. |check| replace:: ☑️

.. |uncheck| replace:: 🔲

.. _roadmap:

Roadmap（路线图）
================

v9
--

Schedule（日程）
~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- December 4: Feature stop, start updating the docs and testing
- December 18: Release candidate version and call to test
- January 15: Release v9.0

.. raw:: html

   </details> 
   <br>


- 12 月 4 日：功能停止，开始更新文档和测试
- 12月18日：发布候选版本并调用测试
- 1 月 15 日：发布 v9.0


Naming and API（命名和API）
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |check| `lv_style_set_size()` should have separate width and height parameters
- |check| Reconsider image color formats.
- |check| More consistent names:`remove/clear/delete/del`, `offset/ofs`, `add/create/register`, `id/idx/index`, `middle/mid/center`, `img/image`, `txt/text`, `opa/opacity/alpha`, `scr/screen`, `disp, display`, `finished/complete/completed/ready`, `buf/buffer`,  `..._cb`, `angle/rotation`, `zoom/scale`, `has`, `is`, `enable`
- |check| Update canvas API `LINK <https://github.com/lvgl/lvgl/issues/3393>`__
- |check| `LV_STYLE_PROP_INHERIT` -> `LV_STYLE_PROP_FLAG_INHERITABLE`
  `LINK <https://github.com/lvgl/lvgl/pull/3390#discussion_r885915769>`__
- |check| Replace `disp_drv->direct_mode/full_refresh` with enum.
- |check| Consider flat directory structure. E.g. `extra/widgets` to `widgets`
- |check| Use `uint32_t` and `int32_t` in APIs where possible. Consider hardcoding `int32_t` as `int32_t`.
- |check| To define a new stdlib API use defines `LV_USE_CUSTOM_...` and
  let the user implement `lv_...` functions somewhere (instead of defining the name of the custom functions)
  (see `here <https://github.com/lvgl/lvgl/issues/3481#issuecomment-1206434501>`__)
- |check| Gradient with alpha

.. raw:: html

   </details> 
   <br>


- |check| `lv_style_set_size()` 应该有单独的宽度和高度参数
- |check| 重新考虑图像颜色格式。
- |check| 更一致的名称： `remove/clear/delete/del`, `offset/ofs`, `add/create/register`, `id/idx/index`, `middle/mid/center`, `img/image`, `txt/text`, `opa/opacity/alpha`, `scr/screen`, `disp, display`, `finished/complete/completed/ready`, `buf/buffer`,  `..._cb`, `angle/rotation`, `zoom/scale`, `has`, `is`, `enable`
- |check| 更新画布 API `链接 <https://github.com/lvgl/lvgl/issues/3393>`__
- |check| `LV_STYLE_PROP_INHERIT` -> `LV_STYLE_PROP_FLAG_INHERITABLE` `链接 <https://github.com/lvgl/lvgl/pull/3390#discussion_r885915769>`__
- |check| 将 `disp_drv->direct_mode/full_refresh` 替换为枚举。
- |check| 考虑扁平目录结构。例如， `额外/小部件` 到 `小部件`。
- |check| 尽可能在 API 中使用 `uint32_t` 和 `int32_t` 。考虑将 `int32_t` 硬编码为 `int32_t` 。
- |check| 要定义新的 stdlib API，请使用定义 `LV_USE_CUSTOM_...` 并让用户在某处实现 `lv_...`   函数（而不是定义自定义函数的名称）  (请参阅 `此处 <https://github.com/lvgl/lvgl/issues/3481#issuecomment-1206434501>`__)。
- |check| 带 alpha 的渐变


Architecture（结构）
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |check| Consider merging `lv_disp_drv_t`, `lv_disp_t`, `lv_disp_draw_buf_t`, `lv_draw_ctx_t` `struct`'s from the new driver API (or only some of them)
- |check| New driver architecture #2720
- |check| `draw_ctx->buffer_convert`?
  (see `here <https://github.com/lvgl/lvgl/issues/3379#issuecomment-1147954592>`__)
  Also remove 16 SWAPPED color format?
  (see `here <https://github.com/lvgl/lvgl/issues/3379#issuecomment-1140886258>`__)
- |check| Reconsider masks. There should be a generic high level mask API which is independent of the drawing engine.
  `#4059 <https://github.com/lvgl/lvgl/issues/4059>`__
- |check| `get_glyph_bitmap` should return an a8 bitmap that can be blended immediately.
  (see `here <https://github.com/lvgl/lvgl/pull/3390#pullrequestreview-990710921>`__)
- |check| Make LVGL render independent areas in parallel.
  `#4016 <https://github.com/lvgl/lvgl/issues/4016>`__
- |check| Drop `lv_mem_buf_get` as tlsf should be fast enough for normal allocations too.
  Fragmentation is also lower if processes can completely clean up after themselves.
- |check| More color formats: 24 bit, ARGB1555, ARGB4444 etc
  (see `here <https://forum.lvgl.io/t/keypad-input-device-why-lv-event-long-pressed-only-on-enter/10263>`__)
- |check| Unified caching #3116 #3415
- |check| Variable binding. I.e create properties which can be bound to objects and those objects are notified on value change. Maybe based on `lv_msg`?
- |uncheck| Add GPU abstraction for display rotation
- |check| Replace the `read_line_cb` of the image decoders with `get_area_cb`
- |check| Limit the image caching size in bytes instead of image count
- |check| lv_draw_buf for unified stride, buffer and cache invalidation management. `4241 <https://github.com/lvgl/lvgl/pull/4241>`__
- |check| Add vector graphics support via ThorVG
- |check| SVG support: integrate an SVG render library `4388 <https://github.com/lvgl/lvgl/issues/4388>`__
- |check| Introduce optional ``float`` support. `4648 <https://github.com/lvgl/lvgl/issues/4648>`__
- |check| Introduce support layer for 3D GPUs (OpenGL, SDL, Vulkan, etc).  `4622 <https://github.com/lvgl/lvgl/issues/4622>`__

.. raw:: html

   </details> 
   <br>


- |check| 考虑合并新驱动程序 API 中的 `lv_disp_drv_t`, `lv_disp_t`, `lv_disp_draw_buf_t`, `lv_draw_ctx_t` 和 `struct`'s 结构（或仅其中一些）
- |check| 新的驱动架构#2720
- |check| `draw_ctx->buffer_convert`?(参见 `此处 <https://github.com/lvgl/lvgl/issues/3379#issuecomment-1147954592>`__) 还删除 16 SWAPPED 颜色格式吗？ ( `看这里 <https://github.com/lvgl/lvgl/issues/3379#issuecomment-1140886258>`__ )
- |check| 重新考虑面具。应该有一个独立于绘图引擎的通用高级掩模 API。  `第4059章 <https://github.com/lvgl/lvgl/issues/4059>`__
- |check| `get_glyph_bitmap` 应该返回一个可以立即混合的 a8 位图。( `看这里 <https://github.com/lvgl/lvgl/pull/3390#pullrequestreview-990710921>`__ )
- |check| 使 LVGL 并行渲染独立区域。 `第4016章 <https://github.com/lvgl/lvgl/issues/4016>`__
- |check| 删除lv_mem_buf_get因为 tlsf 对于正常分配来说也应该足够快。如果进程可以完全自行清理，那么碎片也会减少。
- |check| 更多颜色格式：24位、ARGB1555、ARGB4444等( `参见此处 <https://forum.lvgl.io/t/keypad-input-device-why-lv-event-long-pressed-only-on-enter/10263>`__)
- |check| 统一缓存#3116 #3415
- |check| 变量绑定。即创建可以绑定到对象的属性，并且这些对象会在值更改时收到通知。也许基于 `lv_msg`？
- |uncheck| 添加用于显示旋转的 GPU 抽象
- |check| 将图像解码器的 `read_line_cb` 替换为 `get_area_cb`
- |check| 以字节为单位限制图像缓存大小，而不是图像数量
- |check| lv_draw_buf 用于统一步幅、缓冲区和缓存失效管理。 `4241 <https://github.com/lvgl/lvgl/pull/4241>`__
- |check| 通过 ThorVG 添加矢量图形支持
- |check| SVG 支持：集成 SVG 渲染库 `4388 <https://github.com/lvgl/lvgl/issues/4388>`__
- |check| 引入可选 ``float`` 支持。 `4648 <https://github.com/lvgl/lvgl/issues/4648>`__
- |check| 引入 3D GPU 的支持层（OpenGL、SDL、Vulkan 等）。 `4622 <https://github.com/lvgl/lvgl/issues/4622>`__


Styles（风格）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |check| non-uniform scale of images: scale width and height differently
- |check| Scroll anim settings should come from styles to allow customization

.. raw:: html

   </details> 
   <br>


- |check| 图像比例不均匀：宽度和高度的比例不同
- |check| 滚动动画设置应来自允许自定义的样式


Widgets（部件）
~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |check| Universal scale widget/support
- |check| `lv_img`: Reconsider image sizing models
  (when the image size is not content): center, top-left, zoom, tile, other?
- |check| `lv_tabview` Replace button matrix with real buttons for more flexibility
  (see `here <https://forum.lvgl.io/t/linear-meter-bar-with-ticks/10986>`__ and #4043)
- |check| Disabled widgets should absorb indev actions without sending events. `#3860 <https://github.com/lvgl/lvgl/issues/3860>`__

.. raw:: html

   </details> 
   <br>


- |check| 通用秤小部件/支持
- |check| `lv_img`: 重新考虑图像尺寸模型（当图像尺寸不满足要求时）：居中、左上角、缩放、平铺还是其他？
- |check| `lv_tabview` 用真正的按钮替换按钮矩阵以获得更大的灵活性(参见 `此处 <https://forum.lvgl.io/t/linear-meter-bar-with-ticks/10986>`__ 和 第4043章)
- |check| 禁用的小部件应该吸收 indev 操作而不发送事件。 `第3860章 <https://github.com/lvgl/lvgl/issues/3860>`__


Animations（动画）
~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |check| `lv_anim_time_to_speed` should work differently to remove
  `style_anim_speed`. E.g. on large values of anim time store the
  speed. Besides all widgets should use the `style_anim` property.
  `anim` should clamp the time if it's calculated from speed, e.g
  `lv_clamp(200, t, 2000)`. (maybe `a->min_time/max_time`).
- |uncheck| Use dedicated `lv_anim_custom_exec_cb_t`.
  See `here <https://forum.lvgl.io/t/custom-exec-cb-prevents-lv-anim-del-obj-null/10266>`__.

.. raw:: html

   </details> 
   <br>


- |check| `lv_anim_time_to_speed`  应该以不同的方式删除 `style_anim_speed`.。例如，在较大的动画时间值上存储速度。此外，所有小部件都应该使用 `style_anim` 属性。 如果是根据速度计算的， `anim` 应该限制时间，例如 `lv_clamp(200, t, 2000)`。（也许是 `a->min_time/max_time`）。

- |uncheck| 使用专用的 `lv_anim_custom_exec_cb_t`。看 `此处 <https://forum.lvgl.io/t/custom-exec-cb-prevents-lv-anim-del-obj-null/10266>`__ 。


Planned in general（总体规划）
-----------------------------

CI
~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| Platform independent benchmarking #3443
- |uncheck| Run static analyzer
- |uncheck| Release script
- |uncheck| Unit test for all widgets #2337
- |uncheck| CI test for flash/RAM usage #3127


.. raw:: html

   </details> 
   <br>


- |uncheck| 平台独立基准测试 #3443
- |uncheck| 运行静态分析器
- |uncheck| 发布脚本
- |uncheck| 所有小部件的单元测试 #2337
- |uncheck| 闪存/RAM 使用情况的 CI 测试 #3127


Architecture（结构）
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| Add more feature to key presses (long press, release, etc).
- |uncheck| `lv_image_set_src()` use “type-aware” parameter and rework image decoders.
  (see `here <https://github.com/lvgl/lvgl/tree/arch/img-decode-rework>`__)
- |uncheck| `C++ binding <https://github.com/lvgl/lv_binding_cpp>`__
- |uncheck| Markup language #2428


.. raw:: html

   </details> 
   <br>


- |uncheck| 为按键添加更多功能（长按、释放等）。
- |uncheck| `lv_image_set_src()` 使用“类型感知”参数并重新设计图像解码器。(看 `此处 <https://github.com/lvgl/lvgl/tree/arch/img-decode-rework>`__)
- |uncheck| `C++ 绑定 <https://github.com/lvgl/lv_binding_cpp>`__ 
- |uncheck| 标记语言 #2428


Styles（样式）
~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| Hover
- |uncheck| Global states in selectors. E.g. `LV_STATE_PRESSED | SMALL_SCREEN` like media quarry in CSS


.. raw:: html

   </details> 
   <br>


- |uncheck| 悬停
- |uncheck| 选择器中的全局状态。例如 `LV_STATE_PRESSED | SMALL_SCREEN` 就像 CSS 中的媒体采石场


Drawing and rendering（绘图和渲染）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| SW: Line drawing with image rotation
- |uncheck| SW: Arc drawing from small squares (16x16?) to detect transparent or solid parts
- |uncheck| SW: Rounded rectangle drawing from small squares (16x16?) to detect transparent or solid parts
- |uncheck| Different radius on each corner #2800
- |uncheck| Gradient to border/outline/shadow
- |uncheck| Multiple shadow/border
- |uncheck| Perspective
- |uncheck| Text shadow
- |uncheck| Innter shadow
- |uncheck| ARGB image stroke/grow on the alpha map
- |uncheck| Real time blur


.. raw:: html

   </details> 
   <br>


- |uncheck| SW：带图像旋转的线条绘制
- |uncheck| SW：从小方块（16x16？）绘制圆弧以检测透明或实心部分
- |uncheck| SW：从小正方形（16x16？）绘制圆角矩形以检测透明或实心部分
- |uncheck| 每个角的半径不同#2800
- |uncheck| 渐变到边框/轮廓/阴影
- |uncheck| 多个阴影/边框
- |uncheck| 视角
- |uncheck| 文字阴影
- |uncheck| 内阴影
- |uncheck| ARGB 图像在 alpha 贴图上描边/生长
- |uncheck| 实时模糊


Widgets（部件）
~~~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| `lv_bar`, `lv_arc`: handle max < min for fill direction swapping #4039
- |uncheck| `lv_bar`, `lv_slider`, `lv_arc`: make possible to move the knob only inside the background (see `here <https://forum.lvgl.io/t/slider-knob-out-of-the-track/11956>`__)
- |uncheck| Improve `lv_label_align_t` #1656
- |uncheck| `lv_label` reconsider label long modes. (support min/max-width/height too) #3420
- |uncheck| `lv_roller` make it more flexible #4009

.. raw:: html

   </details> 
   <br>


- |uncheck| `lv_bar`, `lv_arc`: 处理填充方向交换的 max < min #4039
- |uncheck| `lv_bar`, `lv_slider`, `lv_arc`: 可以仅在背景内移动旋钮 (参见 `此处 <https://forum.lvgl.io/t/slider-knob-out-of-the-track/11956>`__)
- |uncheck| 改进 `lv_label_align_t` #1656
- |uncheck| `lv_label` 重新考虑标签长模式。（也支持最小/最大宽度/高度）#3420
- |uncheck| `lv_roller` 使其更加灵活#4009


Others（其他）
~~~~~~~~~~~~~

.. raw:: html

   <details>
     <summary>显示原文</summary>

- |uncheck| `em`, `ch`, `vw/vh` units
- |uncheck| `aspect-ratio` as size
- |uncheck| More grid features. E.g. repeat(auto-fill, minmax( px, 1fr))
- |uncheck| Named grid cells to allow updating layouts without touching the children (like CSS `grid-template-areas`)
- |uncheck| Scene support. See `this comment <https://github.com/lvgl/lvgl/issues/2790#issuecomment-965100911>`__
- |uncheck| Circle layout. #2871
- |uncheck| Consider `stagger animations <https://greensock.com/docs/v3/Staggers>`__.
- |uncheck| Add custom indev type. See `here <https://github.com/lvgl/lvgl/issues/3298#issuecomment-1616706654>`__.
- |uncheck| Automatically recalculate the layout if a coordinate is obtained using `lv_obj_get_width/height/x/y/etc`

.. raw:: html

   </details> 
   <br>


- |uncheck| `em`, `ch`, `vw/vh` 单位
- |uncheck| `纵横比` 作为尺寸
- |uncheck| 更多网格功能。例如重复（自动填充，minmax（px，1fr））
- |uncheck| 命名网格单元以允许在不接触子项的情况下更新布局（如 CSS `grid-template-areas`）
- |uncheck| 场景支持。看到See `这个注释 <https://github.com/lvgl/lvgl/issues/2790#issuecomment-965100911>`__
- |uncheck| 圆形布局。第2871章
- |uncheck| 考虑 `交错动画 <https://greensock.com/docs/v3/Staggers>`__。
- |uncheck| 添加自定义 indev 类型。看 `此处 <https://github.com/lvgl/lvgl/issues/3298#issuecomment-1616706654>`__。
- |uncheck| 如果使用 `lv_obj_get_width/height/x/y/etc` 获取坐标，则自动重新计算布局


Ideas（想法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Reconsider how themes should work.
- Better way to reset global variables in `lv_deinit()` #3385
- `lv_array`: replace linked lists with array where possible (arrays are faster and uses less memory)
- Reconsider how to handle UTF-8 characters (allow different encoding too) and Bidi. Maybe create an abstraction for textshaping.
- Consider direct binary font format support
- Improve groups. `Discussion <https://forum.lvgl.io/t/lv-group-tabindex/2927/3>`__.
  Reconsider focusing logic. Allow having no widget selected (on web it's possible). Keep editing state in `lv_obj_t`
  (see `here <https://github.com/lvgl/lvgl/issues/3646>`__). Support slider
  left knob focusing (see `here <https://github.com/lvgl/lvgl/issues/3246>`__)
- Speed up font decompression
- Support larger images: add support for large image #1892
- Functional programming support, pure view?
  (see `here <https://www.freecodecamp.org/news/the-revolution-of-pure-views-aed339db7da4/>`__)
- Style components. (see `this comment <https://github.com/lvgl/lvgl/issues/2790#issuecomment-965100911>`__
- Support dot_begin and dot_middle long modes for labels
- Allow matrix input for image transformation?
- Radial/skew/conic gradient
- Somehow let children inherit the parent's state
- Text on path

.. raw:: html

   </details> 
   <br>


- 重新考虑主题应该如何运作。
- 在 `lv_deinit()` 中重置全局变量的更好方法 第3385章
- `lv_array`: 尽可能用数组替换链表（数组更快并且使用更少的内存）
- 重新考虑如何处理 UTF-8 字符（也允许不同的编码）和 Bidi。也许为文本塑造创建一个抽象。
- 考虑直接二进制字体格式支持
- 改善团体。 `讨论 <https://forum.lvgl.io/t/lv-group-tabindex/2927/3>`__。重新考虑聚焦逻辑。允许不选择任何小部件（在网络上这是可能的）。保持 `lv_obj_t` 中的编辑状态(参见 `此处 <https://github.com/lvgl/lvgl/issues/3646>`__ )。支持滑块左旋钮对焦(参见 `此处 <https://github.com/lvgl/lvgl/issues/3246>`__ )。
- 加快字体解压速度
- 支持更大图像：添加对大图像的支持#1892
- 函数式编程支持，纯视图？(参见 `此处 <https://www.freecodecamp.org/news/the-revolution-of-pure-views-aed339db7da4/>`__ )
- 样式组件。(参见 `这个注释 <https://github.com/lvgl/lvgl/issues/2790#issuecomment-965100911>`__ )
- 支持标签的 dot_begin 和 dot_middle 长模式
- 允许矩阵输入进行图像转换？
- 径向/倾斜/圆锥 渐变
- 以某种方式让子项继承父项的状态
- 路径上的文字