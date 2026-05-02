.class public Lcom/koushikdutta/async/http/AsyncSocketMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "AsyncSocketMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;,
        Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    }
.end annotation


# instance fields
.field connectAllAddresses:Z

.field connectionInfo:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;",
            ">;"
        }
    .end annotation
.end field

.field idleTimeoutMs:I

.field protected mClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

.field maxConnectionCount:I

.field port:I

.field proxyAddress:Ljava/net/InetSocketAddress;

.field proxyHost:Ljava/lang/String;

.field proxyPort:I

.field scheme:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V
    .registers 4
    .param p1, "client"    # Lcom/koushikdutta/async/http/AsyncHttpClient;

    .prologue
    .line 50
    const-string v0, "http"

    const/16 v1, 0x50

    invoke-direct {p0, p1, v0, v1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/lang/String;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/lang/String;I)V
    .registers 5
    .param p1, "client"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p2, "scheme"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    .line 26
    const v0, 0x493e0

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleTimeoutMs:I

    .line 110
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    .line 112
    const v0, 0x7fffffff

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maxConnectionCount:I

    .line 29
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->mClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    .line 30
    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->scheme:Ljava/lang/String;

    .line 31
    iput p3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->port:I

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/AsyncSocket;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncSocketMiddleware;
    .param p1, "x1"    # Lcom/koushikdutta/async/AsyncSocket;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleSocket(Lcom/koushikdutta/async/AsyncSocket;)V

    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncSocketMiddleware;
    .param p1, "x1"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p2, "x2"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->recycleSocket(Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method

.method static synthetic access$200(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncSocketMiddleware;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maybeCleanupConnectionInfo(Ljava/lang/String;)V

    return-void
.end method

.method private getOrCreateConnectionInfo(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    .registers 4
    .param p1, "lookup"    # Ljava/lang/String;

    .prologue
    .line 261
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    .line 262
    .local v0, "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    if-nez v0, :cond_14

    .line 263
    new-instance v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    .end local v0    # "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    invoke-direct {v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;-><init>()V

    .line 264
    .restart local v0    # "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :cond_14
    return-object v0
.end method

.method private idleSocket(Lcom/koushikdutta/async/AsyncSocket;)V
    .registers 3
    .param p1, "socket"    # Lcom/koushikdutta/async/AsyncSocket;

    .prologue
    .line 313
    new-instance v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$3;

    invoke-direct {v0, p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$3;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/AsyncSocket;)V

    invoke-interface {p1, v0}, Lcom/koushikdutta/async/AsyncSocket;->setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 320
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/koushikdutta/async/AsyncSocket;->setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V

    .line 323
    new-instance v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$4;

    invoke-direct {v0, p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$4;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/AsyncSocket;)V

    invoke-interface {p1, v0}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 332
    return-void
.end method

.method private maybeCleanupConnectionInfo(Ljava/lang/String;)V
    .registers 9
    .param p1, "lookup"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    .line 271
    .local v1, "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    if-nez v1, :cond_17

    .line 285
    :cond_a
    :goto_a
    return-void

    .line 278
    .local v0, "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    .local v2, "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_b
    iget-object v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ArrayDeque;->pop()Ljava/lang/Object;

    .line 280
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 281
    invoke-interface {v2}, Lcom/koushikdutta/async/AsyncSocket;->close()V

    .line 273
    .end local v0    # "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    .end local v2    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_17
    iget-object v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ArrayDeque;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_37

    .line 274
    iget-object v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ArrayDeque;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;

    .line 275
    .restart local v0    # "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;->socket:Lcom/koushikdutta/async/AsyncSocket;

    .line 276
    .restart local v2    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    iget-wide v3, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;->idleTime:J

    iget v5, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleTimeoutMs:I

    int-to-long v5, v5

    add-long/2addr v3, v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_b

    .line 283
    .end local v0    # "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    .end local v2    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_37
    iget v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    if-nez v3, :cond_a

    iget-object v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->queue:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ArrayDeque;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    iget-object v3, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ArrayDeque;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 284
    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a
.end method

.method private nextConnection(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 11
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 335
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v6

    .line 336
    .local v6, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v6}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSchemePort(Landroid/net/Uri;)I

    move-result v4

    .line 337
    .local v4, "port":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyPort()I

    move-result v8

    invoke-virtual {p0, v6, v4, v7, v8}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->computeLookup(Landroid/net/Uri;ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 338
    .local v3, "key":Ljava/lang/String;
    monitor-enter p0

    .line 339
    :try_start_15
    iget-object v7, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectionInfo:Ljava/util/Hashtable;

    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    .line 340
    .local v2, "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    if-nez v2, :cond_21

    .line 341
    monitor-exit p0

    .line 353
    :goto_20
    return-void

    .line 342
    :cond_21
    iget v7, v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    .line 343
    :cond_27
    :goto_27
    iget v7, v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    iget v8, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maxConnectionCount:I

    if-ge v7, v8, :cond_52

    iget-object v7, v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->queue:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v7

    if-lez v7, :cond_52

    .line 344
    iget-object v7, v2, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->queue:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .line 345
    .local v1, "gsd":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    iget-object v5, v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->socketCancellable:Lcom/koushikdutta/async/future/Cancellable;

    check-cast v5, Lcom/koushikdutta/async/future/SimpleCancellable;

    .line 346
    .local v5, "socketCancellable":Lcom/koushikdutta/async/future/SimpleCancellable;
    invoke-virtual {v5}, Lcom/koushikdutta/async/future/SimpleCancellable;->isCancelled()Z

    move-result v7

    if-nez v7, :cond_27

    .line 348
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v0

    .line 349
    .local v0, "connect":Lcom/koushikdutta/async/future/Cancellable;
    invoke-virtual {v5, v0}, Lcom/koushikdutta/async/future/SimpleCancellable;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleCancellable;

    goto :goto_27

    .line 352
    .end local v0    # "connect":Lcom/koushikdutta/async/future/Cancellable;
    .end local v1    # "gsd":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .end local v2    # "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    .end local v5    # "socketCancellable":Lcom/koushikdutta/async/future/SimpleCancellable;
    :catchall_4f
    move-exception v7

    monitor-exit p0
    :try_end_51
    .catchall {:try_start_15 .. :try_end_51} :catchall_4f

    throw v7

    .line 351
    .restart local v2    # "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    :cond_52
    :try_start_52
    invoke-direct {p0, v3}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maybeCleanupConnectionInfo(Ljava/lang/String;)V

    .line 352
    monitor-exit p0
    :try_end_56
    .catchall {:try_start_52 .. :try_end_56} :catchall_4f

    goto :goto_20
.end method

.method private recycleSocket(Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 11
    .param p1, "socket"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p2, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 288
    if-nez p1, :cond_3

    .line 309
    :goto_2
    return-void

    .line 290
    :cond_3
    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v5

    .line 291
    .local v5, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v5}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSchemePort(Landroid/net/Uri;)I

    move-result v3

    .line 292
    .local v3, "port":I
    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyPort()I

    move-result v7

    invoke-virtual {p0, v5, v3, v6, v7}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->computeLookup(Landroid/net/Uri;ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    .line 294
    .local v2, "lookup":Ljava/lang/String;
    new-instance v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;

    invoke-direct {v0, p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 295
    .local v0, "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    monitor-enter p0

    .line 296
    :try_start_1d
    invoke-direct {p0, v2}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getOrCreateConnectionInfo(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    move-result-object v1

    .line 297
    .local v1, "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    iget-object v4, v1, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    .line 298
    .local v4, "sockets":Lcom/koushikdutta/async/ArrayDeque;, "Lcom/koushikdutta/async/ArrayDeque<Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;>;"
    invoke-virtual {v4, v0}, Lcom/koushikdutta/async/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 299
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_1d .. :try_end_27} :catchall_30

    .line 300
    new-instance v6, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$2;

    invoke-direct {v6, p0, v4, v0, v2}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$2;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/ArrayDeque;Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;Ljava/lang/String;)V

    invoke-interface {p1, v6}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    goto :goto_2

    .line 299
    .end local v1    # "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    .end local v4    # "sockets":Lcom/koushikdutta/async/ArrayDeque;, "Lcom/koushikdutta/async/ArrayDeque<Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;>;"
    :catchall_30
    move-exception v6

    :try_start_31
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v6
.end method


# virtual methods
.method computeLookup(Landroid/net/Uri;ILjava/lang/String;I)Ljava/lang/String;
    .registers 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "port"    # I
    .param p3, "proxyHost"    # Ljava/lang/String;
    .param p4, "proxyPort"    # I

    .prologue
    .line 86
    if-eqz p3, :cond_66

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "proxy":Ljava/lang/String;
    :goto_19
    if-eqz p3, :cond_32

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    :cond_32
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "//"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?proxy="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 89
    .end local v0    # "proxy":Ljava/lang/String;
    :cond_66
    const-string v0, ""

    .restart local v0    # "proxy":Ljava/lang/String;
    goto :goto_19
.end method

.method public disableProxy()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 73
    const/4 v0, -0x1

    iput v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyPort:I

    .line 74
    iput-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyHost:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyAddress:Ljava/net/InetSocketAddress;

    .line 76
    return-void
.end method

.method public enableProxy(Ljava/lang/String;I)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 79
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyHost:Ljava/lang/String;

    .line 80
    iput p2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyPort:I

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyAddress:Ljava/net/InetSocketAddress;

    .line 82
    return-void
.end method

.method public getConnectAllAddresses()Z
    .registers 2

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectAllAddresses:Z

    return v0
.end method

.method public getMaxConnectionCount()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maxConnectionCount:I

    return v0
.end method

.method public getSchemePort(Landroid/net/Uri;)I
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v0, -0x1

    .line 39
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_13

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->scheme:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    .line 45
    :cond_13
    :goto_13
    return v0

    .line 41
    :cond_14
    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v1

    if-ne v1, v0, :cond_1d

    .line 42
    iget v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->port:I

    goto :goto_13

    .line 45
    :cond_1d
    invoke-virtual {p1}, Landroid/net/Uri;->getPort()I

    move-result v0

    goto :goto_13
.end method

.method public getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 20
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    .line 124
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 125
    .local v4, "uri":Landroid/net/Uri;
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSchemePort(Landroid/net/Uri;)I

    move-result v5

    .line 126
    .local v5, "port":I
    const/4 v2, -0x1

    if-ne v5, v2, :cond_1b

    .line 127
    const/4 v11, 0x0

    .line 191
    :goto_1a
    return-object v11

    .line 130
    :cond_1b
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v3, "socket-owner"

    move-object/from16 v0, p0

    invoke-virtual {v2, v3, v0}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 132
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyPort()I

    move-result v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5, v2, v3}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->computeLookup(Landroid/net/Uri;ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v10

    .line 133
    .local v10, "lookup":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getOrCreateConnectionInfo(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;

    move-result-object v9

    .line 134
    .local v9, "info":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;
    monitor-enter p0

    .line 135
    :try_start_43
    iget v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maxConnectionCount:I

    if-lt v2, v3, :cond_5c

    .line 137
    new-instance v11, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-direct {v11}, Lcom/koushikdutta/async/future/SimpleCancellable;-><init>()V

    .line 138
    .local v11, "queueCancel":Lcom/koushikdutta/async/future/SimpleCancellable;
    iget-object v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->queue:Lcom/koushikdutta/async/ArrayDeque;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 139
    monitor-exit p0

    goto :goto_1a

    .line 163
    .end local v11    # "queueCancel":Lcom/koushikdutta/async/future/SimpleCancellable;
    :catchall_59
    move-exception v2

    monitor-exit p0
    :try_end_5b
    .catchall {:try_start_43 .. :try_end_5b} :catchall_59

    throw v2

    .line 142
    :cond_5c
    :try_start_5c
    iget v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->openCount:I

    .line 144
    :cond_62
    :goto_62
    iget-object v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v2}, Lcom/koushikdutta/async/ArrayDeque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b2

    .line 145
    iget-object v2, v9, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$ConnectionInfo;->sockets:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v2}, Lcom/koushikdutta/async/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;

    .line 146
    .local v8, "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    iget-object v13, v8, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;->socket:Lcom/koushikdutta/async/AsyncSocket;

    .line 147
    .local v13, "socket":Lcom/koushikdutta/async/AsyncSocket;
    iget-wide v2, v8, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;->idleTime:J

    move-object/from16 v0, p0

    iget v7, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleTimeoutMs:I

    int-to-long v0, v7

    move-wide/from16 v16, v0

    add-long v2, v2, v16

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    cmp-long v2, v2, v16

    if-gez v2, :cond_8f

    .line 148
    const/4 v2, 0x0

    invoke-interface {v13, v2}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 149
    invoke-interface {v13}, Lcom/koushikdutta/async/AsyncSocket;->close()V

    goto :goto_62

    .line 152
    :cond_8f
    invoke-interface {v13}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 155
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v3, "Reusing keep-alive socket"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 156
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->connectCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    const/4 v3, 0x0

    invoke-interface {v2, v3, v13}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 159
    new-instance v12, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-direct {v12}, Lcom/koushikdutta/async/future/SimpleCancellable;-><init>()V

    .line 160
    .local v12, "ret":Lcom/koushikdutta/async/future/SimpleCancellable;
    invoke-virtual {v12}, Lcom/koushikdutta/async/future/SimpleCancellable;->setComplete()Z

    .line 161
    monitor-exit p0

    move-object v11, v12

    goto/16 :goto_1a

    .line 163
    .end local v8    # "idleSocketHolder":Lcom/koushikdutta/async/http/AsyncSocketMiddleware$IdleSocketHolder;
    .end local v12    # "ret":Lcom/koushikdutta/async/future/SimpleCancellable;
    .end local v13    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_b2
    monitor-exit p0
    :try_end_b3
    .catchall {:try_start_5c .. :try_end_b3} :catchall_59

    .line 165
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectAllAddresses:Z

    if-eqz v2, :cond_c9

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyHost:Ljava/lang/String;

    if-nez v2, :cond_c9

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_155

    .line 167
    :cond_c9
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v3, "Connecting socket"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 170
    const/4 v6, 0x0

    .line 171
    .local v6, "proxied":Z
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f2

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyHost:Ljava/lang/String;

    if-eqz v2, :cond_f2

    .line 172
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyHost:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v7, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->proxyPort:I

    invoke-virtual {v2, v3, v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->enableProxy(Ljava/lang/String;I)V

    .line 173
    :cond_f2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_14f

    .line 174
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyHost()Ljava/lang/String;

    move-result-object v14

    .line 175
    .local v14, "unresolvedHost":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getProxyPort()I

    move-result v15

    .line 176
    .local v15, "unresolvedPort":I
    const/4 v6, 0x1

    .line 182
    :goto_10d
    if-eqz v6, :cond_133

    .line 183
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using proxy: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, ":"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 185
    :cond_133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->mClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v16

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->connectCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v14, v15, v2}, Lcom/koushikdutta/async/AsyncServer;->connectSocket(Ljava/lang/String;ILcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v11

    goto/16 :goto_1a

    .line 179
    .end local v14    # "unresolvedHost":Ljava/lang/String;
    .end local v15    # "unresolvedPort":I
    :cond_14f
    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v14

    .line 180
    .restart local v14    # "unresolvedHost":Ljava/lang/String;
    move v15, v5

    .restart local v15    # "unresolvedPort":I
    goto :goto_10d

    .line 190
    .end local v6    # "proxied":Z
    .end local v14    # "unresolvedHost":Ljava/lang/String;
    .end local v15    # "unresolvedPort":I
    :cond_155
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v3, "Resolving domain and connecting to all available addresses"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 191
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->mClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v2

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->getAllByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;

    move-result-object v2

    new-instance v3, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v3, v0, v1, v4, v5}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;I)V

    invoke-interface {v2, v3}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/async/future/Cancellable;

    move-object v11, v2

    goto/16 :goto_1a
.end method

.method public onResponseComplete(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V
    .registers 4
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    .prologue
    .line 357
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v1, "socket-owner"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_b

    .line 382
    :goto_a
    return-void

    .line 361
    :cond_b
    :try_start_b
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleSocket(Lcom/koushikdutta/async/AsyncSocket;)V

    .line 363
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->exception:Ljava/lang/Exception;

    if-nez v0, :cond_1c

    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v0

    if-nez v0, :cond_34

    .line 364
    :cond_1c
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "closing out socket (exception)"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 365
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 366
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->close()V
    :try_end_2e
    .catchall {:try_start_b .. :try_end_2e} :catchall_80

    .line 380
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->nextConnection(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    goto :goto_a

    .line 369
    :cond_34
    :try_start_34
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->protocol()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/HttpUtil;->isKeepAlive(Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)Z

    move-result v0

    if-eqz v0, :cond_54

    sget-object v0, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/HttpUtil;->isKeepAlive(Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;)Z

    move-result v0

    if-nez v0, :cond_6c

    .line 371
    :cond_54
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "closing out socket (not keep alive)"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 372
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 373
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->close()V
    :try_end_66
    .catchall {:try_start_34 .. :try_end_66} :catchall_80

    .line 380
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->nextConnection(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    goto :goto_a

    .line 376
    :cond_6c
    :try_start_6c
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "Recycling keep-alive socket"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 377
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->recycleSocket(Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    :try_end_7a
    .catchall {:try_start_6c .. :try_end_7a} :catchall_80

    .line 380
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->nextConnection(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    goto :goto_a

    :catchall_80
    move-exception v0

    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->nextConnection(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    throw v0
.end method

.method public setConnectAllAddresses(Z)V
    .registers 2
    .param p1, "connectAllAddresses"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->connectAllAddresses:Z

    .line 66
    return-void
.end method

.method public setIdleTimeoutMs(I)V
    .registers 2
    .param p1, "idleTimeoutMs"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->idleTimeoutMs:I

    .line 36
    return-void
.end method

.method public setMaxConnectionCount(I)V
    .registers 2
    .param p1, "maxConnectionCount"    # I

    .prologue
    .line 119
    iput p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->maxConnectionCount:I

    .line 120
    return-void
.end method

.method protected wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;
    .registers 6
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "port"    # I
    .param p4, "proxied"    # Z
    .param p5, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 56
    return-object p5
.end method
