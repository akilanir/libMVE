.class Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;
.super Ljava/lang/Object;
.source "CachedResponseSuitabilityChecker.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final heuristicCoefficient:F

.field private final heuristicDefaultLifetime:J

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final sharedCache:Z

.field private final useHeuristicCaching:Z

.field private final validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 3
    .param p1, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 71
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;-><init>()V

    invoke-direct {p0, v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;-><init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V

    .line 72
    return-void
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;)V
    .registers 5
    .param p1, "validityStrategy"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;
    .param p2, "config"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 63
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    .line 64
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->sharedCache:Z

    .line 65
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->isHeuristicCachingEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->useHeuristicCaching:Z

    .line 66
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getHeuristicCoefficient()F

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicCoefficient:F

    .line 67
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheConfig;->getHeuristicDefaultLifetime()J

    move-result-wide v0

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicDefaultLifetime:J

    .line 68
    return-void
.end method

.method private etagValidatorMatches(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 16
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const/4 v6, 0x0

    .line 293
    const-string v7, "ETag"

    invoke-virtual {p2, v7}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 294
    .local v2, "etagHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v2, :cond_3b

    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 295
    .local v1, "etag":Ljava/lang/String;
    :goto_d
    const-string v7, "If-None-Match"

    invoke-interface {p1, v7}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v4

    .line 296
    .local v4, "ifNoneMatch":[Lcz/msebera/android/httpclient/Header;
    if-eqz v4, :cond_3a

    .line 297
    array-length v9, v4

    move v8, v6

    :goto_17
    if-ge v8, v9, :cond_3a

    aget-object v3, v4, v8

    .line 298
    .local v3, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v10

    array-length v11, v10

    move v7, v6

    :goto_21
    if-ge v7, v11, :cond_40

    aget-object v0, v10, v7

    .line 299
    .local v0, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 300
    .local v5, "reqEtag":Ljava/lang/String;
    const-string v12, "*"

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_33

    if-nez v1, :cond_39

    .line 301
    :cond_33
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3d

    .line 302
    :cond_39
    const/4 v6, 0x1

    .line 307
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v3    # "h":Lcz/msebera/android/httpclient/Header;
    .end local v5    # "reqEtag":Ljava/lang/String;
    :cond_3a
    return v6

    .line 294
    .end local v1    # "etag":Ljava/lang/String;
    .end local v4    # "ifNoneMatch":[Lcz/msebera/android/httpclient/Header;
    :cond_3b
    const/4 v1, 0x0

    goto :goto_d

    .line 298
    .restart local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v1    # "etag":Ljava/lang/String;
    .restart local v3    # "h":Lcz/msebera/android/httpclient/Header;
    .restart local v4    # "ifNoneMatch":[Lcz/msebera/android/httpclient/Header;
    .restart local v5    # "reqEtag":Ljava/lang/String;
    :cond_3d
    add-int/lit8 v7, v7, 0x1

    goto :goto_21

    .line 297
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v5    # "reqEtag":Ljava/lang/String;
    :cond_40
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    goto :goto_17
.end method

.method private getMaxStale(Lcz/msebera/android/httpclient/HttpRequest;)J
    .registers 18
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 104
    const-wide/16 v3, -0x1

    .line 105
    .local v3, "maxstale":J
    const-string v8, "Cache-Control"

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v10

    array-length v11, v10

    const/4 v8, 0x0

    move v9, v8

    :goto_d
    if-ge v9, v11, :cond_6f

    aget-object v2, v10, v9

    .line 106
    .local v2, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v12

    array-length v13, v12

    const/4 v8, 0x0

    :goto_17
    if-ge v8, v13, :cond_6b

    aget-object v1, v12, v8

    .line 107
    .local v1, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v14, "max-stale"

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_48

    .line 108
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_3d

    const-string v14, ""

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4b

    :cond_3d
    const-wide/16 v14, -0x1

    cmp-long v14, v3, v14

    if-nez v14, :cond_4b

    .line 110
    const-wide v3, 0x7fffffffffffffffL

    .line 106
    :cond_48
    :goto_48
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 113
    :cond_4b
    :try_start_4b
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_52
    .catch Ljava/lang/NumberFormatException; {:try_start_4b .. :try_end_52} :catch_67

    move-result-wide v6

    .line 114
    .local v6, "val":J
    const-wide/16 v14, 0x0

    cmp-long v14, v6, v14

    if-gez v14, :cond_5b

    .line 115
    const-wide/16 v6, 0x0

    .line 117
    :cond_5b
    const-wide/16 v14, -0x1

    cmp-long v14, v3, v14

    if-eqz v14, :cond_65

    cmp-long v14, v6, v3

    if-gez v14, :cond_48

    .line 118
    :cond_65
    move-wide v3, v6

    goto :goto_48

    .line 120
    .end local v6    # "val":J
    :catch_67
    move-exception v5

    .line 122
    .local v5, "nfe":Ljava/lang/NumberFormatException;
    const-wide/16 v3, 0x0

    goto :goto_48

    .line 105
    .end local v1    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v5    # "nfe":Ljava/lang/NumberFormatException;
    :cond_6b
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_d

    .line 128
    .end local v2    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_6f
    return-wide v3
.end method

.method private hasSupportedEtagValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 279
    const-string v0, "If-None-Match"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasSupportedLastModifiedValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 283
    const-string v0, "If-Modified-Since"

    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasValidDateField(Lcz/msebera/android/httpclient/HttpRequest;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasUnsupportedConditionalHeaders(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 273
    const-string v0, "If-Range"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_18

    const-string v0, "If-Match"

    .line 274
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_18

    const-string v0, "If-Unmodified-Since"

    .line 275
    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasValidDateField(Lcz/msebera/android/httpclient/HttpRequest;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private hasValidDateField(Lcz/msebera/android/httpclient/HttpRequest;Ljava/lang/String;)Z
    .registers 8
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "headerName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 340
    invoke-interface {p1, p2}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    array-length v4, v3

    if-ge v2, v4, :cond_15

    aget-object v1, v3, v2

    .line 341
    .local v1, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 342
    .local v0, "date":Ljava/util/Date;
    if-eqz v0, :cond_15

    const/4 v2, 0x1

    .line 344
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_15
    return v2
.end method

.method private isFreshEnough(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Lcz/msebera/android/httpclient/HttpRequest;Ljava/util/Date;)Z
    .registers 14
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 75
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p1, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->isResponseFresh(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 89
    :cond_a
    :goto_a
    return v8

    .line 78
    :cond_b
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->useHeuristicCaching:Z

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    iget v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicCoefficient:F

    iget-wide v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicDefaultLifetime:J

    move-object v1, p1

    move-object v2, p3

    .line 79
    invoke-virtual/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->isResponseHeuristicallyFresh(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;FJ)Z

    move-result v0

    if-nez v0, :cond_a

    .line 82
    :cond_1d
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->originInsistsOnFreshness(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-eqz v0, :cond_25

    move v8, v9

    .line 83
    goto :goto_a

    .line 85
    :cond_25
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->getMaxStale(Lcz/msebera/android/httpclient/HttpRequest;)J

    move-result-wide v6

    .line 86
    .local v6, "maxstale":J
    const-wide/16 v0, -0x1

    cmp-long v0, v6, v0

    if-nez v0, :cond_31

    move v8, v9

    .line 87
    goto :goto_a

    .line 89
    :cond_31
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p1, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    cmp-long v0, v6, v0

    if-lez v0, :cond_3e

    move v0, v8

    :goto_3c
    move v8, v0

    goto :goto_a

    :cond_3e
    move v0, v9

    goto :goto_3c
.end method

.method private lastModifiedValidatorMatches(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 13
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v4, 0x0

    .line 319
    const-string v5, "Last-Modified"

    invoke-virtual {p2, v5}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 320
    .local v3, "lastModifiedHeader":Lcz/msebera/android/httpclient/Header;
    const/4 v2, 0x0

    .line 321
    .local v2, "lastModified":Ljava/util/Date;
    if-eqz v3, :cond_12

    .line 322
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 324
    :cond_12
    if-nez v2, :cond_15

    .line 336
    :cond_14
    :goto_14
    return v4

    .line 328
    :cond_15
    const-string v5, "If-Modified-Since"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v6

    array-length v7, v6

    move v5, v4

    :goto_1d
    if-ge v5, v7, :cond_3a

    aget-object v0, v6, v5

    .line 329
    .local v0, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 330
    .local v1, "ifModifiedSince":Ljava/util/Date;
    if-eqz v1, :cond_37

    .line 331
    invoke-virtual {v1, p3}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v8

    if-nez v8, :cond_14

    invoke-virtual {v2, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v8

    if-nez v8, :cond_14

    .line 328
    :cond_37
    add-int/lit8 v5, v5, 0x1

    goto :goto_1d

    .line 336
    .end local v0    # "h":Lcz/msebera/android/httpclient/Header;
    .end local v1    # "ifModifiedSince":Ljava/util/Date;
    :cond_3a
    const/4 v4, 0x1

    goto :goto_14
.end method

.method private originInsistsOnFreshness(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 6
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 93
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v2, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mustRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-eqz v2, :cond_c

    move v0, v1

    .line 100
    :cond_b
    :goto_b
    return v0

    .line 96
    :cond_c
    iget-boolean v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->sharedCache:Z

    if-eqz v2, :cond_b

    .line 99
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v2, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->proxyRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-nez v2, :cond_22

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    const-string v3, "s-maxage"

    .line 100
    invoke-virtual {v2, p1, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_22
    move v0, v1

    goto :goto_b
.end method


# virtual methods
.method public allConditionalsMatch(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 11
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 253
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedEtagValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v1

    .line 254
    .local v1, "hasEtagValidator":Z
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedLastModifiedValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v2

    .line 256
    .local v2, "hasLastModifiedValidator":Z
    if-eqz v1, :cond_25

    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->etagValidatorMatches(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v6

    if-eqz v6, :cond_25

    move v0, v5

    .line 257
    .local v0, "etagValidatorMatches":Z
    :goto_13
    if-eqz v2, :cond_27

    invoke-direct {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->lastModifiedValidatorMatches(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_27

    move v3, v5

    .line 259
    .local v3, "lastModifiedValidatorMatches":Z
    :goto_1c
    if-eqz v1, :cond_29

    if-eqz v2, :cond_29

    if-eqz v0, :cond_24

    if-nez v3, :cond_29

    .line 269
    :cond_24
    :goto_24
    return v4

    .end local v0    # "etagValidatorMatches":Z
    .end local v3    # "lastModifiedValidatorMatches":Z
    :cond_25
    move v0, v4

    .line 256
    goto :goto_13

    .restart local v0    # "etagValidatorMatches":Z
    :cond_27
    move v3, v4

    .line 257
    goto :goto_1c

    .line 262
    .restart local v3    # "lastModifiedValidatorMatches":Z
    :cond_29
    if-eqz v1, :cond_2d

    if-eqz v0, :cond_24

    .line 266
    :cond_2d
    if-eqz v2, :cond_31

    if-eqz v3, :cond_24

    :cond_31
    move v4, v5

    .line 269
    goto :goto_24
.end method

.method public canCachedResponseBeUsed(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 30
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 147
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isFreshEnough(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Lcz/msebera/android/httpclient/HttpRequest;Ljava/util/Date;)Z

    move-result v15

    if-nez v15, :cond_19

    .line 148
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Cache entry was not fresh enough"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 149
    const/4 v15, 0x0

    .line 233
    :goto_18
    return v15

    .line 152
    :cond_19
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->contentLengthHeaderMatchesActualLength(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v15

    if-nez v15, :cond_30

    .line 153
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Cache entry Content-Length and header information do not match"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 154
    const/4 v15, 0x0

    goto :goto_18

    .line 157
    :cond_30
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasUnsupportedConditionalHeaders(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v15

    if-eqz v15, :cond_45

    .line 158
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Request contained conditional headers we don\'t handle"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 159
    const/4 v15, 0x0

    goto :goto_18

    .line 162
    :cond_45
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v15

    if-nez v15, :cond_5b

    invoke-virtual/range {p3 .. p3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v15

    const/16 v16, 0x130

    move/from16 v0, v16

    if-ne v15, v0, :cond_5b

    .line 163
    const/4 v15, 0x0

    goto :goto_18

    .line 166
    :cond_5b
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v15

    if-eqz v15, :cond_75

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v15

    if-nez v15, :cond_75

    .line 167
    const/4 v15, 0x0

    goto :goto_18

    .line 170
    :cond_75
    const-string v15, "Cache-Control"

    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v17

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    const/4 v15, 0x0

    move/from16 v16, v15

    :goto_85
    move/from16 v0, v16

    move/from16 v1, v18

    if-ge v0, v1, :cond_1f6

    aget-object v6, v17, v16

    .line 171
    .local v6, "ccHdr":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v6}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v20, v0

    const/4 v15, 0x0

    :goto_97
    move/from16 v0, v20

    if-ge v15, v0, :cond_1f0

    aget-object v7, v19, v15

    .line 172
    .local v7, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v21, "no-cache"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_b5

    .line 173
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response contained NO CACHE directive, cache was not suitable"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 174
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 177
    :cond_b5
    const-string v21, "no-store"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_cd

    .line 178
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response contained NO STORE directive, cache was not suitable"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 179
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 182
    :cond_cd
    const-string v21, "max-age"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_126

    .line 184
    :try_start_d9
    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 185
    .local v11, "maxage":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v21

    int-to-long v0, v11

    move-wide/from16 v23, v0

    cmp-long v21, v21, v23

    if-lez v21, :cond_126

    .line 186
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response from cache was NOT suitable due to max age"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V
    :try_end_101
    .catch Ljava/lang/NumberFormatException; {:try_start_d9 .. :try_end_101} :catch_104

    .line 187
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 189
    .end local v11    # "maxage":I
    :catch_104
    move-exception v8

    .line 191
    .local v8, "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Response from cache was malformed"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 192
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 196
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    :cond_126
    const-string v21, "max-stale"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_17d

    .line 198
    :try_start_132
    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 199
    .local v12, "maxstale":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v21

    int-to-long v0, v12

    move-wide/from16 v23, v0

    cmp-long v21, v21, v23

    if-lez v21, :cond_17d

    .line 200
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response from cache was not suitable due to Max stale freshness"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V
    :try_end_158
    .catch Ljava/lang/NumberFormatException; {:try_start_132 .. :try_end_158} :catch_15b

    .line 201
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 203
    .end local v12    # "maxstale":I
    :catch_15b
    move-exception v8

    .line 205
    .restart local v8    # "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Response from cache was malformed: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 206
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 210
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    :cond_17d
    const-string v21, "min-fresh"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1ec

    .line 212
    :try_start_189
    invoke-interface {v7}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    .line 213
    .local v13, "minfresh":J
    const-wide/16 v21, 0x0

    cmp-long v21, v13, v21

    if-gez v21, :cond_19a

    .line 214
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 216
    :cond_19a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v4

    .line 217
    .local v4, "age":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v9

    .line 218
    .local v9, "freshness":J
    sub-long v21, v9, v4

    cmp-long v21, v21, v13

    if-gez v21, :cond_1ec

    .line 219
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response from cache was not suitable due to min fresh freshness requirement"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V
    :try_end_1c7
    .catch Ljava/lang/NumberFormatException; {:try_start_189 .. :try_end_1c7} :catch_1ca

    .line 221
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 223
    .end local v4    # "age":J
    .end local v9    # "freshness":J
    .end local v13    # "minfresh":J
    :catch_1ca
    move-exception v8

    .line 225
    .restart local v8    # "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Response from cache was malformed: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v8}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 226
    const/4 v15, 0x0

    goto/16 :goto_18

    .line 171
    .end local v8    # "ex":Ljava/lang/NumberFormatException;
    :cond_1ec
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_97

    .line 170
    .end local v7    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_1f0
    add-int/lit8 v15, v16, 0x1

    move/from16 v16, v15

    goto/16 :goto_85

    .line 232
    .end local v6    # "ccHdr":Lcz/msebera/android/httpclient/Header;
    :cond_1f6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v16, "Response from cache was suitable"

    invoke-virtual/range {v15 .. v16}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 233
    const/4 v15, 0x1

    goto/16 :goto_18
.end method

.method public isConditional(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 242
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedEtagValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedLastModifiedValidator(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
