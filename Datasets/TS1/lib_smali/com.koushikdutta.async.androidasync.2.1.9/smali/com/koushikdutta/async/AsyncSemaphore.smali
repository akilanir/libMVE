.class public Lcom/koushikdutta/async/AsyncSemaphore;
.super Ljava/lang/Object;
.source "AsyncSemaphore.java"


# instance fields
.field semaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    return-void
.end method


# virtual methods
.method public acquire()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 11
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-static {v5}, Lcom/koushikdutta/async/ThreadQueue;->getOrCreateThreadQueue(Ljava/lang/Thread;)Lcom/koushikdutta/async/ThreadQueue;

    move-result-object v4

    .line 12
    .local v4, "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    iget-object v0, v4, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    .line 13
    .local v0, "last":Lcom/koushikdutta/async/AsyncSemaphore;
    iput-object p0, v4, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    .line 14
    iget-object v2, v4, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    .line 16
    .local v2, "queueSemaphore":Ljava/util/concurrent/Semaphore;
    :try_start_e
    iget-object v5, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_39

    move-result v5

    if-eqz v5, :cond_1c

    .line 36
    iput-object v0, v4, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    .line 38
    :goto_18
    return-void

    .line 26
    .local v3, "run":Ljava/lang/Runnable;
    :cond_19
    :try_start_19
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 22
    .end local v3    # "run":Ljava/lang/Runnable;
    :cond_1c
    invoke-virtual {v4}, Lcom/koushikdutta/async/ThreadQueue;->remove()Ljava/lang/Runnable;

    move-result-object v3

    .line 23
    .restart local v3    # "run":Ljava/lang/Runnable;
    if-nez v3, :cond_19

    .line 29
    const/4 v5, 0x1

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 30
    .local v1, "permits":I
    invoke-virtual {v2, v1}, Ljava/util/concurrent/Semaphore;->acquire(I)V

    .line 31
    iget-object v5, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v5}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z
    :try_end_33
    .catchall {:try_start_19 .. :try_end_33} :catchall_39

    move-result v5

    if-eqz v5, :cond_1c

    .line 36
    iput-object v0, v4, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    goto :goto_18

    .end local v1    # "permits":I
    .end local v3    # "run":Ljava/lang/Runnable;
    :catchall_39
    move-exception v5

    iput-object v0, v4, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    throw v5
.end method

.method public release()V
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 78
    invoke-static {p0}, Lcom/koushikdutta/async/ThreadQueue;->release(Lcom/koushikdutta/async/AsyncSemaphore;)V

    .line 79
    return-void
.end method

.method public tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    .registers 15
    .param p1, "timeout"    # J
    .param p3, "timeunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 41
    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v7

    .line 42
    .local v7, "timeoutMs":J
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-static {v9}, Lcom/koushikdutta/async/ThreadQueue;->getOrCreateThreadQueue(Ljava/lang/Thread;)Lcom/koushikdutta/async/ThreadQueue;

    move-result-object v6

    .line 43
    .local v6, "threadQueue":Lcom/koushikdutta/async/ThreadQueue;
    iget-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    .line 44
    .local v0, "last":Lcom/koushikdutta/async/AsyncSemaphore;
    iput-object p0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    .line 45
    iget-object v2, v6, Lcom/koushikdutta/async/ThreadQueue;->queueSemaphore:Ljava/util/concurrent/Semaphore;

    .line 48
    .local v2, "queueSemaphore":Ljava/util/concurrent/Semaphore;
    :try_start_14
    iget-object v9, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z
    :try_end_19
    .catchall {:try_start_14 .. :try_end_19} :catchall_43

    move-result v9

    if-eqz v9, :cond_20

    .line 49
    const/4 v9, 0x1

    .line 72
    iput-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    :goto_1f
    return v9

    .line 51
    :cond_20
    :try_start_20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 55
    .local v4, "start":J
    :cond_24
    :goto_24
    invoke-virtual {v6}, Lcom/koushikdutta/async/ThreadQueue;->remove()Ljava/lang/Runnable;

    move-result-object v3

    .line 56
    .local v3, "run":Ljava/lang/Runnable;
    if-nez v3, :cond_3f

    .line 62
    const/4 v9, 0x1

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 63
    .local v1, "permits":I
    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v1, v7, v8, v9}, Ljava/util/concurrent/Semaphore;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z
    :try_end_38
    .catchall {:try_start_20 .. :try_end_38} :catchall_43

    move-result v9

    if-nez v9, :cond_47

    .line 64
    const/4 v9, 0x0

    .line 72
    iput-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    goto :goto_1f

    .line 59
    .end local v1    # "permits":I
    :cond_3f
    :try_start_3f
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_43

    goto :goto_24

    .line 72
    .end local v3    # "run":Ljava/lang/Runnable;
    .end local v4    # "start":J
    :catchall_43
    move-exception v9

    iput-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    throw v9

    .line 65
    .restart local v1    # "permits":I
    .restart local v3    # "run":Ljava/lang/Runnable;
    .restart local v4    # "start":J
    :cond_47
    :try_start_47
    iget-object v9, p0, Lcom/koushikdutta/async/AsyncSemaphore;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z
    :try_end_4c
    .catchall {:try_start_47 .. :try_end_4c} :catchall_43

    move-result v9

    if-eqz v9, :cond_53

    .line 66
    const/4 v9, 0x1

    .line 72
    iput-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    goto :goto_1f

    .line 68
    :cond_53
    :try_start_53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_43

    move-result-wide v9

    sub-long/2addr v9, v4

    cmp-long v9, v9, v7

    if-ltz v9, :cond_24

    .line 69
    const/4 v9, 0x0

    .line 72
    iput-object v0, v6, Lcom/koushikdutta/async/ThreadQueue;->waiter:Lcom/koushikdutta/async/AsyncSemaphore;

    goto :goto_1f
.end method
