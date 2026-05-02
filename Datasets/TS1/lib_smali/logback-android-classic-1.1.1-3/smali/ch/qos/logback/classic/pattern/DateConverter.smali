.class public Lch/qos/logback/classic/pattern/DateConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# instance fields
.field cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;

.field lastTimestamp:J

.field timestampStrCache:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lch/qos/logback/classic/pattern/DateConverter;->lastTimestamp:J

    iput-object v2, p0, Lch/qos/logback/classic/pattern/DateConverter;->timestampStrCache:Ljava/lang/String;

    iput-object v2, p0, Lch/qos/logback/classic/pattern/DateConverter;->cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 5

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getTimeStamp()J

    move-result-wide v0

    iget-object v2, p0, Lch/qos/logback/classic/pattern/DateConverter;->cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;

    invoke-virtual {v2, v0, v1}, Lch/qos/logback/core/util/CachingDateFormatter;->format(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/DateConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public start()V
    .registers 6

    const/4 v4, 0x1

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/DateConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9

    const-string v0, "yyyy-MM-dd HH:mm:ss,SSS"

    :cond_9
    const-string v1, "ISO8601"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_58

    const-string v0, "yyyy-MM-dd HH:mm:ss,SSS"

    move-object v1, v0

    :goto_14
    :try_start_14
    new-instance v0, Lch/qos/logback/core/util/CachingDateFormatter;

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/CachingDateFormatter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lch/qos/logback/classic/pattern/DateConverter;->cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_14 .. :try_end_1b} :catch_37

    :goto_1b
    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/DateConverter;->getOptionList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_36

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v4, :cond_36

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/pattern/DateConverter;->cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/util/CachingDateFormatter;->setTimeZone(Ljava/util/TimeZone;)V

    :cond_36
    return-void

    :catch_37
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not instantiate SimpleDateFormat with pattern "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/pattern/DateConverter;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v0, Lch/qos/logback/core/util/CachingDateFormatter;

    const-string v1, "yyyy-MM-dd HH:mm:ss,SSS"

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/CachingDateFormatter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lch/qos/logback/classic/pattern/DateConverter;->cachingDateFormatter:Lch/qos/logback/core/util/CachingDateFormatter;

    goto :goto_1b

    :cond_58
    move-object v1, v0

    goto :goto_14
.end method
