.class public Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
.super Ljava/lang/Object;
.source "HttpClientBuilder.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field static final DEFAULT_USER_AGENT:Ljava/lang/String;


# instance fields
.field private authCachingDisabled:Z

.field private authSchemeRegistry:Lcz/msebera/android/httpclient/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;",
            ">;"
        }
    .end annotation
.end field

.field private automaticRetriesDisabled:Z

.field private backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;

.field private closeables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/Closeable;",
            ">;"
        }
    .end annotation
.end field

.field private connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

.field private connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

.field private connectionStateDisabled:Z

.field private contentCompressionDisabled:Z

.field private cookieManagementDisabled:Z

.field private cookieSpecRegistry:Lcz/msebera/android/httpclient/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;",
            ">;"
        }
    .end annotation
.end field

.field private cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;

.field private credentialsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;

.field private defaultConnectionConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

.field private defaultHeaders:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lcz/msebera/android/httpclient/Header;",
            ">;"
        }
    .end annotation
.end field

.field private defaultRequestConfig:Lcz/msebera/android/httpclient/client/config/RequestConfig;

.field private defaultSocketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

.field private hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

.field private httpprocessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

.field private keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

.field private maxConnPerRoute:I

.field private maxConnTotal:I

.field private proxy:Lcz/msebera/android/httpclient/HttpHost;

.field private proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

.field private redirectHandlingDisabled:Z

.field private redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;

.field private requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

.field private requestFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private requestLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

.field private reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

.field private routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

.field private schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

.field private serviceUnavailStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

.field private sslSocketFactory:Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

.field private sslcontext:Ljavax/net/ssl/SSLContext;

.field private systemProperties:Z

.field private targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

.field private userAgent:Ljava/lang/String;

.field private userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 204
    const-string v2, "cz.msebera.android.httpclient.client"

    const-class v3, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    .line 205
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v2, v3}, Lcz/msebera/android/httpclient/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lcz/msebera/android/httpclient/util/VersionInfo;

    move-result-object v1

    .line 206
    .local v1, "vi":Lcz/msebera/android/httpclient/util/VersionInfo;
    if-eqz v1, :cond_2e

    .line 207
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "release":Ljava/lang/String;
    :goto_12
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Apache-HttpClient/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (java 1.5)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->DEFAULT_USER_AGENT:Ljava/lang/String;

    .line 209
    return-void

    .line 207
    .end local v0    # "release":Ljava/lang/String;
    :cond_2e
    const-string v0, "UNAVAILABLE"

    goto :goto_12
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnTotal:I

    .line 198
    iput v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    .line 217
    return-void
.end method

.method public static create()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 1

    .prologue
    .line 212
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;-><init>()V

    return-object v0
.end method

.method private static split(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 686
    invoke-static {p0}, Lcz/msebera/android/httpclient/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 687
    const/4 v0, 0x0

    .line 689
    :goto_7
    return-object v0

    :cond_8
    const-string v0, " *, *"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method


# virtual methods
.method protected addCloseable(Ljava/io/Closeable;)V
    .registers 3
    .param p1, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 676
    if-nez p1, :cond_3

    .line 683
    :goto_2
    return-void

    .line 679
    :cond_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    if-nez v0, :cond_e

    .line 680
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    .line 682
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public final addInterceptorFirst(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .prologue
    .line 446
    if-nez p1, :cond_3

    .line 453
    :goto_2
    return-object p0

    .line 449
    :cond_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 450
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    .line 452
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorFirst(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    .line 412
    if-nez p1, :cond_3

    .line 419
    :goto_2
    return-object p0

    .line 415
    :cond_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 416
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    .line 418
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorLast(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .prologue
    .line 463
    if-nez p1, :cond_3

    .line 470
    :goto_2
    return-object p0

    .line 466
    :cond_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 467
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    .line 469
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorLast(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    .line 429
    if-nez p1, :cond_3

    .line 436
    :goto_2
    return-object p0

    .line 432
    :cond_3
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 433
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    .line 435
    :cond_e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public build()Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;
    .registers 41

    .prologue
    .line 694
    move-object/from16 v0, p0

    iget-object v5, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .line 695
    .local v5, "requestExec":Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    if-nez v5, :cond_b

    .line 696
    new-instance v5, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .end local v5    # "requestExec":Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    invoke-direct {v5}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;-><init>()V

    .line 698
    .restart local v5    # "requestExec":Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    :cond_b
    move-object/from16 v0, p0

    iget-object v6, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    .line 699
    .local v6, "connManager":Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    if-nez v6, :cond_eb

    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->sslSocketFactory:Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

    move-object/from16 v36, v0

    .line 701
    .local v36, "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    if-nez v36, :cond_5a

    .line 702
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_182

    const-string v12, "https.protocols"

    .line 703
    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 702
    invoke-static {v12}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 704
    .local v38, "supportedProtocols":[Ljava/lang/String;
    :goto_29
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_186

    const-string v12, "https.cipherSuites"

    .line 705
    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 704
    invoke-static {v12}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v37

    .line 706
    .local v37, "supportedCipherSuites":[Ljava/lang/String;
    :goto_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    move-object/from16 v26, v0

    .line 707
    .local v26, "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    if-nez v26, :cond_43

    .line 708
    sget-object v26, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .line 710
    :cond_43
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    if-eqz v12, :cond_18a

    .line 711
    new-instance v36, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    .end local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move-object/from16 v2, v37

    move-object/from16 v3, v26

    invoke-direct {v0, v12, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .line 726
    .end local v26    # "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    .end local v37    # "supportedCipherSuites":[Ljava/lang/String;
    .end local v38    # "supportedProtocols":[Ljava/lang/String;
    .restart local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    :cond_5a
    :goto_5a
    new-instance v30, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;

    .line 727
    invoke-static {}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->create()Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "http"

    .line 728
    invoke-static {}, Lcz/msebera/android/httpclient/conn/socket/PlainConnectionSocketFactory;->getSocketFactory()Lcz/msebera/android/httpclient/conn/socket/PlainConnectionSocketFactory;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "https"

    .line 729
    move-object/from16 v0, v36

    invoke-virtual {v12, v13, v0}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    .line 730
    invoke-virtual {v12}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->build()Lcz/msebera/android/httpclient/config/Registry;

    move-result-object v12

    move-object/from16 v0, v30

    invoke-direct {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lcz/msebera/android/httpclient/config/Registry;)V

    .line 731
    .local v30, "poolingmgr":Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultSocketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

    if-eqz v12, :cond_8a

    .line 732
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultSocketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setDefaultSocketConfig(Lcz/msebera/android/httpclient/config/SocketConfig;)V

    .line 734
    :cond_8a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    if-eqz v12, :cond_99

    .line 735
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setDefaultConnectionConfig(Lcz/msebera/android/httpclient/config/ConnectionConfig;)V

    .line 737
    :cond_99
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_cb

    .line 738
    const-string v12, "http.keepAlive"

    const-string v13, "true"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 739
    .local v33, "s":Ljava/lang/String;
    const-string v12, "true"

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_cb

    .line 740
    const-string v12, "http.maxConnections"

    const-string v13, "5"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 741
    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v29

    .line 742
    .local v29, "max":I
    move-object/from16 v0, v30

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setDefaultMaxPerRoute(I)V

    .line 743
    mul-int/lit8 v12, v29, 0x2

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setMaxTotal(I)V

    .line 746
    .end local v29    # "max":I
    .end local v33    # "s":Ljava/lang/String;
    :cond_cb
    move-object/from16 v0, p0

    iget v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnTotal:I

    if-lez v12, :cond_da

    .line 747
    move-object/from16 v0, p0

    iget v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnTotal:I

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setMaxTotal(I)V

    .line 749
    :cond_da
    move-object/from16 v0, p0

    iget v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    if-lez v12, :cond_e9

    .line 750
    move-object/from16 v0, p0

    iget v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;->setDefaultMaxPerRoute(I)V

    .line 752
    :cond_e9
    move-object/from16 v6, v30

    .line 754
    .end local v30    # "poolingmgr":Lcz/msebera/android/httpclient/impl/conn/PoolingHttpClientConnectionManager;
    .end local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    :cond_eb
    move-object/from16 v0, p0

    iget-object v7, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 755
    .local v7, "reuseStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    if-nez v7, :cond_10b

    .line 756
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_1b8

    .line 757
    const-string v12, "http.keepAlive"

    const-string v13, "true"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 758
    .restart local v33    # "s":Ljava/lang/String;
    const-string v12, "true"

    move-object/from16 v0, v33

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1b4

    .line 759
    sget-object v7, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    .line 767
    .end local v33    # "s":Ljava/lang/String;
    :cond_10b
    :goto_10b
    move-object/from16 v0, p0

    iget-object v8, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .line 768
    .local v8, "keepAliveStrategy":Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    if-nez v8, :cond_113

    .line 769
    sget-object v8, Lcz/msebera/android/httpclient/impl/client/DefaultConnectionKeepAliveStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultConnectionKeepAliveStrategy;

    .line 771
    :cond_113
    move-object/from16 v0, p0

    iget-object v9, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 772
    .local v9, "targetAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    if-nez v9, :cond_11b

    .line 773
    sget-object v9, Lcz/msebera/android/httpclient/impl/client/TargetAuthenticationStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/TargetAuthenticationStrategy;

    .line 775
    :cond_11b
    move-object/from16 v0, p0

    iget-object v10, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 776
    .local v10, "proxyAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    if-nez v10, :cond_123

    .line 777
    sget-object v10, Lcz/msebera/android/httpclient/impl/client/ProxyAuthenticationStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/ProxyAuthenticationStrategy;

    .line 779
    :cond_123
    move-object/from16 v0, p0

    iget-object v11, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .line 780
    .local v11, "userTokenHandler":Lcz/msebera/android/httpclient/client/UserTokenHandler;
    if-nez v11, :cond_131

    .line 781
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connectionStateDisabled:Z

    if-nez v12, :cond_1bc

    .line 782
    sget-object v11, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;

    .line 787
    :cond_131
    :goto_131
    new-instance v4, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;

    invoke-direct/range {v4 .. v11}, Lcz/msebera/android/httpclient/impl/execchain/MainClientExec;-><init>(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/UserTokenHandler;)V

    .line 796
    .local v4, "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->decorateMainExec(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-result-object v4

    .line 798
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->httpprocessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-object/from16 v27, v0

    .line 799
    .local v27, "httpprocessor":Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    if-nez v27, :cond_2bc

    .line 801
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->userAgent:Ljava/lang/String;

    move-object/from16 v39, v0

    .line 802
    .local v39, "userAgent":Ljava/lang/String;
    if-nez v39, :cond_15c

    .line 803
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_158

    .line 804
    const-string v12, "http.agent"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 806
    :cond_158
    if-nez v39, :cond_15c

    .line 807
    sget-object v39, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->DEFAULT_USER_AGENT:Ljava/lang/String;

    .line 811
    :cond_15c
    invoke-static {}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->create()Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    move-result-object v22

    .line 812
    .local v22, "b":Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    if-eqz v12, :cond_1c0

    .line 813
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_16e
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1c0

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 814
    .local v28, "i":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->addFirst(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    goto :goto_16e

    .line 702
    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .end local v7    # "reuseStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .end local v8    # "keepAliveStrategy":Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .end local v9    # "targetAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .end local v10    # "proxyAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .end local v11    # "userTokenHandler":Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .end local v22    # "b":Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;
    .end local v27    # "httpprocessor":Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .end local v28    # "i":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .end local v39    # "userAgent":Ljava/lang/String;
    .restart local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    :cond_182
    const/16 v38, 0x0

    goto/16 :goto_29

    .line 704
    .restart local v38    # "supportedProtocols":[Ljava/lang/String;
    :cond_186
    const/16 v37, 0x0

    goto/16 :goto_39

    .line 714
    .restart local v26    # "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    .restart local v37    # "supportedCipherSuites":[Ljava/lang/String;
    :cond_18a
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_1a5

    .line 715
    new-instance v36, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    .line 716
    .end local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v12

    check-cast v12, Ljavax/net/ssl/SSLSocketFactory;

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move-object/from16 v2, v37

    move-object/from16 v3, v26

    invoke-direct {v0, v12, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .restart local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    goto/16 :goto_5a

    .line 719
    :cond_1a5
    new-instance v36, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    .line 720
    .end local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    invoke-static {}, Lcz/msebera/android/httpclient/conn/ssl/SSLContexts;->createDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v12

    move-object/from16 v0, v36

    move-object/from16 v1, v26

    invoke-direct {v0, v12, v1}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .restart local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    goto/16 :goto_5a

    .line 761
    .end local v26    # "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    .end local v36    # "sslSocketFactory":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    .end local v37    # "supportedCipherSuites":[Ljava/lang/String;
    .end local v38    # "supportedProtocols":[Ljava/lang/String;
    .restart local v7    # "reuseStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .restart local v33    # "s":Ljava/lang/String;
    :cond_1b4
    sget-object v7, Lcz/msebera/android/httpclient/impl/NoConnectionReuseStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/NoConnectionReuseStrategy;

    goto/16 :goto_10b

    .line 764
    .end local v33    # "s":Ljava/lang/String;
    :cond_1b8
    sget-object v7, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    goto/16 :goto_10b

    .line 784
    .restart local v8    # "keepAliveStrategy":Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .restart local v9    # "targetAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .restart local v10    # "proxyAuthStrategy":Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .restart local v11    # "userTokenHandler":Lcz/msebera/android/httpclient/client/UserTokenHandler;
    :cond_1bc
    sget-object v11, Lcz/msebera/android/httpclient/impl/client/NoopUserTokenHandler;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/NoopUserTokenHandler;

    goto/16 :goto_131

    .line 817
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v22    # "b":Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;
    .restart local v27    # "httpprocessor":Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .restart local v39    # "userAgent":Ljava/lang/String;
    :cond_1c0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    if-eqz v12, :cond_1e2

    .line 818
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1ce
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1e2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 819
    .local v28, "i":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->addFirst(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    goto :goto_1ce

    .line 822
    .end local v28    # "i":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    :cond_1e2
    const/4 v12, 0x6

    new-array v12, v12, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    const/4 v13, 0x0

    new-instance v14, Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultHeaders:Ljava/util/Collection;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-direct {v14, v0}, Lcz/msebera/android/httpclient/client/protocol/RequestDefaultHeaders;-><init>(Ljava/util/Collection;)V

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Lcz/msebera/android/httpclient/protocol/RequestContent;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/protocol/RequestContent;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    new-instance v14, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/protocol/RequestTargetHost;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    new-instance v14, Lcz/msebera/android/httpclient/protocol/RequestUserAgent;

    move-object/from16 v0, v39

    invoke-direct {v14, v0}, Lcz/msebera/android/httpclient/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    aput-object v14, v12, v13

    const/4 v13, 0x5

    new-instance v14, Lcz/msebera/android/httpclient/client/protocol/RequestExpectContinue;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/client/protocol/RequestExpectContinue;-><init>()V

    aput-object v14, v12, v13

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->addAll([Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 829
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    if-nez v12, :cond_234

    .line 830
    new-instance v12, Lcz/msebera/android/httpclient/client/protocol/RequestAddCookies;

    invoke-direct {v12}, Lcz/msebera/android/httpclient/client/protocol/RequestAddCookies;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->add(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 832
    :cond_234
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    if-nez v12, :cond_244

    .line 833
    new-instance v12, Lcz/msebera/android/httpclient/client/protocol/RequestAcceptEncoding;

    invoke-direct {v12}, Lcz/msebera/android/httpclient/client/protocol/RequestAcceptEncoding;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->add(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 835
    :cond_244
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->authCachingDisabled:Z

    if-nez v12, :cond_254

    .line 836
    new-instance v12, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;

    invoke-direct {v12}, Lcz/msebera/android/httpclient/client/protocol/RequestAuthCache;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->add(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 838
    :cond_254
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    if-nez v12, :cond_264

    .line 839
    new-instance v12, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;

    invoke-direct {v12}, Lcz/msebera/android/httpclient/client/protocol/ResponseProcessCookies;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->add(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 841
    :cond_264
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    if-nez v12, :cond_274

    .line 842
    new-instance v12, Lcz/msebera/android/httpclient/client/protocol/ResponseContentEncoding;

    invoke-direct {v12}, Lcz/msebera/android/httpclient/client/protocol/ResponseContentEncoding;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->add(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    .line 844
    :cond_274
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    if-eqz v12, :cond_296

    .line 845
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_282
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_296

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 846
    .local v28, "i":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->addLast(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    goto :goto_282

    .line 849
    .end local v28    # "i":Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    :cond_296
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    if-eqz v12, :cond_2b8

    .line 850
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2a4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2b8

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 851
    .local v28, "i":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->addLast(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;

    goto :goto_2a4

    .line 854
    .end local v28    # "i":Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    :cond_2b8
    invoke-virtual/range {v22 .. v22}, Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;->build()Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-result-object v27

    .line 856
    .end local v22    # "b":Lcz/msebera/android/httpclient/protocol/HttpProcessorBuilder;
    .end local v39    # "userAgent":Ljava/lang/String;
    :cond_2bc
    new-instance v25, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-direct {v0, v4, v1}, Lcz/msebera/android/httpclient/impl/execchain/ProtocolExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/protocol/HttpProcessor;)V

    .line 858
    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .local v25, "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->decorateProtocolExec(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-result-object v4

    .line 861
    .end local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->automaticRetriesDisabled:Z

    if-nez v12, :cond_2e8

    .line 862
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    move-object/from16 v32, v0

    .line 863
    .local v32, "retryHandler":Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    if-nez v32, :cond_2dd

    .line 864
    sget-object v32, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;

    .line 866
    :cond_2dd
    new-instance v25, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    invoke-direct {v0, v4, v1}, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;)V

    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 869
    .end local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .end local v32    # "retryHandler":Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    :cond_2e8
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    .line 870
    .local v15, "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    if-nez v15, :cond_309

    .line 871
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    move-object/from16 v34, v0

    .line 872
    .local v34, "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    if-nez v34, :cond_2f8

    .line 873
    sget-object v34, Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;

    .line 875
    :cond_2f8
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->proxy:Lcz/msebera/android/httpclient/HttpHost;

    if-eqz v12, :cond_427

    .line 876
    new-instance v15, Lcz/msebera/android/httpclient/impl/conn/DefaultProxyRoutePlanner;

    .end local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->proxy:Lcz/msebera/android/httpclient/HttpHost;

    move-object/from16 v0, v34

    invoke-direct {v15, v12, v0}, Lcz/msebera/android/httpclient/impl/conn/DefaultProxyRoutePlanner;-><init>(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/conn/SchemePortResolver;)V

    .line 885
    .end local v34    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    .restart local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    :cond_309
    :goto_309
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->redirectHandlingDisabled:Z

    if-nez v12, :cond_324

    .line 886
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;

    move-object/from16 v31, v0

    .line 887
    .local v31, "redirectStrategy":Lcz/msebera/android/httpclient/client/RedirectStrategy;
    if-nez v31, :cond_319

    .line 888
    sget-object v31, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;

    .line 890
    :cond_319
    new-instance v25, Lcz/msebera/android/httpclient/impl/execchain/RedirectExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v31

    invoke-direct {v0, v4, v15, v1}, Lcz/msebera/android/httpclient/impl/execchain/RedirectExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/client/RedirectStrategy;)V

    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 894
    .end local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .end local v31    # "redirectStrategy":Lcz/msebera/android/httpclient/client/RedirectStrategy;
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    :cond_324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->serviceUnavailStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    move-object/from16 v35, v0

    .line 895
    .local v35, "serviceUnavailStrategy":Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;
    if-eqz v35, :cond_337

    .line 896
    new-instance v25, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v35

    invoke-direct {v0, v4, v1}, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;)V

    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 899
    .end local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    :cond_337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;

    move-object/from16 v23, v0

    .line 900
    .local v23, "backoffManager":Lcz/msebera/android/httpclient/client/BackoffManager;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

    move-object/from16 v24, v0

    .line 901
    .local v24, "connectionBackoffStrategy":Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    if-eqz v23, :cond_354

    if-eqz v24, :cond_354

    .line 902
    new-instance v25, Lcz/msebera/android/httpclient/impl/execchain/BackoffStrategyExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    move-object/from16 v2, v23

    invoke-direct {v0, v4, v1, v2}, Lcz/msebera/android/httpclient/impl/execchain/BackoffStrategyExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;Lcz/msebera/android/httpclient/client/BackoffManager;)V

    .end local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 905
    .end local v25    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    :cond_354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->authSchemeRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    move-object/from16 v17, v0

    .line 906
    .local v17, "authSchemeRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;>;"
    if-nez v17, :cond_385

    .line 907
    invoke-static {}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->create()Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "Basic"

    new-instance v14, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;-><init>()V

    .line 908
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "Digest"

    new-instance v14, Lcz/msebera/android/httpclient/impl/auth/DigestSchemeFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/auth/DigestSchemeFactory;-><init>()V

    .line 909
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "NTLM"

    new-instance v14, Lcz/msebera/android/httpclient/impl/auth/NTLMSchemeFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/auth/NTLMSchemeFactory;-><init>()V

    .line 910
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    .line 913
    invoke-virtual {v12}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->build()Lcz/msebera/android/httpclient/config/Registry;

    move-result-object v17

    .line 915
    :cond_385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieSpecRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    move-object/from16 v16, v0

    .line 916
    .local v16, "cookieSpecRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;>;"
    if-nez v16, :cond_3e2

    .line 917
    invoke-static {}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->create()Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "best-match"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/BestMatchSpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/BestMatchSpecFactory;-><init>()V

    .line 918
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "standard"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;-><init>()V

    .line 919
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "compatibility"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory;-><init>()V

    .line 920
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "netscape"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/NetscapeDraftSpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/NetscapeDraftSpecFactory;-><init>()V

    .line 921
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "ignoreCookies"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/IgnoreSpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/IgnoreSpecFactory;-><init>()V

    .line 922
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "rfc2109"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/RFC2109SpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/RFC2109SpecFactory;-><init>()V

    .line 923
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "rfc2965"

    new-instance v14, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v14}, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;-><init>()V

    .line 924
    invoke-virtual {v12, v13, v14}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v12

    .line 925
    invoke-virtual {v12}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->build()Lcz/msebera/android/httpclient/config/Registry;

    move-result-object v16

    .line 928
    :cond_3e2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;

    move-object/from16 v18, v0

    .line 929
    .local v18, "defaultCookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    if-nez v18, :cond_3ef

    .line 930
    new-instance v18, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;

    .end local v18    # "defaultCookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    invoke-direct/range {v18 .. v18}, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;-><init>()V

    .line 933
    .restart local v18    # "defaultCookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    :cond_3ef
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->credentialsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-object/from16 v19, v0

    .line 934
    .local v19, "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    if-nez v19, :cond_402

    .line 935
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_443

    .line 936
    new-instance v19, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;

    .end local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    invoke-direct/range {v19 .. v19}, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;-><init>()V

    .line 942
    .restart local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    :cond_402
    :goto_402
    new-instance v12, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultRequestConfig:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    if-eqz v13, :cond_449

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultRequestConfig:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-object/from16 v20, v0

    :goto_410
    move-object/from16 v0, p0

    iget-object v13, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    if-eqz v13, :cond_44c

    new-instance v21, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    move-object/from16 v0, v21

    invoke-direct {v0, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_421
    move-object v13, v4

    move-object v14, v6

    invoke-direct/range {v12 .. v21}, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/client/CookieStore;Lcz/msebera/android/httpclient/client/CredentialsProvider;Lcz/msebera/android/httpclient/client/config/RequestConfig;Ljava/util/List;)V

    return-object v12

    .line 877
    .end local v16    # "cookieSpecRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;>;"
    .end local v17    # "authSchemeRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;>;"
    .end local v18    # "defaultCookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    .end local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .end local v23    # "backoffManager":Lcz/msebera/android/httpclient/client/BackoffManager;
    .end local v24    # "connectionBackoffStrategy":Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    .end local v35    # "serviceUnavailStrategy":Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;
    .restart local v34    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :cond_427
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_43a

    .line 878
    new-instance v15, Lcz/msebera/android/httpclient/impl/conn/SystemDefaultRoutePlanner;

    .line 879
    .end local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v12

    move-object/from16 v0, v34

    invoke-direct {v15, v0, v12}, Lcz/msebera/android/httpclient/impl/conn/SystemDefaultRoutePlanner;-><init>(Lcz/msebera/android/httpclient/conn/SchemePortResolver;Ljava/net/ProxySelector;)V

    .restart local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    goto/16 :goto_309

    .line 881
    :cond_43a
    new-instance v15, Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;

    .end local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    move-object/from16 v0, v34

    invoke-direct {v15, v0}, Lcz/msebera/android/httpclient/impl/conn/DefaultRoutePlanner;-><init>(Lcz/msebera/android/httpclient/conn/SchemePortResolver;)V

    .restart local v15    # "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    goto/16 :goto_309

    .line 938
    .end local v34    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    .restart local v16    # "cookieSpecRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;>;"
    .restart local v17    # "authSchemeRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;>;"
    .restart local v18    # "defaultCookieStore":Lcz/msebera/android/httpclient/client/CookieStore;
    .restart local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .restart local v23    # "backoffManager":Lcz/msebera/android/httpclient/client/BackoffManager;
    .restart local v24    # "connectionBackoffStrategy":Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    .restart local v35    # "serviceUnavailStrategy":Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;
    :cond_443
    new-instance v19, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    .end local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    invoke-direct/range {v19 .. v19}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;-><init>()V

    .restart local v19    # "defaultCredentialsProvider":Lcz/msebera/android/httpclient/client/CredentialsProvider;
    goto :goto_402

    .line 942
    :cond_449
    sget-object v20, Lcz/msebera/android/httpclient/client/config/RequestConfig;->DEFAULT:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    goto :goto_410

    :cond_44c
    const/16 v21, 0x0

    goto :goto_421
.end method

.method protected decorateMainExec(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .registers 2
    .param p1, "mainExec"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .prologue
    .line 662
    return-object p1
.end method

.method protected decorateProtocolExec(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .registers 2
    .param p1, "protocolExec"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .prologue
    .line 669
    return-object p1
.end method

.method public final disableAuthCaching()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 502
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->authCachingDisabled:Z

    .line 503
    return-object p0
.end method

.method public final disableAutomaticRetries()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 529
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->automaticRetriesDisabled:Z

    .line 530
    return-object p0
.end method

.method public final disableConnectionState()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 370
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connectionStateDisabled:Z

    .line 371
    return-object p0
.end method

.method public final disableContentCompression()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 491
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    .line 492
    return-object p0
.end method

.method public final disableCookieManagement()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 480
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    .line 481
    return-object p0
.end method

.method public final disableRedirectHandling()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 567
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->redirectHandlingDisabled:Z

    .line 568
    return-object p0
.end method

.method public final setBackoffManager(Lcz/msebera/android/httpclient/client/BackoffManager;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "backoffManager"    # Lcz/msebera/android/httpclient/client/BackoffManager;

    .prologue
    .line 584
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;

    .line 585
    return-object p0
.end method

.method public final setConnectionBackoffStrategy(Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "connectionBackoffStrategy"    # Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

    .prologue
    .line 576
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

    .line 577
    return-object p0
.end method

.method public final setConnectionManager(Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "connManager"    # Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    .prologue
    .line 313
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    .line 314
    return-object p0
.end method

.method public final setConnectionReuseStrategy(Lcz/msebera/android/httpclient/ConnectionReuseStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "reuseStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .prologue
    .line 322
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 323
    return-object p0
.end method

.method public final setDefaultAuthSchemeRegistry(Lcz/msebera/android/httpclient/config/Lookup;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;",
            ">;)",
            "Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 624
    .local p1, "authSchemeRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;>;"
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->authSchemeRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    .line 625
    return-object p0
.end method

.method public final setDefaultConnectionConfig(Lcz/msebera/android/httpclient/config/ConnectionConfig;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lcz/msebera/android/httpclient/config/ConnectionConfig;

    .prologue
    .line 304
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    .line 305
    return-object p0
.end method

.method public final setDefaultCookieSpecRegistry(Lcz/msebera/android/httpclient/config/Lookup;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;",
            ">;)",
            "Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 635
    .local p1, "cookieSpecRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/cookie/CookieSpecProvider;>;"
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieSpecRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    .line 636
    return-object p0
.end method

.method public final setDefaultCookieStore(Lcz/msebera/android/httpclient/client/CookieStore;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "cookieStore"    # Lcz/msebera/android/httpclient/client/CookieStore;

    .prologue
    .line 602
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;

    .line 603
    return-object p0
.end method

.method public final setDefaultCredentialsProvider(Lcz/msebera/android/httpclient/client/CredentialsProvider;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "credentialsProvider"    # Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .prologue
    .line 613
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->credentialsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .line 614
    return-object p0
.end method

.method public final setDefaultHeaders(Ljava/util/Collection;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcz/msebera/android/httpclient/Header;",
            ">;)",
            "Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 401
    .local p1, "defaultHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lcz/msebera/android/httpclient/Header;>;"
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultHeaders:Ljava/util/Collection;

    .line 402
    return-object p0
.end method

.method public final setDefaultRequestConfig(Lcz/msebera/android/httpclient/client/config/RequestConfig;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lcz/msebera/android/httpclient/client/config/RequestConfig;

    .prologue
    .line 645
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultRequestConfig:Lcz/msebera/android/httpclient/client/config/RequestConfig;

    .line 646
    return-object p0
.end method

.method public final setDefaultSocketConfig(Lcz/msebera/android/httpclient/config/SocketConfig;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lcz/msebera/android/httpclient/config/SocketConfig;

    .prologue
    .line 293
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->defaultSocketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

    .line 294
    return-object p0
.end method

.method public final setHostnameVerifier(Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "hostnameVerifier"    # Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 235
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .line 236
    return-object p0
.end method

.method public final setHttpProcessor(Lcz/msebera/android/httpclient/protocol/HttpProcessor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "httpprocessor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .prologue
    .line 510
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->httpprocessor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 511
    return-object p0
.end method

.method public final setKeepAliveStrategy(Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "keepAliveStrategy"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 331
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .line 332
    return-object p0
.end method

.method public final setMaxConnPerRoute(I)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "maxConnPerRoute"    # I

    .prologue
    .line 282
    iput p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    .line 283
    return-object p0
.end method

.method public final setMaxConnTotal(I)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "maxConnTotal"    # I

    .prologue
    .line 271
    iput p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->maxConnTotal:I

    .line 272
    return-object p0
.end method

.method public final setProxy(Lcz/msebera/android/httpclient/HttpHost;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "proxy"    # Lcz/msebera/android/httpclient/HttpHost;

    .prologue
    .line 540
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->proxy:Lcz/msebera/android/httpclient/HttpHost;

    .line 541
    return-object p0
.end method

.method public final setProxyAuthenticationStrategy(Lcz/msebera/android/httpclient/client/AuthenticationStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "proxyAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .prologue
    .line 351
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 352
    return-object p0
.end method

.method public final setRedirectStrategy(Lcz/msebera/android/httpclient/client/RedirectStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "redirectStrategy"    # Lcz/msebera/android/httpclient/client/RedirectStrategy;

    .prologue
    .line 559
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;

    .line 560
    return-object p0
.end method

.method public final setRequestExecutor(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "requestExec"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .prologue
    .line 223
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .line 224
    return-object p0
.end method

.method public final setRetryHandler(Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "retryHandler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .prologue
    .line 521
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .line 522
    return-object p0
.end method

.method public final setRoutePlanner(Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "routePlanner"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    .prologue
    .line 548
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    .line 549
    return-object p0
.end method

.method public final setSSLSocketFactory(Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "sslSocketFactory"    # Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

    .prologue
    .line 260
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->sslSocketFactory:Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

    .line 261
    return-object p0
.end method

.method public final setSchemePortResolver(Lcz/msebera/android/httpclient/conn/SchemePortResolver;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "schemePortResolver"    # Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .prologue
    .line 379
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .line 380
    return-object p0
.end method

.method public final setServiceUnavailableRetryStrategy(Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "serviceUnavailStrategy"    # Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 593
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->serviceUnavailStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    .line 594
    return-object p0
.end method

.method public final setSslcontext(Ljavax/net/ssl/SSLContext;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "sslcontext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 248
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    .line 249
    return-object p0
.end method

.method public final setTargetAuthenticationStrategy(Lcz/msebera/android/httpclient/client/AuthenticationStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "targetAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .prologue
    .line 341
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 342
    return-object p0
.end method

.method public final setUserAgent(Ljava/lang/String;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 390
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->userAgent:Ljava/lang/String;

    .line 391
    return-object p0
.end method

.method public final setUserTokenHandler(Lcz/msebera/android/httpclient/client/UserTokenHandler;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "userTokenHandler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .prologue
    .line 362
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .line 363
    return-object p0
.end method

.method public final useSystemProperties()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 654
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->systemProperties:Z

    .line 655
    return-object p0
.end method
