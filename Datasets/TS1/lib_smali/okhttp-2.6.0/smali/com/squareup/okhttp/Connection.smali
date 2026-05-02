.class public final Lcom/squareup/okhttp/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# instance fields
.field private framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

.field private handshake:Lcom/squareup/okhttp/Handshake;

.field private httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

.field private idleStartTimeNs:J

.field private owner:Ljava/lang/Object;

.field private final pool:Lcom/squareup/okhttp/ConnectionPool;

.field private protocol:Lcom/squareup/okhttp/Protocol;

.field private recycleCount:I

.field private final route:Lcom/squareup/okhttp/Route;

.field private socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V
    .registers 3
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "route"    # Lcom/squareup/okhttp/Route;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    .line 97
    iput-object p2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    .line 98
    return-void
.end method

.method private connectSocket(IIILcom/squareup/okhttp/internal/ConnectionSpecSelector;)V
    .registers 9
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "connectionSpecSelector"    # Lcom/squareup/okhttp/internal/ConnectionSpecSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 198
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Route;->getSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p1}, Lcom/squareup/okhttp/internal/Platform;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V

    .line 200
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    if-eqz v0, :cond_53

    .line 201
    invoke-direct {p0, p2, p3, p4}, Lcom/squareup/okhttp/Connection;->connectTls(IILcom/squareup/okhttp/internal/ConnectionSpecSelector;)V

    .line 206
    :goto_21
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    sget-object v1, Lcom/squareup/okhttp/Protocol;->SPDY_3:Lcom/squareup/okhttp/Protocol;

    if-eq v0, v1, :cond_2d

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    sget-object v1, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v0, v1, :cond_58

    .line 207
    :cond_2d
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 208
    new-instance v0, Lcom/squareup/okhttp/internal/framed/FramedConnection$Builder;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v1, v1, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v0, v1, v2, v3}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Builder;-><init>(Ljava/lang/String;ZLjava/net/Socket;)V

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 209
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/internal/framed/FramedConnection$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection$Builder;->build()Lcom/squareup/okhttp/internal/framed/FramedConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .line 210
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->sendConnectionPreface()V

    .line 214
    :goto_52
    return-void

    .line 203
    :cond_53
    sget-object v0, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    goto :goto_21

    .line 212
    :cond_58
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v0, v1, p0, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;Ljava/net/Socket;)V

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    goto :goto_52
.end method

.method private connectTls(IILcom/squareup/okhttp/internal/ConnectionSpecSelector;)V
    .registers 18
    .param p1, "readTimeout"    # I
    .param p2, "writeTimeout"    # I
    .param p3, "connectionSpecSelector"    # Lcom/squareup/okhttp/internal/ConnectionSpecSelector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v10, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v10}, Lcom/squareup/okhttp/Route;->requiresTunnel()Z

    move-result v10

    if-eqz v10, :cond_b

    .line 219
    invoke-direct/range {p0 .. p2}, Lcom/squareup/okhttp/Connection;->createTunnel(II)V

    .line 222
    :cond_b
    iget-object v10, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v10}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v1

    .line 223
    .local v1, "address":Lcom/squareup/okhttp/Address;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v7

    .line 224
    .local v7, "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v8, 0x0

    .line 225
    .local v8, "success":Z
    const/4 v6, 0x0

    .line 228
    .local v6, "sslSocket":Ljavax/net/ssl/SSLSocket;
    :try_start_17
    iget-object v10, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 229
    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriPort()I

    move-result v12

    const/4 v13, 0x1

    .line 228
    invoke-virtual {v7, v10, v11, v12, v13}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    move-object v6, v0

    .line 232
    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Lcom/squareup/okhttp/internal/ConnectionSpecSelector;->configureSecureSocket(Ljavax/net/ssl/SSLSocket;)Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v3

    .line 233
    .local v3, "connectionSpec":Lcom/squareup/okhttp/ConnectionSpec;
    invoke-virtual {v3}, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions()Z

    move-result v10

    if-eqz v10, :cond_45

    .line 234
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v10

    .line 235
    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getProtocols()Ljava/util/List;

    move-result-object v12

    .line 234
    invoke-virtual {v10, v6, v11, v12}, Lcom/squareup/okhttp/internal/Platform;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    .line 239
    :cond_45
    invoke-virtual {v6}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 240
    invoke-virtual {v6}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v10

    invoke-static {v10}, Lcom/squareup/okhttp/Handshake;->get(Ljavax/net/ssl/SSLSession;)Lcom/squareup/okhttp/Handshake;

    move-result-object v9

    .line 243
    .local v9, "unverifiedHandshake":Lcom/squareup/okhttp/Handshake;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v10

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v10

    if-nez v10, :cond_db

    .line 244
    invoke-virtual {v9}, Lcom/squareup/okhttp/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 245
    .local v2, "cert":Ljava/security/cert/X509Certificate;
    new-instance v10, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Hostname "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " not verified:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n    certificate: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 246
    invoke-static {v2}, Lcom/squareup/okhttp/CertificatePinner;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n    DN: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 247
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v12

    invoke-interface {v12}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n    subjectAltNames: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 248
    invoke-static {v2}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->allSubjectAltNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_be
    .catch Ljava/lang/AssertionError; {:try_start_17 .. :try_end_be} :catch_be
    .catchall {:try_start_17 .. :try_end_be} :catchall_cb

    .line 265
    .end local v2    # "cert":Ljava/security/cert/X509Certificate;
    .end local v3    # "connectionSpec":Lcom/squareup/okhttp/ConnectionSpec;
    .end local v9    # "unverifiedHandshake":Lcom/squareup/okhttp/Handshake;
    :catch_be
    move-exception v4

    .line 266
    .local v4, "e":Ljava/lang/AssertionError;
    :try_start_bf
    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result v10

    if-eqz v10, :cond_119

    new-instance v10, Ljava/io/IOException;

    invoke-direct {v10, v4}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v10
    :try_end_cb
    .catchall {:try_start_bf .. :try_end_cb} :catchall_cb

    .line 269
    .end local v4    # "e":Ljava/lang/AssertionError;
    :catchall_cb
    move-exception v10

    if-eqz v6, :cond_d5

    .line 270
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v11

    invoke-virtual {v11, v6}, Lcom/squareup/okhttp/internal/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 272
    :cond_d5
    if-nez v8, :cond_da

    .line 273
    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    :cond_da
    throw v10

    .line 252
    .restart local v3    # "connectionSpec":Lcom/squareup/okhttp/ConnectionSpec;
    .restart local v9    # "unverifiedHandshake":Lcom/squareup/okhttp/Handshake;
    :cond_db
    :try_start_db
    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getCertificatePinner()Lcom/squareup/okhttp/CertificatePinner;

    move-result-object v10

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v11

    .line 253
    invoke-virtual {v9}, Lcom/squareup/okhttp/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v12

    .line 252
    invoke-virtual {v10, v11, v12}, Lcom/squareup/okhttp/CertificatePinner;->check(Ljava/lang/String;Ljava/util/List;)V

    .line 256
    invoke-virtual {v3}, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions()Z

    move-result v10

    if-eqz v10, :cond_114

    .line 257
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v10

    invoke-virtual {v10, v6}, Lcom/squareup/okhttp/internal/Platform;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object v5

    .line 259
    .local v5, "maybeProtocol":Ljava/lang/String;
    :goto_f8
    iput-object v6, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 260
    iput-object v9, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 261
    if-eqz v5, :cond_116

    .line 262
    invoke-static {v5}, Lcom/squareup/okhttp/Protocol;->get(Ljava/lang/String;)Lcom/squareup/okhttp/Protocol;

    move-result-object v10

    :goto_102
    iput-object v10, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;
    :try_end_104
    .catch Ljava/lang/AssertionError; {:try_start_db .. :try_end_104} :catch_be
    .catchall {:try_start_db .. :try_end_104} :catchall_cb

    .line 264
    const/4 v8, 0x1

    .line 269
    if-eqz v6, :cond_10e

    .line 270
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v10

    invoke-virtual {v10, v6}, Lcom/squareup/okhttp/internal/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 272
    :cond_10e
    if-nez v8, :cond_113

    .line 273
    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 276
    :cond_113
    return-void

    .line 257
    .end local v5    # "maybeProtocol":Ljava/lang/String;
    :cond_114
    const/4 v5, 0x0

    goto :goto_f8

    .line 262
    .restart local v5    # "maybeProtocol":Ljava/lang/String;
    :cond_116
    :try_start_116
    sget-object v10, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;
    :try_end_118
    .catch Ljava/lang/AssertionError; {:try_start_116 .. :try_end_118} :catch_be
    .catchall {:try_start_116 .. :try_end_118} :catchall_cb

    goto :goto_102

    .line 267
    .end local v3    # "connectionSpec":Lcom/squareup/okhttp/ConnectionSpec;
    .end local v5    # "maybeProtocol":Ljava/lang/String;
    .end local v9    # "unverifiedHandshake":Lcom/squareup/okhttp/Handshake;
    .restart local v4    # "e":Ljava/lang/AssertionError;
    :cond_119
    :try_start_119
    throw v4
    :try_end_11a
    .catchall {:try_start_119 .. :try_end_11a} :catchall_cb
.end method

.method private createTunnel(II)V
    .registers 15
    .param p1, "readTimeout"    # I
    .param p2, "writeTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    invoke-direct {p0}, Lcom/squareup/okhttp/Connection;->createTunnelRequest()Lcom/squareup/okhttp/Request;

    move-result-object v6

    .line 286
    .local v6, "tunnelRequest":Lcom/squareup/okhttp/Request;
    new-instance v5, Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v8, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v9, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v5, v8, p0, v9}, Lcom/squareup/okhttp/internal/http/HttpConnection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;Ljava/net/Socket;)V

    .line 287
    .local v5, "tunnelConnection":Lcom/squareup/okhttp/internal/http/HttpConnection;
    invoke-virtual {v5, p1, p2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->setTimeouts(II)V

    .line 288
    invoke-virtual {v6}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v7

    .line 289
    .local v7, "url":Lcom/squareup/okhttp/HttpUrl;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "CONNECT "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/squareup/okhttp/HttpUrl;->host()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/squareup/okhttp/HttpUrl;->port()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " HTTP/1.1"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 291
    .local v3, "requestLine":Ljava/lang/String;
    :cond_3f
    invoke-virtual {v6}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v8

    invoke-virtual {v5, v8, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->writeRequest(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)V

    .line 292
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->flush()V

    .line 293
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readResponse()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v4

    .line 296
    .local v4, "response":Lcom/squareup/okhttp/Response;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v1

    .line 297
    .local v1, "contentLength":J
    const-wide/16 v8, -0x1

    cmp-long v8, v1, v8

    if-nez v8, :cond_61

    .line 298
    const-wide/16 v1, 0x0

    .line 300
    :cond_61
    invoke-virtual {v5, v1, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newFixedLengthSource(J)Lokio/Source;

    move-result-object v0

    .line 301
    .local v0, "body":Lokio/Source;
    const v8, 0x7fffffff

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v8, v9}, Lcom/squareup/okhttp/internal/Util;->skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    .line 302
    invoke-interface {v0}, Lokio/Source;->close()V

    .line 304
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->code()I

    move-result v8

    sparse-switch v8, :sswitch_data_c6

    .line 322
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected response code for CONNECT: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 323
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->code()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 310
    :sswitch_94
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->bufferSize()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_c4

    .line 311
    new-instance v8, Ljava/io/IOException;

    const-string v9, "TLS tunnel buffered too many bytes!"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 316
    :sswitch_a6
    iget-object v8, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    .line 317
    invoke-virtual {v8}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v8

    invoke-virtual {v8}, Lcom/squareup/okhttp/Address;->getAuthenticator()Lcom/squareup/okhttp/Authenticator;

    move-result-object v8

    iget-object v9, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v9}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v9

    .line 316
    invoke-static {v8, v4, v9}, Lcom/squareup/okhttp/internal/http/OkHeaders;->processAuthHeader(Lcom/squareup/okhttp/Authenticator;Lcom/squareup/okhttp/Response;Ljava/net/Proxy;)Lcom/squareup/okhttp/Request;

    move-result-object v6

    .line 318
    if-nez v6, :cond_3f

    .line 319
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Failed to authenticate with proxy"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 313
    :cond_c4
    return-void

    .line 304
    nop

    :sswitch_data_c6
    .sparse-switch
        0xc8 -> :sswitch_94
        0x197 -> :sswitch_a6
    .end sparse-switch
.end method

.method private createTunnelRequest()Lcom/squareup/okhttp/Request;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    new-instance v1, Lcom/squareup/okhttp/HttpUrl$Builder;

    invoke-direct {v1}, Lcom/squareup/okhttp/HttpUrl$Builder;-><init>()V

    const-string v2, "https"

    .line 337
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/HttpUrl$Builder;->scheme(Ljava/lang/String;)Lcom/squareup/okhttp/HttpUrl$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v2, v2, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v2, v2, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    .line 338
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/HttpUrl$Builder;->host(Ljava/lang/String;)Lcom/squareup/okhttp/HttpUrl$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v2, v2, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget v2, v2, Lcom/squareup/okhttp/Address;->uriPort:I

    .line 339
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/HttpUrl$Builder;->port(I)Lcom/squareup/okhttp/HttpUrl$Builder;

    move-result-object v1

    .line 340
    invoke-virtual {v1}, Lcom/squareup/okhttp/HttpUrl$Builder;->build()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v0

    .line 341
    .local v0, "tunnelUrl":Lcom/squareup/okhttp/HttpUrl;
    new-instance v1, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v1}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    .line 342
    invoke-virtual {v1, v0}, Lcom/squareup/okhttp/Request$Builder;->url(Lcom/squareup/okhttp/HttpUrl;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Host"

    .line 343
    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->hostHeader(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Proxy-Connection"

    const-string v3, "Keep-Alive"

    .line 344
    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "User-Agent"

    .line 345
    invoke-static {}, Lcom/squareup/okhttp/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 346
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method clearOwner()Z
    .registers 3

    .prologue
    .line 121
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 122
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-nez v0, :cond_a

    .line 124
    const/4 v0, 0x0

    monitor-exit v1

    .line 128
    :goto_9
    return v0

    .line 127
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 128
    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_9

    .line 129
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v0
.end method

.method closeIfOwnedBy(Ljava/lang/Object;)V
    .registers 4
    .param p1, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isFramed()Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 138
    :cond_c
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 139
    :try_start_f
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-eq v0, p1, :cond_15

    .line 140
    monitor-exit v1

    .line 150
    :cond_14
    :goto_14
    return-void

    .line 143
    :cond_15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 144
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_23

    .line 147
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_14

    .line 148
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_14

    .line 144
    :catchall_23
    move-exception v0

    :try_start_24
    monitor-exit v1
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw v0
.end method

.method connect(IIILjava/util/List;Z)V
    .registers 15
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p5, "connectionRetryEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .local p4, "connectionSpecs":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/ConnectionSpec;>;"
    const/4 v7, 0x0

    .line 154
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    if-eqz v5, :cond_d

    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "already connected"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 156
    :cond_d
    const/4 v4, 0x0

    .line 157
    .local v4, "routeException":Lcom/squareup/okhttp/internal/http/RouteException;
    new-instance v1, Lcom/squareup/okhttp/internal/ConnectionSpecSelector;

    invoke-direct {v1, p4}, Lcom/squareup/okhttp/internal/ConnectionSpecSelector;-><init>(Ljava/util/List;)V

    .line 158
    .local v1, "connectionSpecSelector":Lcom/squareup/okhttp/internal/ConnectionSpecSelector;
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v3

    .line 159
    .local v3, "proxy":Ljava/net/Proxy;
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v0

    .line 161
    .local v0, "address":Lcom/squareup/okhttp/Address;
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v5, v5, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Address;->getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    if-nez v5, :cond_59

    sget-object v5, Lcom/squareup/okhttp/ConnectionSpec;->CLEARTEXT:Lcom/squareup/okhttp/ConnectionSpec;

    .line 162
    invoke-interface {p4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_59

    .line 163
    new-instance v5, Lcom/squareup/okhttp/internal/http/RouteException;

    new-instance v6, Ljava/net/UnknownServiceException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CLEARTEXT communication not supported: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lcom/squareup/okhttp/internal/http/RouteException;-><init>(Ljava/io/IOException;)V

    throw v5

    .line 170
    :cond_4f
    :try_start_4f
    new-instance v5, Ljava/net/Socket;

    invoke-direct {v5, v3}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    :goto_54
    iput-object v5, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 172
    invoke-direct {p0, p1, p2, p3, v1}, Lcom/squareup/okhttp/Connection;->connectSocket(IIILcom/squareup/okhttp/internal/ConnectionSpecSelector;)V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_59} :catch_76

    .line 167
    :cond_59
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    if-nez v5, :cond_9a

    .line 169
    :try_start_5d
    invoke-virtual {v3}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v5

    sget-object v6, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v5, v6, :cond_6d

    invoke-virtual {v3}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v5

    sget-object v6, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v5, v6, :cond_4f

    .line 170
    :cond_6d
    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    invoke-virtual {v5}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_74} :catch_76

    move-result-object v5

    goto :goto_54

    .line 173
    :catch_76
    move-exception v2

    .line 174
    .local v2, "e":Ljava/io/IOException;
    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-static {v5}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 175
    iput-object v7, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 176
    iput-object v7, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 177
    iput-object v7, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 178
    iput-object v7, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    .line 179
    iput-object v7, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .line 181
    if-nez v4, :cond_96

    .line 182
    new-instance v4, Lcom/squareup/okhttp/internal/http/RouteException;

    .end local v4    # "routeException":Lcom/squareup/okhttp/internal/http/RouteException;
    invoke-direct {v4, v2}, Lcom/squareup/okhttp/internal/http/RouteException;-><init>(Ljava/io/IOException;)V

    .line 187
    .restart local v4    # "routeException":Lcom/squareup/okhttp/internal/http/RouteException;
    :goto_8d
    if-eqz p5, :cond_95

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/ConnectionSpecSelector;->connectionFailed(Ljava/io/IOException;)Z

    move-result v5

    if-nez v5, :cond_59

    .line 188
    :cond_95
    throw v4

    .line 184
    :cond_96
    invoke-virtual {v4, v2}, Lcom/squareup/okhttp/internal/http/RouteException;->addConnectException(Ljava/io/IOException;)V

    goto :goto_8d

    .line 192
    .end local v2    # "e":Ljava/io/IOException;
    :cond_9a
    return-void
.end method

.method connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Ljava/lang/Object;)V
    .registers 9
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-virtual {p0, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 356
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_3d

    .line 357
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getConnectionSpecs()Ljava/util/List;

    move-result-object v4

    .line 358
    .local v4, "connectionSpecs":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/ConnectionSpec;>;"
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectTimeout()I

    move-result v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v2

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getWriteTimeout()I

    move-result v3

    .line 359
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getRetryOnConnectionFailure()Z

    move-result v5

    move-object v0, p0

    .line 358
    invoke-virtual/range {v0 .. v5}, Lcom/squareup/okhttp/Connection;->connect(IIILjava/util/List;Z)V

    .line 360
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isFramed()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 361
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/squareup/okhttp/ConnectionPool;->share(Lcom/squareup/okhttp/Connection;)V

    .line 363
    :cond_32
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/RouteDatabase;->connected(Lcom/squareup/okhttp/Route;)V

    .line 366
    .end local v4    # "connectionSpecs":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/ConnectionSpec;>;"
    :cond_3d
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v0

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getWriteTimeout()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/squareup/okhttp/Connection;->setTimeouts(II)V

    .line 367
    return-void
.end method

.method public getHandshake()Lcom/squareup/okhttp/Handshake;
    .registers 2

    .prologue
    .line 431
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method getIdleStartTimeNs()J
    .registers 3

    .prologue
    .line 427
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-nez v0, :cond_7

    iget-wide v0, p0, Lcom/squareup/okhttp/Connection;->idleStartTimeNs:J

    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getIdleStartTimeNs()J

    move-result-wide v0

    goto :goto_6
.end method

.method getOwner()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 101
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 102
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    monitor-exit v1

    return-object v0

    .line 103
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getProtocol()Lcom/squareup/okhttp/Protocol;
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    goto :goto_6
.end method

.method public getRoute()Lcom/squareup/okhttp/Route;
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method incrementRecycleCount()V
    .registers 2

    .prologue
    .line 474
    iget v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    .line 475
    return-void
.end method

.method isAlive()Z
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v0

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method isConnected()Z
    .registers 2

    .prologue
    .line 371
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method isFramed()Z
    .registers 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method isIdle()Z
    .registers 2

    .prologue
    .line 419
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method isReadable()Z
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->isReadable()Z

    move-result v0

    .line 409
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method

.method newTransport(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;
    .registers 4
    .param p1, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 436
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-eqz v0, :cond_c

    new-instance v0, Lcom/squareup/okhttp/internal/http/FramedTransport;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-direct {v0, p1, v1}, Lcom/squareup/okhttp/internal/http/FramedTransport;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/framed/FramedConnection;)V

    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpTransport;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-direct {v0, p1, v1}, Lcom/squareup/okhttp/internal/http/HttpTransport;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/http/HttpConnection;)V

    goto :goto_b
.end method

.method rawSink()Lokio/BufferedSink;
    .registers 2

    .prologue
    .line 393
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 394
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->rawSink()Lokio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method rawSource()Lokio/BufferedSource;
    .registers 2

    .prologue
    .line 388
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 389
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->rawSource()Lokio/BufferedSource;

    move-result-object v0

    return-object v0
.end method

.method recycleCount()I
    .registers 2

    .prologue
    .line 482
    iget v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    return v0
.end method

.method resetIdleStartTime()V
    .registers 3

    .prologue
    .line 413
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "framedConnection != null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 414
    :cond_c
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/squareup/okhttp/Connection;->idleStartTimeNs:J

    .line 415
    return-void
.end method

.method setOwner(Ljava/lang/Object;)V
    .registers 5
    .param p1, "owner"    # Ljava/lang/Object;

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isFramed()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 112
    :goto_6
    return-void

    .line 108
    :cond_7
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 109
    :try_start_a
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-eqz v0, :cond_19

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Connection already has an owner!"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_16

    throw v0

    .line 110
    :cond_19
    :try_start_19
    iput-object p1, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 111
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_16

    goto :goto_6
.end method

.method setTimeouts(II)V
    .registers 6
    .param p1, "readTimeoutMillis"    # I
    .param p2, "writeTimeoutMillis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .line 460
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    if-nez v1, :cond_c

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not connected"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 463
    :cond_c
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-eqz v1, :cond_1a

    .line 465
    :try_start_10
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v1, p1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_15} :catch_1b

    .line 469
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v1, p1, p2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->setTimeouts(II)V

    .line 471
    :cond_1a
    return-void

    .line 466
    :catch_1b
    move-exception v0

    .line 467
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/squareup/okhttp/internal/http/RouteException;

    invoke-direct {v1, v0}, Lcom/squareup/okhttp/internal/http/RouteException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connection{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v1, v1, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget v1, v1, Lcom/squareup/okhttp/Address;->uriPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", proxy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " hostAddress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 491
    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cipherSuite="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    if-eqz v0, :cond_74

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 493
    invoke-virtual {v0}, Lcom/squareup/okhttp/Handshake;->cipherSuite()Ljava/lang/String;

    move-result-object v0

    :goto_59
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " protocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_74
    const-string v0, "none"

    goto :goto_59
.end method
