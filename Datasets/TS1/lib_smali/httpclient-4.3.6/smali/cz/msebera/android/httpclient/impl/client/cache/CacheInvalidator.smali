.class Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;
.super Ljava/lang/Object;
.source "CacheInvalidator.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/cache/HttpCacheInvalidator;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;)V
    .registers 5
    .param p1, "uriExtractor"    # Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;
    .param p2, "storage"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 72
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    .line 73
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    .line 74
    return-void
.end method

.method private flushEntry(Ljava/lang/String;)V
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 120
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;->removeEntry(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 124
    :goto_5
    return-void

    .line 121
    :catch_6
    move-exception v0

    .line 122
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "unable to flush cache entry"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method private flushLocationCacheEntry(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;Ljava/net/URL;)V
    .registers 8
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "location"    # Ljava/net/URL;

    .prologue
    .line 218
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {p3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "cacheKey":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getEntry(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v1

    .line 220
    .local v1, "entry":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    if-nez v1, :cond_11

    .line 235
    :cond_10
    :goto_10
    return-void

    .line 227
    :cond_11
    invoke-direct {p0, p2, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->responseDateOlderThanEntryDate(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 230
    invoke-direct {p0, p2, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->responseAndEntryEtagsDiffer(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 234
    invoke-virtual {p0, p1, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    goto :goto_10
.end method

.method private getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 164
    const/4 v0, 0x0

    .line 166
    .local v0, "absURL":Ljava/net/URL;
    :try_start_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_6} :catch_8

    .end local v0    # "absURL":Ljava/net/URL;
    .local v1, "absURL":Ljava/net/URL;
    move-object v0, v1

    .line 170
    .end local v1    # "absURL":Ljava/net/URL;
    .restart local v0    # "absURL":Ljava/net/URL;
    :goto_7
    return-object v0

    .line 167
    :catch_8
    move-exception v2

    goto :goto_7
.end method

.method private getContentLocationURL(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;)Ljava/net/URL;
    .registers 7
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 238
    const-string v3, "Content-Location"

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 239
    .local v1, "clHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v1, :cond_a

    .line 240
    const/4 v0, 0x0

    .line 247
    :cond_9
    :goto_9
    return-object v0

    .line 242
    :cond_a
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 243
    .local v2, "contentLocation":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 244
    .local v0, "canonURL":Ljava/net/URL;
    if-nez v0, :cond_9

    .line 247
    invoke-direct {p0, p1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    goto :goto_9
.end method

.method private getEntry(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .registers 5
    .param p1, "theUri"    # Ljava/lang/String;

    .prologue
    .line 128
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->storage:Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 132
    :goto_6
    return-object v1

    .line 129
    :catch_7
    move-exception v0

    .line 130
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "could not retrieve entry from storage"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 132
    const/4 v1, 0x0

    goto :goto_6
.end method

.method private getLocationURL(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;)Ljava/net/URL;
    .registers 7
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 251
    const-string v3, "Location"

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 252
    .local v1, "clHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v1, :cond_a

    .line 253
    const/4 v0, 0x0

    .line 260
    :cond_9
    :goto_9
    return-object v0

    .line 255
    :cond_a
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 256
    .local v2, "location":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 257
    .local v0, "canonURL":Ljava/net/URL;
    if-nez v0, :cond_9

    .line 260
    invoke-direct {p0, p1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    goto :goto_9
.end method

.method private getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 6
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "relUri"    # Ljava/lang/String;

    .prologue
    .line 174
    const/4 v0, 0x0

    .line 176
    .local v0, "relURL":Ljava/net/URL;
    :try_start_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_6} :catch_8

    .end local v0    # "relURL":Ljava/net/URL;
    .local v1, "relURL":Ljava/net/URL;
    move-object v0, v1

    .line 180
    .end local v1    # "relURL":Ljava/net/URL;
    .restart local v0    # "relURL":Ljava/net/URL;
    :goto_7
    return-object v0

    .line 177
    :catch_8
    move-exception v2

    goto :goto_7
.end method

.method private notGetOrHeadRequest(Ljava/lang/String;)Z
    .registers 3
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 189
    const-string v0, "GET"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "HEAD"

    .line 190
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private responseAndEntryEtagsDiffer(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 8
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const/4 v2, 0x0

    .line 265
    const-string v3, "ETag"

    invoke-virtual {p2, v3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 266
    .local v0, "entryEtag":Lcz/msebera/android/httpclient/Header;
    const-string v3, "ETag"

    invoke-interface {p1, v3}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 267
    .local v1, "responseEtag":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_11

    if-nez v1, :cond_12

    .line 270
    :cond_11
    :goto_11
    return v2

    :cond_12
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    const/4 v2, 0x1

    goto :goto_11
.end method

.method private responseDateOlderThanEntryDate(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 9
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const/4 v4, 0x0

    .line 275
    const-string v5, "Date"

    invoke-virtual {p2, v5}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 276
    .local v1, "entryDateHeader":Lcz/msebera/android/httpclient/Header;
    const-string v5, "Date"

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    .line 277
    .local v3, "responseDateHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_11

    if-nez v3, :cond_12

    .line 286
    :cond_11
    :goto_11
    return v4

    .line 281
    :cond_12
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 282
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 283
    .local v2, "responseDate":Ljava/util/Date;
    if-eqz v0, :cond_11

    if-eqz v2, :cond_11

    .line 286
    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v4

    goto :goto_11
.end method


# virtual methods
.method protected flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z
    .registers 5
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 155
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 156
    .local v0, "absURL":Ljava/net/URL;
    if-nez v0, :cond_8

    .line 157
    const/4 v1, 0x0

    .line 160
    :goto_7
    return v1

    .line 159
    :cond_8
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    .line 160
    const/4 v1, 0x1

    goto :goto_7
.end method

.method public flushInvalidatedCacheEntries(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 13
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 84
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->requestShouldNotBeCached(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 85
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v8, "Request should not be cached"

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 87
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v7, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v5

    .line 89
    .local v5, "theUri":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getEntry(Ljava/lang/String;)Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    move-result-object v3

    .line 91
    .local v3, "parent":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parent entry: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 93
    if-eqz v3, :cond_50

    .line 94
    invoke-virtual {v3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getVariantMap()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 95
    .local v6, "variantURI":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    goto :goto_3d

    .line 97
    .end local v6    # "variantURI":Ljava/lang/String;
    :cond_4d
    invoke-direct {p0, v5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    .line 99
    :cond_50
    invoke-direct {p0, v5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    .line 100
    .local v4, "reqURL":Ljava/net/URL;
    if-nez v4, :cond_5e

    .line 101
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v8, "Couldn\'t transform request into valid URL"

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->error(Ljava/lang/Object;)V

    .line 116
    .end local v3    # "parent":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .end local v4    # "reqURL":Ljava/net/URL;
    .end local v5    # "theUri":Ljava/lang/String;
    :cond_5d
    :goto_5d
    return-void

    .line 104
    .restart local v3    # "parent":Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .restart local v4    # "reqURL":Ljava/net/URL;
    .restart local v5    # "theUri":Ljava/lang/String;
    :cond_5e
    const-string v7, "Content-Location"

    invoke-interface {p2, v7}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 105
    .local v0, "clHdr":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_73

    .line 106
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "contentLocation":Ljava/lang/String;
    invoke-virtual {p0, v4, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_73

    .line 108
    invoke-virtual {p0, v4, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushRelativeUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)V

    .line 111
    .end local v1    # "contentLocation":Ljava/lang/String;
    :cond_73
    const-string v7, "Location"

    invoke-interface {p2, v7}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 112
    .local v2, "lHdr":Lcz/msebera/android/httpclient/Header;
    if-eqz v2, :cond_5d

    .line 113
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v4, v7}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z

    goto :goto_5d
.end method

.method public flushInvalidatedCacheEntries(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 9
    .param p1, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 198
    invoke-interface {p3}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v3

    .line 199
    .local v3, "status":I
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_10

    const/16 v4, 0x12b

    if-le v3, v4, :cond_11

    .line 214
    :cond_10
    :goto_10
    return-void

    .line 202
    :cond_11
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->getURI(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 203
    .local v2, "reqURL":Ljava/net/URL;
    if-eqz v2, :cond_10

    .line 206
    invoke-direct {p0, v2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getContentLocationURL(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;)Ljava/net/URL;

    move-result-object v0

    .line 207
    .local v0, "contentLocation":Ljava/net/URL;
    if-eqz v0, :cond_26

    .line 208
    invoke-direct {p0, v2, p3, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushLocationCacheEntry(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;Ljava/net/URL;)V

    .line 210
    :cond_26
    invoke-direct {p0, v2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getLocationURL(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;)Ljava/net/URL;

    move-result-object v1

    .line 211
    .local v1, "location":Ljava/net/URL;
    if-eqz v1, :cond_10

    .line 212
    invoke-direct {p0, v2, p3, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushLocationCacheEntry(Ljava/net/URL;Lcz/msebera/android/httpclient/HttpResponse;Ljava/net/URL;)V

    goto :goto_10
.end method

.method protected flushRelativeUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)V
    .registers 4
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "relUri"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 147
    .local v0, "relURL":Ljava/net/URL;
    if-nez v0, :cond_7

    .line 151
    :goto_6
    return-void

    .line 150
    :cond_7
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    goto :goto_6
.end method

.method protected flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V
    .registers 6
    .param p1, "requestURL"    # Ljava/net/URL;
    .param p2, "targetURL"    # Ljava/net/URL;

    .prologue
    .line 136
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 137
    .local v0, "canonicalTarget":Ljava/net/URL;
    if-nez v0, :cond_11

    .line 143
    :cond_10
    :goto_10
    return-void

    .line 140
    :cond_11
    invoke-virtual {v0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 141
    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    goto :goto_10
.end method

.method protected requestShouldNotBeCached(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 4
    .param p1, "req"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 184
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "method":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheInvalidator;->notGetOrHeadRequest(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method
