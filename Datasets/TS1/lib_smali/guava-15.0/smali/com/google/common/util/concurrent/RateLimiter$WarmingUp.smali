.class Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;
.super Lcom/google/common/util/concurrent/RateLimiter;
.source "RateLimiter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/RateLimiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WarmingUp"
.end annotation


# instance fields
.field private halfPermits:D

.field private slope:D

.field final warmupPeriodMicros:J


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "ticker"    # Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
    .param p2, "warmupPeriod"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 608
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/util/concurrent/RateLimiter;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;Lcom/google/common/util/concurrent/RateLimiter$1;)V

    .line 609
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->warmupPeriodMicros:J

    .line 610
    return-void
.end method

.method private permitsToTime(D)D
    .registers 7
    .param p1, "permits"    # D

    .prologue
    .line 647
    iget-wide v0, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->stableIntervalMicros:D

    iget-wide v2, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->slope:D

    mul-double/2addr v2, p1

    add-double/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method doSetRate(DD)V
    .registers 15
    .param p1, "permitsPerSecond"    # D
    .param p3, "stableIntervalMicros"    # D

    .prologue
    const-wide/16 v8, 0x0

    .line 614
    iget-wide v2, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->maxPermits:D

    .line 615
    .local v2, "oldMaxPermits":D
    iget-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->warmupPeriodMicros:J

    long-to-double v4, v4

    div-double/2addr v4, p3

    iput-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->maxPermits:D

    .line 616
    iget-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->maxPermits:D

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v4, v6

    iput-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->halfPermits:D

    .line 618
    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    mul-double v0, p3, v4

    .line 619
    .local v0, "coldIntervalMicros":D
    sub-double v4, v0, p3

    iget-wide v6, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->halfPermits:D

    div-double/2addr v4, v6

    iput-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->slope:D

    .line 620
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, v2, v4

    if-nez v4, :cond_25

    .line 622
    iput-wide v8, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->storedPermits:D

    .line 628
    :goto_24
    return-void

    .line 624
    :cond_25
    cmpl-double v4, v2, v8

    if-nez v4, :cond_2e

    iget-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->maxPermits:D

    :goto_2b
    iput-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->storedPermits:D

    goto :goto_24

    :cond_2e
    iget-wide v4, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->storedPermits:D

    iget-wide v6, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->maxPermits:D

    mul-double/2addr v4, v6

    div-double/2addr v4, v2

    goto :goto_2b
.end method

.method storedPermitsToWaitTime(DD)J
    .registers 15
    .param p1, "storedPermits"    # D
    .param p3, "permitsToTake"    # D

    .prologue
    .line 632
    iget-wide v6, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->halfPermits:D

    sub-double v0, p1, v6

    .line 633
    .local v0, "availablePermitsAboveHalf":D
    const-wide/16 v2, 0x0

    .line 635
    .local v2, "micros":J
    const-wide/16 v6, 0x0

    cmpl-double v6, v0, v6

    if-lez v6, :cond_21

    .line 636
    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    .line 637
    .local v4, "permitsAboveHalfToTake":D
    invoke-direct {p0, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->permitsToTime(D)D

    move-result-wide v6

    sub-double v8, v0, v4

    invoke-direct {p0, v8, v9}, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->permitsToTime(D)D

    move-result-wide v8

    add-double/2addr v6, v8

    mul-double/2addr v6, v4

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    div-double/2addr v6, v8

    double-to-long v2, v6

    .line 639
    sub-double/2addr p3, v4

    .line 642
    .end local v4    # "permitsAboveHalfToTake":D
    :cond_21
    long-to-double v6, v2

    iget-wide v8, p0, Lcom/google/common/util/concurrent/RateLimiter$WarmingUp;->stableIntervalMicros:D

    mul-double/2addr v8, p3

    add-double/2addr v6, v8

    double-to-long v2, v6

    .line 643
    return-wide v2
.end method
