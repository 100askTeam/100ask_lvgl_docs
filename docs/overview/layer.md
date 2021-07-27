```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/layer.md
```

# Layers（图层）

## Order of creation（图层顺序）

<details>
<summary>查看原文</summary>
<p>

By default, LVGL draws new objects on top of old objects.

For example, assume we added a button to a parent object named button1 and then another button named button2. Then button1 (with its child object(s)) will be in the background and can be covered by button2 and its children.

</p>
</details>


默认情况下，LVGL 在旧对象之上绘制新对象。

例如，假设我们向名为 button1 的父对象添加了一个按钮，然后添加了另一个名为 button2 的按钮。然后 button1（及其子对象）将在背景中并且可以被 button2 及其子对象覆盖。


![](/misc/layers.png "Creating graphical objects in Littlev Graphics Library")  

```c
/*Create a screen*/
lv_obj_t * scr = lv_obj_create(NULL, NULL);
lv_scr_load(scr);          /*Load the screen*/

/*Create 2 buttons*/
lv_obj_t * btn1 = lv_btn_create(scr, NULL);         /*Create a button on the screen*/
lv_btn_set_fit(btn1, true, true);                   /*Enable to automatically set the size according to the content*/
lv_obj_set_pos(btn1, 60, 40);              	   /*Set the position of the button*/

lv_obj_t * btn2 = lv_btn_create(scr, btn1);         /*Copy the first button*/
lv_obj_set_pos(btn2, 180, 80);                    /*Set the position of the button*/

/*Add labels to the buttons*/
lv_obj_t * label1 = lv_label_create(btn1, NULL);	/*Create a label on the first button*/
lv_label_set_text(label1, "Button 1");          	/*Set the text of the label*/

lv_obj_t * label2 = lv_label_create(btn2, NULL);  	/*Create a label on the second button*/
lv_label_set_text(label2, "Button 2");            	/*Set the text of the label*/

/*Delete the second label*/
lv_obj_del(label2);
```

## Bring to the foreground（前台展示）

<details>
<summary>查看原文</summary>
<p>

There are 2 explicit way to bring an object to the foreground:
- Use `lv_obj_move_foreground(obj)` to explicitly tell the library to bring an object to the foreground. Similarly, use `lv_obj_move_background(obj)` to move to the background.
- When `lv_obj_set_parent(obj, new_parent)` is used, `obj` will be on the foreground on the `new_parent`.

</p>
</details>


有两种显式方法可以将对象置于前台：
- 使用 `lv_obj_move_foreground(obj)` 明确告诉库将一个对象带到前台。同样，使用`lv_obj_move_background(obj)` 移动到背景。
- 当使用 `lv_obj_set_parent(obj, new_parent)` 时，`obj` 将位于 `new_parent` 的前台。


## Top and sys layers（顶层和系统层）

<details>
<summary>查看原文</summary>
<p>

LVGL uses two special layers named as `layer_top` and `layer_sys`.
Both are visible and common on all screens of a display. **They are not, however, shared among multiple physical displays.** The `layer_top` is always on top of the default screen (`lv_scr_act()`), and `layer_sys` is on top of `layer_top`.

The `layer_top` can be used by the user to create some content visible everywhere. For example, a menu bar, a pop-up, etc. If the `click` attribute is enabled, then `layer_top` will absorb all user click and acts as a modal.

</p>
</details>

LVGL 使用名为“layer_top”和“layer_sys”的两个特殊层。
两者在显示器的所有屏幕上都是可见的和通用的。 **然而，它们不会在多个物理显示器之间共享。** `layer_top` 始终位于默认屏幕的顶部（`lv_scr_act()`），而 `layer_sys` 位于 `layer_top` 的顶部。

用户可以使用 `layer_top` 来创建一些随处可见的内容。例如，菜单栏、弹出窗口等。如果启用了`click` 属性，那么`layer_top` 将吸收所有用户点击并充当模态。


```c
lv_obj_set_click(lv_layer_top(), true);
```

<details>
<summary>查看原文</summary>
<p>

The `layer_sys` is also used for similar purposes on LVGL. For example, it places the mouse cursor above all layers to be sure it's always visible.

</p>
</details>

`layer_sys` 也用于 LVGL 的类似目的。例如，它将鼠标光标放在所有图层上方以确保它始终可见。
