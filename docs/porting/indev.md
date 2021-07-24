```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/indev.md
```
# Input device interface（输入设备接口）

## Types of input devices（输入设备的类型）

<details>
<summary>查看原文</summary>
<p>

To register an input device an `lv_indev_drv_t` variable has to be initialized:

</p>
</details>

要注册输入设备，必须初始化一个 `lv_indev_drv_t` 变量：

```c
lv_indev_drv_t indev_drv;
lv_indev_drv_init(&indev_drv);      /*Basic initialization*/
indev_drv.type =...                 /*See below.*/
indev_drv.read_cb =...              /*See below.*/
/*Register the driver in LVGL and save the created input device object*/
lv_indev_t * my_indev = lv_indev_drv_register(&indev_drv);
```

<details>
<summary>查看原文</summary>
<p>

`type` can be
- `LV_INDEV_TYPE_POINTER` touchpad or mouse
- `LV_INDEV_TYPE_KEYPAD` keyboard or keypad
- `LV_INDEV_TYPE_ENCODER` encoder with left/right turn and push options
- `LV_INDEV_TYPE_BUTTON` external buttons virtually pressing the screen

`read_cb` is a function pointer which will be called periodically to report the current state of an input device.

Visit [Input devices](/overview/indev) to learn more about input devices in general.

</p>
</details>

`type` 可以是
- `LV_INDEV_TYPE_POINTER` 触摸板或鼠标
- `LV_INDEV_TYPE_KEYPAD` 键盘或小键盘
- `LV_INDEV_TYPE_ENCODER` 编码器，带有左/右转和推动选项
- `LV_INDEV_TYPE_BUTTON` 外部按钮虚拟按下屏幕

`read_cb` 是一个函数指针，它将被定期调用以报告输入设备的当前状态。

访问 [输入设备](/overview/indev) 以了解有关输入设备的更多信息。

###  Touchpad, mouse or any pointer（触摸板、鼠标或任何指针）

<details>
<summary>查看原文</summary>
<p>

Input devices that can click points on the screen belong to this category.

</p>
</details>

可以点击屏幕上的点的输入设备属于这一类。

```c
indev_drv.type = LV_INDEV_TYPE_POINTER;
indev_drv.read_cb = my_input_read;

...

void my_input_read(lv_indev_drv_t * drv, lv_indev_data_t*data)
{
  if(touchpad_pressed) {
    data->point.x = touchpad_x;
    data->point.y = touchpad_y;
    data->state = LV_INDEV_STATE_PRESSED;
  } else {
    data->state = LV_INDEV_STATE_RELEASED; 
  }
}
```

<details>
<summary>查看原文</summary>
<p>

To set a mouse cursor use `lv_indev_set_cursor(my_indev, &img_cursor)`. (`my_indev` is the return value of `lv_indev_drv_register`)

</p>
</details>

要设置鼠标光标，请使用 `lv_indev_set_cursor(my_indev, &img_cursor)`。 (`my_indev` 是 `lv_indev_drv_register` 的返回值)

### Keypad or keyboard（键盘或键盘）

<details>
<summary>查看原文</summary>
<p>

Full keyboards with all the letters or simple keypads with a few navigation buttons belong here.

To use a keyboard/keypad:
- Register a `read_cb` function with `LV_INDEV_TYPE_KEYPAD` type.
- An object group has to be created: `lv_group_t * g = lv_group_create()` and objects have to be added to it with `lv_group_add_obj(g, obj)`
- The created group has to be assigned to an input device: `lv_indev_set_group(my_indev, g)` (`my_indev` is the return value of `lv_indev_drv_register`)
- Use `LV_KEY_...` to navigate among the objects in the group. See `lv_core/lv_group.h` for the available keys.

</p>
</details>

带有所有字母的全键盘或带有几个导航按钮的简单键盘都属于这里。

要使用键盘/小键盘：
- 注册一个带有 `LV_INDEV_TYPE_KEYPAD` 类型的 `read_cb` 函数。
- 必须创建一个对象组：`lv_group_t * g = lv_group_create()` 并且对象必须使用 `lv_group_add_obj(g, obj)` 添加到其中
- 创建的组必须分配给输入设备：`lv_indev_set_group(my_indev, g)`（`my_indev` 是 `lv_indev_drv_register` 的返回值）
- 使用`LV_KEY_...` 在组中的对象之间导航。有关可用密钥，请参阅“lv_core/lv_group.h”。

```c
indev_drv.type = LV_INDEV_TYPE_KEYPAD;
indev_drv.read_cb = keyboard_read;

...

void keyboard_read(lv_indev_drv_t * drv, lv_indev_data_t*data){
  data->key = last_key();            /*Get the last pressed or released key*/

  if(key_pressed()) data->state = LV_INDEV_STATE_PRESSED;
  else data->state = LV_INDEV_STATE_RELEASED;
}
```

### Encoder（编码器）

<details>
<summary>查看原文</summary>
<p>

With an encoder you can do 4 things:
1. Press its button
2. Long-press its button
3. Turn left
4. Turn right

In short, the Encoder input devices work like this:
- By turning the encoder you can focus on the next/previous object.
- When you press the encoder on a simple object (like a button), it will be clicked.
- If you press the encoder on a complex object (like a list, message box, etc.) the object will go to edit mode whereby turning the encoder you can navigate inside the object.
- To leave edit mode press long the button.


To use an *Encoder* (similarly to the *Keypads*) the objects should be added to groups.

</p>
</details>

使用编码器，您可以做 4 件事：
1. 按下它的按钮
2. 长按它的按钮
3. 左转
4. 右转

简而言之，编码器输入设备的工作方式如下：
- 通过转动编码器，您可以专注于下一个/上一个对象。
- 当您在一个简单的对象（如按钮）上按下编码器时，它将被点击。
- 如果您按下复杂对象（如列表、消息框等）上的编码器，该对象将进入编辑模式，从而转动编码器您可以在对象内部导航。
- 要退出编辑模式，请长按按钮。

要使用 *Encoder*（类似于 *Keypads*），应将对象添加到组中。

```c
indev_drv.type = LV_INDEV_TYPE_ENCODER;
indev_drv.read_cb = encoder_read;

...

void encoder_read(lv_indev_drv_t * drv, lv_indev_data_t*data){
  data->enc_diff = enc_get_new_moves();

  if(enc_pressed()) data->state = LV_INDEV_STATE_PRESSED;
  else data->state = LV_INDEV_STATE_RELEASED;
}
```

#### Using buttons with Encoder logic（使用带有编码器逻辑的按钮）

<details>
<summary>查看原文</summary>
<p>

In addition to standard encoder behavior, you can also utilize its logic to navigate(focus) and edit widgets using buttons. 
This is especially handy if you have only few buttons available, or you want to use other buttons in addition to encoder wheel.

You need to have 3 buttons available:
- `LV_KEY_ENTER` will simulate press or pushing of the encoder button
- `LV_KEY_LEFT` will simulate turning encoder left
- `LV_KEY_RIGHT` will simulate turning encoder right
- other keys will be passed to the focused widget

If you hold the keys it will simulate encoder click with period specified in `indev_drv.long_press_rep_time`.

</p>
</details>

除了标准编码器行为之外，您还可以利用其逻辑来使用按钮导航（聚焦）和编辑小部件。
如果您只有几个按钮可用，或者您想使用除编码轮之外的其他按钮，这将特别方便。

您需要有 3 个按钮可用：
- `LV_KEY_ENTER` 将模拟按下或按下编码器按钮
- `LV_KEY_LEFT` 将模拟向左转动编码器
- `LV_KEY_RIGHT` 将模拟向右旋转编码器
- 其他键将传递给聚焦的小部件

如果您按住这些键，它将模拟编码器点击，并在`indev_drv.long_press_rep_time` 中指定周期。

```c
indev_drv.type = LV_INDEV_TYPE_ENCODER;
indev_drv.read_cb = encoder_with_keys_read;

...

void encoder_with_keys_read(lv_indev_drv_t * drv, lv_indev_data_t*data){
  data->key = last_key();            /*Get the last pressed or released key*/
                                     /* use LV_KEY_ENTER for encoder press */
  if(key_pressed()) data->state = LV_INDEV_STATE_PRESSED;
  else {
      data->state = LV_INDEV_STATE_RELEASED;
      /* Optionally you can also use enc_diff, if you have encoder*/
      data->enc_diff = enc_get_new_moves();
  }
}
```

### Button（按钮）

<details>
<summary>查看原文</summary>
<p>

*Buttons* mean external "hardware" buttons next to the screen which are assigned to specific coordinates of the screen.
If a button is pressed it will simulate the pressing on the assigned coordinate. (Similarly to a touchpad)

To assign buttons to coordinates use `lv_indev_set_button_points(my_indev, points_array)`.   
`points_array` should look like `const lv_point_t points_array[] =  { {12,30},{60,90}, ...}`

</p>
</details>

*按钮*表示屏幕旁边的外部“硬件”按钮，这些按钮分配给屏幕的特定坐标。
如果按下按钮，它将模拟按下指定坐标。 （类似于触摸板）

要将按钮分配给坐标，请使用 `lv_indev_set_button_points(my_indev, points_array)`。
`points_array` 应该看起来像 `const lv_point_t points_array[] = { {12,30},{60,90}, ...}`

``` important::  The points_array can't go out of scope. Either declare it as a global variable or as a static variable inside a function.
```

```c
indev_drv.type = LV_INDEV_TYPE_BUTTON;
indev_drv.read_cb = button_read;

...

void button_read(lv_indev_drv_t * drv, lv_indev_data_t*data){
    static uint32_t last_btn = 0;   /*Store the last pressed button*/
    int btn_pr = my_btn_read();     /*Get the ID (0,1,2...) of the pressed button*/
    if(btn_pr >= 0) {               /*Is there a button press? (E.g. -1 indicated no button was pressed)*/
       last_btn = btn_pr;           /*Save the ID of the pressed button*/
       data->state = LV_INDEV_STATE_PRESSED;  /*Set the pressed state*/
    } else {
       data->state = LV_INDEV_STATE_RELEASED; /*Set the released state*/
    }

    data->btn = last_btn;            /*Save the last button*/
}
```

## Other features（其它功能）

### Parameters（参数）

<details>
<summary>查看原文</summary>
<p>

The default value of the following parameters can changed in `lv_indev_drv_t`:
- `scroll_limit` Number of pixels to slide before actually scrolling the object.
- `scroll_throw`  Scroll throw (momentum) slow-down in [%]. Greater value means faster slow-down.
- `long_press_time` Press time to send `LV_EVENT_LONG_PRESSED` (in milliseconds)
- `long_press_rep_time` Interval of sending `LV_EVENT_LONG_PRESSED_REPEAT` (in milliseconds)
- `read_timer` pointer to the `lv_timer` which reads the input device. Its parameters can be changed by `lv_timer_...()` functions. `LV_INDEV_DEF_READ_PERIOD` in `lv_conf.h` sets the default read period.

</p>
</details>

以下参数的默认值可以在 `lv_indev_drv_t` 中更改：
- `scroll_limit` 在实际滚动对象之前要滑动的像素数。
- `scroll_throw` 滚动投掷（动量）减慢 [%]。更大的价值意味着更快的减速。
- `long_press_time` 按下发送 `LV_EVENT_LONG_PRESSED` 的时间（以毫秒为单位）
- `long_press_rep_time` 发送 `LV_EVENT_LONG_PRESSED_REPEAT` 的间隔（以毫秒为单位）
- `read_timer` 指向读取输入设备的 `lv_timer` 的指针。它的参数可以通过`lv_timer_...()`函数改变。 `lv_conf.h` 中的 `LV_INDEV_DEF_READ_PERIOD` 设置默认读取周期。

### Feedback（回调处理）

<details>
<summary>查看原文</summary>
<p>

Besides `read_cb` a `feedback_cb` callback can be also specified in `lv_indev_drv_t`.
`feedback_cb` is called when any type of event is sent by the input devices (independently from its type). This allows generating feedback for the user, e.g. to play a sound on `LV_EVENT_CLICKED`.

</p>
</details>

除了 `read_cb` 一个 `feedback_cb` 回调也可以在 `lv_indev_drv_t` 中指定。
`feedback_cb` 在输入设备发送任何类型的事件时被调用（与其类型无关）。这允许为用户生成反馈，例如在“LV_EVENT_CLICKED”上播放声音。

### Associating with a display（与显示器关联）

<details>
<summary>查看原文</summary>
<p>

Every input device is associated with a display. By default, a new input device is added to the lastly created or the explicitly selected (using `lv_disp_set_default()`) display.
The associated display is stored and can be changed in `disp` field of the driver.

</p>
</details>

每个输入设备都与一个显示器相关联。默认情况下，一个新的输入设备被添加到最后创建的或明确选择的（使用 `lv_disp_set_default()`）显示。
相关的显示被存储并可在驱动程序的“disp”字段中更改。

### Buffered reading（缓冲读取）

<details>
<summary>查看原文</summary>
<p>

By default LVGL calls `read_cb` periodically. This way there is a chance that some user gestures are missed. 

To solve this you can write an event driven driver for your input device that buffers measured data. In `read_cb` you can set the buffered data instead of reading the input device. 
You can set the `data->continue_reading` flag to tell that LVGL there is more data to read and it should call the `read_cb` again.

</p>
</details>

默认情况下，LVGL 会定期调用 `read_cb`。这样就有可能错过一些用户手势。

为了解决这个问题，你可以为你的输入设备编写一个事件驱动的驱动程序来缓冲测量数据。在 read_cb 中，您可以设置缓冲数据而不是读取输入设备。
你可以设置 `data->continue_reading` 标志来告诉 LVGL 有更多的数据要读取，它应该再次调用 `read_cb`。

## Further reading（深入学习）

<details>
<summary>查看原文</summary>
<p>

- [lv_port_indev_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_indev_template.c) for a template for your own driver.
- [INdev features](/overview/display) to learn more about higher level input device features.

</p>
</details>


- [lv_port_indev_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_indev_template.c) 用于您自己的驱动程序的模板。
- [INdev features](/overview/display) 以了解有关更高级别输入设备功能的更多信息。

## API

```eval_rst

.. doxygenfile:: lv_hal_indev.h
  :project: lvgl

```
