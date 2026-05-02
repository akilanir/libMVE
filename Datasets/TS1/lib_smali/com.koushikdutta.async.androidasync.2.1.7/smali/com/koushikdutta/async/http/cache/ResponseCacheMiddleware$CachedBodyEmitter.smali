.class Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;
.super Lcom/koushikdutta/async/FilteredDataEmitter;
.source "ResponseCacheMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CachedBodyEmitter"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private allocator:Lcom/koushikdutta/async/util/Allocator;

.field allowEnd:Z

.field cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

.field private paused:Z

.field pending:Lcom/koushikdutta/async/ByteBufferList;

.field sendCachedDataRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 408
    const-class v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;J)V
    .registers 6
    .param p1, "cacheResponse"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;
    .param p2, "contentLength"    # J

    .prologue
    .line 414
    invoke-direct {p0}, Lcom/koushikdutta/async/FilteredDataEmitter;-><init>()V

    .line 410
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    .line 412
    new-instance v0, Lcom/koushikdutta/async/util/Allocator;

    invoke-direct {v0}, Lcom/koushikdutta/async/util/Allocator;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allocator:Lcom/koushikdutta/async/util/Allocator;

    .line 419
    new-instance v0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter$1;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedDataRunnable:Ljava/lang/Runnable;

    .line 415
    iput-object p1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    .line 416
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allocator:Lcom/koushikdutta/async/util/Allocator;

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/Allocator;->setCurrentAlloc(I)V

    .line 417
    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .prologue
    .line 479
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_1b

    .line 480
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter$2;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter$2;-><init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 492
    :goto_1a
    return-void

    .line 489
    :cond_1b
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 490
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/Closeable;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 491
    invoke-super {p0}, Lcom/koushikdutta/async/FilteredDataEmitter;->close()V

    goto :goto_1a
.end method

.method public isPaused()Z
    .registers 2

    .prologue
    .line 474
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->paused:Z

    return v0
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 498
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allowEnd:Z

    if-nez v0, :cond_5

    .line 502
    :goto_4
    return-void

    .line 500
    :cond_5
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/Closeable;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 501
    invoke-super {p0, p1}, Lcom/koushikdutta/async/FilteredDataEmitter;->report(Ljava/lang/Exception;)V

    goto :goto_4
.end method

.method public resume()V
    .registers 2

    .prologue
    .line 468
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->paused:Z

    .line 469
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedData()V

    .line 470
    return-void
.end method

.method sendCachedData()V
    .registers 3

    .prologue
    .line 463
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedDataRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 464
    return-void
.end method

.method sendCachedDataOnNetworkThread()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    .line 427
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-lez v4, :cond_17

    .line 428
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-super {p0, p0, v4}, Lcom/koushikdutta/async/FilteredDataEmitter;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 429
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-lez v4, :cond_17

    .line 460
    :cond_16
    :goto_16
    return-void

    .line 435
    :cond_17
    :try_start_17
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v4}, Lcom/koushikdutta/async/util/Allocator;->allocate()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 436
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    sget-boolean v4, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->$assertionsDisabled:Z

    if-nez v4, :cond_34

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-eqz v4, :cond_34

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_2d} :catch_2d

    .line 449
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    :catch_2d
    move-exception v2

    .line 450
    .local v2, "e":Ljava/io/IOException;
    iput-boolean v7, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allowEnd:Z

    .line 451
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->report(Ljava/lang/Exception;)V

    goto :goto_16

    .line 437
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":Ljava/nio/ByteBuffer;
    :cond_34
    :try_start_34
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->cacheResponse:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryCacheResponse;->getBody()Ljava/io/FileInputStream;

    move-result-object v1

    .line 438
    .local v1, "din":Ljava/io/FileInputStream;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v5

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    invoke-virtual {v1, v4, v5, v6}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    .line 439
    .local v3, "read":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_58

    .line 440
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 441
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allowEnd:Z

    .line 442
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->report(Ljava/lang/Exception;)V

    goto :goto_16

    .line 445
    :cond_58
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->allocator:Lcom/koushikdutta/async/util/Allocator;

    int-to-long v5, v3

    invoke-virtual {v4, v5, v6}, Lcom/koushikdutta/async/util/Allocator;->track(J)V

    .line 446
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 447
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v4, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;
    :try_end_66
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_66} :catch_2d

    .line 454
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-super {p0, p0, v4}, Lcom/koushikdutta/async/FilteredDataEmitter;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 455
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-gtz v4, :cond_16

    .line 459
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v4

    iget-object v5, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$CachedBodyEmitter;->sendCachedDataRunnable:Ljava/lang/Runnable;

    const-wide/16 v6, 0xa

    invoke-virtual {v4, v5, v6, v7}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    goto :goto_16
.end method
