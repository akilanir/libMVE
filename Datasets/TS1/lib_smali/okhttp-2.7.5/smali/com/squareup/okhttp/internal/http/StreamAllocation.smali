.class public final Lcom/squareup/okhttp/internal/http/StreamAllocation;
.super Ljava/lang/Object;
.source "StreamAllocation.java"


# instance fields
.field public final address:Lcom/squareup/okhttp/Address;

.field private canceled:Z

.field private connection:Lcom/squareup/okhttp/internal/io/RealConnection;

.field private final connectionPool:Lcom/squareup/okhttp/ConnectionPool;

.field private released:Z

.field private routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

.field private stream:Lcom/squareup/okhttp/internal/http/HttpStream;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Address;)V
    .registers 3
    .param p1, "connectionPool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "address"    # Lcom/squareup/okhttp/Address;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    .line 88
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->address:Lcom/squareup/okhttp/Address;

    .line 89
    return-void
.end method

.method private connectionFailed(Ljava/io/IOException;)V
    .registers 5
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 276
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 277
    :try_start_3
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v1, :cond_18

    .line 278
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    iget v1, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    if-nez v1, :cond_1d

    .line 280
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/io/RealConnection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    .line 281
    .local v0, "failedRoute":Lcom/squareup/okhttp/Route;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v1, v0, p1}, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectFailed(Lcom/squareup/okhttp/Route;Ljava/io/IOException;)V

    .line 287
    .end local v0    # "failedRoute":Lcom/squareup/okhttp/Route;
    :cond_18
    :goto_18
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_21

    .line 288
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionFailed()V

    .line 289
    return-void

    .line 284
    :cond_1d
    const/4 v1, 0x0

    :try_start_1e
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    goto :goto_18

    .line 287
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_1e .. :try_end_23} :catchall_21

    throw v1
.end method

.method private deallocate(ZZZ)V
    .registers 9
    .param p1, "noNewStreams"    # Z
    .param p2, "released"    # Z
    .param p3, "streamFinished"    # Z

    .prologue
    .line 228
    const/4 v0, 0x0

    .line 229
    .local v0, "connectionToClose":Lcom/squareup/okhttp/internal/io/RealConnection;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 230
    if-eqz p3, :cond_9

    .line 231
    const/4 v1, 0x0

    :try_start_7
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    .line 233
    :cond_9
    if-eqz p2, :cond_e

    .line 234
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->released:Z

    .line 236
    :cond_e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    if-eqz v1, :cond_58

    .line 237
    if-eqz p1, :cond_19

    .line 238
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->noNewStreams:Z

    .line 240
    :cond_19
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    if-nez v1, :cond_58

    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->released:Z

    if-nez v1, :cond_27

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    iget-boolean v1, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->noNewStreams:Z

    if-eqz v1, :cond_58

    .line 241
    :cond_27
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    invoke-direct {p0, v1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release(Lcom/squareup/okhttp/internal/io/RealConnection;)V

    .line 242
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    iget v1, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    if-lez v1, :cond_35

    .line 243
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 245
    :cond_35
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    iget-object v1, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_55

    .line 246
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iput-wide v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->idleAtNanos:J

    .line 247
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    invoke-virtual {v1, v3, v4}, Lcom/squareup/okhttp/internal/Internal;->connectionBecameIdle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/internal/io/RealConnection;)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 248
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 251
    :cond_55
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 254
    :cond_58
    monitor-exit v2
    :try_end_59
    .catchall {:try_start_7 .. :try_end_59} :catchall_63

    .line 255
    if-eqz v0, :cond_62

    .line 256
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/io/RealConnection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 258
    :cond_62
    return-void

    .line 254
    :catchall_63
    move-exception v1

    :try_start_64
    monitor-exit v2
    :try_end_65
    .catchall {:try_start_64 .. :try_end_65} :catchall_63

    throw v1
.end method

.method private findConnection(IIIZ)Lcom/squareup/okhttp/internal/io/RealConnection;
    .registers 14
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionRetryEnabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .line 151
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 152
    :try_start_3
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->released:Z

    if-eqz v1, :cond_12

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "released"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 172
    :catchall_f
    move-exception v1

    monitor-exit v2
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v1

    .line 153
    :cond_12
    :try_start_12
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    if-eqz v1, :cond_1e

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "stream != null"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 154
    :cond_1e
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->canceled:Z

    if-eqz v1, :cond_2a

    new-instance v1, Ljava/io/IOException;

    const-string v3, "Canceled"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_2a
    iget-object v6, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 157
    .local v6, "allocatedConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    if-eqz v6, :cond_34

    iget-boolean v1, v6, Lcom/squareup/okhttp/internal/io/RealConnection;->noNewStreams:Z

    if-nez v1, :cond_34

    .line 158
    monitor-exit v2

    .line 188
    .end local v6    # "allocatedConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    :goto_33
    return-object v6

    .line 162
    .restart local v6    # "allocatedConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    :cond_34
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1, v3, v4, p0}, Lcom/squareup/okhttp/internal/Internal;->get(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Address;Lcom/squareup/okhttp/internal/http/StreamAllocation;)Lcom/squareup/okhttp/internal/io/RealConnection;

    move-result-object v7

    .line 163
    .local v7, "pooledConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    if-eqz v7, :cond_45

    .line 164
    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 165
    monitor-exit v2

    move-object v6, v7

    goto :goto_33

    .line 169
    :cond_45
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-nez v1, :cond_56

    .line 170
    new-instance v1, Lcom/squareup/okhttp/internal/http/RouteSelector;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->address:Lcom/squareup/okhttp/Address;

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/squareup/okhttp/internal/http/RouteSelector;-><init>(Lcom/squareup/okhttp/Address;Lcom/squareup/okhttp/internal/RouteDatabase;)V

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 172
    :cond_56
    monitor-exit v2
    :try_end_57
    .catchall {:try_start_12 .. :try_end_57} :catchall_f

    .line 174
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/RouteSelector;->next()Lcom/squareup/okhttp/Route;

    move-result-object v8

    .line 175
    .local v8, "route":Lcom/squareup/okhttp/Route;
    new-instance v0, Lcom/squareup/okhttp/internal/io/RealConnection;

    invoke-direct {v0, v8}, Lcom/squareup/okhttp/internal/io/RealConnection;-><init>(Lcom/squareup/okhttp/Route;)V

    .line 176
    .local v0, "newConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->acquire(Lcom/squareup/okhttp/internal/io/RealConnection;)V

    .line 178
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 179
    :try_start_68
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-virtual {v1, v3, v0}, Lcom/squareup/okhttp/internal/Internal;->put(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/internal/io/RealConnection;)V

    .line 180
    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 181
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->canceled:Z

    if-eqz v1, :cond_80

    new-instance v1, Ljava/io/IOException;

    const-string v3, "Canceled"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 182
    :catchall_7d
    move-exception v1

    monitor-exit v2
    :try_end_7f
    .catchall {:try_start_68 .. :try_end_7f} :catchall_7d

    throw v1

    :cond_80
    :try_start_80
    monitor-exit v2
    :try_end_81
    .catchall {:try_start_80 .. :try_end_81} :catchall_7d

    .line 184
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getConnectionSpecs()Ljava/util/List;

    move-result-object v4

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/squareup/okhttp/internal/io/RealConnection;->connect(IIILjava/util/List;Z)V

    .line 186
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v1

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/io/RealConnection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/RouteDatabase;->connected(Lcom/squareup/okhttp/Route;)V

    move-object v6, v0

    .line 188
    goto :goto_33
.end method

.method private findHealthyConnection(IIIZZ)Lcom/squareup/okhttp/internal/io/RealConnection;
    .registers 9
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionRetryEnabled"    # Z
    .param p5, "doExtensiveHealthChecks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .line 126
    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->findConnection(IIIZ)Lcom/squareup/okhttp/internal/io/RealConnection;

    move-result-object v0

    .line 130
    .local v0, "candidate":Lcom/squareup/okhttp/internal/io/RealConnection;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 131
    :try_start_7
    iget v1, v0, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    if-nez v1, :cond_d

    .line 132
    monitor-exit v2

    .line 138
    :cond_c
    return-object v0

    .line 134
    :cond_d
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_18

    .line 137
    invoke-virtual {v0, p5}, Lcom/squareup/okhttp/internal/io/RealConnection;->isHealthy(Z)Z

    move-result v1

    if-nez v1, :cond_c

    .line 141
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionFailed()V

    goto :goto_0

    .line 134
    :catchall_18
    move-exception v1

    :try_start_19
    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_18

    throw v1
.end method

.method private isRecoverable(Lcom/squareup/okhttp/internal/http/RouteException;)Z
    .registers 5
    .param p1, "e"    # Lcom/squareup/okhttp/internal/http/RouteException;

    .prologue
    const/4 v1, 0x0

    .line 370
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v0

    .line 373
    .local v0, "ioe":Ljava/io/IOException;
    instance-of v2, v0, Ljava/net/ProtocolException;

    if-eqz v2, :cond_a

    .line 400
    :cond_9
    :goto_9
    return v1

    .line 379
    :cond_a
    instance-of v2, v0, Ljava/io/InterruptedIOException;

    if-eqz v2, :cond_11

    .line 380
    instance-of v1, v0, Ljava/net/SocketTimeoutException;

    goto :goto_9

    .line 385
    :cond_11
    instance-of v2, v0, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v2, :cond_1d

    .line 388
    invoke-virtual {v0}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    instance-of v2, v2, Ljava/security/cert/CertificateException;

    if-nez v2, :cond_9

    .line 392
    :cond_1d
    instance-of v2, v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-nez v2, :cond_9

    .line 400
    const/4 v1, 0x1

    goto :goto_9
.end method

.method private isRecoverable(Ljava/io/IOException;)Z
    .registers 4
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v0, 0x0

    .line 353
    instance-of v1, p1, Ljava/net/ProtocolException;

    if-eqz v1, :cond_6

    .line 362
    :cond_5
    :goto_5
    return v0

    .line 358
    :cond_6
    instance-of v1, p1, Ljava/io/InterruptedIOException;

    if-nez v1, :cond_5

    .line 362
    const/4 v0, 0x1

    goto :goto_5
.end method

.method private release(Lcom/squareup/okhttp/internal/io/RealConnection;)V
    .registers 6
    .param p1, "connection"    # Lcom/squareup/okhttp/internal/io/RealConnection;

    .prologue
    .line 306
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p1, Lcom/squareup/okhttp/internal/io/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_7
    if-ge v0, v2, :cond_20

    .line 307
    iget-object v3, p1, Lcom/squareup/okhttp/internal/io/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/Reference;

    .line 308
    .local v1, "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lcom/squareup/okhttp/internal/http/StreamAllocation;>;"
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_1d

    .line 309
    iget-object v3, p1, Lcom/squareup/okhttp/internal/io/RealConnection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 310
    return-void

    .line 306
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 313
    .end local v1    # "reference":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<Lcom/squareup/okhttp/internal/http/StreamAllocation;>;"
    :cond_20
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3
.end method

.method private routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;
    .registers 3

    .prologue
    .line 207
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Internal;->routeDatabase(Lcom/squareup/okhttp/ConnectionPool;)Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public acquire(Lcom/squareup/okhttp/internal/io/RealConnection;)V
    .registers 4
    .param p1, "connection"    # Lcom/squareup/okhttp/internal/io/RealConnection;

    .prologue
    .line 301
    iget-object v0, p1, Lcom/squareup/okhttp/internal/io/RealConnection;->allocations:Ljava/util/List;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    return-void
.end method

.method public cancel()V
    .registers 5

    .prologue
    .line 263
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v3

    .line 264
    const/4 v2, 0x1

    :try_start_4
    iput-boolean v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->canceled:Z

    .line 265
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    .line 266
    .local v1, "streamToCancel":Lcom/squareup/okhttp/internal/http/HttpStream;
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    .line 267
    .local v0, "connectionToCancel":Lcom/squareup/okhttp/internal/io/RealConnection;
    monitor-exit v3
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_11

    .line 268
    if-eqz v1, :cond_14

    .line 269
    invoke-interface {v1}, Lcom/squareup/okhttp/internal/http/HttpStream;->cancel()V

    .line 273
    :cond_10
    :goto_10
    return-void

    .line 267
    .end local v0    # "connectionToCancel":Lcom/squareup/okhttp/internal/io/RealConnection;
    .end local v1    # "streamToCancel":Lcom/squareup/okhttp/internal/http/HttpStream;
    :catchall_11
    move-exception v2

    :try_start_12
    monitor-exit v3
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v2

    .line 270
    .restart local v0    # "connectionToCancel":Lcom/squareup/okhttp/internal/io/RealConnection;
    .restart local v1    # "streamToCancel":Lcom/squareup/okhttp/internal/http/HttpStream;
    :cond_14
    if-eqz v0, :cond_10

    .line 271
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/io/RealConnection;->cancel()V

    goto :goto_10
.end method

.method public declared-synchronized connection()Lcom/squareup/okhttp/internal/io/RealConnection;
    .registers 2

    .prologue
    .line 211
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public connectionFailed()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 293
    const/4 v0, 0x0

    invoke-direct {p0, v1, v0, v1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->deallocate(ZZZ)V

    .line 294
    return-void
.end method

.method public newStream(IIIZZ)Lcom/squareup/okhttp/internal/http/HttpStream;
    .registers 13
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionRetryEnabled"    # Z
    .param p5, "doExtensiveHealthChecks"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/squareup/okhttp/internal/http/RouteException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    :try_start_0
    invoke-direct/range {p0 .. p5}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->findHealthyConnection(IIIZZ)Lcom/squareup/okhttp/internal/io/RealConnection;

    move-result-object v1

    .line 99
    .local v1, "resultConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    iget-object v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-eqz v3, :cond_1c

    .line 100
    new-instance v2, Lcom/squareup/okhttp/internal/http/Http2xStream;

    iget-object v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-direct {v2, p0, v3}, Lcom/squareup/okhttp/internal/http/Http2xStream;-><init>(Lcom/squareup/okhttp/internal/http/StreamAllocation;Lcom/squareup/okhttp/internal/framed/FramedConnection;)V

    .line 108
    .local v2, "resultStream":Lcom/squareup/okhttp/internal/http/HttpStream;
    :goto_f
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v4
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_12} :catch_48

    .line 109
    :try_start_12
    iget v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    .line 110
    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    .line 111
    monitor-exit v4
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_45

    return-object v2

    .line 102
    .end local v2    # "resultStream":Lcom/squareup/okhttp/internal/http/HttpStream;
    :cond_1c
    :try_start_1c
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/io/RealConnection;->getSocket()Ljava/net/Socket;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 103
    iget-object v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->source:Lokio/BufferedSource;

    invoke-interface {v3}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v3

    int-to-long v4, p2

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 104
    iget-object v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->timeout()Lokio/Timeout;

    move-result-object v3

    int-to-long v4, p3

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 105
    new-instance v2, Lcom/squareup/okhttp/internal/http/Http1xStream;

    iget-object v3, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->source:Lokio/BufferedSource;

    iget-object v4, v1, Lcom/squareup/okhttp/internal/io/RealConnection;->sink:Lokio/BufferedSink;

    invoke-direct {v2, p0, v3, v4}, Lcom/squareup/okhttp/internal/http/Http1xStream;-><init>(Lcom/squareup/okhttp/internal/http/StreamAllocation;Lokio/BufferedSource;Lokio/BufferedSink;)V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_44} :catch_48

    .restart local v2    # "resultStream":Lcom/squareup/okhttp/internal/http/HttpStream;
    goto :goto_f

    .line 112
    :catchall_45
    move-exception v3

    :try_start_46
    monitor-exit v4
    :try_end_47
    .catchall {:try_start_46 .. :try_end_47} :catchall_45

    :try_start_47
    throw v3
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_48} :catch_48

    .line 113
    .end local v1    # "resultConnection":Lcom/squareup/okhttp/internal/io/RealConnection;
    .end local v2    # "resultStream":Lcom/squareup/okhttp/internal/http/HttpStream;
    :catch_48
    move-exception v0

    .line 114
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/squareup/okhttp/internal/http/RouteException;

    invoke-direct {v3, v0}, Lcom/squareup/okhttp/internal/http/RouteException;-><init>(Ljava/io/IOException;)V

    throw v3
.end method

.method public noNewStreams()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 220
    const/4 v0, 0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->deallocate(ZZZ)V

    .line 221
    return-void
.end method

.method public recover(Lcom/squareup/okhttp/internal/http/RouteException;)Z
    .registers 3
    .param p1, "e"    # Lcom/squareup/okhttp/internal/http/RouteException;

    .prologue
    .line 317
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    if-eqz v0, :cond_b

    .line 318
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionFailed(Ljava/io/IOException;)V

    .line 321
    :cond_b
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 322
    :cond_17
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->isRecoverable(Lcom/squareup/okhttp/internal/http/RouteException;)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 323
    :cond_1d
    const/4 v0, 0x0

    .line 326
    :goto_1e
    return v0

    :cond_1f
    const/4 v0, 0x1

    goto :goto_1e
.end method

.method public recover(Ljava/io/IOException;Lokio/Sink;)Z
    .registers 8
    .param p1, "e"    # Ljava/io/IOException;
    .param p2, "requestBodyOut"    # Lokio/Sink;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 330
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    if-eqz v4, :cond_10

    .line 331
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connection:Lcom/squareup/okhttp/internal/io/RealConnection;

    iget v1, v4, Lcom/squareup/okhttp/internal/io/RealConnection;->streamCount:I

    .line 332
    .local v1, "streamCount":I
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionFailed(Ljava/io/IOException;)V

    .line 334
    if-ne v1, v3, :cond_10

    .line 348
    .end local v1    # "streamCount":I
    :cond_f
    :goto_f
    return v2

    .line 341
    :cond_10
    if-eqz p2, :cond_16

    instance-of v4, p2, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v4, :cond_2d

    :cond_16
    move v0, v3

    .line 342
    .local v0, "canRetryRequestBody":Z
    :goto_17
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v4, :cond_23

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    .line 343
    :cond_23
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->isRecoverable(Ljava/io/IOException;)Z

    move-result v4

    if-eqz v4, :cond_f

    if-eqz v0, :cond_f

    move v2, v3

    .line 348
    goto :goto_f

    .end local v0    # "canRetryRequestBody":Z
    :cond_2d
    move v0, v2

    .line 341
    goto :goto_17
.end method

.method public release()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 215
    const/4 v0, 0x1

    invoke-direct {p0, v1, v0, v1}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->deallocate(ZZZ)V

    .line 216
    return-void
.end method

.method public stream()Lcom/squareup/okhttp/internal/http/HttpStream;
    .registers 3

    .prologue
    .line 201
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 202
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    monitor-exit v1

    return-object v0

    .line 203
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public streamFinished(Lcom/squareup/okhttp/internal/http/HttpStream;)V
    .registers 6
    .param p1, "stream"    # Lcom/squareup/okhttp/internal/http/HttpStream;

    .prologue
    const/4 v2, 0x0

    .line 192
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->connectionPool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 193
    if-eqz p1, :cond_a

    :try_start_6
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    if-eq p1, v0, :cond_32

    .line 194
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->stream:Lcom/squareup/okhttp/internal/http/HttpStream;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :catchall_2f
    move-exception v0

    monitor-exit v1
    :try_end_31
    .catchall {:try_start_6 .. :try_end_31} :catchall_2f

    throw v0

    :cond_32
    :try_start_32
    monitor-exit v1
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_2f

    .line 197
    const/4 v0, 0x1

    invoke-direct {p0, v2, v2, v0}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->deallocate(ZZZ)V

    .line 198
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/StreamAllocation;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
