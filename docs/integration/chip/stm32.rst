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

Now that the source files are included in your project, follow the
instructions for `Porting <https://docs.lvgl.io/master/porting/project.html>`__ your
project to create the ``lv_conf.h`` file, and initialise the display.

.. raw:: html

   </details>
   <br>


- 在STM32CubeIDE中创建或打开一个项目。
- 将整个LVGL文件夹复制到 *[project_folder]/Drivers/lvgl* 目录下。
- 在STM32CubeIDE的 **项目资源管理器** 窗格中，右键单击您复制的LVGL文件夹（可能需要先刷新视图才能看到），然后选择 **添加/移除包含路径...**。如果这个选项没有出现或无法使用，您可以在 **项目** -> **属性** 菜单中查看项目的包含路径，然后导航到 **C/C++ 构建** -> **设置** -> **包含路径**，确保LVGL目录已列出。

现在源文件已包含在您的项目中，请按照 `移植 <https://docs.lvgl.io/master/porting/project.html>`__ 您的项目的说明，创建 ``lv_conf.h`` 文件并初始化显示。


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

.. code:: c

   //Frame buffers
   /*Static or global buffer(s). The second buffer is optional*/
   static lv_color_t buf_1[BUFF_SIZE]; //TODO: Chose a buffer size. DISPLAY_WIDTH * 10 is one suggestion.
   static lv_color_t buf_2[BUFF_SIZE];

- In your ``main()`` function, after initialising your CPU,
  peripherals, and LCD panel, call :cpp:func:`lv_init` to initialise LVGL.
  You can then create the display driver using
  :cpp:func:`lv_display_create`, and register the frame buffers using
  :cpp:func:`lv_display_set_buffers`.

.. code:: c

   //Initialise LVGL UI library
   lv_init();

   lv_display_t * disp = lv_display_create(WIDTH, HEIGHT); /*Basic initialization with horizontal and vertical resolution in pixels*/
   lv_display_set_flush_cb(disp, my_flush_cb); /*Set a flush callback to draw to the display*/
   lv_display_set_buffers(disp, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /*Set an initialized buffer*/

- Create some dummy objects to test the output:

.. code:: c

   // Change the active screen's background color
   lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
   lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

   /*Create a spinner*/
   lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
   lv_obj_set_size(spinner, 64, 64);
   lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);

- Add a call to :cpp:func:`lv_timer_handler` inside your ``while(1)`` loop:

.. code:: c

   /* Infinite loop */
   while (1)
   {
     lv_timer_handler();
     HAL_Delay(5);
   }

- Add a call to :cpp:func:`lv_tick_inc` inside the :cpp:func:`SysTick_Handler`
  function. Open the *stm32xxxx_it.c* file (the name will depend on
  your specific MCU), and update the :cpp:func:`SysTick_Handler` function:

.. code:: c

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

- Finally, write the callback function, ``my_flush_cb``, which will
  send the display buffer to your LCD panel. Below is one example, but
  it will vary depending on your setup.

.. code:: c

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
     * Inform the graphics library that you are ready with the flushing*/
     lv_display_flush_ready(disp);
   }

.. raw:: html

   </details>
   <br>


使用STM32CubeIDE和HAL的最简示例。 \* 在使用设备配置工具的 **引脚配置和设置** 中，选择 **系统核心** -> **SYS** 并确保 **时间基准源** 设置为 **SysTick** 。 \* 配置任何其他外设（包括LCD面板），并在 *main.c* 中对它们进行初始化。 \* 在 *main.c* 文件中 ``#include "lvgl.h"``。 \* 创建一些帧缓冲区作为全局变量：

.. code:: c

   //Frame buffers
   /*静态或全局缓冲区。第二个缓冲区是可选的*/
   static lv_color_t buf_1[BUFF_SIZE]; //TODO: 选择一个缓冲区大小。 DISPLAY_WIDTH * 10是一个建议。
   static lv_color_t buf_2[BUFF_SIZE];

- 在您的 ``main()`` 函数中，初始化CPU，外设和LCD面板后，调用 :cpp:func:`lv_init` 初始化LVGL。然后，您可以使用 :cpp:func:`lv_display_create` 创建显示驱动程序，并使用 :cpp:func:`lv_display_set_buffers` 注册帧缓冲区。

.. code:: c

   //初始化LVGL UI库
   lv_init();

   lv_display_t * disp = lv_display_create(WIDTH, HEIGHT); /*基本初始化，水平和垂直分辨率以像素为单位*/
   lv_display_set_flush_cb(disp, my_flush_cb); /*设置刷新回调以绘制到显示*/
   lv_display_set_buffers(disp, buf_1, buf_2, sizeof(buf_1), LV_DISPLAY_RENDER_MODE_PARTIAL); /*设置一个已初始化的缓冲区*/

- 创建一些虚拟对象以测试输出：

.. code:: c

   // 更改活动屏幕的背景颜色
   lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
   lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

   /*创建旋转器*/
   lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
   lv_obj_set_size(spinner, 64, 64);
   lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);

- 在您的 ``while(1)`` 循环中添加对 :cpp:func:`lv_timer_handler` 的调用：

.. code:: c

   /* 无限循环 */
   while (1)
   {
     lv_timer_handler();
     HAL_Delay(5);
   }

- 在 :cpp:func:`SysTick_Handler` 函数中添加对 :cpp:func:`lv_tick_inc` 的调用。打开 *stm32xxxx_it.c* 文件（名称将取决于您的具体MCU），并更新 :cpp:func:`SysTick_Handler` 函数：

.. code:: c

   void SysTick_Handler(void)
   {
     /* 用户代码开始SysTick_IRQn 0 */

       HAL_SYSTICK_IRQHandler();
       lv_tick_inc(1);
       #ifdef USE_RTOS_SYSTICK
         osSystickHandler();
       #endif

     /* 用户代码结束SysTick_IRQn 0 */
     HAL_IncTick();
     /* 用户代码开始SysTick_IRQn 1 */

     /* 用户代码结束SysTick_IRQn 1 */
   }

- 最后，编写回调函数 ``my_flush_cb``，该函数将显示缓冲区发送到LCD面板。下面是一个示例，但它将根据您的设置而有所不同。


FreeRTOS Example（FreeRTOS示例）
--------------------------------

.. raw:: html

   <details>
     <summary>显示原文</summary>

A minimal example using STM32CubeIDE, HAL, and CMSISv1 (FreeRTOS). *Note
that we have not used Mutexes in this example, however LVGL is* **NOT**
*thread safe and so Mutexes should be used*. See: :ref:`os_interrupt`
\* ``#include "lvgl.h"`` \* Create your frame buffer(s) as global
variables:

.. code:: c

   //Frame buffers
   /*Static or global buffer(s). The second buffer is optional*/
   static lv_color_t buf_1[BUFF_SIZE]; //TODO: Declare your own BUFF_SIZE appropriate to your system.
   static lv_color_t buf_2[BUFF_SIZE];

- In your ``main`` function, after your peripherals (SPI, GPIOs, LCD
  etc) have been initialised, initialise LVGL using :cpp:func:`lv_init`,
  create a new display driver using :cpp:func:`lv_display_create`, and
  register the frame buffers using :cpp:func:`lv_display_set_buffers`.

.. code:: c

   //Initialise LVGL UI library
   lv_init();
   lv_display_t *display = lv_display_create(WIDTH, HEIGHT); /*Create the display*/
   lv_display_set_flush_cb(display, my_flush_cb);        /*Set a flush callback to draw to the display*/

   // Register the touch controller with LVGL - Not included here for brevity.

- Create some dummy objects to test the output:

.. code:: c

   // Change the active screen's background color
   lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
   lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

   /*Create a spinner*/
   lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
   lv_obj_set_size(spinner, 64, 64);
   lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);

- Create two threads to call :cpp:func:`lv_timer_handler`, and
  :cpp:func:`lv_tick_inc`.You will need two ``osThreadId`` handles for
  CMSISv1. These don't strictly have to be globally accessible in this
  case, however STM32Cube code generation does by default. If you are
  using CMSIS and STM32Cube code generation it should look something
  like this:

.. code:: c

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

.. code:: c

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

.. code:: c

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
      * Inform the graphics library that you are ready with the flushing*/
     lv_display_flush_ready(display);
   }

.. raw:: html

   </details>
   <br>


一个使用STM32CubeIDE、HAL和CMSISv1（FreeRTOS）的最小示例。请注意，此示例中没有使用互斥锁，但是LVGL *不是* 线程安全的，因此应该使用互斥锁。请参见：:ref:`os_interrupt`

\* ``#include "lvgl.h"`` \*将帧缓冲区作为全局变量创建：

.. code:: c

   //帧缓冲区
   /*静态或全局缓冲区（可选的第二个缓冲区）*/
   static lv_color_t buf_1[BUFF_SIZE]; //TODO：根据您的系统声明适当的BUFF_SIZE。
   static lv_color_t buf_2[BUFF_SIZE];

- 在您的 ``main`` 函数中，在初始化外设（SPI，GPIO，LCD）之后，使用 :cpp:func:`lv_init` 初始化LVGL，使用 :cpp:func:`lv_display_create` 创建新的显示驱动程序，使用 :cpp:func:`lv_display_set_buffers` 注册帧缓冲区。

.. code:: c

   //初始化LVGL用户界面库
   lv_init();
   lv_display_t *display = lv_display_create(WIDTH, HEIGHT); /*创建显示*/
   lv_display_set_flush_cb(display, my_flush_cb);        /*设置刷新回调以绘制到显示器*/

   // 使用LVGL注册触摸控制器-由于篇幅的原因，此处未包含。

- 创建一些虚拟对象来测试输出：

.. code:: c

   //更改活动屏幕的背景颜色
   lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x003a57), LV_PART_MAIN);
   lv_obj_set_style_text_color(lv_screen_active(), lv_color_hex(0xffffff), LV_PART_MAIN);

   /*创建旋转器*/
   lv_obj_t * spinner = lv_spinner_create(lv_screen_active(), 1000, 60);
   lv_obj_set_size(spinner, 64, 64);
   lv_obj_align(spinner, LV_ALIGN_BOTTOM_MID, 0, 0);

- 创建两个线程来调用 :cpp:func:`lv_timer_handler` 和 :cpp:func:`lv_tick_inc`。对于CMSISv1，您将需要两个 ``osThreadId`` 句柄。在这种情况下，它们不一定要在全局范围内访问，但是STM32Cube代码生成默认情况下是如此。如果您正在使用CMSIS和STM32Cube代码生成，它应该类似于以下示例：

.. code:: c

   //线程句柄
   osThreadId lvgl_tickHandle;
   osThreadId lvgl_timerHandle;

   /*定义并创建lvgl_tick*/
   osThreadDef(lvgl_tick, LVGLTick, osPriorityNormal, 0, 1024);
   lvgl_tickHandle = osThreadCreate(osThread(lvgl_tick), NULL);

   //LVGL更新定时器
   osThreadDef(lvgl_timer, LVGLTimer, osPriorityNormal, 0, 1024);
   lvgl_timerHandle = osThreadCreate(osThread(lvgl_timer), NULL);

- 并创建线程函数：

.. code:: c

   /*用于任务的LVGL定时器。*/
   void LVGLTimer(void const * argument)
   {
     for(;;)
     {
       lv_timer_handler();
       osDelay(20);
     }
   }
   /*LVGL滴答源*/
   void LVGLTick(void const * argument)
   {
     for(;;)
     {
       lv_tick_inc(10);
       osDelay(10);
     }
   }

- 最后，创建 ``my_flush_cb`` 函数来将帧缓冲区输出到LCD。此函数的具体细节将取决于您使用的MCU功能。以下是一个典型MCU接口的示例。

.. code:: c

   void my_flush_cb(lv_display_t * display, const lv_area_t * area, uint8_t * px_map);
   {
     uint16_t * color_p = (uint16_t *)px_map;

     //设置绘制区域
     set_draw_window(area->x1, area->y1, area->x2, area->y2);

     int height = area->y2 - area->y1 + 1;
     int width = area->x2 - area->x1 + 1;

     //开始SPI写入数据
     HAL_GPIO_WritePin(DC_PORT, DC_PIN, GPIO_PIN_SET);
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_RESET);

     //向每个像素写入颜色
     for (int i = 0; i < width * height; i++) {
         parallel_write(color_p);
         color_p++;
     }

     //恢复CS为高电平
     HAL_GPIO_WritePin(CS_PORT, CS_PIN, GPIO_PIN_SET);

     /*重要！！！
      *通知图形库刷新准备就绪*/
     lv_display_flush_ready(display);
   }

