.class public Lch/qos/logback/core/util/CachingDateFormatter;
.super Ljava/lang/Object;


# instance fields
.field cachedStr:Ljava/lang/String;

.field lastTimestamp:J

.field final sdf:Ljava/text/SimpleDateFormat;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->lastTimestamp:J

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->cachedStr:Ljava/lang/String;

    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method


# virtual methods
.method public final format(J)Ljava/lang/String;
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->lastTimestamp:J

    cmp-long v0, p1, v0

    if-eqz v0, :cond_16

    iput-wide p1, p0, Lch/qos/logback/core/util/CachingDateFormatter;->lastTimestamp:J

    iget-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->sdf:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->cachedStr:Ljava/lang/String;

    :cond_16
    iget-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->cachedStr:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    :catchall_1a
    move-exception v0

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/util/CachingDateFormatter;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method
