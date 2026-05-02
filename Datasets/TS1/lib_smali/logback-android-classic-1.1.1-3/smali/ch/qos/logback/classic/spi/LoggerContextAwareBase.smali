.class public Lch/qos/logback/classic/spi/LoggerContextAwareBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/classic/spi/LoggerContextAware;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getLoggerContext()Lch/qos/logback/classic/LoggerContext;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/LoggerContextAwareBase;->context:Lch/qos/logback/core/Context;

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    return-object v0
.end method

.method public setContext(Lch/qos/logback/core/Context;)V
    .registers 4

    instance-of v0, p1, Lch/qos/logback/classic/LoggerContext;

    if-nez v0, :cond_6

    if-nez p1, :cond_a

    :cond_6
    invoke-super {p0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->setContext(Lch/qos/logback/core/Context;)V

    return-void

    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "LoggerContextAwareBase only accepts contexts of type c.l.classic.LoggerContext"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setLoggerContext(Lch/qos/logback/classic/LoggerContext;)V
    .registers 2

    invoke-super {p0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->setContext(Lch/qos/logback/core/Context;)V

    return-void
.end method
