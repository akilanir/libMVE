.class public Lorg/apache/commons/net/bsd/RCommandClient;
.super Lorg/apache/commons/net/bsd/RExecClient;
.source "RCommandClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x202

.field public static final MAX_CLIENT_PORT:I = 0x3ff

.field public static final MIN_CLIENT_PORT:I = 0x200


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 161
    invoke-direct {p0}, Lorg/apache/commons/net/bsd/RExecClient;-><init>()V

    .line 162
    const/16 v0, 0x202

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/bsd/RCommandClient;->setDefaultPort(I)V

    .line 163
    return-void
.end method


# virtual methods
.method _createErrorStream()Ljava/io/InputStream;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    const/16 v1, 0x3ff

    .line 118
    .local v1, "localPort":I
    const/4 v2, 0x0

    .line 120
    .local v2, "server":Ljava/net/ServerSocket;
    const/16 v1, 0x3ff

    :goto_5
    const/16 v4, 0x200

    if-lt v1, v4, :cond_14

    .line 124
    :try_start_9
    iget-object v4, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_serverSocketFactory_:Ljavax/net/ServerSocketFactory;

    const/4 v5, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/net/bsd/RCommandClient;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v4, v1, v5, v6}, Ljavax/net/ServerSocketFactory;->createServerSocket(IILjava/net/InetAddress;)Ljava/net/ServerSocket;
    :try_end_13
    .catch Ljava/net/SocketException; {:try_start_9 .. :try_end_13} :catch_1e

    move-result-object v2

    .line 134
    :cond_14
    if-nez v2, :cond_22

    .line 135
    new-instance v4, Ljava/net/BindException;

    const-string v5, "All ports in use."

    invoke-direct {v4, v5}, Ljava/net/BindException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 128
    :catch_1e
    move-exception v0

    .line 120
    .local v0, "e":Ljava/net/SocketException;
    add-int/lit8 v1, v1, -0x1

    goto :goto_5

    .line 138
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_22
    iget-object v4, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/OutputStream;->write([B)V

    .line 139
    iget-object v4, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_output_:Ljava/io/OutputStream;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/io/OutputStream;->write(I)V

    .line 140
    iget-object v4, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_output_:Ljava/io/OutputStream;

    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 142
    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v3

    .line 143
    .local v3, "socket":Ljava/net/Socket;
    invoke-virtual {v2}, Ljava/net/ServerSocket;->close()V

    .line 145
    invoke-virtual {p0}, Lorg/apache/commons/net/bsd/RCommandClient;->isRemoteVerificationEnabled()Z

    move-result v4

    if-eqz v4, :cond_77

    invoke-virtual {p0, v3}, Lorg/apache/commons/net/bsd/RCommandClient;->verifyRemote(Ljava/net/Socket;)Z

    move-result v4

    if-nez v4, :cond_77

    .line 147
    invoke-virtual {v3}, Ljava/net/Socket;->close()V

    .line 148
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Security violation: unexpected connection attempt by "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 153
    :cond_77
    new-instance v4, Lorg/apache/commons/net/io/SocketInputStream;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lorg/apache/commons/net/io/SocketInputStream;-><init>(Ljava/net/Socket;Ljava/io/InputStream;)V

    return-object v4
.end method

.method public connect(Ljava/lang/String;I)V
    .registers 5
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 258
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p0, v0, p2, v1}, Lorg/apache/commons/net/bsd/RCommandClient;->connect(Ljava/net/InetAddress;ILjava/net/InetAddress;)V

    .line 259
    return-void
.end method

.method public connect(Ljava/lang/String;ILjava/net/InetAddress;)V
    .registers 5
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localAddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/net/bsd/RCommandClient;->connect(Ljava/net/InetAddress;ILjava/net/InetAddress;)V

    .line 282
    return-void
.end method

.method public connect(Ljava/lang/String;ILjava/net/InetAddress;I)V
    .registers 8
    .param p1, "hostname"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localAddr"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 343
    const/16 v0, 0x200

    if-lt p4, v0, :cond_8

    const/16 v0, 0x3ff

    if-le p4, v0, :cond_21

    .line 344
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid port number "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_21
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/commons/net/bsd/RExecClient;->connect(Ljava/lang/String;ILjava/net/InetAddress;I)V

    .line 347
    return-void
.end method

.method public connect(Ljava/net/InetAddress;I)V
    .registers 4
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/net/bsd/RCommandClient;->connect(Ljava/net/InetAddress;ILjava/net/InetAddress;)V

    .line 235
    return-void
.end method

.method public connect(Ljava/net/InetAddress;ILjava/net/InetAddress;)V
    .registers 9
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/net/BindException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x200

    .line 187
    const/16 v2, 0x3ff

    .line 189
    .local v2, "localPort":I
    const/16 v2, 0x3ff

    :goto_6
    if-lt v2, v4, :cond_10

    .line 193
    :try_start_8
    iget-object v3, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_socketFactory_:Ljavax/net/SocketFactory;

    invoke-virtual {v3, p1, p2, p3, v2}, Ljavax/net/SocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/net/bsd/RCommandClient;->_socket_:Ljava/net/Socket;
    :try_end_10
    .catch Ljava/net/BindException; {:try_start_8 .. :try_end_10} :catch_1a
    .catch Ljava/net/SocketException; {:try_start_8 .. :try_end_10} :catch_1e

    .line 206
    :cond_10
    if-ge v2, v4, :cond_20

    .line 207
    new-instance v3, Ljava/net/BindException;

    const-string v4, "All ports in use or insufficient permssion."

    invoke-direct {v3, v4}, Ljava/net/BindException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 196
    :catch_1a
    move-exception v0

    .line 189
    :goto_1b
    add-int/lit8 v2, v2, -0x1

    goto :goto_6

    .line 199
    :catch_1e
    move-exception v1

    .line 201
    .local v1, "e":Ljava/net/SocketException;
    goto :goto_1b

    .line 210
    .end local v1    # "e":Ljava/net/SocketException;
    :cond_20
    invoke-virtual {p0}, Lorg/apache/commons/net/bsd/RCommandClient;->_connectAction_()V

    .line 211
    return-void
.end method

.method public connect(Ljava/net/InetAddress;ILjava/net/InetAddress;I)V
    .registers 8
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddr"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 310
    const/16 v0, 0x200

    if-lt p4, v0, :cond_8

    const/16 v0, 0x3ff

    if-le p4, v0, :cond_21

    .line 311
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid port number "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_21
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/commons/net/bsd/RExecClient;->connect(Ljava/net/InetAddress;ILjava/net/InetAddress;I)V

    .line 314
    return-void
.end method

.method public rcommand(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "localUsername"    # Ljava/lang/String;
    .param p2, "remoteUsername"    # Ljava/lang/String;
    .param p3, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/net/bsd/RCommandClient;->rcommand(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 403
    return-void
.end method

.method public rcommand(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "localUsername"    # Ljava/lang/String;
    .param p2, "remoteUsername"    # Ljava/lang/String;
    .param p3, "command"    # Ljava/lang/String;
    .param p4, "separateErrorStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/net/bsd/RCommandClient;->rexec(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 391
    return-void
.end method
