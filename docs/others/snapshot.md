```eval_rst
.. include:: /header.rst 
:github_url: |github_link_base|/others/snapshot.md
```
# Snapshot（快照）

<details>
<summary>查看原文</summary>
<p>

Snapshot provides APIs to take snapshot image for LVGL object together with its children. The image will look exactly like the object.

</p>
</details>

快照为LVGL对象及其子实体提供了获取快照图像的API。  该图像将看起来与该对象完全一样。

## Usage（用法）

<details>
<summary>查看原文</summary>
<p>

Simply call API `lv_snapshot_take` to generate the image descriptor which can be set as image object src using `lv_img_set_src`.


Note, only below color formats are supported for now:
 - LV_IMG_CF_TRUE_COLOR_ALPHA
 - LV_IMG_CF_ALPHA_1BIT
 - LV_IMG_CF_ALPHA_2BIT
 - LV_IMG_CF_ALPHA_4BIT
 - LV_IMG_CF_ALPHA_8BIT

</p>
</details>

只需调用API `lv_snapshot_take`即可生成图像描述符，使用`lv_img_set_src`可将其设置为图像对象src。

注意，目前只支持以下颜色格式。

 - LV_IMG_CF_TRUE_COLOR_ALPHA
 - LV_IMG_CF_ALPHA_1BIT
 - LV_IMG_CF_ALPHA_2BIT
 - LV_IMG_CF_ALPHA_4BIT
 - LV_IMG_CF_ALPHA_8BIT


### Free the Image（释放图像）

<details>
<summary>查看原文</summary>
<p>

The memory `lv_snapshot_take` uses are dynamically allocated using `lv_mem_alloc`. Use API `lv_snapshot_free` to free the memory it takes. This will firstly free memory the image data takes, then the image descriptor.


Take caution to free the snapshot but not delete the image object. Before free the memory, be sure to firstly unlink it from image object, using `lv_img_set_src(NULL)` and `lv_img_cache_invalidate_src(src)`.


Below code snippet explains usage of this API.

</p>
</details>

`lv_snapshot_take` 使用的内存是用 `lv_mem_alloc` 动态分配的。  使用API `lv_snapshot_free` 来释放它所占用的内存。  这将首先释放图像数据占用的内存，然后是图像描述符。

请注意释放快照，但不要删除图像对象。  在释放内存之前，一定要先解除它与图像对象的链接，使用 `lv_img_set_src(NULL)` 和 `lv_img_cache_invalidate_src(src)` 。

下面的代码片段解释了这个 API 的用法。

```c
void update_snapshot(lv_obj_t * obj, lv_obj_t * img_snapshot)
{
    lv_img_dsc_t* snapshot = (void*)lv_img_get_src(img_snapshot);
    if(snapshot) {
        lv_snapshot_free(snapshot);
    }
    snapshot = lv_snapshot_take(obj, LV_IMG_CF_TRUE_COLOR_ALPHA);
    lv_img_set_src(img_snapshot, snapshot);
}
```

### Use Existing Buffer（使用现有缓冲区）

<details>
<summary>查看原文</summary>
<p>

If the snapshot needs update now and then, or simply caller provides memory, use API `lv_res_t lv_snapshot_take_to_buf(lv_obj_t * obj, lv_img_cf_t cf, lv_img_dsc_t * dsc, void * buf, uint32_t buff_size);` for this case. It's caller's responsibility to alloc/free the memory.


If snapshot is generated successfully, the image descriptor is updated and image data will be stored to provided `buf`.


Note that snapshot may fail if provided buffer is not enough, which may happen when object size changes. It's recommended to use API `lv_snapshot_buf_size_needed` to check the needed buffer size in byte firstly and resize the buffer accordingly.

</p>
</details>

如果快照偶尔需要更新，或者仅仅是调用者提供内存，在这种情况下可以使用API `lv_res_t lv_snapshot_take_to_buf(lv_obj_t * obj, lv_img_cf_t cf, lv_img_dsc_t * dsc, void * buf, uint32_t buff_size);` 。  分配/释放内存是调用者的责任。

如果快照成功生成，图像描述符将被更新，图像数据将被存储到提供的 `buf`。

注意，如果提供的缓冲区不够，快照可能会失败，这可能发生在对象大小改变时。  建议使用API `lv_snapshot_buf_size_needed`首先检查所需的缓冲区的字节数，并相应地调整缓冲区的大小。

## Example

```eval_rst

.. include:: ../../examples/others/snapshot/index.rst

```
## API


```eval_rst

.. doxygenfile:: lv_snapshot.h
  :project: lvgl

```
