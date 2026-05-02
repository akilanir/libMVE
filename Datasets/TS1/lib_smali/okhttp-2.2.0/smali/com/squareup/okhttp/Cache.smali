.class public final Lcom/squareup/okhttp/Cache;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Cache$CacheResponseBody;,
        Lcom/squareup/okhttp/Cache$Entry;,
        Lcom/squareup/okhttp/Cache$CacheRequestImpl;
    }
.end annotation


# static fields
.field private static final ENTRY_BODY:I = 0x1

.field private static final ENTRY_COUNT:I = 0x2

.field private static final ENTRY_METADATA:I = 0x0

.field private static final VERSION:I = 0x31191


# instance fields
.field private final cache:Lcom/squareup/okhttp/internal/DiskLruCache;

.field private hitCount:I

.field final internalCache:Lcom/squareup/okhttp/internal/InternalCache;

.field private networkCount:I

.field private requestCount:I

.field private writeAbortCount:I

.field private writeSuccessCount:I


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .registers 6
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Lcom/squareup/okhttp/Cache$1;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/Cache$1;-><init>(Lcom/squareup/okhttp/Cache;)V

    iput-object v0, p0, Lcom/squareup/okhttp/Cache;->internalCache:Lcom/squareup/okhttp/internal/InternalCache;

    .line 143
    const v0, 0x31191

    const/4 v1, 0x2

    invoke-static {p1, v0, v1, p2, p3}, Lcom/squareup/okhttp/internal/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/squareup/okhttp/internal/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    .line 144
    return-void
.end method

.method private abortQuietly(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V
    .registers 3
    .param p1, "editor"    # Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .prologue
    .line 240
    if-eqz p1, :cond_5

    .line 241
    :try_start_2
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->abort()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 245
    :cond_5
    :goto_5
    return-void

    .line 243
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;
    .param p1, "x1"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Cache;->put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Request;)V
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;
    .param p1, "x1"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Cache;->remove(Lcom/squareup/okhttp/Request;)V

    return-void
.end method

.method static synthetic access$1000(Lokio/BufferedSource;)I
    .registers 2
    .param p0, "x0"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {p0}, Lcom/squareup/okhttp/Cache;->readInt(Lokio/BufferedSource;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;
    .param p1, "x1"    # Lcom/squareup/okhttp/Response;
    .param p2, "x2"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 105
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/Cache;->update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V

    return-void
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/Cache;)V
    .registers 1
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/squareup/okhttp/Cache;->trackConditionalCacheHit()V

    return-void
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/internal/http/CacheStrategy;)V
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;
    .param p1, "x1"    # Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Cache;->trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V

    return-void
.end method

.method static synthetic access$600(Lcom/squareup/okhttp/Cache;)Lcom/squareup/okhttp/internal/DiskLruCache;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    return-object v0
.end method

.method static synthetic access$808(Lcom/squareup/okhttp/Cache;)I
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;

    .prologue
    .line 105
    iget v0, p0, Lcom/squareup/okhttp/Cache;->writeSuccessCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/squareup/okhttp/Cache;->writeSuccessCount:I

    return v0
.end method

.method static synthetic access$908(Lcom/squareup/okhttp/Cache;)I
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache;

    .prologue
    .line 105
    iget v0, p0, Lcom/squareup/okhttp/Cache;->writeAbortCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/squareup/okhttp/Cache;->writeAbortCount:I

    return v0
.end method

.method private put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;
    .registers 9
    .param p1, "response"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 182
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v5

    invoke-virtual {v5}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v3

    .line 184
    .local v3, "requestMethod":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v5

    invoke-virtual {v5}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 186
    :try_start_17
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/squareup/okhttp/Cache;->remove(Lcom/squareup/okhttp/Request;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1e} :catch_52

    .line 214
    :cond_1e
    :goto_1e
    return-object v4

    .line 192
    :cond_1f
    const-string v5, "GET"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 199
    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->hasVaryAll(Lcom/squareup/okhttp/Response;)Z

    move-result v5

    if-nez v5, :cond_1e

    .line 203
    new-instance v2, Lcom/squareup/okhttp/Cache$Entry;

    invoke-direct {v2, p1}, Lcom/squareup/okhttp/Cache$Entry;-><init>(Lcom/squareup/okhttp/Response;)V

    .line 204
    .local v2, "entry":Lcom/squareup/okhttp/Cache$Entry;
    const/4 v1, 0x0

    .line 206
    .local v1, "editor":Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    :try_start_33
    iget-object v5, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v6

    invoke-static {v6}, Lcom/squareup/okhttp/Cache;->urlToKey(Lcom/squareup/okhttp/Request;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/squareup/okhttp/internal/DiskLruCache;->edit(Ljava/lang/String;)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v1

    .line 207
    if-eqz v1, :cond_1e

    .line 210
    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/Cache$Entry;->writeTo(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V

    .line 211
    new-instance v5, Lcom/squareup/okhttp/Cache$CacheRequestImpl;

    invoke-direct {v5, p0, v1}, Lcom/squareup/okhttp/Cache$CacheRequestImpl;-><init>(Lcom/squareup/okhttp/Cache;Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_4b} :catch_4d

    move-object v4, v5

    goto :goto_1e

    .line 212
    :catch_4d
    move-exception v0

    .line 213
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v1}, Lcom/squareup/okhttp/Cache;->abortQuietly(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V

    goto :goto_1e

    .line 187
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "editor":Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .end local v2    # "entry":Lcom/squareup/okhttp/Cache$Entry;
    :catch_52
    move-exception v5

    goto :goto_1e
.end method

.method private static readInt(Lokio/BufferedSource;)I
    .registers 6
    .param p0, "source"    # Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 633
    invoke-interface {p0}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v1

    .line 635
    .local v1, "line":Ljava/lang/String;
    :try_start_4
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_7} :catch_9

    move-result v2

    return v2

    .line 636
    :catch_9
    move-exception v0

    .line 637
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected an integer but was \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private remove(Lcom/squareup/okhttp/Request;)V
    .registers 4
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-static {p1}, Lcom/squareup/okhttp/Cache;->urlToKey(Lcom/squareup/okhttp/Request;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 220
    return-void
.end method

.method private declared-synchronized trackConditionalCacheHit()V
    .registers 2

    .prologue
    .line 362
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Cache;->hitCount:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 363
    monitor-exit p0

    return-void

    .line 362
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V
    .registers 3
    .param p1, "cacheStrategy"    # Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .prologue
    .line 349
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->requestCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Cache;->requestCount:I

    .line 351
    iget-object v0, p1, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v0, :cond_13

    .line 353
    iget v0, p0, Lcom/squareup/okhttp/Cache;->networkCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Cache;->networkCount:I
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_1e

    .line 359
    :cond_11
    :goto_11
    monitor-exit p0

    return-void

    .line 355
    :cond_13
    :try_start_13
    iget-object v0, p1, Lcom/squareup/okhttp/internal/http/CacheStrategy;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-eqz v0, :cond_11

    .line 357
    iget v0, p0, Lcom/squareup/okhttp/Cache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/Cache;->hitCount:I
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_1e

    goto :goto_11

    .line 349
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V
    .registers 8
    .param p1, "cached"    # Lcom/squareup/okhttp/Response;
    .param p2, "network"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 223
    new-instance v2, Lcom/squareup/okhttp/Cache$Entry;

    invoke-direct {v2, p2}, Lcom/squareup/okhttp/Cache$Entry;-><init>(Lcom/squareup/okhttp/Response;)V

    .line 224
    .local v2, "entry":Lcom/squareup/okhttp/Cache$Entry;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v4

    check-cast v4, Lcom/squareup/okhttp/Cache$CacheResponseBody;

    # getter for: Lcom/squareup/okhttp/Cache$CacheResponseBody;->snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    invoke-static {v4}, Lcom/squareup/okhttp/Cache$CacheResponseBody;->access$500(Lcom/squareup/okhttp/Cache$CacheResponseBody;)Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    move-result-object v3

    .line 225
    .local v3, "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    const/4 v1, 0x0

    .line 227
    .local v1, "editor":Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    :try_start_10
    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->edit()Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v1

    .line 228
    if-eqz v1, :cond_1c

    .line 229
    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/Cache$Entry;->writeTo(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V

    .line 230
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->commit()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_1c} :catch_1d

    .line 235
    :cond_1c
    :goto_1c
    return-void

    .line 232
    :catch_1d
    move-exception v0

    .line 233
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v1}, Lcom/squareup/okhttp/Cache;->abortQuietly(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;)V

    goto :goto_1c
.end method

.method private static urlToKey(Lcom/squareup/okhttp/Request;)Ljava/lang/String;
    .registers 2
    .param p0, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->md5Hex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->close()V

    .line 338
    return-void
.end method

.method public delete()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->delete()V

    .line 254
    return-void
.end method

.method public evictAll()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->evictAll()V

    .line 262
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->flush()V

    .line 334
    return-void
.end method

.method get(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;
    .registers 9
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    const/4 v5, 0x0

    .line 151
    invoke-static {p1}, Lcom/squareup/okhttp/Cache;->urlToKey(Lcom/squareup/okhttp/Request;)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "key":Ljava/lang/String;
    :try_start_5
    iget-object v6, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v6, v2}, Lcom/squareup/okhttp/internal/DiskLruCache;->get(Ljava/lang/String;)Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_f

    move-result-object v4

    .line 156
    .local v4, "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    if-nez v4, :cond_12

    move-object v3, v5

    .line 178
    .end local v4    # "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    :cond_e
    :goto_e
    return-object v3

    .line 159
    :catch_f
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move-object v3, v5

    .line 161
    goto :goto_e

    .line 165
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v4    # "snapshot":Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    :cond_12
    :try_start_12
    new-instance v1, Lcom/squareup/okhttp/Cache$Entry;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->getSource(I)Lokio/Source;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/squareup/okhttp/Cache$Entry;-><init>(Lokio/Source;)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_1c} :catch_2f

    .line 171
    .local v1, "entry":Lcom/squareup/okhttp/Cache$Entry;
    invoke-virtual {v1, p1, v4}, Lcom/squareup/okhttp/Cache$Entry;->response(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;)Lcom/squareup/okhttp/Response;

    move-result-object v3

    .line 173
    .local v3, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v1, p1, v3}, Lcom/squareup/okhttp/Cache$Entry;->matches(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 174
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v6

    invoke-static {v6}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    move-object v3, v5

    .line 175
    goto :goto_e

    .line 166
    .end local v1    # "entry":Lcom/squareup/okhttp/Cache$Entry;
    .end local v3    # "response":Lcom/squareup/okhttp/Response;
    :catch_2f
    move-exception v0

    .line 167
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    move-object v3, v5

    .line 168
    goto :goto_e
.end method

.method public getDirectory()Ljava/io/File;
    .registers 2

    .prologue
    .line 341
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getHitCount()I
    .registers 2

    .prologue
    .line 370
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->hitCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMaxSize()J
    .registers 3

    .prologue
    .line 329
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->getMaxSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized getNetworkCount()I
    .registers 2

    .prologue
    .line 366
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->networkCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequestCount()I
    .registers 2

    .prologue
    .line 374
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->requestCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 325
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized getWriteAbortCount()I
    .registers 2

    .prologue
    .line 317
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->writeAbortCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getWriteSuccessCount()I
    .registers 2

    .prologue
    .line 321
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/Cache;->writeSuccessCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 345
    iget-object v0, p0, Lcom/squareup/okhttp/Cache;->cache:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache;->isClosed()Z

    move-result v0

    return v0
.end method

.method public urls()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    new-instance v0, Lcom/squareup/okhttp/Cache$2;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/Cache$2;-><init>(Lcom/squareup/okhttp/Cache;)V

    return-object v0
.end method
