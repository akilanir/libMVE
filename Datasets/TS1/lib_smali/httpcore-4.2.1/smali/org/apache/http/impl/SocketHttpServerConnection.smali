.class public Lorg/apache/http/impl/SocketHttpServerConnection;
.super Lorg/apache/http/impl/AbstractHttpServerConnection;
.source "SocketHttpServerConnection.java"

# interfaces
.implements Lorg/apache/http/HttpInetConnection;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private volatile open:Z

.field private volatile socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/apache/http/impl/AbstractHttpServerConnection;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 72
    return-void
.end method

.method private static formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V
    .registers 5
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "socketAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 268
    instance-of v1, p1, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_2c

    move-object v0, p1

    .line 269
    check-cast v0, Ljava/net/InetSocketAddress;

    .line 270
    .local v0, "addr":Ljava/net/InetSocketAddress;
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    if-eqz v1, :cond_27

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    :goto_15
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .end local v0    # "addr":Ljava/net/InetSocketAddress;
    :goto_26
    return-void

    .line 270
    .restart local v0    # "addr":Ljava/net/InetSocketAddress;
    :cond_27
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    goto :goto_15

    .line 275
    .end local v0    # "addr":Ljava/net/InetSocketAddress;
    :cond_2c
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_26
.end method


# virtual methods
.method protected assertNotOpen()V
    .registers 3

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    if-eqz v0, :cond_c

    .line 76
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Connection is already open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_c
    return-void
.end method

.method protected assertOpen()V
    .registers 3

    .prologue
    .line 82
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    if-nez v0, :cond_c

    .line 83
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Connection is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_c
    return-void
.end method

.method protected bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    if-nez p1, :cond_a

    .line 151
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Socket may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 153
    :cond_a
    if-nez p2, :cond_14

    .line 154
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    :cond_14
    iput-object p1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 158
    invoke-static {p2}, Lorg/apache/http/params/HttpConnectionParams;->getSocketBufferSize(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 160
    .local v0, "buffersize":I
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->createSessionInputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionInputBuffer;

    move-result-object v1

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->createSessionOutputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionOutputBuffer;

    move-result-object v2

    invoke-virtual {p0, v1, v2, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->init(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/params/HttpParams;)V

    .line 165
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 166
    return-void
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 242
    iget-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    if-nez v1, :cond_6

    .line 265
    :goto_5
    return-void

    .line 245
    :cond_6
    iput-boolean v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 246
    iput-boolean v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 247
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 249
    .local v0, "sock":Ljava/net/Socket;
    :try_start_c
    invoke-virtual {p0}, Lorg/apache/http/impl/SocketHttpServerConnection;->doFlush()V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_19

    .line 252
    :try_start_f
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_1e
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_f .. :try_end_12} :catch_22
    .catchall {:try_start_f .. :try_end_12} :catchall_19

    .line 256
    :goto_12
    :try_start_12
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_20
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_12 .. :try_end_15} :catch_22
    .catchall {:try_start_12 .. :try_end_15} :catchall_19

    .line 263
    :goto_15
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_5

    :catchall_19
    move-exception v1

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    throw v1

    .line 253
    :catch_1e
    move-exception v1

    goto :goto_12

    .line 257
    :catch_20
    move-exception v1

    goto :goto_15

    .line 259
    :catch_22
    move-exception v1

    goto :goto_15
.end method

.method protected createSessionInputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionInputBuffer;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    new-instance v0, Lorg/apache/http/impl/io/SocketInputBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/http/impl/io/SocketInputBuffer;-><init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createSessionOutputBuffer(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)Lorg/apache/http/io/SessionOutputBuffer;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Lorg/apache/http/impl/io/SocketOutputBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/http/impl/io/SocketOutputBuffer;-><init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 178
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 180
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 186
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    .line 188
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 194
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 196
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getRemotePort()I
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_b

    .line 202
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    .line 204
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method protected getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public getSocketTimeout()I
    .registers 4

    .prologue
    const/4 v1, -0x1

    .line 222
    iget-object v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v2, :cond_b

    .line 224
    :try_start_5
    iget-object v2, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getSoTimeout()I
    :try_end_a
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_a} :catch_c

    move-result v1

    .line 229
    :cond_b
    :goto_b
    return v1

    .line 225
    :catch_c
    move-exception v0

    .line 226
    .local v0, "ignore":Ljava/net/SocketException;
    goto :goto_b
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 173
    iget-boolean v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    return v0
.end method

.method public setSocketTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/apache/http/impl/SocketHttpServerConnection;->assertOpen()V

    .line 210
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_c

    .line 212
    :try_start_7
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_c
    .catch Ljava/net/SocketException; {:try_start_7 .. :try_end_c} :catch_d

    .line 219
    :cond_c
    :goto_c
    return-void

    .line 213
    :catch_d
    move-exception v0

    goto :goto_c
.end method

.method public shutdown()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->open:Z

    .line 235
    iget-object v0, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    .line 236
    .local v0, "tmpsocket":Ljava/net/Socket;
    if-eqz v0, :cond_a

    .line 237
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 239
    :cond_a
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 281
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    if-eqz v3, :cond_29

    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    .line 284
    .local v2, "remoteAddress":Ljava/net/SocketAddress;
    iget-object v3, p0, Lorg/apache/http/impl/SocketHttpServerConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    .line 285
    .local v1, "localAddress":Ljava/net/SocketAddress;
    if-eqz v2, :cond_24

    if-eqz v1, :cond_24

    .line 286
    invoke-static {v0, v1}, Lorg/apache/http/impl/SocketHttpServerConnection;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 287
    const-string v3, "<->"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    invoke-static {v0, v2}, Lorg/apache/http/impl/SocketHttpServerConnection;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 290
    :cond_24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 292
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "localAddress":Ljava/net/SocketAddress;
    .end local v2    # "remoteAddress":Ljava/net/SocketAddress;
    :goto_28
    return-object v3

    :cond_29
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_28
.end method
