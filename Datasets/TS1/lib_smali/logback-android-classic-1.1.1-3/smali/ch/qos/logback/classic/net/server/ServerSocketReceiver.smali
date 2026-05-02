.class public Lch/qos/logback/classic/net/server/ServerSocketReceiver;
.super Lch/qos/logback/classic/net/ReceiverBase;


# static fields
.field public static final DEFAULT_BACKLOG:I = 0x32


# instance fields
.field private address:Ljava/lang/String;

.field private backlog:I

.field private port:I

.field private runner:Lch/qos/logback/core/net/server/ServerRunner;

.field private serverSocket:Ljava/net/ServerSocket;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/net/ReceiverBase;-><init>()V

    const/16 v0, 0x11d0

    iput v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->port:I

    const/16 v0, 0x32

    iput v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->backlog:I

    return-void
.end method


# virtual methods
.method protected createServerListener(Ljava/net/ServerSocket;)Lch/qos/logback/core/net/server/ServerListener;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/ServerSocket;",
            ")",
            "Lch/qos/logback/core/net/server/ServerListener",
            "<",
            "Lch/qos/logback/classic/net/server/RemoteAppenderClient;",
            ">;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/net/server/RemoteAppenderServerListener;

    invoke-direct {v0, p1}, Lch/qos/logback/classic/net/server/RemoteAppenderServerListener;-><init>(Ljava/net/ServerSocket;)V

    return-object v0
.end method

.method protected createServerRunner(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;)Lch/qos/logback/core/net/server/ServerRunner;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/net/server/ServerListener",
            "<",
            "Lch/qos/logback/classic/net/server/RemoteAppenderClient;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lch/qos/logback/core/net/server/ServerRunner;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/net/server/RemoteAppenderServerRunner;

    invoke-direct {v0, p1, p2}, Lch/qos/logback/classic/net/server/RemoteAppenderServerRunner;-><init>(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;)V

    return-object v0
.end method

.method public getAddress()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getBacklog()I
    .registers 2

    iget v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->backlog:I

    return v0
.end method

.method protected getInetAddress()Ljava/net/InetAddress;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getAddress()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getAddress()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_7
.end method

.method public getPort()I
    .registers 2

    iget v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->port:I

    return v0
.end method

.method protected getRunnableTask()Ljava/lang/Runnable;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    return-object v0
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

.method protected onStop()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    invoke-interface {v0}, Lch/qos/logback/core/net/server/ServerRunner;->stop()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a} :catch_b

    goto :goto_4

    :catch_b
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

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4
.end method

.method public setAddress(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->address:Ljava/lang/String;

    return-void
.end method

.method public setBacklog(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->backlog:I

    return-void
.end method

.method public setPort(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->port:I

    return-void
.end method

.method protected shouldStart()Z
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getServerSocketFactory()Ljavax/net/ServerSocketFactory;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getPort()I

    move-result v1

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getBacklog()I

    move-result v2

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->createServerListener(Ljava/net/ServerSocket;)Lch/qos/logback/core/net/server/ServerListener;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-interface {v1}, Lch/qos/logback/core/Context;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->createServerRunner(Lch/qos/logback/core/net/server/ServerListener;Ljava/util/concurrent/Executor;)Lch/qos/logback/core/net/server/ServerRunner;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->runner:Lch/qos/logback/core/net/server/ServerRunner;

    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lch/qos/logback/core/net/server/ServerRunner;->setContext(Lch/qos/logback/core/Context;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_31

    const/4 v0, 0x1

    :goto_30
    return v0

    :catch_31
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

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lch/qos/logback/classic/net/server/ServerSocketReceiver;->serverSocket:Ljava/net/ServerSocket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/ServerSocket;)V

    const/4 v0, 0x0

    goto :goto_30
.end method
