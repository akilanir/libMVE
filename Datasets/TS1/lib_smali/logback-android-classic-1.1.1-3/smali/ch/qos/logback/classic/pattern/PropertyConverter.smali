.class public final Lch/qos/logback/classic/pattern/PropertyConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# instance fields
.field key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lch/qos/logback/classic/pattern/PropertyConverter;->key:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "Property_HAS_NO_KEY"

    :cond_6
    :goto_6
    return-object v0

    :cond_7
    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerContextVO()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/classic/spi/LoggerContextVO;->getPropertyMap()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/pattern/PropertyConverter;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_6

    iget-object v0, p0, Lch/qos/logback/classic/pattern/PropertyConverter;->key:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/PropertyConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public start()V
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/PropertyConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    iput-object v0, p0, Lch/qos/logback/classic/pattern/PropertyConverter;->key:Ljava/lang/String;

    invoke-super {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;->start()V

    :cond_b
    return-void
.end method
