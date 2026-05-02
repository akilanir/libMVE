.class Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;
.super Lcom/koushikdutta/async/FilteredDataEmitter;
.source "ResponseCacheMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BodyCacher"
.end annotation


# instance fields
.field cached:Lcom/koushikdutta/async/ByteBufferList;

.field editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 329
    invoke-direct {p0}, Lcom/koushikdutta/async/FilteredDataEmitter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$1;

    .prologue
    .line 329
    invoke-direct {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;-><init>()V

    return-void
.end method


# virtual methods
.method public abort()V
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    if-eqz v0, :cond_c

    .line 395
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->abort()V

    .line 396
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    .line 398
    :cond_c
    return-void
.end method

.method public close()V
    .registers 1

    .prologue
    .line 389
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V

    .line 390
    invoke-super {p0}, Lcom/koushikdutta/async/FilteredDataEmitter;->close()V

    .line 391
    return-void
.end method

.method public commit()V
    .registers 2

    .prologue
    .line 401
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    if-eqz v0, :cond_c

    .line 402
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->commit()V

    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    .line 405
    :cond_c
    return-void
.end method

.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 9
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 342
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    if-eqz v4, :cond_15

    .line 343
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    invoke-super {p0, p1, v4}, Lcom/koushikdutta/async/FilteredDataEmitter;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 345
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-lez v4, :cond_12

    .line 385
    :cond_11
    :goto_11
    return-void

    .line 347
    :cond_12
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    .line 351
    :cond_15
    new-instance v1, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v1}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    .line 353
    .local v1, "copy":Lcom/koushikdutta/async/ByteBufferList;
    :try_start_1a
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    if-eqz v4, :cond_6c

    .line 354
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;->newOutputStream(I)Ljava/io/FileOutputStream;

    move-result-object v3

    .line 355
    .local v3, "outputStream":Ljava/io/OutputStream;
    if-eqz v3, :cond_69

    .line 356
    :goto_27
    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6c

    .line 357
    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->remove()Ljava/nio/ByteBuffer;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_30} :catch_38
    .catchall {:try_start_1a .. :try_end_30} :catchall_61

    move-result-object v0

    .line 359
    .local v0, "b":Ljava/nio/ByteBuffer;
    :try_start_31
    invoke-static {v3, v0}, Lcom/koushikdutta/async/ByteBufferList;->writeOutputStream(Ljava/io/OutputStream;Ljava/nio/ByteBuffer;)V
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_5c

    .line 362
    :try_start_34
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_37} :catch_38
    .catchall {:try_start_34 .. :try_end_37} :catchall_61

    goto :goto_27

    .line 371
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v3    # "outputStream":Ljava/io/OutputStream;
    :catch_38
    move-exception v2

    .line 372
    .local v2, "e":Ljava/lang/Exception;
    :try_start_39
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_61

    .line 375
    invoke-virtual {p2, v1}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 376
    invoke-virtual {v1, p2}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 379
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_42
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/async/FilteredDataEmitter;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 381
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->editor:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$EntryEditor;

    if-eqz v4, :cond_11

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-lez v4, :cond_11

    .line 382
    new-instance v4, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v4}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    .line 383
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->cached:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {p2, v4}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    goto :goto_11

    .line 362
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    .restart local v3    # "outputStream":Ljava/io/OutputStream;
    :catchall_5c
    move-exception v4

    :try_start_5d
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    throw v4
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_61} :catch_38
    .catchall {:try_start_5d .. :try_end_61} :catchall_61

    .line 375
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v3    # "outputStream":Ljava/io/OutputStream;
    :catchall_61
    move-exception v4

    invoke-virtual {p2, v1}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 376
    invoke-virtual {v1, p2}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    throw v4

    .line 367
    .restart local v3    # "outputStream":Ljava/io/OutputStream;
    :cond_69
    :try_start_69
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_6c} :catch_38
    .catchall {:try_start_69 .. :try_end_6c} :catchall_61

    .line 375
    .end local v3    # "outputStream":Ljava/io/OutputStream;
    :cond_6c
    invoke-virtual {p2, v1}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 376
    invoke-virtual {v1, p2}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    goto :goto_42
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 335
    invoke-super {p0, p1}, Lcom/koushikdutta/async/FilteredDataEmitter;->report(Ljava/lang/Exception;)V

    .line 336
    if-eqz p1, :cond_8

    .line 337
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware$BodyCacher;->abort()V

    .line 338
    :cond_8
    return-void
.end method
