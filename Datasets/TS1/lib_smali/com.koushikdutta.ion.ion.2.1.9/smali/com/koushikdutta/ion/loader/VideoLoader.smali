.class public Lcom/koushikdutta/ion/loader/VideoLoader;
.super Lcom/koushikdutta/ion/loader/SimpleLoader;
.source "VideoLoader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/koushikdutta/ion/loader/SimpleLoader;-><init>()V

    return-void
.end method

.method public static createVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "filePath"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 28
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 29
    .local v0, "retriever":Landroid/media/MediaMetadataRetriever;
    invoke-virtual {v0, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 31
    :try_start_8
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime()Landroid/graphics/Bitmap;
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_10

    move-result-object v1

    .line 34
    :try_start_c
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f} :catch_15

    .line 36
    :goto_f
    return-object v1

    .line 33
    :catchall_10
    move-exception v1

    .line 34
    :try_start_11
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_17

    .line 36
    :goto_14
    throw v1

    .line 35
    :catch_15
    move-exception v2

    goto :goto_f

    :catch_17
    move-exception v2

    goto :goto_14
.end method

.method static mustUseThumbnailUtils()Z
    .registers 2

    .prologue
    .line 43
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "samsung"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
    .registers 17
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "uri"    # Ljava/lang/String;
    .param p5, "resizeWidth"    # I
    .param p6, "resizeHeight"    # I
    .param p7, "animateGif"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/koushikdutta/ion/Ion;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIZ)",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    const-string v0, "file"

    invoke-virtual {p4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 49
    const/4 v3, 0x0

    .line 93
    :goto_9
    return-object v3

    .line 51
    :cond_a
    invoke-static {p4}, Lcom/koushikdutta/ion/loader/MediaFile;->getFileType(Ljava/lang/String;)Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;

    move-result-object v7

    .line 52
    .local v7, "type":Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;
    if-eqz v7, :cond_18

    iget v0, v7, Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;->fileType:I

    invoke-static {v0}, Lcom/koushikdutta/ion/loader/MediaFile;->isVideoFileType(I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 53
    :cond_18
    const/4 v3, 0x0

    goto :goto_9

    .line 55
    :cond_1a
    new-instance v3, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v3}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 56
    .local v3, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    new-instance v0, Lcom/koushikdutta/ion/loader/VideoLoader$1;

    move-object v1, p0

    move-object v2, p4

    move v4, p5

    move v5, p6

    move-object v6, p3

    invoke-direct/range {v0 .. v7}, Lcom/koushikdutta/ion/loader/VideoLoader$1;-><init>(Lcom/koushikdutta/ion/loader/VideoLoader;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;IILjava/lang/String;Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;)V

    invoke-interface {v8, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_9
.end method
