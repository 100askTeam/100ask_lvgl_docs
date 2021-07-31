```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/overview/file-system.md
```
# File system（文件系统）

<details>
<summary>查看原文</summary>
<p>

LVGL has a 'File system' abstraction module that enables you to attach any type of file system.
The file system is identified by a drive letter.
For example, if the SD card is associated with the letter `'S'`, a file can be reached like `"S:path/to/file.txt"`.
 
</p>
</details>

LVGL 有一个“文件系统”抽象模块，使您能够附加任何类型的文件系统。
文件系统由驱动器号标识。
例如，如果 SD 卡与字母“S”相关联，则可以访问类似“S:path/to/file.txt”的文件。

## Ready to use drivers（准备使用驱动程序）

<details>
<summary>查看原文</summary>
<p>

The [lv_fs_if](https://github.com/lvgl/lv_fs_if) repository contains ready to use drivers using POSIX, standard C and [FATFS](http://elm-chan.org/fsw/ff/00index_e.html) API.
See it's [README](https://github.com/lvgl/lv_fs_if#readme) for the details.
 
</p>
</details>

[lv_fs_if](https://github.com/lvgl/lv_fs_if) 存储库包含使用 POSIX、标准 C 和 [FATFS](http://elm-chan.org/fsw/ff/00index_e.html) 的即用型驱动程序) API。
有关详细信息，请参阅 [README](https://github.com/lvgl/lv_fs_if#readme)。

## Add a driver（添加驱动程序）

### Registering a driver（注册驱动）

<details>
<summary>查看原文</summary>
<p>

To add a driver, `lv_fs_drv_t` needs to be initialized like below. `lv_fs_drv_t` needs to be static, global or dynamically allocated and not a local varaible.
 
</p>
</details>

要添加驱动程序，`lv_fs_drv_t` 需要像下面这样初始化。 `lv_fs_drv_t` 需要是静态的、全局的或动态分配的，而不是局部变量。

```c
static lv_fs_drv_t drv;                   /*Needs to be static or global*/
lv_fs_drv_init(&drv);                     /*Basic initialization*/

drv.letter = 'S';                         /*An uppercase letter to identify the drive */
drv.ready_cb = my_ready_cb;               /*Callback to tell if the drive is ready to use */
drv.open_cb = my_open_cb;                 /*Callback to open a file */
drv.close_cb = my_close_cb;               /*Callback to close a file */
drv.read_cb = my_read_cb;                 /*Callback to read a file */
drv.write_cb = my_write_cb;               /*Callback to write a file */
drv.seek_cb = my_seek_cb;                 /*Callback to seek in a file (Move cursor) */
drv.tell_cb = my_tell_cb;                 /*Callback to tell the cursor position  */

drv.dir_open_cb = my_dir_open_cb;         /*Callback to open directory to read its content */
drv.dir_read_cb = my_dir_read_cb;         /*Callback to read a directory's content */
drv.dir_close_cb = my_dir_close_cb;       /*Callback to close a directory */

drv.user_data = my_user_data;             /*Any custom data if required*/

lv_fs_drv_register(&drv);                 /*Finally register the drive*/

```

<details>
<summary>查看原文</summary>
<p>

Any of the callbacks can be `NULL` to indicate that operation is not supported.
 
</p>
</details>

任何回调都可以为“NULL”以指示不支持该操作。

### Implementing the callbacks（实现回调）

#### Open callback（打开回调）

<details>
<summary>查看原文</summary>
<p>

The prototype of `open_cb` looks like this:
 
</p>
</details>

`open_cb` 的原型如下所示：

```c
void * (*open_cb)(lv_fs_drv_t * drv, const char * path, lv_fs_mode_t mode);
```

<details>
<summary>查看原文</summary>
<p>

`path` is path after the driver letter (e.g. "S:path/to/file.txt" -> "path/to/file.txt"). `mode` can be `LV_FS_MODE_WR` or `LV_FS_MODE_RD` to open for write or read.

The return value is a pointer the *file object* the describes the opened file or `NULL` if there were any issues (e.g. the file wasn't found). 
The returned file object will be passed to to other file system related callbacks. (see below)
 
</p>
</details>

`path` 是驱动程序字母后的路径（例如“S:path/to/file.txt”->“path/to/file.txt”）。 `mode` 可以是 `LV_FS_MODE_WR` 或 `LV_FS_MODE_RD` 来打开写入或读取。

返回值是 *file object* 的指针，它描述了打开的文件，如果有任何问题（例如找不到文件），则返回“NULL”。
返回的文件对象将传递给其他与文件系统相关的回调。 （见下文）

### Other callbacks（其他回调）

<details>
<summary>查看原文</summary>
<p>

The other callbacks are quite similar. For example `write_cb` looks like this:
 
</p>
</details>

其他回调非常相似。例如`write_cb`看起来像这样：

```c
lv_fs_res_t (*write_cb)(lv_fs_drv_t * drv, void * file_p, const void * buf, uint32_t btw, uint32_t * bw);
```


<details>
<summary>查看原文</summary>
<p>

As `file_p` LVGL passes the return value of `open_cb`, `buf` is the data to write, `btw` is the Bytes To Write, `bw` is the actually written bytes. 

For a template to the callbacks see [lv_fs_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_fs_template.c).
 
</p>
</details>

由于`file_p` LVGL 传递`open_cb` 的返回值，`buf` 是要写入的数据，`btw` 是要写入的字节数，`bw` 是实际写入的字节数。

有关回调的模板，请参阅 [lv_fs_template.c](https://github.com/lvgl/lvgl/blob/master/examples/porting/lv_port_fs_template.c)。

## Usage example（使用示例）

<details>
<summary>查看原文</summary>
<p>

The example below shows how to read from a file:
 
</p>
</details>

下面的示例演示如何从文件中读取：

```c
lv_fs_file_t f;
lv_fs_res_t res;
res = lv_fs_open(&f, "S:folder/file.txt", LV_FS_MODE_RD);
if(res != LV_FS_RES_OK) my_error_handling();

uint32_t read_num;
uint8_t buf[8];
res = lv_fs_read(&f, buf, 8, &read_num);
if(res != LV_FS_RES_OK || read_num != 8) my_error_handling();

lv_fs_close(&f);
```

<details>
<summary>查看原文</summary>
<p>

*The mode in `lv_fs_open` can be `LV_FS_MODE_WR` to open for write or `LV_FS_MODE_RD | LV_FS_MODE_WR` for both*

This example shows how to read a directory's content. It's up to the driver how to mark the directories, but it can be a good practice to insert a `'/'` in front of the directory name.
 
</p>
</details>

*`lv_fs_open`中的模式可以是`LV_FS_MODE_WR` to open for write 或`LV_FS_MODE_RD | LV_FS_MODE_WR` 为两者*

此示例演示如何读取目录的内容。如何标记目录取决于驱动程序，但在目录名称前插入“/”是一个好习惯。

```c
lv_fs_dir_t dir;
lv_fs_res_t res;
res = lv_fs_dir_open(&dir, "S:/folder");
if(res != LV_FS_RES_OK) my_error_handling();

char fn[256];
while(1) {
    res = lv_fs_dir_read(&dir, fn);
    if(res != LV_FS_RES_OK) {
        my_error_handling();
        break;
    }

    /*fn is empty, if not more files to read*/
    if(strlen(fn) == 0) {
        break;
    }

    printf("%s\n", fn);
}

lv_fs_dir_close(&dir);
```

## Use drivers for images（使用图像驱动程序）


<details>
<summary>查看原文</summary>
<p>

[Image](/widgets/core/img) objects can be opened from files too (besides variables stored in the flash).

To use files in image widgets the following callbacks are required:
- open
- close
- read
- seek
- tell
 
</p>
</details>

[Image](/widgets/core/img) 对象也可以从文件中打开（除了存储在闪存中的变量）。

要在图像小部件中使用文件，需要以下回调：
- 打开
- 关
- 读
- 寻找
- 告诉

## API

```eval_rst

.. doxygenfile:: lv_fs.h
  :project: lvgl

```
