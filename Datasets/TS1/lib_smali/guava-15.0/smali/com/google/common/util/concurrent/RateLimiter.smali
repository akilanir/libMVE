.class public abstract Lcom/google/common/util/concurrent/RateLimiter;
.super Ljava/lang/Object;
.source "RateLimiter.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/RateLimiter$1;,
        Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;,
        Lcom/google/common/util/concurrent/RateLimiter$Bursty;,
        Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field maxPermits:D

.field private final mutex:Ljava/lang/Object;

.field private nextFreeTicketMicros:J

.field private final offsetNanos:J

.field volatile stableIntervalMicros:D

.field storedPermits:D

.field private final ticker:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;


# direct methods
.method private constructor <init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;)V
    .registers 4
    .param p1, "ticker"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutex:Ljava/lang/Object;

    .line 329
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    .line 332
    iput-object p1, p0, Lcom/google/common/util/concurrent/RateLimiter;->ticker:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    .line 333
    invoke-virtual {p1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->read()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->offsetNanos:J

    .line 334
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;Lcom/google/common/util/concurrent/RateLimiter$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
    .param p2, "x1"    # Lcom/google/common/util/concurrent/RateLimiter$1;

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/RateLimiter;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;)V

    return-void
.end method

.method private static checkPermits(I)V
    .registers 3
    .param p0, "permits"    # I

    .prologue
    .line 474
    if-lez p0, :cond_9

    const/4 v0, 0x1

    :goto_3
    const-string v1, "Requested permits must be positive"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 475
    return-void

    .line 474
    :cond_9
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static create(D)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 3
    .param p0, "permitsPerSecond"    # D

    .prologue
    .line 242
    sget-object v0, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->SYSTEM_TICKER:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    invoke-static {v0, p0, p1}, Lcom/google/common/util/concurrent/RateLimiter;->create(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;D)Lcom/google/common/util/concurrent/RateLimiter;

    move-result-object v0

    return-object v0
.end method

.method public static create(DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 11
    .param p0, "permitsPerSecond"    # D
    .param p2, "warmupPeriod"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 275
    sget-object v0, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->SYSTEM_TICKER:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    move-wide v1, p0

    move-wide v3, p2

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/google/common/util/concurrent/RateLimiter;->create(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;

    move-result-object v0

    return-object v0
.end method

.method static create(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;D)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 6
    .param p0, "ticker"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
    .param p1, "permitsPerSecond"    # D
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 247
    new-instance v0, Lcom/google/common/util/concurrent/RateLimiter$Bursty;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-direct {v0, p0, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter$Bursty;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;D)V

    .line 248
    .local v0, "rateLimiter":Lcom/google/common/util/concurrent/RateLimiter;
    invoke-virtual {v0, p1, p2}, Lcom/google/common/util/concurrent/RateLimiter;->setRate(D)V

    .line 249
    return-object v0
.end method

.method static create(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 7
    .param p0, "ticker"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
    .param p1, "permitsPerSecond"    # D
    .param p3, "warmupPeriod"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 281
    new-instance v0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;

    invoke-direct {v0, p0, p3, p4, p5}, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;JLjava/util/concurrent/TimeUnit;)V

    .line 282
    .local v0, "rateLimiter":Lcom/google/common/util/concurrent/RateLimiter;
    invoke-virtual {v0, p1, p2}, Lcom/google/common/util/concurrent/RateLimiter;->setRate(D)V

    .line 283
    return-object v0
.end method

.method static createWithCapacity(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 13
    .param p0, "ticker"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
    .param p1, "permitsPerSecond"    # D
    .param p3, "maxBurstBuildup"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 289
    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v3

    long-to-double v3, v3

    const-wide v5, 0x41cdcd6500000000L    # 1.0E9

    div-double v0, v3, v5

    .line 290
    .local v0, "maxBurstSeconds":D
    new-instance v2, Lcom/google/common/util/concurrent/RateLimiter$Bursty;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter$Bursty;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;D)V

    .line 291
    .local v2, "rateLimiter":Lcom/google/common/util/concurrent/RateLimiter$Bursty;
    invoke-virtual {v2, p1, p2}, Lcom/google/common/util/concurrent/RateLimiter$Bursty;->setRate(D)V

    .line 292
    return-object v2
.end method

.method private readSafeMicros()J
    .registers 6

    .prologue
    .line 514
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v1, p0, Lcom/google/common/util/concurrent/RateLimiter;->ticker:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->read()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/google/common/util/concurrent/RateLimiter;->offsetNanos:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v0

    return-wide v0
.end method

.method private reserveNextTicket(DJ)J
    .registers 19
    .param p1, "requiredPermits"    # D
    .param p3, "nowMicros"    # J

    .prologue
    .line 481
    move-wide/from16 v0, p3

    invoke-direct {p0, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter;->resync(J)V

    .line 482
    iget-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    sub-long v4, v10, p3

    .line 483
    .local v4, "microsToNextFreeTicket":J
    iget-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    move-wide v0, p1

    invoke-static {v0, v1, v10, v11}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    .line 484
    .local v6, "storedPermitsToSpend":D
    sub-double v2, p1, v6

    .line 486
    .local v2, "freshPermits":D
    iget-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    invoke-virtual {p0, v10, v11, v6, v7}, Lcom/google/common/util/concurrent/RateLimiter;->storedPermitsToWaitTime(DD)J

    move-result-wide v10

    iget-wide v12, p0, Lcom/google/common/util/concurrent/RateLimiter;->stableIntervalMicros:D

    mul-double/2addr v12, v2

    double-to-long v12, v12

    add-long v8, v10, v12

    .line 489
    .local v8, "waitMicros":J
    iget-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    add-long/2addr v10, v8

    iput-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    .line 490
    iget-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    sub-double/2addr v10, v6

    iput-wide v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    .line 491
    return-wide v4
.end method

.method private resync(J)V
    .registers 11
    .param p1, "nowMicros"    # J

    .prologue
    .line 506
    iget-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_1b

    .line 507
    iget-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->maxPermits:D

    iget-wide v2, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    iget-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    sub-long v4, p1, v4

    long-to-double v4, v4

    iget-wide v6, p0, Lcom/google/common/util/concurrent/RateLimiter;->stableIntervalMicros:D

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->storedPermits:D

    .line 509
    iput-wide p1, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    .line 511
    :cond_1b
    return-void
.end method


# virtual methods
.method public acquire()V
    .registers 2

    .prologue
    .line 384
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/RateLimiter;->acquire(I)V

    .line 385
    return-void
.end method

.method public acquire(I)V
    .registers 10
    .param p1, "permits"    # I

    .prologue
    .line 394
    invoke-static {p1}, Lcom/google/common/util/concurrent/RateLimiter;->checkPermits(I)V

    .line 396
    iget-object v3, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutex:Ljava/lang/Object;

    monitor-enter v3

    .line 397
    int-to-double v4, p1

    :try_start_7
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->readSafeMicros()J

    move-result-wide v6

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/google/common/util/concurrent/RateLimiter;->reserveNextTicket(DJ)J

    move-result-wide v0

    .line 398
    .local v0, "microsToWait":J
    monitor-exit v3
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_16

    .line 399
    iget-object v2, p0, Lcom/google/common/util/concurrent/RateLimiter;->ticker:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    invoke-virtual {v2, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->sleepMicrosUninterruptibly(J)V

    .line 400
    return-void

    .line 398
    .end local v0    # "microsToWait":J
    :catchall_16
    move-exception v2

    :try_start_17
    monitor-exit v3
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v2
.end method

.method abstract doSetRate(DD)V
.end method

.method public final getRate()D
    .registers 5

    .prologue
    .line 375
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v0

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/google/common/util/concurrent/RateLimiter;->stableIntervalMicros:D

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public final setRate(D)V
    .registers 9
    .param p1, "permitsPerSecond"    # D

    .prologue
    .line 355
    const-wide/16 v2, 0x0

    cmpl-double v2, p1, v2

    if-lez v2, :cond_2e

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_2e

    const/4 v2, 0x1

    :goto_d
    const-string v3, "rate must be positive"

    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 357
    iget-object v3, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutex:Ljava/lang/Object;

    monitor-enter v3

    .line 358
    :try_start_15
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->readSafeMicros()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/google/common/util/concurrent/RateLimiter;->resync(J)V

    .line 359
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v4

    long-to-double v4, v4

    div-double v0, v4, p1

    .line 360
    .local v0, "stableIntervalMicros":D
    iput-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->stableIntervalMicros:D

    .line 361
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter;->doSetRate(DD)V

    .line 362
    monitor-exit v3

    .line 363
    return-void

    .line 355
    .end local v0    # "stableIntervalMicros":D
    :cond_2e
    const/4 v2, 0x0

    goto :goto_d

    .line 362
    :catchall_30
    move-exception v2

    monitor-exit v3
    :try_end_32
    .catchall {:try_start_15 .. :try_end_32} :catchall_30

    throw v2
.end method

.method abstract storedPermitsToWaitTime(DD)J
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    .line 519
    const-string v0, "RateLimiter[stableRate=%3.1fqps]"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-wide v3, 0x412e848000000000L    # 1000000.0

    iget-wide v5, p0, Lcom/google/common/util/concurrent/RateLimiter;->stableIntervalMicros:D

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public tryAcquire()Z
    .registers 5

    .prologue
    .line 443
    const/4 v0, 0x1

    const-wide/16 v1, 0x0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method

.method public tryAcquire(I)Z
    .registers 5
    .param p1, "permits"    # I

    .prologue
    .line 429
    const-wide/16 v0, 0x0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method

.method public tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z
    .registers 20
    .param p1, "permits"    # I
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 458
    move-object/from16 v0, p4

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v7

    .line 459
    .local v7, "timeoutMicros":J
    invoke-static/range {p1 .. p1}, Lcom/google/common/util/concurrent/RateLimiter;->checkPermits(I)V

    .line 461
    iget-object v10, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutex:Ljava/lang/Object;

    monitor-enter v10

    .line 462
    :try_start_e
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->readSafeMicros()J

    move-result-wide v5

    .line 463
    .local v5, "nowMicros":J
    iget-wide v11, p0, Lcom/google/common/util/concurrent/RateLimiter;->nextFreeTicketMicros:J

    add-long v13, v5, v7

    cmp-long v9, v11, v13

    if-lez v9, :cond_1d

    .line 464
    const/4 v9, 0x0

    monitor-exit v10

    .line 470
    :goto_1c
    return v9

    .line 466
    :cond_1d
    move/from16 v0, p1

    int-to-double v11, v0

    invoke-direct {p0, v11, v12, v5, v6}, Lcom/google/common/util/concurrent/RateLimiter;->reserveNextTicket(DJ)J

    move-result-wide v3

    .line 468
    .local v3, "microsToWait":J
    monitor-exit v10
    :try_end_25
    .catchall {:try_start_e .. :try_end_25} :catchall_2c

    .line 469
    iget-object v9, p0, Lcom/google/common/util/concurrent/RateLimiter;->ticker:Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;

    invoke-virtual {v9, v3, v4}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;->sleepMicrosUninterruptibly(J)V

    .line 470
    const/4 v9, 0x1

    goto :goto_1c

    .line 468
    .end local v3    # "microsToWait":J
    .end local v5    # "nowMicros":J
    :catchall_2c
    move-exception v9

    :try_start_2d
    monitor-exit v10
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v9
.end method

.method public tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 415
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    return v0
.end method
