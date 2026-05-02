.class abstract Lcom/koushikdutta/ion/BitmapCallback;
.super Ljava/lang/Object;
.source "BitmapCallback.java"


# instance fields
.field final ion:Lcom/koushikdutta/ion/Ion;

.field final key:Ljava/lang/String;

.field final put:Z


# direct methods
.method protected constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "put"    # Z

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p2, p0, Lcom/koushikdutta/ion/BitmapCallback;->key:Ljava/lang/String;

    .line 88
    iput-boolean p3, p0, Lcom/koushikdutta/ion/BitmapCallback;->put:Z

    .line 89
    iput-object p1, p0, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    .line 91
    iget-object v0, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v0, p2, p0}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public static getBitmapSnapshot(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 6
    .param p0, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p1, "transformKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/ion/Ion;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/PostProcess;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "postProcess":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/bitmap/PostProcess;>;"
    iget-object v1, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 84
    :goto_8
    return-void

    .line 47
    :cond_9
    new-instance v0, Lcom/koushikdutta/ion/LoadBitmapBase;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lcom/koushikdutta/ion/LoadBitmapBase;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 48
    .local v0, "callback":Lcom/koushikdutta/ion/BitmapCallback;
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/BitmapCallback$1;

    invoke-direct {v2, p0, p1, v0, p2}, Lcom/koushikdutta/ion/BitmapCallback$1;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Lcom/koushikdutta/ion/BitmapCallback;Ljava/util/ArrayList;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_8
.end method

.method public static saveBitmapSnapshot(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 9
    .param p0, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p1, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 23
    iget-object v4, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-nez v4, :cond_5

    .line 41
    :cond_4
    :goto_4
    return-void

    .line 25
    :cond_5
    iget-object v4, p0, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v0

    .line 26
    .local v0, "cache":Lcom/koushikdutta/async/util/FileCache;
    if-eqz v0, :cond_4

    .line 28
    invoke-virtual {v0}, Lcom/koushikdutta/async/util/FileCache;->getTempFile()Ljava/io/File;

    move-result-object v3

    .line 30
    .local v3, "tempFile":Ljava/io/File;
    :try_start_11
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 31
    .local v2, "out":Ljava/io/FileOutputStream;
    iget-object v4, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v4

    if-eqz v4, :cond_39

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 32
    .local v1, "format":Landroid/graphics/Bitmap$CompressFormat;
    :goto_20
    iget-object v4, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    const/16 v5, 0x64

    invoke-virtual {v4, v1, v5, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 33
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 34
    iget-object v4, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->key:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/io/File;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-virtual {v0, v4, v5}, Lcom/koushikdutta/async/util/FileCache;->commitTempFiles(Ljava/lang/String;[Ljava/io/File;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_35} :catch_3c
    .catchall {:try_start_11 .. :try_end_35} :catchall_41

    .line 39
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_4

    .line 31
    .end local v1    # "format":Landroid/graphics/Bitmap$CompressFormat;
    :cond_39
    :try_start_39
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_3b} :catch_3c
    .catchall {:try_start_39 .. :try_end_3b} :catchall_41

    goto :goto_20

    .line 36
    .end local v2    # "out":Ljava/io/FileOutputStream;
    :catch_3c
    move-exception v4

    .line 39
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_4

    :catchall_41
    move-exception v4

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    throw v4
.end method


# virtual methods
.method protected onReported()V
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion;->processDeferred()V

    .line 102
    return-void
.end method

.method put()Z
    .registers 2

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/koushikdutta/ion/BitmapCallback;->put:Z

    return v0
.end method

.method protected report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 105
    sget-object v0, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/koushikdutta/ion/BitmapCallback$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/koushikdutta/ion/BitmapCallback$2;-><init>(Lcom/koushikdutta/ion/BitmapCallback;Lcom/koushikdutta/ion/bitmap/BitmapInfo;Ljava/lang/Exception;)V

    invoke-static {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 136
    if-eqz p2, :cond_28

    iget-object v0, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    if-eqz v0, :cond_28

    iget-object v0, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-nez v0, :cond_28

    iget-boolean v0, p0, Lcom/koushikdutta/ion/BitmapCallback;->put:Z

    if-eqz v0, :cond_28

    iget-object v0, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_28

    iget-object v0, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-nez v0, :cond_28

    .line 144
    invoke-virtual {p2}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->sizeOf()I

    move-result v0

    const/high16 v1, 0x100000

    if-le v0, v1, :cond_29

    .line 149
    :cond_28
    :goto_28
    return-void

    .line 148
    :cond_29
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-static {v0, p2}, Lcom/koushikdutta/ion/BitmapCallback;->saveBitmapSnapshot(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_28
.end method
