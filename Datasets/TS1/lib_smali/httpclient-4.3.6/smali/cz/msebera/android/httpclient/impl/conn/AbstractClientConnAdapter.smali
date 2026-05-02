.class public abstract Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;
.super Ljava/lang/Object;
.source "AbstractClientConnAdapter.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/ManagedClientConnection;
.implements Lcz/msebera/android/httpclient/protocol/HttpContext;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

.field private volatile duration:J

.field private volatile markedReusable:Z

.field private volatile released:Z

.field private volatile wrappedConnection:Lcz/msebera/android/httpclient/conn/OperatedClientConnection;


# direct methods
.method protected constructor <init>(Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V
    .registers 5
    .param p1, "mgr"    # Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .param p2, "conn"    # Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    .prologue
    const/4 v0, 0x0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    .line 105
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->wrappedConnection:Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    .line 106
    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->markedReusable:Z

    .line 107
    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z

    .line 108
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J

    .line 109
    return-void
.end method


# virtual methods
.method public declared-synchronized abortConnection()V
    .registers 5

    .prologue
    .line 329
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1a

    if-eqz v0, :cond_7

    .line 339
    :goto_5
    monitor-exit p0

    return-void

    .line 332
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z

    .line 333
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->unmarkReusable()V
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_1a

    .line 335
    :try_start_d
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->shutdown()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_1d
    .catchall {:try_start_d .. :try_end_10} :catchall_1a

    .line 338
    :goto_10
    :try_start_10
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    iget-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p0, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/ClientConnectionManager;->releaseConnection(Lcz/msebera/android/httpclient/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    :try_end_19
    .catchall {:try_start_10 .. :try_end_19} :catchall_1a

    goto :goto_5

    .line 329
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0

    .line 336
    :catch_1d
    move-exception v0

    goto :goto_10
.end method

.method protected final assertNotAborted()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->isReleased()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 134
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Connection has been shut down"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_e
    return-void
.end method

.method protected final assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V
    .registers 3
    .param p1, "wrappedConn"    # Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->isReleased()Z

    move-result v0

    if-nez v0, :cond_8

    if-nez p1, :cond_e

    .line 155
    :cond_8
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;-><init>()V

    throw v0

    .line 157
    :cond_e
    return-void
.end method

.method public bind(Ljava/net/Socket;)V
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected declared-synchronized detach()V
    .registers 3

    .prologue
    .line 116
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->wrappedConnection:Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    .line 117
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_d

    .line 118
    monitor-exit p0

    return-void

    .line 116
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 200
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 201
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->flush()V

    .line 202
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 342
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 343
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 344
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_12

    .line 345
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 347
    :goto_11
    return-object v1

    .restart local v0    # "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 243
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 244
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 245
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method public getLocalPort()I
    .registers 3

    .prologue
    .line 249
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 250
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 251
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getLocalPort()I

    move-result v1

    return v1
.end method

.method protected getManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    return-object v0
.end method

.method public getMetrics()Lcz/msebera/android/httpclient/HttpConnectionMetrics;
    .registers 3

    .prologue
    .line 193
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 194
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 195
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getMetrics()Lcz/msebera/android/httpclient/HttpConnectionMetrics;

    move-result-object v1

    return-object v1
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 255
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 256
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 257
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method public getRemotePort()I
    .registers 3

    .prologue
    .line 261
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 262
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 263
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getRemotePort()I

    move-result v1

    return v1
.end method

.method public getSSLSession()Ljavax/net/ssl/SSLSession;
    .registers 5

    .prologue
    .line 286
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 287
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 288
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->isOpen()Z

    move-result v3

    if-nez v3, :cond_f

    .line 289
    const/4 v1, 0x0

    .line 297
    :cond_e
    :goto_e
    return-object v1

    .line 292
    :cond_f
    const/4 v1, 0x0

    .line 293
    .local v1, "result":Ljavax/net/ssl/SSLSession;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    .line 294
    .local v2, "sock":Ljava/net/Socket;
    instance-of v3, v2, Ljavax/net/ssl/SSLSocket;

    if-eqz v3, :cond_e

    .line 295
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .end local v2    # "sock":Ljava/net/Socket;
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    goto :goto_e
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 3

    .prologue
    .line 277
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 278
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 279
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->isOpen()Z

    move-result v1

    if-nez v1, :cond_f

    .line 280
    const/4 v1, 0x0

    .line 282
    :goto_e
    return-object v1

    :cond_f
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    goto :goto_e
.end method

.method public getSocketTimeout()I
    .registers 3

    .prologue
    .line 187
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 188
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 189
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->getSocketTimeout()I

    move-result v1

    return v1
.end method

.method protected getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->wrappedConnection:Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    return-object v0
.end method

.method public isMarkedReusable()Z
    .registers 2

    .prologue
    .line 309
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->markedReusable:Z

    return v0
.end method

.method public isOpen()Z
    .registers 3

    .prologue
    .line 160
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 161
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    if-nez v0, :cond_8

    .line 162
    const/4 v1, 0x0

    .line 165
    :goto_7
    return v1

    :cond_8
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->isOpen()Z

    move-result v1

    goto :goto_7
.end method

.method protected isReleased()Z
    .registers 2

    .prologue
    .line 143
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z

    return v0
.end method

.method public isResponseAvailable(I)Z
    .registers 4
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 206
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 207
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->isResponseAvailable(I)Z

    move-result v1

    return v1
.end method

.method public isSecure()Z
    .registers 3

    .prologue
    .line 267
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 268
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 269
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->isSecure()Z

    move-result v1

    return v1
.end method

.method public isStale()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 169
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->isReleased()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 177
    :cond_7
    :goto_7
    return v1

    .line 172
    :cond_8
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 173
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    if-eqz v0, :cond_7

    .line 177
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->isStale()Z

    move-result v1

    goto :goto_7
.end method

.method public markReusable()V
    .registers 2

    .prologue
    .line 301
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->markedReusable:Z

    .line 302
    return-void
.end method

.method public receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 213
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 214
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->unmarkReusable()V

    .line 215
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 216
    return-void
.end method

.method public receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 221
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 222
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->unmarkReusable()V

    .line 223
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public declared-synchronized releaseConnection()V
    .registers 5

    .prologue
    .line 321
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_14

    if-eqz v0, :cond_7

    .line 326
    :goto_5
    monitor-exit p0

    return-void

    .line 324
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->released:Z

    .line 325
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    iget-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p0, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/ClientConnectionManager;->releaseConnection(Lcz/msebera/android/httpclient/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_14

    goto :goto_5

    .line 321
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 352
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 353
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 354
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_12

    .line 355
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 357
    :goto_11
    return-object v1

    .restart local v0    # "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public sendRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 229
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 230
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->unmarkReusable()V

    .line 231
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->sendRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 232
    return-void
.end method

.method public sendRequestHeader(Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 237
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 238
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->unmarkReusable()V

    .line 239
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->sendRequestHeader(Lcz/msebera/android/httpclient/HttpRequest;)V

    .line 240
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 362
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 363
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 364
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_10

    .line 365
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 367
    :cond_10
    return-void
.end method

.method public setIdleDuration(JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "duration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 313
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_d

    .line 314
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J

    .line 318
    :goto_c
    return-void

    .line 316
    :cond_d
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->duration:J

    goto :goto_c
.end method

.method public setSocketTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 181
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->getWrappedConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 182
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->assertValid(Lcz/msebera/android/httpclient/conn/OperatedClientConnection;)V

    .line 183
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->setSocketTimeout(I)V

    .line 184
    return-void
.end method

.method public unmarkReusable()V
    .registers 2

    .prologue
    .line 305
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/AbstractClientConnAdapter;->markedReusable:Z

    .line 306
    return-void
.end method
