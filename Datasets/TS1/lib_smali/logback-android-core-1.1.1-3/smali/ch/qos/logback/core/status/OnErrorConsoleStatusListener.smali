.class public Lch/qos/logback/core/status/OnErrorConsoleStatusListener;
.super Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic addStatusEvent(Lch/qos/logback/core/status/Status;)V
    .registers 2

    invoke-super {p0, p1}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->addStatusEvent(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method protected getPrintStream()Ljava/io/PrintStream;
    .registers 2

    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    return-object v0
.end method

.method public bridge synthetic getRetrospective()J
    .registers 3

    invoke-super {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->getRetrospective()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic isStarted()Z
    .registers 2

    invoke-super {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->isStarted()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setRetrospective(J)V
    .registers 3

    invoke-super {p0, p1, p2}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->setRetrospective(J)V

    return-void
.end method

.method public bridge synthetic start()V
    .registers 1

    invoke-super {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->start()V

    return-void
.end method

.method public bridge synthetic stop()V
    .registers 1

    invoke-super {p0}, Lch/qos/logback/core/status/OnPrintStreamStatusListenerBase;->stop()V

    return-void
.end method
