.class final Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker$1;
.super Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
.source "RateLimiter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 685
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker;-><init>()V

    return-void
.end method


# virtual methods
.method public read()J
    .registers 3

    .prologue
    .line 688
    invoke-static {}, Lcom/google/common/util/concurrent/RateLimiter$SleepingTicker$1;->systemTicker()Lcom/google/common/base/Ticker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    return-wide v0
.end method

.method public sleepMicrosUninterruptibly(J)V
    .registers 5
    .param p1, "micros"    # J

    .prologue
    .line 693
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_b

    .line 694
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p1, p2, v0}, Lcom/google/common/util/concurrent/Uninterruptibles;->sleepUninterruptibly(JLjava/util/concurrent/TimeUnit;)V

    .line 696
    :cond_b
    return-void
.end method
