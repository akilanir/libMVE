.class public Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;
.super Ljava/lang/Object;
.source "CachingExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final SUPPORTS_RANGE_AND_CONTENT_RANGE_HEADERS:Z


# instance fields
.field private final asynchRevalidator:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

.field private final backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

.field private final cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

.field private final cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheableRequestPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;

.field private final conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

.field private final responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

.field private final responseCachingPolicy:Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;

.field private final responseCompliance:Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;

.field private final responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

.field private final suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

.field private final validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

.field private final viaHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcz/msebera/android/httpclient/ProtocolVersion;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;)V
    .registers 4
    .param p1, "backend"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .prologue
    .line 160
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;-><init>()V

    sget-object v1, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->DEFAULT:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    invoke-direct {p0, p1, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    .line 161
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/cache/ResourceFactory;Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 6
    .param p1, "backend"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "resourceFactory"    # Lcz/msebera/android/httpclient/client/cache/ResourceFactory;
    .param p3, "storage"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;
    .param p4, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 156
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;

    invoke-direct {v0, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/BasicHttpCache;-><init>(Lcz/msebera/android/httpclient/client/cache/ResourceFactory;Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, p1, v0, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    .line 157
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 5
    .param p1, "backend"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "cache"    # Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;
    .param p3, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;-><init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;)V
    .registers 11
    .param p1, "backend"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "cache"    # Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;
    .param p3, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    .param p4, "asynchRevalidator"    # Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 100
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    .line 118
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 133
    const-string v0, "HTTP backend"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    const-string v0, "HttpCache"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    if-eqz p3, :cond_9c

    .end local p3    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :goto_37
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 136
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .line 137
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    .line 138
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 139
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    .line 140
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;

    .line 141
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 142
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    .line 143
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCompliance:Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;

    .line 144
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isWeakETagOnPutDeleteAllowed()Z

    move-result v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;-><init>(Z)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    .line 145
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 146
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getMaxObjectSize()J

    move-result-wide v1

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v3

    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 147
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isNeverCacheHTTP10ResponsesWithQuery()Z

    move-result v4

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->is303CachingEnabled()Z

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;-><init>(JZZZ)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCachingPolicy:Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;

    .line 148
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->asynchRevalidator:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    .line 149
    return-void

    .line 135
    .restart local p3    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :cond_9c
    sget-object p3, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->DEFAULT:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    goto :goto_37
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;)V
    .registers 15
    .param p1, "backend"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "responseCache"    # Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;
    .param p3, "validityPolicy"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;
    .param p4, "responseCachingPolicy"    # Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;
    .param p5, "responseGenerator"    # Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;
    .param p6, "cacheableRequestPolicy"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;
    .param p7, "suitabilityChecker"    # Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;
    .param p8, "conditionalRequestBuilder"    # Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;
    .param p9, "responseCompliance"    # Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;
    .param p10, "requestCompliance"    # Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;
    .param p11, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    .param p12, "asynchRevalidator"    # Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    .prologue
    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 100
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    .line 118
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 176
    if-eqz p11, :cond_46

    .end local p11    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :goto_2d
    iput-object p11, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 177
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .line 178
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    .line 179
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 180
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCachingPolicy:Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;

    .line 181
    iput-object p5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    .line 182
    iput-object p6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;

    .line 183
    iput-object p7, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 184
    iput-object p8, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    .line 185
    iput-object p9, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCompliance:Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;

    .line 186
    iput-object p10, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    .line 187
    iput-object p12, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->asynchRevalidator:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    .line 188
    return-void

    .line 176
    .restart local p11    # "config":Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;
    :cond_46
    sget-object p11, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->DEFAULT:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    goto :goto_2d
.end method

.method private alreadyHaveNewerCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 11
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "backendResponse"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v5, 0x0

    .line 856
    const/4 v2, 0x0

    .line 858
    .local v2, "existing":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_start_2
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v6, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->getCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_7} :catch_34

    move-result-object v2

    .line 862
    :goto_8
    if-nez v2, :cond_b

    .line 878
    :cond_a
    :goto_a
    return v5

    .line 865
    :cond_b
    const-string v6, "Date"

    invoke-virtual {v2, v6}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 866
    .local v1, "entryDateHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_a

    .line 869
    const-string v6, "Date"

    invoke-interface {p3, v6}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v4

    .line 870
    .local v4, "responseDateHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v4, :cond_a

    .line 873
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 874
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v4}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    .line 875
    .local v3, "responseDate":Ljava/util/Date;
    if-eqz v0, :cond_a

    if-eqz v3, :cond_a

    .line 878
    invoke-virtual {v3, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    goto :goto_a

    .line 859
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v1    # "entryDateHeader":Lcz/msebera/android/httpclient/Header;
    .end local v3    # "responseDate":Ljava/util/Date;
    .end local v4    # "responseDateHeader":Lcz/msebera/android/httpclient/Header;
    :catch_34
    move-exception v6

    goto :goto_8
.end method

.method private explicitFreshnessRequest(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 25
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 485
    const-string v11, "Cache-Control"

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v13

    array-length v14, v13

    const/4 v11, 0x0

    move v12, v11

    :goto_b
    if-ge v12, v14, :cond_7e

    aget-object v6, v13, v12

    .line 486
    .local v6, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v6}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v15

    array-length v0, v15

    move/from16 v16, v0

    const/4 v11, 0x0

    :goto_17
    move/from16 v0, v16

    if-ge v11, v0, :cond_7a

    aget-object v5, v15, v11

    .line 487
    .local v5, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v17, "max-stale"

    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5d

    .line 489
    :try_start_29
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 490
    .local v9, "maxstale":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v3

    .line 491
    .local v3, "age":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    :try_end_4e
    .catch Ljava/lang/NumberFormatException; {:try_start_29 .. :try_end_4e} :catch_5a

    move-result-wide v7

    .line 492
    .local v7, "lifetime":J
    sub-long v17, v3, v7

    int-to-long v0, v9

    move-wide/from16 v19, v0

    cmp-long v17, v17, v19

    if-lez v17, :cond_77

    .line 493
    const/4 v11, 0x1

    .line 504
    .end local v3    # "age":J
    .end local v5    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v6    # "h":Lcz/msebera/android/httpclient/Header;
    .end local v7    # "lifetime":J
    .end local v9    # "maxstale":I
    :goto_59
    return v11

    .line 495
    .restart local v5    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v6    # "h":Lcz/msebera/android/httpclient/Header;
    :catch_5a
    move-exception v10

    .line 496
    .local v10, "nfe":Ljava/lang/NumberFormatException;
    const/4 v11, 0x1

    goto :goto_59

    .line 498
    .end local v10    # "nfe":Ljava/lang/NumberFormatException;
    :cond_5d
    const-string v17, "min-fresh"

    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_75

    const-string v17, "max-age"

    .line 499
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_77

    .line 500
    :cond_75
    const/4 v11, 0x1

    goto :goto_59

    .line 486
    :cond_77
    add-int/lit8 v11, v11, 0x1

    goto :goto_17

    .line 485
    .end local v5    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_7a
    add-int/lit8 v11, v12, 0x1

    move v12, v11

    goto :goto_b

    .line 504
    .end local v6    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_7e
    const/4 v11, 0x0

    goto :goto_59
.end method

.method private flushEntriesInvalidatedByRequest(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V
    .registers 6
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .prologue
    .line 410
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 414
    :goto_5
    return-void

    .line 411
    :catch_6
    move-exception v0

    .line 412
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Unable to flush invalidated entries from cache"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method private generateCachedResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 10
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .param p3, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 419
    const-string v1, "If-None-Match"

    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    const-string v1, "If-Modified-Since"

    .line 420
    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 421
    :cond_10
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 425
    .local v0, "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :goto_16
    sget-object v1, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_HIT:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 426
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v1, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_2e

    .line 427
    const-string v1, "Warning"

    const-string v2, "110 localhost \"Response is stale\""

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    :cond_2e
    return-object v0

    .line 423
    .end local v0    # "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :cond_2f
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .restart local v0    # "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    goto :goto_16
.end method

.method private generateGatewayTimeout(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 6
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 446
    sget-object v0, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 447
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHttpResponse;

    sget-object v1, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v2, 0x1f8

    const-string v3, "Gateway Timeout"

    invoke-direct {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/message/BasicHttpResponse;-><init>(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V

    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method private generateViaHeader(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/lang/String;
    .registers 14
    .param p1, "msg"    # Lcz/msebera/android/httpclient/HttpMessage;

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 509
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpMessage;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v1

    .line 510
    .local v1, "pv":Lcz/msebera/android/httpclient/ProtocolVersion;
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 511
    .local v0, "existingEntry":Ljava/lang/String;
    if-eqz v0, :cond_13

    .line 528
    .end local v0    # "existingEntry":Ljava/lang/String;
    :goto_12
    return-object v0

    .line 515
    .restart local v0    # "existingEntry":Ljava/lang/String;
    :cond_13
    const-string v5, "cz.msebera.android.httpclient.client"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-static {v5, v6}, Lcz/msebera/android/httpclient/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lcz/msebera/android/httpclient/util/VersionInfo;

    move-result-object v4

    .line 516
    .local v4, "vi":Lcz/msebera/android/httpclient/util/VersionInfo;
    if-eqz v4, :cond_58

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v2

    .line 519
    .local v2, "release":Ljava/lang/String;
    :goto_27
    const-string v5, "http"

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 520
    const-string v5, "%d.%d localhost (Apache-HttpClient/%s (cache))"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMajor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMinor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    aput-object v2, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 526
    .local v3, "value":Ljava/lang/String;
    :goto_51
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v3

    .line 528
    goto :goto_12

    .line 516
    .end local v2    # "release":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_58
    const-string v2, "UNAVAILABLE"

    goto :goto_27

    .line 523
    .restart local v2    # "release":Ljava/lang/String;
    :cond_5b
    const-string v5, "%s/%d.%d localhost (Apache-HttpClient/%s (cache))"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMajor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    .line 524
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/ProtocolVersion;->getMinor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v2, v6, v11

    .line 523
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/String;
    goto :goto_51
.end method

.method private getExistingCacheVariants(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Ljava/util/Map;
    .registers 7
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcz/msebera/android/httpclient/impl/client/cache/Variant;",
            ">;"
        }
    .end annotation

    .prologue
    .line 376
    const/4 v1, 0x0

    .line 378
    .local v1, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/impl/client/cache/Variant;>;"
    :try_start_1
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->getVariantCacheEntriesWithEtags(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/util/Map;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v1

    .line 382
    :goto_7
    return-object v1

    .line 379
    :catch_8
    move-exception v0

    .line 380
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v3, "Unable to retrieve variant entries from cache"

    invoke-virtual {v2, v3, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private getFatallyNoncompliantResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 8
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 363
    const/4 v2, 0x0

    .line 364
    .local v2, "fatalErrorResponse":Lcz/msebera/android/httpclient/HttpResponse;
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v3, p1}, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;->requestIsFatallyNonCompliant(Lcz/msebera/android/httpclient/HttpRequest;)Ljava/util/List;

    move-result-object v1

    .line 366
    .local v1, "fatalError":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolError;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolError;

    .line 367
    .local v0, "error":Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolError;
    sget-object v4, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 368
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;->getErrorForRequest(Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolError;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v2

    .line 369
    goto :goto_b

    .line 370
    .end local v0    # "error":Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolError;
    :cond_23
    return-object v2
.end method

.method private getUpdatedVariantEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;Lcz/msebera/android/httpclient/impl/client/cache/Variant;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .registers 18
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "conditionalRequest"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "requestDate"    # Ljava/util/Date;
    .param p4, "responseDate"    # Ljava/util/Date;
    .param p5, "backendResponse"    # Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .param p6, "matchingVariant"    # Lcz/msebera/android/httpclient/impl/client/cache/Variant;
    .param p7, "matchedEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 703
    move-object/from16 v9, p7

    .line 705
    .local v9, "responseEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_start_2
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    .line 706
    invoke-virtual/range {p6 .. p6}, Lcz/msebera/android/httpclient/impl/client/cache/Variant;->getCacheKey()Ljava/lang/String;

    move-result-object v7

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p7

    move-object v4, p5

    move-object v5, p3

    move-object v6, p4

    .line 705
    invoke-interface/range {v0 .. v7}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->updateVariantCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Lcz/msebera/android/httpclient/HttpResponse;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_12} :catch_17
    .catchall {:try_start_2 .. :try_end_12} :catchall_23

    move-result-object v9

    .line 710
    invoke-interface {p5}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 712
    :goto_16
    return-object v9

    .line 707
    :catch_17
    move-exception v8

    .line 708
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_18
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Could not update cache entry"

    invoke-virtual {v0, v1, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_1f
    .catchall {:try_start_18 .. :try_end_1f} :catchall_23

    .line 710
    invoke-interface {p5}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    goto :goto_16

    .end local v8    # "ioe":Ljava/io/IOException;
    :catchall_23
    move-exception v0

    invoke-interface {p5}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    throw v0
.end method

.method private handleCacheHit(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 15
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p5, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 277
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v8

    .line 278
    .local v8, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-direct {p0, v8, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->recordCacheHit(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V

    .line 279
    const/4 v7, 0x0

    .line 280
    .local v7, "out":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v6

    .line 281
    .local v6, "now":Ljava/util/Date;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, v8, p2, p5, v6}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->canCachedResponseBeUsed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 282
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Cache hit"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 283
    invoke-direct {p0, p2, p3, p5, v6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateCachedResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v7

    .line 295
    :goto_1f
    const-string v0, "http.route"

    invoke-virtual {p3, v0, p1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 296
    const-string v0, "http.target_host"

    invoke-virtual {p3, v0, v8}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    const-string v0, "http.request"

    invoke-virtual {p3, v0, p2}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 298
    const-string v0, "http.response"

    invoke-virtual {p3, v0, v7}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    const-string v0, "http.request_sent"

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p3, v0, v1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v7

    .line 300
    :goto_3b
    return-object v0

    .line 284
    :cond_3c
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->mayCallBackend(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Z

    move-result v0

    if-nez v0, :cond_4e

    .line 285
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Cache entry not suitable but only-if-cached requested"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 286
    invoke-direct {p0, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateGatewayTimeout(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v7

    goto :goto_1f

    .line 287
    :cond_4e
    invoke-virtual {p5}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_5e

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 288
    invoke-virtual {v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 289
    :cond_5e
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Revalidating cache entry"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 290
    invoke-direct/range {v0 .. v6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->revalidateCacheEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_3b

    .line 292
    :cond_70
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Cache entry not usable; calling backend"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 293
    invoke-virtual {p0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_3b
.end method

.method private handleCacheMiss(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 12
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
    .line 331
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v6

    .line 332
    .local v6, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-direct {p0, v6, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->recordCacheMiss(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V

    .line 334
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->mayCallBackend(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 335
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHttpResponse;

    sget-object v1, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v2, 0x1f8

    const-string v3, "Gateway Timeout"

    invoke-direct {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/message/BasicHttpResponse;-><init>(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V

    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 346
    :goto_1c
    return-object v0

    .line 340
    :cond_1d
    invoke-direct {p0, v6, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getExistingCacheVariants(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Ljava/util/Map;

    move-result-object v5

    .line 341
    .local v5, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/impl/client/cache/Variant;>;"
    if-eqz v5, :cond_33

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_33

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 342
    invoke-virtual/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->negotiateResponseFromVariants(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Map;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_1c

    .line 346
    :cond_33
    invoke-virtual {p0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_1c
.end method

.method private handleRevalidationFailure(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .param p3, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 437
    invoke-direct {p0, p1, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 438
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateGatewayTimeout(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 440
    :goto_a
    return-object v0

    :cond_b
    invoke-direct {p0, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->unvalidatedCacheHit(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_a
.end method

.method private mayCallBackend(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Z
    .registers 13
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .prologue
    const/4 v2, 0x0

    .line 470
    const-string v3, "Cache-Control"

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    array-length v6, v5

    move v4, v2

    :goto_9
    if-ge v4, v6, :cond_32

    aget-object v1, v5, v4

    .line 471
    .local v1, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v7

    array-length v8, v7

    move v3, v2

    :goto_13
    if-ge v3, v8, :cond_2e

    aget-object v0, v7, v3

    .line 472
    .local v0, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v9, "only-if-cached"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2b

    .line 473
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v4, "Request marked only-if-cached"

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 478
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :goto_2a
    return v2

    .line 471
    .restart local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 470
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_2e
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_9

    .line 478
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_32
    const/4 v2, 0x1

    goto :goto_2a
.end method

.method private recordCacheHit(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V
    .registers 7
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .prologue
    .line 394
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 395
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 396
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    .line 397
    .local v0, "rl":Lcz/msebera/android/httpclient/RequestLine;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cache hit [host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 399
    .end local v0    # "rl":Lcz/msebera/android/httpclient/RequestLine;
    :cond_3d
    return-void
.end method

.method private recordCacheMiss(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V
    .registers 7
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .prologue
    .line 386
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 387
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 388
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    .line 389
    .local v0, "rl":Lcz/msebera/android/httpclient/RequestLine;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cache miss [host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 391
    .end local v0    # "rl":Lcz/msebera/android/httpclient/RequestLine;
    :cond_3d
    return-void
.end method

.method private recordCacheUpdate(Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 3
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 402
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 403
    sget-object v0, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->VALIDATED:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 404
    return-void
.end method

.method private retryRequestUnconditionally(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 8
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p5, "matchedEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 690
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    .line 691
    invoke-virtual {v1, p2, p5}, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    move-result-object v0

    .line 692
    .local v0, "unconditional":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    invoke-virtual {p0, p1, v0, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v1

    return-object v1
.end method

.method private revalidateCacheEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 16
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p5, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p6, "now"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 312
    :try_start_0
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->asynchRevalidator:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    if-eqz v0, :cond_29

    .line 313
    invoke-direct {p0, p2, p5, p6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 314
    invoke-virtual {v0, p5, p6}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mayReturnStaleWhileRevalidating(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 315
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Serving stale with asynchronous revalidation"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 316
    invoke-direct {p0, p2, p3, p5, p6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateCachedResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 317
    .local v8, "resp":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->asynchRevalidator:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;->revalidateCacheEntry(Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)V

    .line 322
    .end local v8    # "resp":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :goto_28
    return-object v8

    .line 320
    :cond_29
    invoke-virtual/range {p0 .. p5}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->revalidateCacheEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_2c} :catch_2e

    move-result-object v8

    goto :goto_28

    .line 321
    :catch_2e
    move-exception v7

    .line 322
    .local v7, "ioex":Ljava/io/IOException;
    invoke-direct {p0, p2, p3, p5, p6}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleRevalidationFailure(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v8

    goto :goto_28
.end method

.method private revalidationResponseIsTooOld(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 9
    .param p1, "backendResponse"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "cacheEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const/4 v4, 0x0

    .line 594
    const-string v5, "Date"

    invoke-virtual {p2, v5}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 595
    .local v1, "entryDateHeader":Lcz/msebera/android/httpclient/Header;
    const-string v5, "Date"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 596
    .local v3, "responseDateHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_25

    if-eqz v3, :cond_25

    .line 597
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 598
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 599
    .local v2, "respDate":Ljava/util/Date;
    if-eqz v0, :cond_25

    if-nez v2, :cond_26

    .line 610
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v2    # "respDate":Ljava/util/Date;
    :cond_25
    :goto_25
    return v4

    .line 606
    .restart local v0    # "entryDate":Ljava/util/Date;
    .restart local v2    # "respDate":Ljava/util/Date;
    :cond_26
    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 607
    const/4 v4, 0x1

    goto :goto_25
.end method

.method private satisfyFromCache(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .registers 7
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .prologue
    .line 351
    const/4 v0, 0x0

    .line 353
    .local v0, "entry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_start_1
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->getCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v0

    .line 357
    :goto_7
    return-object v0

    .line 354
    :catch_8
    move-exception v1

    .line 355
    .local v1, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v3, "Unable to retrieve entries from cache"

    invoke-virtual {v2, v3, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V
    .registers 4
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .param p2, "value"    # Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    .prologue
    .line 532
    if-eqz p1, :cond_7

    .line 533
    const-string v0, "http.cache.response.status"

    invoke-interface {p1, v0, p2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 535
    :cond_7
    return-void
.end method

.method private shouldSendNotModifiedResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "responseEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 729
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 730
    invoke-virtual {v0, p1, p2, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private staleIfErrorAppliesTo(I)Z
    .registers 3
    .param p1, "statusCode"    # I

    .prologue
    .line 800
    const/16 v0, 0x1f4

    if-eq p1, v0, :cond_10

    const/16 v0, 0x1f6

    if-eq p1, v0, :cond_10

    const/16 v0, 0x1f7

    if-eq p1, v0, :cond_10

    const/16 v0, 0x1f8

    if-ne p1, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private staleResponseNotAllowed(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 464
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mustRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheConfig:Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .line 465
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->proxyRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 466
    :cond_18
    invoke-direct {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->explicitFreshnessRequest(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method private storeRequestIfModifiedSinceFor304Response(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "backendResponse"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 846
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x130

    if-ne v1, v2, :cond_1d

    .line 847
    const-string v1, "If-Modified-Since"

    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 848
    .local v0, "h":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_1d

    .line 849
    const-string v1, "Last-Modified"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    .end local v0    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_1d
    return-void
.end method

.method private tryToUpdateVariantMap(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/impl/client/cache/Variant;)V
    .registers 7
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "matchingVariant"    # Lcz/msebera/android/httpclient/impl/client/cache/Variant;

    .prologue
    .line 720
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->reuseVariantEntryFor(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/impl/client/cache/Variant;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 724
    :goto_5
    return-void

    .line 721
    :catch_6
    move-exception v0

    .line 722
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Could not update cache entry to reuse variant"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method private unvalidatedCacheHit(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 6
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 454
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 455
    .local v0, "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    sget-object v1, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_HIT:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 456
    const-string v1, "Warning"

    const-string v2, "111 localhost \"Revalidation failed\""

    invoke-interface {v0, v1, v2}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    return-object v0
.end method


# virtual methods
.method callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 14
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
    .line 575
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v5

    .line 577
    .local v5, "requestDate":Ljava/util/Date;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Calling the backend"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 578
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    invoke-interface {v0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v7

    .line 580
    .local v7, "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_11
    const-string v0, "Via"

    invoke-direct {p0, v7}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateViaHeader(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7, v0, v1}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 581
    invoke-virtual/range {v0 .. v7}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleBackendResponse(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_26} :catch_28
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_26} :catch_2d

    move-result-object v0

    return-object v0

    .line 583
    :catch_28
    move-exception v8

    .line 584
    .local v8, "ex":Ljava/io/IOException;
    invoke-interface {v7}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 585
    throw v8

    .line 586
    .end local v8    # "ex":Ljava/io/IOException;
    :catch_2d
    move-exception v8

    .line 587
    .local v8, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v7}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 588
    throw v8
.end method

.method clientRequestsOurOptions(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    const/4 v1, 0x0

    .line 552
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    .line 554
    .local v0, "line":Lcz/msebera/android/httpclient/RequestLine;
    const-string v2, "OPTIONS"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 566
    :cond_11
    :goto_11
    return v1

    .line 558
    :cond_12
    const-string v2, "*"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 562
    const-string v2, "0"

    const-string v3, "Max-Forwards"

    invoke-interface {p1, v3}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 566
    const/4 v1, 0x1

    goto :goto_11
.end method

.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 5
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-static {}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->create()Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 5
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 227
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 14
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
    .line 236
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v7

    .line 237
    .local v7, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateViaHeader(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/lang/String;

    move-result-object v8

    .line 240
    .local v8, "via":Ljava/lang/String;
    sget-object v0, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_MISS:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 242
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->clientRequestsOurOptions(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 243
    sget-object v0, Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->setResponseStatus(Lcz/msebera/android/httpclient/protocol/HttpContext;Lcz/msebera/android/httpclient/client/cache/CacheResponseStatus;)V

    .line 244
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;-><init>()V

    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 267
    :goto_25
    return-object v0

    .line 247
    :cond_26
    invoke-direct {p0, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getFatallyNoncompliantResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v6

    .line 248
    .local v6, "fatalErrorResponse":Lcz/msebera/android/httpclient/HttpResponse;
    if-eqz v6, :cond_31

    .line 249
    invoke-static {v6}, Lcz/msebera/android/httpclient/impl/client/cache/Proxies;->enhanceResponse(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_25

    .line 252
    :cond_31
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->requestCompliance:Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance;->makeRequestCompliant(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V

    .line 253
    const-string v0, "Via"

    invoke-virtual {p2, v0, v8}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->flushEntriesInvalidatedByRequest(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)V

    .line 257
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;

    invoke-virtual {v0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheableRequestPolicy;->isServableFromCache(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-nez v0, :cond_56

    .line 258
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Request is not servable from cache"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 259
    invoke-virtual {p0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_25

    .line 262
    :cond_56
    invoke-direct {p0, v7, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->satisfyFromCache(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v5

    .line 263
    .local v5, "entry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    if-nez v5, :cond_68

    .line 264
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Cache miss"

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 265
    invoke-direct {p0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleCacheMiss(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_25

    :cond_68
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 267
    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleCacheHit(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_25
.end method

.method public getCacheHits()J
    .registers 3

    .prologue
    .line 196
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheMisses()J
    .registers 3

    .prologue
    .line 205
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheUpdates()J
    .registers 3

    .prologue
    .line 214
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getCurrentDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 548
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method handleBackendResponse(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 16
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p5, "requestDate"    # Ljava/util/Date;
    .param p6, "responseDate"    # Ljava/util/Date;
    .param p7, "backendResponse"    # Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 815
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Handling Backend response"

    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 816
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCompliance:Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;

    invoke-virtual {v0, p2, p7}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->ensureProtocolCompliance(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 818
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    .line 819
    .local v1, "target":Lcz/msebera/android/httpclient/HttpHost;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCachingPolicy:Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;

    invoke-virtual {v0, p2, p7}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseCachingPolicy;->isResponseCacheable(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v6

    .line 820
    .local v6, "cacheable":Z
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v0, v1, p2, p7}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 821
    if-eqz v6, :cond_31

    invoke-direct {p0, v1, p2, p7}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->alreadyHaveNewerCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 822
    invoke-direct {p0, p2, p7}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->storeRequestIfModifiedSinceFor304Response(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 823
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    move-object v2, p2

    move-object v3, p7

    move-object v4, p5

    move-object v5, p6

    invoke-interface/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->cacheAndReturnResponse(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;Ljava/util/Date;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object p7

    .line 833
    .end local p7    # "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :cond_30
    :goto_30
    return-object p7

    .line 826
    .restart local p7    # "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :cond_31
    if-nez v6, :cond_30

    .line 828
    :try_start_33
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    invoke-interface {v0, v1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->flushCacheEntriesFor(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_39

    goto :goto_30

    .line 829
    :catch_39
    move-exception v7

    .line 830
    .local v7, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Unable to flush invalid cache entries"

    invoke-virtual {v0, v2, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_30
.end method

.method negotiateResponseFromVariants(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Map;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 28
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;",
            "Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;",
            "Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcz/msebera/android/httpclient/impl/client/cache/Variant;",
            ">;)",
            "Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 619
    .local p5, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcz/msebera/android/httpclient/impl/client/cache/Variant;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    .line 620
    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v3, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequestFromVariants(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Ljava/util/Map;)Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    move-result-object v7

    .line 622
    .local v7, "conditionalRequest":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v8

    .line 623
    .local v8, "requestDate":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-interface {v3, v0, v7, v1, v2}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v10

    .line 626
    .local v10, "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_1e
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 628
    .local v9, "responseDate":Ljava/util/Date;
    const-string v3, "Via"

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateViaHeader(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v10, v3, v4}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0x130

    if-eq v3, v4, :cond_48

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    .line 631
    invoke-virtual/range {v3 .. v10}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleBackendResponse(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    .end local v7    # "conditionalRequest":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    move-result-object v18

    .line 674
    :cond_47
    :goto_47
    return-object v18

    .line 636
    .restart local v7    # "conditionalRequest":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    :cond_48
    const-string v3, "ETag"

    invoke-interface {v10, v3}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v21

    .line 637
    .local v21, "resultEtagHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v21, :cond_68

    .line 638
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v4, "304 response did not contain ETag"

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;)V

    .line 639
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 640
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 641
    invoke-virtual/range {p0 .. p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v18

    goto :goto_47

    .line 644
    :cond_68
    invoke-interface/range {v21 .. v21}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v20

    .line 645
    .local v20, "resultEtag":Ljava/lang/String;
    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcz/msebera/android/httpclient/impl/client/cache/Variant;

    .line 646
    .local v11, "matchingVariant":Lcz/msebera/android/httpclient/impl/client/cache/Variant;
    if-nez v11, :cond_90

    .line 647
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v4, "304 response did not contain ETag matching one sent in If-None-Match"

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 648
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 649
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 650
    invoke-virtual/range {p0 .. p4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->callBackend(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v18

    goto :goto_47

    .line 653
    :cond_90
    invoke-virtual {v11}, Lcz/msebera/android/httpclient/impl/client/cache/Variant;->getEntry()Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v16

    .line 655
    .local v16, "matchedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v10, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->revalidationResponseIsTooOld(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v3

    if-eqz v3, :cond_b7

    .line 656
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 657
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    .line 658
    invoke-direct/range {v11 .. v16}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->retryRequestUnconditionally(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    .end local v11    # "matchingVariant":Lcz/msebera/android/httpclient/impl/client/cache/Variant;
    move-result-object v18

    goto :goto_47

    .line 661
    .restart local v11    # "matchingVariant":Lcz/msebera/android/httpclient/impl/client/cache/Variant;
    :cond_b7
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->recordCacheUpdate(Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 664
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v6

    move-object/from16 v5, p0

    move-object/from16 v12, v16

    .line 663
    invoke-direct/range {v5 .. v12}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getUpdatedVariantEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;Lcz/msebera/android/httpclient/impl/client/cache/Variant;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v19

    .line 666
    .local v19, "responseEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 668
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v18

    .line 669
    .local v18, "resp":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v3, v1, v11}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->tryToUpdateVariantMap(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/impl/client/cache/Variant;)V

    .line 671
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->shouldSendNotModifiedResponse(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 672
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_f7
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_f7} :catch_fa
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_f7} :catch_ff

    move-result-object v18

    goto/16 :goto_47

    .line 675
    .end local v7    # "conditionalRequest":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .end local v9    # "responseDate":Ljava/util/Date;
    .end local v11    # "matchingVariant":Lcz/msebera/android/httpclient/impl/client/cache/Variant;
    .end local v16    # "matchedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .end local v18    # "resp":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v19    # "responseEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .end local v20    # "resultEtag":Ljava/lang/String;
    .end local v21    # "resultEtagHeader":Lcz/msebera/android/httpclient/Header;
    :catch_fa
    move-exception v17

    .line 676
    .local v17, "ex":Ljava/io/IOException;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 677
    throw v17

    .line 678
    .end local v17    # "ex":Ljava/io/IOException;
    :catch_ff
    move-exception v17

    .line 679
    .local v17, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v10}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 680
    throw v17
.end method

.method revalidateCacheEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 31
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p5, "cacheEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 740
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequest(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    move-result-object v13

    .line 741
    .local v13, "conditionalRequest":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v24

    .line 742
    .local v24, "uri":Ljava/net/URI;
    if-eqz v24, :cond_1d

    .line 744
    :try_start_12
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/InternalURIUtils;->rewriteURIForRoute(Ljava/net/URI;Lcz/msebera/android/httpclient/conn/routing/RouteInfo;)Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v13, v4}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V
    :try_end_1d
    .catch Ljava/net/URISyntaxException; {:try_start_12 .. :try_end_1d} :catch_ca

    .line 750
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 751
    .local v9, "requestDate":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-interface {v4, v0, v13, v1, v2}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 753
    .local v8, "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v10

    .line 755
    .local v10, "responseDate":Ljava/util/Date;
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v8, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->revalidationResponseIsTooOld(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_64

    .line 756
    invoke-interface {v8}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 757
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;

    .line 758
    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    move-result-object v22

    .line 759
    .local v22, "unconditional":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 760
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->backend:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-interface {v4, v0, v1, v2, v3}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 761
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v10

    .line 764
    .end local v22    # "unconditional":Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    :cond_64
    const-string v4, "Via"

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->generateViaHeader(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v8, v4, v5}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    invoke-interface {v8}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v21

    .line 767
    .local v21, "statusCode":I
    const/16 v4, 0x130

    move/from16 v0, v21

    if-eq v0, v4, :cond_83

    const/16 v4, 0xc8

    move/from16 v0, v21

    if-ne v0, v4, :cond_8a

    .line 768
    :cond_83
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->recordCacheUpdate(Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 771
    :cond_8a
    const/16 v4, 0x130

    move/from16 v0, v21

    if-ne v0, v4, :cond_f3

    .line 772
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseCache:Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;

    .line 773
    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v5

    move-object/from16 v6, p2

    move-object/from16 v7, p5

    .line 772
    invoke-interface/range {v4 .. v10}, Lcz/msebera/android/httpclient/impl/client/cache/HttpCache;->updateCacheEntry(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Lcz/msebera/android/httpclient/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v23

    .line 775
    .local v23, "updatedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v4

    if-eqz v4, :cond_e8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->suitabilityChecker:Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    .line 776
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v4, v0, v1, v5}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_e8

    .line 777
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    .line 778
    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v19

    .line 794
    .end local v23    # "updatedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :goto_c9
    return-object v19

    .line 745
    .end local v8    # "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v9    # "requestDate":Ljava/util/Date;
    .end local v10    # "responseDate":Ljava/util/Date;
    .end local v21    # "statusCode":I
    :catch_ca
    move-exception v20

    .line 746
    .local v20, "ex":Ljava/net/URISyntaxException;
    new-instance v4, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid URI: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-direct {v4, v5, v0}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 780
    .end local v20    # "ex":Ljava/net/URISyntaxException;
    .restart local v8    # "backendResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .restart local v9    # "requestDate":Ljava/util/Date;
    .restart local v10    # "responseDate":Ljava/util/Date;
    .restart local v21    # "statusCode":I
    .restart local v23    # "updatedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :cond_e8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v19

    goto :goto_c9

    .line 783
    .end local v23    # "updatedEntry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :cond_f3
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->staleIfErrorAppliesTo(I)Z

    move-result v4

    if-eqz v4, :cond_137

    .line 784
    invoke-virtual/range {p0 .. p0}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2, v4}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-nez v4, :cond_137

    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->validityPolicy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 785
    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1, v10}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_137

    .line 787
    :try_start_11b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->responseGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v19

    .line 788
    .local v19, "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    const-string v4, "Warning"

    const-string v5, "110 localhost \"Response is stale\""

    move-object/from16 v0, v19

    invoke-interface {v0, v4, v5}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12e
    .catchall {:try_start_11b .. :try_end_12e} :catchall_132

    .line 791
    invoke-interface {v8}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    goto :goto_c9

    .end local v19    # "cachedResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :catchall_132
    move-exception v4

    invoke-interface {v8}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    throw v4

    :cond_137
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, v9

    move-object/from16 v17, v10

    move-object/from16 v18, v8

    .line 794
    invoke-virtual/range {v11 .. v18}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->handleBackendResponse(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v19

    goto :goto_c9
.end method

.method public supportsRangeAndContentRangeHeaders()Z
    .registers 2

    .prologue
    .line 544
    const/4 v0, 0x0

    return v0
.end method
