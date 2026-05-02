.class public Lch/qos/logback/classic/net/SocketReceiver;
.super Lch/qos/logback/classic/net/ReceiverBase;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;


# static fields
.field private static final DEFAULT_ACCEPT_CONNECTION_DELAY:I = 0x1388


# instance fields
.field private acceptConnectionTimeout:I

.field private address:Ljava/net/InetAddress;

.field private connectorTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private port:I

.field private receiverId:Ljava/lang/String;

.field private reconnectionDelay:I

.field private remoteHost:Ljava/lang/String;

.field private volatile socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/net/ReceiverBase;-><init>()V

    const/16 v0, 0x1388

    iput v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->acceptConnectionTimeout:I

    return-void
.end method

.method private activateConnector(Lch/qos/logback/core/net/SocketConnector;)Ljava/util/concurrent/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/net/SocketConnector;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lch/qos/logback/classic/net/SocketReceiver;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_b
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v0

    :goto_c
    return-object v0

    :catch_d
    move-exception v0

    const/4 v0, 0x0

    goto :goto_c
.end method

.method private createConnector(Ljava/net/InetAddress;III)Lch/qos/logback/core/net/SocketConnector;
    .registers 7

    invoke-virtual {p0, p1, p2, p3, p4}, Lch/qos/logback/classic/net/SocketReceiver;->newConnector(Ljava/net/InetAddress;III)Lch/qos/logback/core/net/SocketConnector;

    move-result-object v0

    invoke-interface {v0, p0}, Lch/qos/logback/core/net/SocketConnector;->setExceptionHandler(Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;)V

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SocketReceiver;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v1

    invoke-interface {v0, v1}, Lch/qos/logback/core/net/SocketConnector;->setSocketFactory(Ljavax/net/SocketFactory;)V

    return-object v0
.end method

.method private dispatchEvents(Lch/qos/logback/classic/LoggerContext;)V
    .registers 7

    const/4 v4, 0x0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    iget v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->acceptConnectionTimeout:I

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v1, Ljava/io/ObjectInputStream;

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "connection established"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    :cond_31
    :goto_31
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v2

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/Logger;->isEnabledFor(Lch/qos/logback/classic/Level;)Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/Logger;->callAppenders(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    :try_end_4c
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_4c} :catch_4d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4c} :catch_86
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4c} :catch_c3
    .catchall {:try_start_1 .. :try_end_4c} :catchall_100

    goto :goto_31

    :catch_4d
    move-exception v0

    :try_start_4e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "end-of-stream detected"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V
    :try_end_66
    .catchall {:try_start_4e .. :try_end_66} :catchall_100

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    :goto_85
    return-void

    :catch_86
    move-exception v0

    :try_start_87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "connection failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V
    :try_end_a3
    .catchall {:try_start_87 .. :try_end_a3} :catchall_100

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    goto :goto_85

    :catch_c3
    move-exception v0

    :try_start_c4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "unknown event class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V
    :try_end_e0
    .catchall {:try_start_c4 .. :try_end_e0} :catchall_100

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    goto :goto_85

    :catchall_100
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    throw v0
.end method

.method private waitForConnectorToReturnASocket()Ljava/net/Socket;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v1, 0x0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->connectorTask:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    const/4 v2, 0x0

    iput-object v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->connectorTask:Ljava/util/concurrent/Future;
    :try_end_c
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_c} :catch_d

    :goto_c
    return-object v0

    :catch_d
    move-exception v0

    move-object v0, v1

    goto :goto_c
.end method


# virtual methods
.method public connectionFailed(Lch/qos/logback/core/net/SocketConnector;Ljava/lang/Exception;)V
    .registers 5

    instance-of v0, p2, Ljava/lang/InterruptedException;

    if-eqz v0, :cond_a

    const-string v0, "connector interrupted"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    :goto_9
    return-void

    :cond_a
    instance-of v0, p2, Ljava/net/ConnectException;

    if-eqz v0, :cond_27

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection refused"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    goto :goto_9

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    goto :goto_9
.end method

.method protected getRunnableTask()Ljava/lang/Runnable;
    .registers 1

    return-object p0
.end method

.method protected getSocketFactory()Ljavax/net/SocketFactory;
    .registers 2

    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    return-object v0
.end method

.method protected newConnector(Ljava/net/InetAddress;III)Lch/qos/logback/core/net/SocketConnector;
    .registers 12

    new-instance v0, Lch/qos/logback/core/net/DefaultSocketConnector;

    int-to-long v3, p3

    int-to-long v5, p4

    move-object v1, p1

    move v2, p2

    invoke-direct/range {v0 .. v6}, Lch/qos/logback/core/net/DefaultSocketConnector;-><init>(Ljava/net/InetAddress;IJJ)V

    return-object v0
.end method

.method protected onStop()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    :cond_9
    return-void
.end method

.method public run()V
    .registers 6

    :try_start_0
    invoke-virtual {p0}, Lch/qos/logback/classic/net/SocketReceiver;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    :goto_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_25

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->address:Ljava/net/InetAddress;

    iget v2, p0, Lch/qos/logback/classic/net/SocketReceiver;->port:I

    const/4 v3, 0x0

    iget v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->reconnectionDelay:I

    invoke-direct {p0, v1, v2, v3, v4}, Lch/qos/logback/classic/net/SocketReceiver;->createConnector(Ljava/net/InetAddress;III)Lch/qos/logback/core/net/SocketConnector;

    move-result-object v1

    invoke-direct {p0, v1}, Lch/qos/logback/classic/net/SocketReceiver;->activateConnector(Lch/qos/logback/core/net/SocketConnector;)Ljava/util/concurrent/Future;

    move-result-object v1

    iput-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->connectorTask:Ljava/util/concurrent/Future;

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->connectorTask:Ljava/util/concurrent/Future;
    :try_end_23
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_23} :catch_39

    if-nez v1, :cond_2b

    :cond_25
    :goto_25
    const-string v0, "shutting down"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addInfo(Ljava/lang/String;)V

    return-void

    :cond_2b
    :try_start_2b
    invoke-direct {p0}, Lch/qos/logback/classic/net/SocketReceiver;->waitForConnectorToReturnASocket()Ljava/net/Socket;

    move-result-object v1

    iput-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketReceiver;->socket:Ljava/net/Socket;

    if-eqz v1, :cond_25

    invoke-direct {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->dispatchEvents(Lch/qos/logback/classic/LoggerContext;)V
    :try_end_38
    .catch Ljava/lang/InterruptedException; {:try_start_2b .. :try_end_38} :catch_39

    goto :goto_6

    :catch_39
    move-exception v0

    goto :goto_25
.end method

.method public setAcceptConnectionTimeout(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/classic/net/SocketReceiver;->acceptConnectionTimeout:I

    return-void
.end method

.method public setPort(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/classic/net/SocketReceiver;->port:I

    return-void
.end method

.method public setReconnectionDelay(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/classic/net/SocketReceiver;->reconnectionDelay:I

    return-void
.end method

.method public setRemoteHost(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/net/SocketReceiver;->remoteHost:Ljava/lang/String;

    return-void
.end method

.method protected shouldStart()Z
    .registers 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget v0, p0, Lch/qos/logback/classic/net/SocketReceiver;->port:I

    if-nez v0, :cond_75

    const-string v0, "No port was configured for receiver. For more information, please visit http://logback.qos.ch/codes.html#receiver_no_port"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/SocketReceiver;->addError(Ljava/lang/String;)V

    move v0, v1

    :goto_c
    iget-object v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->remoteHost:Ljava/lang/String;

    if-nez v3, :cond_17

    add-int/lit8 v0, v0, 0x1

    const-string v3, "No host name or address was configured for receiver. For more information, please visit http://logback.qos.ch/codes.html#receiver_no_host"

    invoke-virtual {p0, v3}, Lch/qos/logback/classic/net/SocketReceiver;->addError(Ljava/lang/String;)V

    :cond_17
    iget v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->reconnectionDelay:I

    if-nez v3, :cond_1f

    const/16 v3, 0x7530

    iput v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->reconnectionDelay:I

    :cond_1f
    if-nez v0, :cond_29

    :try_start_21
    iget-object v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->remoteHost:Ljava/lang/String;

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->address:Ljava/net/InetAddress;
    :try_end_29
    .catch Ljava/net/UnknownHostException; {:try_start_21 .. :try_end_29} :catch_57

    :cond_29
    :goto_29
    if-nez v0, :cond_54

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "receiver "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->remoteHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->port:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lch/qos/logback/classic/net/SocketReceiver;->receiverId:Ljava/lang/String;

    :cond_54
    if-nez v0, :cond_73

    :goto_56
    return v1

    :catch_57
    move-exception v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unknown host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lch/qos/logback/classic/net/SocketReceiver;->remoteHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/classic/net/SocketReceiver;->addError(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    :cond_73
    move v1, v2

    goto :goto_56

    :cond_75
    move v0, v2

    goto :goto_c
.end method
