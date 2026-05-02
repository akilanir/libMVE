.class public abstract Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;
.super Ljava/lang/Object;
.source "BackgroundInitializer.java"

# interfaces
.implements Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private executor:Ljava/util/concurrent/ExecutorService;

.field private externalExecutor:Ljava/util/concurrent/ExecutorService;

.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 102
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 103
    return-void
.end method

.method protected constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 2
    .param p1, "exec"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 115
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->setExternalExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 117
    return-void
.end method

.method private createExecutor()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .prologue
    .line 301
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getTaskCount()I

    move-result v0

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method private createTask(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Callable;
    .registers 3
    .param p1, "execDestroy"    # Ljava/util/concurrent/ExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 291
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;-><init>(Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;Ljava/util/concurrent/ExecutorService;)V

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 212
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getFuture()Ljava/util/concurrent/Future;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_7
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_7} :catch_9
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_7} :catch_f

    move-result-object v2

    .line 215
    :goto_8
    return-object v2

    .line 213
    :catch_9
    move-exception v0

    .line 214
    .local v0, "execex":Ljava/util/concurrent/ExecutionException;
    invoke-static {v0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->handleCause(Ljava/util/concurrent/ExecutionException;)V

    .line 215
    const/4 v2, 0x0

    goto :goto_8

    .line 216
    .end local v0    # "execex":Ljava/util/concurrent/ExecutionException;
    :catch_f
    move-exception v1

    .line 218
    .local v1, "iex":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 219
    new-instance v2, Lorg/apache/commons/lang3/concurrent/ConcurrentException;

    invoke-direct {v2, v1}, Lorg/apache/commons/lang3/concurrent/ConcurrentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected final declared-synchronized getActiveExecutor()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .prologue
    .line 249
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getExternalExecutor()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .prologue
    .line 125
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->externalExecutor:Ljava/util/concurrent/ExecutorService;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFuture()Ljava/util/concurrent/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 232
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;

    if-nez v0, :cond_10

    .line 233
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "start() must be called first!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 232
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 236
    :cond_10
    :try_start_10
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_12
    .catchall {:try_start_10 .. :try_end_12} :catchall_d

    monitor-exit p0

    return-object v0
.end method

.method protected getTaskCount()I
    .registers 2

    .prologue
    .line 264
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method protected abstract initialize()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public declared-synchronized isStarted()Z
    .registers 2

    .prologue
    .line 136
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized setExternalExecutor(Ljava/util/concurrent/ExecutorService;)V
    .registers 4
    .param p1, "externalExecutor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 155
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 156
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set ExecutorService after start()!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 155
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0

    .line 160
    :cond_12
    :try_start_12
    iput-object p1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->externalExecutor:Ljava/util/concurrent/ExecutorService;
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_f

    .line 161
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized start()Z
    .registers 4

    .prologue
    .line 175
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;, "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->isStarted()Z

    move-result v1

    if-nez v1, :cond_28

    .line 180
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getExternalExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 181
    iget-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_26

    .line 182
    invoke-direct {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->createExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .local v0, "tempExec":Ljava/util/concurrent/ExecutorService;
    iput-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 187
    :goto_17
    iget-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->createTask(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Callable;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_2a

    .line 189
    const/4 v1, 0x1

    .line 192
    .end local v0    # "tempExec":Ljava/util/concurrent/ExecutorService;
    :goto_24
    monitor-exit p0

    return v1

    .line 184
    :cond_26
    const/4 v0, 0x0

    .restart local v0    # "tempExec":Ljava/util/concurrent/ExecutorService;
    goto :goto_17

    .line 192
    .end local v0    # "tempExec":Ljava/util/concurrent/ExecutorService;
    :cond_28
    const/4 v1, 0x0

    goto :goto_24

    .line 175
    :catchall_2a
    move-exception v1

    monitor-exit p0

    throw v1
.end method
