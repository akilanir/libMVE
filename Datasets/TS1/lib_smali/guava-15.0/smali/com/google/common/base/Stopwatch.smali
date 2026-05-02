.class public final Lcom/google/common/base/Stopwatch;
.super Ljava/lang/Object;
.source "Stopwatch.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/base/Stopwatch$1;
    }
.end annotation


# instance fields
.field private elapsedNanos:J

.field private isRunning:Z

.field private startTick:J

.field private final ticker:Lcom/google/common/base/Ticker;


# direct methods
.method public constructor <init>()V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 131
    invoke-static {}, Lcom/google/common/base/Ticker;->systemTicker()Lcom/google/common/base/Ticker;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/base/Stopwatch;-><init>(Lcom/google/common/base/Ticker;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Lcom/google/common/base/Ticker;)V
    .registers 3
    .param p1, "ticker"    # Lcom/google/common/base/Ticker;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    const-string v0, "ticker"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/Ticker;

    iput-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    .line 144
    return-void
.end method

.method private static abbreviate(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;
    .registers 3
    .param p0, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 279
    sget-object v0, Lcom/google/common/base/Stopwatch$1;->$SwitchMap$java$util$concurrent$TimeUnit:[I

    invoke-virtual {p0}, Ljava/util/concurrent/TimeUnit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_26

    .line 295
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 281
    :pswitch_11
    const-string v0, "ns"

    .line 293
    :goto_13
    return-object v0

    .line 283
    :pswitch_14
    const-string v0, "\u03bcs"

    goto :goto_13

    .line 285
    :pswitch_17
    const-string v0, "ms"

    goto :goto_13

    .line 287
    :pswitch_1a
    const-string v0, "s"

    goto :goto_13

    .line 289
    :pswitch_1d
    const-string v0, "min"

    goto :goto_13

    .line 291
    :pswitch_20
    const-string v0, "h"

    goto :goto_13

    .line 293
    :pswitch_23
    const-string v0, "d"

    goto :goto_13

    .line 279
    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_23
    .end packed-switch
.end method

.method private static chooseUnit(J)Ljava/util/concurrent/TimeUnit;
    .registers 6
    .param p0, "nanos"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 257
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_11

    .line 258
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    .line 275
    :goto_10
    return-object v0

    .line 260
    :cond_11
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_20

    .line 261
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    goto :goto_10

    .line 263
    :cond_20
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2f

    .line 264
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    goto :goto_10

    .line 266
    :cond_2f
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3e

    .line 267
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_10

    .line 269
    :cond_3e
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_4d

    .line 270
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_10

    .line 272
    :cond_4d
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_5c

    .line 273
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_10

    .line 275
    :cond_5c
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_10
.end method

.method public static createStarted()Lcom/google/common/base/Stopwatch;
    .registers 1

    .prologue
    .line 109
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0}, Lcom/google/common/base/Stopwatch;-><init>()V

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    move-result-object v0

    return-object v0
.end method

.method public static createStarted(Lcom/google/common/base/Ticker;)Lcom/google/common/base/Stopwatch;
    .registers 2
    .param p0, "ticker"    # Lcom/google/common/base/Ticker;

    .prologue
    .line 119
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0, p0}, Lcom/google/common/base/Stopwatch;-><init>(Lcom/google/common/base/Ticker;)V

    invoke-virtual {v0}, Lcom/google/common/base/Stopwatch;->start()Lcom/google/common/base/Stopwatch;

    move-result-object v0

    return-object v0
.end method

.method public static createUnstarted()Lcom/google/common/base/Stopwatch;
    .registers 1

    .prologue
    .line 89
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0}, Lcom/google/common/base/Stopwatch;-><init>()V

    return-object v0
.end method

.method public static createUnstarted(Lcom/google/common/base/Ticker;)Lcom/google/common/base/Stopwatch;
    .registers 2
    .param p0, "ticker"    # Lcom/google/common/base/Ticker;

    .prologue
    .line 99
    new-instance v0, Lcom/google/common/base/Stopwatch;

    invoke-direct {v0, p0}, Lcom/google/common/base/Stopwatch;-><init>(Lcom/google/common/base/Ticker;)V

    return-object v0
.end method

.method private elapsedNanos()J
    .registers 5

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    add-long/2addr v0, v2

    :goto_10
    return-wide v0

    :cond_11
    iget-wide v0, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    goto :goto_10
.end method


# virtual methods
.method public elapsed(Ljava/util/concurrent/TimeUnit;)J
    .registers 5
    .param p1, "desiredUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 210
    invoke-direct {p0}, Lcom/google/common/base/Stopwatch;->elapsedNanos()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public elapsedMillis()J
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 239
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0}, Lcom/google/common/base/Stopwatch;->elapsed(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public elapsedTime(Ljava/util/concurrent/TimeUnit;)J
    .registers 4
    .param p1, "desiredUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 226
    invoke-virtual {p0, p1}, Lcom/google/common/base/Stopwatch;->elapsed(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 152
    iget-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    return v0
.end method

.method public reset()Lcom/google/common/base/Stopwatch;
    .registers 3

    .prologue
    .line 190
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    .line 191
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    .line 192
    return-object p0
.end method

.method public start()Lcom/google/common/base/Stopwatch;
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 162
    iget-boolean v0, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    if-nez v0, :cond_16

    move v0, v1

    :goto_6
    const-string v2, "This stopwatch is already running."

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 163
    iput-boolean v1, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    .line 164
    iget-object v0, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    .line 165
    return-object p0

    .line 162
    :cond_16
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public stop()Lcom/google/common/base/Stopwatch;
    .registers 7

    .prologue
    .line 176
    iget-object v2, p0, Lcom/google/common/base/Stopwatch;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v2}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 177
    .local v0, "tick":J
    iget-boolean v2, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    const-string v3, "This stopwatch is already stopped."

    invoke-static {v2, v3}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 178
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/common/base/Stopwatch;->isRunning:Z

    .line 179
    iget-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    iget-wide v4, p0, Lcom/google/common/base/Stopwatch;->startTick:J

    sub-long v4, v0, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/common/base/Stopwatch;->elapsedNanos:J

    .line 180
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 11
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "String.format()"
    .end annotation

    .prologue
    .line 247
    invoke-direct {p0}, Lcom/google/common/base/Stopwatch;->elapsedNanos()J

    move-result-wide v0

    .line 249
    .local v0, "nanos":J
    invoke-static {v0, v1}, Lcom/google/common/base/Stopwatch;->chooseUnit(J)Ljava/util/concurrent/TimeUnit;

    move-result-object v2

    .line 250
    .local v2, "unit":Ljava/util/concurrent/TimeUnit;
    long-to-double v5, v0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v8, 0x1

    invoke-virtual {v7, v8, v9, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v7

    long-to-double v7, v7

    div-double v3, v5, v7

    .line 253
    .local v3, "value":D
    const-string v5, "%.4g %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v2}, Lcom/google/common/base/Stopwatch;->abbreviate(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
