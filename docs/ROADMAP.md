# Roadmap（产品线路）

<details>
<summary>查看原文</summary>
<p>

This is a summary for planned new features and a collection of ideas.
This list indicates only the current intention and it can be changed.

</p>
</details>

这是计划中的新功能的摘要和想法的集合。
此列表仅表示当前意图，并且可以更改。

## v8.1
### Features（功能）

<details>
<summary>查看原文</summary>
<p>

- [x] Unit testing (gtest?). See #1658
- [ ] Benchmarking (gem5 or qemu?). See #1660  
- [ ] lv_snapshot: buffer a widget and all of its children into an image. The source widget can be on a different screen too. The resulting image can be transformed.
- [ ] High level GPU support. See #2058

</p>
</details>

- [x] 单元测试（gtest？）。 见#1658
- [ ] 基准测试（gem5 或 qemu？）。 见#1660
- [ ] lv_snapshot：将小部件及其所有子部件缓冲到图像中。 源小部件也可以在不同的屏幕上。 可以转换生成的图像。
- [ ] 高级 GPU 支持。 见#2058

#### New features（新功能）

<details>
<summary>查看原文</summary>
<p>

- [x] merge MicroPython examples
- [x] add a "Try out yourself" button to the Micropython examples

</p>
</details>

- [x] 合并 MicroPython 示例
- [x] 在 Micropython 示例中添加“试用自己”按钮

### Discuss（讨论）

<details>
<summary>查看原文</summary>
<p>

- [ ] CPP binding  
- [ ] Plugins. In v8 core and extra widgets are separated. With the new flexible events, the behavior of the widgets can be modified in a modular way. E.g. a plugin to add faded area to a line chart (as in the widgets demo)

</p>
</details>

- [ ] CPP 绑定
- [ ] 插件。 在 v8 核心和额外的小部件是分开的。 使用新的灵活事件，可以以模块化方式修改小部件的行为。 例如。 将褪色区域添加到折线图的插件（如小部件演示中所示）

### Docs（文档）

<details>
<summary>查看原文</summary>
<p>

- [x] Display the Micropytohn examples too.
- [x] Add a link to the example C and py files
- [x] List of all examples on a page. All in iframes grouped by category (e.g. flex, style, button)

</p>
</details>

- [x] 也显示 Micropytohn 示例。
- [x] 添加指向示例 C 和 py 文件的链接
- [x] 页面上所有示例的列表。 按类别分组的所有 iframe（例如 flex、样式、按钮）

### Others（其他）

<details>
<summary>查看原文</summary>
<p>

- [ ] Add automatic rebuild to get binary directly. Similarly to [STM32F746 project](https://github.com/lvgl/lv_port_stm32f746_disco#try-it-with-just-a-few-clicks).
- [ ] Implement release scripts. I've added a basic specification [here](https://github.com/lvgl/lvgl/tree/master/scripts/release), but we should discuss it.
- [ ] Unit test for the core widgets

</p>
</details>

- [ ] 添加自动重建直接获取二进制文件。 类似于 [STM32F746 项目](https://github.com/lvgl/lv_port_stm32f746_disco#try-it-with-just-a-few-clicks)。
- [ ] 实现发布脚本。 我已经添加了一个基本规范 [here](https://github.com/lvgl/lvgl/tree/master/scripts/release)，但我们应该讨论它。
- [ ] 核心小部件的单元测试


## v8.2

<details>
<summary>查看原文</summary>
<p>

- [ ] Optimize line and circle drawing and masking
- [ ] Handle stride. See [#1858](https://github.com/lvgl/lvgl/issues/1858)
- [ ] Support LV_STATE_HOVERED

</p>
</details>

- [ ] 优化线和圆的绘制和遮罩
- [ ] 处理步幅。 见 [#1858](https://github.com/lvgl/lvgl/issues/1858)
- [ ] 支持 LV_STATE_HOVERED


## Ideas（想法）

<details>
<summary>查看原文</summary>
<p>

- Reconsider color format management for run time color format setting, and custom color format usage. (Also [RGB888](https://github.com/lvgl/lvgl/issues/1722))
- Make gradients more versatile
- Make image transformations more versatile
- Switch to RGBA colors in styles
- Consider direct binary font format support
- Simplify `group`s. Discussion is [here](https://forum.lvgl.io/t/lv-group-tabindex/2927/3).
- Use [generate-changelog](https://github.com/lob/generate-changelog) to automatically generate changelog
- lv_mem_alloc_aligned(size, align)
- Text node. See [#1701](https://github.com/lvgl/lvgl/issues/1701#issuecomment-699479408)
- CPP binding. See [Forum](https://forum.lvgl.io/t/is-it-possible-to-officially-support-optional-cpp-api/2736)
- Optimize font decompression
- Need coverage report for tests
- Need static analyze (via coverity.io or somehing else)
- Support dot_begin and dot_middle long modes for labels
- Add new label alignment modes. [#1656](https://github.com/lvgl/lvgl/issues/1656)
- Support larger images: [#1892](https://github.com/lvgl/lvgl/issues/1892)

--- 

</p>
</details>

- 重新考虑运行时颜色格式设置和自定义颜色格式使用的颜色格式管理。 (还有 [RGB888](https://github.com/lvgl/lvgl/issues/1722))
- 使渐变更加通用
- 使图像转换更加通用
- 在样式中切换到 RGBA 颜色
- 考虑直接二进制字体格式支持
- 简化`group`s。讨论在[这里]（https://forum.lvgl.io/t/lv-group-tabindex/2927/3）。
- 使用[generate-changelog](https://github.com/lob/generate-changelog)自动生成changelog
- lv_mem_alloc_aligned（大小，对齐）
- 文本节点。见[#1701](https://github.com/lvgl/lvgl/issues/1701#issuecomment-699479408)
- CPP 绑定。见[论坛](https://forum.lvgl.io/t/is-it-possible-to-officially-support-optional-cpp-api/2736)
- 优化字体解压
- 需要测试覆盖率报告
- 需要静态分析（通过coverity.io 或其他）
- 支持 dot_begin 和 dot_middle 长标签模式
- 添加新的标签对齐模式。 [#1656](https://github.com/lvgl/lvgl/issues/1656)
- 支持更大的图像：[#1892](https://github.com/lvgl/lvgl/issues/1892)

---

## v8

<details>
<summary>查看原文</summary>
<p>

- Create an `extra` folder for complex widgets
   - It makes the core LVGL leaner
   - In `extra` we can have a lot and specific widgets
   - Good place for contributions
- New scrolling:
  - See [feat/new-scroll](https://github.com/lvgl/lvgl/tree/feat/new-scroll) branch and  [#1614](https://github.com/lvgl/lvgl/issues/1614)) issue.
  - Remove `lv_page` and support scrolling on `lv_obj`
  - Support "elastic" scrolling when scrolled in
  - Support scroll chaining among any objects types (not only `lv_pages`s)
  - Remove `lv_drag`. Similar effect can be achieved by setting the position in `LV_EVENT_PRESSING`
  - Add snapping
  - Add snap stop to scroll max 1 snap point
  - Already working
- New layouts:
  - See [#1615](https://github.com/lvgl/lvgl/issues/1615) issue
  - [CSS Grid](https://css-tricks.com/snippets/css/a-guide-to-grid/)-like layout support
  - [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)-like layout support
  - Remove `lv_cont` and support layouts on `lv_obj`
- Simplified File system interface ([feat/new_fs_api](https://github.com/lvgl/lvgl/tree/feat/new-fs-api) branch) to make porting easier
  - Work in progress
- Remove the align parameter from `lv_canvas_draw_text`
- Remove the copy parameter from create functions
- Optimize and simplifie styles [#1832](https://github.com/lvgl/lvgl/issues/1832)
- Use a more generic inheritenace [#1919](https://github.com/lvgl/lvgl/issues/1919)
- Allow adding multiple events to an obejct

</p>
</details>

- 为复杂的小部件创建一个 `extra` 文件夹
   - 它使核心 LVGL 更精简
   - 在`extra`中，我们可以有很多特定的小部件
   - 贡献的好地方
- 新滚动：
  - 参见 [feat/new-scroll](https://github.com/lvgl/lvgl/tree/feat/new-scroll) 分支和 [#1614](https://github.com/lvgl/lvgl/issues /1614)) 问题。
  - 移除 `lv_page` 并支持在 `lv_obj` 上滚动
  - 滚动时支持“弹性”滚动
  - 支持任何对象类型之间的滚动链接（不仅是`lv_pages`s）
  - 删除`lv_drag`。类似的效果可以通过在`LV_EVENT_PRESSING`中设置位置来实现
  - 添加捕捉
  - 添加捕捉停止以滚动最多 1 个捕捉点
  - 已经工作
- 新布局：
  - 参见 [#1615](https://github.com/lvgl/lvgl/issues/1615) 问题
  - [CSS Grid](https://css-tricks.com/snippets/css/a-guide-to-grid/) 类似布局支持
  - [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) 类似布局支持
  - 删除 `lv_cont` 并支持 `lv_obj` 上的布局
- 简化的文件系统接口（[feat/new_fs_api]（https://github.com/lvgl/lvgl/tree/feat/new-fs-api）分支）使移植更容易
  - 工作正在进行中
- 从 `lv_canvas_draw_text` 中删除 align 参数
- 从创建函数中删除复制参数
- 优化和简化样式 [#1832](https://github.com/lvgl/lvgl/issues/1832)
- 使用更通用的继承 [#1919](https://github.com/lvgl/lvgl/issues/1919)
- 允许向一个对象添加多个事件

