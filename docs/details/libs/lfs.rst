.. _lfs:

==============
littlefs
==============

.. raw:: html

   <details>
     <summary>显示原文</summary>

littlefs is a little fail-safe filesystem designed for microcontrollers.

Detailed introduction: https://github.com/littlefs-project/littlefs

.. raw:: html

   </details>
   <br>


Littlefs 是一个专为微控制器设计的小型故障安全文件系统。

详细介绍： https: //github.com/littlefs-project/littlefs


Usage（用法）
-------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

Enable :c:macro:`LV_USE_FS_LITTLEFS` and define a :c:macro:`LV_FS_LITTLEFS_LETTER` in ``lv_conf.h``.

When enabled :c:macro:`lv_littlefs_set_handler` can be used to set up a mount point.

.. raw:: html

   </details>
   <br>


启用 :c:macro:`LV_USE_FS_LITTLEFS` 并定义 :c:macro:`LV_FS_LITTLEFS_LETTER` 在 ``lv_conf.h``.

启用后 :c:macro:`lv_littlefs_set_handler` 可用于设置挂载点。


Example（示例）
---------------

.. code:: c
    #include "lfs.h"

    // configuration of the filesystem is provided by this struct
    const struct lfs_config cfg = {
        // block device operations
        .read  = user_provided_block_device_read,
        .prog  = user_provided_block_device_prog,
        .erase = user_provided_block_device_erase,
        .sync  = user_provided_block_device_sync,

        // block device configuration
        .read_size = 16,
        .prog_size = 16,
        .block_size = 4096,
        .block_count = 128,
        .cache_size = 16,
        .lookahead_size = 16,
        .block_cycles = 500,
    };

    // mount the filesystem
    int err = lfs_mount(&lfs, &cfg);

    // reformat if we can't mount the filesystem
    // this should only happen on the first boot
    if (err) {
        lfs_format(&lfs, &cfg);
        lfs_mount(&lfs, &cfg);
    }

    lv_littlefs_set_handler(&lfs);


API
---


