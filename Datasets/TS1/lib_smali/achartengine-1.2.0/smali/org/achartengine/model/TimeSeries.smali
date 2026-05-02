.class public Lorg/achartengine/model/TimeSeries;
.super Lorg/achartengine/model/XYSeries;
.source "TimeSeries.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/achartengine/model/XYSeries;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Ljava/util/Date;D)V
    .registers 6
    .param p1, "x"    # Ljava/util/Date;
    .param p2, "y"    # D

    .prologue
    .line 41
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-super {p0, v0, v1, p2, p3}, Lorg/achartengine/model/XYSeries;->add(DD)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 42
    monitor-exit p0

    return-void

    .line 41
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getPadding(D)D
    .registers 5
    .param p1, "x"    # D

    .prologue
    .line 45
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    return-wide v0
.end method
