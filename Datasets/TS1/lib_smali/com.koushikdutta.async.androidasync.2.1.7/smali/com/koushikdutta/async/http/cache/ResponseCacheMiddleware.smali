.class public Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "ResponseCacheMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;,
        Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    }
.end annotation


# static fields
.field public static final CACHE:Ljava/lang/String; = "cache"

.field public static final CONDITIONAL_CACHE:Ljava/lang/String; = "conditional-cache"

.field public static final ENTRY_BODY:I = 0x1

.field public static final ENTRY_COUNT:I = 0x2

.field public static final ENTRY_METADATA:I = 0x0

.field private static final LOGTAG:Ljava/lang/String; = "AsyncHttpCache"

.field public static final SERVED_FROM:Ljava/lang/String; = "X-Served-From"


# instance fields
.field private cache:Lcom/koushikdutta/async/util/FileCache;

.field private cacheHitCount:I

.field private cacheStoreCount:I

.field private caching:Z

.field private conditionalCacheHitCount:I

.field private networkCount:I

.field private server:Lcom/koushikdutta/async/AsyncServer;

.field private writeAbortCount:I

.field private writeSuccessCount:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    .line 69
    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/AsyncServer;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)Lcom/koushikdutta/async/util/FileCache;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    return-object v0
.end method

.method static synthetic access$508(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    .prologue
    .line 50
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeSuccessCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeSuccessCount:I

    return v0
.end method

.method static synthetic access$608(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;)I
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    .prologue
    .line 50
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeAbortCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->writeAbortCount:I

    return v0
.end method

.method public static addCache(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/io/File;J)Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    .registers 9
    .param p0, "client"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getMiddleware()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 73
    .local v1, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    instance-of v3, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    if-eqz v3, :cond_8

    .line 74
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Response cache already added to http client"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 76
    .end local v1    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :cond_20
    new-instance v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;-><init>()V

    .line 77
    .local v2, "ret":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v3

    iput-object v3, v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    .line 78
    new-instance v3, Lcom/koushikdutta/async/util/FileCache;

    const/4 v4, 0x0

    invoke-direct {v3, p1, p2, p3, v4}, Lcom/koushikdutta/async/util/FileCache;-><init>(Ljava/io/File;JZ)V

    iput-object v3, v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    .line 79
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 80
    return-object v2
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 317
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    if-eqz v0, :cond_9

    .line 318
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    invoke-virtual {v0}, Lcom/koushikdutta/async/util/FileCache;->clear()V

    .line 320
    :cond_9
    return-void
.end method

.method public getCacheHitCount()I
    .registers 2

    .prologue
    .line 205
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    return v0
.end method

.method public getCacheStoreCount()I
    .registers 2

    .prologue
    .line 213
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    return v0
.end method

.method public getCaching()Z
    .registers 2

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    return v0
.end method

.method public getConditionalCacheHitCount()I
    .registers 2

    .prologue
    .line 201
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    return v0
.end method

.method public getFileCache()Lcom/koushikdutta/async/util/FileCache;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    return-object v0
.end method

.method public getNetworkCount()I
    .registers 2

    .prologue
    .line 209
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    return v0
.end method

.method public getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 28
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    .line 99
    new-instance v16, Lcom/koushikdutta/async/http/cache/RequestHeaders;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v22

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v23

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/async/http/cache/RequestHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 100
    .local v16, "requestHeaders":Lcom/koushikdutta/async/http/cache/RequestHeaders;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    move-object/from16 v22, v0

    const-string v23, "request-headers"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    move-object/from16 v22, v0

    if-eqz v22, :cond_4e

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    move/from16 v22, v0

    if-eqz v22, :cond_4e

    invoke-virtual/range {v16 .. v16}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->isNoCache()Z

    move-result v22

    if-eqz v22, :cond_5f

    .line 103
    :cond_4e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 104
    const/16 v19, 0x0

    .line 196
    :goto_5e
    return-object v19

    .line 107
    :cond_5f
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v22 .. v22}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 108
    .local v12, "key":Ljava/lang/String;
    const/16 v20, 0x0

    .line 112
    .local v20, "snapshot":[Ljava/io/FileInputStream;
    :try_start_7b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cache:Lcom/koushikdutta/async/util/FileCache;

    move-object/from16 v22, v0

    const/16 v23, 0x2

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v0, v12, v1}, Lcom/koushikdutta/async/util/FileCache;->get(Ljava/lang/String;I)[Ljava/io/FileInputStream;

    move-result-object v20

    .line 113
    if-nez v20, :cond_9e

    .line 114
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 115
    const/16 v19, 0x0

    goto :goto_5e

    .line 117
    :cond_9e
    const/16 v22, 0x1

    aget-object v22, v20, v22

    invoke-virtual/range {v22 .. v22}, Ljava/io/FileInputStream;->available()I

    move-result v22

    move/from16 v0, v22

    int-to-long v8, v0

    .line 118
    .local v8, "contentLength":J
    new-instance v11, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;

    const/16 v22, 0x0

    aget-object v22, v20, v22

    move-object/from16 v0, v22

    invoke-direct {v11, v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;-><init>(Ljava/io/InputStream;)V
    :try_end_b4
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_b4} :catch_f7

    .line 128
    .local v11, "entry":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v22

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v11, v0, v1, v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->matches(Landroid/net/Uri;Ljava/lang/String;Ljava/util/Map;)Z

    move-result v22

    if-nez v22, :cond_10d

    .line 129
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 130
    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 131
    const/16 v19, 0x0

    goto/16 :goto_5e

    .line 120
    .end local v8    # "contentLength":J
    .end local v11    # "entry":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;
    :catch_f7
    move-exception v10

    .line 122
    .local v10, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 123
    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 124
    const/16 v19, 0x0

    goto/16 :goto_5e

    .line 134
    .end local v10    # "e":Ljava/io/IOException;
    .restart local v8    # "contentLength":J
    .restart local v11    # "entry":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;
    :cond_10d
    new-instance v7, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    const/16 v22, 0x1

    aget-object v22, v20, v22

    move-object/from16 v0, v22

    invoke-direct {v7, v11, v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;Ljava/io/FileInputStream;)V

    .line 139
    .local v7, "candidate":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;
    :try_start_118
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getHeaders()Ljava/util/Map;

    move-result-object v17

    .line 140
    .local v17, "responseHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;
    :try_end_11f
    .catch Ljava/lang/Exception; {:try_start_118 .. :try_end_11f} :catch_139

    move-result-object v5

    .line 147
    .local v5, "cachedResponseBody":Ljava/io/FileInputStream;
    if-eqz v17, :cond_124

    if-nez v5, :cond_14f

    .line 148
    :cond_124
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 149
    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 150
    const/16 v19, 0x0

    goto/16 :goto_5e

    .line 142
    .end local v5    # "cachedResponseBody":Ljava/io/FileInputStream;
    .end local v17    # "responseHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :catch_139
    move-exception v10

    .line 143
    .local v10, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 144
    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 145
    const/16 v19, 0x0

    goto/16 :goto_5e

    .line 153
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v5    # "cachedResponseBody":Ljava/io/FileInputStream;
    .restart local v17    # "responseHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_14f
    invoke-static/range {v17 .. v17}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v15

    .line 154
    .local v15, "rawResponseHeaders":Lcom/koushikdutta/async/http/cache/RawHeaders;
    new-instance v6, Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v6, v0, v15}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 155
    .local v6, "cachedResponseHeaders":Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    const-string v22, "Content-Length"

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v15, v0, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v22, "Content-Encoding"

    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 157
    const-string v22, "Transfer-Encoding"

    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 158
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    move-wide/from16 v0, v22

    move-wide/from16 v2, v24

    invoke-virtual {v6, v0, v1, v2, v3}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->setLocalTimestamps(JJ)V

    .line 160
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .line 161
    .local v13, "now":J
    move-object/from16 v0, v16

    invoke-virtual {v6, v13, v14, v0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->chooseResponseSource(JLcom/koushikdutta/async/http/cache/RequestHeaders;)Lcom/koushikdutta/async/http/cache/ResponseSource;

    move-result-object v18

    .line 163
    .local v18, "responseSource":Lcom/koushikdutta/async/http/cache/ResponseSource;
    sget-object v22, Lcom/koushikdutta/async/http/cache/ResponseSource;->CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    if-ne v0, v1, :cond_218

    .line 164
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    const-string v23, "Response retrieved from cache"

    invoke-virtual/range {v22 .. v23}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 165
    # invokes: Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->isHttps()Z
    invoke-static {v11}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->access$000(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;)Z

    move-result v22

    if-eqz v22, :cond_20e

    new-instance v21, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7, v8, v9}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSSLSocket;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    .line 166
    .local v21, "socket":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;
    :goto_1ba
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    move-object/from16 v22, v0

    invoke-virtual {v15}, Lcom/koushikdutta/async/http/cache/RawHeaders;->toHeaderString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->getBytes()[B

    move-result-object v23

    invoke-static/range {v23 .. v23}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->server:Lcom/koushikdutta/async/AsyncServer;

    move-object/from16 v22, v0

    new-instance v23, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;)V

    invoke-virtual/range {v22 .. v23}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 175
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheHitCount:I

    .line 176
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    move-object/from16 v22, v0

    const-string v23, "socket-owner"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 177
    new-instance v19, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-direct/range {v19 .. v19}, Lcom/koushikdutta/async/future/SimpleCancellable;-><init>()V

    .line 178
    .local v19, "ret":Lcom/koushikdutta/async/future/SimpleCancellable;
    invoke-virtual/range {v19 .. v19}, Lcom/koushikdutta/async/future/SimpleCancellable;->setComplete()Z

    goto/16 :goto_5e

    .line 165
    .end local v19    # "ret":Lcom/koushikdutta/async/future/SimpleCancellable;
    .end local v21    # "socket":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;
    :cond_20e
    new-instance v21, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7, v8, v9}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    goto :goto_1ba

    .line 181
    :cond_218
    sget-object v22, Lcom/koushikdutta/async/http/cache/ResponseSource;->CONDITIONAL_CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    if-ne v0, v1, :cond_24d

    .line 182
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    const-string v23, "Response may be served from conditional cache"

    invoke-virtual/range {v22 .. v23}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 183
    new-instance v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    invoke-direct {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;-><init>()V

    .line 184
    .local v4, "cacheData":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    move-object/from16 v0, v20

    iput-object v0, v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    .line 185
    iput-wide v8, v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->contentLength:J

    .line 186
    iput-object v6, v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    .line 187
    iput-object v7, v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->candidate:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    .line 188
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    move-object/from16 v22, v0

    const-string v23, "cache-data"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v4}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 189
    const/16 v19, 0x0

    goto/16 :goto_5e

    .line 192
    .end local v4    # "cacheData":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    :cond_24d
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v22, v0

    const-string v23, "Response can not be served from cache"

    invoke-virtual/range {v22 .. v23}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 194
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 195
    invoke-static/range {v20 .. v20}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 196
    const/16 v19, 0x0

    goto/16 :goto_5e
.end method

.method public onBodyDecoder(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;)V
    .registers 21
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;

    .prologue
    .line 220
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const-class v16, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    invoke-static/range {v15 .. v16}, Lcom/koushikdutta/async/Util;->getWrappedSocket(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/Class;)Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v4

    check-cast v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    .line 221
    .local v4, "cached":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;
    if-eqz v4, :cond_1e

    .line 222
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v15}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v15

    const-string v16, "X-Served-From"

    const-string v17, "cache"

    invoke-virtual/range {v15 .. v17}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 294
    :cond_1d
    :goto_1d
    return-void

    .line 226
    :cond_1e
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v16, "cache-data"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    .line 227
    .local v3, "cacheData":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v15}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v15

    invoke-virtual {v15}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v15

    invoke-static {v15}, Lcom/koushikdutta/async/http/cache/RawHeaders;->fromMultimap(Ljava/util/Map;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v13

    .line 228
    .local v13, "rh":Lcom/koushikdutta/async/http/cache/RawHeaders;
    const-string v15, "Content-Length"

    invoke-virtual {v13, v15}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 229
    const-string v15, "%s %s %s"

    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->protocol()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Lcom/koushikdutta/async/http/cache/RawHeaders;->setStatusLine(Ljava/lang/String;)V

    .line 230
    new-instance v11, Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v15}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v15

    invoke-direct {v11, v15, v13}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 231
    .local v11, "networkResponse":Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v16, "response-headers"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v11}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    if-eqz v3, :cond_125

    .line 233
    iget-object v15, v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-virtual {v15, v11}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->validate(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Z

    move-result v15

    if-eqz v15, :cond_117

    .line 234
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v16, "Serving response from conditional cache"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 235
    iget-object v15, v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->cachedResponseHeaders:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-virtual {v15, v11}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->combine(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    move-result-object v6

    .line 236
    .local v6, "combined":Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    new-instance v16, Lcom/koushikdutta/async/http/Headers;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/koushikdutta/async/http/cache/RawHeaders;->toMultimap()Ljava/util/Map;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lcom/koushikdutta/async/http/Headers;-><init>(Ljava/util/Map;)V

    invoke-interface/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 237
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseCode()I

    move-result v16

    invoke-interface/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code(I)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 238
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseMessage()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 240
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v15}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v15

    const-string v16, "X-Served-From"

    const-string v17, "conditional-cache"

    invoke-virtual/range {v15 .. v17}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 241
    move-object/from16 v0, p0

    iget v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->conditionalCacheHitCount:I

    .line 243
    new-instance v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;

    iget-object v15, v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->candidate:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    iget-wide v0, v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->contentLength:J

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-direct {v2, v15, v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V

    .line 244
    .local v2, "bodySpewer":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {v2, v15}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 245
    move-object/from16 v0, p1

    iput-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 246
    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedData()V

    goto/16 :goto_1d

    .line 251
    .end local v2    # "bodySpewer":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;
    .end local v6    # "combined":Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    :cond_117
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v16, "cache-data"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/util/UntypedHashtable;->remove(Ljava/lang/String;)V

    .line 252
    iget-object v15, v3, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    invoke-static {v15}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 255
    :cond_125
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    if-eqz v15, :cond_1d

    .line 258
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v16, "request-headers"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/koushikdutta/async/http/cache/RequestHeaders;

    .line 259
    .local v12, "requestHeaders":Lcom/koushikdutta/async/http/cache/RequestHeaders;
    if-eqz v12, :cond_14f

    invoke-virtual {v11, v12}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isCacheable(Lcom/koushikdutta/async/http/cache/RequestHeaders;)Z

    move-result v15

    if-eqz v15, :cond_14f

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v15}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v15

    const-string v16, "GET"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_164

    .line 265
    :cond_14f
    move-object/from16 v0, p0

    iget v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    .line 266
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v16, "Response is not cacheable"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    goto/16 :goto_1d

    .line 270
    :cond_164
    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v15}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 271
    .local v10, "key":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v15

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getVaryFields()Ljava/util/Set;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getAll(Ljava/util/Set;)Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v14

    .line 272
    .local v14, "varyHeaders":Lcom/koushikdutta/async/http/cache/RawHeaders;
    new-instance v9, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v15}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v15

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v16, v0

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v9, v15, v14, v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    .line 273
    .local v9, "entry":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;
    new-instance v5, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;

    const/4 v15, 0x0

    invoke-direct {v5, v15}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;)V

    .line 274
    .local v5, "cacher":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;
    new-instance v8, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v10}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;Ljava/lang/String;)V

    .line 276
    .local v8, "editor":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;
    :try_start_1ad
    invoke-virtual {v9, v8}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$Entry;->writeTo(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;)V

    .line 278
    const/4 v15, 0x1

    invoke-virtual {v8, v15}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->newOutputStream(I)Ljava/io/FileOutputStream;
    :try_end_1b4
    .catch Ljava/lang/Exception; {:try_start_1ad .. :try_end_1b4} :catch_1e1

    .line 286
    iput-object v8, v5, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    .line 288
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {v5, v15}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 289
    move-object/from16 v0, p1

    iput-object v5, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 291
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v16, "body-cacher"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v5}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 292
    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v16, "Caching response"

    invoke-virtual/range {v15 .. v16}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 293
    move-object/from16 v0, p0

    iget v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->cacheStoreCount:I

    goto/16 :goto_1d

    .line 280
    :catch_1e1
    move-exception v7

    .line 282
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->abort()V

    .line 283
    move-object/from16 v0, p0

    iget v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->networkCount:I

    goto/16 :goto_1d
.end method

.method public onResponseComplete(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V
    .registers 8
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    .prologue
    .line 299
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v4, "cache-data"

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;

    .line 300
    .local v0, "cacheData":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;
    if-eqz v0, :cond_15

    iget-object v3, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    if-eqz v3, :cond_15

    .line 301
    iget-object v3, v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CacheData;->snapshot:[Ljava/io/FileInputStream;

    invoke-static {v3}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 303
    :cond_15
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    const-class v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    invoke-static {v3, v4}, Lcom/koushikdutta/async/Util;->getWrappedSocket(Lcom/koushikdutta/async/AsyncSocket;Ljava/lang/Class;)Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;

    .line 304
    .local v1, "cachedSocket":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;
    if-eqz v1, :cond_30

    .line 305
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/io/Closeable;

    const/4 v4, 0x0

    iget-object v5, v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedSocket;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 307
    :cond_30
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v4, "body-cacher"

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;

    .line 308
    .local v2, "cacher":Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;
    if-eqz v2, :cond_43

    .line 309
    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->exception:Ljava/lang/Exception;

    if-eqz v3, :cond_44

    .line 310
    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V

    .line 314
    :cond_43
    :goto_43
    return-void

    .line 312
    :cond_44
    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->commit()V

    goto :goto_43
.end method

.method public setCaching(Z)V
    .registers 2
    .param p1, "caching"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->caching:Z

    .line 93
    return-void
.end method
