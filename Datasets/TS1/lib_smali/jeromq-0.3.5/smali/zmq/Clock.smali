.class public Lzmq/Clock;
.super Ljava/lang/Object;
.source "Clock.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static nowMS()J
    .registers 2

    .prologue
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static nowUS()J
    .registers 4

    .prologue
    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public static rdtsc()J
    .registers 2

    .prologue
    .line 50
    const-wide/16 v0, 0x0

    return-wide v0
.end method
