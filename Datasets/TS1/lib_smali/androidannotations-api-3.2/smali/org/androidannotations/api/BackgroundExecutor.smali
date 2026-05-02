.class public Lorg/androidannotations/api/BackgroundExecutor;
.super Ljava/lang/Object;
.source "BackgroundExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;,
        Lorg/androidannotations/api/BackgroundExecutor$Task;
    }
.end annotation


# static fields
.field public static DEFAULT_EXECUTOR:Ljava/util/concurrent/Executor; = null

.field public static final DEFAULT_WRONG_THREAD_LISTENER:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

.field private static final TAG:Ljava/lang/String; = "BackgroundExecutor"

.field private static final currentSerial:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static executor:Ljava/util/concurrent/Executor;

.field private static final tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/androidannotations/api/BackgroundExecutor$Task;",
            ">;"
        }
    .end annotation
.end field

.field private static wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->DEFAULT_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 39
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->DEFAULT_EXECUTOR:Ljava/util/concurrent/Executor;

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    .line 49
    new-instance v0, Lorg/androidannotations/api/BackgroundExecutor$1;

    invoke-direct {v0}, Lorg/androidannotations/api/BackgroundExecutor$1;-><init>()V

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->DEFAULT_WRONG_THREAD_LISTENER:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    .line 72
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->DEFAULT_WRONG_THREAD_LISTENER:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    .line 75
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/androidannotations/api/BackgroundExecutor;->currentSerial:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 437
    return-void
.end method

.method static synthetic access$700()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 34
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->currentSerial:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/List;
    .registers 1

    .prologue
    .line 34
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900(Ljava/lang/String;)Lorg/androidannotations/api/BackgroundExecutor$Task;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor;->take(Ljava/lang/String;)Lorg/androidannotations/api/BackgroundExecutor$Task;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized cancelAll(Ljava/lang/String;Z)V
    .registers 8
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 247
    const-class v3, Lorg/androidannotations/api/BackgroundExecutor;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_6f

    .line 248
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/androidannotations/api/BackgroundExecutor$Task;

    .line 249
    .local v1, "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$300(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 250
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->future:Ljava/util/concurrent/Future;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$400(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/util/concurrent/Future;

    move-result-object v2

    if-eqz v2, :cond_3d

    .line 251
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->future:Ljava/util/concurrent/Future;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$400(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/util/concurrent/Future;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 252
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->managed:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$500(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-nez v2, :cond_3a

    .line 258
    # invokes: Lorg/androidannotations/api/BackgroundExecutor$Task;->postExecute()V
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$600(Lorg/androidannotations/api/BackgroundExecutor$Task;)V

    .line 247
    :cond_3a
    :goto_3a
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 260
    :cond_3d
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->executionAsked:Z
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$100(Lorg/androidannotations/api/BackgroundExecutor$Task;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 261
    const-string v2, "BackgroundExecutor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "A task with id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$300(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " cannot be cancelled (the executor set does not support it)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_65
    .catchall {:try_start_3 .. :try_end_65} :catchall_66

    goto :goto_3a

    .line 247
    .end local v0    # "i":I
    .end local v1    # "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    :catchall_66
    move-exception v2

    monitor-exit v3

    throw v2

    .line 264
    .restart local v0    # "i":I
    .restart local v1    # "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    :cond_69
    :try_start_69
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_6e
    .catchall {:try_start_69 .. :try_end_6e} :catchall_66

    goto :goto_3a

    .line 268
    .end local v1    # "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    :cond_6f
    monitor-exit v3

    return-void
.end method

.method public static varargs checkBgThread([Ljava/lang/String;)V
    .registers 8
    .param p0, "serials"    # [Ljava/lang/String;

    .prologue
    .line 294
    array-length v5, p0

    if-nez v5, :cond_17

    .line 295
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    if-ne v5, v6, :cond_16

    .line 296
    sget-object v5, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    invoke-interface {v5, p0}, Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;->onBgExpected([Ljava/lang/String;)V

    .line 311
    :cond_16
    :goto_16
    return-void

    .line 300
    :cond_17
    sget-object v5, Lorg/androidannotations/api/BackgroundExecutor;->currentSerial:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 301
    .local v1, "current":Ljava/lang/String;
    if-nez v1, :cond_28

    .line 302
    sget-object v5, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    const/4 v6, 0x0

    invoke-interface {v5, v6, p0}, Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;->onWrongBgSerial(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_16

    .line 305
    :cond_28
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_2b
    if-ge v2, v3, :cond_38

    aget-object v4, v0, v2

    .line 306
    .local v4, "serial":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_16

    .line 305
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 310
    .end local v4    # "serial":Ljava/lang/String;
    :cond_38
    sget-object v5, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    invoke-interface {v5, v1, p0}, Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;->onWrongBgSerial(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_16
.end method

.method public static checkUiThread()V
    .registers 2

    .prologue
    .line 275
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_13

    .line 276
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    invoke-interface {v0}, Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;->onUiExpected()V

    .line 278
    :cond_13
    return-void
.end method

.method private static directExecute(Ljava/lang/Runnable;I)Ljava/util/concurrent/Future;
    .registers 8
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "I)",
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 92
    const/4 v1, 0x0

    .line 93
    .local v1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-lez p1, :cond_1d

    .line 95
    sget-object v3, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    instance-of v3, v3, Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v3, :cond_11

    .line 96
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The executor set does not support scheduling"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    :cond_11
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    check-cast v2, Ljava/util/concurrent/ScheduledExecutorService;

    .line 99
    .local v2, "scheduledExecutorService":Ljava/util/concurrent/ScheduledExecutorService;
    int-to-long v3, p1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, p0, v3, v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    .line 109
    .end local v2    # "scheduledExecutorService":Ljava/util/concurrent/ScheduledExecutorService;
    :goto_1c
    return-object v1

    .line 101
    :cond_1d
    sget-object v3, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    instance-of v3, v3, Ljava/util/concurrent/ExecutorService;

    if-eqz v3, :cond_2c

    .line 102
    sget-object v0, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ExecutorService;

    .line 103
    .local v0, "executorService":Ljava/util/concurrent/ExecutorService;
    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v1

    .line 104
    goto :goto_1c

    .line 106
    .end local v0    # "executorService":Ljava/util/concurrent/ExecutorService;
    :cond_2c
    sget-object v3, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v3, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1c
.end method

.method public static execute(Ljava/lang/Runnable;)V
    .registers 2
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 189
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/androidannotations/api/BackgroundExecutor;->directExecute(Ljava/lang/Runnable;I)Ljava/util/concurrent/Future;

    .line 190
    return-void
.end method

.method public static execute(Ljava/lang/Runnable;I)V
    .registers 2
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "delay"    # I

    .prologue
    .line 179
    invoke-static {p0, p1}, Lorg/androidannotations/api/BackgroundExecutor;->directExecute(Ljava/lang/Runnable;I)Ljava/util/concurrent/Future;

    .line 180
    return-void
.end method

.method public static execute(Ljava/lang/Runnable;Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "delay"    # I
    .param p3, "serial"    # Ljava/lang/String;

    .prologue
    .line 157
    new-instance v0, Lorg/androidannotations/api/BackgroundExecutor$2;

    invoke-direct {v0, p1, p2, p3, p0}, Lorg/androidannotations/api/BackgroundExecutor$2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lorg/androidannotations/api/BackgroundExecutor;->execute(Lorg/androidannotations/api/BackgroundExecutor$Task;)V

    .line 163
    return-void
.end method

.method public static execute(Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "runnable"    # Ljava/lang/Runnable;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "serial"    # Ljava/lang/String;

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/androidannotations/api/BackgroundExecutor;->execute(Ljava/lang/Runnable;Ljava/lang/String;ILjava/lang/String;)V

    .line 209
    return-void
.end method

.method public static declared-synchronized execute(Lorg/androidannotations/api/BackgroundExecutor$Task;)V
    .registers 4
    .param p0, "task"    # Lorg/androidannotations/api/BackgroundExecutor$Task;

    .prologue
    .line 126
    const-class v2, Lorg/androidannotations/api/BackgroundExecutor;

    monitor-enter v2

    const/4 v0, 0x0

    .line 127
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    :try_start_4
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor;->hasSerialRunning(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_20

    .line 128
    :cond_14
    const/4 v1, 0x1

    # setter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->executionAsked:Z
    invoke-static {p0, v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$102(Lorg/androidannotations/api/BackgroundExecutor$Task;Z)Z

    .line 129
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->remainingDelay:I
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$200(Lorg/androidannotations/api/BackgroundExecutor$Task;)I

    move-result v1

    invoke-static {p0, v1}, Lorg/androidannotations/api/BackgroundExecutor;->directExecute(Ljava/lang/Runnable;I)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 131
    :cond_20
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->id:Ljava/lang/String;
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$300(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2c

    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;
    invoke-static {p0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_34

    .line 133
    :cond_2c
    # setter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->future:Ljava/util/concurrent/Future;
    invoke-static {p0, v0}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$402(Lorg/androidannotations/api/BackgroundExecutor$Task;Ljava/util/concurrent/Future;)Ljava/util/concurrent/Future;

    .line 134
    sget-object v1, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catchall {:try_start_4 .. :try_end_34} :catchall_36

    .line 136
    :cond_34
    monitor-exit v2

    return-void

    .line 126
    :catchall_36
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private static hasSerialRunning(Ljava/lang/String;)Z
    .registers 4
    .param p0, "serial"    # Ljava/lang/String;

    .prologue
    .line 322
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/androidannotations/api/BackgroundExecutor$Task;

    .line 323
    .local v1, "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->executionAsked:Z
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$100(Lorg/androidannotations/api/BackgroundExecutor$Task;)Z

    move-result v2

    if-eqz v2, :cond_6

    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;
    invoke-static {v1}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 324
    const/4 v2, 0x1

    .line 327
    .end local v1    # "task":Lorg/androidannotations/api/BackgroundExecutor$Task;
    :goto_23
    return v2

    :cond_24
    const/4 v2, 0x0

    goto :goto_23
.end method

.method public static setExecutor(Ljava/util/concurrent/Executor;)V
    .registers 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 223
    sput-object p0, Lorg/androidannotations/api/BackgroundExecutor;->executor:Ljava/util/concurrent/Executor;

    .line 224
    return-void
.end method

.method public static setWrongThreadListener(Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;)V
    .registers 1
    .param p0, "listener"    # Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    .prologue
    .line 233
    sput-object p0, Lorg/androidannotations/api/BackgroundExecutor;->wrongThreadListener:Lorg/androidannotations/api/BackgroundExecutor$WrongThreadListener;

    .line 234
    return-void
.end method

.method private static take(Ljava/lang/String;)Lorg/androidannotations/api/BackgroundExecutor$Task;
    .registers 4
    .param p0, "serial"    # Ljava/lang/String;

    .prologue
    .line 339
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 340
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_27

    .line 341
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/androidannotations/api/BackgroundExecutor$Task;

    # getter for: Lorg/androidannotations/api/BackgroundExecutor$Task;->serial:Ljava/lang/String;
    invoke-static {v2}, Lorg/androidannotations/api/BackgroundExecutor$Task;->access$000(Lorg/androidannotations/api/BackgroundExecutor$Task;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 342
    sget-object v2, Lorg/androidannotations/api/BackgroundExecutor;->tasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/androidannotations/api/BackgroundExecutor$Task;

    .line 345
    :goto_23
    return-object v2

    .line 340
    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 345
    :cond_27
    const/4 v2, 0x0

    goto :goto_23
.end method
