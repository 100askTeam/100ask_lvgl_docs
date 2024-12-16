=====
STM32
=====

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL Can be added to `STM32CubeIDE <https://www.st.com/en/development-tools/stm32cubeide.html>`__
in a similar fashion to any other Eclipse-based IDE.

.. raw:: html

   </details>
   <br>


LVGL可以以与其他基于Eclipse的集成开发环境相似的方式添加到 `STM32CubeIDE <https://www.st.com/en/development-tools/stm32cubeide.html>`__ 中。


Including LVGL in a Project（在项目中包含LVGL）
-----------------------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

- Create or open a project in STM32CubeIDE.
- Copy the entire LVGL folder to *[project_folder]/Drivers/lvgl*.
- In the STM32CubeIDE **Project Explorer** pane: right click on the
  LVGL folder that you copied (you may need to refresh the view first
  before it will appear), and select **Add/remove include path…**. If
  this doesn't appear, or doesn't work, you can review your project
  include paths under the **Project** -> **Properties** menu, and then
  navigating to **C/C++ Build** -> **Settings** -> **Include paths**, and
  ensuring that the LVGL directory is listed.

Now that the source files are included in your project, follow the instructions to
:ref:`add_lvgl_to_your_project` and to create the ``lv_conf.h`` file, and
initialise the display.

.. raw:: html

   </details>
   <br>


- 在STM32CubeIDE中创建或打开一个项目。
- 将整个LVGL文件夹复制到 *[project_folder]/Drivers/lvgl* 目录下。
- 在STM32CubeIDE的 **项目资源管理器** 窗格中，右键单击您复制的LVGL文件夹（可能需要先刷新视图才能看到），然后选择 **添加/移除包含路径...**。如果这个选项没有出现或无法使用，您可以在 **项目** -> **属性** 菜单中查看项目的包含路径，然后导航到 **C/C++ 构建** -> **设置** -> **包含路径**，确保LVGL目录已列出。

现在源文件已经包含在您的项目中，请按照以下说明操作：  
:ref:`add_lvgl_to_your_project` 并创建 ``lv_conf.h`` 文件，然后初始化显示屏。

Bare Metal Example（裸机示例）
-----------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A minimal example using STM32CubeIDE, and HAL. \* When setting up
**Pinout and Configuration** using the **Device Configuration Tool**,
select **System Core** -> **SYS** and ensure that **Timebase Source** is
set to **SysTick**. \* Configure any other peripherals (including the
LCD panel), and initialise them in *main.c*. \* ``#include "lvgl.h"`` in
the *main.c* file. \* Create some frame buffer(s) as global variables:

.. code-block:: c

   /* Frame buffers
    * Static or global buffer(s). The second buffer is optional
    * TODO: Adjust color format and choose buffer size. DISPLAY_WIDTH * 10 is one suggestion. */
   #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565)) /* will be 2 for RGB565 */
   #define BUFF_SIZE (DISPLAY_WIDTH * 10 * BYTES_PER_PIXEL)
   static uint8_t buf_1[BUFF_SIZE];
   static uint8_t buf_2[BUFF_SIZE];

- In your ``main()`` function, after initialising your CPU,
    peripherals, and LCD panel, call :cpp:func:`lv_init` to initialise LVGL.
    You can then create the display driver using
    :cpp:func:`lv_display_create`, and register the frame buffers using
    :cpp:func:`lv_display_set_buffers`.

    .. code-block:: c

        //Initialise LVGL UI library
        lv_init();

        lv_display_t * disp = lv_display_create(WIDTH, HEIGHT); /* Basic initialization with horizontal and vertical resolution in pixels */
        lv_display_set_flush_cb(disp, my_flush_cb); /* Set a flush callback to draw to the display */
        lv_display_set_buffers(disp, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /* Set an initialized buffer */

- Create some dummy Widgets to test the output:

    .. code-block:: c

        /* Change Active Screen's background color */
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
        lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

        /* Create a spinner */
        lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
        lv_obj_set_size(spinner, 64, 64);
        lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);


- Add a call to :cpp:func:`lv_timer_handler` inside your ``while(1)`` loop:

  .. code-block:: c

      /* Infinite loop */
      while (1)
      {
          lv_timer_handler();
          HAL_Delay(5);
      }


- Add a call to :cpp:func:`lv_tick_inc` inside the :cpp:func:`SysTick_Handler` function. Open the *stm32xxxx_it.c*
  file (the name will depend on your specific MCU), and update the :cpp:func:`SysTick_Handler` function:

  .. code-block:: c

      void SysTick_Handler(void)
      {
          /* USER CODE BEGIN SysTick_IRQn 0 */

          HAL_SYSTICK_IRQHandler();
          lv_tick_inc(1);
          #ifdef USE_RTOS_SYSTICK
              osSystickHandler();
          #endif

          /* USER CODE END SysTick_IRQn 0 */
          HAL_IncTick();
          /* USER CODE BEGIN SysTick_IRQn 1 */

          /* USER CODE END SysTick_IRQn 1 */
      }


- Finally, write the callback function, ``my_flush_cb``, which will send the display buffer to your LCD panel. Below is
  one example, but it will vary depending on your setup.

  .. code-block:: c

      void my_flush_cb(lv_display_t * disp, const lv_area_t * area, lv_color_t * color_p)
      {
          //Set the drawing region
          set_draw_window(area->x1, area->y1, area->x2, area->y2);

          int height = area->y2 - area->y1 + 1;
          int width = area->x2 - area->x1 + 1;

          //We will do the SPI write manually here for speed
          HAL_GPIO_WritePin(DC_PORT, DC_PIN, GPIO_PIN_SET);
          //CS low to begin data
          HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_RESET);

          //Write colour to each pixel
          for (int i = 0; i < width * height; i++) {
              uint16_t color_full = (color_p->red << 11) | (color_p->green << 5) | (color_p->blue);
              parallel_write(color_full);

              color_p++;
          }

          //Return CS to high
          HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_SET);

          /* IMPORTANT!!!
           * Inform the graphics library that you are ready with the flushing */
          lv_display_flush_ready(disp);
      }

.. raw:: html

   </details>
   <br>


使用 STM32CubeIDE 和 HAL 的一个最简示例：  

\* 在使用 **Device Configuration Tool** 进行 **Pinout and Configuration** 设置时，选择 **System Core** -> **SYS**，确保 **Timebase Source** 设置为 **SysTick**。  
\* 配置其他外设（包括 LCD 面板），并在 *main.c* 中初始化它们。  
\* 在 *main.c* 文件中添加 ``#include "lvgl.h"``。  
\* 创建一些帧缓冲区作为全局变量：  

.. code-block:: c  

   /* 帧缓冲区  
    * 静态或全局缓冲区。第二个缓冲区是可选的  
    * TODO: 调整颜色格式并选择缓冲区大小。DISPLAY_WIDTH * 10 是一种建议 */  
   #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565)) /* RGB565 的值为 2 */  
   #define BUFF_SIZE (DISPLAY_WIDTH * 10 * BYTES_PER_PIXEL)  
   static uint8_t buf_1[BUFF_SIZE];  
   static uint8_t buf_2[BUFF_SIZE];  

- 在您的 ``main()`` 函数中，初始化 CPU、外设和 LCD 面板后，调用 :cpp:func:`lv_init` 初始化 LVGL。  
  然后使用 :cpp:func:`lv_display_create` 创建显示驱动，并通过 :cpp:func:`lv_display_set_buffers` 注册帧缓冲区：  

    .. code-block:: c  

        // 初始化 LVGL UI 库  
        lv_init();  

        lv_display_t * disp = lv_display_create(WIDTH, HEIGHT); /* 以水平和垂直分辨率（像素）进行基本初始化 */  
        lv_display_set_flush_cb(disp, my_flush_cb); /* 设置刷新回调函数以绘制到显示屏 */  
        lv_display_set_buffers(disp, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /* 设置已初始化的缓冲区 */  

- 创建一些简单的控件以测试输出：  

    .. code-block:: c  

        /* 更改当前屏幕的背景颜色 */  
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);  
        lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);  

        /* 创建一个 Spinner */  
        lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);  
        lv_obj_set_size(spinner, 64, 64);  
        lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);  

- 在 ``while(1)`` 循环中添加 :cpp:func:`lv_timer_handler` 调用：  

    .. code-block:: c  

        /* 无限循环 */  
        while (1)  
        {  
            lv_timer_handler();  
            HAL_Delay(5);  
        }  

- 在 :cpp:func:`SysTick_Handler` 函数中添加 :cpp:func:`lv_tick_inc` 调用。在 *stm32xxxx_it.c* 文件中（文件名取决于您的 MCU），更新 :cpp:func:`SysTick_Handler` 函数：  

    .. code-block:: c  

        void SysTick_Handler(void)  
        {  
            /* USER CODE BEGIN SysTick_IRQn 0 */  

            HAL_SYSTICK_IRQHandler();  
            lv_tick_inc(1);  
            #ifdef USE_RTOS_SYSTICK  
                osSystickHandler();  
            #endif  

            /* USER CODE END SysTick_IRQn 0 */  
            HAL_IncTick();  
            /* USER CODE BEGIN SysTick_IRQn 1 */  

            /* USER CODE END SysTick_IRQn 1 */  
        }  

- 最后，编写回调函数 ``my_flush_cb``，将显示缓冲区发送到 LCD 面板。以下是一个示例，根据您的设置可能有所不同：  

    .. code-block:: c  

        void my_flush_cb(lv_display_t * disp, const lv_area_t * area, lv_color_t * color_p)  
        {  
            // 设置绘制区域  
            set_draw_window(area->x1, area->y1, area->x2, area->y2);  

            int height = area->y2 - area->y1 + 1;  
            int width = area->x2 - area->x1 + 1;  

            // 手动执行 SPI 写入以提高速度  
            HAL_GPIO_WritePin(DC_PORT, DC_PIN, GPIO_PIN_SET);  
            // CS 置低开始传输数据  
            HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_RESET);  

            // 为每个像素写入颜色  
            for (int i = 0; i < width * height; i++) {  
                uint16_t color_full = (color_p->red << 11) | (color_p->green << 5) | (color_p->blue);  
                parallel_write(color_full);  

                color_p++;  
            }  

            // 将 CS 置高  
            HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_SET);  

            /* 重要！！！  
             * 通知图形库刷新已完成 */  
            lv_display_flush_ready(disp);  
        }  


FreeRTOS Example（FreeRTOS示例）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A minimal example using STM32CubeIDE, HAL, and CMSISv1 (FreeRTOS).
*Note that we have not used Mutexes in this example, however LVGL is* **NOT**
*thread safe and so Mutexes should be used*. See: :ref:`threading`
\* ``#include "lvgl.h"`` \* Create your frame buffer(s) as global variables:

.. code-block:: c

    /* Frame buffers
     * Static or global buffer(s). The second buffer is optional */
    #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565)) /* will be 2 for RGB565 */
    /* TODO: Declare your own BUFF_SIZE appropriate to your system. */
    static lv_color_t buf_1[BUFF_SIZE];
    #define BUFF_SIZE (DISPLAY_WIDTH * 10 * BYTES_PER_PIXEL)
    static uint8_t buf_1[BUFF_SIZE];
    static lv_color_t buf_2[BUFF_SIZE];

- In your ``main`` function, after your peripherals (SPI, GPIOs, LCD
  etc) have been initialised, initialise LVGL using :cpp:func:`lv_init`,
  create a new display driver using :cpp:func:`lv_display_create`, and
  register the frame buffers using :cpp:func:`lv_display_set_buffers`.

  .. code-block:: c

   /* Initialise LVGL UI library */
   lv_init();
   lv_display_t *display = lv_display_create(WIDTH, HEIGHT); /* Create the display */
   lv_display_set_flush_cb(display, my_flush_cb);            /* Set a flush callback to draw to the display */
   lv_display_set_buffers(disp, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /* Set an initialized buffer */

   /* Register the touch controller with LVGL - Not included here for brevity. */


- Create some dummy Widgets to test the output:

  .. code-block:: c

    /* Change Active Screen's background color */
    lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
    lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

    /* Create a spinner */
    lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
    lv_obj_set_size(spinner, 64, 64);
    lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);

- Create two threads to call :cpp:func:`lv_timer_handler`, and
  :cpp:func:`lv_tick_inc`.You will need two ``osThreadId`` handles for
  CMSISv1. These don't strictly have to be globally accessible in this
  case, however STM32Cube code generation does by default. If you are
  using CMSIS and STM32Cube code generation it should look something
  like this:

  .. code-block:: c

   //Thread Handles
   osThreadId lvgl_tickHandle;
   osThreadId lvgl_timerHandle;

   /* definition and creation of lvgl_tick */
   osThreadDef(lvgl_tick, LVGLTick, osPriorityNormal, 0, 1024);
   lvgl_tickHandle = osThreadCreate(osThread(lvgl_tick), NULL);

   //LVGL update timer
   osThreadDef(lvgl_timer, LVGLTimer, osPriorityNormal, 0, 1024);
   lvgl_timerHandle = osThreadCreate(osThread(lvgl_timer), NULL);

- And create the thread functions:

  .. code-block:: c

   /* LVGL timer for tasks. */
   void LVGLTimer(void const * argument)
   {
     for(;;)
     {
       lv_timer_handler();
       osDelay(20);
     }
   }
   /* LVGL tick source */
   void LVGLTick(void const * argument)
   {
     for(;;)
     {
       lv_tick_inc(10);
       osDelay(10);
     }
   }

- Finally, create the ``my_flush_cb`` function to output the frame
  buffer to your LCD. The specifics of this function will vary
  depending on which MCU features you are using. Below is an example
  for a typical MCU interface.

  .. code-block:: c

   void my_flush_cb(lv_display_t * display, const lv_area_t * area, uint8_t * px_map);
   {
     uint16_t * color_p = (uint16_t *)px_map;

     //Set the drawing region
     set_draw_window(area->x1, area->y1, area->x2, area->y2);

     int height = area->y2 - area->y1 + 1;
     int width = area->x2 - area->x1 + 1;

     //Begin SPI Write for DATA
     HAL_GPIO_WritePin(DC_PORT, DC_PIN, GPIO_PIN_SET);
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_RESET);

     //Write colour to each pixel
     for (int i = 0; i < width * height; i++) {
         parallel_write(color_p);
         color_p++;
     }

     //Return CS to high
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_SET);

     /* IMPORTANT!!!
      * Inform the graphics library that you are ready with the flushing */
     lv_display_flush_ready(display);
   }

.. raw:: html

   </details>
   <br>


使用 STM32CubeIDE、HAL 和 CMSISv1 (FreeRTOS) 的一个最小示例。  
*注意：此示例中没有使用 Mutex，但 LVGL **不是** 线程安全的，因此应使用 Mutex。详见：:ref:`threading`*  
\* ``#include "lvgl.h"``  
\* 创建您的帧缓冲区作为全局变量：  

.. code-block:: c  

    /* 帧缓冲区  
     * 静态或全局缓冲区。第二个缓冲区是可选的 */  
    #define BYTES_PER_PIXEL (LV_COLOR_FORMAT_GET_SIZE(LV_COLOR_FORMAT_RGB565)) /* RGB565 为 2 */  
    /* TODO: 根据您的系统声明适当的 BUFF_SIZE。 */  
    #define BUFF_SIZE (DISPLAY_WIDTH * 10 * BYTES_PER_PIXEL)  
    static lv_color_t buf_1[BUFF_SIZE];  
    static lv_color_t buf_2[BUFF_SIZE];  

- 在您的 ``main`` 函数中，初始化外设（SPI、GPIO、LCD 等）后，使用 :cpp:func:`lv_init` 初始化 LVGL，  
  使用 :cpp:func:`lv_display_create` 创建显示驱动，并通过 :cpp:func:`lv_display_set_buffers` 注册帧缓冲区：  

  .. code-block:: c  

   /* 初始化 LVGL UI 库 */  
   lv_init();  
   lv_display_t *display = lv_display_create(WIDTH, HEIGHT); /* 创建显示驱动 */  
   lv_display_set_flush_cb(display, my_flush_cb);            /* 设置刷新回调函数以绘制到显示屏 */  
   lv_display_set_buffers(display, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /* 设置缓冲区 */  

   /* 注册触摸控制器到 LVGL - 此处未包含以保持简洁。 */  

- 创建一些简单的控件以测试输出：  

  .. code-block:: c  

    /* 更改当前屏幕的背景颜色 */  
    lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);  
    lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);  

    /* 创建一个 Spinner */  
    lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);  
    lv_obj_set_size(spinner, 64, 64);  
    lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);  

- 创建两个线程，分别调用 :cpp:func:`lv_timer_handler` 和 :cpp:func:`lv_tick_inc`。对于 CMSISv1，您需要两个 ``osThreadId`` 句柄。  
  如果您使用 CMSIS 和 STM32Cube 代码生成，代码类似以下示例：  

  .. code-block:: c  

   // 线程句柄  
   osThreadId lvgl_tickHandle;  
   osThreadId lvgl_timerHandle;  

   /* 定义并创建 lvgl_tick 线程 */  
   osThreadDef(lvgl_tick, LVGLTick, osPriorityNormal, 0, 1024);  
   lvgl_tickHandle = osThreadCreate(osThread(lvgl_tick), NULL);  

   // LVGL 更新定时器  
   osThreadDef(lvgl_timer, LVGLTimer, osPriorityNormal, 0, 1024);  
   lvgl_timerHandle = osThreadCreate(osThread(lvgl_timer), NULL);  

- 编写线程函数：  

  .. code-block:: c  

   /* LVGL 任务定时器 */  
   void LVGLTimer(void const * argument)  
   {  
     for(;;)  
     {  
       lv_timer_handler();  
       osDelay(20);  
     }  
   }  
   /* LVGL 时间源 */  
   void LVGLTick(void const * argument)  
   {  
     for(;;)  
     {  
       lv_tick_inc(10);  
       osDelay(10);  
     }  
   }  

- 最后，编写 ``my_flush_cb`` 回调函数，将帧缓冲区输出到 LCD。此函数的具体实现取决于您的 MCU 接口。下面是一个典型的示例：  

  .. code-block:: c  

   void my_flush_cb(lv_display_t * display, const lv_area_t * area, uint8_t * px_map);  
   {  
     uint16_t * color_p = (uint16_t *)px_map;  

     // 设置绘制区域  
     set_draw_window(area->x1, area->y1, area->x2, area->y2);  

     int height = area->y2 - area->y1 + 1;  
     int width = area->x2 - area->x1 + 1;  

     // 开始 SPI 数据传输  
     HAL_GPIO_WritePin(DC_PORT, DC_PIN, GPIO_PIN_SET);  
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_RESET);  

     // 写入每个像素的颜色  
     for (int i = 0; i < width * height; i++) {  
         parallel_write(color_p);  
         color_p++;  
     }  

     // CS 置为高电平  
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_SET);  

     /* 重要！！！  
      * 通知图形库刷新已完成 */  
     lv_display_flush_ready(display);  
   }  


DMA2D Support（DMA2D 支持）
---------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

LVGL supports DMA2D - a feature of some STM32 MCUs which can improve performance
when blending fills and images. Some STM32 product lines such as STM32F4 STM32F7, STM32L4,
STM32U5, and STM32H7 include models with DMA2D support.

LVGL's integration with DMA2D can be enabled by setting ``LV_USE_DRAW_DMA2D``
to ``1`` in ``lv_conf.h``

With ``LV_USE_DRAW_DMA2D_INTERRUPT`` set to ``0`` and ``LV_USE_OS`` set to ``LV_OS_NONE``,
DMA2D will draw some fills and images concurrently with the software render where
possible. If ``LV_USE_DRAW_DMA2D_INTERRUPT`` is set to ``1`` and ``LV_USE_OS`` set to
``LV_OS_FREERTOS`` (or another OS) the main difference will be that the core will idle
instead of "busywait" while waiting for a DMA2D transfer to complete.

If ``LV_USE_DRAW_DMA2D_INTERRUPT`` is enabled then you are required to call
:cpp:expr:`lv_draw_dma2d_transfer_complete_interrupt_handler` whenever the DMA2D
"transfer complete" global interrupt is received.

If your STM device has a NeoChrom GPU, you can use the :ref:`Nema GFX renderer <nema_gfx>` instead.

.. raw:: html

   </details>
   <br>


LVGL 支持 DMA2D，这是一些 STM32 微控制器的特性，可以在混合填充和图像时提高性能。一些 STM32 产品线，如 STM32F4、STM32F7、STM32L4、STM32U5 和 STM32H7，包括支持 DMA2D 的型号。

通过在 ``lv_conf.h``中将 ``LV_USE_DRAW_DMA2D`` 设置为 ``1`` ，可以启用 LVGL 与 DMA2D 的集成。

将 ``LV_USE_DRAW_DMA2D_INTERRUPT`` 设置为 ``0`` 并将 ``LV_USE_OS`` 设置为 ``LV_OS_NONE``时，DMA2D 将在可能的情况下与软件渲染并行绘制一些填充和图像。如果将 ``LV_USE_DRAW_DMA2D_INTERRUPT`` 设置为 ``1`` 并将 ``LV_USE_OS`` 设置为 ``LV_OS_FREERTOS`` （或其他操作系统），主要区别在于，在等待 DMA2D 传输完成时，核心将处于空闲状态而不是“忙等”。

如果启用了 ``LV_USE_DRAW_DMA2D_INTERRUPT`` ，则需要在收到 DMA2D “传输完成”全局中断时调用 :cpp:expr:`lv_draw_dma2d_transfer_complete_interrupt_handler` 。

如果您的 STM 设备具有 NeoChrom GPU，您可以使用 :ref:`Nema GFX 渲染器 <nema_gfx>` 代替。
