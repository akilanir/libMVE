.class public Lch/qos/logback/classic/pattern/SyslogStartConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# instance fields
.field facility:I

.field lastTimestamp:J

.field final localHostName:Ljava/lang/String;

.field simpleFormat:Ljava/text/SimpleDateFormat;

.field timesmapStr:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->lastTimestamp:J

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->timesmapStr:Ljava/lang/String;

    const-string v0, "localhost"

    iput-object v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->localHostName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method computeTimeStampString(J)Ljava/lang/String;
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->lastTimestamp:J

    cmp-long v0, p1, v0

    if-eqz v0, :cond_16

    iput-wide p1, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->lastTimestamp:J

    iget-object v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->simpleFormat:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->timesmapStr:Ljava/lang/String;

    :cond_16
    iget-object v0, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->timesmapStr:Ljava/lang/String;

    monitor-exit p0

    return-object v0

    :catchall_1a
    move-exception v0

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 6

    const/16 v3, 0x20

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->facility:I

    invoke-static {p1}, Lch/qos/logback/classic/util/LevelToSyslogSeverity;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)I

    move-result v2

    add-int/2addr v1, v2

    const-string v2, "<"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getTimeStamp()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lch/qos/logback/classic/pattern/SyslogStartConverter;->computeTimeStampString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "localhost"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/SyslogStartConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public start()V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/SyslogStartConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_d

    const-string v0, "was expecting a facility string as an option"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/pattern/SyslogStartConverter;->addError(Ljava/lang/String;)V

    :cond_c
    :goto_c
    return-void

    :cond_d
    invoke-static {v1}, Lch/qos/logback/core/net/SyslogAppenderBase;->facilityStringToint(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->facility:I

    :try_start_13
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "MMM dd HH:mm:ss"

    new-instance v3, Ljava/text/DateFormatSymbols;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v4}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    iput-object v1, p0, Lch/qos/logback/classic/pattern/SyslogStartConverter;->simpleFormat:Ljava/text/SimpleDateFormat;
    :try_end_23
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_23} :catch_29

    :goto_23
    if-nez v0, :cond_c

    invoke-super {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;->start()V

    goto :goto_c

    :catch_29
    move-exception v0

    const-string v1, "Could not instantiate SimpleDateFormat"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/pattern/SyslogStartConverter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    goto :goto_23
.end method
