.class public Lch/qos/logback/core/net/DefaultSocketConnector;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/net/SocketConnector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/net/DefaultSocketConnector$1;,
        Lch/qos/logback/core/net/DefaultSocketConnector$ConsoleExceptionHandler;
    }
.end annotation


# instance fields
.field private final address:Ljava/net/InetAddress;

.field private final delayStrategy:Lch/qos/logback/core/util/DelayStrategy;

.field private exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

.field private final port:I

.field private socketFactory:Ljavax/net/SocketFactory;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;IJJ)V
    .registers 8

    new-instance v0, Lch/qos/logback/core/util/FixedDelay;

    invoke-direct {v0, p3, p4, p5, p6}, Lch/qos/logback/core/util/FixedDelay;-><init>(JJ)V

    invoke-direct {p0, p1, p2, v0}, Lch/qos/logback/core/net/DefaultSocketConnector;-><init>(Ljava/net/InetAddress;ILch/qos/logback/core/util/DelayStrategy;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILch/qos/logback/core/util/DelayStrategy;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->address:Ljava/net/InetAddress;

    iput p2, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->port:I

    iput-object p3, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->delayStrategy:Lch/qos/logback/core/util/DelayStrategy;

    return-void
.end method

.method private createSocket()Ljava/net/Socket;
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->socketFactory:Ljavax/net/SocketFactory;

    iget-object v2, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->address:Ljava/net/InetAddress;

    iget v3, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->port:I

    invoke-virtual {v1, v2, v3}, Ljavax/net/SocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_c

    move-result-object v0

    :goto_b
    return-object v0

    :catch_c
    move-exception v1

    iget-object v2, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    invoke-interface {v2, p0, v1}, Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;->connectionFailed(Lch/qos/logback/core/net/SocketConnector;Ljava/lang/Exception;)V

    goto :goto_b
.end method

.method private useDefaultsForMissingFields()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    if-nez v0, :cond_c

    new-instance v0, Lch/qos/logback/core/net/DefaultSocketConnector$ConsoleExceptionHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lch/qos/logback/core/net/DefaultSocketConnector$ConsoleExceptionHandler;-><init>(Lch/qos/logback/core/net/DefaultSocketConnector$1;)V

    iput-object v0, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->socketFactory:Ljavax/net/SocketFactory;

    if-nez v0, :cond_16

    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->socketFactory:Ljavax/net/SocketFactory;

    :cond_16
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/DefaultSocketConnector;->call()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/net/Socket;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/net/DefaultSocketConnector;->useDefaultsForMissingFields()V

    invoke-direct {p0}, Lch/qos/logback/core/net/DefaultSocketConnector;->createSocket()Ljava/net/Socket;

    move-result-object v0

    :goto_7
    if-nez v0, :cond_21

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_21

    iget-object v0, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->delayStrategy:Lch/qos/logback/core/util/DelayStrategy;

    invoke-interface {v0}, Lch/qos/logback/core/util/DelayStrategy;->nextDelay()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    invoke-direct {p0}, Lch/qos/logback/core/net/DefaultSocketConnector;->createSocket()Ljava/net/Socket;

    move-result-object v0

    goto :goto_7

    :cond_21
    return-object v0
.end method

.method public setExceptionHandler(Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    return-void
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/DefaultSocketConnector;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method
