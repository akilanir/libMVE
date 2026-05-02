.class public Lcom/danikula/videocache/HttpProxyCacheServer;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/HttpProxyCacheServer$1;,
        Lcom/danikula/videocache/HttpProxyCacheServer$Builder;,
        Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;,
        Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;,
        Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;
    }
.end annotation


# static fields
.field private static final PING_REQUEST:Ljava/lang/String; = "ping"

.field private static final PING_RESPONSE:Ljava/lang/String; = "ping ok"

.field private static final PROXY_HOST:Ljava/lang/String; = "127.0.0.1"


# instance fields
.field private final clientsLock:Ljava/lang/Object;

.field private final clientsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/danikula/videocache/HttpProxyCacheServerClients;",
            ">;"
        }
    .end annotation
.end field

.field private final config:Lcom/danikula/videocache/Config;

.field private pinged:Z

.field private final port:I

.field private final serverSocket:Ljava/net/ServerSocket;

.field private final socketProcessor:Ljava/util/concurrent/ExecutorService;

.field private final waitConnectionThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    new-instance v0, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;

    invoke-direct {v0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;-><init>(Landroid/content/Context;)V

    # invokes: Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->buildConfig()Lcom/danikula/videocache/Config;
    invoke-static {v0}, Lcom/danikula/videocache/HttpProxyCacheServer$Builder;->access$000(Lcom/danikula/videocache/HttpProxyCacheServer$Builder;)Lcom/danikula/videocache/Config;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/danikula/videocache/HttpProxyCacheServer;-><init>(Lcom/danikula/videocache/Config;)V

    .line 72
    return-void
.end method

.method private constructor <init>(Lcom/danikula/videocache/Config;)V
    .registers 8
    .param p1, "config"    # Lcom/danikula/videocache/Config;

    .prologue
    const/16 v4, 0x8

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    .line 62
    invoke-static {v4}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v3

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    .line 63
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    .line 75
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/danikula/videocache/Config;

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    .line 77
    :try_start_21
    const-string v3, "127.0.0.1"

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 78
    .local v1, "inetAddress":Ljava/net/InetAddress;
    new-instance v3, Ljava/net/ServerSocket;

    const/4 v4, 0x0

    const/16 v5, 0x8

    invoke-direct {v3, v4, v5, v1}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    .line 79
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v3

    iput v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->port:I

    .line 80
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 81
    .local v2, "startSignal":Ljava/util/concurrent/CountDownLatch;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;

    invoke-direct {v4, p0, v2}, Lcom/danikula/videocache/HttpProxyCacheServer$WaitRequestsRunnable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/util/concurrent/CountDownLatch;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    .line 82
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 83
    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 84
    const-string v3, "ProxyCache"

    const-string v4, "Proxy cache server started. Ping it..."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->makeSureServerWorks()V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_5d} :catch_5e
    .catch Ljava/lang/InterruptedException; {:try_start_21 .. :try_end_5d} :catch_5e

    .line 90
    return-void

    .line 86
    .end local v1    # "inetAddress":Ljava/net/InetAddress;
    .end local v2    # "startSignal":Ljava/util/concurrent/CountDownLatch;
    :catch_5e
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 88
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Error starting local proxy server"

    invoke-direct {v3, v4, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method synthetic constructor <init>(Lcom/danikula/videocache/Config;Lcom/danikula/videocache/HttpProxyCacheServer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/danikula/videocache/Config;
    .param p2, "x1"    # Lcom/danikula/videocache/HttpProxyCacheServer$1;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;-><init>(Lcom/danikula/videocache/Config;)V

    return-void
.end method

.method static synthetic access$200(Lcom/danikula/videocache/HttpProxyCacheServer;)V
    .registers 1
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->waitForRequest()V

    return-void
.end method

.method static synthetic access$300(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V
    .registers 2
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;
    .param p1, "x1"    # Ljava/net/Socket;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->processSocket(Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic access$400(Lcom/danikula/videocache/HttpProxyCacheServer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->pingServer()Z

    move-result v0

    return v0
.end method

.method private appendToProxyUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string v0, "http://%s:%d/%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "127.0.0.1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->port:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p1}, Lcom/danikula/videocache/ProxyCacheUtils;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private closeSocket(Ljava/net/Socket;)V
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 294
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_9

    .line 295
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    .line 300
    :cond_9
    :goto_9
    return-void

    .line 297
    :catch_a
    move-exception v0

    .line 298
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string v2, "Error closing socket"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method private closeSocketInput(Ljava/net/Socket;)V
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 270
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v1

    if-nez v1, :cond_9

    .line 271
    invoke-virtual {p1}, Ljava/net/Socket;->shutdownInput()V
    :try_end_9
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_9} :catch_a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_13

    .line 280
    :cond_9
    :goto_9
    return-void

    .line 273
    :catch_a
    move-exception v0

    .line 276
    .local v0, "e":Ljava/net/SocketException;
    const-string v1, "ProxyCache"

    const-string v2, "Releasing input stream\u2026 Socket is closed by client."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 277
    .end local v0    # "e":Ljava/net/SocketException;
    :catch_13
    move-exception v0

    .line 278
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string v2, "Error closing socket input stream"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method private closeSocketOutput(Ljava/net/Socket;)V
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 284
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 285
    invoke-virtual {p1}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    .line 290
    :cond_9
    :goto_9
    return-void

    .line 287
    :catch_a
    move-exception v0

    .line 288
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string v2, "Error closing socket output stream"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method private getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .registers 5
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 242
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 243
    :try_start_3
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 244
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    if-nez v0, :cond_19

    .line 245
    new-instance v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->config:Lcom/danikula/videocache/Config;

    invoke-direct {v0, p1, v1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;-><init>(Ljava/lang/String;Lcom/danikula/videocache/Config;)V

    .line 246
    .restart local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    :cond_19
    monitor-exit v2

    return-object v0

    .line 249
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :catchall_1b
    move-exception v1

    monitor-exit v2
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v1
.end method

.method private getClientsCount()I
    .registers 6

    .prologue
    .line 253
    iget-object v4, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v4

    .line 254
    const/4 v1, 0x0

    .line 255
    .local v1, "count":I
    :try_start_4
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 256
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->getClientsCount()I

    move-result v3

    add-int/2addr v1, v3

    .line 257
    goto :goto_e

    .line 258
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    :cond_20
    monitor-exit v4

    return v1

    .line 259
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_22
    move-exception v3

    monitor-exit v4
    :try_end_24
    .catchall {:try_start_4 .. :try_end_24} :catchall_22

    throw v3
.end method

.method private makeSureServerWorks()V
    .registers 9

    .prologue
    .line 93
    const/4 v2, 0x3

    .line 94
    .local v2, "maxPingAttempts":I
    const/16 v0, 0xc8

    .line 95
    .local v0, "delay":I
    const/4 v3, 0x0

    .line 96
    .local v3, "pingAttempts":I
    :goto_4
    if-ge v3, v2, :cond_59

    .line 98
    :try_start_6
    iget-object v5, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    new-instance v6, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;Lcom/danikula/videocache/HttpProxyCacheServer$1;)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v4

    .line 99
    .local v4, "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    int-to-long v5, v0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v6, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    iput-boolean v5, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinged:Z

    .line 100
    iget-boolean v5, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinged:Z

    if-eqz v5, :cond_26

    .line 113
    .end local v4    # "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    :goto_25
    return-void

    .line 103
    .restart local v4    # "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    :cond_26
    int-to-long v5, v0

    invoke-static {v5, v6}, Landroid/os/SystemClock;->sleep(J)V
    :try_end_2a
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_2a} :catch_2f
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6 .. :try_end_2a} :catch_2f
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_6 .. :try_end_2a} :catch_2f

    .line 107
    .end local v4    # "pingFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    :goto_2a
    add-int/lit8 v3, v3, 0x1

    .line 108
    mul-int/lit8 v0, v0, 0x2

    goto :goto_4

    .line 104
    :catch_2f
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "ProxyCache"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error pinging server [attempt: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", timeout: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]. "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2a

    .line 110
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_59
    const-string v5, "ProxyCache"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Shutdown server\u2026 Error pinging server [attempt: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", timeout: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]. "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "If you see this message, please, email me danikula@gmail.com"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->shutdown()V

    goto :goto_25
.end method

.method private onError(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 303
    const-string v0, "ProxyCache"

    const-string v1, "HttpProxyCacheServer error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 304
    return-void
.end method

.method private pingServer()Z
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 116
    const-string v7, "ping"

    invoke-direct {p0, v7}, Lcom/danikula/videocache/HttpProxyCacheServer;->appendToProxyUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 117
    .local v3, "pingUrl":Ljava/lang/String;
    new-instance v5, Lcom/danikula/videocache/HttpUrlSource;

    invoke-direct {v5, v3}, Lcom/danikula/videocache/HttpUrlSource;-><init>(Ljava/lang/String;)V

    .line 119
    .local v5, "source":Lcom/danikula/videocache/HttpUrlSource;
    :try_start_c
    const-string v7, "ping ok"

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 120
    .local v1, "expectedResponse":[B
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Lcom/danikula/videocache/HttpUrlSource;->open(I)V

    .line 121
    array-length v7, v1

    new-array v4, v7, [B

    .line 122
    .local v4, "response":[B
    invoke-virtual {v5, v4}, Lcom/danikula/videocache/HttpUrlSource;->read([B)I

    .line 123
    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    .line 124
    .local v2, "pingOk":Z
    const-string v7, "ProxyCache"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Ping response: `"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "`, pinged? "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_47
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_c .. :try_end_47} :catch_4b
    .catchall {:try_start_c .. :try_end_47} :catchall_58

    .line 130
    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    .end local v1    # "expectedResponse":[B
    .end local v2    # "pingOk":Z
    .end local v4    # "response":[B
    :goto_4a
    return v2

    .line 126
    :catch_4b
    move-exception v0

    .line 127
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    :try_start_4c
    const-string v7, "ProxyCache"

    const-string v8, "Error reading ping response"

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_53
    .catchall {:try_start_4c .. :try_end_53} :catchall_58

    .line 130
    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    move v2, v6

    goto :goto_4a

    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_58
    move-exception v6

    invoke-virtual {v5}, Lcom/danikula/videocache/HttpUrlSource;->close()V

    throw v6
.end method

.method private processSocket(Ljava/net/Socket;)V
    .registers 10
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 214
    :try_start_0
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lcom/danikula/videocache/GetRequest;->read(Ljava/io/InputStream;)Lcom/danikula/videocache/GetRequest;

    move-result-object v2

    .line 215
    .local v2, "request":Lcom/danikula/videocache/GetRequest;
    const-string v4, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Request to cache proxy:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    iget-object v4, v2, Lcom/danikula/videocache/GetRequest;->uri:Ljava/lang/String;

    invoke-static {v4}, Lcom/danikula/videocache/ProxyCacheUtils;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 217
    .local v3, "url":Ljava/lang/String;
    const-string v4, "ping"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_51

    .line 218
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->responseToPing(Ljava/net/Socket;)V
    :try_end_31
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_31} :catch_59
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_0 .. :try_end_31} :catch_81
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_31} :catch_81
    .catchall {:try_start_0 .. :try_end_31} :catchall_ac

    .line 230
    :goto_31
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 231
    const-string v4, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    .end local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .end local v3    # "url":Ljava/lang/String;
    :goto_50
    return-void

    .line 220
    .restart local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .restart local v3    # "url":Ljava/lang/String;
    :cond_51
    :try_start_51
    invoke-direct {p0, v3}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v0

    .line 221
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0, v2, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->processRequest(Lcom/danikula/videocache/GetRequest;Ljava/net/Socket;)V
    :try_end_58
    .catch Ljava/net/SocketException; {:try_start_51 .. :try_end_58} :catch_59
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_51 .. :try_end_58} :catch_81
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_58} :catch_81
    .catchall {:try_start_51 .. :try_end_58} :catchall_ac

    goto :goto_31

    .line 223
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .end local v2    # "request":Lcom/danikula/videocache/GetRequest;
    .end local v3    # "url":Ljava/lang/String;
    :catch_59
    move-exception v1

    .line 226
    .local v1, "e":Ljava/net/SocketException;
    :try_start_5a
    const-string v4, "ProxyCache"

    const-string v5, "Closing socket\u2026 Socket is closed by client."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_61
    .catchall {:try_start_5a .. :try_end_61} :catchall_ac

    .line 230
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 231
    const-string v4, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_50

    .line 227
    .end local v1    # "e":Ljava/net/SocketException;
    :catch_81
    move-exception v1

    .line 228
    .local v1, "e":Ljava/lang/Exception;
    :try_start_82
    new-instance v4, Lcom/danikula/videocache/ProxyCacheException;

    const-string v5, "Error processing request"

    invoke-direct {v4, v5, v1}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v4}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V
    :try_end_8c
    .catchall {:try_start_82 .. :try_end_8c} :catchall_ac

    .line 230
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 231
    const-string v4, "ProxyCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Opened connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_50

    .line 230
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_ac
    move-exception v4

    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->releaseSocket(Ljava/net/Socket;)V

    .line 231
    const-string v5, "ProxyCache"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Opened connections: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClientsCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    throw v4
.end method

.method private releaseSocket(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 263
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocketInput(Ljava/net/Socket;)V

    .line 264
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocketOutput(Ljava/net/Socket;)V

    .line 265
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->closeSocket(Ljava/net/Socket;)V

    .line 266
    return-void
.end method

.method private responseToPing(Ljava/net/Socket;)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 237
    .local v0, "out":Ljava/io/OutputStream;
    const-string v1, "HTTP/1.1 200 OK\n\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 238
    const-string v1, "ping ok"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 239
    return-void
.end method

.method private shutdownClients()V
    .registers 5

    .prologue
    .line 192
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 193
    :try_start_3
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 194
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->shutdown()V

    goto :goto_d

    .line 197
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v2

    .line 196
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_20
    :try_start_20
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 197
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_20 .. :try_end_26} :catchall_1d

    .line 198
    return-void
.end method

.method private waitForRequest()V
    .registers 6

    .prologue
    .line 202
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_3e

    .line 203
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 204
    .local v1, "socket":Ljava/net/Socket;
    const-string v2, "ProxyCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Accept new socket "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->socketProcessor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;

    invoke-direct {v3, p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_32} :catch_33

    goto :goto_0

    .line 207
    .end local v1    # "socket":Ljava/net/Socket;
    :catch_33
    move-exception v0

    .line 208
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/danikula/videocache/ProxyCacheException;

    const-string v3, "Error during waiting connection"

    invoke-direct {v2, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v2}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    .line 210
    .end local v0    # "e":Ljava/io/IOException;
    :cond_3e
    return-void
.end method


# virtual methods
.method public getProxyUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 135
    iget-boolean v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinged:Z

    if-nez v0, :cond_b

    .line 136
    const-string v0, "ProxyCache"

    const-string v1, "Proxy server isn\'t pinged. Caching doesn\'t work. If you see this message, please, email me danikula@gmail.com"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :cond_b
    iget-boolean v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->pinged:Z

    if-eqz v0, :cond_13

    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer;->appendToProxyUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "url":Ljava/lang/String;
    :cond_13
    return-object p1
.end method

.method public registerCacheListener(Lcom/danikula/videocache/CacheListener;Ljava/lang/String;)V
    .registers 7
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 146
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkAllNotNull([Ljava/lang/Object;)V

    .line 147
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 149
    :try_start_f
    invoke-direct {p0, p2}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->registerCacheListener(Lcom/danikula/videocache/CacheListener;)V
    :try_end_16
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_f .. :try_end_16} :catch_18
    .catchall {:try_start_f .. :try_end_16} :catchall_21

    .line 153
    :goto_16
    :try_start_16
    monitor-exit v2

    .line 154
    return-void

    .line 150
    :catch_18
    move-exception v0

    .line 151
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    const-string v1, "ProxyCache"

    const-string v3, "Error registering cache listener"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16

    .line 153
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_16 .. :try_end_23} :catchall_21

    throw v1
.end method

.method public shutdown()V
    .registers 4

    .prologue
    .line 177
    const-string v1, "ProxyCache"

    const-string v2, "Shutdown proxy server"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-direct {p0}, Lcom/danikula/videocache/HttpProxyCacheServer;->shutdownClients()V

    .line 181
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->waitConnectionThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 183
    :try_start_f
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 184
    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_1c} :catch_1d

    .line 189
    :cond_1c
    :goto_1c
    return-void

    .line 186
    :catch_1d
    move-exception v0

    .line 187
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    const-string v2, "Error shutting down proxy server"

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1c
.end method

.method public unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V
    .registers 6
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;

    .prologue
    .line 168
    invoke-static {p1}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 170
    :try_start_6
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/HttpProxyCacheServerClients;

    .line 171
    .local v0, "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    invoke-virtual {v0, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V

    goto :goto_10

    .line 173
    .end local v0    # "clients":Lcom/danikula/videocache/HttpProxyCacheServerClients;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_20
    move-exception v2

    monitor-exit v3
    :try_end_22
    .catchall {:try_start_6 .. :try_end_22} :catchall_20

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_23
    :try_start_23
    monitor-exit v3
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_20

    .line 174
    return-void
.end method

.method public unregisterCacheListener(Lcom/danikula/videocache/CacheListener;Ljava/lang/String;)V
    .registers 7
    .param p1, "cacheListener"    # Lcom/danikula/videocache/CacheListener;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 157
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Lcom/danikula/videocache/Preconditions;->checkAllNotNull([Ljava/lang/Object;)V

    .line 158
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServer;->clientsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 160
    :try_start_f
    invoke-direct {p0, p2}, Lcom/danikula/videocache/HttpProxyCacheServer;->getClients(Ljava/lang/String;)Lcom/danikula/videocache/HttpProxyCacheServerClients;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/danikula/videocache/HttpProxyCacheServerClients;->unregisterCacheListener(Lcom/danikula/videocache/CacheListener;)V
    :try_end_16
    .catch Lcom/danikula/videocache/ProxyCacheException; {:try_start_f .. :try_end_16} :catch_18
    .catchall {:try_start_f .. :try_end_16} :catchall_21

    .line 164
    :goto_16
    :try_start_16
    monitor-exit v2

    .line 165
    return-void

    .line 161
    :catch_18
    move-exception v0

    .line 162
    .local v0, "e":Lcom/danikula/videocache/ProxyCacheException;
    const-string v1, "ProxyCache"

    const-string v3, "Error registering cache listener"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16

    .line 164
    .end local v0    # "e":Lcom/danikula/videocache/ProxyCacheException;
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_16 .. :try_end_23} :catchall_21

    throw v1
.end method
