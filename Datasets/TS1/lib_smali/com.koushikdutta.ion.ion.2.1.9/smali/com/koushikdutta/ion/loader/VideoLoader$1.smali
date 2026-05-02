.class Lcom/koushikdutta/ion/loader/VideoLoader$1;
.super Ljava/lang/Object;
.source "VideoLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/VideoLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/VideoLoader;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$resizeHeight:I

.field final synthetic val$resizeWidth:I

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

.field final synthetic val$type:Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;

.field final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/VideoLoader;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;IILjava/lang/String;Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;)V
    .registers 8
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/VideoLoader;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->this$0:Lcom/koushikdutta/ion/loader/VideoLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$uri:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iput p4, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeWidth:I

    iput p5, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeHeight:I

    iput-object p6, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$key:Ljava/lang/String;

    iput-object p7, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$type:Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    .line 59
    new-instance v2, Ljava/io/File;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$uri:Ljava/lang/String;

    invoke-static {v8}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    .line 60
    .local v2, "file":Ljava/io/File;
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v8}, Lcom/koushikdutta/async/future/SimpleFuture;->isCancelled()Z

    move-result v8

    if-eqz v8, :cond_14

    .line 91
    :goto_13
    return-void

    .line 67
    :cond_14
    :try_start_14
    invoke-static {}, Lcom/koushikdutta/ion/loader/VideoLoader;->mustUseThumbnailUtils()Z

    move-result v8

    if-nez v8, :cond_20

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0xa

    if-ge v8, v9, :cond_3f

    .line 68
    :cond_20
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-static {v8, v9}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 71
    .local v0, "bmp":Landroid/graphics/Bitmap;
    :goto_29
    if-nez v0, :cond_48

    .line 72
    new-instance v8, Ljava/lang/Exception;

    const-string v9, "video bitmap failed to load"

    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_33
    .catch Ljava/lang/OutOfMemoryError; {:try_start_14 .. :try_end_33} :catch_33
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_33} :catch_af

    .line 86
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    :catch_33
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    new-instance v9, Ljava/lang/Exception;

    invoke-direct {v9, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_13

    .line 70
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    :cond_3f
    :try_start_3f
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/koushikdutta/ion/loader/VideoLoader;->createVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0    # "bmp":Landroid/graphics/Bitmap;
    goto :goto_29

    .line 74
    :cond_48
    new-instance v4, Landroid/graphics/Point;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    invoke-direct {v4, v8, v9}, Landroid/graphics/Point;-><init>(II)V

    .line 75
    .local v4, "originalSize":Landroid/graphics/Point;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    iget v9, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeWidth:I

    mul-int/lit8 v9, v9, 0x2

    if-le v8, v9, :cond_99

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    iget v9, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeHeight:I

    mul-int/lit8 v9, v9, 0x2

    if-le v8, v9, :cond_99

    .line 76
    iget v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeWidth:I

    int-to-float v8, v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-float v9, v9

    div-float v6, v8, v9

    .line 77
    .local v6, "xratio":F
    iget v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$resizeHeight:I

    int-to-float v8, v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float v7, v8, v9

    .line 78
    .local v7, "yratio":F
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 79
    .local v5, "ratio":F
    const/4 v8, 0x0

    cmpl-float v8, v5, v8

    if-eqz v8, :cond_99

    .line 80
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v5

    float-to-int v8, v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    float-to-int v9, v9

    const/4 v10, 0x1

    invoke-static {v0, v8, v9, v10}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 82
    .end local v5    # "ratio":F
    .end local v6    # "xratio":F
    .end local v7    # "yratio":F
    :cond_99
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$key:Ljava/lang/String;

    iget-object v9, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$type:Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;

    iget-object v9, v9, Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;->mimeType:Ljava/lang/String;

    invoke-direct {v3, v8, v9, v0, v4}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 83
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    sget-object v8, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v8, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 84
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v8, v3}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z
    :try_end_ad
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3f .. :try_end_ad} :catch_33
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_ad} :catch_af

    goto/16 :goto_13

    .line 88
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    .end local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v4    # "originalSize":Landroid/graphics/Point;
    :catch_af
    move-exception v1

    .line 89
    .local v1, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/VideoLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v8, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    goto/16 :goto_13
.end method
