.class public Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;
.super Ljava/lang/Object;
.source "ProtocolExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/protocol/HttpProcessor;)V
    .registers 5
    .param p1, "requestExecutor"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "httpProcessor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 81
    const-string v0, "HTTP client request executor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    const-string v0, "HTTP protocol processor"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .line 84
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 85
    return-void
.end method


# virtual methods
.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 25
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
    .line 122
    const-string v17, "HTTP route"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 123
    const-string v17, "HTTP request"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 124
    const-string v17, "HTTP context"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v7

    .line 127
    .local v7, "original":Lcz/msebera/android/httpclient/HttpRequest;
    const/4 v12, 0x0

    .line 128
    .local v12, "uri":Ljava/net/URI;
    instance-of v0, v7, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    move/from16 v17, v0

    if-eqz v17, :cond_133

    .line 129
    check-cast v7, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .end local v7    # "original":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v7}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v12

    .line 142
    :cond_2c
    :goto_2c
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 145
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->rewriteRequestURI(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    .line 147
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v8

    .line 148
    .local v8, "params":Lcz/msebera/android/httpclient/params/HttpParams;
    const-string v17, "http.virtual-host"

    move-object/from16 v0, v17

    invoke-interface {v8, v0}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcz/msebera/android/httpclient/HttpHost;

    .line 150
    .local v15, "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    if-eqz v15, :cond_a3

    invoke-virtual {v15}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v17

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_a3

    .line 151
    invoke-virtual/range {p1 .. p1}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcz/msebera/android/httpclient/HttpHost;->getPort()I

    move-result v9

    .line 152
    .local v9, "port":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v9, v0, :cond_79

    .line 153
    new-instance v16, Lcz/msebera/android/httpclient/HttpHost;

    invoke-virtual {v15}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v17

    .line 154
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v9, v2}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v15    # "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    .local v16, "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    move-object/from16 v15, v16

    .line 156
    .end local v16    # "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v15    # "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    :cond_79
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_a3

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Using virtual host"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 161
    .end local v9    # "port":I
    :cond_a3
    const/4 v11, 0x0

    .line 162
    .local v11, "target":Lcz/msebera/android/httpclient/HttpHost;
    if-eqz v15, :cond_17e

    .line 163
    move-object v11, v15

    .line 169
    :cond_a7
    :goto_a7
    if-nez v11, :cond_ad

    .line 170
    invoke-virtual/range {p1 .. p1}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v11

    .line 174
    :cond_ad
    if-eqz v12, :cond_da

    .line 175
    invoke-virtual {v12}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v14

    .line 176
    .local v14, "userinfo":Ljava/lang/String;
    if-eqz v14, :cond_da

    .line 177
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-result-object v5

    .line 178
    .local v5, "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    if-nez v5, :cond_c5

    .line 179
    new-instance v5, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    .end local v5    # "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    invoke-direct {v5}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;-><init>()V

    .line 180
    .restart local v5    # "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setCredentialsProvider(Lcz/msebera/android/httpclient/client/CredentialsProvider;)V

    .line 182
    :cond_c5
    new-instance v17, Lcz/msebera/android/httpclient/auth/AuthScope;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Lcz/msebera/android/httpclient/auth/AuthScope;-><init>(Lcz/msebera/android/httpclient/HttpHost;)V

    new-instance v18, Lcz/msebera/android/httpclient/auth/UsernamePasswordCredentials;

    move-object/from16 v0, v18

    invoke-direct {v0, v14}, Lcz/msebera/android/httpclient/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v5, v0, v1}, Lcz/msebera/android/httpclient/client/CredentialsProvider;->setCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;Lcz/msebera/android/httpclient/auth/Credentials;)V

    .line 189
    .end local v5    # "credsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .end local v14    # "userinfo":Ljava/lang/String;
    :cond_da
    const-string v17, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v11}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    const-string v17, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 191
    const-string v17, "http.request"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    invoke-interface {v0, v1, v2, v3, v4}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v10

    .line 199
    .local v10, "response":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_11c
    const-string v17, "http.response"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v10}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->httpProcessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-interface {v0, v10, v1}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    :try_end_132
    .catch Ljava/lang/RuntimeException; {:try_start_11c .. :try_end_132} :catch_1a5
    .catch Ljava/io/IOException; {:try_start_11c .. :try_end_132} :catch_1aa
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_11c .. :try_end_132} :catch_1af

    .line 201
    return-object v10

    .line 131
    .end local v8    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    .end local v10    # "response":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v11    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .end local v15    # "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v7    # "original":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_133
    invoke-interface {v7}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v13

    .line 133
    .local v13, "uriString":Ljava/lang/String;
    :try_start_13b
    invoke-static {v13}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_13e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13b .. :try_end_13e} :catch_141

    move-result-object v12

    goto/16 :goto_2c

    .line 134
    :catch_141
    move-exception v6

    .line 135
    .local v6, "ex":Ljava/lang/IllegalArgumentException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_2c

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unable to parse \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "\' as a valid URI; "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "request URI and Host header may be inconsistent"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .line 165
    .end local v6    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v7    # "original":Lcz/msebera/android/httpclient/HttpRequest;
    .end local v13    # "uriString":Ljava/lang/String;
    .restart local v8    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    .restart local v11    # "target":Lcz/msebera/android/httpclient/HttpHost;
    .restart local v15    # "virtualHost":Lcz/msebera/android/httpclient/HttpHost;
    :cond_17e
    if-eqz v12, :cond_a7

    invoke-virtual {v12}, Ljava/net/URI;->isAbsolute()Z

    move-result v17

    if-eqz v17, :cond_a7

    invoke-virtual {v12}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_a7

    .line 166
    new-instance v11, Lcz/msebera/android/httpclient/HttpHost;

    .end local v11    # "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual {v12}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v12}, Ljava/net/URI;->getPort()I

    move-result v18

    invoke-virtual {v12}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v11, v0, v1, v2}, Lcz/msebera/android/httpclient/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v11    # "target":Lcz/msebera/android/httpclient/HttpHost;
    goto/16 :goto_a7

    .line 202
    .restart local v10    # "response":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :catch_1a5
    move-exception v6

    .line 203
    .local v6, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 204
    throw v6

    .line 205
    .end local v6    # "ex":Ljava/lang/RuntimeException;
    :catch_1aa
    move-exception v6

    .line 206
    .local v6, "ex":Ljava/io/IOException;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 207
    throw v6

    .line 208
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_1af
    move-exception v6

    .line 209
    .local v6, "ex":Lcz/msebera/android/httpclient/HttpException;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 210
    throw v6
.end method

.method rewriteRequestURI(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V
    .registers 9
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ProtocolException;
        }
    .end annotation

    .prologue
    .line 91
    :try_start_0
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v2

    .line 92
    .local v2, "uri":Ljava/net/URI;
    if-eqz v2, :cond_24

    .line 93
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v3

    if-eqz v3, :cond_2a

    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 95
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_25

    .line 96
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    .line 97
    .local v1, "target":Lcz/msebera/android/httpclient/HttpHost;
    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    .line 109
    .end local v1    # "target":Lcz/msebera/android/httpclient/HttpHost;
    :goto_21
    invoke-virtual {p1, v2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 114
    :cond_24
    return-void

    .line 99
    :cond_25
    invoke-static {v2}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    goto :goto_21

    .line 103
    :cond_2a
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-eqz v3, :cond_37

    .line 104
    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lcz/msebera/android/httpclient/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    goto :goto_21

    .line 106
    :cond_37
    invoke-static {v2}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_3a
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_3a} :catch_3c

    move-result-object v2

    goto :goto_21

    .line 111
    .end local v2    # "uri":Ljava/net/URI;
    :catch_3c
    move-exception v0

    .line 112
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v3, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid URI: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
