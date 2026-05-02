.class public Lch/qos/logback/classic/pattern/FileOfCallerConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 4

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    move-result-object v0

    if-eqz v0, :cond_11

    array-length v1, v0

    if-lez v1, :cond_11

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v0

    :goto_10
    return-object v0

    :cond_11
    const-string v0, "?"

    goto :goto_10
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/FileOfCallerConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
