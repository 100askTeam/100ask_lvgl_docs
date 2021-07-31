```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/drawing.md
```
# Drawing（绘画）

<details>
<summary>查看原文</summary>
<p>

With LVGL, you don't need to draw anything manually. Just create objects (like buttons, labels, arc, etc), move and change them, and LVGL will refresh and redraw what is required.

However, it might be useful to have a basic understanding of how drawing happens in LVGL to add customization, make it easier to find bugs or just out of curiosity.

The basic concept is to not draw directly to the screen, but draw to an internal draw buffer first. When drawing (rendering) is ready, that buffer is copied to the screen. 

The draw buffer can be smaller than the screen's size. LVGL will simply render in "tiles" that fit into the given draw buffer.
 
</p>
</details>

使用 LVGL，您无需手动绘制任何内容。只需创建对象（如按钮、标签、圆弧等）、移动和更改它们，LVGL 将刷新并重绘所需的内容。

但是，对 LVGL 中的绘制方式有一个基本的了解以添加自定义、更容易地发现错误或只是出于好奇可能会很有用。

基本概念是不直接绘制到屏幕，而是首先绘制到内部绘制缓冲区。当绘图（渲染）准备好时，该缓冲区被复制到屏幕上。

绘制缓冲区可以小于屏幕的大小。 LVGL 将简单地在适合给定绘制缓冲区的“图块”中进行渲染。

<details>
<summary>查看原文</summary>
<p>

This approach has two main advantages compared to directly drawing to the screen:
1. It avoids flickering while the layers of the UI are drawn. For example, if LVGL drawn directly into the display, when drawing a *background + button + text*, each "stage" would be visible for a short time .
2. It's faster to modify a buffer in internal RAM and finally write one pixel only once than reading/writing the display directly on each pixel access. 
(e.g. via a display controller with SPI interface). 

Note that this concept is different from "traditional" double buffering where there are 2 screen sized frame buffers: 
one holds the current image to show on the display, and rendering happens to the other (inactive) frame buffer, and they are swapped when the rendering is finished. 
The main difference is that with LVGL you don't have to store 2 frame buffers (which usually requires external RAM) but only smaller draw buffer(s) that can easily fit into the internal RAM too.
 
</p>
</details>

与直接绘制到屏幕相比，这种方法有两个主要优点：
1. 避免绘制UI层时闪烁。例如，如果 LVGL 直接绘制到显示中，那么在绘制 *背景 + 按钮 + 文本 * 时，每个“阶段”都会在短时间内可见。
2. 修改内部 RAM 中的缓冲区并最终仅写入一个像素一次比在每个像素访问时直接读取/写入显示更快。
（例如，通过带有 SPI 接口的显示控制器）。

请注意，此概念与“传统”双缓冲不同，后者有 2 个屏幕大小的帧缓冲区：
一个保存当前图像以显示在显示器上，渲染发生在另一个（非活动）帧缓冲区中，渲染完成后它们会被交换。
主要区别在于，使用 LVGL，您不必存储 2 个帧缓冲区（通常需要外部 RAM），而只需存储更小的绘图缓冲区，也可以轻松装入内部 RAM。

## Mechanism of screen refreshing（屏幕刷新机制）

<details>
<summary>查看原文</summary>
<p>

Be sure to get familiar with the [Buffering modes of LVGL](/porting/display) first.

LVGL refreshes the screen in the following steps:
1. Something happens on the UI which requires redrawing. For example, a button is pressed, a chart is changed, an animation happened, etc.
2. LVGL saves the changed object's old and new area into a buffer, called an *Invalid area buffer*. For optimization, in some cases, objects are not added to the buffer:
    - Hidden objects are not added.
    - Objects completely out of their parent are not added.
    - Areas partially out of the parent are cropped to the parent's area.
    - The objects on other screens are not added.
3. In every `LV_DISP_DEF_REFR_PERIOD` (set in `lv_conf.h`) the followings happen:
    - LVGL checks the invalid areas and joins the adjacent or intersecting areas.
    - Takes the first joined area, if it's smaller than the *draw buffer*, then simply render the area's content into the *draw buffer*. 
      If the area doesn't fit into the buffer, draw as many lines as possible to the *draw buffer*.
    - When the area is rendered, call `flush_cb` from the display driver to refresh the display.
    - If the area was larger than the buffer, render the remaining parts too.
    - Do the same with all the joined areas.
 
</p>
</details>

一定要先熟悉[LVGL的缓冲机制](/porting/display)。

LVGL 按以下步骤刷新屏幕：
1. UI 上发生了一些需要重绘的事情。例如，按下按钮、更改图表、发生动画等。
2. LVGL 将改变对象的旧区和新区保存到一个缓冲区中，称为*无效区缓冲区*。为了优化，在某些情况下，不会将对象添加到缓冲区中：
    - 不添加隐藏对象。
    - 不添加完全脱离其父对象的对象。
    - 部分超出父级的区域被裁剪到父级的区域。
    - 不添加其他屏幕上的对象。
3. 在每个 `LV_DISP_DEF_REFR_PERIOD`（在 `lv_conf.h` 中设置）发生以下情况：
    - LVGL 检查无效区域并连接相邻或相交的区域。
    - 获取第一个连接区域，如果它小于 *draw buffer*，则只需将该区域的内容渲染到 *draw buffer* 中。
      如果该区域不适合缓冲区，则在 *draw buffer* 中绘制尽可能多的线。
    - 当区域被渲染时，从显示驱动程序调用 `flush_cb` 来刷新显示。
    - 如果该区域大于缓冲区，也渲染其余部分。
    - 对所有连接的区域执行相同操作。

<details>
<summary>查看原文</summary>
<p>

When an area is redrawn, the library searches the top most object which covers that area, and starts drawing from that object.
For example, if a button's label has changed, the library will see that it's enough to draw the button under the text, and that it's not required to draw the screen under the button too.

The difference between buffering modes regarding the drawing mechanism is the following:
1. **One buffer** - LVGL needs to wait for `lv_disp_flush_ready()` (called from `flush_cb`) before starting to redraw the next part.
2. **Two buffers** -  LVGL can immediately draw to the second buffer when the first is sent to `flush_cb` because the flushing should be done by DMA (or similar hardware) in the background.
3. **Double buffering** -  `flush_cb` should only swap the address of the frame buffer.
 
</p>
</details>

当一个区域被重绘时，库搜索覆盖该区域的最上面的对象，并从该对象开始绘制。
例如，如果按钮的标签发生了变化，库将看到在文本下方绘制按钮就足够了，并且不需要在按钮下方绘制屏幕。

关于绘图机制的缓冲模式之间的区别如下：
1. **One buffer** - LVGL 需要等待 `lv_disp_flush_ready()`（从 `flush_cb` 调用），然后才开始重绘下一部分。
2. **两个缓冲区** - 当第一个缓冲区发送到 `flush_cb` 时，LVGL 可以立即绘制到第二个缓冲区，因为刷新应该由 DMA（或类似硬件）在后台完成。
3. **双缓冲** - `flush_cb` 应该只交换帧缓冲区的地址。

## Masking（蒙版）

<details>
<summary>查看原文</summary>
<p>

*Masking* is the basic concept of LVGL's draw engine. 
To use LVGL it's not required to know about the mechanisms described here, but you might find interesting to know how drawing works under hood. 
Knowing about masking comes in handy if you want to customize drawing.

To learn masking let's learn the steps of drawing first. 
LVGL performs the following steps to render any shape, image or text. It can be considered as a drawing pipeline.

1. **Prepare the draw descriptors** Create a draw descriptor from an object's styles (e.g. `lv_draw_rect_dsc_t`).  This gives us the parameters for drawing, for example the colors, widths, opacity, fonts, radius, etc. 
2. **Call the draw function** Call the draw function with the draw descriptor and some other parameters (e.g. `lv_draw_rect()`).  It renders the primitive shape to the current draw buffer. 
3. **Create masks** If the shape is very simple and doesn't require masks go to #5.  Else create the required masks (e.g. a rounded rectangle mask)
4. **Calculate all the added mask**. It creates 0..255 values into a *mask buffer* with the "shape" of the created masks. 
E.g. in case of a "line mask" according to the parameters of the mask, keep one side of the buffer as it is (255 by default) and set the rest to 0 to indicate that this side should be removed.
5. **Blend a color or image** During blending masks (make some pixels transparent or opaque), blending modes (additive, subtractive, etc) and opacity are handled.
 
</p>
</details>

*Masking* 是 LVGL 绘图引擎的基本概念。
要使用LVGL，不需要了解这里描述的机制，但您可能会发现了解如何在引擎盖下绘制是很有趣的。
如果您想自定义绘图，了解蒙版会派上用场。

要学习蒙版，让我们先学习绘图的步骤。
LVGL 执行以下步骤来渲染任何形状、图像或文本。它可以被认为是一个绘图管道。

1. **准备绘制描述符** 根据对象的样式（例如`lv_draw_rect_dsc_t`）创建绘制描述符。这为我们提供了绘图参数，例如颜色、宽度、不透明度、字体、半径等。
2. **调用绘图函数** 使用绘图描述符和一些其他参数（例如`lv_draw_rect()`）调用绘图函数。它将原始形状渲染到当前绘制缓冲区。
3. **创建蒙版** 如果形状非常简单并且不需要蒙版，请转到#5。否则创建所需的蒙版（例如圆角矩形蒙版）
4. **计算所有添加的蒙版**。它使用创建的蒙版的“形状”将 0..255 个值创建到 *蒙版缓冲区* 中。
例如。如果根据蒙版的参数出现“线蒙版”，则将缓冲区的一侧保持原样（默认为 255）并将其余部分设置为 0 以指示应删除该侧。
5. **混合颜色或图像** 在混合蒙版（使一些像素透明或不透明）期间，处理混合模式（加法、减法等）和不透明度。

<details>
<summary>查看原文</summary>
<p>

LVGL has the following built-in mask types which can be calculated and applied real-time:
- `LV_DRAW_MASK_TYPE_LINE` Removes a side from a line (top, bottom, left or right). `lv_draw_line` uses 4 of it. 
Essentially, every (skew) line is bounded with 4 line masks by forming a rectangle.
- `LV_DRAW_MASK_TYPE_RADIUS` Removes the inner or outer parts of a rectangle which can have radius. It's also used to create circles by setting the radius to large value (`LV_RADIUS_CIRCLE`) 
- `LV_DRAW_MASK_TYPE_ANGLE` Removes a circle sector. It is used by `lv_draw_arc` to remove the "empty" sector. 
- `LV_DRAW_MASK_TYPE_FADE` Create a vertical fade (change opacity) 
- `LV_DRAW_MASK_TYPE_MAP` The mask is stored in an array and the necessary parts are applied 
 
</p>
</details>

LVGL 具有以下可以实时计算和应用的内置蒙版类型：
- `LV_DRAW_MASK_TYPE_LINE` 从一条线（顶部、底部、左侧或右侧）中删除一侧。 `lv_draw_line` 使用了其中的 4 个。
本质上，每条（倾斜）线都通过形成一个矩形以 4 个线掩模为界。
- `LV_DRAW_MASK_TYPE_RADIUS` 移除可以有半径的矩形的内部或外部部分。它还用于通过将半径设置为大值（`LV_RADIUS_CIRCLE`）来创建圆
- `LV_DRAW_MASK_TYPE_ANGLE` 删除一个圆形扇区。 `lv_draw_arc` 使用它来删除“空”扇区。
- `LV_DRAW_MASK_TYPE_FADE` 创建垂直淡入淡出（改变不透明度）
- `LV_DRAW_MASK_TYPE_MAP` 蒙版存储在一个数组中，并应用必要的部分

<details>
<summary>查看原文</summary>
<p>

Masks are used the create almost every basic primitives:
- **letters** Create a mask from the letter and draw a rectangle with the letter's color considering the mask.
- **line** Created from 4 "line masks", to mask out the left, right, top and bottom part of the line to get perfectly perpendicular line ending.
- **rounded rectangle** A mask is created real-time to add radius to the corners.
- **clip corner** To clip to overflowing content (usually children) on the rounded corners also a rounded rectangle mask is applied.
- **rectangle border** Same as a rounded rectangle, but inner part is masked out too.
- **arc drawing** A circle border is drawn, but an arc mask is applied too.
- **ARGB images** The alpha channel is separated into a mask and the image is drawn as a normal RGB image.
 
</p>
</details>

蒙版用于创建几乎所有基本图元：
- **字母** 根据字母创建一个蒙版，并根据蒙版用字母的颜色绘制一个矩形。
- **line** 由 4 个“线蒙版”创建，用于遮住线的左、右、上和下部分，以获得完美垂直的线尾。
- **圆角矩形** 实时创建蒙版以向角添加半径。
- **剪辑角落** 为了剪辑到圆角上的溢出内容（通常是儿童），还应用了圆角矩形蒙版。
- **矩形边框** 与圆角矩形相同，但内部部分也被屏蔽了。
- **圆弧绘制** 绘制了圆形边框，但也应用了圆弧蒙版。
- **ARGB 图像** alpha 通道被分离成一个蒙版，图像被绘制为一个普通的 RGB 图像。

## Hook drawing（挂钩绘图）

<details>
<summary>查看原文</summary>
<p>

Although widgets can be very well customized by styles there might be cases when something really custom is required. 
To ensure a great level of flexibility LVGL sends a lot events during drawing with parameters that tell what LVGL is about to draw. 
Some fields of these parameters can be modified to draw something else or any custom drawing can be added manually.

A good use case for it is the [Button matrix](/widgets/core/btnmatrix) widget. By default its buttons can be styled in different states but you can't style the buttons one by one. 
However, an event is sent for every button and you can for example tell LVGL to use different colors on a specific button or to manually draw an image on some buttons.

Below each of these events are described in detail.
 
</p>
</details>

尽管小部件可以通过样式很好地自定义，但在某些情况下可能需要真正自定义。
为了确保高度的灵活性，LVGL 在绘制过程中发送了很多事件，并带有告诉 LVGL 将要绘制什么的参数。
可以修改这些参数的某些字段以绘制其他内容，或者可以手动添加任何自定义绘图。

它的一个很好的用例是 [Button matrix](/widgets/core/btnmatrix) 小部件。默认情况下，它的按钮可以在不同状态下设置样式，但您不能一个一个地设置按钮样式。
但是，每个按钮都会发送一个事件，例如，您可以告诉 LVGL 在特定按钮上使用不同的颜色或在某些按钮上手动绘制图像。
下面详细描述了这些事件中的每一个。

### Main drawing（主图）

<details>
<summary>查看原文</summary>
<p>

These events are related to the actual drawing of the object. E.g. drawing of buttons, texts, etc happens here.

`lv_event_get_clip_area(event)` can be used to get the current clip area. The clip area is required in draw functions to make them draw only on a limited area. 
 
</p>
</details>

这些事件与对象的实际绘制有关。例如。按钮、文本等的绘制发生在这里。

`lv_event_get_clip_area(event)`可以用来获取当前的剪辑区域。绘制函数中需要剪辑区域，以使它们仅在有限的区域上绘制。

#### LV_EVENT_DRAW_MAIN_BEGIN

<details>
<summary>查看原文</summary>
<p>

Sent before starting to draw an object. This is a good place to add masks manually. E.g. add a line mask that "removes" the right side of an object.
 
</p>
</details>

在开始绘制对象之前发送。这是手动添加蒙版的好地方。例如。添加一个“删除”对象右侧的线蒙版。

#### LV_EVENT_DRAW_MAIN

<details>
<summary>查看原文</summary>
<p>

The actual drawing of the object happens in this event. E.g. a rectangle for a button is drawn here. First, the widgets' internal events are called to perform drawing and after that you can draw anything on top of them.
For example you can add a custom text or an image.
 
</p>
</details>

对象的实际绘制发生在此事件中。例如。这里绘制了一个按钮的矩形。首先，调用小部件的内部事件来执行绘图，然后您可以在它们之上绘制任何内容。
例如，您可以添加自定义文本或图像。

#### LV_EVENT_DRAW_MAIN_END

<details>
<summary>查看原文</summary>
<p>

Called when the main drawing is finished. You can draw anything here as well and it's also good place to remove the masks created in `LV_EVENT_DRAW_MAIN_BEGIN`.
 
</p>
</details>

在主绘图完成时调用。你也可以在这里画任何东西，它也是删除在`LV_EVENT_DRAW_MAIN_BEGIN`中创建的蒙版的好地方。

### Post drawing（后绘图）

<details>
<summary>查看原文</summary>
<p>

Post drawing events are called when all the children of an object are drawn. For example LVGL use the post drawing phase to draw the scrollbars because they should be above all the children. 

`lv_event_get_clip_area(event)` can be used to get the current clip area.
 
</p>
</details>

当绘制对象的所有子项时，会调用绘制后事件。例如，LVGL 使用后期绘制阶段来绘制滚动条，因为它们应该位于所有子项之上。
`lv_event_get_clip_area(event)`可以用来获取当前的剪辑区域。

#### LV_EVENT_DRAW_POST_BEGIN

<details>
<summary>查看原文</summary>
<p>

Sent before starting the post draw phase. Masks can be added here too to mask out the post drawn content.

</p>
</details>

在开始绘制后阶段之前发送。也可以在此处添加遮罩以遮蔽后期绘制的内容。

#### LV_EVENT_DRAW_POST

<details>
<summary>查看原文</summary>
<p>

The actual drawing should happen here.
 
</p>
</details>

实际绘图应该发生在这里。

#### LV_EVENT_DRAW_POST_END

<details>
<summary>查看原文</summary>
<p>

Called when post drawing has finished. If the masks were not removed in `LV_EVENT_DRAW_MAIN_END` they should be removed here.
 
</p>
</details>

在后期绘制完成时调用。如果在`LV_EVENT_DRAW_MAIN_END` 中没有移除遮罩，则应在此处移除。

### Part drawing（零件绘图）

<details>
<summary>查看原文</summary>
<p>

When LVGL draws a part of an object (e.g. a slider's indicator, a table's cell or a button matrix's button) it sends events before and after drawing that part with some context of the drawing.
It allows changing the parts on a very low level with masks, extra drawing, or changing the parameters that LVGL is planning to use for drawing.

In these events an `lv_obj_draw_part_t` structure is used to describe the context of the drawing. Not all fields are set for every part and widget. 
To see which fields are set for a widget see the widget's documentation.

`lv_obj_draw_part_t` has the following fields:
 
</p>
</details>

当 LVGL 绘制对象的一部分（例如滑块的指示器、表格的单元格或按钮矩阵的按钮）时，它会在绘制该部分之前和之后使用绘图的某些上下文发送事件。
它允许使用蒙版、额外绘图或更改 LVGL 计划用于绘图的参数在非常低的级别上更改零件。

在这些事件中，`lv_obj_draw_part_t` 结构用于描述绘图的上下文。并非为每个部件和小部件设置所有字段。
要查看为小部件设置了哪些字段，请参阅小部件的文档。

`lv_obj_draw_part_t` 具有以下字段：

```c
// Always set
const lv_area_t * clip_area;        // The current clip area, required if you need to draw something in the event
uint32_t part;                      // The current part for which the event is sent
uint32_t id;                        // The index of the part. E.g. a button's index on button matrix or table cell index.

// Draw desciptors, set only if related
lv_draw_rect_dsc_t * rect_dsc;      // A draw descriptor that can be modified to changed what LVGL will draw. Set only for rectangle-like parts
lv_draw_label_dsc_t * label_dsc;    // A draw descriptor that can be modified to changed what LVGL will draw. Set only for text-like parts
lv_draw_line_dsc_t * line_dsc;      // A draw descriptor that can be modified to changed what LVGL will draw. Set only for line-like parts
lv_draw_img_dsc_t *  img_dsc;       // A draw descriptor that can be modified to changed what LVGL will draw. Set only for image-like parts
lv_draw_arc_dsc_t *  arc_dsc;       // A draw descriptor that can be modified to changed what LVGL will draw. Set only for arc-like parts

// Other paramters 
lv_area_t * draw_area;              // The area of the part being drawn
const lv_point_t * p1;              // A point calculated during drawing. E.g. a point of chart or the center of an arc.
const lv_point_t * p2;              // A point calculated during drawing. E.g. a point of chart.
char text[16];                      // A text calculated during drawing. Can be modified. E.g. tick labels on a chart axis.
lv_coord_t radius;                  // E.g. the radius of an arc (not the corner radius).
int32_t value;                      // A value calculated during drawing. E.g. Chart's tick line value.
const void * sub_part_ptr;          // A pointer the identifies something in the part. E.g. chart series. 
```

<details>
<summary>查看原文</summary>
<p>

`lv_event_get_draw_part_dsc(event)` can be used to get a pointer to `lv_obj_draw_part_t`.
 
</p>
</details>

`lv_event_get_draw_part_dsc(event)` 可用于获取指向 `lv_obj_draw_part_t` 的指针。

#### LV_EVENT_DRAW_PART_BEGIN

<details>
<summary>查看原文</summary>
<p>

Start the drawing of a part. This is a good place to modify the draw descriptors (e.g. `rect_dsc`), or add masks.
  
</p>
</details>

开始绘制零件。这是修改绘图描述符（例如`rect_dsc`）或添加遮罩的好地方。

#### LV_EVENT_DRAW_PART_END
 
<details>
<summary>查看原文</summary>
<p>

Finish the drawing of a part. This is a good place to draw extra content on the part, or remove the masks added in `LV_EVENT_DRAW_PART_BEGIN`.
 
</p>
</details>

完成零件的绘制。这是在零件上绘制额外内容的好地方，或者删除在`LV_EVENT_DRAW_PART_BEGIN` 中添加的蒙版。

### Others（其他）

#### LV_EVENT_COVER_CHECK   

<details>
<summary>查看原文</summary>
<p>

This event is used to check whether an object fully covers an area or not. 

`lv_event_get_cover_area(event)` returns an pointer to an area to check and `lv_event_set_cover_res(event, res)` can be used to set one of these results:
- `LV_COVER_RES_COVER` the areas is fully covered by the object
- `LV_COVER_RES_NOT_COVER` the areas is not covered by the object
- `LV_COVER_RES_MASKED` there is a mask on the object so it can not cover the area

Here are some reasons why an object would be unable to fully cover an area:
- It's simply not fully in area
- It has a radius
- It has not 100% background opacity
- It's an ARGB or chroma keyed image
- It does not have normal blending mode. In this case LVGL needs to know the colors under the object to do the blending properly
- It's a text, etc 
 
</p>
</details>

此事件用于检查对象是否完全覆盖一个区域。

`lv_event_get_cover_area(event)` 返回一个指向要检查的区域的指针，`lv_event_set_cover_res(event, res)` 可用于设置以下结果之一：
- `LV_COVER_RES_COVER` 区域被对象完全覆盖
- `LV_COVER_RES_NOT_COVER` 区域未被对象覆盖
- `LV_COVER_RES_MASKED` 对象上有一个遮罩，所以它不能覆盖该区域

以下是物体无法完全覆盖区域的一些原因：
- 它只是不完全在区域内
- 它有一个半径
- 它没有 100% 的背景不透明度
- 这是一个 ARGB 或色度键控图像
- 它没有正常的混合模式。在这种情况下，LVGL 需要知道对象下的颜色才能正确进行混合
- 这是一个文本等

<details>
<summary>查看原文</summary>
<p>

In short if for any reason the area below the object is visible than it doesn't cover that area.

Before sending this event LVGL checks if at least the widget's coordinates fully cover the area or not. If not the event is not called.

You need to check only the drawing you have added. The existing properties known by widget are handled in the widget's internal events. 
E.g. if a widget has &gt; 0 radius it might not cover an area but you need to handle `radius` only if you will modify it and the widget can't know about it. 
 
</p>
</details>

简而言之，如果由于某种原因对象下方的区域是可见的，则它不覆盖该区域。

在发送此事件之前，LVGL 检查至少小部件的坐标是否完全覆盖该区域。如果不是，则不会调用该事件。

您只需要检查您添加的图纸。小部件已知的现有属性在小部件的内部事件中处理。
例如。如果小部件具有 > 0 半径，它可能不会覆盖一个区域，但只有当您修改它并且小部件无法知道它时，您才需要处理“半径”。

#### LV_EVENT_REFR_EXT_DRAW_SIZE

<details>
<summary>查看原文</summary>
<p>

If you need to draw outside of a widget LVGL needs to know about it to provide the extra space for drawing. 
Let's say you create an event the writes the current value of a slider above its knob. In this case LVGL needs to know that the slider's draw area should be larger with the size required for the text.

You can simple set the required draw area with `lv_event_set_ext_draw_size(e, size)`. 
 
</p>
</details>

如果您需要在小部件之外绘制，LVGL 需要了解它以提供额外的绘制空间。
假设您创建了一个事件，将滑块的当前值写入其旋钮上方。在这种情况下，LVGL 需要知道滑块的绘制区域应该与文本所需的大小相同。

您可以使用 `lv_event_set_ext_draw_size(e, size)` 简单设置所需的绘图区域。
