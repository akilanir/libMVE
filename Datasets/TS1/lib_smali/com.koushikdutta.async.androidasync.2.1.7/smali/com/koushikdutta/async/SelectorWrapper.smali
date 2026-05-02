.class public Lcom/koushikdutta/async/SelectorWrapper;
.super Ljava/lang/Object;
.source "SelectorWrapper.java"


# instance fields
.field isWaking:Z

.field private selector:Ljava/nio/channels/Selector;

.field semaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method public constructor <init>(Ljava/nio/channels/Selector;)V
    .registers 4
    .param p1, "selector"    # Ljava/nio/channels/Selector;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 22
    iput-object p1, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    .line 23
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->close()V

    .line 53
    return-void
.end method

.method public getSelector()Ljava/nio/channels/Selector;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    return-object v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v0

    return v0
.end method

.method public keys()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/nio/channels/SelectionKey;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public select()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/async/SelectorWrapper;->select(J)V

    .line 31
    return-void
.end method

.method public select(J)V
    .registers 6
    .param p1, "timeout"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v2, 0x7fffffff

    .line 35
    :try_start_3
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->drainPermits()I

    .line 36
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0, p1, p2}, Ljava/nio/channels/Selector;->select(J)I
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_13

    .line 39
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/Semaphore;->release(I)V

    .line 41
    return-void

    .line 39
    :catchall_13
    move-exception v0

    iget-object v1, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->release(I)V

    throw v0
.end method

.method public selectNow()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectNow()I

    move-result v0

    return v0
.end method

.method public selectedKeys()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/nio/channels/SelectionKey;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public wakeupOnce()V
    .registers 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 61
    iget-object v3, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v3

    if-nez v3, :cond_12

    .line 62
    .local v1, "selecting":Z
    :goto_a
    iget-object v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 64
    if-eqz v1, :cond_14

    .line 97
    :goto_11
    return-void

    .end local v1    # "selecting":Z
    :cond_12
    move v1, v2

    .line 61
    goto :goto_a

    .line 68
    .restart local v1    # "selecting":Z
    :cond_14
    monitor-enter p0

    .line 70
    :try_start_15
    iget-boolean v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->isWaking:Z

    if-eqz v2, :cond_1e

    .line 72
    monitor-exit p0

    goto :goto_11

    .line 75
    :catchall_1b
    move-exception v2

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1b

    throw v2

    .line 74
    :cond_1e
    const/4 v2, 0x1

    :try_start_1f
    iput-boolean v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->isWaking:Z

    .line 75
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_1b

    .line 80
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    const/16 v2, 0x64

    if-ge v0, v2, :cond_45

    .line 82
    :try_start_27
    iget-object v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->semaphore:Ljava/util/concurrent/Semaphore;

    const-wide/16 v3, 0xa

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_30
    .catch Ljava/lang/InterruptedException; {:try_start_27 .. :try_end_30} :catch_3c
    .catchall {:try_start_27 .. :try_end_30} :catchall_4e

    move-result v2

    if-eqz v2, :cond_3d

    .line 93
    monitor-enter p0

    .line 94
    const/4 v2, 0x0

    :try_start_35
    iput-boolean v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->isWaking:Z

    .line 95
    monitor-exit p0

    goto :goto_11

    :catchall_39
    move-exception v2

    monitor-exit p0
    :try_end_3b
    .catchall {:try_start_35 .. :try_end_3b} :catchall_39

    throw v2

    .line 87
    :catch_3c
    move-exception v2

    .line 89
    :cond_3d
    :try_start_3d
    iget-object v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;
    :try_end_42
    .catchall {:try_start_3d .. :try_end_42} :catchall_4e

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 93
    :cond_45
    monitor-enter p0

    .line 94
    const/4 v2, 0x0

    :try_start_47
    iput-boolean v2, p0, Lcom/koushikdutta/async/SelectorWrapper;->isWaking:Z

    .line 95
    monitor-exit p0

    goto :goto_11

    :catchall_4b
    move-exception v2

    monitor-exit p0
    :try_end_4d
    .catchall {:try_start_47 .. :try_end_4d} :catchall_4b

    throw v2

    .line 93
    :catchall_4e
    move-exception v2

    monitor-enter p0

    .line 94
    const/4 v3, 0x0

    :try_start_51
    iput-boolean v3, p0, Lcom/koushikdutta/async/SelectorWrapper;->isWaking:Z

    .line 95
    monitor-exit p0
    :try_end_54
    .catchall {:try_start_51 .. :try_end_54} :catchall_55

    throw v2

    :catchall_55
    move-exception v2

    :try_start_56
    monitor-exit p0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_55

    throw v2
.end method
