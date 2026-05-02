.class public Lch/qos/logback/classic/pattern/EnsureExceptionHandling;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/pattern/PostCompileProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/pattern/PostCompileProcessor",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public chainHandlesThrowable(Lch/qos/logback/core/pattern/Converter;)Z
    .registers 3

    :goto_0
    if-eqz p1, :cond_d

    instance-of v0, p1, Lch/qos/logback/classic/pattern/ThrowableHandlingConverter;

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    invoke-virtual {p1}, Lch/qos/logback/core/pattern/Converter;->getNext()Lch/qos/logback/core/pattern/Converter;

    move-result-object p1

    goto :goto_0

    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public process(Lch/qos/logback/core/pattern/Converter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/Converter",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cannot process empty chain"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/EnsureExceptionHandling;->chainHandlesThrowable(Lch/qos/logback/core/pattern/Converter;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p1}, Lch/qos/logback/core/pattern/ConverterUtil;->findTail(Lch/qos/logback/core/pattern/Converter;)Lch/qos/logback/core/pattern/Converter;

    move-result-object v0

    new-instance v1, Lch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter;

    invoke-direct {v1}, Lch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter;-><init>()V

    invoke-virtual {v0, v1}, Lch/qos/logback/core/pattern/Converter;->setNext(Lch/qos/logback/core/pattern/Converter;)V

    :cond_1c
    return-void
.end method
