.class public Lch/qos/logback/classic/AsyncAppender;
.super Lch/qos/logback/core/AsyncAppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/AsyncAppenderBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# instance fields
.field includeCallerData:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/AsyncAppenderBase;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/AsyncAppender;->includeCallerData:Z

    return-void
.end method


# virtual methods
.method protected isDiscardable(Lch/qos/logback/classic/spi/ILoggingEvent;)Z
    .registers 4

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/classic/Level;->toInt()I

    move-result v0

    const/16 v1, 0x4e20

    if-gt v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected bridge synthetic isDiscardable(Ljava/lang/Object;)Z
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/AsyncAppender;->isDiscardable(Lch/qos/logback/classic/spi/ILoggingEvent;)Z

    move-result v0

    return v0
.end method

.method public isIncludeCallerData()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/AsyncAppender;->includeCallerData:Z

    return v0
.end method

.method protected preprocess(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->prepareForDeferredProcessing()V

    iget-boolean v0, p0, Lch/qos/logback/classic/AsyncAppender;->includeCallerData:Z

    if-eqz v0, :cond_a

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    :cond_a
    return-void
.end method

.method protected bridge synthetic preprocess(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/AsyncAppender;->preprocess(Lch/qos/logback/classic/spi/ILoggingEvent;)V

    return-void
.end method

.method public setIncludeCallerData(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/classic/AsyncAppender;->includeCallerData:Z

    return-void
.end method
