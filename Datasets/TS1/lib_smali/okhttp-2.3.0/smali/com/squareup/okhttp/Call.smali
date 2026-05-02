.class public Lcom/squareup/okhttp/Call;
.super Ljava/lang/Object;
.source "Call.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Call$ApplicationInterceptorChain;,
        Lcom/squareup/okhttp/Call$AsyncCall;
    }
.end annotation


# instance fields
.field volatile canceled:Z

.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field private executed:Z

.field originalRequest:Lcom/squareup/okhttp/Request;


# direct methods
.method protected constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V
    .registers 4
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "originalRequest"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->copyWithDefaults()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 49
    iput-object p2, p0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    .line 50
    return-void
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/Call;Z)Lcom/squareup/okhttp/Response;
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/Call;
    .param p1, "x1"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Call;->getResponseWithInterceptorChain(Z)Lcom/squareup/okhttp/Response;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/Call;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/squareup/okhttp/Call;->toLoggableString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    return-object v0
.end method

.method private getResponseWithInterceptorChain(Z)Lcom/squareup/okhttp/Response;
    .registers 5
    .param p1, "forWebSocket"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    new-instance v0, Lcom/squareup/okhttp/Call$ApplicationInterceptorChain;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/squareup/okhttp/Call$ApplicationInterceptorChain;-><init>(Lcom/squareup/okhttp/Call;ILcom/squareup/okhttp/Request;Z)V

    .line 199
    .local v0, "chain":Lcom/squareup/okhttp/Interceptor$Chain;
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v0, v1}, Lcom/squareup/okhttp/Interceptor$Chain;->proceed(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;

    move-result-object v1

    return-object v1
.end method

.method private toLoggableString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 188
    iget-boolean v3, p0, Lcom/squareup/okhttp/Call;->canceled:Z

    if-eqz v3, :cond_2f

    const-string v2, "canceled call"

    .line 190
    .local v2, "string":Ljava/lang/String;
    :goto_6
    :try_start_6
    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v4

    const-string v5, "/..."

    invoke-direct {v3, v4, v5}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "redactedUrl":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2d
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_2d} :catch_32

    move-result-object v2

    .line 193
    .end local v1    # "redactedUrl":Ljava/lang/String;
    .end local v2    # "string":Ljava/lang/String;
    :goto_2e
    return-object v2

    .line 188
    :cond_2f
    const-string v2, "call"

    goto :goto_6

    .line 192
    .restart local v2    # "string":Ljava/lang/String;
    :catch_32
    move-exception v0

    .line 193
    .local v0, "e":Ljava/net/MalformedURLException;
    goto :goto_2e
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 121
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/Call;->canceled:Z

    .line 122
    iget-object v0, p0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->disconnect()V

    .line 123
    :cond_c
    return-void
.end method

.method public enqueue(Lcom/squareup/okhttp/Callback;)V
    .registers 3
    .param p1, "responseCallback"    # Lcom/squareup/okhttp/Callback;

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/Call;->enqueue(Lcom/squareup/okhttp/Callback;Z)V

    .line 106
    return-void
.end method

.method enqueue(Lcom/squareup/okhttp/Callback;Z)V
    .registers 6
    .param p1, "responseCallback"    # Lcom/squareup/okhttp/Callback;
    .param p2, "forWebSocket"    # Z

    .prologue
    .line 109
    monitor-enter p0

    .line 110
    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/Call;->executed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already Executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0

    .line 111
    :cond_10
    const/4 v0, 0x1

    :try_start_11
    iput-boolean v0, p0, Lcom/squareup/okhttp/Call;->executed:Z

    .line 112
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_d

    .line 113
    iget-object v0, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v0

    new-instance v1, Lcom/squareup/okhttp/Call$AsyncCall;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Lcom/squareup/okhttp/Call$AsyncCall;-><init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;ZLcom/squareup/okhttp/Call$1;)V

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Dispatcher;->enqueue(Lcom/squareup/okhttp/Call$AsyncCall;)V

    .line 114
    return-void
.end method

.method public execute()Lcom/squareup/okhttp/Response;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    monitor-enter p0

    .line 74
    :try_start_1
    iget-boolean v1, p0, Lcom/squareup/okhttp/Call;->executed:Z

    if-eqz v1, :cond_10

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already Executed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    :catchall_d
    move-exception v1

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v1

    .line 75
    :cond_10
    const/4 v1, 0x1

    :try_start_11
    iput-boolean v1, p0, Lcom/squareup/okhttp/Call;->executed:Z

    .line 76
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_d

    .line 78
    :try_start_14
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/squareup/okhttp/Dispatcher;->executed(Lcom/squareup/okhttp/Call;)V

    .line 79
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/squareup/okhttp/Call;->getResponseWithInterceptorChain(Z)Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 80
    .local v0, "result":Lcom/squareup/okhttp/Response;
    if-nez v0, :cond_37

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Canceled"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2c
    .catchall {:try_start_14 .. :try_end_2c} :catchall_2c

    .line 83
    .end local v0    # "result":Lcom/squareup/okhttp/Response;
    :catchall_2c
    move-exception v1

    iget-object v2, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v2}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call;)V

    throw v1

    .restart local v0    # "result":Lcom/squareup/okhttp/Response;
    :cond_37
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call;)V

    return-object v0
.end method

.method getResponse(Lcom/squareup/okhttp/Request;Z)Lcom/squareup/okhttp/Response;
    .registers 24
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "forWebSocket"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    invoke-virtual/range {p1 .. p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v12

    .line 240
    .local v12, "body":Lcom/squareup/okhttp/RequestBody;
    if-eqz v12, :cond_3b

    .line 241
    invoke-virtual/range {p1 .. p1}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v19

    .line 243
    .local v19, "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    invoke-virtual {v12}, Lcom/squareup/okhttp/RequestBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v15

    .line 244
    .local v15, "contentType":Lcom/squareup/okhttp/MediaType;
    if-eqz v15, :cond_1b

    .line 245
    const-string v2, "Content-Type"

    invoke-virtual {v15}, Lcom/squareup/okhttp/MediaType;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 248
    :cond_1b
    invoke-virtual {v12}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v13

    .line 249
    .local v13, "contentLength":J
    const-wide/16 v2, -0x1

    cmp-long v2, v13, v2

    if-eqz v2, :cond_63

    .line 250
    const-string v2, "Content-Length"

    invoke-static {v13, v14}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 251
    const-string v2, "Transfer-Encoding"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 257
    :goto_37
    invoke-virtual/range {v19 .. v19}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object p1

    .line 261
    .end local v13    # "contentLength":J
    .end local v15    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v19    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    :cond_3b
    new-instance v2, Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v4, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v11}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZZZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 263
    const/16 v18, 0x0

    .line 265
    .local v18, "followUpCount":I
    :goto_54
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/squareup/okhttp/Call;->canceled:Z

    if-eqz v2, :cond_74

    .line 266
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 267
    const/4 v11, 0x0

    .line 291
    :cond_62
    :goto_62
    return-object v11

    .line 253
    .end local v18    # "followUpCount":I
    .restart local v13    # "contentLength":J
    .restart local v15    # "contentType":Lcom/squareup/okhttp/MediaType;
    .restart local v19    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    :cond_63
    const-string v2, "Transfer-Encoding"

    const-string v3, "chunked"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 254
    const-string v2, "Content-Length"

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_37

    .line 271
    .end local v13    # "contentLength":J
    .end local v15    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v19    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    .restart local v18    # "followUpCount":I
    :cond_74
    :try_start_74
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sendRequest()V

    .line 272
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readResponse()V
    :try_end_82
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_82} :catch_9e

    .line 284
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v11

    .line 285
    .local v11, "response":Lcom/squareup/okhttp/Response;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->followUpRequest()Lcom/squareup/okhttp/Request;

    move-result-object v17

    .line 287
    .local v17, "followUp":Lcom/squareup/okhttp/Request;
    if-nez v17, :cond_b4

    .line 288
    if-nez p2, :cond_62

    .line 289
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    goto :goto_62

    .line 273
    .end local v11    # "response":Lcom/squareup/okhttp/Response;
    .end local v17    # "followUp":Lcom/squareup/okhttp/Request;
    :catch_9e
    move-exception v16

    .line 274
    .local v16, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v2, v0, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v20

    .line 275
    .local v20, "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v20, :cond_b3

    .line 276
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto :goto_54

    .line 281
    :cond_b3
    throw v16

    .line 294
    .end local v16    # "e":Ljava/io/IOException;
    .end local v20    # "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    .restart local v11    # "response":Lcom/squareup/okhttp/Response;
    .restart local v17    # "followUp":Lcom/squareup/okhttp/Request;
    :cond_b4
    add-int/lit8 v18, v18, 0x1

    const/16 v2, 0x14

    move/from16 v0, v18

    if-le v0, v2, :cond_d7

    .line 295
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too many follow-up requests: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 298
    :cond_d7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual/range {v17 .. v17}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Ljava/net/URL;)Z

    move-result v2

    if-nez v2, :cond_ec

    .line 299
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 302
    :cond_ec
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/Connection;

    move-result-object v8

    .line 303
    .local v8, "connection":Lcom/squareup/okhttp/Connection;
    move-object/from16 p1, v17

    .line 304
    new-instance v2, Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v4, p1

    move/from16 v7, p2

    invoke-direct/range {v2 .. v11}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZZZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto/16 :goto_54
.end method

.method public isCanceled()Z
    .registers 2

    .prologue
    .line 126
    iget-boolean v0, p0, Lcom/squareup/okhttp/Call;->canceled:Z

    return v0
.end method

.method tag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->tag()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
