.class public Lch/qos/logback/classic/net/LoggingEventPreSerializationTransformer;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/PreSerializationTransformer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/spi/PreSerializationTransformer",
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
.method public transform(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/io/Serializable;
    .registers 5

    if-nez p1, :cond_4

    const/4 p1, 0x0

    :goto_3
    return-object p1

    :cond_4
    instance-of v0, p1, Lch/qos/logback/classic/spi/LoggingEvent;

    if-eqz v0, :cond_d

    invoke-static {p1}, Lch/qos/logback/classic/spi/LoggingEventVO;->build(Lch/qos/logback/classic/spi/ILoggingEvent;)Lch/qos/logback/classic/spi/LoggingEventVO;

    move-result-object p1

    goto :goto_3

    :cond_d
    instance-of v0, p1, Lch/qos/logback/classic/spi/LoggingEventVO;

    if-eqz v0, :cond_14

    check-cast p1, Lch/qos/logback/classic/spi/LoggingEventVO;

    goto :goto_3

    :cond_14
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/io/Serializable;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/net/LoggingEventPreSerializationTransformer;->transform(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/io/Serializable;

    move-result-object v0

    return-object v0
.end method
