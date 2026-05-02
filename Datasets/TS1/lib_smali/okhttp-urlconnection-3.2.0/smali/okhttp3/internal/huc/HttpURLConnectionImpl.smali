.class public Lokhttp3/internal/huc/HttpURLConnectionImpl;
.super Ljava/net/HttpURLConnection;
.source "HttpURLConnectionImpl.java"


# static fields
.field private static final EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

.field private static final METHODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field client:Lokhttp3/OkHttpClient;

.field private fixedContentLength:J

.field private followUpCount:I

.field handshake:Lokhttp3/Handshake;

.field protected httpEngine:Lokhttp3/internal/http/HttpEngine;

.field protected httpEngineFailure:Ljava/io/IOException;

.field private requestHeaders:Lokhttp3/Headers$Builder;

.field private responseHeaders:Lokhttp3/Headers;

.field private route:Lokhttp3/Route;

.field private urlFilter:Lokhttp3/internal/URLFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 83
    new-instance v0, Ljava/util/LinkedHashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "OPTIONS"

    aput-object v2, v1, v4

    const/4 v2, 0x1

    const-string v3, "GET"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "HEAD"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "POST"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "PUT"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "DELETE"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "TRACE"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "PATCH"

    aput-object v3, v1, v2

    .line 84
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    .line 85
    const/4 v0, 0x0

    new-array v1, v4, [B

    invoke-static {v0, v1}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;[B)Lokhttp3/RequestBody;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lokhttp3/OkHttpClient;)V
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "client"    # Lokhttp3/OkHttpClient;

    .prologue
    .line 114
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 89
    new-instance v0, Lokhttp3/Headers$Builder;

    invoke-direct {v0}, Lokhttp3/Headers$Builder;-><init>()V

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    .line 92
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 115
    iput-object p2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 116
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lokhttp3/OkHttpClient;Lokhttp3/internal/URLFilter;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "client"    # Lokhttp3/OkHttpClient;
    .param p3, "urlFilter"    # Lokhttp3/internal/URLFilter;

    .prologue
    .line 119
    invoke-direct {p0, p1, p2}, Lokhttp3/internal/huc/HttpURLConnectionImpl;-><init>(Ljava/net/URL;Lokhttp3/OkHttpClient;)V

    .line 120
    iput-object p3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->urlFilter:Lokhttp3/internal/URLFilter;

    .line 121
    return-void
.end method

.method private defaultUserAgent()Ljava/lang/String;
    .registers 3

    .prologue
    .line 401
    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 402
    .local v0, "agent":Ljava/lang/String;
    if-eqz v0, :cond_d

    invoke-static {v0}, Lokhttp3/internal/Util;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    invoke-static {}, Lokhttp3/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method private execute(Z)Z
    .registers 11
    .param p1, "readResponse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 466
    const/4 v2, 0x1

    .line 467
    .local v2, "releaseConnection":Z
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->urlFilter:Lokhttp3/internal/URLFilter;

    if-eqz v7, :cond_19

    .line 468
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->urlFilter:Lokhttp3/internal/URLFilter;

    iget-object v8, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v8}, Lokhttp3/internal/http/HttpEngine;->getRequest()Lokhttp3/Request;

    move-result-object v8

    invoke-virtual {v8}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v8

    invoke-virtual {v8}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v8

    invoke-interface {v7, v8}, Lokhttp3/internal/URLFilter;->checkURLPermitted(Ljava/net/URL;)V

    .line 471
    :cond_19
    :try_start_19
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->sendRequest()V

    .line 472
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->getConnection()Lokhttp3/Connection;

    move-result-object v0

    .line 473
    .local v0, "connection":Lokhttp3/Connection;
    if-eqz v0, :cond_47

    .line 474
    invoke-interface {v0}, Lokhttp3/Connection;->route()Lokhttp3/Route;

    move-result-object v7

    iput-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    .line 475
    invoke-interface {v0}, Lokhttp3/Connection;->handshake()Lokhttp3/Handshake;

    move-result-object v7

    iput-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->handshake:Lokhttp3/Handshake;

    .line 480
    :goto_32
    if-eqz p1, :cond_39

    .line 481
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->readResponse()V
    :try_end_39
    .catch Lokhttp3/internal/http/RequestException; {:try_start_19 .. :try_end_39} :catch_4e
    .catch Lokhttp3/internal/http/RouteException; {:try_start_19 .. :try_end_39} :catch_63
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_39} :catch_86
    .catchall {:try_start_19 .. :try_end_39} :catchall_56

    .line 483
    :cond_39
    const/4 v2, 0x0

    .line 485
    const/4 v6, 0x1

    .line 518
    if-eqz v2, :cond_46

    .line 519
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v4

    .line 520
    .local v4, "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lokhttp3/internal/http/StreamAllocation;->release()V

    .line 521
    .end local v0    # "connection":Lokhttp3/Connection;
    .end local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    :cond_46
    :goto_46
    return v6

    .line 477
    .restart local v0    # "connection":Lokhttp3/Connection;
    :cond_47
    const/4 v7, 0x0

    :try_start_48
    iput-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    .line 478
    const/4 v7, 0x0

    iput-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->handshake:Lokhttp3/Handshake;
    :try_end_4d
    .catch Lokhttp3/internal/http/RequestException; {:try_start_48 .. :try_end_4d} :catch_4e
    .catch Lokhttp3/internal/http/RouteException; {:try_start_48 .. :try_end_4d} :catch_63
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4d} :catch_86
    .catchall {:try_start_48 .. :try_end_4d} :catchall_56

    goto :goto_32

    .line 486
    .end local v0    # "connection":Lokhttp3/Connection;
    :catch_4e
    move-exception v1

    .line 488
    .local v1, "e":Lokhttp3/internal/http/RequestException;
    :try_start_4f
    invoke-virtual {v1}, Lokhttp3/internal/http/RequestException;->getCause()Ljava/io/IOException;

    move-result-object v5

    .line 489
    .local v5, "toThrow":Ljava/io/IOException;
    iput-object v5, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 490
    throw v5
    :try_end_56
    .catchall {:try_start_4f .. :try_end_56} :catchall_56

    .line 518
    .end local v1    # "e":Lokhttp3/internal/http/RequestException;
    .end local v5    # "toThrow":Ljava/io/IOException;
    :catchall_56
    move-exception v6

    if-eqz v2, :cond_62

    .line 519
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v4

    .line 520
    .restart local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lokhttp3/internal/http/StreamAllocation;->release()V

    .line 521
    .end local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    :cond_62
    throw v6

    .line 491
    :catch_63
    move-exception v1

    .line 493
    .local v1, "e":Lokhttp3/internal/http/RouteException;
    :try_start_64
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v8

    invoke-virtual {v7, v8}, Lokhttp3/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v3

    .line 494
    .local v3, "retryEngine":Lokhttp3/internal/http/HttpEngine;
    if-eqz v3, :cond_7f

    .line 495
    const/4 v2, 0x0

    .line 496
    iput-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_73
    .catchall {:try_start_64 .. :try_end_73} :catchall_56

    .line 518
    if-eqz v2, :cond_46

    .line 519
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v4

    .line 520
    .restart local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lokhttp3/internal/http/StreamAllocation;->release()V

    goto :goto_46

    .line 501
    .end local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    :cond_7f
    :try_start_7f
    invoke-virtual {v1}, Lokhttp3/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v5

    .line 502
    .restart local v5    # "toThrow":Ljava/io/IOException;
    iput-object v5, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 503
    throw v5

    .line 504
    .end local v1    # "e":Lokhttp3/internal/http/RouteException;
    .end local v3    # "retryEngine":Lokhttp3/internal/http/HttpEngine;
    .end local v5    # "toThrow":Ljava/io/IOException;
    :catch_86
    move-exception v1

    .line 506
    .local v1, "e":Ljava/io/IOException;
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7, v1}, Lokhttp3/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v3

    .line 507
    .restart local v3    # "retryEngine":Lokhttp3/internal/http/HttpEngine;
    if-eqz v3, :cond_9e

    .line 508
    const/4 v2, 0x0

    .line 509
    iput-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_92
    .catchall {:try_start_7f .. :try_end_92} :catchall_56

    .line 518
    if-eqz v2, :cond_46

    .line 519
    iget-object v7, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v7}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v4

    .line 520
    .restart local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lokhttp3/internal/http/StreamAllocation;->release()V

    goto :goto_46

    .line 514
    .end local v4    # "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    :cond_9e
    :try_start_9e
    iput-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 515
    throw v1
    :try_end_a1
    .catchall {:try_start_9e .. :try_end_a1} :catchall_56
.end method

.method private getHeaders()Lokhttp3/Headers;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    if-nez v2, :cond_32

    .line 163
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    .line 164
    .local v1, "response":Lokhttp3/Response;
    invoke-virtual {v1}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v0

    .line 165
    .local v0, "headers":Lokhttp3/Headers;
    invoke-virtual {v0}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object v2

    sget-object v3, Lokhttp3/internal/http/OkHeaders;->SELECTED_PROTOCOL:Ljava/lang/String;

    .line 166
    invoke-virtual {v1}, Lokhttp3/Response;->protocol()Lokhttp3/Protocol;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v2

    sget-object v3, Lokhttp3/internal/http/OkHeaders;->RESPONSE_SOURCE:Ljava/lang/String;

    .line 167
    invoke-static {v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseSourceHeader(Lokhttp3/Response;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    move-result-object v2

    .line 168
    invoke-virtual {v2}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v2

    iput-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    .line 170
    .end local v0    # "headers":Lokhttp3/Headers;
    .end local v1    # "response":Lokhttp3/Response;
    :cond_32
    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lokhttp3/Headers;

    return-object v2
.end method

.method private getResponse()Lokhttp3/internal/http/HttpEngine;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 412
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->hasResponse()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 413
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    .line 426
    :goto_d
    return-object v4

    .line 417
    :cond_e
    :goto_e
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 421
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v2

    .line 422
    .local v2, "response":Lokhttp3/Response;
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->followUpRequest()Lokhttp3/Request;

    move-result-object v0

    .line 424
    .local v0, "followUp":Lokhttp3/Request;
    if-nez v0, :cond_2b

    .line 425
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->releaseStreamAllocation()V

    .line 426
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    goto :goto_d

    .line 429
    :cond_2b
    iget v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    const/16 v5, 0x14

    if-le v4, v5, :cond_50

    .line 430
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many follow-up requests: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 434
    :cond_50
    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v4

    iput-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    .line 435
    invoke-virtual {v0}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/Headers;->newBuilder()Lokhttp3/Headers$Builder;

    move-result-object v4

    iput-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    .line 440
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v1

    .line 441
    .local v1, "requestBody":Lokio/Sink;
    invoke-virtual {v0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_77

    .line 442
    const/4 v1, 0x0

    .line 445
    :cond_77
    if-eqz v1, :cond_87

    instance-of v4, v1, Lokhttp3/internal/http/RetryableSink;

    if-nez v4, :cond_87

    .line 446
    new-instance v4, Ljava/net/HttpRetryException;

    const-string v5, "Cannot retry streamed HTTP body"

    iget v6, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->responseCode:I

    invoke-direct {v4, v5, v6}, Ljava/net/HttpRetryException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 449
    :cond_87
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v4}, Lokhttp3/internal/http/HttpEngine;->close()Lokhttp3/internal/http/StreamAllocation;

    move-result-object v3

    .line 450
    .local v3, "streamAllocation":Lokhttp3/internal/http/StreamAllocation;
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/internal/http/HttpEngine;->sameConnection(Lokhttp3/HttpUrl;)Z

    move-result v4

    if-nez v4, :cond_9d

    .line 451
    invoke-virtual {v3}, Lokhttp3/internal/http/StreamAllocation;->release()V

    .line 452
    const/4 v3, 0x0

    .line 455
    :cond_9d
    invoke-virtual {v0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object v4

    check-cast v1, Lokhttp3/internal/http/RetryableSink;

    .end local v1    # "requestBody":Lokio/Sink;
    invoke-direct {p0, v4, v3, v1, v2}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v4

    iput-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    goto/16 :goto_e
.end method

.method private initHttpEngine()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    if-eqz v1, :cond_7

    .line 325
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    throw v1

    .line 326
    :cond_7
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    if-eqz v1, :cond_c

    .line 346
    :goto_b
    return-void

    .line 330
    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    .line 332
    :try_start_f
    iget-boolean v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->doOutput:Z

    if-eqz v1, :cond_21

    .line 333
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 335
    const-string v1, "POST"

    iput-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 341
    :cond_21
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v3, v4}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;

    move-result-object v1

    iput-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_2c} :catch_2d

    goto :goto_b

    .line 342
    :catch_2d
    move-exception v0

    .line 343
    .local v0, "e":Ljava/io/IOException;
    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 344
    throw v0

    .line 336
    .end local v0    # "e":Ljava/io/IOException;
    :cond_31
    :try_start_31
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-static {v1}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 337
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not support writing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_54} :catch_2d
.end method

.method private newHttpEngine(Ljava/lang/String;Lokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)Lokhttp3/internal/http/HttpEngine;
    .registers 22
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "streamAllocation"    # Lokhttp3/internal/http/StreamAllocation;
    .param p3, "requestBody"    # Lokhttp3/internal/http/RetryableSink;
    .param p4, "priorResponse"    # Lokhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 352
    invoke-static/range {p1 .. p1}, Lokhttp3/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_42

    sget-object v14, Lokhttp3/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lokhttp3/RequestBody;

    .line 355
    .local v14, "placeholderBody":Lokhttp3/RequestBody;
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v16

    .line 356
    .local v16, "url":Ljava/net/URL;
    sget-object v1, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lokhttp3/internal/Internal;->getHttpUrlChecked(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v12

    .line 357
    .local v12, "httpUrl":Lokhttp3/HttpUrl;
    new-instance v1, Lokhttp3/Request$Builder;

    invoke-direct {v1}, Lokhttp3/Request$Builder;-><init>()V

    .line 358
    invoke-virtual {v1, v12}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v1

    .line 359
    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v14}, Lokhttp3/Request$Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v10

    .line 360
    .local v10, "builder":Lokhttp3/Request$Builder;
    move-object/from16 v0, p0

    iget-object v1, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v1}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v11

    .line 361
    .local v11, "headers":Lokhttp3/Headers;
    const/4 v13, 0x0

    .local v13, "i":I
    invoke-virtual {v11}, Lokhttp3/Headers;->size()I

    move-result v15

    .local v15, "size":I
    :goto_32
    if-ge v13, v15, :cond_44

    .line 362
    invoke-virtual {v11, v13}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v13}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 361
    add-int/lit8 v13, v13, 0x1

    goto :goto_32

    .line 352
    .end local v10    # "builder":Lokhttp3/Request$Builder;
    .end local v11    # "headers":Lokhttp3/Headers;
    .end local v12    # "httpUrl":Lokhttp3/HttpUrl;
    .end local v13    # "i":I
    .end local v14    # "placeholderBody":Lokhttp3/RequestBody;
    .end local v15    # "size":I
    .end local v16    # "url":Ljava/net/URL;
    :cond_42
    const/4 v14, 0x0

    goto :goto_8

    .line 365
    .restart local v10    # "builder":Lokhttp3/Request$Builder;
    .restart local v11    # "headers":Lokhttp3/Headers;
    .restart local v12    # "httpUrl":Lokhttp3/HttpUrl;
    .restart local v13    # "i":I
    .restart local v14    # "placeholderBody":Lokhttp3/RequestBody;
    .restart local v15    # "size":I
    .restart local v16    # "url":Ljava/net/URL;
    :cond_44
    const/4 v4, 0x0

    .line 366
    .local v4, "bufferRequestBody":Z
    invoke-static/range {p1 .. p1}, Lokhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_71

    .line 368
    move-object/from16 v0, p0

    iget-wide v5, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    const-wide/16 v7, -0x1

    cmp-long v1, v5, v7

    if-eqz v1, :cond_b7

    .line 369
    const-string v1, "Content-Length"

    move-object/from16 v0, p0

    iget-wide v5, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 377
    :goto_62
    const-string v1, "Content-Type"

    invoke-virtual {v11, v1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_71

    .line 378
    const-string v1, "Content-Type"

    const-string v5, "application/x-www-form-urlencoded"

    invoke-virtual {v10, v1, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 382
    :cond_71
    const-string v1, "User-Agent"

    invoke-virtual {v11, v1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_82

    .line 383
    const-string v1, "User-Agent"

    invoke-direct/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->defaultUserAgent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 386
    :cond_82
    invoke-virtual {v10}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    .line 389
    .local v3, "request":Lokhttp3/Request;
    move-object/from16 v0, p0

    iget-object v2, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 390
    .local v2, "engineClient":Lokhttp3/OkHttpClient;
    sget-object v1, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    invoke-virtual {v1, v2}, Lokhttp3/internal/Internal;->internalCache(Lokhttp3/OkHttpClient;)Lokhttp3/internal/InternalCache;

    move-result-object v1

    if-eqz v1, :cond_a9

    invoke-virtual/range {p0 .. p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getUseCaches()Z

    move-result v1

    if-nez v1, :cond_a9

    .line 391
    move-object/from16 v0, p0

    iget-object v1, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v1}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    const/4 v5, 0x0

    .line 392
    invoke-virtual {v1, v5}, Lokhttp3/OkHttpClient$Builder;->cache(Lokhttp3/Cache;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 393
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v2

    .line 396
    :cond_a9
    new-instance v1, Lokhttp3/internal/http/HttpEngine;

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    invoke-direct/range {v1 .. v9}, Lokhttp3/internal/http/HttpEngine;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;ZZZLokhttp3/internal/http/StreamAllocation;Lokhttp3/internal/http/RetryableSink;Lokhttp3/Response;)V

    return-object v1

    .line 370
    .end local v2    # "engineClient":Lokhttp3/OkHttpClient;
    .end local v3    # "request":Lokhttp3/Request;
    :cond_b7
    move-object/from16 v0, p0

    iget v1, v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v1, :cond_c5

    .line 371
    const-string v1, "Transfer-Encoding"

    const-string v5, "chunked"

    invoke-virtual {v10, v1, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_62

    .line 373
    :cond_c5
    const/4 v4, 0x1

    goto :goto_62
.end method

.method private static responseSourceHeader(Lokhttp3/Response;)Ljava/lang/String;
    .registers 3
    .param p0, "response"    # Lokhttp3/Response;

    .prologue
    .line 174
    invoke-virtual {p0}, Lokhttp3/Response;->networkResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_27

    .line 175
    invoke-virtual {p0}, Lokhttp3/Response;->cacheResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_f

    .line 176
    const-string v0, "NONE"

    .line 183
    :goto_e
    return-object v0

    .line 178
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 180
    :cond_27
    invoke-virtual {p0}, Lokhttp3/Response;->cacheResponse()Lokhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_45

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NETWORK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 183
    :cond_45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CONDITIONAL_CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lokhttp3/Response;->networkResponse()Lokhttp3/Response;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method private setProtocols(Ljava/lang/String;Z)V
    .registers 10
    .param p1, "protocolsString"    # Ljava/lang/String;
    .param p2, "append"    # Z

    .prologue
    .line 618
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 619
    .local v2, "protocolsList":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Protocol;>;"
    if-eqz p2, :cond_10

    .line 620
    iget-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v3}, Lokhttp3/OkHttpClient;->protocols()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 622
    :cond_10
    const-string v3, ","

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_19
    if-ge v3, v5, :cond_2e

    aget-object v1, v4, v3

    .line 624
    .local v1, "protocol":Ljava/lang/String;
    :try_start_1d
    invoke-static {v1}, Lokhttp3/Protocol;->get(Ljava/lang/String;)Lokhttp3/Protocol;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_24} :catch_27

    .line 622
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 625
    :catch_27
    move-exception v0

    .line 626
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 629
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "protocol":Ljava/lang/String;
    :cond_2e
    iget-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v3}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v3

    .line 630
    invoke-virtual {v3, v2}, Lokhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v3

    .line 631
    invoke-virtual {v3}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v3

    iput-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 632
    return-void
.end method


# virtual methods
.method public final addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 587
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 588
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot add request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 590
    :cond_c
    if-nez p1, :cond_16

    .line 591
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 593
    :cond_16
    if-nez p2, :cond_39

    .line 599
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring header "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " because its value was null."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/internal/Platform;->logW(Ljava/lang/String;)V

    .line 609
    :goto_38
    return-void

    .line 604
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 605
    :cond_49
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 607
    :cond_4e
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_38
.end method

.method public final connect()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 127
    :cond_3
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v0

    .line 128
    .local v0, "success":Z
    if-eqz v0, :cond_3

    .line 129
    return-void
.end method

.method public final disconnect()V
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    if-nez v0, :cond_5

    .line 142
    :goto_4
    return-void

    .line 135
    :cond_5
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->cancel()V

    goto :goto_4
.end method

.method public getConnectTimeout()I
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->connectTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public final getErrorStream()Ljava/io/InputStream;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 150
    :try_start_1
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v1

    .line 151
    .local v1, "response":Lokhttp3/internal/http/HttpEngine;
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v3

    invoke-static {v3}, Lokhttp3/internal/http/HttpEngine;->hasBody(Lokhttp3/Response;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 152
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Response;->code()I

    move-result v3

    const/16 v4, 0x190

    if-lt v3, v4, :cond_27

    .line 153
    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_26} :catch_28

    move-result-object v2

    .line 157
    .end local v1    # "response":Lokhttp3/internal/http/HttpEngine;
    :cond_27
    :goto_27
    return-object v2

    .line 156
    :catch_28
    move-exception v0

    .line 157
    .local v0, "e":Ljava/io/IOException;
    goto :goto_27
.end method

.method public final getHeaderField(I)Ljava/lang/String;
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 192
    :try_start_1
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    .line 193
    .local v1, "headers":Lokhttp3/Headers;
    if-ltz p1, :cond_d

    invoke-virtual {v1}, Lokhttp3/Headers;->size()I

    move-result v3

    if-lt p1, v3, :cond_e

    .line 196
    .end local v1    # "headers":Lokhttp3/Headers;
    :cond_d
    :goto_d
    return-object v2

    .line 194
    .restart local v1    # "headers":Lokhttp3/Headers;
    :cond_e
    invoke-virtual {v1, p1}, Lokhttp3/Headers;->value(I)Ljava/lang/String;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v2

    goto :goto_d

    .line 195
    .end local v1    # "headers":Lokhttp3/Headers;
    :catch_13
    move-exception v0

    .line 196
    .local v0, "e":Ljava/io/IOException;
    goto :goto_d
.end method

.method public final getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 206
    if-nez p1, :cond_13

    .line 207
    :try_start_2
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    invoke-static {v1}, Lokhttp3/internal/http/StatusLine;->get(Lokhttp3/Response;)Lokhttp3/internal/http/StatusLine;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v1

    .line 210
    :goto_12
    return-object v1

    .line 208
    :cond_13
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1a} :catch_1c

    move-result-object v1

    goto :goto_12

    .line 209
    :catch_1c
    move-exception v0

    .line 210
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public final getHeaderFieldKey(I)Ljava/lang/String;
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 216
    :try_start_1
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    .line 217
    .local v1, "headers":Lokhttp3/Headers;
    if-ltz p1, :cond_d

    invoke-virtual {v1}, Lokhttp3/Headers;->size()I

    move-result v3

    if-lt p1, v3, :cond_e

    .line 220
    .end local v1    # "headers":Lokhttp3/Headers;
    :cond_d
    :goto_d
    return-object v2

    .line 218
    .restart local v1    # "headers":Lokhttp3/Headers;
    :cond_e
    invoke-virtual {v1, p1}, Lokhttp3/Headers;->name(I)Ljava/lang/String;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v2

    goto :goto_d

    .line 219
    .end local v1    # "headers":Lokhttp3/Headers;
    :catch_13
    move-exception v0

    .line 220
    .local v0, "e":Ljava/io/IOException;
    goto :goto_d
.end method

.method public final getHeaderFields()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 226
    :try_start_0
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getHeaders()Lokhttp3/Headers;

    move-result-object v1

    .line 227
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v2

    invoke-static {v2}, Lokhttp3/internal/http/StatusLine;->get(Lokhttp3/Response;)Lokhttp3/internal/http/StatusLine;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v2

    .line 226
    invoke-static {v1, v2}, Lokhttp3/internal/JavaNetHeaders;->toMultimap(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/Map;
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v1

    .line 229
    :goto_18
    return-object v1

    .line 228
    :catch_19
    move-exception v0

    .line 229
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    goto :goto_18
.end method

.method public final getInputStream()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    iget-boolean v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->doInput:Z

    if-nez v1, :cond_c

    .line 244
    new-instance v1, Ljava/net/ProtocolException;

    const-string v2, "This protocol does not support input"

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 247
    :cond_c
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    .line 253
    .local v0, "response":Lokhttp3/internal/http/HttpEngine;
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponseCode()I

    move-result v1

    const/16 v2, 0x190

    if-lt v1, v2, :cond_24

    .line 254
    new-instance v1, Ljava/io/FileNotFoundException;

    iget-object v2, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 257
    :cond_24
    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method public getInstanceFollowRedirects()Z
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->followRedirects()Z

    move-result v0

    return v0
.end method

.method public final getOutputStream()Ljava/io/OutputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connect()V

    .line 263
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->getBufferedRequestBody()Lokio/BufferedSink;

    move-result-object v0

    .line 264
    .local v0, "sink":Lokio/BufferedSink;
    if-nez v0, :cond_26

    .line 265
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "method does not support a request body: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 266
    :cond_26
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->httpEngine:Lokhttp3/internal/http/HttpEngine;

    invoke-virtual {v1}, Lokhttp3/internal/http/HttpEngine;->hasResponse()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 267
    new-instance v1, Ljava/net/ProtocolException;

    const-string v2, "cannot write request body after response has been read"

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 270
    :cond_36
    invoke-interface {v0}, Lokio/BufferedSink;->outputStream()Ljava/io/OutputStream;

    move-result-object v1

    return-object v1
.end method

.method public final getPermission()Ljava/security/Permission;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v3

    .line 275
    .local v3, "url":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 276
    .local v1, "hostname":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/net/URL;->getPort()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4c

    .line 277
    invoke-virtual {v3}, Ljava/net/URL;->getPort()I

    move-result v0

    .line 279
    .local v0, "hostPort":I
    :goto_13
    invoke-virtual {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->usingProxy()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 280
    iget-object v4, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v4}, Lokhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    check-cast v2, Ljava/net/InetSocketAddress;

    .line 281
    .local v2, "proxyAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    .line 282
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    .line 284
    .end local v2    # "proxyAddress":Ljava/net/InetSocketAddress;
    :cond_2d
    new-instance v4, Ljava/net/SocketPermission;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "connect, resolve"

    invoke-direct {v4, v5, v6}, Ljava/net/SocketPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    .line 278
    .end local v0    # "hostPort":I
    :cond_4c
    invoke-virtual {v3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v0

    goto :goto_13
.end method

.method public getReadTimeout()I
    .registers 2

    .prologue
    .line 320
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->readTimeoutMillis()I

    move-result v0

    return v0
.end method

.method public final getRequestProperties()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 234
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 235
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access request header fields after connection is set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_c
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0}, Lokhttp3/Headers$Builder;->build()Lokhttp3/Headers;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lokhttp3/internal/JavaNetHeaders;->toMultimap(Lokhttp3/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 288
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 289
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1}, Lokhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public final getResponseCode()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 549
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->code()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    invoke-direct {p0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->getResponse()Lokhttp3/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/internal/http/HttpEngine;->getResponse()Lokhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 293
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    int-to-long v1, p1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 294
    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 295
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 296
    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .registers 4
    .param p1, "contentLength"    # I

    .prologue
    .line 642
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setFixedLengthStreamingMode(J)V

    .line 643
    return-void
.end method

.method public setFixedLengthStreamingMode(J)V
    .registers 5
    .param p1, "contentLength"    # J

    .prologue
    .line 646
    iget-boolean v0, p0, Ljava/net/HttpURLConnection;->connected:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 647
    :cond_c
    iget v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already in chunked mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 648
    :cond_18
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_26

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "contentLength < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 649
    :cond_26
    iput-wide p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 650
    const-wide/32 v0, 0x7fffffff

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Ljava/net/HttpURLConnection;->fixedContentLength:I

    .line 651
    return-void
.end method

.method public setIfModifiedSince(J)V
    .registers 8
    .param p1, "newValue"    # J

    .prologue
    .line 578
    invoke-super {p0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 579
    iget-wide v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1e

    .line 580
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    const-string v1, "If-Modified-Since"

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lokhttp3/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    .line 584
    :goto_1d
    return-void

    .line 582
    :cond_1e
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    const-string v1, "If-Modified-Since"

    invoke-virtual {v0, v1}, Lokhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_1d
.end method

.method public setInstanceFollowRedirects(Z)V
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 300
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 301
    invoke-virtual {v0, p1}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 302
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 303
    return-void
.end method

.method public setReadTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 314
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    int-to-long v1, p1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 315
    invoke-virtual {v0, v1, v2, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 316
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 317
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .registers 5
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .prologue
    .line 635
    sget-object v0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 636
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lokhttp3/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 638
    :cond_2d
    iput-object p1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 639
    return-void
.end method

.method public final setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 553
    iget-boolean v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 554
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 556
    :cond_c
    if-nez p1, :cond_16

    .line 557
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 559
    :cond_16
    if-nez p2, :cond_39

    .line 565
    invoke-static {}, Lokhttp3/internal/Platform;->get()Lokhttp3/internal/Platform;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring header "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " because its value was null."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/internal/Platform;->logW(Ljava/lang/String;)V

    .line 575
    :goto_38
    return-void

    .line 570
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 571
    :cond_49
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lokhttp3/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 573
    :cond_4e
    iget-object v0, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lokhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lokhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Headers$Builder;

    goto :goto_38
.end method

.method public final usingProxy()Z
    .registers 4

    .prologue
    .line 538
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->route:Lokhttp3/Route;

    .line 539
    invoke-virtual {v1}, Lokhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    .line 541
    .local v0, "proxy":Ljava/net/Proxy;
    :goto_a
    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v1, v2, :cond_1d

    const/4 v1, 0x1

    :goto_15
    return v1

    .line 539
    .end local v0    # "proxy":Ljava/net/Proxy;
    :cond_16
    iget-object v1, p0, Lokhttp3/internal/huc/HttpURLConnectionImpl;->client:Lokhttp3/OkHttpClient;

    .line 540
    invoke-virtual {v1}, Lokhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v0

    goto :goto_a

    .line 541
    .restart local v0    # "proxy":Ljava/net/Proxy;
    :cond_1d
    const/4 v1, 0x0

    goto :goto_15
.end method
