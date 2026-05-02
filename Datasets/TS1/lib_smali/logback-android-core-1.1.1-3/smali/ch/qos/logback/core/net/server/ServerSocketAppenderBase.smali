.class public abstract Lch/qos/logback/core/net/server/ServerSocketAppenderBase;
.super Lch/qos/logback/core/AppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/AppenderBase",
        "<TE;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_BACKLOG:I = 0x32

.field public static final DEFAULT_CLIENT_QUEUE_SIZE:I = 0x64


# instance fields
.field private address:Ljava/lang/String;

.field private backlog:I

.field private clientQueueSize:I

.field private port:I

.field private runner:Lch/qos/logback/core/net/server/ServerRunner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/net/server/ServerRunner",
            "<",
            "Lch/qos/logback/core/net/server/RemoteReceiverClient;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    const/16 v0, 0x11d0

    iput v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->port:I

    const/16 v0, 0x32

    iput v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->backlog:I

    const/16 v0, 0x64

    iput v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->clientQueueSize:I

    return-void
.end method


# virtual methods
.method protected append(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    if-nez p1, :cond_3

    :goto_2
    return-void

    :cond_3
    invoke-virtual {p0, p1}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->postProcessEvent(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getPST()Lch/qos/logback/core/spi/PreSerializationTransformer;

    move-result-object v0

    invoke-interface {v0, p1}, Lch/qos/logback/core/spi/PreSerializationTransformer;->transform(Ljava/lang/Object;)Ljava/io/Serializable;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    new-instance v2, Lch/qos/logback/core/net/server/ServerSocketAppenderBase$1;

    invoke-direct {v2, p0, v0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase$1;-><init>(Lch/qos/logback/core/net/server/ServerSocketAppenderBase;Ljava/io/Serializable;)V

    invoke-interface {v1, v2}, Lch/qos/logback/core/net/server/ServerRunner;->accept(Lch/qos/logback/core/net/server/ClientVisitor;)V

    goto :goto_2
.end method

.method protected createServerListener(Ljava/net/ServerSocket;)Lch/qos/logback/core/net/server/ServerListener;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/ServerSocket;",
            ")",
            "Lch/qos/logback/core/net/server/ServerListener",
            "<",
            "Lch/qos/logback/core/net/server/RemoteReceiverClient;",
            ">;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/net/server/RemoteReceiverServerListener;

    invoke-direct {v0, p1}, Lch/qos/logback/core/net/server/RemoteReceiverServerListener;-><init>(Ljava/net/ServerSocket;)V

    return-object v0
.end method

.method protected createServerRunner(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;)Lch/qos/logback/core/net/server/ServerRunner;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/net/server/ServerListener",
            "<",
            "Lch/qos/logback/core/net/server/RemoteReceiverClient;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lch/qos/logback/core/net/server/ServerRunner",
            "<",
            "Lch/qos/logback/core/net/server/RemoteReceiverClient;",
            ">;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/net/server/RemoteReceiverServerRunner;

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getClientQueueSize()I

    move-result v1

    invoke-direct {v0, p1, p2, v1}, Lch/qos/logback/core/net/server/RemoteReceiverServerRunner;-><init>(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;I)V

    return-object v0
.end method

.method public getAddress()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getBacklog()Ljava/lang/Integer;
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->backlog:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getClientQueueSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->clientQueueSize:I

    return v0
.end method

.method protected getInetAddress()Ljava/net/InetAddress;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getAddress()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_7
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

    iget v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->port:I

    return v0
.end method

.method protected getServerSocketFactory()Ljavax/net/ServerSocketFactory;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    return-object v0
.end method

.method protected abstract postProcessEvent(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->address:Ljava/lang/String;

    return-void
.end method

.method public setBacklog(Ljava/lang/Integer;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->backlog:I

    return-void
.end method

.method public setClientQueueSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->clientQueueSize:I

    return-void
.end method

.method public setPort(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->port:I

    return-void
.end method

.method public start()V
    .registers 5

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getServerSocketFactory()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getPort()I

    move-result v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getBacklog()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->createServerListener(Ljava/net/ServerSocket;)Lch/qos/logback/core/net/server/ServerListener;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-interface {v1}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->createServerRunner(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;)Lch/qos/logback/core/net/server/ServerRunner;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    iget-object v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lch/qos/logback/core/net/server/ServerRunner;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->start()V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_4a} :catch_4b

    goto :goto_6

    :catch_4b
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "server startup error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method public stop()V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    iget-object v0, p0, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    invoke-interface {v0}, Lch/qos/logback/core/net/server/ServerRunner;->stop()V

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->stop()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_f} :catch_10

    goto :goto_6

    :catch_10
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "server shutdown error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/server/ServerSocketAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method
