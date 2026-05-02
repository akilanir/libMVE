.class public Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;
.super Ljava/lang/Object;
.source "MainClientExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

.field private final connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

.field private final keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

.field private final proxyHttpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

.field private final requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

.field private final routeDirector:Lcz/msebera/android/httpclient/conn/routing/HttpRouteDirector;

.field private final targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

.field private final userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/UserTokenHandler;)V
    .registers 12
    .param p1, "requestExecutor"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .param p2, "connManager"    # Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    .param p3, "reuseStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p4, "keepAliveStrategy"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .param p5, "targetAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p6, "proxyAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p7, "userTokenHandler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 112
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 113
    const-string v0, "Client connection manager"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    const-string v0, "Connection reuse strategy"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 115
    const-string v0, "Connection keep alive strategy"

    invoke-static {p4, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    const-string v0, "Target authentication strategy"

    invoke-static {p5, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 117
    const-string v0, "Proxy authentication strategy"

    invoke-static {p6, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 118
    const-string v0, "User token handler"

    invoke-static {p7, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    new-instance v0, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    .line 120
    new-instance v0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x2

    new-array v1, v1, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    const/4 v2, 0x0

    new-instance v3, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;-><init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyHttpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 122
    new-instance v0, Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/conn/routing/BasicRouteDirector;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->routeDirector:Lcz/msebera/android/httpclient/conn/routing/HttpRouteDirector;

    .line 123
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .line 124
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    .line 125
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 126
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .line 127
    iput-object p5, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 128
    iput-object p6, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 129
    iput-object p7, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .line 130
    return-void
.end method

.method private createTunnelToProxy(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z
    .registers 6
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "hop"    # I
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 524
    new-instance v0, Lcz/msebera/android/httpclient/HttpException;

    const-string v1, "Proxy chains are not supported."

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/HttpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createTunnelToTarget(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z
    .registers 22
    .param p1, "proxyAuthState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p2, "managedConn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p3, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p4, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p5, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v10

    .line 432
    .local v10, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getConnectTimeout()I

    move-result v15

    .line 434
    .local v15, "timeout":I
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v14

    .line 435
    .local v14, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v4

    .line 436
    .local v4, "proxy":Lcz/msebera/android/httpclient/HttpHost;
    const/4 v5, 0x0

    .line 438
    .local v5, "response":Lcz/msebera/android/httpclient/HttpResponse;
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v9

    .line 439
    .local v9, "authority":Ljava/lang/String;
    new-instance v11, Lcz/msebera/android/httpclient/message/BasicHttpRequest;

    const-string v3, "CONNECT"

    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/HttpRequest;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v6

    invoke-direct {v11, v3, v9, v6}, Lcz/msebera/android/httpclient/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lcz/msebera/android/httpclient/ProtocolVersion;)V

    .line 441
    .local v11, "connect":Lcz/msebera/android/httpclient/HttpRequest;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyHttpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v0, p5

    invoke-virtual {v3, v11, v6, v0}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->preProcess(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 443
    :cond_2d
    :goto_2d
    if-nez v5, :cond_d9

    .line 444
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->isOpen()Z

    move-result v3

    if-nez v3, :cond_45

    .line 445
    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    if-lez v15, :cond_8a

    move v3, v15

    :goto_3c
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-interface {v6, v0, v1, v3, v2}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->connect(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 452
    :cond_45
    const-string v3, "Proxy-Authorization"

    invoke-interface {v11, v3}, Lcz/msebera/android/httpclient/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 453
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    invoke-virtual {v3, v11, v0, v1}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->generateAuthResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 455
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v3, v11, v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->execute(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v5

    .line 457
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v13

    .line 458
    .local v13, "status":I
    const/16 v3, 0xc8

    if-ge v13, v3, :cond_8c

    .line 459
    new-instance v3, Lcz/msebera/android/httpclient/HttpException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected response to CONNECT request: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 460
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lcz/msebera/android/httpclient/HttpException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 445
    .end local v13    # "status":I
    :cond_8a
    const/4 v3, 0x0

    goto :goto_3c

    .line 463
    .restart local v13    # "status":I
    :cond_8c
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 464
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object/from16 v7, p1

    move-object/from16 v8, p5

    invoke-virtual/range {v3 .. v8}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 466
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object/from16 v7, p1

    move-object/from16 v8, p5

    invoke-virtual/range {v3 .. v8}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 469
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    move-object/from16 v0, p5

    invoke-interface {v3, v5, v0}, Lcz/msebera/android/httpclient/ConnectionReuseStrategy;->keepAlive(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_d5

    .line 470
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Connection kept alive"

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 472
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v12

    .line 473
    .local v12, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-static {v12}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 477
    .end local v12    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :goto_d2
    const/4 v5, 0x0

    goto/16 :goto_2d

    .line 475
    :cond_d5
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V

    goto :goto_d2

    .line 483
    .end local v13    # "status":I
    :cond_d9
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v13

    .line 485
    .restart local v13    # "status":I
    const/16 v3, 0x12b

    if-le v13, v3, :cond_113

    .line 488
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v12

    .line 489
    .restart local v12    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v12, :cond_f3

    .line 490
    new-instance v3, Lcz/msebera/android/httpclient/entity/BufferedHttpEntity;

    invoke-direct {v3, v12}, Lcz/msebera/android/httpclient/entity/BufferedHttpEntity;-><init>(Lcz/msebera/android/httpclient/HttpEntity;)V

    invoke-interface {v5, v3}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 493
    :cond_f3
    invoke-interface/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V

    .line 494
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CONNECT refused by proxy: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 495
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, v5}, Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;-><init>(Ljava/lang/String;Lcz/msebera/android/httpclient/HttpResponse;)V

    throw v3

    .line 502
    .end local v12    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :cond_113
    const/4 v3, 0x0

    return v3
.end method

.method private needAuthentication(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z
    .registers 20
    .param p1, "targetAuthState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p2, "proxyAuthState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p3, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p4, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p5, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    .prologue
    .line 533
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v10

    .line 534
    .local v10, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v0

    if-eqz v0, :cond_77

    .line 535
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    .line 536
    .local v1, "target":Lcz/msebera/android/httpclient/HttpHost;
    if-nez v1, :cond_14

    .line 537
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    .line 539
    :cond_14
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v0

    if-gez v0, :cond_30

    .line 540
    new-instance v12, Lcz/msebera/android/httpclient/HttpHost;

    .line 541
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 542
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v2

    .line 543
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v12, v0, v2, v4}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .local v12, "target":Lcz/msebera/android/httpclient/HttpHost;
    move-object v1, v12

    .line 545
    .end local v12    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_30
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object/from16 v2, p4

    move-object v4, p1

    move-object/from16 v5, p5

    invoke-virtual/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v13

    .line 548
    .local v13, "targetAuthRequested":Z
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v3

    .line 550
    .local v3, "proxy":Lcz/msebera/android/httpclient/HttpHost;
    if-nez v3, :cond_47

    .line 551
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v3

    .line 553
    :cond_47
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object/from16 v4, p4

    move-object/from16 v6, p2

    move-object/from16 v7, p5

    invoke-virtual/range {v2 .. v7}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v11

    .line 556
    .local v11, "proxyAuthRequested":Z
    if-eqz v13, :cond_66

    .line 557
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object v5, v1

    move-object/from16 v6, p4

    move-object v8, p1

    move-object/from16 v9, p5

    invoke-virtual/range {v4 .. v9}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v0

    .line 565
    .end local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .end local v3    # "proxy":Lcz/msebera/android/httpclient/HttpHost;
    .end local v11    # "proxyAuthRequested":Z
    .end local v13    # "targetAuthRequested":Z
    :goto_65
    return v0

    .line 560
    .restart local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v3    # "proxy":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v11    # "proxyAuthRequested":Z
    .restart local v13    # "targetAuthRequested":Z
    :cond_66
    if-eqz v11, :cond_77

    .line 561
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-object/from16 v4, p4

    move-object/from16 v6, p2

    move-object/from16 v7, p5

    invoke-virtual/range {v2 .. v7}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v0

    goto :goto_65

    .line 565
    .end local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .end local v3    # "proxy":Lcz/msebera/android/httpclient/HttpHost;
    .end local v11    # "proxyAuthRequested":Z
    .end local v13    # "targetAuthRequested":Z
    :cond_77
    const/4 v0, 0x0

    goto :goto_65
.end method


# virtual methods
.method establishRoute(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)V
    .registers 18
    .param p1, "proxyAuthState"    # Lcz/msebera/android/httpclient/auth/AuthState;
    .param p2, "managedConn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p3, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p4, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p5, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v1

    .line 353
    .local v1, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getConnectTimeout()I

    move-result v7

    .line 354
    .local v7, "timeout":I
    new-instance v8, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;

    invoke-direct {v8, p3}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;-><init>(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    .line 357
    .local v8, "tracker":Lcz/msebera/android/httpclient/conn/routing/RouteTracker;
    :cond_d
    invoke-virtual {v8}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->toRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v2

    .line 358
    .local v2, "fact":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->routeDirector:Lcz/msebera/android/httpclient/conn/routing/HttpRouteDirector;

    invoke-interface {v9, p3, v2}, Lcz/msebera/android/httpclient/conn/routing/HttpRouteDirector;->nextStep(Lcz/msebera/android/httpclient/conn/routing/RouteInfo;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)I

    move-result v6

    .line 360
    .local v6, "step":I
    packed-switch v6, :pswitch_data_c8

    .line 409
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unknown step indicator "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " from RouteDirector."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 363
    :pswitch_39
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    if-lez v7, :cond_4d

    move v9, v7

    :goto_3e
    move-object/from16 v0, p5

    invoke-interface {v10, p2, p3, v9, v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->connect(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 368
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->isSecure()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->connectTarget(Z)V

    .line 413
    :goto_4a
    if-gtz v6, :cond_d

    .line 414
    return-void

    .line 363
    :cond_4d
    const/4 v9, 0x0

    goto :goto_3e

    .line 371
    :pswitch_4f
    iget-object v10, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    if-lez v7, :cond_62

    move v9, v7

    :goto_54
    move-object/from16 v0, p5

    invoke-interface {v10, p2, p3, v9, v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->connect(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 376
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v4

    .line 377
    .local v4, "proxy":Lcz/msebera/android/httpclient/HttpHost;
    const/4 v9, 0x0

    invoke-virtual {v8, v4, v9}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->connectProxy(Lcz/msebera/android/httpclient/HttpHost;Z)V

    goto :goto_4a

    .line 371
    .end local v4    # "proxy":Lcz/msebera/android/httpclient/HttpHost;
    :cond_62
    const/4 v9, 0x0

    goto :goto_54

    .line 380
    :pswitch_64
    invoke-direct/range {p0 .. p5}, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->createTunnelToTarget(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z

    move-result v5

    .line 382
    .local v5, "secure":Z
    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v10, "Tunnel to target created."

    invoke-virtual {v9, v10}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 383
    invoke-virtual {v8, v5}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->tunnelTarget(Z)V

    goto :goto_4a

    .line 391
    .end local v5    # "secure":Z
    :pswitch_73
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getHopCount()I

    move-result v9

    add-int/lit8 v3, v9, -0x1

    .line 392
    .local v3, "hop":I
    move-object/from16 v0, p5

    invoke-direct {p0, p3, v3, v0}, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->createTunnelToProxy(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z

    move-result v5

    .line 393
    .restart local v5    # "secure":Z
    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v10, "Tunnel to proxy created."

    invoke-virtual {v9, v10}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 394
    invoke-virtual {p3, v3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getHopTarget(I)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v9

    invoke-virtual {v8, v9, v5}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->tunnelProxy(Lcz/msebera/android/httpclient/HttpHost;Z)V

    goto :goto_4a

    .line 398
    .end local v3    # "hop":I
    .end local v5    # "secure":Z
    :pswitch_8e
    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v0, p5

    invoke-interface {v9, p2, p3, v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->upgrade(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 399
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->isSecure()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcz/msebera/android/httpclient/conn/routing/RouteTracker;->layerProtocol(Z)V

    goto :goto_4a

    .line 403
    :pswitch_9d
    new-instance v9, Lcz/msebera/android/httpclient/HttpException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to establish route: planned = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; current = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcz/msebera/android/httpclient/HttpException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 406
    :pswitch_c0
    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v0, p5

    invoke-interface {v9, p2, p3, v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->routeComplete(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    goto :goto_4a

    .line 360
    :pswitch_data_c8
    .packed-switch -0x1
        :pswitch_9d
        :pswitch_c0
        :pswitch_39
        :pswitch_4f
        :pswitch_64
        :pswitch_73
        :pswitch_8e
    .end packed-switch
.end method

.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 33
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 137
    const-string v3, "HTTP route"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    const-string v3, "HTTP request"

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    const-string v3, "HTTP context"

    move-object/from16 v0, p3

    invoke-static {v0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v25

    .line 142
    .local v25, "targetAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    if-nez v25, :cond_29

    .line 143
    new-instance v25, Lcz/msebera/android/httpclient/auth/AuthState;

    .end local v25    # "targetAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    invoke-direct/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;-><init>()V

    .line 144
    .restart local v25    # "targetAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    const-string v3, "http.auth.target-scope"

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v3, v1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 146
    :cond_29
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getProxyAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v4

    .line 147
    .local v4, "proxyAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    if-nez v4, :cond_3b

    .line 148
    new-instance v4, Lcz/msebera/android/httpclient/auth/AuthState;

    .end local v4    # "proxyAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    invoke-direct {v4}, Lcz/msebera/android/httpclient/auth/AuthState;-><init>()V

    .line 149
    .restart local v4    # "proxyAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    const-string v3, "http.auth.proxy-scope"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v4}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 152
    :cond_3b
    move-object/from16 v0, p2

    instance-of v3, v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v3, :cond_48

    move-object/from16 v3, p2

    .line 153
    check-cast v3, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    invoke-static {v3}, Lcz/msebera/android/httpclient/impl/execchain/RequestEntityProxy;->enhance(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 156
    :cond_48
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getUserToken()Ljava/lang/Object;

    move-result-object v27

    .line 158
    .local v27, "userToken":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-interface {v3, v0, v1}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->requestConnection(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/conn/ConnectionRequest;

    move-result-object v15

    .line 159
    .local v15, "connRequest":Lcz/msebera/android/httpclient/conn/ConnectionRequest;
    if-eqz p4, :cond_70

    .line 160
    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v3

    if-eqz v3, :cond_6b

    .line 161
    invoke-interface {v15}, Lcz/msebera/android/httpclient/conn/ConnectionRequest;->cancel()Z

    .line 162
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v6, "Request aborted"

    invoke-direct {v3, v6}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 164
    :cond_6b
    move-object/from16 v0, p4

    invoke-interface {v0, v15}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->setCancellable(Lcz/msebera/android/httpclient/concurrent/Cancellable;)V

    .line 168
    :cond_70
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v13

    .line 172
    .local v13, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    :try_start_74
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v26

    .line 173
    .local v26, "timeout":I
    if-lez v26, :cond_ec

    move/from16 v0, v26

    int-to-long v6, v0

    :goto_7d
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v15, v6, v7, v3}, Lcz/msebera/android/httpclient/conn/ConnectionRequest;->get(JLjava/util/concurrent/TimeUnit;)Lcz/msebera/android/httpclient/HttpClientConnection;
    :try_end_82
    .catch Ljava/lang/InterruptedException; {:try_start_74 .. :try_end_82} :catch_ef
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_74 .. :try_end_82} :catch_101

    move-result-object v5

    .line 185
    .local v5, "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    const-string v3, "http.connection"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 187
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->isStaleConnectionCheckEnabled()Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 189
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpClientConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 190
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Stale connection check"

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 191
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpClientConnection;->isStale()Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 192
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Stale connection detected"

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 193
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V

    .line 198
    :cond_b1
    new-instance v14, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    invoke-direct {v14, v3, v6, v5}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;-><init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/HttpClientConnection;)V

    .line 200
    .local v14, "connHolder":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    if-eqz p4, :cond_c5

    .line 201
    :try_start_c0
    move-object/from16 v0, p4

    invoke-interface {v0, v14}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->setCancellable(Lcz/msebera/android/httpclient/concurrent/Cancellable;)V

    .line 205
    :cond_c5
    const/16 v20, 0x1

    .line 207
    .local v20, "execCount":I
    :goto_c7
    const/4 v3, 0x1

    move/from16 v0, v20

    if-le v0, v3, :cond_112

    invoke-static/range {p2 .. p2}, Lcz/msebera/android/httpclient/impl/execchain/RequestEntityProxy;->isRepeatable(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v3

    if-nez v3, :cond_112

    .line 208
    new-instance v3, Lcz/msebera/android/httpclient/client/NonRepeatableRequestException;

    const-string v6, "Cannot retry request with a non-repeatable request entity."

    invoke-direct {v3, v6}, Lcz/msebera/android/httpclient/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_da
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_c0 .. :try_end_da} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_c0 .. :try_end_da} :catch_122
    .catch Ljava/io/IOException; {:try_start_c0 .. :try_end_da} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_c0 .. :try_end_da} :catch_330

    .line 326
    .end local v20    # "execCount":I
    :catch_da
    move-exception v19

    .line 327
    .local v19, "ex":Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;
    new-instance v22, Ljava/io/InterruptedIOException;

    const-string v3, "Connection has been shut down"

    move-object/from16 v0, v22

    invoke-direct {v0, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 329
    .local v22, "ioex":Ljava/io/InterruptedIOException;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 330
    throw v22

    .line 173
    .end local v5    # "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    .end local v14    # "connHolder":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    .end local v19    # "ex":Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;
    .end local v22    # "ioex":Ljava/io/InterruptedIOException;
    :cond_ec
    const-wide/16 v6, 0x0

    goto :goto_7d

    .line 174
    .end local v26    # "timeout":I
    :catch_ef
    move-exception v21

    .line 175
    .local v21, "interrupted":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 176
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v6, "Request aborted"

    move-object/from16 v0, v21

    invoke-direct {v3, v6, v0}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 177
    .end local v21    # "interrupted":Ljava/lang/InterruptedException;
    :catch_101
    move-exception v19

    .line 178
    .local v19, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v12

    .line 179
    .local v12, "cause":Ljava/lang/Throwable;
    if-nez v12, :cond_10a

    .line 180
    move-object/from16 v12, v19

    .line 182
    :cond_10a
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v6, "Request execution failed"

    invoke-direct {v3, v6, v12}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 212
    .end local v12    # "cause":Ljava/lang/Throwable;
    .end local v19    # "ex":Ljava/util/concurrent/ExecutionException;
    .restart local v5    # "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    .restart local v14    # "connHolder":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    .restart local v20    # "execCount":I
    .restart local v26    # "timeout":I
    :cond_112
    if-eqz p4, :cond_127

    :try_start_114
    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v3

    if-eqz v3, :cond_127

    .line 213
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v6, "Request aborted"

    invoke-direct {v3, v6}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_122
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_114 .. :try_end_122} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_114 .. :try_end_122} :catch_122
    .catch Ljava/io/IOException; {:try_start_114 .. :try_end_122} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_114 .. :try_end_122} :catch_330

    .line 331
    .end local v20    # "execCount":I
    :catch_122
    move-exception v19

    .line 332
    .local v19, "ex":Lcz/msebera/android/httpclient/HttpException;
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 333
    throw v19

    .line 216
    .end local v19    # "ex":Lcz/msebera/android/httpclient/HttpException;
    .restart local v20    # "execCount":I
    :cond_127
    :try_start_127
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpClientConnection;->isOpen()Z

    move-result v3

    if-nez v3, :cond_154

    .line 217
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Opening connection "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_149
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_127 .. :try_end_149} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_127 .. :try_end_149} :catch_122
    .catch Ljava/io/IOException; {:try_start_127 .. :try_end_149} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_127 .. :try_end_149} :catch_330

    move-object/from16 v3, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    .line 219
    :try_start_151
    invoke-virtual/range {v3 .. v8}, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->establishRoute(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)V
    :try_end_154
    .catch Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException; {:try_start_151 .. :try_end_154} :catch_174
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_151 .. :try_end_154} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_151 .. :try_end_154} :catch_122
    .catch Ljava/io/IOException; {:try_start_151 .. :try_end_154} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_151 .. :try_end_154} :catch_330

    .line 228
    :cond_154
    :try_start_154
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getSocketTimeout()I

    move-result v26

    .line 229
    if-ltz v26, :cond_15f

    .line 230
    move/from16 v0, v26

    invoke-interface {v5, v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->setSocketTimeout(I)V

    .line 233
    :cond_15f
    if-eqz p4, :cond_1c0

    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v3

    if-eqz v3, :cond_1c0

    .line 234
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v6, "Request aborted"

    invoke-direct {v3, v6}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_16f
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_154 .. :try_end_16f} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_154 .. :try_end_16f} :catch_122
    .catch Ljava/io/IOException; {:try_start_154 .. :try_end_16f} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_154 .. :try_end_16f} :catch_330

    .line 334
    .end local v20    # "execCount":I
    :catch_16f
    move-exception v19

    .line 335
    .local v19, "ex":Ljava/io/IOException;
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 336
    throw v19

    .line 220
    .end local v19    # "ex":Ljava/io/IOException;
    .restart local v20    # "execCount":I
    :catch_174
    move-exception v19

    .line 221
    .local v19, "ex":Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;
    :try_start_175
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_18a

    .line 222
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual/range {v19 .. v19}, Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 224
    :cond_18a
    invoke-virtual/range {v19 .. v19}, Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;->getResponse()Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v10

    .line 309
    .end local v19    # "ex":Lcz/msebera/android/httpclient/impl/execchain/TunnelRefusedException;
    .local v10, "response":Lcz/msebera/android/httpclient/HttpResponse;
    :cond_18e
    if-nez v27, :cond_1a3

    .line 310
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    move-object/from16 v0, p3

    invoke-interface {v3, v0}, Lcz/msebera/android/httpclient/client/UserTokenHandler;->getUserToken(Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v27

    .line 311
    const-string v3, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v27

    invoke-virtual {v0, v3, v1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 313
    :cond_1a3
    if-eqz v27, :cond_1aa

    .line 314
    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->setState(Ljava/lang/Object;)V

    .line 318
    :cond_1aa
    invoke-interface {v10}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v18

    .line 319
    .local v18, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v18, :cond_1b6

    invoke-interface/range {v18 .. v18}, Lcz/msebera/android/httpclient/HttpEntity;->isStreaming()Z

    move-result v3

    if-nez v3, :cond_382

    .line 321
    :cond_1b6
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->releaseConnection()V

    .line 322
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;

    const/4 v6, 0x0

    invoke-direct {v3, v10, v6}, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;-><init>(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;)V

    .line 324
    :goto_1bf
    return-object v3

    .line 237
    .end local v10    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v18    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :cond_1c0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_1e8

    .line 238
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Executing request "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 241
    :cond_1e8
    const-string v3, "Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_227

    .line 242
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_21a

    .line 243
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Target auth state: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 245
    :cond_21a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    move-object/from16 v2, p3

    invoke-virtual {v3, v0, v1, v2}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->generateAuthResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 247
    :cond_227
    const-string v3, "Proxy-Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_26a

    invoke-virtual/range {p1 .. p1}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_26a

    .line 248
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_25f

    .line 249
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Proxy auth state: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 251
    :cond_25f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->authenticator:Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v3, v0, v4, v1}, Lcz/msebera/android/httpclient/impl/auth/HttpAuthenticator;->generateAuthResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 254
    :cond_26a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v3, v0, v5, v1}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->execute(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v10

    .line 257
    .restart local v10    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    move-object/from16 v0, p3

    invoke-interface {v3, v10, v0}, Lcz/msebera/android/httpclient/ConnectionReuseStrategy;->keepAlive(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_32c

    .line 259
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v0, p3

    invoke-interface {v3, v10, v0}, Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)J

    move-result-wide v16

    .line 260
    .local v16, "duration":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2d9

    .line 262
    const-wide/16 v6, 0x0

    cmp-long v3, v16, v6

    if-lez v3, :cond_329

    .line 263
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "for "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v16

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 267
    .local v24, "s":Ljava/lang/String;
    :goto_2bd
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connection can be kept alive "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 269
    .end local v24    # "s":Ljava/lang/String;
    :cond_2d9
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1, v3}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->setValidFor(JLjava/util/concurrent/TimeUnit;)V

    .line 270
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->markReusable()V

    .end local v16    # "duration":J
    :goto_2e3
    move-object/from16 v6, p0

    move-object/from16 v7, v25

    move-object v8, v4

    move-object/from16 v9, p1

    move-object/from16 v11, p3

    .line 275
    invoke-direct/range {v6 .. v11}, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->needAuthentication(Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/auth/AuthState;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Z

    move-result v3

    if-eqz v3, :cond_18e

    .line 278
    invoke-interface {v10}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v18

    .line 279
    .restart local v18    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->isReusable()Z

    move-result v3

    if-eqz v3, :cond_335

    .line 280
    invoke-static/range {v18 .. v18}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 297
    :cond_2ff
    :goto_2ff
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v23

    .line 298
    .local v23, "original":Lcz/msebera/android/httpclient/HttpRequest;
    const-string v3, "Authorization"

    move-object/from16 v0, v23

    invoke-interface {v0, v3}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_314

    .line 299
    const-string v3, "Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 301
    :cond_314
    const-string v3, "Proxy-Authorization"

    move-object/from16 v0, v23

    invoke-interface {v0, v3}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_325

    .line 302
    const-string v3, "Proxy-Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 205
    :cond_325
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_c7

    .line 265
    .end local v18    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v23    # "original":Lcz/msebera/android/httpclient/HttpRequest;
    .restart local v16    # "duration":J
    :cond_329
    const-string v24, "indefinitely"

    .restart local v24    # "s":Ljava/lang/String;
    goto :goto_2bd

    .line 272
    .end local v16    # "duration":J
    .end local v24    # "s":Ljava/lang/String;
    :cond_32c
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->markNonReusable()V
    :try_end_32f
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_175 .. :try_end_32f} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_175 .. :try_end_32f} :catch_122
    .catch Ljava/io/IOException; {:try_start_175 .. :try_end_32f} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_175 .. :try_end_32f} :catch_330

    goto :goto_2e3

    .line 337
    .end local v10    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v20    # "execCount":I
    :catch_330
    move-exception v19

    .line 338
    .local v19, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 339
    throw v19

    .line 282
    .end local v19    # "ex":Ljava/lang/RuntimeException;
    .restart local v10    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .restart local v18    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .restart local v20    # "execCount":I
    :cond_335
    :try_start_335
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V

    .line 283
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v3

    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->SUCCESS:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    if-ne v3, v6, :cond_35c

    .line 284
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v3

    if-eqz v3, :cond_35c

    .line 285
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isConnectionBased()Z

    move-result v3

    if-eqz v3, :cond_35c

    .line 286
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Resetting proxy auth state"

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 287
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V

    .line 289
    :cond_35c
    invoke-virtual/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;->getState()Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    move-result-object v3

    sget-object v6, Lcz/msebera/android/httpclient/auth/AuthProtocolState;->SUCCESS:Lcz/msebera/android/httpclient/auth/AuthProtocolState;

    if-ne v3, v6, :cond_2ff

    .line 290
    invoke-virtual/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v3

    if-eqz v3, :cond_2ff

    .line 291
    invoke-virtual/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isConnectionBased()Z

    move-result v3

    if-eqz v3, :cond_2ff

    .line 292
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Resetting target auth state"

    invoke-virtual {v3, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 293
    invoke-virtual/range {v25 .. v25}, Lcz/msebera/android/httpclient/auth/AuthState;->reset()V

    goto/16 :goto_2ff

    .line 324
    :cond_382
    new-instance v3, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;

    invoke-direct {v3, v10, v14}, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;-><init>(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;)V
    :try_end_387
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_335 .. :try_end_387} :catch_da
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_335 .. :try_end_387} :catch_122
    .catch Ljava/io/IOException; {:try_start_335 .. :try_end_387} :catch_16f
    .catch Ljava/lang/RuntimeException; {:try_start_335 .. :try_end_387} :catch_330

    goto/16 :goto_1bf
.end method
