.class public abstract Lch/qos/logback/core/net/AbstractSocketAppender;
.super Lch/qos/logback/core/AppenderBase;

# interfaces
.implements Ljava/lang/Runnable;
.implements Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/AppenderBase",
        "<TE;>;",
        "Ljava/lang/Runnable;",
        "Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;"
    }
.end annotation


# static fields
.field private static final DEFAULT_ACCEPT_CONNECTION_DELAY:I = 0x1388

.field private static final DEFAULT_EVENT_DELAY_TIMEOUT:I = 0x64

.field public static final DEFAULT_PORT:I = 0x11d0

.field public static final DEFAULT_QUEUE_SIZE:I = 0x80

.field public static final DEFAULT_RECONNECTION_DELAY:I = 0x7530


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

.field private eventDelayLimit:Lch/qos/logback/core/util/Duration;

.field private peerId:Ljava/lang/String;

.field private port:I

.field private queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<TE;>;"
        }
    .end annotation
.end field

.field private queueSize:I

.field private reconnectionDelay:Lch/qos/logback/core/util/Duration;

.field private remoteHost:Ljava/lang/String;

.field private volatile socket:Ljava/net/Socket;

.field private task:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    const/16 v0, 0x11d0

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide/16 v1, 0x7530

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->reconnectionDelay:Lch/qos/logback/core/util/Duration;

    const/16 v0, 0x80

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    const/16 v0, 0x1388

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->acceptConnectionTimeout:I

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide/16 v1, 0x64

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;I)V
    .registers 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    const/16 v0, 0x11d0

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide/16 v1, 0x7530

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->reconnectionDelay:Lch/qos/logback/core/util/Duration;

    const/16 v0, 0x80

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    const/16 v0, 0x1388

    iput v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->acceptConnectionTimeout:I

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide/16 v1, 0x64

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    iput-object p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    iput p2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

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
    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->getContext()Lch/qos/logback/core/Context;

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

.method private createConnector(Ljava/net/InetAddress;IIJ)Lch/qos/logback/core/net/SocketConnector;
    .registers 13

    int-to-long v3, p3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v5, p4

    invoke-virtual/range {v0 .. v6}, Lch/qos/logback/core/net/AbstractSocketAppender;->newConnector(Ljava/net/InetAddress;IJJ)Lch/qos/logback/core/net/SocketConnector;

    move-result-object v0

    invoke-interface {v0, p0}, Lch/qos/logback/core/net/SocketConnector;->setExceptionHandler(Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v1

    invoke-interface {v0, v1}, Lch/qos/logback/core/net/SocketConnector;->setSocketFactory(Ljavax/net/SocketFactory;)V

    return-object v0
.end method

.method private dispatchEvents()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v5, 0x0

    const/4 v1, 0x0

    :try_start_2
    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    iget v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->acceptConnectionTimeout:I

    invoke-virtual {v0, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v2, Ljava/io/ObjectOutputStream;

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "connection established"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    move v0, v1

    :cond_33
    :goto_33
    iget-object v3, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/net/AbstractSocketAppender;->postProcessEvent(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->getPST()Lch/qos/logback/core/spi/PreSerializationTransformer;

    move-result-object v4

    invoke-interface {v4, v3}, Lch/qos/logback/core/spi/PreSerializationTransformer;->transform(Ljava/lang/Object;)Ljava/io/Serializable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x46

    if-lt v0, v3, :cond_33

    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->reset()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_53} :catch_55
    .catchall {:try_start_2 .. :try_end_53} :catchall_92

    move v0, v1

    goto :goto_33

    :catch_55
    move-exception v0

    :try_start_56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "connection failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V
    :try_end_72
    .catchall {:try_start_56 .. :try_end_72} :catchall_92

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v5, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    return-void

    :catchall_92
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iput-object v5, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    throw v0
.end method

.method protected static getAddressByName(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
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
    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    const/4 v2, 0x0

    iput-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;
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
.method protected append(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    :try_start_9
    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queue:Ljava/util/concurrent/BlockingQueue;

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    invoke-virtual {v1}, Lch/qos/logback/core/util/Duration;->getMilliseconds()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, v1, v2, v3}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Dropping event due to timeout limit of ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] milliseconds being exceeded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V
    :try_end_37
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_37} :catch_38

    goto :goto_8

    :catch_38
    move-exception v0

    const-string v1, "Interrupted while appending event to SocketAppender"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_8
.end method

.method public connectionFailed(Lch/qos/logback/core/net/SocketConnector;Ljava/lang/Exception;)V
    .registers 5

    instance-of v0, p2, Ljava/lang/InterruptedException;

    if-eqz v0, :cond_a

    const-string v0, "connector interrupted"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    :goto_9
    return-void

    :cond_a
    instance-of v0, p2, Ljava/net/ConnectException;

    if-eqz v0, :cond_27

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection refused"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    goto :goto_9

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public getEventDelayLimit()Lch/qos/logback/core/util/Duration;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    return-object v0
.end method

.method protected abstract getPST()Lch/qos/logback/core/spi/PreSerializationTransformer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/spi/PreSerializationTransformer",
            "<TE;>;"
        }
    .end annotation
.end method

.method public getPort()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    return v0
.end method

.method public getQueueSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    return v0
.end method

.method public getReconnectionDelay()Lch/qos/logback/core/util/Duration;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->reconnectionDelay:Lch/qos/logback/core/util/Duration;

    return-object v0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    return-object v0
.end method

.method protected getSocketFactory()Ljavax/net/SocketFactory;
    .registers 2

    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    return-object v0
.end method

.method newBlockingQueue(I)Ljava/util/concurrent/BlockingQueue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/concurrent/BlockingQueue",
            "<TE;>;"
        }
    .end annotation

    if-gtz p1, :cond_a

    new-instance v0, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v0}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    :goto_7
    check-cast v0, Ljava/util/concurrent/BlockingQueue;

    return-object v0

    :cond_a
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    goto :goto_7
.end method

.method protected newConnector(Ljava/net/InetAddress;IJJ)Lch/qos/logback/core/net/SocketConnector;
    .registers 14

    new-instance v0, Lch/qos/logback/core/net/DefaultSocketConnector;

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-wide v5, p5

    invoke-direct/range {v0 .. v6}, Lch/qos/logback/core/net/DefaultSocketConnector;-><init>(Ljava/net/InetAddress;IJJ)V

    return-object v0
.end method

.method protected abstract postProcessEvent(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation
.end method

.method public final run()V
    .registers 7

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->signalEntryInRunMethod()V

    :goto_3
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->address:Ljava/net/InetAddress;

    iget v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    const/4 v3, 0x0

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->reconnectionDelay:Lch/qos/logback/core/util/Duration;

    invoke-virtual {v0}, Lch/qos/logback/core/util/Duration;->getMilliseconds()J

    move-result-wide v4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lch/qos/logback/core/net/AbstractSocketAppender;->createConnector(Ljava/net/InetAddress;IIJ)Lch/qos/logback/core/net/SocketConnector;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->activateConnector(Lch/qos/logback/core/net/SocketConnector;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;
    :try_end_25
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_25} :catch_3b

    if-nez v0, :cond_2d

    :cond_27
    :goto_27
    const-string v0, "shutting down"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->addInfo(Ljava/lang/String;)V

    return-void

    :cond_2d
    :try_start_2d
    invoke-direct {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->waitForConnectorToReturnASocket()Ljava/net/Socket;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_27

    invoke-direct {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->dispatchEvents()V
    :try_end_3a
    .catch Ljava/lang/InterruptedException; {:try_start_2d .. :try_end_3a} :catch_3b

    goto :goto_3

    :catch_3b
    move-exception v0

    goto :goto_27
.end method

.method setAcceptConnectionTimeout(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->acceptConnectionTimeout:I

    return-void
.end method

.method public setEventDelayLimit(Lch/qos/logback/core/util/Duration;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->eventDelayLimit:Lch/qos/logback/core/util/Duration;

    return-void
.end method

.method public setPort(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    return-void
.end method

.method public setQueueSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    return-void
.end method

.method public setReconnectionDelay(Lch/qos/logback/core/util/Duration;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->reconnectionDelay:Lch/qos/logback/core/util/Duration;

    return-void
.end method

.method public setRemoteHost(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    return-void
.end method

.method protected signalEntryInRunMethod()V
    .registers 1

    return-void
.end method

.method public start()V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    const/4 v0, 0x0

    iget v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    if-gtz v1, :cond_2b

    const/4 v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No port was configured for appender"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " For more information, please visit http://logback.qos.ch/codes.html#socket_no_port"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/AbstractSocketAppender;->addError(Ljava/lang/String;)V

    :cond_2b
    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    if-nez v1, :cond_4f

    add-int/lit8 v0, v0, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No remote host was configured for appender"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " For more information, please visit http://logback.qos.ch/codes.html#socket_no_host"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/AbstractSocketAppender;->addError(Ljava/lang/String;)V

    :cond_4f
    iget v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    if-gez v1, :cond_5a

    add-int/lit8 v0, v0, 0x1

    const-string v1, "Queue size must be non-negative"

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/AbstractSocketAppender;->addError(Ljava/lang/String;)V

    :cond_5a
    if-nez v0, :cond_64

    :try_start_5c
    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->address:Ljava/net/InetAddress;
    :try_end_64
    .catch Ljava/net/UnknownHostException; {:try_start_5c .. :try_end_64} :catch_aa

    :cond_64
    :goto_64
    if-nez v0, :cond_6

    iget v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queueSize:I

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/AbstractSocketAppender;->newBlockingQueue(I)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->queue:Ljava/util/concurrent/BlockingQueue;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remote peer "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->peerId:Ljava/lang/String;

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->task:Ljava/util/concurrent/Future;

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->start()V

    goto/16 :goto_6

    :catch_aa
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown host: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->remoteHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/AbstractSocketAppender;->addError(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_64
.end method

.method public stop()V
    .registers 3

    const/4 v1, 0x1

    invoke-virtual {p0}, Lch/qos/logback/core/net/AbstractSocketAppender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_8

    :goto_7
    return-void

    :cond_8
    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->task:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lch/qos/logback/core/net/AbstractSocketAppender;->connectorTask:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1b
    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->stop()V

    goto :goto_7
.end method
