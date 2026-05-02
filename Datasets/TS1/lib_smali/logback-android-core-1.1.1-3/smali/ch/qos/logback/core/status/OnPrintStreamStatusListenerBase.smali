.class abstract Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/status/StatusListener;
.implements Lch/qos/logback/core/spi/LifeCycle;


# static fields
.field static final DEFAULT_RETROSPECTIVE:J = 0x12cL


# instance fields
.field isStarted:Z

.field retrospective:J


# direct methods
.method constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted:Z

    const-wide/16 v0, 0x12c

    iput-wide v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospective:J

    return-void
.end method

.method private print(Lch/qos/logback/core/status/Status;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-static {v0, v1, p1}, Lch/qos/logback/core/util/StatusPrinter;->buildStr(Ljava/lang/StringBuilder;Ljava/lang/String;Lch/qos/logback/core/status/Status;)V

    invoke-virtual {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->getPrintStream()Ljava/io/PrintStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    return-void
.end method

.method private retrospectivePrint()V
    .registers 9

    iget-object v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->context:Lch/qos/logback/core/Context;

    if-nez v0, :cond_5

    :cond_4
    return-void

    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/status/StatusManager;->getCopyOfStatusList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_17
    :goto_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/Status;

    invoke-interface {v0}, Lch/qos/logback/core/status/Status;->getDate()Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v4, v1, v4

    iget-wide v6, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospective:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_17

    invoke-direct {p0, v0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->print(Lch/qos/logback/core/status/Status;)V

    goto :goto_17
.end method


# virtual methods
.method public addStatusEvent(Lch/qos/logback/core/status/Status;)V
    .registers 3

    iget-boolean v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    invoke-direct {p0, p1}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->print(Lch/qos/logback/core/status/Status;)V

    goto :goto_4
.end method

.method protected abstract getPrintStream()Ljava/io/PrintStream;
.end method

.method public getRetrospective()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospective:J

    return-wide v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted:Z

    return v0
.end method

.method public setRetrospective(J)V
    .registers 3

    iput-wide p1, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospective:J

    return-void
.end method

.method public start()V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted:Z

    iget-wide v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospective:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_e

    invoke-direct {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->retrospectivePrint()V

    :cond_e
    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted:Z

    return-void
.end method
