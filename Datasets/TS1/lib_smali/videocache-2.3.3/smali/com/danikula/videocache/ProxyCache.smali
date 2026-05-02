.class Lcom/danikula/videocache/ProxyCache;
.super Ljava/lang/Object;
.source "ProxyCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/ProxyCache$1;,
        Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;
    }
.end annotation


# static fields
.field private static final MAX_READ_SOURCE_ATTEMPTS:I = 0x1


# instance fields
.field private final cache:Lcom/danikula/videocache/Cache;

.field private volatile percentsAvailable:I

.field private final readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final source:Lcom/danikula/videocache/Source;

.field private volatile sourceReaderThread:Ljava/lang/Thread;

.field private final stopLock:Ljava/lang/Object;

.field private volatile stopped:Z

.field private final wc:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/danikula/videocache/Source;Lcom/danikula/videocache/Cache;)V
    .registers 4
    .param p1, "source"    # Lcom/danikula/videocache/Source;
    .param p2, "cache"    # Lcom/danikula/videocache/Cache;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 33
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/Source;

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    .line 34
    invoke-static {p2}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/Cache;

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    return-void
.end method

.method static synthetic access$100(Lcom/danikula/videocache/ProxyCache;)V
    .registers 1
    .param p0, "x0"    # Lcom/danikula/videocache/ProxyCache;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->readSource()V

    return-void
.end method

.method private checkReadSourceErrorsCount()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 56
    .local v0, "errorsCount":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_2e

    .line 57
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 58
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " times"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_2e
    return-void
.end method

.method private closeSource()V
    .registers 5

    .prologue
    .line 159
    :try_start_0
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v1}, Lcom/danikula/videocache/Source;->close()V
    :try_end_5
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_5} :catch_6

    .line 163
    :goto_5
    return-void

    .line 160
    :catch_6
    move-exception v0

    .line 161
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error closing source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method private isStopped()Z
    .registers 2

    .prologue
    .line 154
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private notifyNewCacheDataAvailable(JJ)V
    .registers 7
    .param p1, "cacheAvailable"    # J
    .param p3, "sourceAvailable"    # J

    .prologue
    .line 96
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/danikula/videocache/ProxyCache;->onCacheAvailable(JJ)V

    .line 98
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    monitor-enter v1

    .line 99
    :try_start_6
    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 100
    monitor-exit v1

    .line 101
    return-void

    .line 100
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_d

    throw v0
.end method

.method private readSource()V
    .registers 11

    .prologue
    .line 117
    const/4 v4, -0x1

    .line 118
    .local v4, "sourceAvailable":I
    const/4 v2, 0x0

    .line 120
    .local v2, "offset":I
    :try_start_2
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v5}, Lcom/danikula/videocache/Cache;->available()I

    move-result v2

    .line 121
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5, v2}, Lcom/danikula/videocache/Source;->open(I)V

    .line 122
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5}, Lcom/danikula/videocache/Source;->length()I

    move-result v4

    .line 123
    const/16 v5, 0x2000

    new-array v0, v5, [B

    .line 125
    .local v0, "buffer":[B
    :goto_17
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v5, v0}, Lcom/danikula/videocache/Source;->read([B)I

    move-result v3

    .local v3, "readBytes":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_5f

    .line 126
    iget-object v6, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_23} :catch_40
    .catchall {:try_start_2 .. :try_end_23} :catchall_55

    .line 127
    :try_start_23
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->isStopped()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 128
    monitor-exit v6
    :try_end_2a
    .catchall {:try_start_23 .. :try_end_2a} :catchall_52

    .line 140
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 141
    int-to-long v5, v2

    int-to-long v7, v4

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    .line 143
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :goto_32
    return-void

    .line 130
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :cond_33
    :try_start_33
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v5, v0, v3}, Lcom/danikula/videocache/Cache;->append([BI)V

    .line 131
    monitor-exit v6
    :try_end_39
    .catchall {:try_start_33 .. :try_end_39} :catchall_52

    .line 132
    add-int/2addr v2, v3

    .line 133
    int-to-long v5, v2

    int-to-long v7, v4

    :try_start_3c
    invoke-direct {p0, v5, v6, v7, v8}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3f} :catch_40
    .catchall {:try_start_3c .. :try_end_3f} :catchall_55

    goto :goto_17

    .line 136
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :catch_40
    move-exception v1

    .line 137
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_41
    iget-object v5, p0, Lcom/danikula/videocache/ProxyCache;->readSourceErrorsCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 138
    invoke-virtual {p0, v1}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V
    :try_end_49
    .catchall {:try_start_41 .. :try_end_49} :catchall_55

    .line 140
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 141
    int-to-long v5, v2

    int-to-long v7, v4

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    goto :goto_32

    .line 131
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :catchall_52
    move-exception v5

    :try_start_53
    monitor-exit v6
    :try_end_54
    .catchall {:try_start_53 .. :try_end_54} :catchall_52

    :try_start_54
    throw v5
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_55} :catch_40
    .catchall {:try_start_54 .. :try_end_55} :catchall_55

    .line 140
    .end local v0    # "buffer":[B
    .end local v3    # "readBytes":I
    :catchall_55
    move-exception v5

    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 141
    int-to-long v6, v2

    int-to-long v8, v4

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    throw v5

    .line 135
    .restart local v0    # "buffer":[B
    .restart local v3    # "readBytes":I
    :cond_5f
    :try_start_5f
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->tryComplete()V
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_62} :catch_40
    .catchall {:try_start_5f .. :try_end_62} :catchall_55

    .line 140
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->closeSource()V

    .line 141
    int-to-long v5, v2

    int-to-long v7, v4

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/danikula/videocache/ProxyCache;->notifyNewCacheDataAvailable(JJ)V

    goto :goto_32
.end method

.method private declared-synchronized readSourceAsync()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 78
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    if-eqz v1, :cond_47

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v1

    sget-object v2, Ljava/lang/Thread$State;->TERMINATED:Ljava/lang/Thread$State;

    if-eq v1, v2, :cond_47

    const/4 v0, 0x1

    .line 79
    .local v0, "readingInProgress":Z
    :goto_10
    iget-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-nez v1, :cond_45

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_45

    if-nez v0, :cond_45

    .line 80
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/danikula/videocache/ProxyCache$SourceReaderRunnable;-><init>(Lcom/danikula/videocache/ProxyCache;Lcom/danikula/videocache/ProxyCache$1;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Source reader for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    .line 81
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_45
    .catchall {:try_start_1 .. :try_end_45} :catchall_49

    .line 83
    :cond_45
    monitor-exit p0

    return-void

    .line 78
    .end local v0    # "readingInProgress":Z
    :cond_47
    const/4 v0, 0x0

    goto :goto_10

    :catchall_49
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private tryComplete()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v1

    .line 147
    :try_start_3
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->isStopped()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v0}, Lcom/danikula/videocache/Cache;->available()I

    move-result v0

    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-interface {v2}, Lcom/danikula/videocache/Source;->length()I

    move-result v2

    if-ne v0, v2, :cond_1c

    .line 148
    iget-object v0, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v0}, Lcom/danikula/videocache/Cache;->complete()V

    .line 150
    :cond_1c
    monitor-exit v1

    .line 151
    return-void

    .line 150
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method private waitForSourceData()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    monitor-enter v2

    .line 88
    :try_start_3
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->wc:Ljava/lang/Object;

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v3, v4}, Ljava/lang/Object;->wait(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_a} :catch_c
    .catchall {:try_start_3 .. :try_end_a} :catchall_15

    .line 92
    :try_start_a
    monitor-exit v2

    .line 93
    return-void

    .line 89
    :catch_c
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string v3, "Waiting source data is interrupted!"

    invoke-direct {v1, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 92
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_15
    move-exception v1

    monitor-exit v2
    :try_end_17
    .catchall {:try_start_a .. :try_end_17} :catchall_15

    throw v1
.end method


# virtual methods
.method protected onCacheAvailable(JJ)V
    .registers 11
    .param p1, "cacheAvailable"    # J
    .param p3, "sourceAvailable"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 104
    const-wide/16 v4, 0x64

    mul-long/2addr v4, p1

    div-long/2addr v4, p3

    long-to-int v0, v4

    .line 105
    .local v0, "percents":I
    iget v4, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    if-eq v0, v4, :cond_1c

    move v1, v2

    .line 106
    .local v1, "percentsChanged":Z
    :goto_c
    const-wide/16 v4, 0x0

    cmp-long v4, p3, v4

    if-ltz v4, :cond_1e

    .line 107
    .local v2, "sourceLengthKnown":Z
    :goto_12
    if-eqz v2, :cond_19

    if-eqz v1, :cond_19

    .line 108
    invoke-virtual {p0, v0}, Lcom/danikula/videocache/ProxyCache;->onCachePercentsAvailableChanged(I)V

    .line 110
    :cond_19
    iput v0, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 111
    return-void

    .end local v1    # "percentsChanged":Z
    .end local v2    # "sourceLengthKnown":Z
    :cond_1c
    move v1, v3

    .line 105
    goto :goto_c

    .restart local v1    # "percentsChanged":Z
    :cond_1e
    move v2, v3

    .line 106
    goto :goto_12
.end method

.method protected onCachePercentsAvailableChanged(I)V
    .registers 2
    .param p1, "percentsAvailable"    # I

    .prologue
    .line 114
    return-void
.end method

.method protected final onError(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 166
    instance-of v0, p1, Lcom/danikula/videocache/InterruptedProxyCacheException;

    .line 167
    .local v0, "interruption":Z
    if-eqz v0, :cond_c

    .line 168
    const-string v1, "ProxyCache"

    const-string v2, "ProxyCache is interrupted"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    :goto_b
    return-void

    .line 170
    :cond_c
    const-string v1, "ProxyCache"

    const-string v2, "ProxyCache error"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method

.method public read([BJI)I
    .registers 11
    .param p1, "buffer"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x64

    .line 39
    invoke-static {p1, p2, p3, p4}, Lcom/danikula/videocache/ProxyCacheUtils;->assertBuffer([BJI)V

    .line 41
    :goto_5
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_28

    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->available()I

    move-result v1

    int-to-long v1, v1

    int-to-long v3, p4

    add-long/2addr v3, p2

    cmp-long v1, v1, v3

    if-gez v1, :cond_28

    iget-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    if-nez v1, :cond_28

    .line 42
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->readSourceAsync()V

    .line 43
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->waitForSourceData()V

    .line 44
    invoke-direct {p0}, Lcom/danikula/videocache/ProxyCache;->checkReadSourceErrorsCount()V

    goto :goto_5

    .line 46
    :cond_28
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1, p1, p2, p3, p4}, Lcom/danikula/videocache/Cache;->read([BJI)I

    move-result v0

    .line 47
    .local v0, "read":I
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_3f

    iget v1, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    if-eq v1, v5, :cond_3f

    .line 48
    iput v5, p0, Lcom/danikula/videocache/ProxyCache;->percentsAvailable:I

    .line 49
    invoke-virtual {p0, v5}, Lcom/danikula/videocache/ProxyCache;->onCachePercentsAvailableChanged(I)V

    .line 51
    :cond_3f
    return v0
.end method

.method public shutdown()V
    .registers 6

    .prologue
    .line 63
    iget-object v2, p0, Lcom/danikula/videocache/ProxyCache;->stopLock:Ljava/lang/Object;

    monitor-enter v2

    .line 64
    :try_start_3
    const-string v1, "ProxyCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Shutdown proxy for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/danikula/videocache/ProxyCache;->source:Lcom/danikula/videocache/Source;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_35

    .line 66
    const/4 v1, 0x1

    :try_start_1e
    iput-boolean v1, p0, Lcom/danikula/videocache/ProxyCache;->stopped:Z

    .line 67
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    if-eqz v1, :cond_29

    .line 68
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->sourceReaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 70
    :cond_29
    iget-object v1, p0, Lcom/danikula/videocache/ProxyCache;->cache:Lcom/danikula/videocache/Cache;

    invoke-interface {v1}, Lcom/danikula/videocache/Cache;->close()V
    :try_end_2e
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_1e .. :try_end_2e} :catch_30
    .catchall {:try_start_1e .. :try_end_2e} :catchall_35

    .line 74
    :goto_2e
    :try_start_2e
    monitor-exit v2

    .line 75
    return-void

    .line 71
    :catch_30
    move-exception v0

    .line 72
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    invoke-virtual {p0, v0}, Lcom/danikula/videocache/ProxyCache;->onError(Ljava/lang/Throwable;)V

    goto :goto_2e

    .line 74
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_35
    move-exception v1

    monitor-exit v2
    :try_end_37
    .catchall {:try_start_2e .. :try_end_37} :catchall_35

    throw v1
.end method
