.class public abstract Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;
.super Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;
.source "AbstractHttpClient.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private mutableProcessor:Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private supportedAuthSchemes:Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private supportedCookieSpecs:Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 5
    .param p1, "conman"    # Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .param p2, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 271
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;-><init>()V

    .line 185
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 272
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 273
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    .line 274
    return-void
.end method

.method private declared-synchronized getProtocolProcessor()Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .registers 8

    .prologue
    .line 701
    monitor-enter p0

    :try_start_1
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;

    if-nez v6, :cond_34

    .line 703
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v1

    .line 705
    .local v1, "proc":Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getRequestInterceptorCount()I

    move-result v2

    .line 706
    .local v2, "reqc":I
    new-array v3, v2, [Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 707
    .local v3, "reqinterceptors":[Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    if-ge v0, v2, :cond_1b

    .line 708
    invoke-virtual {v1, v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getRequestInterceptor(I)Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    move-result-object v6

    aput-object v6, v3, v0

    .line 707
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 710
    :cond_1b
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getResponseInterceptorCount()I

    move-result v4

    .line 711
    .local v4, "resc":I
    new-array v5, v4, [Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 712
    .local v5, "resinterceptors":[Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    const/4 v0, 0x0

    :goto_22
    if-ge v0, v4, :cond_2d

    .line 713
    invoke-virtual {v1, v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getResponseInterceptor(I)Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    move-result-object v6

    aput-object v6, v5, v0

    .line 712
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 715
    :cond_2d
    new-instance v6, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;

    invoke-direct {v6, v3, v5}, Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;-><init>([Lcz/msebera/android/httpclient/HttpRequestInterceptor;[Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V

    iput-object v6, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;

    .line 717
    .end local v0    # "i":I
    .end local v1    # "proc":Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
    .end local v2    # "reqc":I
    .end local v3    # "reqinterceptors":[Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .end local v4    # "resc":I
    .end local v5    # "resinterceptors":[Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    :cond_34
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_36
    .catchall {:try_start_1 .. :try_end_36} :catchall_38

    monitor-exit p0

    return-object v6

    .line 701
    :catchall_38
    move-exception v6

    monitor-exit p0

    throw v6
.end method


# virtual methods
.method public declared-synchronized addRequestInterceptor(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)V
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .prologue
    .line 757
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->addInterceptor(Lcz/msebera/android/httpclient/HttpRequestInterceptor;)V

    .line 758
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 759
    monitor-exit p0

    return-void

    .line 757
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addRequestInterceptor(Lcz/msebera/android/httpclient/HttpRequestInterceptor;I)V
    .registers 4
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .param p2, "index"    # I

    .prologue
    .line 762
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->addInterceptor(Lcz/msebera/android/httpclient/HttpRequestInterceptor;I)V

    .line 763
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 764
    monitor-exit p0

    return-void

    .line 762
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addResponseInterceptor(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V
    .registers 3
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    .line 737
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->addInterceptor(Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V

    .line 738
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 739
    monitor-exit p0

    return-void

    .line 737
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addResponseInterceptor(Lcz/msebera/android/httpclient/HttpResponseInterceptor;I)V
    .registers 4
    .param p1, "itcp"    # Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    .param p2, "index"    # I

    .prologue
    .line 742
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->addInterceptor(Lcz/msebera/android/httpclient/HttpResponseInterceptor;I)V

    .line 743
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 744
    monitor-exit p0

    return-void

    .line 742
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearRequestInterceptors()V
    .registers 2

    .prologue
    .line 767
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->clearRequestInterceptors()V

    .line 768
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 769
    monitor-exit p0

    return-void

    .line 767
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearResponseInterceptors()V
    .registers 2

    .prologue
    .line 747
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->clearResponseInterceptors()V

    .line 748
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 749
    monitor-exit p0

    return-void

    .line 747
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .registers 2

    .prologue
    .line 987
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ClientConnectionManager;->shutdown()V

    .line 988
    return-void
.end method

.method protected createAuthSchemeRegistry()Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    .registers 4

    .prologue
    .line 337
    new-instance v0, Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;-><init>()V

    .line 338
    .local v0, "registry":Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    const-string v1, "Basic"

    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/auth/AuthSchemeFactory;)V

    .line 341
    const-string v1, "Digest"

    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/DigestSchemeFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/auth/DigestSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/auth/AuthSchemeFactory;)V

    .line 344
    const-string v1, "NTLM"

    new-instance v2, Lcz/msebera/android/httpclient/impl/auth/NTLMSchemeFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/auth/NTLMSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/auth/AuthSchemeFactory;)V

    .line 349
    return-object v0
.end method

.method protected createClientConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .registers 11

    .prologue
    .line 305
    invoke-static {}, Lcz/msebera/android/httpclient/impl/conn/SchemeRegistryFactory;->createDefault()Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;

    move-result-object v6

    .line 307
    .local v6, "registry":Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;
    const/4 v2, 0x0

    .line 308
    .local v2, "connManager":Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v5

    .line 310
    .local v5, "params":Lcz/msebera/android/httpclient/params/HttpParams;
    const/4 v4, 0x0

    .line 312
    .local v4, "factory":Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    const-string v7, "http.connection-manager.factory-class-name"

    invoke-interface {v5, v7}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 314
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_1e

    .line 316
    :try_start_14
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 317
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "factory":Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    check-cast v4, Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    :try_end_1e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_14 .. :try_end_1e} :catch_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_14 .. :try_end_1e} :catch_3f
    .catch Ljava/lang/InstantiationException; {:try_start_14 .. :try_end_1e} :catch_4a

    .line 326
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "factory":Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    :cond_1e
    if-eqz v4, :cond_55

    .line 327
    invoke-interface {v4, v5, v6}, Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;->newInstance(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;)Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v2

    .line 332
    :goto_24
    return-object v2

    .line 318
    .end local v4    # "factory":Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    :catch_25
    move-exception v3

    .line 319
    .local v3, "ex":Ljava/lang/ClassNotFoundException;
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid class name: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 320
    .end local v3    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_3f
    move-exception v3

    .line 321
    .local v3, "ex":Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/IllegalAccessError;

    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 322
    .end local v3    # "ex":Ljava/lang/IllegalAccessException;
    :catch_4a
    move-exception v3

    .line 323
    .local v3, "ex":Ljava/lang/InstantiationException;
    new-instance v7, Ljava/lang/InstantiationError;

    invoke-virtual {v3}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 329
    .end local v3    # "ex":Ljava/lang/InstantiationException;
    .restart local v4    # "factory":Lcz/msebera/android/httpclient/conn/ClientConnectionManagerFactory;
    :cond_55
    new-instance v2, Lcz/msebera/android/httpclient/impl/conn/BasicClientConnectionManager;

    .end local v2    # "connManager":Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    invoke-direct {v2, v6}, Lcz/msebera/android/httpclient/impl/conn/BasicClientConnectionManager;-><init>(Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;)V

    .restart local v2    # "connManager":Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    goto :goto_24
.end method

.method protected createClientRequestDirector(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/client/RequestDirector;
    .registers 26
    .param p1, "requestExec"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .param p8, "redirectHandler"    # Lcz/msebera/android/httpclient/client/RedirectHandler;
    .param p9, "targetAuthHandler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .param p10, "proxyAuthHandler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .param p11, "userTokenHandler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .param p12, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 884
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;-><init>(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)V

    return-object v0
.end method

.method protected createClientRequestDirector(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectStrategy;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/client/RequestDirector;
    .registers 27
    .param p1, "requestExec"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .param p8, "redirectStrategy"    # Lcz/msebera/android/httpclient/client/RedirectStrategy;
    .param p9, "targetAuthHandler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .param p10, "proxyAuthHandler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .param p11, "userTokenHandler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .param p12, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 916
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;-><init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectStrategy;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/AuthenticationHandler;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)V

    return-object v0
.end method

.method protected createClientRequestDirector(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/client/RequestDirector;
    .registers 27
    .param p1, "requestExec"    # Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .param p8, "redirectStrategy"    # Lcz/msebera/android/httpclient/client/RedirectStrategy;
    .param p9, "targetAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p10, "proxyAuthStrategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .param p11, "userTokenHandler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .param p12, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 949
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lcz/msebera/android/httpclient/impl/client/DefaultRequestDirector;-><init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)V

    return-object v0
.end method

.method protected createConnectionKeepAliveStrategy()Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .registers 2

    .prologue
    .line 385
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultConnectionKeepAliveStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultConnectionKeepAliveStrategy;-><init>()V

    return-object v0
.end method

.method protected createConnectionReuseStrategy()Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .registers 2

    .prologue
    .line 381
    new-instance v0, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;-><init>()V

    return-object v0
.end method

.method protected createCookieSpecRegistry()Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    .registers 4

    .prologue
    .line 354
    new-instance v0, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;-><init>()V

    .line 355
    .local v0, "registry":Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    const-string v1, "best-match"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/BestMatchSpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/BestMatchSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 358
    const-string v1, "compatibility"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 361
    const-string v1, "netscape"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/NetscapeDraftSpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/NetscapeDraftSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 364
    const-string v1, "rfc2109"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/RFC2109SpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/RFC2109SpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 367
    const-string v1, "rfc2965"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/RFC2965SpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 370
    const-string v1, "ignoreCookies"

    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/IgnoreSpecFactory;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/impl/cookie/IgnoreSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieSpecFactory;)V

    .line 373
    return-object v0
.end method

.method protected createCookieStore()Lcz/msebera/android/httpclient/client/CookieStore;
    .registers 2

    .prologue
    .line 425
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/BasicCookieStore;-><init>()V

    return-object v0
.end method

.method protected createCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .registers 2

    .prologue
    .line 429
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;-><init>()V

    return-object v0
.end method

.method protected createHttpContext()Lcz/msebera/android/httpclient/protocol/HttpContext;
    .registers 4

    .prologue
    .line 284
    new-instance v0, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V

    .line 285
    .local v0, "context":Lcz/msebera/android/httpclient/protocol/HttpContext;
    const-string v1, "http.scheme-registry"

    .line 287
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/ClientConnectionManager;->getSchemeRegistry()Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;

    move-result-object v2

    .line 285
    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 288
    const-string v1, "http.authscheme-registry"

    .line 290
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getAuthSchemes()Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    move-result-object v2

    .line 288
    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 291
    const-string v1, "http.cookiespec-registry"

    .line 293
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getCookieSpecs()Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    move-result-object v2

    .line 291
    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    const-string v1, "http.cookie-store"

    .line 296
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getCookieStore()Lcz/msebera/android/httpclient/client/CookieStore;

    move-result-object v2

    .line 294
    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    const-string v1, "http.auth.credentials-provider"

    .line 299
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-result-object v2

    .line 297
    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 300
    return-object v0
.end method

.method protected abstract createHttpParams()Lcz/msebera/android/httpclient/params/HttpParams;
.end method

.method protected abstract createHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
.end method

.method protected createHttpRequestRetryHandler()Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .registers 2

    .prologue
    .line 389
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;-><init>()V

    return-object v0
.end method

.method protected createHttpRoutePlanner()Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .registers 3

    .prologue
    .line 433
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpRoutePlanner;

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/conn/ClientConnectionManager;->getSchemeRegistry()Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpRoutePlanner;-><init>(Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;)V

    return-object v0
.end method

.method protected createProxyAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 421
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultProxyAuthenticationHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultProxyAuthenticationHandler;-><init>()V

    return-object v0
.end method

.method protected createProxyAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 413
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/ProxyAuthenticationStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/ProxyAuthenticationStrategy;-><init>()V

    return-object v0
.end method

.method protected createRedirectHandler()Lcz/msebera/android/httpclient/client/RedirectHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 397
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectHandler;-><init>()V

    return-object v0
.end method

.method protected createRequestExecutor()Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .registers 2

    .prologue
    .line 377
    new-instance v0, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;-><init>()V

    return-object v0
.end method

.method protected createTargetAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 409
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultTargetAuthenticationHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultTargetAuthenticationHandler;-><init>()V

    return-object v0
.end method

.method protected createTargetAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 401
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/TargetAuthenticationStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/TargetAuthenticationStrategy;-><init>()V

    return-object v0
.end method

.method protected createUserTokenHandler()Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .registers 2

    .prologue
    .line 437
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;-><init>()V

    return-object v0
.end method

.method protected determineParams(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 6
    .param p1, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    const/4 v3, 0x0

    .line 981
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;

    .line 982
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v1

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v2

    invoke-direct {v0, v3, v1, v2, v3}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V

    return-object v0
.end method

.method protected final doExecute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 35
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 781
    const-string v4, "HTTP request"

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 785
    const/16 v23, 0x0

    .line 786
    .local v23, "execContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    const/16 v21, 0x0

    .line 787
    .local v21, "director":Lcz/msebera/android/httpclient/client/RequestDirector;
    const/16 v29, 0x0

    .line 788
    .local v29, "routePlanner":Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    const/16 v19, 0x0

    .line 789
    .local v19, "connectionBackoffStrategy":Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    const/16 v17, 0x0

    .line 793
    .local v17, "backoffManager":Lcz/msebera/android/httpclient/client/BackoffManager;
    monitor-enter p0

    .line 795
    :try_start_12
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createHttpContext()Lcz/msebera/android/httpclient/protocol/HttpContext;

    move-result-object v20

    .line 796
    .local v20, "defaultContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    if-nez p3, :cond_a4

    .line 797
    move-object/from16 v23, v20

    .line 801
    :goto_1a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->determineParams(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v16

    .line 802
    .local v16, "params":Lcz/msebera/android/httpclient/params/HttpParams;
    invoke-static/range {v16 .. v16}, Lcz/msebera/android/httpclient/client/params/HttpClientParamConfig;->getRequestConfig(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v18

    .line 803
    .local v18, "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    const-string v4, "http.request-config"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-interface {v0, v4, v1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 807
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getRequestExecutor()Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-result-object v5

    .line 808
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v6

    .line 809
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionReuseStrategy()Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    move-result-object v7

    .line 810
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionKeepAliveStrategy()Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    move-result-object v8

    .line 811
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getRoutePlanner()Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    move-result-object v9

    .line 812
    invoke-direct/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getProtocolProcessor()Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    move-result-object v10

    .line 813
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpRequestRetryHandler()Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    move-result-object v11

    .line 814
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getRedirectStrategy()Lcz/msebera/android/httpclient/client/RedirectStrategy;

    move-result-object v12

    .line 815
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getTargetAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-result-object v13

    .line 816
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getProxyAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-result-object v14

    .line 817
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getUserTokenHandler()Lcz/msebera/android/httpclient/client/UserTokenHandler;

    move-result-object v15

    move-object/from16 v4, p0

    .line 806
    invoke-virtual/range {v4 .. v16}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createClientRequestDirector(Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;Lcz/msebera/android/httpclient/client/RedirectStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/AuthenticationStrategy;Lcz/msebera/android/httpclient/client/UserTokenHandler;Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/client/RequestDirector;

    move-result-object v21

    .line 819
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getRoutePlanner()Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    move-result-object v29

    .line 820
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getConnectionBackoffStrategy()Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

    move-result-object v19

    .line 821
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getBackoffManager()Lcz/msebera/android/httpclient/client/BackoffManager;

    move-result-object v17

    .line 822
    monitor-exit p0
    :try_end_6e
    .catchall {:try_start_12 .. :try_end_6e} :catchall_b3

    .line 825
    if-eqz v19, :cond_119

    if-eqz v17, :cond_119

    .line 826
    if-eqz p1, :cond_b6

    move-object/from16 v30, p1

    .line 829
    .local v30, "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :goto_76
    :try_start_76
    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;->determineRoute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    :try_end_81
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_76 .. :try_end_81} :catch_dc

    move-result-object v28

    .line 834
    .local v28, "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    :try_start_82
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/client/RequestDirector;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 833
    invoke-static {v4}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->newProxy(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_91
    .catch Ljava/lang/RuntimeException; {:try_start_82 .. :try_end_91} :catch_c9
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_91} :catch_e5
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_82 .. :try_end_91} :catch_dc

    move-result-object v26

    .line 852
    .local v26, "out":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_92
    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;->shouldBackoff(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v4

    if-eqz v4, :cond_111

    .line 853
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/BackoffManager;->backOff(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V
    :try_end_a3
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_92 .. :try_end_a3} :catch_dc

    .line 859
    .end local v26    # "out":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v28    # "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :goto_a3
    return-object v26

    .line 799
    .end local v16    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    .end local v18    # "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    :cond_a4
    :try_start_a4
    new-instance v24, Lcz/msebera/android/httpclient/protocol/DefaultedHttpContext;

    move-object/from16 v0, v24

    move-object/from16 v1, p3

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/protocol/DefaultedHttpContext;-><init>(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .end local v23    # "execContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    .local v24, "execContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    move-object/from16 v23, v24

    .end local v24    # "execContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    .restart local v23    # "execContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    goto/16 :goto_1a

    .line 822
    .end local v20    # "defaultContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    :catchall_b3
    move-exception v4

    monitor-exit p0
    :try_end_b5
    .catchall {:try_start_a4 .. :try_end_b5} :catchall_b3

    throw v4

    .line 827
    .restart local v16    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    .restart local v18    # "config":Lcz/msebera/android/httpclient/client/config/RequestConfig;
    .restart local v20    # "defaultContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    :cond_b6
    :try_start_b6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->determineParams(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v4

    const-string v5, "http.default-host"

    invoke-interface {v4, v5}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcz/msebera/android/httpclient/HttpHost;

    move-object/from16 v30, v4

    goto :goto_76

    .line 835
    .restart local v28    # "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .restart local v30    # "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :catch_c9
    move-exception v27

    .line 836
    .local v27, "re":Ljava/lang/RuntimeException;
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_db

    .line 837
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/BackoffManager;->backOff(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    .line 839
    :cond_db
    throw v27
    :try_end_dc
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_b6 .. :try_end_dc} :catch_dc

    .line 862
    .end local v27    # "re":Ljava/lang/RuntimeException;
    .end local v28    # "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :catch_dc
    move-exception v25

    .line 863
    .local v25, "httpException":Lcz/msebera/android/httpclient/HttpException;
    new-instance v4, Lcz/msebera/android/httpclient/client/ClientProtocolException;

    move-object/from16 v0, v25

    invoke-direct {v4, v0}, Lcz/msebera/android/httpclient/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 840
    .end local v25    # "httpException":Lcz/msebera/android/httpclient/HttpException;
    .restart local v28    # "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .restart local v30    # "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :catch_e5
    move-exception v22

    .line 841
    .local v22, "e":Ljava/lang/Exception;
    :try_start_e6
    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_f7

    .line 842
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/BackoffManager;->backOff(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    .line 844
    :cond_f7
    move-object/from16 v0, v22

    instance-of v4, v0, Lcz/msebera/android/httpclient/HttpException;

    if-eqz v4, :cond_100

    .line 845
    check-cast v22, Lcz/msebera/android/httpclient/HttpException;

    .end local v22    # "e":Ljava/lang/Exception;
    throw v22

    .line 847
    .restart local v22    # "e":Ljava/lang/Exception;
    :cond_100
    move-object/from16 v0, v22

    instance-of v4, v0, Ljava/io/IOException;

    if-eqz v4, :cond_109

    .line 848
    check-cast v22, Ljava/io/IOException;

    .end local v22    # "e":Ljava/lang/Exception;
    throw v22

    .line 850
    .restart local v22    # "e":Ljava/lang/Exception;
    :cond_109
    new-instance v4, Ljava/lang/reflect/UndeclaredThrowableException;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 855
    .end local v22    # "e":Ljava/lang/Exception;
    .restart local v26    # "out":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :cond_111
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/BackoffManager;->probe(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V

    goto :goto_a3

    .line 860
    .end local v26    # "out":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v28    # "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lcz/msebera/android/httpclient/HttpHost;
    :cond_119
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/client/RequestDirector;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 859
    invoke-static {v4}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->newProxy(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_128
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_e6 .. :try_end_128} :catch_dc

    move-result-object v26

    goto/16 :goto_a3
.end method

.method public final declared-synchronized getAuthSchemes()Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    .registers 2

    .prologue
    .line 476
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    if-nez v0, :cond_b

    .line 477
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createAuthSchemeRegistry()Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    .line 479
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 476
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getBackoffManager()Lcz/msebera/android/httpclient/client/BackoffManager;
    .registers 2

    .prologue
    .line 502
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionBackoffStrategy()Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    .registers 2

    .prologue
    .line 487
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionKeepAliveStrategy()Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    .registers 2

    .prologue
    .line 527
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    if-nez v0, :cond_b

    .line 528
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createConnectionKeepAliveStrategy()Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .line 530
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 527
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 460
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    if-nez v0, :cond_b

    .line 461
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createClientConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    .line 463
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 460
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionReuseStrategy()Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .registers 2

    .prologue
    .line 514
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    if-nez v0, :cond_b

    .line 515
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createConnectionReuseStrategy()Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 517
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 514
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCookieSpecs()Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    .registers 2

    .prologue
    .line 495
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    if-nez v0, :cond_b

    .line 496
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createCookieSpecRegistry()Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    .line 498
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 495
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCookieStore()Lcz/msebera/android/httpclient/client/CookieStore;
    .registers 2

    .prologue
    .line 650
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;

    if-nez v0, :cond_b

    .line 651
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createCookieStore()Lcz/msebera/android/httpclient/client/CookieStore;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;

    .line 653
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 650
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;
    .registers 2

    .prologue
    .line 661
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;

    if-nez v0, :cond_b

    .line 662
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createCredentialsProvider()Lcz/msebera/android/httpclient/client/CredentialsProvider;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .line 664
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 661
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected final declared-synchronized getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
    .registers 2

    .prologue
    .line 694
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->mutableProcessor:Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    if-nez v0, :cond_b

    .line 695
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->mutableProcessor:Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    .line 697
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->mutableProcessor:Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 694
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getHttpRequestRetryHandler()Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    .registers 2

    .prologue
    .line 540
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    if-nez v0, :cond_b

    .line 541
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createHttpRequestRetryHandler()Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .line 543
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 540
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 442
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;

    if-nez v0, :cond_b

    .line 443
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createHttpParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 445
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 442
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getProxyAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 621
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createProxyAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getProxyAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 636
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    if-nez v0, :cond_b

    .line 637
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createProxyAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 639
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 636
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRedirectHandler()Lcz/msebera/android/httpclient/client/RedirectHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 555
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createRedirectHandler()Lcz/msebera/android/httpclient/client/RedirectHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRedirectStrategy()Lcz/msebera/android/httpclient/client/RedirectStrategy;
    .registers 2

    .prologue
    .line 570
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;

    if-nez v0, :cond_c

    .line 571
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategy;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;

    .line 573
    :cond_c
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 570
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRequestExecutor()Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    .registers 2

    .prologue
    .line 468
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    if-nez v0, :cond_b

    .line 469
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createRequestExecutor()Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;

    .line 471
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->requestExec:Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 468
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequestInterceptor(I)Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 729
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getRequestInterceptor(I)Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequestInterceptorCount()I
    .registers 2

    .prologue
    .line 733
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getRequestInterceptorCount()I
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result v0

    monitor-exit p0

    return v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getResponseInterceptor(I)Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 725
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getResponseInterceptor(I)Lcz/msebera/android/httpclient/HttpResponseInterceptor;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getResponseInterceptorCount()I
    .registers 2

    .prologue
    .line 721
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->getResponseInterceptorCount()I
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result v0

    monitor-exit p0

    return v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRoutePlanner()Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    .registers 2

    .prologue
    .line 672
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    if-nez v0, :cond_b

    .line 673
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createHttpRoutePlanner()Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    .line 675
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 672
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getTargetAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 588
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createTargetAuthenticationHandler()Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getTargetAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 603
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    if-nez v0, :cond_b

    .line 604
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createTargetAuthenticationStrategy()Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .line 606
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 603
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getUserTokenHandler()Lcz/msebera/android/httpclient/client/UserTokenHandler;
    .registers 2

    .prologue
    .line 683
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    if-nez v0, :cond_b

    .line 684
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->createUserTokenHandler()Lcz/msebera/android/httpclient/client/UserTokenHandler;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .line 686
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 683
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeRequestInterceptorByClass(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcz/msebera/android/httpclient/HttpRequestInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 772
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcz/msebera/android/httpclient/HttpRequestInterceptor;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->removeRequestInterceptorByClass(Ljava/lang/Class;)V

    .line 773
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 774
    monitor-exit p0

    return-void

    .line 772
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeResponseInterceptorByClass(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcz/msebera/android/httpclient/HttpResponseInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 752
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcz/msebera/android/httpclient/HttpResponseInterceptor;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->getHttpProcessor()Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/protocol/BasicHttpProcessor;->removeResponseInterceptorByClass(Ljava/lang/Class;)V

    .line 753
    const/4 v0, 0x0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->protocolProcessor:Lcz/msebera/android/httpclient/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 754
    monitor-exit p0

    return-void

    .line 752
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAuthSchemes(Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;)V
    .registers 3
    .param p1, "registry"    # Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;

    .prologue
    .line 483
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lcz/msebera/android/httpclient/auth/AuthSchemeRegistry;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 484
    monitor-exit p0

    return-void

    .line 483
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setBackoffManager(Lcz/msebera/android/httpclient/client/BackoffManager;)V
    .registers 3
    .param p1, "manager"    # Lcz/msebera/android/httpclient/client/BackoffManager;

    .prologue
    .line 506
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->backoffManager:Lcz/msebera/android/httpclient/client/BackoffManager;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 507
    monitor-exit p0

    return-void

    .line 506
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setConnectionBackoffStrategy(Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;

    .prologue
    .line 491
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->connectionBackoffStrategy:Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 492
    monitor-exit p0

    return-void

    .line 491
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCookieSpecs(Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;)V
    .registers 3
    .param p1, "registry"    # Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;

    .prologue
    .line 510
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lcz/msebera/android/httpclient/cookie/CookieSpecRegistry;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 511
    monitor-exit p0

    return-void

    .line 510
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCookieStore(Lcz/msebera/android/httpclient/client/CookieStore;)V
    .registers 3
    .param p1, "cookieStore"    # Lcz/msebera/android/httpclient/client/CookieStore;

    .prologue
    .line 657
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->cookieStore:Lcz/msebera/android/httpclient/client/CookieStore;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 658
    monitor-exit p0

    return-void

    .line 657
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCredentialsProvider(Lcz/msebera/android/httpclient/client/CredentialsProvider;)V
    .registers 3
    .param p1, "credsProvider"    # Lcz/msebera/android/httpclient/client/CredentialsProvider;

    .prologue
    .line 668
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 669
    monitor-exit p0

    return-void

    .line 668
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setHttpRequestRetryHandler(Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;)V
    .registers 3
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .prologue
    .line 547
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 548
    monitor-exit p0

    return-void

    .line 547
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setKeepAliveStrategy(Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 535
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->keepAliveStrategy:Lcz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 536
    monitor-exit p0

    return-void

    .line 535
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setParams(Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 455
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->defaultParams:Lcz/msebera/android/httpclient/params/HttpParams;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 456
    monitor-exit p0

    return-void

    .line 455
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProxyAuthenticationHandler(Lcz/msebera/android/httpclient/client/AuthenticationHandler;)V
    .registers 3
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 629
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;-><init>(Lcz/msebera/android/httpclient/client/AuthenticationHandler;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 630
    monitor-exit p0

    return-void

    .line 629
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProxyAuthenticationStrategy(Lcz/msebera/android/httpclient/client/AuthenticationStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .prologue
    .line 646
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 647
    monitor-exit p0

    return-void

    .line 646
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRedirectHandler(Lcz/msebera/android/httpclient/client/RedirectHandler;)V
    .registers 3
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/RedirectHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 563
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategyAdaptor;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/impl/client/DefaultRedirectStrategyAdaptor;-><init>(Lcz/msebera/android/httpclient/client/RedirectHandler;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 564
    monitor-exit p0

    return-void

    .line 563
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRedirectStrategy(Lcz/msebera/android/httpclient/client/RedirectStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/client/RedirectStrategy;

    .prologue
    .line 580
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->redirectStrategy:Lcz/msebera/android/httpclient/client/RedirectStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 581
    monitor-exit p0

    return-void

    .line 580
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setReuseStrategy(Lcz/msebera/android/httpclient/ConnectionReuseStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .prologue
    .line 522
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->reuseStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 523
    monitor-exit p0

    return-void

    .line 522
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRoutePlanner(Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;)V
    .registers 3
    .param p1, "routePlanner"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;

    .prologue
    .line 679
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->routePlanner:Lcz/msebera/android/httpclient/conn/routing/HttpRoutePlanner;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 680
    monitor-exit p0

    return-void

    .line 679
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTargetAuthenticationHandler(Lcz/msebera/android/httpclient/client/AuthenticationHandler;)V
    .registers 3
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 596
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/impl/client/AuthenticationStrategyAdaptor;-><init>(Lcz/msebera/android/httpclient/client/AuthenticationHandler;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 597
    monitor-exit p0

    return-void

    .line 596
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTargetAuthenticationStrategy(Lcz/msebera/android/httpclient/client/AuthenticationStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lcz/msebera/android/httpclient/client/AuthenticationStrategy;

    .prologue
    .line 613
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->targetAuthStrategy:Lcz/msebera/android/httpclient/client/AuthenticationStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 614
    monitor-exit p0

    return-void

    .line 613
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUserTokenHandler(Lcz/msebera/android/httpclient/client/UserTokenHandler;)V
    .registers 3
    .param p1, "handler"    # Lcz/msebera/android/httpclient/client/UserTokenHandler;

    .prologue
    .line 690
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/AbstractHttpClient;->userTokenHandler:Lcz/msebera/android/httpclient/client/UserTokenHandler;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 691
    monitor-exit p0

    return-void

    .line 690
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
