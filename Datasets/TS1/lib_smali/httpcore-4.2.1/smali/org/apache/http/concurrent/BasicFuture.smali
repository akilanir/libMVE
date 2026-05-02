.class public Lorg/apache/http/concurrent/BasicFuture;
.super Ljava/lang/Object;
.source "BasicFuture.java"

# interfaces
.implements Ljava/util/concurrent/Future;
.implements Lorg/apache/http/concurrent/Cancellable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<TT;>;",
        "Lorg/apache/http/concurrent/Cancellable;"
    }
.end annotation


# instance fields
.field private final callback:Lorg/apache/http/concurrent/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile cancelled:Z

.field private volatile completed:Z

.field private volatile ex:Ljava/lang/Exception;

.field private volatile result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/concurrent/FutureCallback;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    .local p1, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    .line 54
    return-void
.end method

.method private getResult()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    iget-object v0, p0, Lorg/apache/http/concurrent/BasicFuture;->ex:Ljava/lang/Exception;

    if-eqz v0, :cond_c

    .line 66
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->ex:Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 68
    :cond_c
    iget-object v0, p0, Lorg/apache/http/concurrent/BasicFuture;->result:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public cancel()Z
    .registers 2

    .prologue
    .line 142
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/http/concurrent/BasicFuture;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized cancel(Z)Z
    .registers 4
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    const/4 v0, 0x1

    .line 129
    monitor-enter p0

    :try_start_2
    iget-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_1c

    if-eqz v1, :cond_9

    .line 130
    const/4 v0, 0x0

    .line 138
    :goto_7
    monitor-exit p0

    return v0

    .line 132
    :cond_9
    const/4 v1, 0x1

    :try_start_a
    iput-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    .line 133
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->cancelled:Z

    .line 134
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_18

    .line 135
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v1}, Lorg/apache/http/concurrent/FutureCallback;->cancelled()V

    .line 137
    :cond_18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1b
    .catchall {:try_start_a .. :try_end_1b} :catchall_1c

    goto :goto_7

    .line 129
    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized completed(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    .line 103
    monitor-enter p0

    :try_start_2
    iget-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_1b

    if-eqz v1, :cond_9

    .line 104
    const/4 v0, 0x0

    .line 112
    :goto_7
    monitor-exit p0

    return v0

    .line 106
    :cond_9
    const/4 v1, 0x1

    :try_start_a
    iput-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    .line 107
    iput-object p1, p0, Lorg/apache/http/concurrent/BasicFuture;->result:Ljava/lang/Object;

    .line 108
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_17

    .line 109
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v1, p1}, Lorg/apache/http/concurrent/FutureCallback;->completed(Ljava/lang/Object;)V

    .line 111
    :cond_17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1a
    .catchall {:try_start_a .. :try_end_1a} :catchall_1b

    goto :goto_7

    .line 103
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized failed(Ljava/lang/Exception;)Z
    .registers 4
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    const/4 v0, 0x1

    .line 116
    monitor-enter p0

    :try_start_2
    iget-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_1b

    if-eqz v1, :cond_9

    .line 117
    const/4 v0, 0x0

    .line 125
    :goto_7
    monitor-exit p0

    return v0

    .line 119
    :cond_9
    const/4 v1, 0x1

    :try_start_a
    iput-boolean v1, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    .line 120
    iput-object p1, p0, Lorg/apache/http/concurrent/BasicFuture;->ex:Ljava/lang/Exception;

    .line 121
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_17

    .line 122
    iget-object v1, p0, Lorg/apache/http/concurrent/BasicFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v1, p1}, Lorg/apache/http/concurrent/FutureCallback;->failed(Ljava/lang/Exception;)V

    .line 124
    :cond_17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1a
    .catchall {:try_start_a .. :try_end_1a} :catchall_1b

    goto :goto_7

    .line 116
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-boolean v0, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    if-nez v0, :cond_c

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_9

    goto :goto_1

    .line 72
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0

    .line 75
    :cond_c
    :try_start_c
    invoke-direct {p0}, Lorg/apache/http/concurrent/BasicFuture;->getResult()Ljava/lang/Object;
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 14
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    const-wide/16 v6, 0x0

    .line 80
    monitor-enter p0

    :try_start_3
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    .line 81
    .local v0, "msecs":J
    cmp-long v8, v0, v6

    if-gtz v8, :cond_17

    move-wide v2, v6

    .line 82
    .local v2, "startTime":J
    :goto_c
    move-wide v4, v0

    .line 83
    .local v4, "waitTime":J
    iget-boolean v8, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    if-eqz v8, :cond_1c

    .line 84
    invoke-direct {p0}, Lorg/apache/http/concurrent/BasicFuture;->getResult()Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_26

    move-result-object v6

    .line 91
    :goto_15
    monitor-exit p0

    return-object v6

    .line 81
    .end local v2    # "startTime":J
    .end local v4    # "waitTime":J
    :cond_17
    :try_start_17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    goto :goto_c

    .line 85
    .restart local v2    # "startTime":J
    .restart local v4    # "waitTime":J
    :cond_1c
    cmp-long v8, v4, v6

    if-gtz v8, :cond_29

    .line 86
    new-instance v6, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v6}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v6
    :try_end_26
    .catchall {:try_start_17 .. :try_end_26} :catchall_26

    .line 80
    .end local v0    # "msecs":J
    .end local v2    # "startTime":J
    .end local v4    # "waitTime":J
    :catchall_26
    move-exception v6

    monitor-exit p0

    throw v6

    .line 89
    .restart local v0    # "msecs":J
    .restart local v2    # "startTime":J
    .restart local v4    # "waitTime":J
    :cond_29
    :try_start_29
    invoke-virtual {p0, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 90
    iget-boolean v8, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    if-eqz v8, :cond_35

    .line 91
    invoke-direct {p0}, Lorg/apache/http/concurrent/BasicFuture;->getResult()Ljava/lang/Object;

    move-result-object v6

    goto :goto_15

    .line 93
    :cond_35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    sub-long v4, v0, v8

    .line 94
    cmp-long v8, v4, v6

    if-gtz v8, :cond_29

    .line 95
    new-instance v6, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v6}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v6
    :try_end_46
    .catchall {:try_start_29 .. :try_end_46} :catchall_26
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    iget-boolean v0, p0, Lorg/apache/http/concurrent/BasicFuture;->cancelled:Z

    return v0
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 61
    .local p0, "this":Lorg/apache/http/concurrent/BasicFuture;, "Lorg/apache/http/concurrent/BasicFuture<TT;>;"
    iget-boolean v0, p0, Lorg/apache/http/concurrent/BasicFuture;->completed:Z

    return v0
.end method
