.class public final Lcom/google/common/util/concurrent/Uninterruptibles;
.super Ljava/lang/Object;
.source "Uninterruptibles.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V
    .registers 5
    .param p0, "latch"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 53
    const/4 v1, 0x0

    .line 57
    .local v1, "interrupted":Z
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_e
    .catchall {:try_start_1 .. :try_end_4} :catchall_11

    .line 64
    if-eqz v1, :cond_d

    .line 65
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    :cond_d
    return-void

    .line 59
    :catch_e
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 61
    goto :goto_1

    .line 64
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_11
    move-exception v2

    if-eqz v1, :cond_1b

    .line 65
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_1b
    throw v2
.end method

.method public static awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;JLjava/util/concurrent/TimeUnit;)Z
    .registers 12
    .param p0, "latch"    # Ljava/util/concurrent/CountDownLatch;
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 77
    const/4 v3, 0x0

    .line 79
    .local v3, "interrupted":Z
    :try_start_1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 80
    .local v4, "remainingNanos":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_24

    move-result-wide v6

    add-long v1, v6, v4

    .line 85
    .local v1, "end":J
    :goto_b
    :try_start_b
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v4, v5, v6}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_10} :catch_1b
    .catchall {:try_start_b .. :try_end_10} :catchall_24

    move-result v6

    .line 92
    if-eqz v3, :cond_1a

    .line 93
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_1a
    return v6

    .line 86
    :catch_1b
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 88
    :try_start_1d
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_24

    move-result-wide v6

    sub-long v4, v1, v6

    .line 89
    goto :goto_b

    .line 92
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "end":J
    .end local v4    # "remainingNanos":J
    :catchall_24
    move-exception v6

    if-eqz v3, :cond_2e

    .line 93
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_2e
    throw v6
.end method

.method public static getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TV;>;"
    const/4 v1, 0x0

    .line 137
    .local v1, "interrupted":Z
    :goto_1
    :try_start_1
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_f
    .catchall {:try_start_1 .. :try_end_4} :catchall_12

    move-result-object v2

    .line 143
    if-eqz v1, :cond_e

    .line 144
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_e
    return-object v2

    .line 138
    :catch_f
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 140
    goto :goto_1

    .line 143
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_12
    move-exception v2

    if-eqz v1, :cond_1c

    .line 144
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_1c
    throw v2
.end method

.method public static getUninterruptibly(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 12
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<TV;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 165
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TV;>;"
    const/4 v3, 0x0

    .line 167
    .local v3, "interrupted":Z
    :try_start_1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 168
    .local v4, "remainingNanos":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_24

    move-result-wide v6

    add-long v1, v6, v4

    .line 173
    .local v1, "end":J
    :goto_b
    :try_start_b
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v4, v5, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_10} :catch_1b
    .catchall {:try_start_b .. :try_end_10} :catchall_24

    move-result-object v6

    .line 180
    if-eqz v3, :cond_1a

    .line 181
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_1a
    return-object v6

    .line 174
    :catch_1b
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 176
    :try_start_1d
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_24

    move-result-wide v6

    sub-long v4, v1, v6

    .line 177
    goto :goto_b

    .line 180
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "end":J
    .end local v4    # "remainingNanos":J
    :catchall_24
    move-exception v6

    if-eqz v3, :cond_2e

    .line 181
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_2e
    throw v6
.end method

.method public static joinUninterruptibly(Ljava/lang/Thread;)V
    .registers 5
    .param p0, "toJoin"    # Ljava/lang/Thread;

    .prologue
    .line 102
    const/4 v1, 0x0

    .line 106
    .local v1, "interrupted":Z
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_e
    .catchall {:try_start_1 .. :try_end_4} :catchall_11

    .line 113
    if-eqz v1, :cond_d

    .line 114
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    :cond_d
    return-void

    .line 108
    :catch_e
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 110
    goto :goto_1

    .line 113
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_11
    move-exception v2

    if-eqz v1, :cond_1b

    .line 114
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_1b
    throw v2
.end method

.method public static joinUninterruptibly(Ljava/lang/Thread;JLjava/util/concurrent/TimeUnit;)V
    .registers 12
    .param p0, "toJoin"    # Ljava/lang/Thread;
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 193
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const/4 v3, 0x0

    .line 196
    .local v3, "interrupted":Z
    :try_start_4
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 197
    .local v4, "remainingNanos":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_26

    move-result-wide v6

    add-long v1, v6, v4

    .line 201
    .local v1, "end":J
    :goto_e
    :try_start_e
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, p0, v4, v5}, Ljava/util/concurrent/TimeUnit;->timedJoin(Ljava/lang/Thread;J)V
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_13} :catch_1d
    .catchall {:try_start_e .. :try_end_13} :catchall_26

    .line 209
    if-eqz v3, :cond_1c

    .line 210
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    :cond_1c
    return-void

    .line 203
    :catch_1d
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 205
    :try_start_1f
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_22
    .catchall {:try_start_1f .. :try_end_22} :catchall_26

    move-result-wide v6

    sub-long v4, v1, v6

    .line 206
    goto :goto_e

    .line 209
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "end":J
    .end local v4    # "remainingNanos":J
    :catchall_26
    move-exception v6

    if-eqz v3, :cond_30

    .line 210
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_30
    throw v6
.end method

.method public static putUninterruptibly(Ljava/util/concurrent/BlockingQueue;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/BlockingQueue",
            "<TE;>;TE;)V"
        }
    .end annotation

    .prologue
    .line 245
    .local p0, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    const/4 v1, 0x0

    .line 249
    .local v1, "interrupted":Z
    :goto_1
    :try_start_1
    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_e
    .catchall {:try_start_1 .. :try_end_4} :catchall_11

    .line 256
    if-eqz v1, :cond_d

    .line 257
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    :cond_d
    return-void

    .line 251
    :catch_e
    move-exception v0

    .line 252
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 253
    goto :goto_1

    .line 256
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_11
    move-exception v2

    if-eqz v1, :cond_1b

    .line 257
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_1b
    throw v2
.end method

.method public static sleepUninterruptibly(JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p0, "sleepFor"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 268
    const/4 v3, 0x0

    .line 270
    .local v3, "interrupted":Z
    :try_start_1
    invoke-virtual {p2, p0, p1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 271
    .local v4, "remainingNanos":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_23

    move-result-wide v6

    add-long v1, v6, v4

    .line 275
    .local v1, "end":J
    :goto_b
    :try_start_b
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v4, v5}, Ljava/util/concurrent/TimeUnit;->sleep(J)V
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_10} :catch_1a
    .catchall {:try_start_b .. :try_end_10} :catchall_23

    .line 283
    if-eqz v3, :cond_19

    .line 284
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    :cond_19
    return-void

    .line 277
    :catch_1a
    move-exception v0

    .line 278
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 279
    :try_start_1c
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_23

    move-result-wide v6

    sub-long v4, v1, v6

    .line 280
    goto :goto_b

    .line 283
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "end":J
    .end local v4    # "remainingNanos":J
    :catchall_23
    move-exception v6

    if-eqz v3, :cond_2d

    .line 284
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_2d
    throw v6
.end method

.method public static takeUninterruptibly(Ljava/util/concurrent/BlockingQueue;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/BlockingQueue",
            "<TE;>;)TE;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<TE;>;"
    const/4 v1, 0x0

    .line 223
    .local v1, "interrupted":Z
    :goto_1
    :try_start_1
    invoke-interface {p0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_f
    .catchall {:try_start_1 .. :try_end_4} :catchall_12

    move-result-object v2

    .line 229
    if-eqz v1, :cond_e

    .line 230
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_e
    return-object v2

    .line 224
    :catch_f
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 226
    goto :goto_1

    .line 229
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_12
    move-exception v2

    if-eqz v1, :cond_1c

    .line 230
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    :cond_1c
    throw v2
.end method

.method public static tryAcquireUninterruptibly(Ljava/util/concurrent/Semaphore;IJLjava/util/concurrent/TimeUnit;)Z
    .registers 13
    .param p0, "semaphore"    # Ljava/util/concurrent/Semaphore;
    .param p1, "permits"    # I
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 308
    const/4 v3, 0x0

    .line 310
    .local v3, "interrupted":Z
    :try_start_1
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 311
    .local v4, "remainingNanos":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_24

    move-result-wide v6

    add-long v1, v6, v4

    .line 316
    .local v1, "end":J
    :goto_b
    :try_start_b
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, p1, v4, v5, v6}, Ljava/util/concurrent/Semaphore;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_10} :catch_1b
    .catchall {:try_start_b .. :try_end_10} :catchall_24

    move-result v6

    .line 323
    if-eqz v3, :cond_1a

    .line 324
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_1a
    return v6

    .line 317
    :catch_1b
    move-exception v0

    .line 318
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v3, 0x1

    .line 319
    :try_start_1d
    invoke-static {}, Ljava/lang/System;->nanoTime()J
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_24

    move-result-wide v6

    sub-long v4, v1, v6

    .line 320
    goto :goto_b

    .line 323
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "end":J
    .end local v4    # "remainingNanos":J
    :catchall_24
    move-exception v6

    if-eqz v3, :cond_2e

    .line 324
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    :cond_2e
    throw v6
.end method

.method public static tryAcquireUninterruptibly(Ljava/util/concurrent/Semaphore;JLjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .param p0, "semaphore"    # Ljava/util/concurrent/Semaphore;
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 297
    const/4 v0, 0x1

    invoke-static {p0, v0, p1, p2, p3}, Lcom/google/common/util/concurrent/Uninterruptibles;->tryAcquireUninterruptibly(Ljava/util/concurrent/Semaphore;IJLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method
