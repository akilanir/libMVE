.class public Lcom/koushikdutta/ion/Ion$Config;
.super Ljava/lang/Object;
.source "Ion.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/Ion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Config"
.end annotation


# instance fields
.field asyncHttpRequestFactory:Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

.field final synthetic this$0:Lcom/koushikdutta/ion/Ion;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 458
    iput-object p1, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 556
    new-instance v0, Lcom/koushikdutta/ion/Ion$Config$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/Ion$Config$1;-><init>(Lcom/koushikdutta/ion/Ion$Config;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->asyncHttpRequestFactory:Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

    return-void
.end method


# virtual methods
.method public addLoader(ILcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;
    .registers 4
    .param p1, "index"    # I
    .param p2, "loader"    # Lcom/koushikdutta/ion/Loader;

    .prologue
    .line 585
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 586
    return-object p0
.end method

.method public addLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;
    .registers 3
    .param p1, "loader"    # Lcom/koushikdutta/ion/Loader;

    .prologue
    .line 593
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    return-object p0
.end method

.method public createSSLContext(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    .registers 3
    .param p1, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->conscryptMiddleware:Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->initialize()V

    .line 485
    invoke-static {p1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    return-object v0
.end method

.method public disableProxy()V
    .registers 2

    .prologue
    .line 536
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSocketMiddleware()Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->disableProxy()V

    .line 537
    return-void
.end method

.method public disableSecureProxy()V
    .registers 2

    .prologue
    .line 543
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->disableProxy()V

    .line 544
    return-void
.end method

.method public getAsyncHttpRequestFactory()Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;
    .registers 2

    .prologue
    .line 567
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->asyncHttpRequestFactory:Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

    return-object v0
.end method

.method public getContentLoader()Lcom/koushikdutta/ion/loader/ContentLoader;
    .registers 2

    .prologue
    .line 472
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->contentLoader:Lcom/koushikdutta/ion/loader/ContentLoader;

    return-object v0
.end method

.method public getFileLoader()Lcom/koushikdutta/ion/loader/FileLoader;
    .registers 2

    .prologue
    .line 476
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->fileLoader:Lcom/koushikdutta/ion/loader/FileLoader;

    return-object v0
.end method

.method public declared-synchronized getGson()Lcom/google/gson/Gson;
    .registers 3

    .prologue
    .line 495
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->gson:Lcom/google/gson/Gson;

    if-nez v0, :cond_10

    .line 496
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    iput-object v1, v0, Lcom/koushikdutta/ion/Ion;->gson:Lcom/google/gson/Gson;

    .line 497
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->gson:Lcom/google/gson/Gson;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    monitor-exit p0

    return-object v0

    .line 495
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getHttpLoader()Lcom/koushikdutta/ion/loader/HttpLoader;
    .registers 2

    .prologue
    .line 460
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->httpLoader:Lcom/koushikdutta/ion/loader/HttpLoader;

    return-object v0
.end method

.method public getLoaders()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/koushikdutta/ion/Loader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 597
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPackageIconLoader()Lcom/koushikdutta/ion/loader/PackageIconLoader;
    .registers 2

    .prologue
    .line 468
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->packageIconLoader:Lcom/koushikdutta/ion/loader/PackageIconLoader;

    return-object v0
.end method

.method public getResponseCache()Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    .registers 2

    .prologue
    .line 480
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    return-object v0
.end method

.method public getVideoLoader()Lcom/koushikdutta/ion/loader/VideoLoader;
    .registers 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->videoLoader:Lcom/koushikdutta/ion/loader/VideoLoader;

    return-object v0
.end method

.method public insertLoader(Lcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;
    .registers 4
    .param p1, "loader"    # Lcom/koushikdutta/ion/Loader;

    .prologue
    .line 589
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 590
    return-object p0
.end method

.method public proxy(Ljava/lang/String;I)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 518
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSocketMiddleware()Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->enableProxy(Ljava/lang/String;I)V

    .line 519
    return-void
.end method

.method public proxySecure(Ljava/lang/String;I)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 529
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->enableProxy(Ljava/lang/String;I)V

    .line 530
    return-void
.end method

.method public setAsyncHttpRequestFactory(Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;)Lcom/koushikdutta/ion/Ion$Config;
    .registers 2
    .param p1, "asyncHttpRequestFactory"    # Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

    .prologue
    .line 571
    iput-object p1, p0, Lcom/koushikdutta/ion/Ion$Config;->asyncHttpRequestFactory:Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

    .line 572
    return-object p0
.end method

.method public setGson(Lcom/google/gson/Gson;)V
    .registers 3
    .param p1, "gson"    # Lcom/google/gson/Gson;

    .prologue
    .line 553
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iput-object p1, v0, Lcom/koushikdutta/ion/Ion;->gson:Lcom/google/gson/Gson;

    .line 554
    return-void
.end method

.method public setLogging(Ljava/lang/String;I)Lcom/koushikdutta/ion/Ion$Config;
    .registers 4
    .param p1, "logtag"    # Ljava/lang/String;
    .param p2, "logLevel"    # I

    .prologue
    .line 507
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iput-object p1, v0, Lcom/koushikdutta/ion/Ion;->logtag:Ljava/lang/String;

    .line 508
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iput p2, v0, Lcom/koushikdutta/ion/Ion;->logLevel:I

    .line 509
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lcom/koushikdutta/ion/Ion$Config;
    .registers 3
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 580
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iput-object p1, v0, Lcom/koushikdutta/ion/Ion;->userAgent:Ljava/lang/String;

    .line 581
    return-object p0
.end method

.method public userAgent()Ljava/lang/String;
    .registers 2

    .prologue
    .line 576
    iget-object v0, p0, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->userAgent:Ljava/lang/String;

    return-object v0
.end method
