.class public Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;
.super Ljavax/net/ssl/SSLSocket;
.source "TlsOnlySocketFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DelegateSSLSocket"
.end annotation


# instance fields
.field protected final delegate:Ljavax/net/ssl/SSLSocket;

.field final synthetic this$0:Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;


# direct methods
.method constructor <init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;)V
    .registers 3
    .param p2, "delegate"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 205
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->this$0:Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;

    invoke-direct {p0}, Ljavax/net/ssl/SSLSocket;-><init>()V

    .line 206
    iput-object p2, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    .line 207
    return-void
.end method


# virtual methods
.method public addHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V
    .registers 3
    .param p1, "listener"    # Ljavax/net/ssl/HandshakeCompletedListener;

    .prologue
    .line 246
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->addHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 247
    return-void
.end method

.method public bind(Ljava/net/SocketAddress;)V
    .registers 3
    .param p1, "localAddr"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->bind(Ljava/net/SocketAddress;)V

    .line 302
    return-void
.end method

.method public declared-synchronized close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 307
    monitor-exit p0

    return-void

    .line 306
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public connect(Ljava/net/SocketAddress;)V
    .registers 3
    .param p1, "remoteAddr"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;)V

    .line 312
    return-void
.end method

.method public connect(Ljava/net/SocketAddress;I)V
    .registers 4
    .param p1, "remoteAddr"    # Ljava/net/SocketAddress;
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 316
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V

    .line 317
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 506
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getChannel()Ljava/nio/channels/SocketChannel;
    .registers 2

    .prologue
    .line 321
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    return-object v0
.end method

.method public getEnableSessionCreation()Z
    .registers 2

    .prologue
    .line 296
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnableSessionCreation()Z

    move-result v0

    return v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getKeepAlive()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 336
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getKeepAlive()Z

    move-result v0

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 341
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getLocalSocketAddress()Ljava/net/SocketAddress;
    .registers 2

    .prologue
    .line 351
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public getNeedClientAuth()Z
    .registers 2

    .prologue
    .line 281
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getNeedClientAuth()Z

    move-result v0

    return v0
.end method

.method public getOOBInline()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 356
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getOOBInline()Z

    move-result v0

    return v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 361
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 366
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getPort()I

    move-result v0

    return v0
.end method

.method public declared-synchronized getReceiveBufferSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 371
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getReceiveBufferSize()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getRemoteSocketAddress()Ljava/net/SocketAddress;
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public getReuseAddress()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 381
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getReuseAddress()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized getSendBufferSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 386
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSendBufferSize()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSession()Ljavax/net/ssl/SSLSession;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    return-object v0
.end method

.method public getSoLinger()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 391
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSoLinger()I

    move-result v0

    return v0
.end method

.method public declared-synchronized getSoTimeout()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 396
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSoTimeout()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedProtocols()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTcpNoDelay()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 401
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getTcpNoDelay()Z

    move-result v0

    return v0
.end method

.method public getTrafficClass()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 406
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getTrafficClass()I

    move-result v0

    return v0
.end method

.method public getUseClientMode()Z
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getUseClientMode()Z

    move-result v0

    return v0
.end method

.method public getWantClientAuth()Z
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getWantClientAuth()Z

    move-result v0

    return v0
.end method

.method public isBound()Z
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->isBound()Z

    move-result v0

    return v0
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 416
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->isClosed()Z

    move-result v0

    return v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 421
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isInputShutdown()Z
    .registers 2

    .prologue
    .line 426
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->isInputShutdown()Z

    move-result v0

    return v0
.end method

.method public isOutputShutdown()Z
    .registers 2

    .prologue
    .line 431
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->isOutputShutdown()Z

    move-result v0

    return v0
.end method

.method public removeHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V
    .registers 3
    .param p1, "listener"    # Ljavax/net/ssl/HandshakeCompletedListener;

    .prologue
    .line 251
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->removeHandshakeCompletedListener(Ljavax/net/ssl/HandshakeCompletedListener;)V

    .line 252
    return-void
.end method

.method public sendUrgentData(I)V
    .registers 3
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 436
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->sendUrgentData(I)V

    .line 437
    return-void
.end method

.method public setEnableSessionCreation(Z)V
    .registers 3
    .param p1, "flag"    # Z

    .prologue
    .line 291
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setEnableSessionCreation(Z)V

    .line 292
    return-void
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .registers 3
    .param p1, "suites"    # [Ljava/lang/String;

    .prologue
    .line 221
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 222
    return-void
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .registers 3
    .param p1, "protocols"    # [Ljava/lang/String;

    .prologue
    .line 236
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 237
    return-void
.end method

.method public setKeepAlive(Z)V
    .registers 3
    .param p1, "keepAlive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 441
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setKeepAlive(Z)V

    .line 442
    return-void
.end method

.method public setNeedClientAuth(Z)V
    .registers 3
    .param p1, "need"    # Z

    .prologue
    .line 271
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setNeedClientAuth(Z)V

    .line 272
    return-void
.end method

.method public setOOBInline(Z)V
    .registers 3
    .param p1, "oobinline"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 446
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setOOBInline(Z)V

    .line 447
    return-void
.end method

.method public setPerformancePreferences(III)V
    .registers 5
    .param p1, "connectionTime"    # I
    .param p2, "latency"    # I
    .param p3, "bandwidth"    # I

    .prologue
    .line 451
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1, p2, p3}, Ljavax/net/ssl/SSLSocket;->setPerformancePreferences(III)V

    .line 452
    return-void
.end method

.method public declared-synchronized setReceiveBufferSize(I)V
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 456
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setReceiveBufferSize(I)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 457
    monitor-exit p0

    return-void

    .line 456
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setReuseAddress(Z)V
    .registers 3
    .param p1, "reuse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 461
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setReuseAddress(Z)V

    .line 462
    return-void
.end method

.method public declared-synchronized setSendBufferSize(I)V
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 466
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setSendBufferSize(I)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 467
    monitor-exit p0

    return-void

    .line 466
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setSoLinger(ZI)V
    .registers 4
    .param p1, "on"    # Z
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 471
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocket;->setSoLinger(ZI)V

    .line 472
    return-void
.end method

.method public declared-synchronized setSoTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 476
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setSoTimeout(I)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 477
    monitor-exit p0

    return-void

    .line 476
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setTcpNoDelay(Z)V
    .registers 3
    .param p1, "on"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 481
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setTcpNoDelay(Z)V

    .line 482
    return-void
.end method

.method public setTrafficClass(I)V
    .registers 3
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 486
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setTrafficClass(I)V

    .line 487
    return-void
.end method

.method public setUseClientMode(Z)V
    .registers 3
    .param p1, "mode"    # Z

    .prologue
    .line 261
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setUseClientMode(Z)V

    .line 262
    return-void
.end method

.method public setWantClientAuth(Z)V
    .registers 3
    .param p1, "want"    # Z

    .prologue
    .line 276
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLSocket;->setWantClientAuth(Z)V

    .line 277
    return-void
.end method

.method public shutdownInput()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 491
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->shutdownInput()V

    .line 492
    return-void
.end method

.method public shutdownOutput()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 496
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->shutdownOutput()V

    .line 497
    return-void
.end method

.method public startHandshake()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 257
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 501
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
