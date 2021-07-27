```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/indev.md
```
# Input devices（输入设备）

<details>
<summary>查看原文</summary>
<p>

An input device usually means:
- Pointer-like input device like touchpad or mouse
- Keypads like a normal keyboard or simple numeric keypad
- Encoders with left/right turn and push options
- External hardware buttons which are assigned to specific points on the screen
 
</p>
</details>

输入设备通常意味着：
- 类似指针的输入设备，如触摸板或鼠标
- 像普通键盘或简单数字键盘一样的键盘
- 带左/右转和推动选项的编码器
- 分配给屏幕上特定点的外部硬件按钮


<details>
<summary>查看原文</summary>
<p>

``` important:: Before reading further, please read the [Porting](/porting/indev) section of Input devices
```

</p>
</details>

``` important:: 在进一步阅读之前，请阅读 Input devices 的 [Porting](/porting/indev) 部分
```

## Pointers（光标）

<details>
<summary>查看原文</summary>
<p>

Pointer input devices (like a mouse) can have a cursor.
 
</p>
</details>

有些输入设备可以有一个光标（如鼠标）。


```c
...
lv_indev_t * mouse_indev = lv_indev_drv_register(&indev_drv);

LV_IMG_DECLARE(mouse_cursor_icon);                          /*Declare the image file.*/
lv_obj_t * cursor_obj =  lv_img_create(lv_scr_act(), NULL); /*Create an image object for the cursor */
lv_img_set_src(cursor_obj, &mouse_cursor_icon);             /*Set the image source*/
lv_indev_set_cursor(mouse_indev, cursor_obj);               /*Connect the image  object to the driver*/

```

<details>
<summary>查看原文</summary>
<p>

Note that the cursor object should have `lv_obj_set_click(cursor_obj, false)`.
For images, *clicking* is disabled by default.
 
</p>
</details>

请注意，光标对象应该有 `lv_obj_set_click(cursor_obj, false)`。
对于图像，默认情况下禁用*单击*。

## Keypad and encoder（键盘和编码器）

<details>
<summary>查看原文</summary>
<p>

You can fully control the user interface without touchpad or mouse using a keypad or encoder(s). It works similar to the *TAB* key on the PC to select the element in an application or a web page.
 
</p>
</details>

您可以使用键盘或编码器在没有触摸板或鼠标的情况下完全控制用户界面。它的工作原理类似于 PC 上的 *TAB* 键，用于选择应用程序或网页中的元素。

### Groups（组）

<details>
<summary>查看原文</summary>
<p>

The objects, you want to control with keypad or encoder, needs to be added to a *Group*.
In every group, there is exactly one focused object which receives the pressed keys or the encoder actions.
For example, if a [Text area](/widgets/core/textarea) is focused and you press some letter on a keyboard, the keys will be sent and inserted into the text area.
Similarly, if a [Slider](/widgets/core/slider) is focused and you press the left or right arrows, the slider's value will be changed.

You need to associate an input device with a group. An input device can send the keys to only one group but, a group can receive data from more than one input device too.

To create a group use `lv_group_t * g = lv_group_create()` and to add an object to the group use `lv_group_add_obj(g, obj)`.

To associate a group with an input device use `lv_indev_set_group(indev, g)`, where `indev` is the return value of `lv_indev_drv_register()`
 
</p>
</details>

您想用键盘或编码器控制的对象需要添加到*组*。
在每一组中，只有一个焦点对象接收按下的键或编码器的动作。
例如，如果[文本区域](/widgets/core/textarea) 被聚焦并且您在键盘上按下某个字母，则按键将被发送并插入到文本区域中。
类似地，如果 [Slider](/widgets/core/slider) 获得焦点并且您按下向左或向右箭头，则滑块的值将被更改。

您需要将输入设备与组关联。一个输入设备只能将按键发送给一组，但一组也可以从多个输入设备接收数据。

要创建一个组使用 `lv_group_t * g = lv_group_create()` 并将一个对象添加到组中使用 `lv_group_add_obj(g, obj)`。

要将组与输入设备相关联，请使用 `lv_indev_set_group(indev, g)`，其中 `indev` 是 `lv_indev_drv_register()` 的返回值

#### Keys（按键）

<details>
<summary>查看原文</summary>
<p>

There are some predefined keys which have special meaning:
- **LV_KEY_NEXT** Focus on the next object
- **LV_KEY_PREV** Focus on the previous object
- **LV_KEY_ENTER** Triggers `LV_EVENT_PRESSED/CLICKED/LONG_PRESSED` etc. events
- **LV_KEY_UP** Increase value or move upwards
- **LV_KEY_DOWN** Decrease value or move downwards
- **LV_KEY_RIGHT** Increase value or move the the right
- **LV_KEY_LEFT** Decrease value or move the the left
- **LV_KEY_ESC**  Close or exit (E.g. close a [Drop down list](/widgets/core/dropdown))
- **LV_KEY_DEL**  Delete (E.g. a character on the right in a [Text area](/widgets/core/textarea))
- **LV_KEY_BACKSPACE** Delete a character on the left (E.g. in a [Text area](/widgets/core/textarea))
- **LV_KEY_HOME** Go to the beginning/top (E.g. in a [Text area](/widgets/core/textarea))
- **LV_KEY_END** Go to the end (E.g. in a [Text area](/widgets/core/textarea)))
 
</p>
</details>

有一些具有特殊含义的预定义键：
- **LV_KEY_NEXT** 关注下一个对象
- **LV_KEY_PREV** 关注上一个对象
- **LV_KEY_ENTER** 触发 `LV_EVENT_PRESSED/CLICKED/LONG_PRESSED` 等事件
- **LV_KEY_UP** 增加值或向上移动
- **LV_KEY_DOWN** 减少值或向下移动
- **LV_KEY_RIGHT** 增加值或向右移动
- **LV_KEY_LEFT** 减少值或向左移动
- **LV_KEY_ESC** 关闭或退出（例如关闭 [下拉列表](/widgets/core/dropdown)）
- **LV_KEY_DEL** 删除（例如 [文本区域](/widgets/core/textarea) 中右侧的字符）
- **LV_KEY_BACKSPACE** 删除左边的一个字符（例如在[文本区域](/widgets/core/textarea)）
- **LV_KEY_HOME** 转到开头/顶部（例如在 [文本区域](/widgets/core/textarea)）
- **LV_KEY_END** 转到最后（例如在 [文本区域](/widgets/core/textarea))）



<details>
<summary>查看原文</summary>
<p>

The most important special keys are `LV_KEY_NEXT/PREV`, `LV_KEY_ENTER` and `LV_KEY_UP/DOWN/LEFT/RIGHT`.
In your `read_cb` function, you should translate some of your keys to these special keys to navigate in the group and interact with the selected object.

Usually, it's enough to use only `LV_KEY_LEFT/RIGHT` because most of the objects can be fully controlled with them.

With an encoder, you should use only `LV_KEY_LEFT`, `LV_KEY_RIGHT`, and `LV_KEY_ENTER`.
 
</p>
</details>

最重要的特殊键是`LV_KEY_NEXT/PREV`、`LV_KEY_ENTER` 和`LV_KEY_UP/DOWN/LEFT/RIGHT`。
在您的 `read_cb` 函数中，您应该将一些键转换为这些特殊键，以便​​在组中导航并与所选对象进行交互。

通常，只使用“LV_KEY_LEFT/RIGHT”就足够了，因为大多数对象都可以用它们完全控制。

对于编码器，您应该只使用 `LV_KEY_LEFT`、`LV_KEY_RIGHT` 和 `LV_KEY_ENTER`。

#### Edit and navigate mode（编辑和导航模式）

<details>
<summary>查看原文</summary>
<p>

Since a keypad has plenty of keys, it's easy to navigate between the objects and edit them using the keypad. But the encoders have a limited number of "keys" and hence it is difficult to navigate using the default options. *Navigate* and *Edit* are created to avoid this problem with the encoders.

In *Navigate* mode, the encoders `LV_KEY_LEFT/RIGHT` is translated to `LV_KEY_NEXT/PREV`. Therefore the next or previous object will be selected by turning the encoder.
Pressing `LV_KEY_ENTER` will change to *Edit* mode.

In *Edit* mode, `LV_KEY_NEXT/PREV` is usually used to edit the object.
Depending on the object's type, a short or long press of `LV_KEY_ENTER` changes back to *Navigate* mode.
Usually, an object which can not be pressed (like a [Slider](/widgets/core/slider)) leaves *Edit* mode on short click. But with objects where short click has meaning (e.g. [Button](/widgets/core/btn)), a long press is required.
 
</p>
</details>

由于小键盘有很多键，因此很容易在对象之间导航并使用小键盘对其进行编辑。但是编码器的“键”数量有限，因此很难使用默认选项进行导航。创建 *Navigate* 和 *Edit* 是为了避免编码器出现此问题。

在 *Navigate* 模式下，编码器 `LV_KEY_LEFT/RIGHT` 被转换为 `LV_KEY_NEXT/PREV`。因此，将通过转动编码器来选择下一个或上一个对象。

按 `LV_KEY_ENTER` 将更改为 *Edit* 模式。
在*Edit* 模式下，`LV_KEY_NEXT/PREV` 通常用于编辑对象。
根据对象的类型，短按或长按 `LV_KEY_ENTER` 会变回 *Navigate* 模式。
通常，无法按下的对象（如 [Slider](/widgets/core/slider)）会在短按时离开 *Edit* 模式。但是对于短按有意义的对象（例如 [Button](/widgets/core/btn)），则需要长按。

#### Default group（默认组）

<details>
<summary>查看原文</summary>
<p>

Interactive widgets - such as buttons, checkboxes, sliders, etc - can be automatically added to a default group.
Just create a group with `lv_group_t * g = lv_group_create();` and set the default group with `lv_group_set_default(g);`

Don't forget to assign the input device(s) to the default group with ` lv_indev_set_group(my_indev, g);`.
 
</p>
</details>

交互式小部件 - 例如按钮、复选框、滑块等 - 可以自动添加到默认组。
只需使用 `lv_group_t * g = lv_group_create();` 创建一个组并使用 `lv_group_set_default(g);` 设置默认组

不要忘记使用 `lv_indev_set_group(my_indev, g);` 将输入设备分配到默认组。

### Styling（风格样式）

<details>
<summary>查看原文</summary>
<p>

If an object is focused either by clicking it via touchpad, or focused via an encoder or keypad it goes to `LV_STATE_FOCUSED`. Hence focused styles will be applied on it. 

If the object goes to edit mode it goes to `LV_STATE_FOCUSED | LV_STATE_EDITED` state so these style properties will be shown. 

For a more detaild description read the [Style](https://docs.lvgl.io/v7/en/html/overview/style.html) section.
 
</p>
</details>

如果通过触摸板单击对象或通过编码器或键盘聚焦对象，它会转到“LV_STATE_FOCUSED”。因此，将在其上应用重点样式。

如果对象进入编辑模式，它将进入`LV_STATE_FOCUSED | LV_STATE_EDITED` 状态，因此将显示这些样式属性。

有关更详细的说明，请阅读 [样式](https://docs.lvgl.io/v7/en/html/overview/style.html) 部分。

## API


### Input device（输入设备）

```eval_rst

.. doxygenfile:: lv_indev.h
  :project: lvgl

```

### Groups（组）

```eval_rst

.. doxygenfile:: lv_group.h
  :project: lvgl

```
