.class Lcom/koushikdutta/ion/LoadBitmap$1;
.super Ljava/lang/Object;
.source "LoadBitmap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/LoadBitmap;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/LoadBitmap;

.field final synthetic val$response:Lcom/koushikdutta/ion/Response;

.field final synthetic val$result:Lcom/koushikdutta/async/ByteBufferList;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/LoadBitmap;Lcom/koushikdutta/async/ByteBufferList;Lcom/koushikdutta/ion/Response;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/LoadBitmap;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iput-object p2, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->val$result:Lcom/koushikdutta/async/ByteBufferList;

    iput-object p3, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->val$response:Lcom/koushikdutta/ion/Response;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .prologue
    .line 45
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget-object v0, v0, Lcom/koushikdutta/ion/LoadBitmap;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v1, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget-object v1, v1, Lcom/koushikdutta/ion/LoadBitmap;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    if-eq v0, v1, :cond_18

    .line 46
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->val$result:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 88
    :goto_17
    return-void

    .line 50
    :cond_18
    const/4 v6, 0x0

    .line 52
    .local v6, "bb":Ljava/nio/ByteBuffer;
    :try_start_19
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->val$result:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->getAll()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 56
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget-object v0, v0, Lcom/koushikdutta/ion/LoadBitmap;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    iget-object v4, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget v4, v4, Lcom/koushikdutta/ion/LoadBitmap;->resizeWidth:I

    iget-object v5, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget v5, v5, Lcom/koushikdutta/ion/LoadBitmap;->resizeHeight:I

    invoke-virtual/range {v0 .. v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions([BIIII)Landroid/graphics/BitmapFactory$Options;

    move-result-object v12

    .line 57
    .local v12, "options":Landroid/graphics/BitmapFactory$Options;
    new-instance v13, Landroid/graphics/Point;

    iget v0, v12, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, v12, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v13, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 58
    .local v13, "size":Landroid/graphics/Point;
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget-boolean v0, v0, Lcom/koushikdutta/ion/LoadBitmap;->animateGif:Z

    if-eqz v0, :cond_97

    const-string v0, "image/gif"

    iget-object v1, v12, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_97

    .line 60
    new-instance v10, Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-direct {v10, v0, v1, v2}, Lcom/koushikdutta/ion/gif/GifDecoder;-><init>([BII)V

    .line 61
    .local v10, "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    invoke-virtual {v10}, Lcom/koushikdutta/ion/gif/GifDecoder;->nextFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v9

    .line 62
    .local v9, "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    iget-object v7, v9, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    .line 64
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    const/4 v6, 0x0

    .line 73
    .end local v9    # "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    :cond_78
    new-instance v11, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    iget-object v0, v0, Lcom/koushikdutta/ion/LoadBitmap;->key:Ljava/lang/String;

    iget-object v1, v12, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {v11, v0, v1, v7, v13}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 74
    .local v11, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iput-object v10, v11, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    .line 75
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->val$response:Lcom/koushikdutta/ion/Response;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Response;->getServedFrom()Lcom/koushikdutta/ion/ResponseServedFrom;

    move-result-object v0

    iput-object v0, v11, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 77
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v11}, Lcom/koushikdutta/ion/LoadBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_93
    .catch Ljava/lang/OutOfMemoryError; {:try_start_19 .. :try_end_93} :catch_b7
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_93} :catch_c8
    .catchall {:try_start_19 .. :try_end_93} :catchall_d4

    .line 86
    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_17

    .line 67
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v10    # "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    .end local v11    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_97
    :try_start_97
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v0, v1, v2, v12}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadBitmap([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 68
    .restart local v7    # "bitmap":Landroid/graphics/Bitmap;
    const/4 v10, 0x0

    .line 69
    .restart local v10    # "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    if-nez v7, :cond_78

    .line 70
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "failed to load bitmap"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_97 .. :try_end_b7} :catch_b7
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_b7} :catch_c8
    .catchall {:try_start_97 .. :try_end_b7} :catchall_d4

    .line 79
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v10    # "gifDecoder":Lcom/koushikdutta/ion/gif/GifDecoder;
    .end local v12    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v13    # "size":Landroid/graphics/Point;
    :catch_b7
    move-exception v8

    .line 80
    .local v8, "e":Ljava/lang/OutOfMemoryError;
    :try_start_b8
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/ion/LoadBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_c3
    .catchall {:try_start_b8 .. :try_end_c3} :catchall_d4

    .line 86
    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto/16 :goto_17

    .line 82
    .end local v8    # "e":Ljava/lang/OutOfMemoryError;
    :catch_c8
    move-exception v8

    .line 83
    .local v8, "e":Ljava/lang/Exception;
    :try_start_c9
    iget-object v0, p0, Lcom/koushikdutta/ion/LoadBitmap$1;->this$0:Lcom/koushikdutta/ion/LoadBitmap;

    const/4 v1, 0x0

    invoke-virtual {v0, v8, v1}, Lcom/koushikdutta/ion/LoadBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_cf
    .catchall {:try_start_c9 .. :try_end_cf} :catchall_d4

    .line 86
    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto/16 :goto_17

    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_d4
    move-exception v0

    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    throw v0
.end method
