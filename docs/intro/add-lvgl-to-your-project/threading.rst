.. _threading:

============================================
Threading Considerations（线程相关注意事项）
============================================

.. _threading_definitions:

Definitions（定义）
*******************
.. raw:: html

   <details>
     <summary>显示原文</summary>
.. _thread:

Thread
    In the context of this document, a thread is any sequence of CPU instructions.
    In "bare-metal" implementations (i.e. no OS), threads include:

    - the main thread executing a while(1) loop that runs the system, and
    - interrupts.

    When running under an OS, threads include:

    - each task (or process),
    - interrupts, and
    - advanced OSes can have multiple "execution threads" within a processes.

.. _atomic operation:

Atomic Operation
    If operation X is atomic, that means that any thread observing the operation will
    see it either as not yet started, or as completed, and not in any state that is
    partially completed.

    If other threads can see the operation in a partially performed state, or
    interfere with it, then operation X is not atomic.

    If an atomic operation can fail, its implementation must return the the resource
    back to the state before the operation was started.  To other threads it must
    appear as though the operation had not yet started.

.. _atomic data:
.. _atomic:
.. _non-atomic data:

Atomic Data
    A datum (i.e. contents of a variable or data structure) is atomic if any thread
    observing it will always see it in a consistent state, as if operations on it
    have either not yet started, or have been successfully completed, and not in a
    state that is partially changed or otherwise inconsistent.

    When reading or writing a value is started and completed with 1 CPU instruction,
    it is automatically atomic, since it can never been seen in an inconsistent
    (partially-changed) state, even from a CPU interrupt or exception.  With such
    values, no special protection is required by programmers to ensure all threads
    see it in a consistent state.
.. raw:: html

   </details> 
   <br>
.. _thread:
线程
    在本文档的语境中，线程是指 CPU 指令的任何序列。
    在 “裸机” 实现（即无操作系统）的情况下，线程包括：

    - 执行 while (1) 循环来运行系统的主线程，以及
    - 中断。

    当在操作系统下运行时，线程包括：

    - 每个任务（或进程），
    - 中断，以及
    - 高级操作系统可在一个进程内拥有多个 “执行线程”。

.. _atomic operation:
原子操作
    如果操作 X 是原子操作，这意味着任何观察该操作的线程看到的要么是操作尚未开始的状态，要么是已完成的状态，而不会看到任何处于部分完成状态的情况。
    
    如果其他线程能看到该操作处于部分执行状态，或者能够干扰它，那么操作 X 就不是原子操作。
    
    如果一个原子操作可能失败，其实现必须将资源恢复到操作开始前的状态。对于其他线程来说，必须看起来好像该操作尚未开始一样。

.. _atomic data:
.. _atomic:
.. _non-atomic data:

原子数据
    如果任何观察数据（即变量或数据结构的内容）的线程总是能看到它处于一致状态，就好像对它的操作要么尚未开始，要么已成功完成，而不会处于部分更改或其他不一致的状态，那么该数据就是原子数据。
    
    当读取或写入一个值通过 1 条 CPU 指令开始并完成时，它自动就是原子的，因为它永远不会处于不一致（部分更改）的状态，即使是来自 CPU 中断或异常情况也是如此。对于这样的值，程序员不需要采取特殊保护措施来确保所有线程看到它处于一致状态。

.. _lvgl_and_threads:

LVGL and Threads（LVGL 与线程）
******************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
LVGL is **not thread-safe**.

That means it is the programmer's responsibility to see that no LVGL function is
called while another LVGL call is in progress in another thread.  This includes calls
to :cpp:func:`lv_timer_handler`.

.. note::
    Assuming the above is the case, it is safe to call LVGL functions in

    - :ref:`event callbacks <events>`, and in
    - :ref:`timer callbacks <timer>`

    because the thread that drives both of these is the thread that calls
    :cpp:func:`lv_timer_handler`.

Reason:

LVGL manages many complex data structures, and those structures are "system
resources" that must be protected from being "seen" by other threads in an
inconsistent state.  A high percentage LVGL functions (functions that start with
``lv_``) either read from or change those data structures.  Those that change them
place the data in an inconsistent state during execution (because such changes are
multi-step sequences), but return them to a consistent state before those functions
return.  For this reason, execution of each LVGL function must be allowed to complete
before any other LVGL function is started.

.. _os_exception:

.. admonition:: Exceptions to the Above:

    These two LVGL functions may be called from any thread:

    - :cpp:func:`lv_tick_inc` (see :ref:`tick_interface` for more information) and
    - :cpp:func:`lv_display_flush_ready` (see :ref:`flush_callback` for more information)

    The reason this is okay is that the LVGL data changed by them is :ref:`atomic <atomic>`.

    If an interrupt MUST convey information to part of your application that calls
    LVGL functions, set a flag or other atomic value that your LVGL-calling thread
    (or an :ref:`LVGL Timer <timer>` you create) can read from and take action.

    If you are using an OS, there are a few other options.  See below.

.. raw:: html

   </details> 
   <br>

LVGL **并非线程安全的**。

这意味着程序员有责任确保在另一个线程中正在进行 LVGL 调用时，不会有其他 LVGL 函数被调用。这包括对 :cpp:func:`lv_timer_handler` 的调用。

.. 注意::
    假设上述情况属实，那么在以下情况中调用 LVGL 函数是安全的：

    - 在 :ref:`event callbacks <events>` 中，以及
    - 在 :ref:`timer callbacks <timer>` 中

    因为驱动这两者的线程就是调用 :cpp:func:`lv_timer_handler` 的线程。

原因：

LVGL 管理着许多复杂的数据结构，而这些结构属于 “系统资源”，必须防止其他线程在其处于不一致状态时 “看到” 它们。很大比例的 LVGL 函数（以 ``lv_`` 开头的函数）要么从这些数据结构中读取数据，要么对其进行更改。那些更改数据结构的函数在执行期间会使数据处于不一致状态（因为此类更改是多步骤的操作序列），但会在函数返回前将其恢复到一致状态。基于这个原因，在启动任何其他 LVGL 函数之前，必须允许每个 LVGL 函数完成执行。

.. _os_exception:

.. 告诫：：上述情况的例外：

    以下两个 LVGL 函数可以从任何线程中被调用：

    - :cpp:func:`lv_tick_inc`（如需了解更多信息，请参阅 :ref:`tick_interface`），以及
    - :cpp:func:`lv_display_flush_ready`（如需了解更多信息，请参阅 :ref:`flush_callback`）

    这样做可行的原因是它们所更改的 LVGL 数据是 :ref:`atomic <atomic>`。

    如果中断必须向调用 LVGL 函数的应用程序的某个部分传递信息，可设置一个标志或其他原子值，供调用 LVGL 的线程（或者你创建的 :ref:`LVGL Timer <timer>`）读取并采取相应行动。
    
    如果您正在使用操作系统，还有其他一些可选方案。详见下文。

.. _tasks:

Tasks（任务）
************
.. raw:: html

   <details>
     <summary>显示原文</summary>
Under an OS, it is common to have many threads of execution ("tasks" in some OSes)
performing services for the application.  In some cases, such threads can acquire
data that should be shown (or otherwise reflected) in the user interface, and doing
so requires making LVGL calls to get that data (or change) shown.

Yet it still remains the programmer's responsibility to see that no LVGL function is
called while another LVGL call is in progress.

How do you do this?
.. raw:: html

   </details> 
   <br>
在操作系统下，应用程序通常会有许多执行线程（在某些操作系统中称为 “任务”）来提供服务。在某些情况下，这些线程可以获取应该在用户界面中显示（或以其他方式体现）的数据，并且这样做需要调用 LVGL 来显示（或更改）这些数据。

然而，程序员仍然有责任确保在另一个 LVGL 调用正在进行时，不会调用其他 LVGL 函数。

要怎么做呢？
.. _gateway thread:

Method 1:  Use a Gateway Thread（方法 1：使用网关线程）
-------------------------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
A "Gateway Thread" (or "Gateway Task" in some OSes) is a thread (task) that the
system designer designates to *exclusively* manage a system resource.  An example is
management of a remote chip, such as an EEPROM or other device that always needs to
be brought into a consistent state before something new is started.  Another example
is management of multiple devices on an I2C bus (or any data bus).  In this case the
I2C bus is the "exclusively-managed resource", and having only one thread managing it
guarantees that each action started is allowed to complete before another action with
it is started.

LVGL's data structures are a system resource that requires such protection.

Using this method, creation, modification and deletion of all Widgets and other
LVGL resources (i.e. all LVGL function calls excluding the :ref:`exceptions
<os_exception>` mentioned above) are called by that thread.  That means
that thread is also the ONLY caller of :cpp:func:`lv_timer_handler`.  (See
:ref:`add_lvgl_to_your_project` for more information.)

This ensures LVGL's data structures "appear" atomic_ (all threads using this data
"see" it in a consistent state) by the fact that no other threads are "viewing" those
data structures.  This is enforced by programmer discipline that ensures the `Gateway
Thread`_ is the only thread making LVGL calls (excluding the :ref:`exceptions
<os_exception>` mentioned above).

If `atomic data`_ relevant to the user interface is updated in another thread (i.e.
by another task or in an interrupt), the thread calling LVGL functions can read that
data directly without worry that it is in an inconsistent state.  (To avoid
unnecessary CPU overhead, a mechanism can be provided [such as a flag raised by the
updating thread] so that the user interface is only updated when it will result in a
change visible to the end user.)

If `non-atomic data`_ relevant to the user interface is updated in another thread
(i.e. by another task or in an interrupt), an alternate (and safe) way of convey that
data to the thread calling LVGL functions is to pass a private copy of that data to
that thread via a QUEUE or other OS mechanism that protects that data from being seen
in an inconsistent state.

Use of a `Gateway Thread`_ avoids the CPU-overhead (and coding overhead) of using a
MUTEX to protect LVGL data structures.
.. raw:: html

   </details> 
   <br>
“网关线程”（在某些操作系统中称为 “网关任务”）是系统设计者指定用来 “专门” 管理系统资源的线程（任务）。例如，对远程芯片（如 EEPROM 或其他设备）的管理，在开始新操作之前，总是需要使其处于一致状态。另一个例子是对 I2C 总线（或任何数据总线）上多个设备的管理。在这种情况下，I2C 总线就是 “专门管理的资源”，只有一个线程对其进行管理，就能确保每项已启动的操作在启动另一项与之相关的操作之前能够完成。

LVGL 的数据结构是一种需要此类保护的系统资源。

使用这种方法，所有部件（Widget）及其他 LVGL 资源的创建、修改和删除（即除上述 :ref:`exceptions <os_exception>` 中提到的函数之外的所有 LVGL 函数调用）都由该线程来进行调用。这意味着该线程也是 :cpp:func:`lv_timer_handler` 的唯一调用者。（如需了解更多信息，请参阅 :ref:`add_lvgl_to_your_project`将LVGL添加到您的项目中。）

通过确保没有其他线程 “查看” 这些数据结构，这能保证 LVGL 的数据结构 “看起来” 是原子的（所有使用这些数据的线程 “看到” 的都是其处于一致状态）。这是通过程序员的规范来强制实施的，即确保 `Gateway Thread`_  是唯一进行 LVGL 调用的线程（除上述 :ref:`exceptions <os_exception>` 中提到的情况外）。

如果与用户界面相关的 `atomic data`_ 在另一个线程（即由另一个任务或在中断中）进行了更新，调用 LVGL 函数的线程可以直接读取该数据，而无需担心其处于不一致状态。（为避免不必要的 CPU 开销，可以提供一种机制 [比如由更新线程设置一个标志]，以便仅在会导致最终用户可见的更改时才更新用户界面。）

如果与用户界面相关的 `non-atomic data`_ 在另一个线程（即由另一个任务或在中断中）进行了更新，将该数据传递给调用 LVGL 函数的线程的另一种（且安全的）方式是，通过队列或其他操作系统机制将该数据的私有副本传递给该线程，这种机制可保护数据不被看到处于不一致状态。

使用 `Gateway Thread`_ 可避免使用互斥锁（MUTEX）来保护 LVGL 数据结构所产生的 CPU 开销（以及编码开销）。


Method 2:  Use a MUTEX（方法 2：使用互斥锁）
-------------------------------------------
.. raw:: html

   <details>
     <summary>显示原文</summary>
A MUTEX stands for "MUTually EXclusive" and is a synchronization primative that
protects the state of a system resource from being modified or accessed by multiple
threads of execution at once.  In other words, it makes data so protected "appear"
atomic (all threads using this data "see" it in a consistent state).  Most OSes
provide MUTEXes.

The system designer assigns a single MUTEX to product a single system resource.  Once
assigned, that MUTEX performs such protection by programmers:

1.  acquiring the MUTEX (a.k.a. locking it) before accessing or modifying that
    resource, and

2.  releasing the MUTEX (a.k.a. unlocking it) after that access or modification
    is complete.

If a thread attempts to acquire (lock) the MUTEX while another thread "owns" it,
that thread waits on the other thread to release (unlock) it before it is allowed
to continue execution.

To be clear:  this must be done *both* by threads that READ from that resource, and
threads that MODIFY that resource.

If a MUTEX is used to protect LVGL data structures, that means *every* LVGL function
call (or group of function calls) must be preceeded by #1, and followed by #2,
including calls to :cpp:func:`lv_timer_handler`.

.. note::
    If your OS is integrated with LVGL (the macro :c:macro:`LV_USE_OS` has a value
    other than ``LV_OS_NONE`` in ``lv_conf.h``) you can use :cpp:func:`lv_lock()` and
    :cpp:func:`lv_unlock()` to perform #1 and #2.

    When this is the case, :cpp:func:`lv_timer_handler` calls :cpp:func:`lv_lock()`
    and :cpp:func:`lv_unlock()` internally, so you do not have to bracket your
    calls to :cpp:func:`lv_timer_handler` with them.

    If your OS is NOT integrated with LVGL, then these calls either return
    immediately with no effect, or are optimized away by the linker.

    To enable :cpp:func:`lv_lock()` and :cpp:func:`lv_unlock()`, set ``LV_USE_OS``
    to a value other than ``LV_OS_NONE``.

This pseudocode illustrates the concept of using a MUTEX:

.. code-block:: c

    void lvgl_thread(void)
    {
        while(1) {
            uint32_t time_till_next;
            time_till_next = lv_timer_handler(); /* lv_lock/lv_unlock is called internally */
            thread_sleep(time_till_next); /* sleep for a while */
        }
    }

    void other_thread(void)
    {
        /* You must always hold (lock) the MUTEX while calling LVGL functions. */
        lv_lock();
        lv_obj_t *img = lv_image_create(lv_screen_active());
        lv_unlock();

        while(1) {
            lv_lock();
            /* Change to next image. */
            lv_image_set_src(img, next_image);
            lv_unlock();
            thread_sleep(2000);
        }
    }
.. raw:: html

   </details> 
   <br>
互斥锁（MUTEX）是 “Mutually Exclusive（互斥）” 的缩写，它是一种同步原语，用于保护系统资源的状态，防止其同时被多个执行线程修改或访问。换句话说，它能使受其保护的数据 “看起来” 是原子的（所有使用这些数据的线程 “看到” 的都是其处于一致状态）。大多数操作系统都提供互斥锁。

系统设计者会为单个系统资源分配一个互斥锁。分配之后，互斥锁由程序员通过以下方式来执行此类保护：

1.  在访问或修改该资源之前获取互斥锁（也称作加锁），并且

2.  在访问或修改完成之后释放互斥锁（也称作解锁）。

如果一个线程试图获取（加锁）互斥锁，而此时另一个线程 “持有” 该互斥锁，那么这个线程就会等待另一个线程释放（解锁）它，之后才被允许继续执行。

需要明确的是：无论是从该资源读取数据的线程，还是修改该资源的线程，都必须这样做。

如果使用互斥锁来保护 LVGL 的数据结构，这意味着每一次 LVGL 函数调用（或一组函数调用）之前都必须先执行步骤 1，之后执行步骤 2，包括对 :cpp:func:`lv_timer_handler` 的调用也不例外。
.. 注意::
如果您的操作系统与 LVGL 集成（在 ``lv_conf.h`` 文件中，宏 :c:macro:`LV_USE_OS` 的值不是 ``LV_OS_NONE``），您可以使用 :cpp:func:`lv_lock()` 和 :cpp:func:`lv_unlock()` 来执行步骤 1 和步骤 2。

在这种情况下， :cpp:func:`lv_timer_handler` 会在内部调用 :cpp:func:`lv_lock()` 和 :cpp:func:`lv_unlock()`，所以您不必在对 :cpp:func:`lv_timer_handler` 的调用前后加上这两个函数调用。

如果您的操作系统未与 LVGL 集成，那么这些调用要么立即返回且无任何效果，要么会被链接器优化掉。

要启用 :cpp:func:`lv_lock()` 和 :cpp:func:`lv_unlock()`，需将 ``LV_OS_NONE``设置为非 ``LV_OS_NONE`` 的值。

以下伪代码阐释了使用互斥锁的概念：
.. code-block:: c

    void lvgl_thread(void)
    {
        while(1) {
            uint32_t time_till_next;
            time_till_next = lv_timer_handler(); /* lv_lock/lv_unlock is called internally */
            thread_sleep(time_till_next); /* sleep for a while */
        }
    }

    void other_thread(void)
    {
        /* You must always hold (lock) the MUTEX while calling LVGL functions. */
        lv_lock();
        lv_obj_t *img = lv_image_create(lv_screen_active());
        lv_unlock();

        while(1) {
            lv_lock();
            /* Change to next image. */
            lv_image_set_src(img, next_image);
            lv_unlock();
            thread_sleep(2000);
        }
    }
.. _sleep_management:

Sleep Management（睡眠管理）
***************************
.. raw:: html

   <details>
     <summary>显示原文</summary>
The MCU can go to sleep when no user input has been received for a certain period.
In this case, the main ``while(1)`` could look like this:

.. code-block:: c

    while(1) {
        /* Normal operation (no sleep) in < 1 sec inactivity */
        if(lv_display_get_inactive_time(NULL) < 1000) {
            lv_timer_handler();
        }
        /* Sleep after 1 sec inactivity */
        else {
            timer_stop();   /* Stop the timer where lv_tick_inc() is called */
            sleep();        /* Sleep the MCU */
        }
        my_delay_ms(5);
    }

You should also add the following lines to your input device read
function to signal a wake-up (press, touch, click, etc.) has happened:

.. code-block:: c

    lv_tick_inc(LV_DEF_REFR_PERIOD);  /* Force task execution on wake-up */
    timer_start();                    /* Restart timer where lv_tick_inc() is called */
    lv_timer_handler();               /* Call `lv_timer_handler()` manually to process the wake-up event */

In addition to :cpp:func:`lv_display_get_inactive_time` you can check
:cpp:func:`lv_anim_count_running` to see if all animations have finished.

.. raw:: html

   </details> 
   <br>

当在一定时间段内未接收到用户输入时，微控制器（MCU）可以进入睡眠状态。在这种情况下，主 ``while(1)`` 循环可能看起来像这样：

.. code-block:: c

    while(1) {
        /* Normal operation (no sleep) in < 1 sec inactivity */
        if(lv_display_get_inactive_time(NULL) < 1000) {
            lv_timer_handler();
        }
        /* Sleep after 1 sec inactivity */
        else {
            timer_stop();   /* Stop the timer where lv_tick_inc() is called */
            sleep();        /* Sleep the MCU */
        }
        my_delay_ms(5);
    }

你还应该将以下代码行添加到输入设备读取函数中，以表示唤醒（按下、触摸、点击等）操作已发生：

.. code-block:: c

    lv_tick_inc(LV_DEF_REFR_PERIOD);  /* 唤醒时强制任务执行 */
    timer_start();                    /* 在调用 lv_tick_inc () 的地方重启定时器 */
    lv_timer_handler();               /* 手动调用`lv_timer_handler()`来处理唤醒事件 */

除了 :cpp:func:`lv_display_get_inactive_time` 之外，你还可以检查 :cpp:func:`lv_anim_count_running` ，以查看所有动画是否都已完成。