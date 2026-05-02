.class abstract Lorg/apache/http/pool/PoolEntryFuture;
.super Ljava/lang/Object;
.source "PoolEntryFuture.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<TT;>;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
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

.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/locks/Lock;Lorg/apache/http/concurrent/FutureCallback;)V
    .registers 4
    .param p1, "lock"    # Ljava/util/concurrent/locks/Lock;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/locks/Lock;",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    .local p2, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    .line 55
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->condition:Ljava/util/concurrent/locks/Condition;

    .line 56
    iput-object p2, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    .line 57
    return-void
.end method


# virtual methods
.method public await(Ljava/util/Date;)Z
    .registers 5
    .param p1, "deadline"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 131
    :try_start_5
    iget-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->cancelled:Z

    if-eqz v1, :cond_18

    .line 132
    new-instance v1, Ljava/lang/InterruptedException;

    const-string v2, "Operation interrupted"

    invoke-direct {v1, v2}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_11

    .line 146
    :catchall_11
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1

    .line 135
    :cond_18
    if-eqz p1, :cond_2c

    .line 136
    :try_start_1a
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1, p1}, Ljava/util/concurrent/locks/Condition;->awaitUntil(Ljava/util/Date;)Z

    move-result v0

    .line 141
    .local v0, "success":Z
    :goto_20
    iget-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->cancelled:Z

    if-eqz v1, :cond_33

    .line 142
    new-instance v1, Ljava/lang/InterruptedException;

    const-string v2, "Operation interrupted"

    invoke-direct {v1, v2}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    .end local v0    # "success":Z
    :cond_2c
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_31
    .catchall {:try_start_1a .. :try_end_31} :catchall_11

    .line 139
    const/4 v0, 0x1

    .restart local v0    # "success":Z
    goto :goto_20

    .line 146
    :cond_33
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0
.end method

.method public cancel(Z)Z
    .registers 4
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    const/4 v0, 0x1

    .line 61
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 63
    :try_start_6
    iget-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z
    :try_end_8
    .catchall {:try_start_6 .. :try_end_8} :catchall_2b

    if-eqz v1, :cond_11

    .line 64
    const/4 v0, 0x0

    .line 74
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_10
    return v0

    .line 66
    :cond_11
    const/4 v1, 0x1

    :try_start_12
    iput-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z

    .line 67
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->cancelled:Z

    .line 68
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_20

    .line 69
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v1}, Lorg/apache/http/concurrent/FutureCallback;->cancelled()V

    .line 71
    :cond_20
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_25
    .catchall {:try_start_12 .. :try_end_25} :catchall_2b

    .line 74
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_10

    :catchall_2b
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public get()Ljava/lang/Object;
    .registers 5
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
    .line 91
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    const-wide/16 v1, 0x0

    :try_start_2
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/http/pool/PoolEntryFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 92
    :catch_9
    move-exception v0

    .line 93
    .local v0, "ex":Ljava/util/concurrent/TimeoutException;
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 7
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
    .line 101
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    const-string v1, "Time unit"

    invoke-static {p3, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 104
    :try_start_a
    iget-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z

    if-eqz v1, :cond_16

    .line 105
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->result:Ljava/lang/Object;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_10} :catch_32
    .catchall {:try_start_a .. :try_end_10} :catchall_48

    .line 121
    iget-object v2, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_15
    return-object v1

    .line 107
    :cond_16
    :try_start_16
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/pool/PoolEntryFuture;->getPoolEntry(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->result:Ljava/lang/Object;

    .line 108
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z

    .line 109
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_2a

    .line 110
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    iget-object v2, p0, Lorg/apache/http/pool/PoolEntryFuture;->result:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lorg/apache/http/concurrent/FutureCallback;->completed(Ljava/lang/Object;)V

    .line 112
    :cond_2a
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->result:Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_2c} :catch_32
    .catchall {:try_start_16 .. :try_end_2c} :catchall_48

    .line 121
    iget-object v2, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_15

    .line 113
    :catch_32
    move-exception v0

    .line 114
    .local v0, "ex":Ljava/io/IOException;
    const/4 v1, 0x1

    :try_start_34
    iput-boolean v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z

    .line 115
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->result:Ljava/lang/Object;

    .line 116
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v1, :cond_42

    .line 117
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v1, v0}, Lorg/apache/http/concurrent/FutureCallback;->failed(Ljava/lang/Exception;)V

    .line 119
    :cond_42
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_48
    .catchall {:try_start_34 .. :try_end_48} :catchall_48

    .line 121
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_48
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method protected abstract getPoolEntry(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 80
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    iget-boolean v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->cancelled:Z

    return v0
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    iget-boolean v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->completed:Z

    return v0
.end method

.method public wakeup()V
    .registers 3

    .prologue
    .line 152
    .local p0, "this":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TT;>;"
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 154
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_10

    .line 156
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 158
    return-void

    .line 156
    :catchall_10
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/PoolEntryFuture;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
