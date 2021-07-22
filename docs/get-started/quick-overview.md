```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/get-started/quick-overview.md
```

# Quick overview （快速概览）

<details>
<summary>查看原文</summary>
<p>

Here you can learn the most important things about LVGL.
You should read this first to get a general impression and read the detailed [Porting](/porting/index) and [Overview](/overview/index) sections after that.

</p>
</details>

在这里您可以了解有关 LVGL 的最重要的事情。
您应该先阅读本文以获得大致印象，然后再阅读详细的 [移植](/porting/index) 和 [概述](/overview/index) 部分。

## Get started in a simulator（从模拟器开始）

<details>
<summary>查看原文</summary>
<p>

Instead of porting LVGL to embedded hardware straight away, it's highly recommended to get started in a simulator first. 

</p>
</details>

强烈建议您先在lvgl模拟器上开始学习实验，而不是立即将 LVGL 移植到嵌入式硬件。

<details>
<summary>查看原文</summary>
<p>

LVGL is ported to many IDEs to be sure you will find your favorite one. 
Go to the [Simulators](/get-started/pc-simulator) section to get ready-to-use projects that can be run on your PC. 
This way you can save the time of porting for now and get some experience with LVGL immediately. 

</p>
</details>

LVGL 已适配到许多 IDE，以确保您能找到自己喜欢的一种模拟器开发环境。转到 [模拟器](/get-started/pc-simulator)  部分以获取可以在您的 PC 上运行的即用型项目。通过这种方式，您可以暂时节省移植时间并立即获得一些使用 LVGL 的经验。(这是非常有用的！)

## Add LVGL into your project（将 LVGL 添加到您的项目中）

<details>
<summary>查看原文</summary>
<p>

If you would rather try LVGL on your own project follow these steps:

</p>
</details>

如果您更愿意在自己的项目中尝试 LVGL，请按照以下步骤操作：

<details>
<summary>查看原文</summary>
<p>

- [Download](https://github.com/lvgl/lvgl/archive/master.zip) or clone the library from GitHub with `git clone https://github.com/lvgl/lvgl.git`.
- Copy the `lvgl` folder into your project.
- Copy `lvgl/lv_conf_template.h` as `lv_conf.h` next to the `lvgl` folder, change the first `#if 0` to `1` to enable the file's content and set the `LV_COLOR_DEPTH` defines.
- Include `lvgl/lvgl.h` in files where you need to use LVGL related functions.
- Call `lv_tick_inc(x)` every `x` milliseconds in a Timer or Task (`x` should be between 1 and 10). It is required for the internal timing of LVGL. 
Alternatively, configure `LV_TICK_CUSTOM` (see `lv_conf.h`) so that LVGL can retrieve the current time directly.
- Call `lv_init()`
- Create a draw buffer: LVGL will render the graphics here first, and send the rendered image to the display. 
The buffer size can be set freely but 1/10 screen size is a good starting point. 

</p>
</details>

- 使用git命令 `git clone https://github.com/lvgl/lvgl.git` 从 GitHub 下载或克隆库。
- 将 `lvgl` 文件夹复制到您的项目中。
- 将 `lvgl/lv_conf_template.h` 作为 `lv_conf.h` 复制到 `lvgl` 文件夹旁边，将其第一个的 `#if 0` 更改为 `1` 以使能文件的内容并修改设置 `LV_COLOR_DEPTH` 宏。
- 在需要使用 LVGL 相关函数的文件中包含 `lvgl/lvgl.h` 。
- 在计时器或任务中每 `x` 毫秒调用一次 `lv_tick_inc(x)`（`x` 应该在 1 到 10 之间）。 LVGL 的内部时序需要它。或者，配置 `LV_TICK_CUSTOM`（参见 `lv_conf.h` ），以便 LVGL 可以直接检索当前时间。
- 调用 `lv_init()` (初始化lvgl库)
- 创建一个绘制缓冲区：LVGL 将首先在此处渲染图形，并将渲染的图像发送到显示器。
缓冲区大小可以自由设置，但 1/10 屏幕大小是一个很好的起点。


```c
static lv_disp_draw_buf_t draw_buf;
static lv_color_t buf1[DISP_HOR_RES * DISP_VER_RES / 10];                        /*Declare a buffer for 1/10 screen size*/
lv_disp_draw_buf_init(&draw_buf, buf1, NULL, MY_DISP_HOR_RES * MY_DISP_VER_SER / 10);  /*Initialize the display buffer.*/
```

<details>
<summary>查看原文</summary>
<p>

- Implement and register a function which can copy the rendered image to an area of your display:

</p>
</details>

实现并注册一个函数，该函数可以将渲染图像复制到显示区域：

```c
lv_disp_drv_t disp_drv;               /*Descriptor of a display driver*/
lv_disp_drv_init(&disp_drv);          /*Basic initialization*/
disp_drv.flush_cb = my_disp_flush;    /*Set your driver function*/
disp_drv.buffer = &draw_buf;          /*Assign the buffer to the display*/
disp_drv.hor_res = MY_DISP_HOR_RES;   /*Set the horizontal resolution of the display*/
disp_drv.hor_res = MY_DISP_VER_RES;   /*Set the verizontal resolution of the display*/
lv_disp_drv_register(&disp_drv);      /*Finally register the driver*/

void my_disp_flush(lv_disp_drv_t * disp, const lv_area_t * area, lv_color_t * color_p)
{
    int32_t x, y;
    /*It's a very slow but simple implementation.
     *`set_pixel` needs to be written by you to a set pixel on the screen*/
    for(y = area->y1; y <= area->y2; y++) {
        for(x = area->x1; x <= area->x2; x++) {
            set_pixel(x, y, *color_p);
            color_p++;
        }
    }

    lv_disp_flush_ready(disp);         /* Indicate you are ready with the flushing*/
}

```

<details>
<summary>查看原文</summary>
<p>

- Implement and register a function which can read an input device. E.g. for a touch pad:

</p>
</details>

- 实现并注册一个可以读取输入设备的函数。例如。对于触摸板：

```c
lv_indev_drv_t indev_drv;                  /*Descriptor of a input device driver*/
lv_indev_drv_init(&indev_drv);             /*Basic initialization*/
indev_drv.type = LV_INDEV_TYPE_POINTER;    /*Touch pad is a pointer-like device*/
indev_drv.read_cb = my_touchpad_read;      /*Set your driver function*/
lv_indev_drv_register(&indev_drv);         /*Finally register the driver*/

bool my_touchpad_read(lv_indev_t * indev, lv_indev_data_t * data)
{
    /*`touchpad_is_pressed` and `touchpad_get_xy` needs to be implemented by you*/
    if(touchpad_is_pressed()) {
      data->state = LV_INDEV_STATE_PRESSED;
      touchpad_get_xy(&data->point.x, &data->point.y);
    } else {
      data->state = LV_INDEV_STATE_RELEASED;
    }
 
}
```

<details>
<summary>查看原文</summary>
<p>

- Call `lv_timer_handler()` periodically every few milliseconds in the main `while(1)` loop or in an operating system task.
It will redraw the screen if required, handle input devices, animation etc.

</p>
</details>

- 在主`while(1)` 循环或操作系统任务中每隔几毫秒定期调用`lv_timer_handler()`。
如果需要，它将重绘屏幕，处理输入设备，动画等。

<details>
<summary>查看原文</summary>
<p>

For a more detailed guide go to the [Porting](/porting/index) section.

</p>
</details>

有关更详细的指南，请转到 [移植](/porting/index) 部分。

## Learn the basics（学习基础知识）

### Widgets（部件）

<details>
<summary>查看原文</summary>
<p>

The graphical elements like Buttons, Labels, Sliders, Charts etc. are called objects or widgets. Go to [Widgets](/widgets/index) to see the full list of available widgets.

</p>
</details>

按钮、标签、滑块、图表等图形元素称为对象或小部件。转到 [部件](/widgets/index) 以查看可用小部件的完整列表。

<details>
<summary>查看原文</summary>
<p>

Every object has a parent object where it is created. For example if a label is created on a button, the button is the parent of label. 

</p>
</details>

每个对象都有一个创建它的父对象。例如，如果在按钮上创建标签，则该按钮是标签的父级。

<details>
<summary>查看原文</summary>
<p>

The child object moves with the parent and if the parent is deleted the children will be deleted too. 

</p>
</details>

子对象与父对象一起移动，如果删除父对象，子对象也将被删除。

<details>
<summary>查看原文</summary>
<p>

Children can be visible only on their parent. It other words, the parts of the children outside of the parent are clipped.

</p>
</details>

子项只能在其父项上可见。换句话说，父级之外的子级部分被剪掉了。

<details>
<summary>查看原文</summary>
<p>

A Screen is the "root" parent. You can have any number of screens. 

</p>
</details>

Screen 是“根”父级。您可以拥有任意数量的屏幕。

<details>
<summary>查看原文</summary>
<p>

To get the current screen call `lv_scr_act()`, and to load a screen use `lv_scr_load(scr1)`.

</p>
</details>

要获取当前屏幕调用 `lv_scr_act()`，并使用 `lv_scr_load(scr1)` 加载屏幕。

<details>
<summary>查看原文</summary>
<p>

You can create a new object with `lv_<type>_create(parent)`. It will return an `lv_obj_t *` variable that can be used as a reference to the object to set its parameters.

</p>
</details>

您可以使用 `lv_<type>_create(parent)` 创建一个新对象。它将返回一个 `lv_obj_t *` 变量，该变量可用作对象的引用以设置其参数。

For example（例如）:
```c
lv_obj_t * slider1 = lv_slider_create(lv_scr_act());
```

<details>
<summary>查看原文</summary>
<p>

To set some basic attributes `lv_obj_set_<parameter_name>(obj, <value>)` functions can be used. For example:

</p>
</details>

要设置一些基本属性，可以使用`lv_obj_set_<parameter_name>(obj, <value>)` 函数。例如：

```c
lv_obj_set_x(btn1, 30);
lv_obj_set_y(btn1, 10);
lv_obj_set_size(btn1, 200, 50);
```

<details>
<summary>查看原文</summary>
<p>

The widgets have type specific parameters too which can be set by `lv_<widget_type>_set_<parameter_name>(obj, <value>)` functions. For example:

</p>
</details>

这些小部件也具有类型特定的参数，可以通过 `lv_<widget_type>_set_<parameter_name>(obj, <value>)` 函数设置。例如：

```c
lv_slider_set_value(slider1, 70, LV_ANIM_ON);
```

<details>
<summary>查看原文</summary>
<p>

To see the full API visit the documentation of the widgets or the related header file (e.g. [lvgl/src/widgets/lv_slider.h](https://github.com/lvgl/lvgl/blob/master/src/widgets/lv_slider.h)).

</p>
</details>

要查看完整的 API，请访问小部件的文档或相关的头文件（例如  [lvgl/src/widgets/lv_slider.h](https://github.com/lvgl/lvgl/blob/master/src/widgets/lv_slider.h)）。

### Events（事件）

<details>
<summary>查看原文</summary>
<p>

Events are used to inform the user that something has happened with an object. 
You can assign one or more callbacks to an object which will be called if the object is clicked, released, dragged, being deleted etc. 

A callback is assigned like this:

</p>
</details>

事件用于通知用户某个对象发生了某些事情。
您可以将一个或多个回调分配给一个对象，如果该对象被单击、释放、拖动、删除等将被调用。

一个回调是这样分配的：

```c
lv_obj_add_event_cb(btn, btn_event_cb, LV_EVENT_CLICKED, NULL); /*Assign a callback to the button*/

...

void btn_event_cb(lv_event_t * e)
{
    printf("Clicked\n");
}
```

<details>
<summary>查看原文</summary>
<p>

Instead of `LV_EVENT_CLICKED` `LV_EVENT_ALL` can be used too to call the callback for any event. 

From `lv_event_t * e` the current event code can be get with

</p>
</details>

代替`LV_EVENT_CLICKED``LV_EVENT_ALL`也可用于调用任何事件的回调。

从 `lv_event_t * e` 可以得到当前的事件代码

```c
lv_event_code_t code = lv_event_get_code(e);
```

<details>
<summary>查看原文</summary>
<p>

The object that triggered the event can be retrieved with

</p>
</details>

触发事件的对象可以用

```c
lv_obj_t * obj = lv_event_get_target(e);
```

<details>
<summary>查看原文</summary>
<p>

To learn all features of the events go to the [Event overview](/overview/event) section.

</p>
</details>

要了解事件的所有功能，请转到 [事件概述](/overview/event) 部分。

### Parts（部分）

<details>
<summary>查看原文</summary>
<p>

Widgets might be built from one or more *parts*. For example a button has only one part called `LV_PART_MAIN`.
However, a [Slider](/widgets/core/slider) has `LV_PART_MAIN`, `LV_PART_INDICATOR` and `LV_PART_KNOB`.

</p>
</details>

部件可能由一个或多个部分构建。例如，一个按钮只有一个名为 LV_PART_MAIN 的部分。但是，[滑块](/widgets/core/slider) 具有 `LV_PART_MAIN` 、 `LV_PART_INDICATOR` 和 `LV_PART_KNOB` 。

<details>
<summary>查看原文</summary>
<p>

By using parts you can apply different styles to different parts. (See below)

</p>
</details>

通过使用零件，您可以将不同的样式应用于不同的零件。 （见下文）

<details>
<summary>查看原文</summary>
<p>

To learn which parts are used by which object read the widgets' documentation.

</p>
</details>

要了解哪个对象使用了哪些部件，请阅读 [部件](widgets/index) 的文档。

### States（状态）

<details>
<summary>查看原文</summary>
<p>

The objects can be in a combination of the following states:

</p>
</details>

对象可以处于以下状态的组合：

<details>
<summary>查看原文</summary>
<p>

- `LV_STATE_DEFAULT`  Normal, released state
- `LV_STATE_CHECKED`  Toggled or checked state
- `LV_STATE_FOCUSED` Focused via keypad or encoder or clicked via touchpad/mouse 
- `LV_STATE_FOCUS_KEY`  Focused via keypad or encoder but not via touchpad/mouse 
- `LV_STATE_EDITED` Edit by an encoder
- `LV_STATE_HOVERED` Hovered by mouse (not supported now)
- `LV_STATE_PRESSED` Being pressed
- `LV_STATE_SCROLLED` Being scrolled
- `LV_STATE_DISABLED` Disabled 

</p>
</details>

- `LV_STATE_DEFAULT` 正常，释放状态
- `LV_STATE_CHECKED` 切换或选中状态
- `LV_STATE_FOCUSED` 通过键盘或编码器聚焦或通过触摸板/鼠标点击
- `LV_STATE_FOCUS_KEY` 通过键盘或编码器聚焦，但不通过触摸板/鼠标聚焦
- `LV_STATE_EDITED` 由编码器编辑
- `LV_STATE_HOVERED` 鼠标悬停（现在不支持）
- `LV_STATE_PRESSED` 被按下
- `LV_STATE_SCROLLED` 正在滚动
- `LV_STATE_DISABLED` 禁用

<details>
<summary>查看原文</summary>
<p>

For example, if you press an object it will automatically go to `LV_STATE_FOCUSED` and `LV_STATE_PRESSED` state and when you release it, the  `LV_STATE_PRESSED` state will be removed.
 
</p>
</details>

例如，如果你按下一个对象，它会自动进入 `LV_STATE_FOCUSED` 和 `LV_STATE_PRESSED` `状态，当你释放它时， `LV_STATE_PRESSED` `状态将被移除。

<details>
<summary>查看原文</summary>
<p>

To check if an object is in a given state use `lv_obj_has_state(obj, LV_STATE_...)`. It will return `true` if the object is in that state at that time.

To manually add or remove states use

</p>
</details>

要检查对象是否处于给定状态，请使用 `lv_obj_has_state(obj, LV_STATE_...)`。如果对象当时处于该状态，它将返回 `true`。

要手动添加或删除状态，请使用下面的函数

```c
lv_obj_add_state(obj, LV_STATE_...);
lv_obj_clear_state(obj, LV_STATE_...);
```

### Styles（样式）

<details>
<summary>查看原文</summary>
<p>

Styles contains properties such as background color, border width, font, etc to describe the appearance of the objects.

</p>
</details>

样式包含诸如背景颜色、边框宽度、字体等属性来描述对象的外观。

<details>
<summary>查看原文</summary>
<p>

The styles are `lv_style_t` variables. Only their pointer is saved in the objects so they need to be static or global.

</p>
</details>

样式是 `lv_style_t` 变量。只有它们的指针保存在对象中，因此它们需要是静态的或全局的。

<details>
<summary>查看原文</summary>
<p>

Before using a style it needs to be initialized with `lv_style_init(&style1)`. After that properties can be added. For example:

</p>
</details>

在使用样式之前，它需要使用 `lv_style_init(&style1)` 进行初始化。之后可以添加属性。例如：


```
static lv_style_t style1;
lv_style_init(&style1);
lv_style_set_bg_color(&style1, lv_color_hex(0xa03080))
lv_style_set_border_width(&style1, 2))
```

<details>
<summary>查看原文</summary>
<p>

See the full list of properties [here](/overview/style.html#properties).

</p>
</details>

在 [这里](/overview/style.html#properties) 查看完整的属性列表。

<details>
<summary>查看原文</summary>
<p>

The styles are assigned to an object's part and state. For example to *"Use this style on the slider's indicator when the slider is pressed"*:

</p>
</details>

样式被分配给对象的部分和状态。例如 *“按下滑块时在滑块指示器上使用此样式”* ：

```c
lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR | LV_STATE_PRESSED);
```

<details>
<summary>查看原文</summary>
<p>

If the *part* is `LV_PART_MAIN` it can be omitted:

</p>
</details>

如果 *part* 是 `LV_PART_MAIN` 可以省略：

```c
lv_obj_add_style(btn1, &style1, LV_STATE_PRESSED); /*Equal to LV_PART_MAIN | LV_STATE_PRESSED*/
```

<details>
<summary>查看原文</summary>
<p>

Similarly, `LV_STATE_DEFAULT` can be omitted too:

</p>
</details>

类似地，`LV_STATE_DEFAULT` 也可以省略：

```c
lv_obj_add_style(slider1, &style1, LV_PART_INDICATOR); /*Equal to LV_PART_INDICATOR | LV_STATE_DEFAULT*/
```

<details>
<summary>查看原文</summary>
<p>

For `LV_STATE_DEFAULT` and `LV_PART_MAIN` simply write `0`:

</p>
</details>

对于 `LV_STATE_DEFAULT` 和 `LV_PART_MAIN` 只需写下 `0`：

```c
lv_obj_add_style(btn1, &style1, 0); /*Equal to LV_PART_MAIN | LV_STATE_DEFAULT*/
```

<details>
<summary>查看原文</summary>
<p>

The styles can be cascaded (similarly to CSS). It means you can add more styles to a part of an object. 
For example `style_btn` can set a default button appearance, and `style_btn_red` can overwrite the background color to make the button red: 

</p>
</details>

样式可以级联（类似于 CSS）。这意味着您可以为对象的一部分添加更多样式。
例如`style_btn`可以设置默认按钮外观，`style_btn_red`可以覆盖背景颜色使按钮变为红色：

```c
lv_obj_add_style(btn1, &style_btn, 0);
lv_obj_add_style(btn1, &style1_btn_red, 0);
```

<details>
<summary>查看原文</summary>
<p>

If a property is not set on for the current state the style with `LV_STATE_DEFAULT` will be used. If the property is not defined even in the default state a default value is used.

</p>
</details>

如果没有为当前状态设置属性，则将使用带有“LV_STATE_DEFAULT”的样式。如果即使在默认状态下也未定义该属性，则使用默认值。

<details>
<summary>查看原文</summary>
<p>

Some properties (typically the text-related ones) can be inherited. It means if a property is not set in an object it will be searched in its parents too. 
For example, you can set the font once in the screen's style and all text on that screen will inherit it by default. 

</p>
</details>

一些属性（通常是与文本相关的）可以被继承。这意味着如果一个属性没有在一个对象中设置，它也会在它的父级中搜索。
例如，您可以在屏幕样式中设置一次字体，该屏幕上的所有文本都会默认继承它。

<details>
<summary>查看原文</summary>
<p>

Local style properties also can be added to the objects. It creates a style which resides inside the object and which is used only by the object:

</p>
</details>

本地样式属性也可以添加到对象中。它创建了一个位于对象内部并且仅由对象使用的样式：

```c
lv_obj_set_style_bg_color(slider1, lv_color_hex(0x2080bb), LV_PART_INDICATOR | LV_STATE_PRESSED);
``` 

<details>
<summary>查看原文</summary>
<p>

To learn all the features of styles see the [Style overview](/overview/style) section.

</p>
</details>

要了解样式的所有功能，请参阅 [样式概述](/overview/style) 部分。

### Themes

<details>
<summary>查看原文</summary>
<p>

Themes are the default styles of the objects. 
The styles from the themes are applied automatically when the objects are created. 

You can select the theme to use in `lv_conf.h`. 

</p>
</details>

主题是对象的默认样式。创建对象时，将自动应用来自主题的样式。

您可以在 `lv_conf.h` `中选择要使用的主题。

## Examples

```eval_rst

.. include:: ../../examples/get_started/index.rst
```

## Micropython

<details>
<summary>查看原文</summary>
<p>

Learn more about [Micropython](/get-started/micropython).

</p>
</details>

了解有关 [Micropython](/get-started/micropython) 的更多信息。

```python
# Create a Button and a Label
scr = lv.obj()
btn = lv.btn(scr)
btn.align(lv.scr_act(), lv.ALIGN.CENTER, 0, 0)
label = lv.label(btn)
label.set_text("Button")

# Load the screen
lv.scr_load(scr)
```

