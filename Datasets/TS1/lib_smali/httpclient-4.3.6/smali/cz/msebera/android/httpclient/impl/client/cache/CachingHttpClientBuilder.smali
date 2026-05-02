.class public Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
.super Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;
.source "CachingHttpClientBuilder.java"


# instance fields
.field private cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

.field private cacheDir:Ljava/io/File;

.field private httpCacheInvalidator:Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;

.field private resourceFactory:Lcz/msebera/android/httpclient/client/cache/ResourceFactory;

.field private schedulingStrategy:Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

.field private storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 57
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;-><init>()V

    .line 58
    return-void
.end method

.method public static create()Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 1

    .prologue
    .line 53
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;-><init>()V

    return-object v0
.end method

.method private createAsynchronousRevalidator(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    .registers 5
    .param p1, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 134
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v2

    if-lez v2, :cond_13

    .line 135
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->createSchedulingStrategy(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

    move-result-object v0

    .line 136
    .local v0, "configuredSchedulingStrategy":Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;
    new-instance v1, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    invoke-direct {v1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;)V

    .line 138
    .local v1, "revalidator":Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    invoke-virtual {p0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->addCloseable(Ljava/io/Closeable;)V

    .line 141
    .end local v0    # "configuredSchedulingStrategy":Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;
    .end local v1    # "revalidator":Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method private createSchedulingStrategy(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;
    .registers 3
    .param p1, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 146
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    goto :goto_6
.end method


# virtual methods
.method protected decorateMainExec(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .registers 11
    .param p1, "mainExec"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .prologue
    .line 98
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    if-eqz v0, :cond_3d

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 99
    .local v3, "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :goto_6
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->resourceFactory:Lcz/msebera/android/httpclient/client/cache/ResourceFactory;

    .line 100
    .local v1, "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    if-nez v1, :cond_13

    .line 101
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    if-nez v0, :cond_40

    .line 102
    new-instance v1, Lcz/msebera/android/httpclient/impl/client/cache/HeapResourceFactory;

    .end local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    invoke-direct {v1}, Lcz/msebera/android/httpclient/impl/client/cache/HeapResourceFactory;-><init>()V

    .line 107
    .restart local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    :cond_13
    :goto_13
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    .line 108
    .local v2, "storage":Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    if-nez v2, :cond_20

    .line 109
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    if-nez v0, :cond_48

    .line 110
    new-instance v2, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCacheStorage;

    .end local v2    # "storage":Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCacheStorage;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    .line 117
    .restart local v2    # "storage":Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    :cond_20
    :goto_20
    invoke-direct {p0, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->createAsynchronousRevalidator(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    move-result-object v7

    .line 118
    .local v7, "revalidator":Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    new-instance v4, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    invoke-direct {v4}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;-><init>()V

    .line 120
    .local v4, "uriExtractor":Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->httpCacheInvalidator:Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;

    .line 121
    .local v5, "cacheInvalidator":Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;
    if-nez v5, :cond_32

    .line 122
    new-instance v5, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;

    .end local v5    # "cacheInvalidator":Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;
    invoke-direct {v5, v4, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;)V

    .line 125
    .restart local v5    # "cacheInvalidator":Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;
    :cond_32
    new-instance v8, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;

    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;-><init>(Lcz/msebera/android/httpclient/client/cache/ResourceFactory;Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;)V

    invoke-direct {v8, p1, v0, v3, v7}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;)V

    return-object v8

    .line 98
    .end local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    .end local v2    # "storage":Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    .end local v3    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    .end local v4    # "uriExtractor":Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;
    .end local v5    # "cacheInvalidator":Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;
    .end local v7    # "revalidator":Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    :cond_3d
    sget-object v3, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->DEFAULT:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    goto :goto_6

    .line 104
    .restart local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    .restart local v3    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :cond_40
    new-instance v1, Lcz/msebera/android/httpclient/impl/client/cache/FileResourceFactory;

    .end local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    invoke-direct {v1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/FileResourceFactory;-><init>(Ljava/io/File;)V

    .restart local v1    # "resourceFactory":Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    goto :goto_13

    .line 112
    .restart local v2    # "storage":Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    :cond_48
    new-instance v6, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;

    invoke-direct {v6, v3}, Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    .line 113
    .local v6, "managedStorage":Lcz/msebera/android/httpclient/impl/client/cache/ManagedHttpCacheStorage;
    invoke-virtual {p0, v6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->addCloseable(Ljava/io/Closeable;)V

    .line 114
    move-object v2, v6

    goto :goto_20
.end method

.method public final setCacheConfig(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "cacheConfig"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 80
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 81
    return-object p0
.end method

.method public final setCacheDir(Ljava/io/File;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 74
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    .line 75
    return-object p0
.end method

.method public final setHttpCacheInvalidator(Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "cacheInvalidator"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;

    .prologue
    .line 92
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->httpCacheInvalidator:Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;

    .line 93
    return-object p0
.end method

.method public final setHttpCacheStorage(Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "storage"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    .prologue
    .line 68
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    .line 69
    return-object p0
.end method

.method public final setResourceFactory(Lcz/msebera/android/httpclient/client/cache/ResourceFactory;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "resourceFactory"    # Lcz/msebera/android/httpclient/client/cache/ResourceFactory;

    .prologue
    .line 62
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->resourceFactory:Lcz/msebera/android/httpclient/client/cache/ResourceFactory;

    .line 63
    return-object p0
.end method

.method public final setSchedulingStrategy(Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;)Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;
    .registers 2
    .param p1, "schedulingStrategy"    # Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

    .prologue
    .line 86
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lcz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy;

    .line 87
    return-object p0
.end method
