.class public Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;
.super Ljava/lang/Object;
.source "MinimalClientExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

.field private final httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

.field private final keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;)V
    .registers 12
    .param p1, "requestExecutor"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .param p2, "connManager"    # Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    .param p3, "reuseStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p4, "keepAliveStrategy"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 96
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    const-string v0, "Client connection manager"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    const-string v0, "Connection reuse strategy"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    const-string v0, "Connection keep alive strategy"

    invoke-static {p4, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 100
    new-instance v0, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x4

    new-array v1, v1, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    const/4 v2, 0x0

    new-instance v3, Lcz/msebera/android/httpclient/protocol/RequestContent;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/protocol/RequestContent;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-instance v3, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-instance v3, Lcz/msebera/android/httpclient/protocol/RequestUserAgent;

    const-string v4, "Apache-HttpClient"

    const-string v5, "cz.msebera.android.httpclient.client"

    .line 105
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 104
    invoke-static {v4, v5, v6}, Lcz/msebera/android/httpclient/util/VersionInfo;->getUserAgent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcz/msebera/android/httpclient/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;-><init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 106
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .line 107
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    .line 108
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 109
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .line 110
    return-void
.end method

.method static rewriteRequestURI(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V
    .registers 7
    .param p0, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 117
    .local v1, "uri":Ljava/net/URI;
    if-eqz v1, :cond_15

    .line 119
    invoke-virtual {v1}, Ljava/net/URI;->isAbsolute()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 120
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    .line 124
    :goto_12
    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 129
    :cond_15
    return-void

    .line 122
    :cond_16
    invoke-static {v1}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_19
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_19} :catch_1b

    move-result-object v1

    goto :goto_12

    .line 126
    .end local v1    # "uri":Ljava/net/URI;
    :catch_1b
    move-exception v0

    .line 127
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v2, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid URI: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 28
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
    .line 136
    const-string v20, "HTTP route"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 137
    const-string v20, "HTTP request"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    const-string v20, "HTTP context"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->rewriteRequestURI(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->requestConnection(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/conn/ConnectionRequest;

    move-result-object v6

    .line 143
    .local v6, "connRequest":Lcz/msebera/android/httpclient/conn/ConnectionRequest;
    if-eqz p4, :cond_4c

    .line 144
    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v20

    if-eqz v20, :cond_47

    .line 145
    invoke-interface {v6}, Lcz/msebera/android/httpclient/conn/ConnectionRequest;->cancel()Z

    .line 146
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v21, "Request aborted"

    invoke-direct/range {v20 .. v21}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 148
    :cond_47
    move-object/from16 v0, p4

    invoke-interface {v0, v6}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->setCancellable(Lcz/msebera/android/httpclient/concurrent/Cancellable;)V

    .line 152
    :cond_4c
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequestConfig()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v5

    .line 156
    .local v5, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    :try_start_50
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v18

    .line 157
    .local v18, "timeout":I
    if-lez v18, :cond_9b

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v20, v0

    :goto_5b
    sget-object v22, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v20

    move-object/from16 v2, v22

    invoke-interface {v6, v0, v1, v2}, Lcz/msebera/android/httpclient/conn/ConnectionRequest;->get(JLjava/util/concurrent/TimeUnit;)Lcz/msebera/android/httpclient/HttpClientConnection;
    :try_end_64
    .catch Ljava/lang/InterruptedException; {:try_start_50 .. :try_end_64} :catch_9e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_50 .. :try_end_64} :catch_b2

    move-result-object v13

    .line 169
    .local v13, "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    new-instance v15, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v15, v0, v1, v13}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;-><init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/HttpClientConnection;)V

    .line 171
    .local v15, "releaseTrigger":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    if-eqz p4, :cond_cb

    .line 172
    :try_start_7c
    invoke-interface/range {p4 .. p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v20

    if-eqz v20, :cond_c6

    .line 173
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->close()V

    .line 174
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v21, "Request aborted"

    invoke-direct/range {v20 .. v21}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v20
    :try_end_8d
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_7c .. :try_end_8d} :catch_8d
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_7c .. :try_end_8d} :catch_1e2
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_8d} :catch_1f1
    .catch Ljava/lang/RuntimeException; {:try_start_7c .. :try_end_8d} :catch_1f6

    .line 234
    .end local v18    # "timeout":I
    :catch_8d
    move-exception v10

    .line 235
    .local v10, "ex":Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;
    new-instance v12, Ljava/io/InterruptedIOException;

    const-string v20, "Connection has been shut down"

    move-object/from16 v0, v20

    invoke-direct {v12, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 237
    .local v12, "ioex":Ljava/io/InterruptedIOException;
    invoke-virtual {v12, v10}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 238
    throw v12

    .line 157
    .end local v10    # "ex":Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;
    .end local v12    # "ioex":Ljava/io/InterruptedIOException;
    .end local v13    # "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    .end local v15    # "releaseTrigger":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    .restart local v18    # "timeout":I
    :cond_9b
    const-wide/16 v20, 0x0

    goto :goto_5b

    .line 158
    .end local v18    # "timeout":I
    :catch_9e
    move-exception v11

    .line 159
    .local v11, "interrupted":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Thread;->interrupt()V

    .line 160
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v21, "Request aborted"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v11}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v20

    .line 161
    .end local v11    # "interrupted":Ljava/lang/InterruptedException;
    :catch_b2
    move-exception v10

    .line 162
    .local v10, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v10}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    .line 163
    .local v4, "cause":Ljava/lang/Throwable;
    if-nez v4, :cond_ba

    .line 164
    move-object v4, v10

    .line 166
    :cond_ba
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;

    const-string v21, "Request execution failed"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v4}, Lcz/msebera/android/httpclient/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v20

    .line 176
    .end local v4    # "cause":Ljava/lang/Throwable;
    .end local v10    # "ex":Ljava/util/concurrent/ExecutionException;
    .restart local v13    # "managedConn":Lcz/msebera/android/httpclient/HttpClientConnection;
    .restart local v15    # "releaseTrigger":Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;
    .restart local v18    # "timeout":I
    :cond_c6
    :try_start_c6
    move-object/from16 v0, p4

    invoke-interface {v0, v15}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->setCancellable(Lcz/msebera/android/httpclient/concurrent/Cancellable;)V

    .line 180
    :cond_cb
    invoke-interface {v13}, Lcz/msebera/android/httpclient/HttpClientConnection;->isOpen()Z

    move-result v20

    if-nez v20, :cond_f7

    .line 181
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getConnectTimeout()I

    move-result v18

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    if-lez v18, :cond_1da

    .end local v18    # "timeout":I
    :goto_dd
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move/from16 v2, v18

    move-object/from16 v3, p3

    invoke-interface {v0, v13, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->connect(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-interface {v0, v13, v1, v2}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->routeComplete(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 189
    :cond_f7
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->getSocketTimeout()I

    move-result v18

    .line 190
    .restart local v18    # "timeout":I
    if-ltz v18, :cond_102

    .line 191
    move/from16 v0, v18

    invoke-interface {v13, v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->setSocketTimeout(I)V

    .line 194
    :cond_102
    const/16 v17, 0x0

    .line 195
    .local v17, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v14

    .line 196
    .local v14, "original":Lcz/msebera/android/httpclient/HttpRequest;
    instance-of v0, v14, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    move/from16 v20, v0

    if-eqz v20, :cond_133

    .line 197
    check-cast v14, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .end local v14    # "original":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v14}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v19

    .line 198
    .local v19, "uri":Ljava/net/URI;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->isAbsolute()Z

    move-result v20

    if-eqz v20, :cond_133

    .line 199
    new-instance v17, Lcz/msebera/android/httpclient/HttpHost;

    .end local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getPort()I

    move-result v21

    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 202
    .end local v19    # "uri":Ljava/net/URI;
    .restart local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_133
    if-nez v17, :cond_139

    .line 203
    invoke-virtual/range {p1 .. p1}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v17

    .line 206
    :cond_139
    const-string v20, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 207
    const-string v20, "http.request"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    const-string v20, "http.connection"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v13}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 209
    const-string v20, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->requestExecutor:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v13, v2}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->execute(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v16

    .line 213
    .local v16, "response":Lcz/msebera/android/httpclient/HttpResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/ConnectionReuseStrategy;->keepAlive(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v20

    if-eqz v20, :cond_1de

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/MinimalClientExec;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)J

    move-result-wide v7

    .line 219
    .local v7, "duration":J
    sget-object v20, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v20

    invoke-virtual {v15, v7, v8, v0}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->setValidFor(JLjava/util/concurrent/TimeUnit;)V

    .line 220
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->markReusable()V

    .line 226
    .end local v7    # "duration":J
    :goto_1bd
    invoke-interface/range {v16 .. v16}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v9

    .line 227
    .local v9, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v9, :cond_1c9

    invoke-interface {v9}, Lcz/msebera/android/httpclient/HttpEntity;->isStreaming()Z

    move-result v20

    if-nez v20, :cond_1e7

    .line 229
    :cond_1c9
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->releaseConnection()V

    .line 230
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;-><init>(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;)V

    .line 232
    :goto_1d9
    return-object v20

    .line 182
    .end local v9    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v16    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_1da
    const/16 v18, 0x0

    goto/16 :goto_dd

    .line 222
    .restart local v16    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .restart local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :cond_1de
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->markNonReusable()V
    :try_end_1e1
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_c6 .. :try_end_1e1} :catch_8d
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_c6 .. :try_end_1e1} :catch_1e2
    .catch Ljava/io/IOException; {:try_start_c6 .. :try_end_1e1} :catch_1f1
    .catch Ljava/lang/RuntimeException; {:try_start_c6 .. :try_end_1e1} :catch_1f6

    goto :goto_1bd

    .line 239
    .end local v16    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .end local v18    # "timeout":I
    :catch_1e2
    move-exception v10

    .line 240
    .local v10, "ex":Lcz/msebera/android/httpclient/HttpException;
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 241
    throw v10

    .line 232
    .end local v10    # "ex":Lcz/msebera/android/httpclient/HttpException;
    .restart local v9    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .restart local v16    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .restart local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v18    # "timeout":I
    :cond_1e7
    :try_start_1e7
    new-instance v20, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v15}, Lcz/msebera/android/httpclient/impl/execchain/HttpResponseProxy;-><init>(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;)V
    :try_end_1f0
    .catch Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException; {:try_start_1e7 .. :try_end_1f0} :catch_8d
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_1e7 .. :try_end_1f0} :catch_1e2
    .catch Ljava/io/IOException; {:try_start_1e7 .. :try_end_1f0} :catch_1f1
    .catch Ljava/lang/RuntimeException; {:try_start_1e7 .. :try_end_1f0} :catch_1f6

    goto :goto_1d9

    .line 242
    .end local v9    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v16    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v17    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .end local v18    # "timeout":I
    :catch_1f1
    move-exception v10

    .line 243
    .local v10, "ex":Ljava/io/IOException;
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 244
    throw v10

    .line 245
    .end local v10    # "ex":Ljava/io/IOException;
    :catch_1f6
    move-exception v10

    .line 246
    .local v10, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 247
    throw v10
.end method
