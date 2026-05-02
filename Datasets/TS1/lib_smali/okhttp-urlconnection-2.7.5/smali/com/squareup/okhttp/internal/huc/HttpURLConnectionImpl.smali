.class public Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;
.super Ljava/net/HttpURLConnection;
.source "HttpURLConnectionImpl.java"


# static fields
.field private static final EMPTY_REQUEST_BODY:Lcom/squareup/okhttp/RequestBody;

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
.field final client:Lcom/squareup/okhttp/OkHttpClient;

.field private fixedContentLength:J

.field private followUpCount:I

.field handshake:Lcom/squareup/okhttp/Handshake;

.field protected httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field protected httpEngineFailure:Ljava/io/IOException;

.field private requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

.field private responseHeaders:Lcom/squareup/okhttp/Headers;

.field private route:Lcom/squareup/okhttp/Route;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 82
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

    .line 83
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    .line 84
    const/4 v0, 0x0

    new-array v1, v4, [B

    invoke-static {v0, v1}, Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;[B)Lcom/squareup/okhttp/RequestBody;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lcom/squareup/okhttp/RequestBody;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 88
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    .line 91
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 112
    iput-object p2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 113
    return-void
.end method

.method private defaultUserAgent()Ljava/lang/String;
    .registers 3

    .prologue
    .line 382
    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "agent":Ljava/lang/String;
    if-eqz v0, :cond_d

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    invoke-static {}, Lcom/squareup/okhttp/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method private execute(Z)Z
    .registers 10
    .param p1, "readResponse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 448
    const/4 v2, 0x1

    .line 450
    .local v2, "releaseConnection":Z
    :try_start_2
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sendRequest()V

    .line 451
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    .line 452
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    if-eqz v0, :cond_30

    .line 453
    invoke-interface {v0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    .line 454
    invoke-interface {v0}, Lcom/squareup/okhttp/Connection;->getHandshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 459
    :goto_1b
    if-eqz p1, :cond_22

    .line 460
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readResponse()V
    :try_end_22
    .catch Lcom/squareup/okhttp/internal/http/RequestException; {:try_start_2 .. :try_end_22} :catch_37
    .catch Lcom/squareup/okhttp/internal/http/RouteException; {:try_start_2 .. :try_end_22} :catch_4c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_22} :catch_6b
    .catchall {:try_start_2 .. :try_end_22} :catchall_3f

    .line 462
    :cond_22
    const/4 v2, 0x0

    .line 464
    const/4 v6, 0x1

    .line 497
    if-eqz v2, :cond_2f

    .line 498
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/internal/http/StreamAllocation;

    move-result-object v4

    .line 499
    .local v4, "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release()V

    .line 500
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    .end local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    :cond_2f
    :goto_2f
    return v6

    .line 456
    .restart local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_30
    const/4 v7, 0x0

    :try_start_31
    iput-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    .line 457
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->handshake:Lcom/squareup/okhttp/Handshake;
    :try_end_36
    .catch Lcom/squareup/okhttp/internal/http/RequestException; {:try_start_31 .. :try_end_36} :catch_37
    .catch Lcom/squareup/okhttp/internal/http/RouteException; {:try_start_31 .. :try_end_36} :catch_4c
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_36} :catch_6b
    .catchall {:try_start_31 .. :try_end_36} :catchall_3f

    goto :goto_1b

    .line 465
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :catch_37
    move-exception v1

    .line 467
    .local v1, "e":Lcom/squareup/okhttp/internal/http/RequestException;
    :try_start_38
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/RequestException;->getCause()Ljava/io/IOException;

    move-result-object v5

    .line 468
    .local v5, "toThrow":Ljava/io/IOException;
    iput-object v5, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 469
    throw v5
    :try_end_3f
    .catchall {:try_start_38 .. :try_end_3f} :catchall_3f

    .line 497
    .end local v1    # "e":Lcom/squareup/okhttp/internal/http/RequestException;
    .end local v5    # "toThrow":Ljava/io/IOException;
    :catchall_3f
    move-exception v6

    if-eqz v2, :cond_4b

    .line 498
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/internal/http/StreamAllocation;

    move-result-object v4

    .line 499
    .restart local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release()V

    .line 500
    .end local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    :cond_4b
    throw v6

    .line 470
    :catch_4c
    move-exception v1

    .line 472
    .local v1, "e":Lcom/squareup/okhttp/internal/http/RouteException;
    :try_start_4d
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7, v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Lcom/squareup/okhttp/internal/http/RouteException;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v3

    .line 473
    .local v3, "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v3, :cond_64

    .line 474
    const/4 v2, 0x0

    .line 475
    iput-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;
    :try_end_58
    .catchall {:try_start_4d .. :try_end_58} :catchall_3f

    .line 497
    if-eqz v2, :cond_2f

    .line 498
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/internal/http/StreamAllocation;

    move-result-object v4

    .line 499
    .restart local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release()V

    goto :goto_2f

    .line 480
    .end local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    :cond_64
    :try_start_64
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/RouteException;->getLastConnectException()Ljava/io/IOException;

    move-result-object v5

    .line 481
    .restart local v5    # "toThrow":Ljava/io/IOException;
    iput-object v5, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 482
    throw v5

    .line 483
    .end local v1    # "e":Lcom/squareup/okhttp/internal/http/RouteException;
    .end local v3    # "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    .end local v5    # "toThrow":Ljava/io/IOException;
    :catch_6b
    move-exception v1

    .line 485
    .local v1, "e":Ljava/io/IOException;
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7, v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v3

    .line 486
    .restart local v3    # "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v3, :cond_83

    .line 487
    const/4 v2, 0x0

    .line 488
    iput-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;
    :try_end_77
    .catchall {:try_start_64 .. :try_end_77} :catchall_3f

    .line 497
    if-eqz v2, :cond_2f

    .line 498
    iget-object v7, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/internal/http/StreamAllocation;

    move-result-object v4

    .line 499
    .restart local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release()V

    goto :goto_2f

    .line 493
    .end local v4    # "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    :cond_83
    :try_start_83
    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 494
    throw v1
    :try_end_86
    .catchall {:try_start_83 .. :try_end_86} :catchall_3f
.end method

.method private getHeaders()Lcom/squareup/okhttp/Headers;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    if-nez v2, :cond_32

    .line 155
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    .line 156
    .local v1, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    .line 157
    .local v0, "headers":Lcom/squareup/okhttp/Headers;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    sget-object v3, Lcom/squareup/okhttp/internal/http/OkHeaders;->SELECTED_PROTOCOL:Ljava/lang/String;

    .line 158
    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->protocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    sget-object v3, Lcom/squareup/okhttp/internal/http/OkHeaders;->RESPONSE_SOURCE:Ljava/lang/String;

    .line 159
    invoke-static {v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseSourceHeader(Lcom/squareup/okhttp/Response;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    .line 160
    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    .line 162
    .end local v0    # "headers":Lcom/squareup/okhttp/Headers;
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :cond_32
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    return-object v2
.end method

.method private getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 394
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponse()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 395
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 408
    :goto_d
    return-object v4

    .line 399
    :cond_e
    :goto_e
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 403
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    .line 404
    .local v2, "response":Lcom/squareup/okhttp/Response;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->followUpRequest()Lcom/squareup/okhttp/Request;

    move-result-object v0

    .line 406
    .local v0, "followUp":Lcom/squareup/okhttp/Request;
    if-nez v0, :cond_2b

    .line 407
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseStreamAllocation()V

    .line 408
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto :goto_d

    .line 411
    :cond_2b
    iget v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    const/16 v5, 0x14

    if-le v4, v5, :cond_50

    .line 412
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many follow-up requests: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->followUpCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 416
    :cond_50
    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    .line 417
    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    .line 422
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v1

    .line 423
    .local v1, "requestBody":Lokio/Sink;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_73

    .line 424
    const/4 v1, 0x0

    .line 427
    :cond_73
    if-eqz v1, :cond_83

    instance-of v4, v1, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-nez v4, :cond_83

    .line 428
    new-instance v4, Ljava/net/HttpRetryException;

    const-string v5, "Cannot retry streamed HTTP body"

    iget v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseCode:I

    invoke-direct {v4, v5, v6}, Ljava/net/HttpRetryException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 431
    :cond_83
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/internal/http/StreamAllocation;

    move-result-object v3

    .line 432
    .local v3, "streamAllocation":Lcom/squareup/okhttp/internal/http/StreamAllocation;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Lcom/squareup/okhttp/HttpUrl;)Z

    move-result v4

    if-nez v4, :cond_99

    .line 433
    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/StreamAllocation;->release()V

    .line 434
    const/4 v3, 0x0

    .line 437
    :cond_99
    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v4

    check-cast v1, Lcom/squareup/okhttp/internal/http/RetryableSink;

    .end local v1    # "requestBody":Lokio/Sink;
    invoke-direct {p0, v4, v3, v1, v2}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/internal/http/StreamAllocation;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

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
    .line 307
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    if-eqz v1, :cond_7

    .line 308
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    throw v1

    .line 309
    :cond_7
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    if-eqz v1, :cond_c

    .line 329
    :goto_b
    return-void

    .line 313
    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    .line 315
    :try_start_f
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->doOutput:Z

    if-eqz v1, :cond_21

    .line 316
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 318
    const-string v1, "POST"

    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 324
    :cond_21
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/internal/http/StreamAllocation;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_2c} :catch_2d

    goto :goto_b

    .line 325
    :catch_2d
    move-exception v0

    .line 326
    .local v0, "e":Ljava/io/IOException;
    iput-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 327
    throw v0

    .line 319
    .end local v0    # "e":Ljava/io/IOException;
    :cond_31
    :try_start_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 320
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

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

.method private newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/internal/http/StreamAllocation;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 22
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "streamAllocation"    # Lcom/squareup/okhttp/internal/http/StreamAllocation;
    .param p3, "requestBody"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .param p4, "priorResponse"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 335
    invoke-static/range {p1 .. p1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_42

    sget-object v14, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->EMPTY_REQUEST_BODY:Lcom/squareup/okhttp/RequestBody;

    .line 338
    .local v14, "placeholderBody":Lcom/squareup/okhttp/RequestBody;
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v16

    .line 339
    .local v16, "url":Ljava/net/URL;
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual/range {v16 .. v16}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/squareup/okhttp/internal/Internal;->getHttpUrlChecked(Ljava/lang/String;)Lcom/squareup/okhttp/HttpUrl;

    move-result-object v12

    .line 340
    .local v12, "httpUrl":Lcom/squareup/okhttp/HttpUrl;
    new-instance v1, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v1}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    .line 341
    invoke-virtual {v1, v12}, Lcom/squareup/okhttp/Request$Builder;->url(Lcom/squareup/okhttp/HttpUrl;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 342
    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v14}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v10

    .line 343
    .local v10, "builder":Lcom/squareup/okhttp/Request$Builder;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v11

    .line 344
    .local v11, "headers":Lcom/squareup/okhttp/Headers;
    const/4 v13, 0x0

    .local v13, "i":I
    invoke-virtual {v11}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v15

    .local v15, "size":I
    :goto_32
    if-ge v13, v15, :cond_44

    .line 345
    invoke-virtual {v11, v13}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v13}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lcom/squareup/okhttp/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 344
    add-int/lit8 v13, v13, 0x1

    goto :goto_32

    .line 335
    .end local v10    # "builder":Lcom/squareup/okhttp/Request$Builder;
    .end local v11    # "headers":Lcom/squareup/okhttp/Headers;
    .end local v12    # "httpUrl":Lcom/squareup/okhttp/HttpUrl;
    .end local v13    # "i":I
    .end local v14    # "placeholderBody":Lcom/squareup/okhttp/RequestBody;
    .end local v15    # "size":I
    .end local v16    # "url":Ljava/net/URL;
    :cond_42
    const/4 v14, 0x0

    goto :goto_8

    .line 348
    .restart local v10    # "builder":Lcom/squareup/okhttp/Request$Builder;
    .restart local v11    # "headers":Lcom/squareup/okhttp/Headers;
    .restart local v12    # "httpUrl":Lcom/squareup/okhttp/HttpUrl;
    .restart local v13    # "i":I
    .restart local v14    # "placeholderBody":Lcom/squareup/okhttp/RequestBody;
    .restart local v15    # "size":I
    .restart local v16    # "url":Ljava/net/URL;
    :cond_44
    const/4 v4, 0x0

    .line 349
    .local v4, "bufferRequestBody":Z
    invoke-static/range {p1 .. p1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_71

    .line 351
    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    const-wide/16 v7, -0x1

    cmp-long v1, v5, v7

    if-eqz v1, :cond_b3

    .line 352
    const-string v1, "Content-Length"

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 360
    :goto_62
    const-string v1, "Content-Type"

    invoke-virtual {v11, v1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_71

    .line 361
    const-string v1, "Content-Type"

    const-string v5, "application/x-www-form-urlencoded"

    invoke-virtual {v10, v1, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 365
    :cond_71
    const-string v1, "User-Agent"

    invoke-virtual {v11, v1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_82

    .line 366
    const-string v1, "User-Agent"

    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->defaultUserAgent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v1, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 369
    :cond_82
    invoke-virtual {v10}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v3

    .line 372
    .local v3, "request":Lcom/squareup/okhttp/Request;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 373
    .local v2, "engineClient":Lcom/squareup/okhttp/OkHttpClient;
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v1

    if-eqz v1, :cond_a5

    invoke-virtual/range {p0 .. p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getUseCaches()Z

    move-result v1

    if-nez v1, :cond_a5

    .line 374
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->clone()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v1

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Lcom/squareup/okhttp/OkHttpClient;->setCache(Lcom/squareup/okhttp/Cache;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v2

    .line 377
    :cond_a5
    new-instance v1, Lcom/squareup/okhttp/internal/http/HttpEngine;

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    invoke-direct/range {v1 .. v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZZZLcom/squareup/okhttp/internal/http/StreamAllocation;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    return-object v1

    .line 353
    .end local v2    # "engineClient":Lcom/squareup/okhttp/OkHttpClient;
    .end local v3    # "request":Lcom/squareup/okhttp/Request;
    :cond_b3
    move-object/from16 v0, p0

    iget v1, v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v1, :cond_c1

    .line 354
    const-string v1, "Transfer-Encoding"

    const-string v5, "chunked"

    invoke-virtual {v10, v1, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_62

    .line 356
    :cond_c1
    const/4 v4, 0x1

    goto :goto_62
.end method

.method private static responseSourceHeader(Lcom/squareup/okhttp/Response;)Ljava/lang/String;
    .registers 3
    .param p0, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->networkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_27

    .line 167
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_f

    .line 168
    const-string v0, "NONE"

    .line 175
    :goto_e
    return-object v0

    .line 170
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 172
    :cond_27
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_45

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NETWORK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 175
    :cond_45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CONDITIONAL_CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->networkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->code()I

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
    .line 596
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 597
    .local v2, "protocolsList":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    if-eqz p2, :cond_10

    .line 598
    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getProtocols()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 600
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

    .line 602
    .local v1, "protocol":Ljava/lang/String;
    :try_start_1d
    invoke-static {v1}, Lcom/squareup/okhttp/Protocol;->get(Ljava/lang/String;)Lcom/squareup/okhttp/Protocol;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_24} :catch_27

    .line 600
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 603
    :catch_27
    move-exception v0

    .line 604
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 607
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "protocol":Ljava/lang/String;
    :cond_2e
    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v3, v2}, Lcom/squareup/okhttp/OkHttpClient;->setProtocols(Ljava/util/List;)Lcom/squareup/okhttp/OkHttpClient;

    .line 608
    return-void
.end method


# virtual methods
.method public final addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 565
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 566
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot add request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 568
    :cond_c
    if-nez p1, :cond_16

    .line 569
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 571
    :cond_16
    if-nez p2, :cond_39

    .line 577
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

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

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 587
    :goto_38
    return-void

    .line 582
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 583
    :cond_49
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 585
    :cond_4e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

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
    .line 116
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 119
    :cond_3
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v0

    .line 120
    .local v0, "success":Z
    if-eqz v0, :cond_3

    .line 121
    return-void
.end method

.method public final disconnect()V
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    if-nez v0, :cond_5

    .line 134
    :goto_4
    return-void

    .line 127
    :cond_5
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->cancel()V

    goto :goto_4
.end method

.method public getConnectTimeout()I
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getConnectTimeout()I

    move-result v0

    return v0
.end method

.method public final getErrorStream()Ljava/io/InputStream;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 142
    :try_start_1
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    .line 143
    .local v1, "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasBody(Lcom/squareup/okhttp/Response;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 144
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->code()I

    move-result v3

    const/16 v4, 0x190

    if-lt v3, v4, :cond_27

    .line 145
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_26} :catch_28

    move-result-object v2

    .line 149
    .end local v1    # "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    :cond_27
    :goto_27
    return-object v2

    .line 148
    :catch_28
    move-exception v0

    .line 149
    .local v0, "e":Ljava/io/IOException;
    goto :goto_27
.end method

.method public final getHeaderField(I)Ljava/lang/String;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 184
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 186
    :goto_8
    return-object v1

    .line 185
    :catch_9
    move-exception v0

    .line 186
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public final getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 197
    if-nez p1, :cond_13

    .line 198
    :try_start_2
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/StatusLine;->get(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v1

    .line 201
    :goto_12
    return-object v1

    .line 199
    :cond_13
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1a} :catch_1c

    move-result-object v1

    goto :goto_12

    .line 200
    :catch_1c
    move-exception v0

    .line 201
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public final getHeaderFieldKey(I)Ljava/lang/String;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 207
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 209
    :goto_8
    return-object v1

    .line 208
    :catch_9
    move-exception v0

    .line 209
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_8
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
    .line 215
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    .line 216
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/StatusLine;->get(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v2

    .line 215
    invoke-static {v1, v2}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v1

    .line 218
    :goto_18
    return-object v1

    .line 217
    :catch_19
    move-exception v0

    .line 218
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
    .line 232
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->doInput:Z

    if-nez v1, :cond_c

    .line 233
    new-instance v1, Ljava/net/ProtocolException;

    const-string v2, "This protocol does not support input"

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :cond_c
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    .line 242
    .local v0, "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponseCode()I

    move-result v1

    const/16 v2, 0x190

    if-lt v1, v2, :cond_24

    .line 243
    new-instance v1, Ljava/io/FileNotFoundException;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 246
    :cond_24
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method public getInstanceFollowRedirects()Z
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getFollowRedirects()Z

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
    .line 250
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connect()V

    .line 252
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getBufferedRequestBody()Lokio/BufferedSink;

    move-result-object v0

    .line 253
    .local v0, "sink":Lokio/BufferedSink;
    if-nez v0, :cond_26

    .line 254
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "method does not support a request body: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 255
    :cond_26
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponse()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 256
    new-instance v1, Ljava/net/ProtocolException;

    const-string v2, "cannot write request body after response has been read"

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 259
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
    .line 263
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v3

    .line 264
    .local v3, "url":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "hostName":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/net/URL;->getPort()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_4c

    .line 266
    invoke-virtual {v3}, Ljava/net/URL;->getPort()I

    move-result v1

    .line 268
    .local v1, "hostPort":I
    :goto_13
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->usingProxy()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 269
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v4}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    check-cast v2, Ljava/net/InetSocketAddress;

    .line 270
    .local v2, "proxyAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 271
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    .line 273
    .end local v2    # "proxyAddress":Ljava/net/InetSocketAddress;
    :cond_2d
    new-instance v4, Ljava/net/SocketPermission;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "connect, resolve"

    invoke-direct {v4, v5, v6}, Ljava/net/SocketPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    .line 267
    .end local v1    # "hostPort":I
    :cond_4c
    invoke-virtual {v3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/squareup/okhttp/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v1

    goto :goto_13
.end method

.method public getReadTimeout()I
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

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
    .line 223
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 224
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access request header fields after connection is set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 277
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 278
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

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
    .line 527
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->code()I

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
    .line 523
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->message()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 282
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    int-to-long v1, p1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lcom/squareup/okhttp/OkHttpClient;->setConnectTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 283
    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .registers 4
    .param p1, "contentLength"    # I

    .prologue
    .line 618
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setFixedLengthStreamingMode(J)V

    .line 619
    return-void
.end method

.method public setFixedLengthStreamingMode(J)V
    .registers 5
    .param p1, "contentLength"    # J

    .prologue
    .line 622
    iget-boolean v0, p0, Ljava/net/HttpURLConnection;->connected:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 623
    :cond_c
    iget v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already in chunked mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 624
    :cond_18
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_26

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "contentLength < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 625
    :cond_26
    iput-wide p1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 626
    const-wide/32 v0, 0x7fffffff

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Ljava/net/HttpURLConnection;->fixedContentLength:I

    .line 627
    return-void
.end method

.method public setIfModifiedSince(J)V
    .registers 8
    .param p1, "newValue"    # J

    .prologue
    .line 556
    invoke-super {p0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 557
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1e

    .line 558
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    const-string v1, "If-Modified-Since"

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 562
    :goto_1d
    return-void

    .line 560
    :cond_1e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    const-string v1, "If-Modified-Since"

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_1d
.end method

.method public setInstanceFollowRedirects(Z)V
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 287
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/OkHttpClient;->setFollowRedirects(Z)V

    .line 288
    return-void
.end method

.method public setReadTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 299
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    int-to-long v1, p1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lcom/squareup/okhttp/OkHttpClient;->setReadTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 300
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
    .line 611
    sget-object v0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 612
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->METHODS:Ljava/util/Set;

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

    .line 614
    :cond_2d
    iput-object p1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 615
    return-void
.end method

.method public final setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 531
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 532
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 534
    :cond_c
    if-nez p1, :cond_16

    .line 535
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 537
    :cond_16
    if-nez p2, :cond_39

    .line 543
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

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

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 553
    :goto_38
    return-void

    .line 548
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 549
    :cond_49
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 551
    :cond_4e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_38
.end method

.method public final usingProxy()Z
    .registers 4

    .prologue
    .line 516
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    .line 517
    invoke-virtual {v1}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    .line 519
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

    .line 517
    .end local v0    # "proxy":Ljava/net/Proxy;
    :cond_16
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 518
    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    goto :goto_a

    .line 519
    .restart local v0    # "proxy":Ljava/net/Proxy;
    :cond_1d
    const/4 v1, 0x0

    goto :goto_15
.end method
