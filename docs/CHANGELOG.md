# Changelog（更新日志）

## v8.1.0 (In progress)（进行中）

<details>
<summary>查看原文</summary>
<p>

- feat(img) add img_size property (#2284)  <a href="https://github.com/lvgl/lvgl/commit/fe461caf">fe461caf</a>  
- feat(calendar) improve MicroPython example (#2366)  Amir Gonnen <a href="https://github.com/lvgl/lvgl/commit/5f6e07e5">5f6e07e5</a> 
- feat(obj) add lv_obj_del_delayed() <a href="https://github.com/lvgl/lvgl/commit/c6a2e15e">c6a2e15e</a> 
- feat(event, widgets) improve the paramter of LV_EVENT_DRAW_PART_BEGIN/END  Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/88c48594">88c48594</a> 
- feat(led) send LV_EVENT_DRAW_PART_BEGIN/END  Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/fcd4aa39">fcd4aa39</a> 
- feat(obj) send LV_EVENT_DRAW_PART_BEGIN/END for MAIN and SCROLLBAR parts  Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/b203167c">b203167c</a> 
- feat(spinbox ) add function to set cursor to specific position (#2314)  dyktronix <a href="https://github.com/lvgl/lvgl/commit/7066c8fb">7066c8fb</a> 
- feat(timer) check if lv_tick_inc is called <a href="https://github.com/lvgl/lvgl/commit/aa6641a6">aa6641a6</a> 
- feat(docs) add view on GitHub link <a href="https://github.com/lvgl/lvgl/commit/a716ac6e">a716ac6e</a> 
- feat(event) pass the scroll aniamtion to LV_EVENT_SCROLL_BEGIN <a href="https://github.com/lvgl/lvgl/commit/ca54ecfe">ca54ecfe</a> 


</p>
</details>

- feat(img) 添加 img_size 属性 (#2284) <a href="https://github.com/lvgl/lvgl/commit/fe461caf">fe461caf</a>
- feat(calendar) 改进 MicroPython 示例 (#2366) Amir Gonnen <a href="https://github.com/lvgl/lvgl/commit/5f6e07e5">5f6e07e5</a>
- feat(obj) 添加 lv_obj_del_delayed() <a href="https://github.com/lvgl/lvgl/commit/c6a2e15e">c6a2e15e</a>
- feat(event, widgets) 改进了 LV_EVENT_DRAW_PART_BEGIN/END Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/88c48594">88c48594</a> 的参数
- feat(led) 发送 LV_EVENT_DRAW_PART_BEGIN/END Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/fcd4aa39">fcd4aa39</a>
- feat(obj) 发送 LV_EVENT_DRAW_PART_BEGIN/END for MAIN 和 SCROLLBAR 部分 Gabor Kiss-Vamosi <a href="https://github.com/lvgl/lvgl/commit/b203167c">b203167c</a>
- feat(spinbox) 添加将光标设置到特定位置的功能 (#2314) dyktronix <a href="https://github.com/lvgl/lvgl/commit/7066c8fb">7066c8fb</a>
- feat(timer) 检查 lv_tick_inc 是否被调用 <a href="https://github.com/lvgl/lvgl/commit/aa6641a6">aa6641a6</a>
- feat(docs) 在 GitHub 链接上添加视图 <a href="https://github.com/lvgl/lvgl/commit/a716ac6e">a716ac6e</a>
- feat(event) 将滚动动画传递给 LV_EVENT_SCROLL_BEGIN <a href="https://github.com/lvgl/lvgl/commit/ca54ecfe">ca54ecfe</a>


## v8.0.2 (16.07.2021)

<details>
<summary>查看原文</summary>
<p>

- fix(theme) improve button focus of keyboard
- fix(tabview) send LV_EVENT_VALUE_CHANGED only once
- fix(imgbtn) use the correct src in LV_EVENT_GET_SELF_SIZE
- fix(color) remove extraneous cast for 8-bit color
- fix(obj style) fix children reposition if the parent's padding changes.
- fix(color) remove extraneous _LV_COLOR_MAKE_TYPE_HELPER (#2372) 
- fix(spinner) should not be clickable (#2373) 
- fix(obj) improve how the focusing indev is determined  
- fix(template) update indev template for v8 
- fix(printf) skip defining attribute if pycparser is used  
- refactor(printf) add printf-like function attribute to _lv_txt_set_text_vfmt and lv_label_set_text_fmt (#2332) 
- fix(template) include lvgl.h in lv_port_*_template.c files 
- fix(obj) detecting which indev sent LV_EVENT_FOCUS  
- fix (span) fill LV_EVENT_GET_SELF_SIZE (#2360) 
- fix(arc) disable LV_OBJ_FLAG_SCROLL_CHAIN by default 
- fix (draw) fix arc bg image drawing with full arcs 
- fix(disp) fix memory leak in lv_disp_remove (#2355) 
- fix warnigs introduced by 3fb8baf5 
- fix(widgets) use lv_obj_class for all the widgets  
- fix(obj) move clean ups from lv_obj_del to lv_obj_destructor
- fix(roller) fix partial redraw of the selected area 
- fix(roller) adjust the size of the selected area correctly  
- fix(obj) delete useless type conversion (#2343)  
- fix(lv_obj_scroll.h) typos (#2345)
- fix(scroll) fire LV_EVENT_SCROLL_BEGIN in the same spot for both axes
- fix(btnmatrix) fix button invalidation on focus change 
- fix(textarea) style update in oneline mode + improve sroll to cursor  
- fix(tlsf) do not use <assert.h>  
- fix(imgbtn) consider width==LV_SIZE_CONTENT if only mid. img is set 
- fix(refr) reduce the nesting level in lv_refr_area 
- fix(txt) enhance the function of break_chars (#2327) 
- fix(pxp): update RTOS macro for SDK 2.10  
- fix(vglite): update for v8  
- fix(pxp): update for v8  
- fix(flex) fix layout update and invalidation issues 
- fix(flex) fix NULL pointer dereference 
- fix(obj, switch) do not send LV_EVENT_VALUE_CHANGED twice  
- fix(color) overflow with 16 bit color depth  
- fix(coords) fix using large coordinates  
- fix(chart) fix crash if no series are added 
- fix(chart) invalidation with LV_CHART_UPDATE_MODE_SHIFT 
- fix(align) fix lv_obj_align_to  G
- fix(table) invalidate the table on cell value change  
- fix(label) remove dupliacted lv_obj_refresh_self_size 
- fix(draw) underflow in subpixel font drawing 
- fix (scroll) do not send unnecessary scroll end events  

</p>
</details>

- 修复（主题）改善键盘的按钮焦点
- 修复（tabview）只发送一次 LV_EVENT_VALUE_CHANGED
- fix(imgbtn) 在 LV_EVENT_GET_SELF_SIZE 中使用正确的 src
- fix(color) 移除 8 位颜色的无关投射
- fix(obj style) 如果父级的填充发生变化，则修复子级重新定位。
- 修复（颜色）删除无关的 _LV_COLOR_MAKE_TYPE_HELPER (#2372)
- 修复（微调器）不应该是可点击的（#2373）
- fix(obj) 改进如何确定聚焦 indev
- 修复（模板）更新 v8 的 indev 模板
- 修复（printf）如果使用 pycparser 则跳过定义属性
- 重构(printf) 将类似 printf 的函数属性添加到 _lv_txt_set_text_vfmt 和 lv_label_set_text_fmt (#2332)
- 修复（模板）在 lv_port_*_template.c 文件中包含 lvgl.h
- fix(obj) 检测哪个 indev 发送了 LV_EVENT_FOCUS
- 修复（跨度）填充 LV_EVENT_GET_SELF_SIZE (#2360)
- 修复（弧）默认禁用 LV_OBJ_FLAG_SCROLL_CHAIN
- 修复（绘制）修复带有完整弧线的弧形背景图像绘制
- fix(disp) 修复 lv_disp_remove 中的内存泄漏 (#2355)
- 修复 3fb8baf5 引入的警告
- 修复（小部件）对所有小部件使用 lv_obj_class
- fix(obj) 将清理从 lv_obj_del 移动到 lv_obj_destructor
- fix(roller) 修复选定区域的部分重绘
- 修复（滚轮）正确调整所选区域的大小
- fix(obj) 删除无用的类型转换 (#2343)
- 修复（lv_obj_scroll.h）错别字（#2345）
- 修复（滚动）在两个轴的同一位置触发 LV_EVENT_SCROLL_BEGIN
- 修复（btnmatrix）修复焦点变化时按钮失效
- 在单行模式下修复（textarea）样式更新+改进滚动到光标
- fix(tlsf) 不使用 <assert.h>
- 修复（imgbtn）如果只有中间，请考虑宽度==LV_SIZE_CONTENT。 img 已设置
- fix(refr) 减少 lv_refr_area 中的嵌套级别
- fix(txt) 增强 break_chars 的功能 (#2327)
- 修复（pxp）：更新 SDK 2.10 的 RTOS 宏
- 修复（vglite）：v8 更新
- 修复（pxp）：v8 更新
- fix(flex) 修复布局更新和失效问题
- fix(flex) 修复空指针解引用
- fix(obj, switch) 不发送 LV_EVENT_VALUE_CHANGED 两次
- 修复（颜色）溢出 16 位颜色深度
- fix(coords) 使用大坐标修复
- 修复（图表）如果没有添加系列，则修复崩溃
- 使用 LV_CHART_UPDATE_MODE_SHIFT 修复（图表）失效
- 修复（对齐）修复 lv_obj_align_to G
- 修复（表格）使表格单元格值更改无效
- 修复（标签）删除重复的 lv_obj_refresh_self_size
- 修复（绘制）子像素字体绘制中的下溢
- 修复（滚动）不发送不必要的滚动结束事件


## v8.0.1 (14.06.2021)

<details>
<summary>查看原文</summary>
<p>

- docs(filesystem) update to v8 <a href="https://github.com/lvgl/lvgl/commit/7971ade4">7971ade4</a> 
- fix(msgbox) create modals on top layer instead of act screen <a href="https://github.com/lvgl/lvgl/commit/5cf6303e">5cf6303e</a> 
- fix(colowheel) disable LV_OBJ_FLAG_SCROLL_CHAIN by default <a href="https://github.com/lvgl/lvgl/commit/48d1c292">48d1c292</a> 
- docs(grid) typo fix (#2310) <a href="https://github.com/lvgl/lvgl/commit/69d109d2">69d109d2</a> 
- fix(arduino) fix the prototype of my_touchpad_read in the LVGL_Arduino.ino <a href="https://github.com/lvgl/lvgl/commit/1a62f7a6">1a62f7a6</a> 
- fix(meter) fix needle image invalidation <a href="https://github.com/lvgl/lvgl/commit/54d8e817">54d8e817</a> 
- fix(mem) add lv_ prefix to tlsf functions and types <a href="https://github.com/lvgl/lvgl/commit/0d52b59c">0d52b59c</a> 
- fix(calendar) fix the position calculation today <a href="https://github.com/lvgl/lvgl/commit/ad05e196">ad05e196</a> 
- fix(typo) rename LV_OBJ_FLAG_SNAPABLE to LV_OBJ_FLAG_SNAPPABLE <a href="https://github.com/lvgl/lvgl/commit/e697807c">e697807c</a> 
- docs(color) language fixes (#2302) <a href="https://github.com/lvgl/lvgl/commit/07ecc9f1">07ecc9f1</a> 
- fix(tick) minor optmization on lv_tick_inc call test <a href="https://github.com/lvgl/lvgl/commit/b4305df5">b4305df5</a> 
- Spelling and other language fixes to documentation (#2293) <a href="https://github.com/lvgl/lvgl/commit/d0aaacaf">d0aaacaf</a> 
- fix(theme) show disabled state on buttons of btnmatrix, msgbox and kayboard <a href="https://github.com/lvgl/lvgl/commit/0be582b3">0be582b3</a> 
- fix(scroll) keep the scroll position on object deleted <a href="https://github.com/lvgl/lvgl/commit/52edbb46">52edbb46</a> 
- fix(msgbox) handle NULL btn map paramter <a href="https://github.com/lvgl/lvgl/commit/769c4a30">769c4a30</a> 
- fix(group) allow refocusing obejcts <a href="https://github.com/lvgl/lvgl/commit/1520208b">1520208b</a> 
- docs(overview) spelling fixes <a href="https://github.com/lvgl/lvgl/commit/d2efb8c6">d2efb8c6</a> 
- Merge branch 'master' of https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/45960838">45960838</a> 
- feat(timer) check if lv_tick_inc is called <a href="https://github.com/lvgl/lvgl/commit/aa6641a6">aa6641a6</a> 
- feat(docs) add view on GitHub link <a href="https://github.com/lvgl/lvgl/commit/a716ac6e">a716ac6e</a> 
- fix(theme) fix the switch style in the default theme <a href="https://github.com/lvgl/lvgl/commit/0c0dc8ea">0c0dc8ea</a> 
- docs fix typo <a href="https://github.com/lvgl/lvgl/commit/8ab80645">8ab80645</a> 
- Merge branch 'master' of https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/e796448f">e796448f</a> 
- feat(event) pass the scroll aniamtion to LV_EVENT_SCROLL_BEGIN <a href="https://github.com/lvgl/lvgl/commit/ca54ecfe">ca54ecfe</a> 
- fix(tabview) fix with left and right tabs <a href="https://github.com/lvgl/lvgl/commit/17c57449">17c57449</a> 
- chore(docs) force docs rebuild <a href="https://github.com/lvgl/lvgl/commit/4a0f4139">4a0f4139</a> 
- chore(docs) always deploy master to docs/master as well <a href="https://github.com/lvgl/lvgl/commit/6d05692d">6d05692d</a> 
- fix(template) udpate lv_objx_template to v8 <a href="https://github.com/lvgl/lvgl/commit/38bb8afc">38bb8afc</a> 
- docs(extra) add extra/README.md <a href="https://github.com/lvgl/lvgl/commit/8cd504d5">8cd504d5</a> 
- Update CHANGELOG.md <a href="https://github.com/lvgl/lvgl/commit/48fd73d2">48fd73d2</a> 
- Update quick-overview.md (#2295) <a href="https://github.com/lvgl/lvgl/commit/5616471c">5616471c</a> 
- fix(pxp) change LV_COLOR_TRANSP to LV_COLOR_CHROMA_KEY to v8 compatibility <a href="https://github.com/lvgl/lvgl/commit/81f3068d">81f3068d</a> 
- adding micropython examples (#2286) <a href="https://github.com/lvgl/lvgl/commit/c60ed68e">c60ed68e</a> 
- docs(color) minor fix <a href="https://github.com/lvgl/lvgl/commit/ac8f4534">ac8f4534</a> 
- fix(example) revert test code <a href="https://github.com/lvgl/lvgl/commit/77e2c1ff">77e2c1ff</a> 
- fix(draw) with additive blending with 32 bit color depth <a href="https://github.com/lvgl/lvgl/commit/786db2af">786db2af</a> 
- docs(color) update colors' docs <a href="https://github.com/lvgl/lvgl/commit/9056b5ee">9056b5ee</a> 
- Merge branch 'master' of https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/a711a1dd">a711a1dd</a> 
- perf(refresh) optimize where to wait for lv_disp_flush_ready with 2 buffers <a href="https://github.com/lvgl/lvgl/commit/d0172f14">d0172f14</a> 
- docs(lv_obj_style) update add_style and remove_style function headers (#2287) <a href="https://github.com/lvgl/lvgl/commit/60f7bcbf">60f7bcbf</a> 
- fix memory leak of spangroup (#2285) <a href="https://github.com/lvgl/lvgl/commit/33e0926a">33e0926a</a> 
- fix make lv_img_cache.h public becasue cache invalidation is public <a href="https://github.com/lvgl/lvgl/commit/38ebcd81">38ebcd81</a> 
- Merge branch 'master' of https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/2b292495">2b292495</a> 
- fix(btnmamatrix) fix focus event handling <a href="https://github.com/lvgl/lvgl/commit/3b58ef14">3b58ef14</a> 
- Merge pull request #2280 from lvgl/dependabot/pip/docs/urllib3-1.26.5 <a href="https://github.com/lvgl/lvgl/commit/a2f45b26">a2f45b26</a> 
- fix(label) calculating the clip area <a href="https://github.com/lvgl/lvgl/commit/57e211cc">57e211cc</a> 
- chore(deps): bump urllib3 from 1.26.4 to 1.26.5 in /docs <a href="https://github.com/lvgl/lvgl/commit/b2f77dfc">b2f77dfc</a> 
- fix(docs) add docs about the default group <a href="https://github.com/lvgl/lvgl/commit/29bfe604">29bfe604</a> 

</p>
</details>


- 文档（文件系统）更新到 v8 <a href="https://github.com/lvgl/lvgl/commit/7971ade4">7971ade4</a>
- 修复（msgbox）在顶层而不是行为屏幕上创建模态<a href="https://github.com/lvgl/lvgl/commit/5cf6303e">5cf6303e</a>
- 修复（colowheel）默认禁用 LV_OBJ_FLAG_SCROLL_CHAIN <a href="https://github.com/lvgl/lvgl/commit/48d1c292">48d1c292</a>
- 文档（网格）错字修复（#2310）<a href="https://github.com/lvgl/lvgl/commit/69d109d2">69d109d2</a>
- fix(arduino) 修复LVGL_Arduino.ino中my_touchpad_read的原型<a href="https://github.com/lvgl/lvgl/commit/1a62f7a6">1a62f7a6</a>
- fix(meter) 修复针图像失效<a href="https://github.com/lvgl/lvgl/commit/54d8e817">54d8e817</a>
- fix(mem) 为 tlsf 函数和类型添加 lv_ 前缀 <a href="https://github.com/lvgl/lvgl/commit/0d52b59c">0d52b59c</a>
- fix(calendar) 修正今天的位置计算<a href="https://github.com/lvgl/lvgl/commit/ad05e196">ad05e196</a>
- 修复（打字错误）将 LV_OBJ_FLAG_SNAPABLE 重命名为 LV_OBJ_FLAG_SNAPPABLE <a href="https://github.com/lvgl/lvgl/commit/e697807c">e697807c</a>
- 文档（颜色）语言修复（#2302）<a href="https://github.com/lvgl/lvgl/commit/07ecc9f1">07ecc9f1</a>
- 在 lv_tick_inc 调用测试中修复（tick）次要优化 <a href="https://github.com/lvgl/lvgl/commit/b4305df5">b4305df5</a>
- 文档的拼写和其他语言修复 (#2293) <a href="https://github.com/lvgl/lvgl/commit/d0aaacaf">d0aaacaf</a>
- 修复（主题）在 btnmatrix、msgbox 和 kayboard 按钮上显示禁用状态 <a href="https://github.com/lvgl/lvgl/commit/0be582b3">0be582b3</a>
- 修复（滚动）保持对象上的滚动位置被删除 <a href="https://github.com/lvgl/lvgl/commit/52edbb46">52edbb46</a>
- 修复（msgbox）处理 NULL btn 映射参数 <a href="https://github.com/lvgl/lvgl/commit/769c4a30">769c4a30</a>
- fix(group) 允许重新聚焦对象 <a href="https://github.com/lvgl/lvgl/commit/1520208b">1520208b</a>
- 文档（概述）拼写修复 <a href="https://github.com/lvgl/lvgl/commit/d2efb8c6">d2efb8c6</a>
- 合并 https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/45960838">45960838</a> 的分支“master”
- feat(timer) 检查 lv_tick_inc 是否被调用 <a href="https://github.com/lvgl/lvgl/commit/aa6641a6">aa6641a6</a>
- feat(docs) 在 GitHub 链接上添加视图 <a href="https://github.com/lvgl/lvgl/commit/a716ac6e">a716ac6e</a>
- fix(theme) 修复默认主题中的开关样式<a href="https://github.com/lvgl/lvgl/commit/0c0dc8ea">0c0dc8ea</a>
- 文档修复错字 <a href="https://github.com/lvgl/lvgl/commit/8ab80645">8ab80645</a>
- 合并 https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/e796448f">e796448f</a> 的分支“master”
- feat(event) 将滚动动画传递给 LV_EVENT_SCROLL_BEGIN <a href="https://github.com/lvgl/lvgl/commit/ca54ecfe">ca54ecfe</a>
- fix(tabview) 使用左右标签修复<a href="https://github.com/lvgl/lvgl/commit/17c57449">17c57449</a>
- 杂务(docs) 强制文档重建 <a href="https://github.com/lvgl/lvgl/commit/4a0f4139">4a0f4139</a>
- 杂务（docs）总是将 master 部署到 docs/master 以及 <a href="https://github.com/lvgl/lvgl/commit/6d05692d">6d05692d</a>
- 修复（模板）更新 lv_objx_template 到 v8 <a href="https://github.com/lvgl/lvgl/commit/38bb8afc">38bb8afc</a>
- docs(extra) 添加 extra/README.md <a href="https://github.com/lvgl/lvgl/commit/8cd504d5">8cd504d5</a>
- 更新 CHANGELOG.md <a href="https://github.com/lvgl/lvgl/commit/48fd73d2">48fd73d2</a>
- 更新 quick-overview.md (#2295) <a href="https://github.com/lvgl/lvgl/commit/5616471c">5616471c</a>
- 修复（pxp）将 LV_COLOR_TRANSP 更改为 LV_COLOR_CHROMA_KEY 以兼容 v8 <a href="https://github.com/lvgl/lvgl/commit/81f3068d">81f3068d</a>
- 添加 micropython 示例 (#2286) <a href="https://github.com/lvgl/lvgl/commit/c60ed68e">c60ed68e</a>
- 文档（颜色）小修正 <a href="https://github.com/lvgl/lvgl/commit/ac8f4534">ac8f4534</a>
- 修复（示例）恢复测试代码 <a href="https://github.com/lvgl/lvgl/commit/77e2c1ff">77e2c1ff</a>
- 修复（绘制）与 32 位颜色深度的加法混合 <a href="https://github.com/lvgl/lvgl/commit/786db2af">786db2af</a>
- docs(color) 更新颜色的文档 <a href="https://github.com/lvgl/lvgl/commit/9056b5ee">9056b5ee</a>
- 合并 https://github.com/lvgl/lvgl <a href="https://github.com/lvgl/lvgl/commit/a711a1dd">a711a1dd</a> 的分支“master”
- perf(refresh) 使用 2 个缓冲区优化等待 lv_disp_flush_ready 的位置 <a href="https://github.com/lvgl/lvgl/commit/d0172f14">d0172f14</a>
- docs(lv_obj_style) 更新 add_style 和 remove_style 函数头 (#2287) <a href="https://github.com/lvgl/lvgl/commit/60f7bcbf">60f7bcbf</a>
- 修复 spangroup 的内存泄漏 (#2285) <a href="https://github.com/lvgl/lvgl/commit/33e0926a">33e0926a</a>
- 修复使 lv_img_cache.h 公开，因为缓存失效是公开的 <a href="https://github.com/lvgl/lvgl/commit/38ebcd81">38ebcd81</a>
- 合并 https://github.com/lvgl/lvgl 的分支“master” <a href="https://github.com/lvgl/lvgl/commit/2b292495">2b292495</a>
- fix(btnmamatrix) 修复焦点事件处理 <a href="https://github.com/lvgl/lvgl/commit/3b58ef14">3b58ef14</a>
- 从 lvgl/dependabot/pip/docs/urllib3-1.26.5 <a href="https://github.com/lvgl/lvgl/commit/a2f45b26">a2f45b26</a> 合并拉取请求 #2280
- 修复（标签）计算剪辑区域<a href="https://github.com/lvgl/lvgl/commit/57e211cc">57e211cc</a>
- 苦差事（deps）：在/docs <a href="https://github.com/lvgl/lvgl/commit/b2f77dfc">b2f77dfc</a> 中将 urllib3 从 1.26.4 提升到 1.26.5
- fix(docs) 添加关于默认组的文档 <a href="https://github.com/lvgl/lvgl/commit/29bfe604">29bfe604</a>


## v8.0.0 (01.06.2021)

<details>
<summary>查看原文</summary>
<p>

v8.0 brings many new features like simplified and more powerful scrolling, new layouts inspired by CSS Flexbox and Grid, simplified and improved widgets, more powerful events, hookable drawing, and more.

v8 is a major change and therefore it's not backward compatible with v7. 

</p>
</details>

v8.0 带来了许多新功能，例如简化且更强大的滚动、受 CSS Flexbox 和 Grid 启发的新布局、简化和改进的小部件、更强大的事件、可挂钩绘图等。

v8 是一个重大变化，因此它不向后兼容 v7。

### Directory structure（目录结构）

<details>
<summary>查看原文</summary>
<p>

- The `lv_` prefix is removed from the folder names
- The `docs` is moved to the `lvgl` repository
- The `examples` are moved to the `lvgl` repository
- Create an `src/extra` folder for complex widgets:
   - It makes the core LVGL leaner
   - In `extra` we can have a lot and specific widgets
   - Good place for contributions

</p>
</details>

- 从文件夹名称中删除了 `lv_` 前缀
- `docs` 被移动到 `lvgl` 存储库
- `examples` 被移动到 `lvgl` 存储库
- 为复杂的小部件创建一个 `src/extra` 文件夹：
    - 它使核心 LVGL 更精简
    - 在`extra`中，我们可以有很多特定的小部件
    - 贡献的好地方


### Widget changes（部件更改）

<details>
<summary>查看原文</summary>
<p>

- `lv_cont` removed, layout features are moved to `lv_obj`
- `lv_page` removed, scroll features are moved to `lv_obj`
- `lv_objmask` the same can be achieved by events
- `lv_meter` added as the unioin of `lv_linemeter` and `lv_gauge`
- `lv_span` new widget mimicing HTML `<span>`
- `lv_animing` new widget for simple slideshow animations
- \+ many minor changes and improvements

</p>
</details>

- 删除了`lv_cont`，布局功能移到了`lv_obj`
- 删除了`lv_page`，滚动功能移到了`lv_obj`
- `lv_objmask` 同样可以通过事件来实现
- 添加了 `lv_meter` 作为 `lv_linemeter` 和 `lv_gauge` 的联合
- `lv_span` 新小部件模仿 HTML `<span>`
- `lv_animing` 用于简单幻灯片动画的新小部件
- \+ 许多小的变化和改进


### New scrolling（新的滚动功能）

<details>
<summary>查看原文</summary>
<p>

- Support "elastic" scrolling when scrolled in
- Support scroll chaining among any objects types (not only `lv_pages`s)
- Remove `lv_drag`. Similar effect can be achieved by setting the position in `LV_EVENT_PRESSING`
- Add snapping
- Add snap stop to scroll max 1 snap point

</p>
</details>

- 滚动时支持“弹性”滚动
- 支持任何对象类型之间的滚动链接（不仅是`lv_pages`s）
- 删除`lv_drag`。 类似的效果可以通过在`LV_EVENT_PRESSING`中设置位置来实现
- 添加捕捉
- 添加捕捉停止以滚动最多 1 个捕捉点

### New layouts（新的布局）

<details>
<summary>查看原文</summary>
<p>

- [CSS Grid](https://css-tricks.com/snippets/css/a-guide-to-grid/)-like layout support
- [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)-like layout support

</p>
</details>

- [CSS Grid](https://css-tricks.com/snippets/css/a-guide-to-grid/) 类似布局支持
- [CSS Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/) 类似布局支持


### Styles（样式）

<details>
<summary>查看原文</summary>
<p>

- Optimize and simplify styles
- State is saved in the object instead of the style property
- Object size and position can be set in styles too

</p>
</details>

- 优化和简化样式
- 状态保存在对象中而不是样式属性中
- 对象大小和位置也可以在样式中设置

### Events（事件）

<details>
<summary>查看原文</summary>
<p>

- Allow adding multiple events to an object
- A `user_data` can be attached to the added events

</p>
</details>


- 允许向一个对象添加多个事件
- 一个 `user_data` 可以附加到添加的事件


### Driver changes（驱动程序更改）

<details>
<summary>查看原文</summary>
<p>

- `lv_disp_drv_t`, `lv_indev_drv_t`, `lv_fs_drv_t` needs to be `static`
- `...disp_buf...` is renamed to `draw_buf`. See an initialization example [here](https://github.com/lvgl/lv_sim_eclipse_sdl/blob/release/v8.0/main.c#L128-L141).
- No partial update if two screen sized buffers are set
- `disp_drv->full_refresh = 1` makes always the whole display redraw. 
- `hor_res` and `ver_res` need to be set in `disp_drv`
- `indev_read_cb` returns `void`. To indicate that there is more that to read set `data->continue_reading = 1` in the `read_cb`


</p>
</details>


- `lv_disp_drv_t`、`lv_indev_drv_t`、`lv_fs_drv_t` 需要是`static`
- `...disp_buf...` 重命名为 `draw_buf`。 请参阅[此处]（https://github.com/lvgl/lv_sim_eclipse_sdl/blob/release/v8.0/main.c#L128-L141）的初始化示例。
- 如果设置了两个屏幕大小的缓冲区，则不会进行部分更新
- `disp_drv->full_refresh = 1` 总是使整个显示重绘。
- `hor_res` 和 `ver_res` 需要在 `disp_drv` 中设置
- `indev_read_cb` 返回 `void`。 表示在 read_cb 中还有更多要读取的 set `data->continue_reading = 1`


### Other changes（其他变化）

<details>
<summary>查看原文</summary>
<p>

- Remove the copy parameter from create functions
- Simplified File system interface API
- Use a more generic inheritance
- The built-in themes are reworked
- `lv_obj_align` now saved the alignment and realigns the object automatically but can't be used to align to other than the parent
- `lv_obj_align_to` can align to an object but doesn't save the alignment
- `lv_pct(x)` can be used to set the size and position in percentage
- There are many other changes in widgets that are not detailed here. Please refer to the documentation of the widgets.

</p>
</details>


- 从创建函数中删除复制参数
- 简化的文件系统接口 API
- 使用更通用的继承
- 重新设计了内置主题
- `lv_obj_align` 现在保存对齐并自动重新对齐对象，但不能用于对齐到父对象以外的对象
- `lv_obj_align_to` 可以对齐到一个对象，但不保存对齐
- `lv_pct(x)` 可用于以百分比设置大小和位置
- 小部件中还有许多其他更改，此处未详细说明。 请参阅小部件的文档。


### New release policy（新的发布政策）

<details>
<summary>查看原文</summary>
<p>

- We will follow [Release branches with GitLab flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html#release-branches-with-gitlab-flow)
- Minor releases are expected in every 3-4 month
- `master` will always contain the latest changes

</p>
</details>

- 我们将遵循[使用 GitLab 流程发布分支](https://docs.gitlab.com/ee/topics/gitlab_flow.html#release-branches-with-gitlab-flow)
- 预计每 3-4 个月发布一次小版本
- `master` 将始终包含最新的更改


### Migrating from v7 to v8（从 v7 迁移到 v8）

<details>
<summary>查看原文</summary>
<p>

- First and foremost, create a new `lv_conf.h` based on `lv_conf_template.h`.
- To try the new version it's recommended to use a simulator project and see the examples.
- When migrating your project to v8
  - Update the drivers are described above
  - Update the styles
  - Update the events
  - Use the new layouts instead of `lv_cont` features
  - Use `lv_obj` instead of `lv_page`
  - See the changes in [Colors](https://docs.lvgl.io/8.0/overview/color.html)
  - The other parts are mainly minor renames and refactoring. See the functions' documentation for descriptions. 

</p>
</details>

- 首先，基于 `lv_conf_template.h` 创建一个新的 `lv_conf.h`。
- 要尝试新版本，建议使用模拟器项目并查看示例。
- 将项目迁移到 v8 时
   - 更新驱动程序如上所述
   - 更新样式
   - 更新事件
   - 使用新布局而不是 `lv_cont` 功能
   - 使用`lv_obj`代替`lv_page`
   - 查看[颜色]中的变化(https://docs.lvgl.io/8.0/overview/color.html)
   - 其他部分主要是小的重命名和重构。 有关说明，请参阅函数的文档。


## v7.11.0 (16.03.2021)

### New features
- Add better screen orientation management with software rotation support
- Decide text animation's direction based on base_dir (when using LV_USE_BIDI)

### Bugfixes
- fix(gauge) fix needle invalidation
- fix(bar) correct symmetric handling for vertical sliders

## v7.10.1 (16.02.2021)

### Bugfixes 
- fix(draw) overlap outline with background to prevent aliasing artifacts
- fix(indev) clear the indev's `act_obj` in `lv_indev_reset`
- fix(text) fix out of bounds read in `_lv_txt_get_width`
- fix(list) scroll list when button is focused using LV_KEY_NEXT/PREV
- fix(text) improve Arabic contextual analysis by adding hyphen processing and proper handling of lam-alef sequence
- fix(delete) delete animation after the children are deleted
- fix(gauge) consider paddings for needle images

## v7.10.0 (02.02.2021)

### New features
- feat(indev) allow input events to be passed to disabled objects
- feat(spinbox) add inline get_step function for MicroPython support

### Bugfixes
- fix(btnmatrix) fix lv_btnmatrix_get_active_btn_text() when used in a group

## v7.9.1 (19.01.2021)

### Bugfixes
- fix(cpicker) fix division by zero
- fix(dropdown) fix selecting options after the last one
- fix(msgbox) use the animation time provided
- fix(gpu_nxp_pxp) fix incorrect define name
- fix(indev) don't leave edit mode if there is only one object in the group
- fix(draw_rect) fix draw pattern stack-use-after-scope error


## v7.9.0 (05.01.2021)

### New features
- feat(chart) add lv_chart_remove_series and lv_chart_hide_series
- feat(img_cahce) allow disabling image caching
- calendar: make get_day_of_week() public
- Added support for Zephyr integration
 
### Bugfixes
- fix(draw_rect) free buffer used for arabic processing
- fix(win) arabic process the title of the window
- fix(dropdown) arabic process the option in lv_dropdown_add_option
- fix(textarea) buffer overflow in password mode with UTF-8 characters
- fix(textarea) cursor position after hiding character in password mode
- fix(linemeter) draw critical lines with correct color
- fix(lv_conf_internal) be sure Kconfig defines are always uppercase
- fix(kconfig) handle disable sprintf float correctly.
- fix(layout) stop layout after recursion threshold is reached
- fix(gauge) fix redraw with image needle

## v7.8.1 (15.12.2020)

### Bugfixes
- fix(lv_scr_load_anim) fix when multiple screen are loaded at tsame time with delay
- fix(page) fix LV_SCOLLBAR_MODE_DRAG

## v7.8.0 (01.12.2020)

### New features
- make DMA2D non blocking 
- add unscii-16 built-in font
- add KConfig
- add lv_refr_get_fps_avg()

### Bugfixes
- fix(btnmatrix) handle arabic texts in button matrices
- fix(indev) disabled object shouldn't absorb clicks but let the parent to be clicked
- fix(arabic) support processing again already processed texts with _lv_txt_ap_proc
- fix(textarea) support Arabic letter connections
- fix(dropdown) support Arabic letter connections
- fix(value_str) support Arabic letter connections in value string property
- fix(indev) in LV_INDEV_TYPE_BUTTON recognize 1 cycle long presses too
- fix(arc) make arc work with encoder
- fix(slider) adjusting the left knob too with encoder
- fix reference to LV_DRAW_BUF_MAX_NUM in lv_mem.c
- fix(polygon draw) join adjacent points if they are on the same coordinate
- fix(linemeter) fix invalidation when setting new value 
- fix(table) add missing invalidation when changing cell type
- refactor(roller) rename LV_ROLLER_MODE_INIFINITE -> LV_ROLLER_MODE_INFINITE

## v7.7.2 (17.11.2020)
### Bugfixes
- fix(draw_triangle): fix polygon/triangle drawing when the order of points is counter-clockwise
- fix(btnmatrix): fix setting the same map with modified pointers
- fix(arc) fix and improve arc dragging
- label: Repair calculate back `dot` character logical error which cause infinite loop.
- fix(theme_material): remove the bottom border from tabview header
- fix(imgbtn) guess a the closest available state with valid src
- fix(spinbox) update cursor position in lv_spinbox_set_step 

## v7.7.1 (03.11.2020)
### Bugfixes
- Respect btnmatrix's `one_check` in `lv_btnmatrix_set_btn_ctrl`
- Gauge: make the needle images to use the styles from `LV_GAUGE_PART_PART`
- Group: fix in `lv_group_remove_obj` to handle deleting hidden obejcts correctly

## v7.7.0 (20.10.2020)

### New features
- Add PXP GPU support (for NXP MCUs)
- Add VG-Lite GPU support (for NXP MCUs)
- Allow max. 16 cell types for table
- Add `lv_table_set_text_fmt()`
- Use margin on calendar header to set distances and padding to the size of the header
- Add `text_sel_bg` style property

### Bugfixes
- Theme update to support text selection background
- Fix imgbtn state change
- Support RTL in table (draw columns right to left)
- Support RTL in pretty layout (draw columns right to left)
- Skip objects in groups if they are in disabled state
- Fix dropdown selection with RTL basedirection
- Fix rectangle border drawing with large width
- Fix `lv_win_clean()`

## v7.6.1 (06.10.2020)

### Bugfixes
- Fix BIDI support in dropdown list
- Fix copying base dir in `lv_obj_create`
- Handle sub pixel rendering in font loader
- Fix transitions with style caching
- Fix click focus
- Fix imgbtn image switching with empty style
- Material theme: do not set the text font to allow easy global font change

## v7.6.0 (22.09.2020)

### New features
- Check whether any style property has changed on a state change to decide if any redraw is required

### Bugfixes
- Fix selection of options with non-ASCII letters in dropdown list 
- Fix font loader to support LV_FONT_FMT_TXT_LARGE

## v7.5.0 (15.09.2020)

### New features
- Add `clean_dcache_cb` and `lv_disp_clean_dcache` to enable users to use their own cache management function
- Add `gpu_wait_cb` to wait until the GPU is working. It allows to run CPU a wait only when the rendered data is needed.
- Add 10px and 8ox built in fonts

### Bugfixes
- Fix unexpected DEFOCUS on lv_page when clicking to bg after the scrollable
- Fix `lv_obj_del` and `lv_obj_clean` if the children list changed during deletion.
- Adjust button matrix button width to include padding when spanning multiple units.
- Add rounding to btnmatrix line height calculation
- Add `decmopr_buf` to GC roots
- Fix divisioin by zero in draw_pattern (lv_draw_rect.c) if the image or letter is not found
- Fix drawing images with 1 px height or width

## v7.4.0 (01.09.2020)

The main new features of v7.4 are run-time font loading, style caching and arc knob with value setting by click.

### New features
- Add `lv_font_load()` function - Loads a `lv_font_t` object from a binary font file
- Add `lv_font_free()` function - Frees the memory allocated by the `lv_font_load()` function
- Add style caching to reduce access time of properties with default value
- arc: add set value by click feature
- arc: add `LV_ARC_PART_KNOB` similarly to slider
- send gestures event if the object was dragged. User can check dragging with `lv_indev_is_dragging(lv_indev_act())` in the event function.

### Bugfixes
- Fix color bleeding on border drawing
- Fix using 'LV_SCROLLBAR_UNHIDE' after 'LV_SCROLLBAR_ON'
- Fix croping of last column/row if an image is zoomed
- Fix zooming and rotateing mosaic images
- Fix deleting tabview with LEFT/RIGHT tab position
- Fix btnmatrix to not send event when CLICK_TRIG = true and the cursor slid from a pressed button
- Fix roller width if selected text is larger than the normal

## v7.3.1 (18.08.2020)

### Bugfixes
- Fix drawing value string twice
- Rename  `lv_chart_clear_serie` to `lv_chart_clear_series` and `lv_obj_align_origo` to `lv_obj_align_mid`
- Add linemeter's mirror feature again
- Fix text decor (udnerline strikethrough) with older versions of font converter
- Fix setting local style property multiple times 
- Add missing background drawing and radius handling to image button
- Allow adding extra label to list buttons
- Fix crash if `lv_table_set_col_cnt` is called before `lv_table_set_row_cnt` for the first time
- Fix overflow in large image transformations
- Limit extra button click area of button matrix's buttons. With large paddings it was counter intuitive. (Gaps are mapped to button when clicked).
- Fix `lv_btnmatrix_set_one_check` not forcing exactly one button to be checked
- Fix color picker invalidation in rectangle mode
- Init disabled days to gray color in calendar

## v7.3.0 (04.08.2020)

### New features
- Add `lv_task_get_next`
- Add `lv_event_send_refresh`, `lv_event_send_refresh_recursive` to easily send `LV_EVENT_REFRESH` to object
- Add `lv_tabview_set_tab_name()` function - used to change a tab's name
- Add `LV_THEME_MATERIAL_FLAG_NO_TRANSITION` and `LV_THEME_MATERIAL_FLAG_NO_FOCUS` flags
- Reduce code size by adding: `LV_USE_FONT_COMPRESSED` and `LV_FONT_USE_SUBPX` and applying some optimization
- Add `LV_MEMCPY_MEMSET_STD` to use standard `memcpy` and `memset`

### Bugfixes
- Do not print warning for missing glyph if its height OR width is zero.
- Prevent duplicated sending of `LV_EVENT_INSERT` from text area
- Tidy outer edges of cpicker widget.
- Remove duplicated lines from `lv_tabview_add_tab`
- btnmatrix: hadle combined states of buttons (e.g. chacked + disabled)
- textarea: fix typo in lv_textarea_set_sscrollbar_mode
- gauge: fix image needle drawing
- fix using freed memory in _lv_style_list_remove_style

## v7.2.0 (21.07.2020)

### New features
- Add screen transitions with `lv_scr_load_anim()`
- Add display background color, wallpaper and opacity. Shown when the screen is transparent. Can be used with `lv_disp_set_bg_opa/color/image()`.
- Add `LV_CALENDAR_WEEK_STARTS_MONDAY`
- Add `lv_chart_set_x_start_point()` function - Set the index of the x-axis start point in the data array
- Add `lv_chart_set_ext_array()` function - Set an external array of data points to use for the chart
- Add `lv_chart_set_point_id()` function - Set an individual point value in the chart series directly based on index
- Add `lv_chart_get_x_start_point()` function - Get the current index of the x-axis start point in the data array
- Add `lv_chart_get_point_id()` function - Get an individual point value in the chart series directly based on index
- Add `ext_buf_assigned` bit field to `lv_chart_series_t` structure - it's true if external buffer is assigned to series
- Add `lv_chart_set_series_axis()` to assign series to primary or secondary axis
- Add `lv_chart_set_y_range()` to allow setting range of secondary y axis (based on `lv_chart_set_range` but extended with an axis parameter)
- Allow setting different font for the selected text in `lv_roller`
- Add `theme->apply_cb` to replace `theme->apply_xcb` to make it compatible with the MicroPython binding
- Add `lv_theme_set_base()` to allow easy extension of built-in (or any) themes
- Add `lv_obj_align_x()` and `lv_obj_align_y()` functions
- Add `lv_obj_align_origo_x()` and `lv_obj_align_origo_y()` functions

### Bugfixes
- `tileview` fix navigation when not screen sized
- Use 14px font by default to for better compatibility with smaller displays 
- `linemeter` fix conversation of current value to "level"
- Fix drawing on right border
- Set the cursor image non clickable by default
- Improve mono theme when used with keyboard or encoder

## v7.1.0 (07.07.2020)

### New features
- Add `focus_parent` attribute to `lv_obj`
- Allow using buttons in encoder input device
- Add lv_btnmatrix_set/get_align capability
- DMA2D: Remove dependency on ST CubeMX HAL
- Added `max_used` propriety to `lv_mem_monitor_t` struct
- In `lv_init` test if the strings are UTF-8 encoded.
- Add `user_data` to themes
- Add LV_BIG_ENDIAN_SYSTEM flag to lv_conf.h in order to fix displaying images on big endian systems.
- Add inline function lv_checkbox_get_state(const lv_obj_t * cb) to extend the checkbox functionality.
- Add inline function lv_checkbox_set_state(const lv_obj_t * cb, lv_btn_state_t state ) to extend the checkbox functionality.

### Bugfixes
- `lv_img` fix invalidation area when angle or zoom changes
- Update the style handling to support Big endian MCUs
- Change some methods to support big endian hardware.
- remove use of c++ keyword 'new' in parameter of function lv_theme_set_base().
- Add LV_BIG_ENDIAN_SYSTEM flag to lv_conf.h in order to fix displaying images on big endian systems.
- Fix inserting chars in text area in big endian hardware.

## v7.0.2 (16.06.2020)

### Bugfixes
- `lv_textarea` fix wrong cursor position when clicked after the last character
- Change all text related indices from 16-bit to 32-bit integers throughout whole library. #1545
- Fix gestures
- Do not call `set_px_cb` for transparent pixel
- Fix list button focus in material theme
- Fix crash when the a text area is cleared with the backspace of a keyboard
- Add version number to `lv_conf_template.h`
- Add log in true double buffering mode with `set_px_cb`
- `lv_dropdown`: fix missing `LV_EVENT_VALUE_CHANGED` event when used with encoder
- `lv_tileview`: fix if not the {0;0} tile is created first
- `lv_debug`: restructure to allow asserting in from `lv_misc` too
- add assert if `_lv_mem_buf_get()` fails
- `lv_textarea`: fix character delete in password mode
- Update `LV_OPA_MIN` and `LV_OPA_MAX` to widen the opacity processed range
- `lv_btnm` fix sending events for hidden buttons
- `lv_gaguge` make `lv_gauge_set_angle_offset` offset the labels and needles too
- Fix typo in the API `scrllable` -> `scrollable`
- `tabview` by default allow auto expanding the page only to right and bottom (#1573)
- fix crash when drawing gradient to the same color
- chart: fix memory leak
- `img`: improve hit test for transformed images

## v7.0.1 (01.06.2020)

### Bugfixes
- Make the Microptyhon working by adding the required variables as GC_ROOT
- Prefix some internal API functions with `_` to reduce the API of LVGL 
- Fix built-in SimSun CJK font
- Fix UTF-8 encoding when `LV_USE_ARABIC_PERSIAN_CHARS` is enabled
- Fix DMA2D usage when 32 bit images directly blended
- Fix lv_roller in infinite mode when used with encoder
- Add `lv_theme_get_color_secondary()`
- Add `LV_COLOR_MIX_ROUND_OFS` to adjust color mixing to make it compatible with the GPU
- Improve DMA2D blending
- Remove memcpy from `lv_ll` (caused issues with some optimization settings)
- `lv_chart` fix X tick drawing
- Fix vertical dashed line drawing
- Some additional minor fixes and formattings

## v7.0.0 (18.05.2020)

### Documentation
The docs for v7 is available at https://docs.littlevgl.com/v7/en/html/index.html

### Legal changes

The name of the project is changed to LVGL and the new website is on https://lvgl.io

LVGL remains free under the same conditions (MIT license) and a company is created to manage LVGL and offer services.

### New drawing system
Complete rework of LVGL's draw engine to use "masks" for more advanced and higher quality graphical effects. 
A possible use-case of this system is to remove the overflowing content from the rounded edges.
It also allows drawing perfectly anti-aliased circles, lines, and arcs.
Internally, the drawings happen by defining masks (such as rounded rectangle, line, angle). 
When something is drawn the currently active masks can make some pixels transparent. 
For example, rectangle borders are drawn by using 2 rectangle masks: one mask removes the inner part and another the outer part. 

The API in this regard remained the same but some new functions were added:
- `lv_img_set_zoom`: set image object's zoom factor
- `lv_img_set_angle`: set image object's angle without using canvas
- `lv_img_set_pivot`: set the pivot point of rotation

The new drawing engine brought new drawing features too. They are highlighted in the "style" section.

### New style system
The old style system is replaced with a new more flexible and lightweighted one. 
It uses an approach similar to CSS: support cascading styles, inheriting properties and local style properties per object. 
As part of these updates, a lot of objects were reworked and the APIs have been changed. 

- more shadows options: *offset* and *spread*
- gradient stop position to shift the gradient area and horizontal gradient 
- `LV_BLEND_MODE_NORMAL/ADDITIVE/SUBTRACTIVE` blending modes
- *clip corner*: crop the content on the rounded corners
- *text underline* and *strikethrough*
- dashed vertical and horizontal lines (*dash gap*, *dash_width*)
- *outline*: a border-like part drawn out of the background. Can have spacing to the background.
- *pattern*: display and image in the middle of the background or repeat it
- *value* display a text which is stored in the style. It can be used e.g. as a lighweighted text on buttons too.
- *margin*: similar to *padding* but used to keep space outside of the object

Read the [Style](https://docs.littlevgl.com/v7/en/html/overview/style.html) section of the documentation to learn how the new styles system works.

### GPU integration
To better utilize GPUs, from this version GPU usage can be integrated into LVGL. In `lv_conf.h` any supported GPUs can be enabled with a single configuration option.

Right now, only ST's DMA2D (Chrom-ART) is integrated. More will in the upcoming releases.

### Renames
The following object types are renamed:
- sw -> switch
- ta -> textarea
- cb -> checkbox
- lmeter -> linemeter
- mbox -> msgbox
- ddlist -> dropdown
- btnm -> btnmatrix
- kb -> keyboard
- preload -> spinner
- lv_objx folder -> lv_widgets
- LV_FIT_FILL -> LV_FIT_PARENT
- LV_FIT_FLOOD -> LV_FLOOD_MAX
- LV_LAYOUT_COL_L/M/R -> LV_LAYOUT_COLUMN_LEFT/MID/RIGHT
- LV_LAYOUT_ROW_T/M/B -> LV_LAYOUT_ROW_TOP/MID/BOTTOM

### Reworked and improved object
- `dropdown`: Completely reworked. Now creates a separate list when opened and can be dropped to down/up/left/right.
- `label`: `body_draw` is removed, instead, if its style has a visible background/border/shadow etc it will be drawn. Padding really makes the object larger (not just virtually as before)
- `arc`: can draw bacground too.
- `btn`: doesn't store styles for each state because it's done naturally in the new style system.
- `calendar`: highlight the pressed datum. The used styles are changed: use `LV_CALENDAR_PART_DATE` normal for normal dates, checked for highlighted, focused for today, pressed for the being pressed. (checked+pressed, focused+pressed also work)
- `chart`: only has `LINE` and `COLUMN` types because with new styles all the others can be described. LV_CHART_PART_SERIES sets the style of the series. bg_opa > 0 draws an area in LINE mode. `LV_CHART_PART_SERIES_BG` also added to set a different style for the series area. Padding in `LV_CHART_PART_BG` makes the series area smaller, and it ensures space for axis labels/numbers.
- `linemeter`, `gauge`: can have background if the related style properties are set. Padding makes the scale/lines smaller. scale_border_width and scale_end_border_width allow to draw an arc on the outer part of the scale lines.
- `gauge`: `lv_gauge_set_needle_img` allows use image as needle
- `canvas`: allow drawing to true color alpha and alpha only canvas, add `lv_canvas_blur_hor/ver` and rename `lv_canvas_rotate` to `lv_canvas_transform`
- `textarea`: If available in the font use bullet (`U+2022`) character in text area password 

### New object types
- `lv_objmask`: masks can be added to it. The children will be masked accordingly. 

### Others
- Change the built-in fonts to [Montserrat](https://fonts.google.com/specimen/Montserrat) and add built-in fonts from 12 px to 48 px for every 2nd size.
- Add example CJK and Arabic/Persian/Hebrew built-in font
- Add ° and "bullet" to the built-in fonts
- Add Arabic/Persian script support: change the character according to its position in the text. 
- Add `playback_time` to animations.
- Add `repeat_count` to animations instead of the current "repeat forever".
- Replace `LV_LAYOUT_PRETTY` with `LV_LAYOUT_PRETTY_TOP/MID/BOTTOM`

### Demos
- [lv_examples](https://github.com/littlevgl/lv_examples) was reworked and new examples and demos were added

### New release policy
- Maintain this Changelog for every release
- Save old major version in new branches. E.g. `release/v6`
- Merge new features and fixes directly into `master` and release a patch or minor releases every 2 weeks.

### Migrating from v6 to v7
- First and foremost, create a new `lv_conf.h` based on `lv_conf_template.h`.
- To try the new version it suggested using a simulator project and see the examples.
- If you have a running project, the most difficult part of the migration is updating to the new style system. Unfortunately, there is no better way than manually updating to the new format.
- The other parts are mainly minor renames and refactoring as described above. 
