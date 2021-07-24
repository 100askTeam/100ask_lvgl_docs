```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/porting/log.md
```
# Logging（日志）

<details>
<summary>查看原文</summary>
<p>

LVGL has built-in *Log* module to inform the user about what is happening in the library.

</p>
</details>

LVGL 有内置的 *Log* 模块来通知用户库中发生的事情。

## Log level（日记等级）

<details>
<summary>查看原文</summary>
<p>

To enable logging, set `LV_USE_LOG  1` in `lv_conf.h` and set `LV_LOG_LEVEL` to one of the following values:
- `LV_LOG_LEVEL_TRACE` A lot of logs to give detailed information
- `LV_LOG_LEVEL_INFO`  Log important events
- `LV_LOG_LEVEL_WARN`  Log if something unwanted happened but didn't cause a problem
- `LV_LOG_LEVEL_ERROR` Only critical issues, where the system may fail
- `LV_LOG_LEVEL_USER` Only user messages
- `LV_LOG_LEVEL_NONE`  Do not log anything

The events which have a higher level than the set log level will be logged too. E.g. if you `LV_LOG_LEVEL_WARN`, errors will be also logged.

</p>
</details>

要启用日志记录，请在“lv_conf.h”中设置“LV_USE_LOG 1”并将“LV_LOG_LEVEL”设置为以下值之一：
- `LV_LOG_LEVEL_TRACE` 大量日志提供详细信息
- `LV_LOG_LEVEL_INFO` 记录重要事件
- `LV_LOG_LEVEL_WARN` 记录是否发生了不想要的事情但没有引起问题
- `LV_LOG_LEVEL_ERROR` 只有关键问题，系统可能会失败
- `LV_LOG_LEVEL_USER` 仅用户消息
- `LV_LOG_LEVEL_NONE` 不记录任何内容

级别高于设置的日志级别的事件也将被记录。例如。如果你`LV_LOG_LEVEL_WARN`，错误也会被记录。

## Printing logs（打印日志）

### Logging with printf（使用 printf 记录）

<details>
<summary>查看原文</summary>
<p>

If your system supports `printf`, you just need to enable `LV_LOG_PRINTF` in `lv_conf.h` to send the logs with `printf`.

</p>
</details>

如果你的系统支持 `printf`，你只需要在 `lv_conf.h` 中启用 `LV_LOG_PRINTF` 就可以发送带有 `printf` 的日志。

### Custom log function（自定义日志功能）

<details>
<summary>查看原文</summary>
<p>

If you can't use `printf` or want to use a custom function to log, you can register a "logger" callback with `lv_log_register_print_cb()`. 

For example:

</p>
</details>

如果你不能使用 `printf` 或者想使用自定义函数来记录日志，你可以使用 `lv_log_register_print_cb()` 注册一个“记录器”回调。

例如：

```c
void my_log_cb(const char * buf)
{
  serial_send(buf, strlen(buf));
}

...


lv_log_register_print_cb(my_log_cb);

```

## Add logs（添加日志）

<details>
<summary>查看原文</summary>
<p>

You can also use the log module via the `LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)` functions.

</p>
</details>

您还可以通过 `LV_LOG_TRACE/INFO/WARN/ERROR/USER(text)` 函数使用日志模块。
