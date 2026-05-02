.class public Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;
.super Lch/qos/logback/core/recovery/ResilientOutputStreamBase;


# instance fields
.field port:I

.field syslogHost:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;,
            Ljava/net/SocketException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/recovery/ResilientOutputStreamBase;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->syslogHost:Ljava/lang/String;

    iput p2, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->port:I

    new-instance v0, Lch/qos/logback/core/net/SyslogOutputStream;

    invoke-direct {v0, p1, p2}, Lch/qos/logback/core/net/SyslogOutputStream;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lch/qos/logback/core/recovery/ResilientOutputStreamBase;->os:Ljava/io/OutputStream;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->presumedClean:Z

    return-void
.end method


# virtual methods
.method getDescription()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "syslog ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->syslogHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method openNewOutputStream()Ljava/io/OutputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/net/SyslogOutputStream;

    iget-object v1, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->syslogHost:Ljava/lang/String;

    iget v2, p0, Lch/qos/logback/core/recovery/ResilientSyslogOutputStream;->port:I

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/net/SyslogOutputStream;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "c.q.l.c.recovery.ResilientSyslogOutputStream@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
