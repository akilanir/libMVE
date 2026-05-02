.class public Lch/qos/logback/core/spi/ContextAwareImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/ContextAware;


# instance fields
.field protected context:Lch/qos/logback/core/Context;

.field private noContextWarning:I

.field final origin:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/Context;Ljava/lang/Object;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->noContextWarning:I

    iput-object p1, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    iput-object p2, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->origin:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public addError(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/ErrorStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Lch/qos/logback/core/status/ErrorStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/InfoStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Lch/qos/logback/core/status/InfoStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addStatus(Lch/qos/logback/core/status/Status;)V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    if-nez v0, :cond_25

    iget v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->noContextWarning:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->noContextWarning:I

    if-nez v0, :cond_24

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LOGBACK: No context given for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_24
    :goto_24
    return-void

    :cond_25
    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-interface {v0, p1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    goto :goto_24
.end method

.method public addWarn(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    invoke-virtual {p0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getOrigin()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public getContext()Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method protected getOrigin()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->origin:Ljava/lang/Object;

    return-object v0
.end method

.method public getStatusManager()Lch/qos/logback/core/status/StatusManager;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    goto :goto_5
.end method

.method public setContext(Lch/qos/logback/core/Context;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    if-nez v0, :cond_7

    iput-object p1, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    :cond_6
    return-void

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/spi/ContextAwareImpl;->context:Lch/qos/logback/core/Context;

    if-eq v0, p1, :cond_6

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context has been already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
