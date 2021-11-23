```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/libs/fsdrv.md
```

# File System Interfaces(文件系统接口)

<details>
<summary>查看原文</summary>
<p>

LVGL has a [File system](https://docs.lvgl.io/master/overview/file-system.html) module to provides an abstraction layer for various file system drivers.

LVG has build in support for
- [FATFS](http://elm-chan.org/fsw/ff/00index_e.html)
- STDIO (Linux and Windows using C standard function .e.g fopen, fread)
- POSIX (Linux and Windows using POSIX function .e.g open, read)
- WIN32 (Windows using Win32 API function .e.g CreateFileA, ReadFile)

You still need to provide the drivers and libraries, this extensions provide only the bridge between FATFS, STDIO, POSIX, WIN32 and LVGL.

</p>
</details>


LVGL 有一个 [文件系统](https://docs.lvgl.io/master/overview/file-system.html) 模块，为各种文件系统驱动程序提供一个抽象层。LVG 已经内置了对 [FATFS] 的支持(http://elm-chan.org/fsw/ff/00index_e.html)- STDIO (Linux 和 Windows 使用 C 标准函数 .eg fopen, fread)- POSIX (Linux 和 Windows 使用 POSIX 函数 .eg open, read) - WIN32（Windows 使用 Win32 API 函数。例如 CreateFileA、ReadFile）您仍然需要提供驱动程序和库，此扩展仅提供 FATFS、STDIO、POSIX、WIN32 和 LVGL 之间的桥梁。

## Usage(用法)

<details>
<summary>查看原文</summary>
<p>

In `lv_conf.h` set a driver letter for one or more `LV_FS_USE_...` define(s). After that you can access files using that driver letter. Setting `'\0'` will disable use of that interface.  

</p>
</details>

在`lv_conf.h` 中为一个或多个`LV_FS_USE_...` 定义设置一个驱动程序字母。之后，您可以使用该驱动程序号访问文件。设置`'\0'` 将禁止使用该接口。
