.class public final Lcom/squareup/okhttp/internal/http/HttpEngine;
.super Ljava/lang/Object;
.source "HttpEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
    }
.end annotation


# static fields
.field private static final EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;

.field public static final MAX_FOLLOW_UPS:I = 0x14


# instance fields
.field public final bufferRequestBody:Z

.field private bufferedRequestBody:Lokio/BufferedSink;

.field private cacheResponse:Lcom/squareup/okhttp/Response;

.field private cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

.field private final callerWritesRequestBody:Z

.field final client:Lcom/squareup/okhttp/OkHttpClient;

.field private connection:Lcom/squareup/okhttp/Connection;

.field private final forWebSocket:Z

.field private networkRequest:Lcom/squareup/okhttp/Request;

.field private final priorResponse:Lcom/squareup/okhttp/Response;

.field private requestBodyOut:Lokio/Sink;

.field private route:Lcom/squareup/okhttp/Route;

.field private routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

.field sentRequestMillis:J

.field private storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

.field private transparentGzip:Z

.field private transport:Lcom/squareup/okhttp/internal/http/Transport;

.field private final userRequest:Lcom/squareup/okhttp/Request;

.field private userResponse:Lcom/squareup/okhttp/Response;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 97
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpEngine$1;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine$1;-><init>()V

    sput-object v0, Lcom/squareup/okhttp/internal/http/HttpEngine;->EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;

    return-void
.end method

.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZZZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V
    .registers 12
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "request"    # Lcom/squareup/okhttp/Request;
    .param p3, "bufferRequestBody"    # Z
    .param p4, "callerWritesRequestBody"    # Z
    .param p5, "forWebSocket"    # Z
    .param p6, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p7, "routeSelector"    # Lcom/squareup/okhttp/internal/http/RouteSelector;
    .param p8, "requestBodyOut"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .param p9, "priorResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    .line 185
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 186
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 187
    iput-boolean p3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    .line 188
    iput-boolean p4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->callerWritesRequestBody:Z

    .line 189
    iput-boolean p5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->forWebSocket:Z

    .line 190
    iput-object p6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 191
    iput-object p7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 192
    iput-object p8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    .line 193
    iput-object p9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 195
    if-eqz p6, :cond_27

    .line 196
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p6, p0}, Lcom/squareup/okhttp/internal/Internal;->setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V

    .line 197
    invoke-virtual {p6}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    .line 201
    :goto_26
    return-void

    .line 199
    :cond_27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    goto :goto_26
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readNetworkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    return-object v0
.end method

.method private cacheWritingResponse(Lcom/squareup/okhttp/internal/http/CacheRequest;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 11
    .param p1, "cacheRequest"    # Lcom/squareup/okhttp/internal/http/CacheRequest;
    .param p2, "response"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 816
    if-nez p1, :cond_3

    .line 867
    .end local p2    # "response":Lcom/squareup/okhttp/Response;
    :cond_2
    :goto_2
    return-object p2

    .line 817
    .restart local p2    # "response":Lcom/squareup/okhttp/Response;
    :cond_3
    invoke-interface {p1}, Lcom/squareup/okhttp/internal/http/CacheRequest;->body()Lokio/Sink;

    move-result-object v1

    .line 818
    .local v1, "cacheBodyUnbuffered":Lokio/Sink;
    if-eqz v1, :cond_2

    .line 820
    invoke-virtual {p2}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v3

    .line 821
    .local v3, "source":Lokio/BufferedSource;
    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v0

    .line 823
    .local v0, "cacheBody":Lokio/BufferedSink;
    new-instance v2, Lcom/squareup/okhttp/internal/http/HttpEngine$2;

    invoke-direct {v2, p0, v3, p1, v0}, Lcom/squareup/okhttp/internal/http/HttpEngine$2;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lokio/BufferedSource;Lcom/squareup/okhttp/internal/http/CacheRequest;Lokio/BufferedSink;)V

    .line 865
    .local v2, "cacheWritingSource":Lokio/Source;
    invoke-virtual {p2}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    new-instance v5, Lcom/squareup/okhttp/internal/http/RealResponseBody;

    .line 866
    invoke-virtual {p2}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v6

    invoke-static {v2}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/squareup/okhttp/internal/http/RealResponseBody;-><init>(Lcom/squareup/okhttp/Headers;Lokio/BufferedSource;)V

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    .line 867
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object p2

    goto :goto_2
.end method

.method private static combine(Lcom/squareup/okhttp/Headers;Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Headers;
    .registers 8
    .param p0, "cachedHeaders"    # Lcom/squareup/okhttp/Headers;
    .param p1, "networkHeaders"    # Lcom/squareup/okhttp/Headers;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 899
    new-instance v2, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v2}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 901
    .local v2, "result":Lcom/squareup/okhttp/Headers$Builder;
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    .local v3, "size":I
    :goto_a
    if-ge v1, v3, :cond_37

    .line 902
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 903
    .local v0, "fieldName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    .line 904
    .local v4, "value":Ljava/lang/String;
    const-string v5, "Warning"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_27

    const-string v5, "1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 901
    :cond_24
    :goto_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 907
    :cond_27
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_24

    .line 908
    :cond_33
    invoke-virtual {v2, v0, v4}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_24

    .line 912
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_37
    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    :goto_3c
    if-ge v1, v3, :cond_5b

    .line 913
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 914
    .restart local v0    # "fieldName":Ljava/lang/String;
    const-string v5, "Content-Length"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 912
    :cond_4a
    :goto_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 917
    :cond_4d
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4a

    .line 918
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v0, v5}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_4a

    .line 922
    .end local v0    # "fieldName":Ljava/lang/String;
    :cond_5b
    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v5

    return-object v5
.end method

.method private connect(Lcom/squareup/okhttp/Request;)V
    .registers 3
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 308
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-nez v0, :cond_16

    .line 309
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-static {p1, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->get(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/http/RouteSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 312
    :cond_16
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v0, p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->next(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 313
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    .line 314
    return-void
.end method

.method public static hasBody(Lcom/squareup/okhttp/Response;)Z
    .registers 8
    .param p0, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 552
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v3

    const-string v4, "HEAD"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 571
    :cond_12
    :goto_12
    return v1

    .line 556
    :cond_13
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v0

    .line 557
    .local v0, "responseCode":I
    const/16 v3, 0x64

    if-lt v0, v3, :cond_1f

    const/16 v3, 0xc8

    if-lt v0, v3, :cond_29

    :cond_1f
    const/16 v3, 0xcc

    if-eq v0, v3, :cond_29

    const/16 v3, 0x130

    if-eq v0, v3, :cond_29

    move v1, v2

    .line 560
    goto :goto_12

    .line 566
    :cond_29
    invoke-static {p0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v3

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_41

    const-string v3, "chunked"

    const-string v4, "Transfer-Encoding"

    .line 567
    invoke-virtual {p0, v4}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    :cond_41
    move v1, v2

    .line 568
    goto :goto_12
.end method

.method public static hostHeader(Ljava/net/URL;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 618
    invoke-static {p0}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v0

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->getDefaultPort(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_2e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 619
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 620
    :goto_2d
    return-object v0

    :cond_2e
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_2d
.end method

.method private isRecoverable(Ljava/io/IOException;)Z
    .registers 4
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v0, 0x0

    .line 395
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getRetryOnConnectionFailure()Z

    move-result v1

    if-nez v1, :cond_a

    .line 416
    :cond_9
    :goto_9
    return v0

    .line 401
    :cond_a
    instance-of v1, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-nez v1, :cond_9

    instance-of v1, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v1, :cond_1a

    .line 402
    invoke-virtual {p1}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/security/cert/CertificateException;

    if-nez v1, :cond_9

    .line 407
    :cond_1a
    instance-of v1, p1, Ljava/net/ProtocolException;

    if-nez v1, :cond_9

    .line 412
    instance-of v1, p1, Ljava/io/InterruptedIOException;

    if-nez v1, :cond_9

    .line 416
    const/4 v0, 0x1

    goto :goto_9
.end method

.method private maybeCache()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    .line 429
    .local v0, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    if-nez v0, :cond_b

    .line 445
    :cond_a
    :goto_a
    return-void

    .line 432
    :cond_b
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-static {v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;->isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z

    move-result v1

    if-nez v1, :cond_29

    .line 433
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 435
    :try_start_21
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v0, v1}, Lcom/squareup/okhttp/internal/InternalCache;->remove(Lcom/squareup/okhttp/Request;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_26} :catch_27

    goto :goto_a

    .line 436
    :catch_27
    move-exception v1

    goto :goto_a

    .line 444
    :cond_29
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/squareup/okhttp/internal/InternalCache;->put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    goto :goto_a
.end method

.method private networkRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;
    .registers 8
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 581
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    .line 583
    .local v3, "result":Lcom/squareup/okhttp/Request$Builder;
    const-string v4, "Host"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_19

    .line 584
    const-string v4, "Host"

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v5

    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hostHeader(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 587
    :cond_19
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v4, :cond_27

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Connection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v4

    sget-object v5, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-eq v4, v5, :cond_36

    :cond_27
    const-string v4, "Connection"

    .line 588
    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_36

    .line 589
    const-string v4, "Connection"

    const-string v5, "Keep-Alive"

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 592
    :cond_36
    const-string v4, "Accept-Encoding"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_48

    .line 593
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transparentGzip:Z

    .line 594
    const-string v4, "Accept-Encoding"

    const-string v5, "gzip"

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 597
    :cond_48
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v4}, Lcom/squareup/okhttp/OkHttpClient;->getCookieHandler()Ljava/net/CookieHandler;

    move-result-object v0

    .line 598
    .local v0, "cookieHandler":Ljava/net/CookieHandler;
    if-eqz v0, :cond_68

    .line 602
    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 604
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Ljava/net/CookieHandler;->get(Ljava/net/URI;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 607
    .local v1, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-static {v3, v1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->addCookies(Lcom/squareup/okhttp/Request$Builder;Ljava/util/Map;)V

    .line 610
    .end local v1    # "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_68
    const-string v4, "User-Agent"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_79

    .line 611
    const-string v4, "User-Agent"

    invoke-static {}, Lcom/squareup/okhttp/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 614
    :cond_79
    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v4

    return-object v4
.end method

.method private readNetworkResponse()Lcom/squareup/okhttp/Response;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 789
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v1}, Lcom/squareup/okhttp/internal/http/Transport;->finishRequest()V

    .line 791
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v1}, Lcom/squareup/okhttp/internal/http/Transport;->readResponseHeaders()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 792
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 793
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getHandshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Response$Builder;->handshake(Lcom/squareup/okhttp/Handshake;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    sget-object v2, Lcom/squareup/okhttp/internal/http/OkHeaders;->SENT_MILLIS:Ljava/lang/String;

    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    .line 794
    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    sget-object v2, Lcom/squareup/okhttp/internal/http/OkHeaders;->RECEIVED_MILLIS:Ljava/lang/String;

    .line 795
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    .line 796
    invoke-virtual {v1}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 798
    .local v0, "networkResponse":Lcom/squareup/okhttp/Response;
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->forWebSocket:Z

    if-nez v1, :cond_4f

    .line 799
    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    .line 800
    invoke-interface {v2, v0}, Lcom/squareup/okhttp/internal/http/Transport;->openResponseBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v1

    .line 801
    invoke-virtual {v1}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 804
    :cond_4f
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->protocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/internal/Internal;->setProtocol(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/Protocol;)V

    .line 805
    return-object v0
.end method

.method private static stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 3
    .param p0, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 299
    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 300
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object p0

    .end local p0    # "response":Lcom/squareup/okhttp/Response;
    :cond_15
    return-object p0
.end method

.method private unzip(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 7
    .param p1, "response"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 527
    iget-boolean v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transparentGzip:Z

    if-eqz v2, :cond_14

    const-string v2, "gzip"

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    const-string v4, "Content-Encoding"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 543
    .end local p1    # "response":Lcom/squareup/okhttp/Response;
    :cond_14
    :goto_14
    return-object p1

    .line 531
    .restart local p1    # "response":Lcom/squareup/okhttp/Response;
    :cond_15
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    if-eqz v2, :cond_14

    .line 535
    new-instance v0, Lokio/GzipSource;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v2

    invoke-direct {v0, v2}, Lokio/GzipSource;-><init>(Lokio/Source;)V

    .line 536
    .local v0, "responseBody":Lokio/GzipSource;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    const-string v3, "Content-Encoding"

    .line 537
    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    const-string v3, "Content-Length"

    .line 538
    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    .line 539
    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    .line 540
    .local v1, "strippedHeaders":Lcom/squareup/okhttp/Headers;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v2

    .line 541
    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v2

    new-instance v3, Lcom/squareup/okhttp/internal/http/RealResponseBody;

    .line 542
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/squareup/okhttp/internal/http/RealResponseBody;-><init>(Lcom/squareup/okhttp/Headers;Lokio/BufferedSource;)V

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v2

    .line 543
    invoke-virtual {v2}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object p1

    goto :goto_14
.end method

.method private static validate(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)Z
    .registers 9
    .param p0, "cached"    # Lcom/squareup/okhttp/Response;
    .param p1, "network"    # Lcom/squareup/okhttp/Response;

    .prologue
    const/4 v2, 0x1

    .line 875
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->code()I

    move-result v3

    const/16 v4, 0x130

    if-ne v3, v4, :cond_a

    .line 891
    :cond_9
    :goto_9
    return v2

    .line 882
    :cond_a
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    const-string v4, "Last-Modified"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->getDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 883
    .local v0, "lastModified":Ljava/util/Date;
    if-eqz v0, :cond_2e

    .line 884
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    const-string v4, "Last-Modified"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->getDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 885
    .local v1, "networkLastModified":Ljava/util/Date;
    if-eqz v1, :cond_2e

    .line 886
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_9

    .line 891
    .end local v1    # "networkLastModified":Ljava/util/Date;
    :cond_2e
    const/4 v2, 0x0

    goto :goto_9
.end method


# virtual methods
.method public close()Lcom/squareup/okhttp/Connection;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 479
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v2, :cond_1f

    .line 481
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 487
    :cond_a
    :goto_a
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v2, :cond_29

    .line 488
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_1b

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 489
    :cond_1b
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    move-object v0, v1

    .line 510
    :goto_1e
    return-object v0

    .line 482
    :cond_1f
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-eqz v2, :cond_a

    .line 483
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_a

    .line 494
    :cond_29
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 497
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v2}, Lcom/squareup/okhttp/internal/http/Transport;->canReuseConnection()Z

    move-result v2

    if-nez v2, :cond_4f

    .line 498
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 499
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    move-object v0, v1

    .line 500
    goto :goto_1e

    .line 504
    :cond_4f
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_5f

    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Internal;->clearOwner(Lcom/squareup/okhttp/Connection;)Z

    move-result v2

    if-nez v2, :cond_5f

    .line 505
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 508
    :cond_5f
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 509
    .local v0, "result":Lcom/squareup/okhttp/Connection;
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    goto :goto_1e
.end method

.method public disconnect()V
    .registers 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v0, :cond_9

    .line 468
    :try_start_4
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v0, p0}, Lcom/squareup/okhttp/internal/http/Transport;->disconnect(Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_a

    .line 472
    :cond_9
    :goto_9
    return-void

    .line 469
    :catch_a
    move-exception v0

    goto :goto_9
.end method

.method public followUpRequest()Lcom/squareup/okhttp/Request;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 938
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v7, :cond_b

    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 939
    :cond_b
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    if-eqz v7, :cond_23

    .line 940
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    .line 942
    .local v4, "selectedProxy":Ljava/net/Proxy;
    :goto_19
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->code()I

    move-result v2

    .line 944
    .local v2, "responseCode":I
    sparse-switch v2, :sswitch_data_f0

    .line 998
    :cond_22
    :goto_22
    return-object v6

    .line 940
    .end local v2    # "responseCode":I
    .end local v4    # "selectedProxy":Ljava/net/Proxy;
    :cond_23
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 941
    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    goto :goto_19

    .line 946
    .restart local v2    # "responseCode":I
    .restart local v4    # "selectedProxy":Ljava/net/Proxy;
    :sswitch_2a
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v6

    sget-object v7, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-eq v6, v7, :cond_3a

    .line 947
    new-instance v6, Ljava/net/ProtocolException;

    const-string v7, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    invoke-direct {v6, v7}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 951
    :cond_3a
    :sswitch_3a
    iget-object v6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v6}, Lcom/squareup/okhttp/OkHttpClient;->getAuthenticator()Lcom/squareup/okhttp/Authenticator;

    move-result-object v6

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v6, v7, v4}, Lcom/squareup/okhttp/internal/http/OkHeaders;->processAuthHeader(Lcom/squareup/okhttp/Authenticator;Lcom/squareup/okhttp/Response;Ljava/net/Proxy;)Lcom/squareup/okhttp/Request;

    move-result-object v6

    goto :goto_22

    .line 957
    :sswitch_47
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    const-string v8, "GET"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_63

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    const-string v8, "HEAD"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 966
    :cond_63
    :sswitch_63
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getFollowRedirects()Z

    move-result v7

    if-eqz v7, :cond_22

    .line 968
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    const-string v8, "Location"

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 969
    .local v0, "location":Ljava/lang/String;
    if-eqz v0, :cond_22

    .line 970
    new-instance v5, Ljava/net/URL;

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v7

    invoke-direct {v5, v7, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 973
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    const-string v8, "https"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_98

    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    const-string v8, "http"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 976
    :cond_98
    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 977
    .local v3, "sameProtocol":Z
    if-nez v3, :cond_b4

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getFollowSslRedirects()Z

    move-result v7

    if-eqz v7, :cond_22

    .line 980
    :cond_b4
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 981
    .local v1, "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_da

    .line 982
    const-string v7, "GET"

    invoke-virtual {v1, v7, v6}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    .line 983
    const-string v6, "Transfer-Encoding"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 984
    const-string v6, "Content-Length"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 985
    const-string v6, "Content-Type"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 991
    :cond_da
    invoke-virtual {p0, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Ljava/net/URL;)Z

    move-result v6

    if-nez v6, :cond_e5

    .line 992
    const-string v6, "Authorization"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 995
    :cond_e5
    invoke-virtual {v1, v5}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/net/URL;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v6

    goto/16 :goto_22

    .line 944
    nop

    :sswitch_data_f0
    .sparse-switch
        0x12c -> :sswitch_63
        0x12d -> :sswitch_63
        0x12e -> :sswitch_63
        0x12f -> :sswitch_63
        0x133 -> :sswitch_47
        0x134 -> :sswitch_47
        0x191 -> :sswitch_3a
        0x197 -> :sswitch_2a
    .end sparse-switch
.end method

.method public getBufferedRequestBody()Lokio/BufferedSink;
    .registers 4

    .prologue
    .line 336
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    .line 337
    .local v1, "result":Lokio/BufferedSink;
    if-eqz v1, :cond_5

    .line 340
    .end local v1    # "result":Lokio/BufferedSink;
    :goto_4
    return-object v1

    .line 338
    .restart local v1    # "result":Lokio/BufferedSink;
    :cond_5
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v0

    .line 339
    .local v0, "requestBody":Lokio/Sink;
    if-eqz v0, :cond_13

    .line 340
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    :goto_11
    move-object v1, v2

    goto :goto_4

    :cond_13
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public getConnection()Lcom/squareup/okhttp/Connection;
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    return-object v0
.end method

.method public getRequest()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method public getRequestBody()Lokio/Sink;
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 332
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    return-object v0
.end method

.method public getResponse()Lcom/squareup/okhttp/Response;
    .registers 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 356
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public getRoute()Lcom/squareup/okhttp/Route;
    .registers 2

    .prologue
    .line 424
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method public hasResponse()Z
    .registers 2

    .prologue
    .line 345
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method permitsRequestBody()Z
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public readResponse()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, -0x1

    .line 628
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-eqz v4, :cond_7

    .line 719
    :cond_6
    :goto_6
    return-void

    .line 631
    :cond_7
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-nez v4, :cond_17

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-nez v4, :cond_17

    .line 632
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "call sendRequest() first!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 634
    :cond_17
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v4, :cond_6

    .line 640
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->forWebSocket:Z

    if-eqz v4, :cond_a7

    .line 641
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v4, v5}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 642
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readNetworkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    .line 681
    .local v2, "networkResponse":Lcom/squareup/okhttp/Response;
    :goto_2a
    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 684
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-eqz v4, :cond_140

    .line 685
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4, v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->validate(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)Z

    move-result v4

    if-eqz v4, :cond_137

    .line 686
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 687
    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 688
    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 689
    invoke-virtual {v5}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v5

    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/http/HttpEngine;->combine(Lcom/squareup/okhttp/Headers;Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Headers;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 690
    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    .line 691
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->networkResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    .line 692
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 693
    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/ResponseBody;->close()V

    .line 694
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 698
    sget-object v4, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v3

    .line 699
    .local v3, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    invoke-interface {v3}, Lcom/squareup/okhttp/internal/InternalCache;->trackConditionalCacheHit()V

    .line 700
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lcom/squareup/okhttp/internal/InternalCache;->update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V

    .line 701
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-direct {p0, v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->unzip(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    goto/16 :goto_6

    .line 644
    .end local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    .end local v3    # "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    :cond_a7
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->callerWritesRequestBody:Z

    if-nez v4, :cond_bb

    .line 645
    new-instance v4, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {v4, p0, v5, v6}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;ILcom/squareup/okhttp/Request;)V

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->proceed(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;

    move-result-object v2

    .restart local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    goto/16 :goto_2a

    .line 649
    .end local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    :cond_bb
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v4, :cond_d4

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->buffer()Lokio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Lokio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_d4

    .line 650
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->emit()Lokio/BufferedSink;

    .line 654
    :cond_d4
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    cmp-long v4, v4, v8

    if-nez v4, :cond_10f

    .line 655
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Request;)J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-nez v4, :cond_108

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    instance-of v4, v4, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v4, :cond_108

    .line 657
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    check-cast v4, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/RetryableSink;->contentLength()J

    move-result-wide v0

    .line 658
    .local v0, "contentLength":J
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v4

    const-string v5, "Content-Length"

    .line 659
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v4

    .line 660
    invoke-virtual {v4}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 662
    .end local v0    # "contentLength":J
    :cond_108
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v4, v5}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 666
    :cond_10f
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-eqz v4, :cond_12b

    .line 667
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v4, :cond_131

    .line 669
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->close()V

    .line 673
    :goto_11c
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    instance-of v4, v4, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v4, :cond_12b

    .line 674
    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    check-cast v4, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-interface {v5, v4}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestBody(Lcom/squareup/okhttp/internal/http/RetryableSink;)V

    .line 678
    :cond_12b
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readNetworkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    .restart local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    goto/16 :goto_2a

    .line 671
    .end local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    :cond_131
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-interface {v4}, Lokio/Sink;->close()V

    goto :goto_11c

    .line 704
    .restart local v2    # "networkResponse":Lcom/squareup/okhttp/Response;
    :cond_137
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v4

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 708
    :cond_140
    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 709
    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 710
    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 711
    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    .line 712
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response$Builder;->networkResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v4

    .line 713
    invoke-virtual {v4}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 715
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasBody(Lcom/squareup/okhttp/Response;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 716
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->maybeCache()V

    .line 717
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-direct {p0, v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheWritingResponse(Lcom/squareup/okhttp/internal/http/CacheRequest;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->unzip(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    goto/16 :goto_6
.end method

.method public receiveHeaders(Lcom/squareup/okhttp/Headers;)V
    .registers 5
    .param p1, "headers"    # Lcom/squareup/okhttp/Headers;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 926
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getCookieHandler()Ljava/net/CookieHandler;

    move-result-object v0

    .line 927
    .local v0, "cookieHandler":Ljava/net/CookieHandler;
    if-eqz v0, :cond_16

    .line 928
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/net/CookieHandler;->put(Ljava/net/URI;Ljava/util/Map;)V

    .line 930
    :cond_16
    return-void
.end method

.method public recover(Ljava/io/IOException;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 3
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 390
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    return-object v0
.end method

.method public recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 14
    .param p1, "e"    # Ljava/io/IOException;
    .param p2, "requestBodyOut"    # Lokio/Sink;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_f

    .line 371
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0, v1, p1}, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectFailed(Lcom/squareup/okhttp/Connection;Ljava/io/IOException;)V

    .line 374
    :cond_f
    if-eqz p2, :cond_15

    instance-of v0, p2, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v0, :cond_34

    :cond_15
    const/4 v10, 0x1

    .line 375
    .local v10, "canRetryRequestBody":Z
    :goto_16
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_32

    :cond_1e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 376
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 377
    :cond_2a
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->isRecoverable(Ljava/io/IOException;)Z

    move-result v0

    if-eqz v0, :cond_32

    if-nez v10, :cond_36

    .line 379
    :cond_32
    const/4 v0, 0x0

    .line 385
    :goto_33
    return-object v0

    .line 374
    .end local v10    # "canRetryRequestBody":Z
    :cond_34
    const/4 v10, 0x0

    goto :goto_16

    .line 382
    .restart local v10    # "canRetryRequestBody":Z
    :cond_36
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/Connection;

    move-result-object v6

    .line 385
    .local v6, "connection":Lcom/squareup/okhttp/Connection;
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->callerWritesRequestBody:Z

    iget-boolean v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->forWebSocket:Z

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    move-object v8, p2

    check-cast v8, Lcom/squareup/okhttp/internal/http/RetryableSink;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-direct/range {v0 .. v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZZZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    goto :goto_33
.end method

.method public releaseConnection()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 453
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_d

    .line 454
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v0}, Lcom/squareup/okhttp/internal/http/Transport;->releaseConnectionOnIdle()V

    .line 456
    :cond_d
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 457
    return-void
.end method

.method public sameConnection(Ljava/net/URL;)Z
    .registers 5
    .param p1, "followUp"    # Ljava/net/URL;

    .prologue
    .line 1007
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v0

    .line 1008
    .local v0, "url":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 1009
    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v1

    invoke-static {p1}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v2

    if-ne v1, v2, :cond_2e

    .line 1010
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    const/4 v1, 0x1

    :goto_2d
    return v1

    :cond_2e
    const/4 v1, 0x0

    goto :goto_2d
.end method

.method public sendRequest()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 209
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    if-eqz v8, :cond_6

    .line 296
    :cond_5
    :goto_5
    return-void

    .line 210
    :cond_6
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v8, :cond_10

    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 212
    :cond_10
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {p0, v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;

    move-result-object v5

    .line 214
    .local v5, "request":Lcom/squareup/okhttp/Request;
    sget-object v8, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v8, v9}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v6

    .line 215
    .local v6, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    if-eqz v6, :cond_8f

    .line 216
    invoke-interface {v6, v5}, Lcom/squareup/okhttp/internal/InternalCache;->get(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 219
    .local v0, "cacheCandidate":Lcom/squareup/okhttp/Response;
    :goto_24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 220
    .local v3, "now":J
    new-instance v8, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;

    invoke-direct {v8, v3, v4, v5, v0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;-><init>(JLcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V

    invoke-virtual {v8}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->get()Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-result-object v8

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .line 221
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    iget-object v8, v8, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 222
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    iget-object v8, v8, Lcom/squareup/okhttp/internal/http/CacheStrategy;->cacheResponse:Lcom/squareup/okhttp/Response;

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 224
    if-eqz v6, :cond_46

    .line 225
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    invoke-interface {v6, v8}, Lcom/squareup/okhttp/internal/InternalCache;->trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V

    .line 228
    :cond_46
    if-eqz v0, :cond_53

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-nez v8, :cond_53

    .line 229
    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v8

    invoke-static {v8}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 232
    :cond_53
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v8, :cond_c4

    .line 234
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-nez v7, :cond_60

    .line 235
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {p0, v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->connect(Lcom/squareup/okhttp/Request;)V

    .line 238
    :cond_60
    sget-object v7, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v7, v8, p0}, Lcom/squareup/okhttp/internal/Internal;->newTransport(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    .line 244
    iget-boolean v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->callerWritesRequestBody:Z

    if-eqz v7, :cond_5

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->permitsRequestBody()Z

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-nez v7, :cond_5

    .line 245
    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Request;)J

    move-result-wide v1

    .line 246
    .local v1, "contentLength":J
    iget-boolean v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    if-eqz v7, :cond_b1

    .line 247
    const-wide/32 v7, 0x7fffffff

    cmp-long v7, v1, v7

    if-lez v7, :cond_91

    .line 248
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2 GiB."

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .end local v0    # "cacheCandidate":Lcom/squareup/okhttp/Response;
    .end local v1    # "contentLength":J
    .end local v3    # "now":J
    :cond_8f
    move-object v0, v7

    .line 216
    goto :goto_24

    .line 252
    .restart local v0    # "cacheCandidate":Lcom/squareup/okhttp/Response;
    .restart local v1    # "contentLength":J
    .restart local v3    # "now":J
    :cond_91
    const-wide/16 v7, -0x1

    cmp-long v7, v1, v7

    if-eqz v7, :cond_a8

    .line 254
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v7, v8}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 255
    new-instance v7, Lcom/squareup/okhttp/internal/http/RetryableSink;

    long-to-int v8, v1

    invoke-direct {v7, v8}, Lcom/squareup/okhttp/internal/http/RetryableSink;-><init>(I)V

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 260
    :cond_a8
    new-instance v7, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-direct {v7}, Lcom/squareup/okhttp/internal/http/RetryableSink;-><init>()V

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 263
    :cond_b1
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v7, v8}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 264
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v7, v8, v1, v2}, Lcom/squareup/okhttp/internal/http/Transport;->createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 270
    .end local v1    # "contentLength":J
    :cond_c4
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v8, :cond_d7

    .line 271
    sget-object v8, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v9}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v9

    iget-object v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v8, v9, v10}, Lcom/squareup/okhttp/internal/Internal;->recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V

    .line 272
    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 275
    :cond_d7
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-eqz v7, :cond_10b

    .line 277
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 278
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 279
    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 280
    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    .line 281
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 294
    :goto_101
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-direct {p0, v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->unzip(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    goto/16 :goto_5

    .line 284
    :cond_10b
    new-instance v7, Lcom/squareup/okhttp/Response$Builder;

    invoke-direct {v7}, Lcom/squareup/okhttp/Response$Builder;-><init>()V

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 285
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 286
    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    sget-object v8, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    .line 287
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    const/16 v8, 0x1f8

    .line 288
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->code(I)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    const-string v8, "Unsatisfiable Request (only-if-cached)"

    .line 289
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    sget-object v8, Lcom/squareup/okhttp/internal/http/HttpEngine;->EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;

    .line 290
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    .line 291
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    goto :goto_101
.end method

.method public writingRequestHeaders()V
    .registers 5

    .prologue
    .line 321
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 322
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    .line 323
    return-void
.end method
