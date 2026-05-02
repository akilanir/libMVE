.class public Lcom/koushikdutta/ion/loader/StreamLoader;
.super Lcom/koushikdutta/ion/loader/SimpleLoader;
.source "StreamLoader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/koushikdutta/ion/loader/SimpleLoader;-><init>()V

    return-void
.end method


# virtual methods
.method protected getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
    .registers 19
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
    .line 41
    new-instance v9, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v9}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 44
    .local v9, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v10

    new-instance v0, Lcom/koushikdutta/ion/loader/StreamLoader$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p4

    move-object v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object v8, p3

    invoke-direct/range {v0 .. v9}, Lcom/koushikdutta/ion/loader/StreamLoader$1;-><init>(Lcom/koushikdutta/ion/loader/StreamLoader;Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;IIZLjava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {v10, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 79
    return-object v9
.end method

.method protected loadGif(Ljava/lang/String;Landroid/graphics/Point;Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 10
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "size"    # Landroid/graphics/Point;
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "options"    # Landroid/graphics/BitmapFactory$Options;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 28
    new-instance v1, Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-static {p3}, Lcom/koushikdutta/async/util/StreamUtility;->readToEndAsArray(Ljava/io/InputStream;)[B

    move-result-object v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/koushikdutta/ion/gif/GifDecoder;-><init>(Ljava/nio/ByteBuffer;)V

    .line 29
    .local v1, "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    invoke-virtual {v1}, Lcom/koushikdutta/ion/gif/GifDecoder;->nextFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v0

    .line 30
    .local v0, "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    new-instance v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, p4, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    iget-object v4, v0, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    invoke-direct {v2, p1, v3, v4, p2}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 31
    .local v2, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iput-object v1, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    .line 32
    return-object v2
.end method
