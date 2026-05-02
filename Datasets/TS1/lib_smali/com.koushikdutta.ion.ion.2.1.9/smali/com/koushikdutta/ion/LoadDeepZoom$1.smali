.class Lcom/koushikdutta/ion/LoadDeepZoom$1;
.super Ljava/lang/Object;
.source "LoadDeepZoom.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/LoadDeepZoom;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

.field final synthetic val$response:Lcom/koushikdutta/ion/Response;

.field final synthetic val$tempFile:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/LoadDeepZoom;Ljava/io/File;Lcom/koushikdutta/ion/Response;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/LoadDeepZoom;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iput-object p2, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->val$tempFile:Ljava/io/File;

    iput-object p3, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->val$response:Lcom/koushikdutta/ion/Response;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    .line 54
    const/4 v4, 0x0

    .line 58
    .local v4, "fin":Ljava/io/FileInputStream;
    :try_start_1
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->fileCache:Lcom/koushikdutta/async/util/FileCache;

    if-eqz v10, :cond_89

    .line 59
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->fileCache:Lcom/koushikdutta/async/util/FileCache;

    iget-object v11, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v11, v11, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/io/File;

    const/4 v13, 0x0

    iget-object v14, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->val$tempFile:Ljava/io/File;

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Lcom/koushikdutta/async/util/FileCache;->commitTempFiles(Ljava/lang/String;[Ljava/io/File;)V

    .line 60
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->fileCache:Lcom/koushikdutta/async/util/FileCache;

    iget-object v11, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v11, v11, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/koushikdutta/async/util/FileCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 66
    .local v3, "file":Ljava/io/File;
    :goto_26
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v10}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v10, v3, v11, v12}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Ljava/io/File;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v8

    .line 67
    .local v8, "options":Landroid/graphics/BitmapFactory$Options;
    new-instance v9, Landroid/graphics/Point;

    iget v10, v8, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v11, v8, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v9, v10, v11}, Landroid/graphics/Point;-><init>(II)V

    .line 68
    .local v9, "size":Landroid/graphics/Point;
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-boolean v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->animateGif:Z

    if-eqz v10, :cond_8c

    const-string v10, "image/gif"

    iget-object v11, v8, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v10, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_8c

    .line 69
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->fileCache:Lcom/koushikdutta/async/util/FileCache;

    iget-object v11, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v11, v11, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lcom/koushikdutta/async/util/FileCache;->get(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v4

    .line 71
    new-instance v6, Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-static {v4}, Lcom/koushikdutta/async/util/StreamUtility;->readToEndAsArray(Ljava/io/InputStream;)[B

    move-result-object v10

    invoke-static {v10}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-direct {v6, v10}, Lcom/koushikdutta/ion/gif/GifDecoder;-><init>(Ljava/nio/ByteBuffer;)V

    .line 72
    .local v6, "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    invoke-virtual {v6}, Lcom/koushikdutta/ion/gif/GifDecoder;->nextFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v5

    .line 73
    .local v5, "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    new-instance v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    iget-object v11, v8, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    iget-object v12, v5, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    invoke-direct {v7, v10, v11, v12, v9}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 74
    .local v7, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iput-object v6, v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    .line 75
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v7}, Lcom/koushikdutta/ion/LoadDeepZoom;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_7f} :catch_ae
    .catchall {:try_start_1 .. :try_end_7f} :catchall_e6

    .line 93
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/io/Closeable;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v10}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 95
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    .end local v6    # "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    .end local v7    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v8    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v9    # "size":Landroid/graphics/Point;
    :goto_88
    return-void

    .line 64
    :cond_89
    :try_start_89
    iget-object v3, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->val$tempFile:Ljava/io/File;

    .restart local v3    # "file":Ljava/io/File;
    goto :goto_26

    .line 79
    .restart local v8    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v9    # "size":Landroid/graphics/Point;
    :cond_8c
    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v1

    .line 80
    .local v1, "decoder":Landroid/graphics/BitmapRegionDecoder;
    new-instance v10, Landroid/graphics/Rect;

    const/4 v11, 0x0

    const/4 v12, 0x0

    iget v13, v9, Landroid/graphics/Point;->x:I

    iget v14, v9, Landroid/graphics/Point;->y:I

    invoke-direct {v10, v11, v12, v13, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, v10, v8}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 81
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_bf

    .line 82
    new-instance v10, Ljava/lang/Exception;

    const-string v11, "unable to load decoder"

    invoke-direct {v10, v11}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_ae} :catch_ae
    .catchall {:try_start_89 .. :try_end_ae} :catchall_e6

    .line 89
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "decoder":Landroid/graphics/BitmapRegionDecoder;
    .end local v3    # "file":Ljava/io/File;
    .end local v8    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v9    # "size":Landroid/graphics/Point;
    :catch_ae
    move-exception v2

    .line 90
    .local v2, "e":Ljava/lang/Exception;
    :try_start_af
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    const/4 v11, 0x0

    invoke-virtual {v10, v2, v11}, Lcom/koushikdutta/ion/LoadDeepZoom;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_b5
    .catchall {:try_start_af .. :try_end_b5} :catchall_e6

    .line 93
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/io/Closeable;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v10}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_88

    .line 84
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "decoder":Landroid/graphics/BitmapRegionDecoder;
    .restart local v3    # "file":Ljava/io/File;
    .restart local v8    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v9    # "size":Landroid/graphics/Point;
    :cond_bf
    :try_start_bf
    new-instance v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v10, v10, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    iget-object v11, v8, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {v7, v10, v11, v0, v9}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 85
    .restart local v7    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iput-object v1, v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    .line 86
    iput-object v3, v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoderFile:Ljava/io/File;

    .line 87
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->val$response:Lcom/koushikdutta/ion/Response;

    invoke-virtual {v10}, Lcom/koushikdutta/ion/Response;->getServedFrom()Lcom/koushikdutta/ion/ResponseServedFrom;

    move-result-object v10

    iput-object v10, v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 88
    iget-object v10, p0, Lcom/koushikdutta/ion/LoadDeepZoom$1;->this$0:Lcom/koushikdutta/ion/LoadDeepZoom;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v7}, Lcom/koushikdutta/ion/LoadDeepZoom;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_dc} :catch_ae
    .catchall {:try_start_bf .. :try_end_dc} :catchall_e6

    .line 93
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/io/Closeable;

    const/4 v11, 0x0

    aput-object v4, v10, v11

    invoke-static {v10}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_88

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "decoder":Landroid/graphics/BitmapRegionDecoder;
    .end local v3    # "file":Ljava/io/File;
    .end local v7    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v8    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v9    # "size":Landroid/graphics/Point;
    :catchall_e6
    move-exception v10

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/io/Closeable;

    const/4 v12, 0x0

    aput-object v4, v11, v12

    invoke-static {v11}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    throw v10
.end method
