.class public Lch/qos/logback/core/ConsoleAppender;
.super Lch/qos/logback/core/OutputStreamAppender;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/OutputStreamAppender",
        "<TE;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected target:Lch/qos/logback/core/joran/spi/ConsoleTarget;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/OutputStreamAppender;-><init>()V

    sget-object v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->SystemOut:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    iput-object v0, p0, Lch/qos/logback/core/ConsoleAppender;->target:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    return-void
.end method

.method private targetWarn(Ljava/lang/String;)V
    .registers 5

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] should be one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lch/qos/logback/core/joran/spi/ConsoleTarget;->values()[Lch/qos/logback/core/joran/spi/ConsoleTarget;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lch/qos/logback/core/status/WarnStatus;

    const-string v2, "Using previously set target, System.out by default."

    invoke-direct {v1, v2, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/status/Status;->add(Lch/qos/logback/core/status/Status;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/ConsoleAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method


# virtual methods
.method public getTarget()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ConsoleAppender;->target:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConsoleTarget;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setTarget(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/joran/spi/ConsoleTarget;->findByName(Ljava/lang/String;)Lch/qos/logback/core/joran/spi/ConsoleTarget;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-direct {p0, p1}, Lch/qos/logback/core/ConsoleAppender;->targetWarn(Ljava/lang/String;)V

    :goto_d
    return-void

    :cond_e
    iput-object v0, p0, Lch/qos/logback/core/ConsoleAppender;->target:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    goto :goto_d
.end method

.method public start()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ConsoleAppender;->target:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ConsoleTarget;->getStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/ConsoleAppender;->setOutputStream(Ljava/io/OutputStream;)V

    invoke-super {p0}, Lch/qos/logback/core/OutputStreamAppender;->start()V

    return-void
.end method
