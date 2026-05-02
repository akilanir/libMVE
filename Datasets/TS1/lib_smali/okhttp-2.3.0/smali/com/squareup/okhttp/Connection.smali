.class public final Lcom/squareup/okhttp/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# instance fields
.field private connected:Z

.field private handshake:Lcom/squareup/okhttp/Handshake;

.field private httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

.field private idleStartTimeNs:J

.field private owner:Ljava/lang/Object;

.field private final pool:Lcom/squareup/okhttp/ConnectionPool;

.field private protocol:Lcom/squareup/okhttp/Protocol;

.field private recycleCount:I

.field private final route:Lcom/squareup/okhttp/Route;

.field private socket:Ljava/net/Socket;

.field private spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V
    .registers 4
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "route"    # Lcom/squareup/okhttp/Route;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/squareup/okhttp/Connection;->connected:Z

    .line 78
    sget-object v0, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 91
    iput-object p1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    .line 92
    iput-object p2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    .line 93
    return-void
.end method

.method private makeTunnel(Lcom/squareup/okhttp/Request;II)V
    .registers 15
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    new-instance v5, Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v7, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v8, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v5, v7, p0, v8}, Lcom/squareup/okhttp/internal/http/HttpConnection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;Ljava/net/Socket;)V

    .line 394
    .local v5, "tunnelConnection":Lcom/squareup/okhttp/internal/http/HttpConnection;
    invoke-virtual {v5, p2, p3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->setTimeouts(II)V

    .line 395
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v6

    .line 396
    .local v6, "url":Ljava/net/URL;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CONNECT "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v6}, Ljava/net/URL;->getPort()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " HTTP/1.1"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 398
    .local v3, "requestLine":Ljava/lang/String;
    :cond_3b
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v7

    invoke-virtual {v5, v7, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->writeRequest(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)V

    .line 399
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->flush()V

    .line 400
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readResponse()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    invoke-virtual {v7, p1}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v4

    .line 403
    .local v4, "response":Lcom/squareup/okhttp/Response;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v1

    .line 404
    .local v1, "contentLength":J
    const-wide/16 v7, -0x1

    cmp-long v7, v1, v7

    if-nez v7, :cond_5d

    .line 405
    const-wide/16 v1, 0x0

    .line 407
    :cond_5d
    invoke-virtual {v5, v1, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newFixedLengthSource(J)Lokio/Source;

    move-result-object v0

    .line 408
    .local v0, "body":Lokio/Source;
    const v7, 0x7fffffff

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v7, v8}, Lcom/squareup/okhttp/internal/Util;->skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    .line 409
    invoke-interface {v0}, Lokio/Source;->close()V

    .line 411
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->code()I

    move-result v7

    sparse-switch v7, :sswitch_data_bc

    .line 429
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected response code for CONNECT: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 430
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->code()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 417
    :sswitch_90
    invoke-virtual {v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->bufferSize()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_ba

    .line 418
    new-instance v7, Ljava/io/IOException;

    const-string v8, "TLS tunnel buffered too many bytes!"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 423
    :sswitch_a2
    iget-object v7, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v7, v7, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v7, v7, Lcom/squareup/okhttp/Address;->authenticator:Lcom/squareup/okhttp/Authenticator;

    iget-object v8, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v8, v8, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-static {v7, v4, v8}, Lcom/squareup/okhttp/internal/http/OkHeaders;->processAuthHeader(Lcom/squareup/okhttp/Authenticator;Lcom/squareup/okhttp/Response;Ljava/net/Proxy;)Lcom/squareup/okhttp/Request;

    move-result-object p1

    .line 425
    if-nez p1, :cond_3b

    .line 426
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Failed to authenticate with proxy"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 420
    :cond_ba
    return-void

    .line 411
    nop

    :sswitch_data_bc
    .sparse-switch
        0xc8 -> :sswitch_90
        0x197 -> :sswitch_a2
    .end sparse-switch
.end method

.method private tunnelRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;
    .registers 12
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v6}, Lcom/squareup/okhttp/Route;->requiresTunnel()Z

    move-result v6

    if-nez v6, :cond_a

    const/4 v6, 0x0

    .line 216
    :goto_9
    return-object v6

    .line 196
    :cond_a
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 197
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v6

    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v2

    .line 198
    .local v2, "port":I
    const-string v6, "https"

    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->getDefaultPort(Ljava/lang/String;)I

    move-result v6

    if-ne v2, v6, :cond_62

    move-object v0, v1

    .line 199
    .local v0, "authority":Ljava/lang/String;
    :goto_23
    new-instance v6, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v6}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    new-instance v7, Ljava/net/URL;

    const-string v8, "https"

    const-string v9, "/"

    invoke-direct {v7, v8, v1, v2, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 200
    invoke-virtual {v6, v7}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/net/URL;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v6

    const-string v7, "Host"

    .line 201
    invoke-virtual {v6, v7, v0}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v6

    const-string v7, "Proxy-Connection"

    const-string v8, "Keep-Alive"

    .line 202
    invoke-virtual {v6, v7, v8}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v4

    .line 205
    .local v4, "result":Lcom/squareup/okhttp/Request$Builder;
    const-string v6, "User-Agent"

    invoke-virtual {p1, v6}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 206
    .local v5, "userAgent":Ljava/lang/String;
    if-eqz v5, :cond_50

    .line 207
    const-string v6, "User-Agent"

    invoke-virtual {v4, v6, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 211
    :cond_50
    const-string v6, "Proxy-Authorization"

    invoke-virtual {p1, v6}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 212
    .local v3, "proxyAuthorization":Ljava/lang/String;
    if-eqz v3, :cond_5d

    .line 213
    const-string v6, "Proxy-Authorization"

    invoke-virtual {v4, v6, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 216
    :cond_5d
    invoke-virtual {v4}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v6

    goto :goto_9

    .line 198
    .end local v0    # "authority":Ljava/lang/String;
    .end local v3    # "proxyAuthorization":Ljava/lang/String;
    .end local v4    # "result":Lcom/squareup/okhttp/Request$Builder;
    .end local v5    # "userAgent":Ljava/lang/String;
    :cond_62
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method

.method private upgradeToTls(Lcom/squareup/okhttp/Request;II)V
    .registers 14
    .param p1, "tunnelRequest"    # Lcom/squareup/okhttp/Request;
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 225
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v2

    .line 228
    .local v2, "platform":Lcom/squareup/okhttp/internal/Platform;
    if-eqz p1, :cond_b

    .line 229
    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/okhttp/Connection;->makeTunnel(Lcom/squareup/okhttp/Request;II)V

    .line 233
    :cond_b
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v4, v4, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v4, v4, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v6, v6, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v6, v6, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    iget-object v7, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v7, v7, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget v7, v7, Lcom/squareup/okhttp/Address;->uriPort:I

    .line 234
    invoke-virtual {v4, v5, v6, v7, v9}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 235
    iget-object v3, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    check-cast v3, Ljavax/net/ssl/SSLSocket;

    .line 238
    .local v3, "sslSocket":Ljavax/net/ssl/SSLSocket;
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v4, v4, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v4, v3, v5}, Lcom/squareup/okhttp/ConnectionSpec;->apply(Ljavax/net/ssl/SSLSocket;Lcom/squareup/okhttp/Route;)V

    .line 242
    :try_start_32
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 245
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v4, v4, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-virtual {v4}, Lcom/squareup/okhttp/ConnectionSpec;->supportsTlsExtensions()Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 246
    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Platform;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object v1

    .local v1, "maybeProtocol":Ljava/lang/String;
    if-eqz v1, :cond_4b

    .line 247
    invoke-static {v1}, Lcom/squareup/okhttp/Protocol;->get(Ljava/lang/String;)Lcom/squareup/okhttp/Protocol;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;
    :try_end_4b
    .catchall {:try_start_32 .. :try_end_4b} :catchall_cd

    .line 250
    .end local v1    # "maybeProtocol":Ljava/lang/String;
    :cond_4b
    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 253
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-static {v4}, Lcom/squareup/okhttp/Handshake;->get(Ljavax/net/ssl/SSLSession;)Lcom/squareup/okhttp/Handshake;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 256
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v4, v4, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v4, v4, Lcom/squareup/okhttp/Address;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v5, v5, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v5, v5, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v4

    if-nez v4, :cond_d2

    .line 257
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v4

    invoke-interface {v4}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v4

    aget-object v0, v4, v8

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 258
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    new-instance v4, Ljavax/net/ssl/SSLPeerUnverifiedException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Hostname "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v6, v6, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v6, v6, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not verified:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n    certificate: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 259
    invoke-static {v0}, Lcom/squareup/okhttp/CertificatePinner;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n    DN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 260
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v6

    invoke-interface {v6}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n    subjectAltNames: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 261
    invoke-static {v0}, Lcom/squareup/okhttp/internal/tls/OkHostnameVerifier;->allSubjectAltNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 250
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    :catchall_cd
    move-exception v4

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    throw v4

    .line 265
    :cond_d2
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v4, v4, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v4, v4, Lcom/squareup/okhttp/Address;->certificatePinner:Lcom/squareup/okhttp/CertificatePinner;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v5, v5, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v5, v5, Lcom/squareup/okhttp/Address;->uriHost:Ljava/lang/String;

    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    invoke-virtual {v6}, Lcom/squareup/okhttp/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/squareup/okhttp/CertificatePinner;->check(Ljava/lang/String;Ljava/util/List;)V

    .line 267
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    sget-object v5, Lcom/squareup/okhttp/Protocol;->SPDY_3:Lcom/squareup/okhttp/Protocol;

    if-eq v4, v5, :cond_f3

    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    sget-object v5, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v4, v5, :cond_117

    .line 268
    :cond_f3
    invoke-virtual {v3, v8}, Ljavax/net/ssl/SSLSocket;->setSoTimeout(I)V

    .line 269
    new-instance v4, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v5, v5, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v4, v5, v9, v6}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;-><init>(Ljava/lang/String;ZLjava/net/Socket;)V

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 270
    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->build()Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    .line 271
    iget-object v4, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->sendConnectionPreface()V

    .line 275
    :goto_116
    return-void

    .line 273
    :cond_117
    new-instance v4, Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v5, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v6, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v4, v5, p0, v6}, Lcom/squareup/okhttp/internal/http/HttpConnection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;Ljava/net/Socket;)V

    iput-object v4, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    goto :goto_116
.end method


# virtual methods
.method clearOwner()Z
    .registers 3

    .prologue
    .line 116
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 117
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-nez v0, :cond_a

    .line 119
    const/4 v0, 0x0

    monitor-exit v1

    .line 123
    :goto_9
    return v0

    .line 122
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 123
    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_9

    .line 124
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
    .line 132
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v0

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 133
    :cond_c
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 134
    :try_start_f
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-eq v0, p1, :cond_15

    .line 135
    monitor-exit v1

    .line 143
    :goto_14
    return-void

    .line 138
    :cond_15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 139
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_1f

    .line 142
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_14

    .line 139
    :catchall_1f
    move-exception v0

    :try_start_20
    monitor-exit v1
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method connect(IIILcom/squareup/okhttp/Request;)V
    .registers 8
    .param p1, "connectTimeout"    # I
    .param p2, "readTimeout"    # I
    .param p3, "writeTimeout"    # I
    .param p4, "tunnelRequest"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/squareup/okhttp/Connection;->connected:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_24

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_51

    .line 150
    :cond_24
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v0, v0, Lcom/squareup/okhttp/Address;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    .line 155
    :goto_30
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 156
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v2, v2, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v0, v1, v2, p1}, Lcom/squareup/okhttp/internal/Platform;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V

    .line 158
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v0, v0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v0, v0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_5d

    .line 159
    invoke-direct {p0, p4, p2, p3}, Lcom/squareup/okhttp/Connection;->upgradeToTls(Lcom/squareup/okhttp/Request;II)V

    .line 163
    :goto_4d
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/Connection;->connected:Z

    .line 164
    return-void

    .line 152
    :cond_51
    new-instance v0, Ljava/net/Socket;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    iget-object v1, v1, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-direct {v0, v1}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    goto :goto_30

    .line 161
    :cond_5d
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v2, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-direct {v0, v1, p0, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;Ljava/net/Socket;)V

    iput-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    goto :goto_4d
.end method

.method connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Ljava/lang/Object;Lcom/squareup/okhttp/Request;)V
    .registers 8
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "owner"    # Ljava/lang/Object;
    .param p3, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-virtual {p0, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 173
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_34

    .line 174
    invoke-direct {p0, p3}, Lcom/squareup/okhttp/Connection;->tunnelRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;

    move-result-object v0

    .line 175
    .local v0, "tunnelRequest":Lcom/squareup/okhttp/Request;
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectTimeout()I

    move-result v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v2

    .line 176
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getWriteTimeout()I

    move-result v3

    .line 175
    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/squareup/okhttp/Connection;->connect(IIILcom/squareup/okhttp/Request;)V

    .line 177
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 178
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/squareup/okhttp/ConnectionPool;->share(Lcom/squareup/okhttp/Connection;)V

    .line 180
    :cond_29
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v1

    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/RouteDatabase;->connected(Lcom/squareup/okhttp/Route;)V

    .line 183
    .end local v0    # "tunnelRequest":Lcom/squareup/okhttp/Request;
    :cond_34
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getWriteTimeout()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/squareup/okhttp/Connection;->setTimeouts(II)V

    .line 184
    return-void
.end method

.method public getHandshake()Lcom/squareup/okhttp/Handshake;
    .registers 2

    .prologue
    .line 329
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method getIdleStartTimeNs()J
    .registers 3

    .prologue
    .line 325
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    if-nez v0, :cond_7

    iget-wide v0, p0, Lcom/squareup/okhttp/Connection;->idleStartTimeNs:J

    :goto_6
    return-wide v0

    :cond_7
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->getIdleStartTimeNs()J

    move-result-wide v0

    goto :goto_6
.end method

.method getOwner()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 96
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 97
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    monitor-exit v1

    return-object v0

    .line 98
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
    .line 352
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method public getRoute()Lcom/squareup/okhttp/Route;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->route:Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method incrementRecycleCount()V
    .registers 2

    .prologue
    .line 375
    iget v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    .line 376
    return-void
.end method

.method isAlive()Z
    .registers 2

    .prologue
    .line 297
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
    .line 279
    iget-boolean v0, p0, Lcom/squareup/okhttp/Connection;->connected:Z

    return v0
.end method

.method isIdle()Z
    .registers 2

    .prologue
    .line 317
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->isIdle()Z

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
    .line 306
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->isReadable()Z

    move-result v0

    .line 307
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x1

    goto :goto_a
.end method

.method isSpdy()Z
    .registers 2

    .prologue
    .line 344
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
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
    .line 334
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    if-eqz v0, :cond_c

    new-instance v0, Lcom/squareup/okhttp/internal/http/SpdyTransport;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    invoke-direct {v0, p1, v1}, Lcom/squareup/okhttp/internal/http/SpdyTransport;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/spdy/SpdyConnection;)V

    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpTransport;

    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-direct {v0, p1, v1}, Lcom/squareup/okhttp/internal/http/HttpTransport;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/http/HttpConnection;)V

    goto :goto_b
.end method

.method recycleCount()I
    .registers 2

    .prologue
    .line 383
    iget v0, p0, Lcom/squareup/okhttp/Connection;->recycleCount:I

    return v0
.end method

.method resetIdleStartTime()V
    .registers 3

    .prologue
    .line 311
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->spdyConnection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "spdyConnection != null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 312
    :cond_c
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/squareup/okhttp/Connection;->idleStartTimeNs:J

    .line 313
    return-void
.end method

.method setOwner(Ljava/lang/Object;)V
    .registers 5
    .param p1, "owner"    # Ljava/lang/Object;

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 107
    :goto_6
    return-void

    .line 103
    :cond_7
    iget-object v1, p0, Lcom/squareup/okhttp/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 104
    :try_start_a
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    if-eqz v0, :cond_19

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Connection already has an owner!"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_a .. :try_end_18} :catchall_16

    throw v0

    .line 105
    :cond_19
    :try_start_19
    iput-object p1, p0, Lcom/squareup/okhttp/Connection;->owner:Ljava/lang/Object;

    .line 106
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_16

    goto :goto_6
.end method

.method setProtocol(Lcom/squareup/okhttp/Protocol;)V
    .registers 4
    .param p1, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 360
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "protocol == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 361
    :cond_a
    iput-object p1, p0, Lcom/squareup/okhttp/Connection;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 362
    return-void
.end method

.method setTimeouts(II)V
    .registers 5
    .param p1, "readTimeoutMillis"    # I
    .param p2, "writeTimeoutMillis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    iget-boolean v0, p0, Lcom/squareup/okhttp/Connection;->connected:Z

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setTimeouts - not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 368
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    if-eqz v0, :cond_1a

    .line 369
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->socket:Ljava/net/Socket;

    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 370
    iget-object v0, p0, Lcom/squareup/okhttp/Connection;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->setTimeouts(II)V

    .line 372
    :cond_1a
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 436
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

    .line 441
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

    .line 443
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
