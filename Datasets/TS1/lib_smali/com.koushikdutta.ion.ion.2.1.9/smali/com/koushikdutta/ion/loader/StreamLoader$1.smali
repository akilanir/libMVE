.class Lcom/koushikdutta/ion/loader/StreamLoader$1;
.super Ljava/lang/Object;
.source "StreamLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/StreamLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/StreamLoader;

.field final synthetic val$animateGif:Z

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$resizeHeight:I

.field final synthetic val$resizeWidth:I

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

.field final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/StreamLoader;Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;IIZLjava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 10
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/StreamLoader;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->this$0:Lcom/koushikdutta/ion/loader/StreamLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$uri:Ljava/lang/String;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput p5, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$resizeWidth:I

    iput p6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$resizeHeight:I

    iput-boolean p7, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$animateGif:Z

    iput-object p8, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$key:Ljava/lang/String;

    iput-object p9, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 47
    const/4 v2, 0x0

    .line 49
    .local v2, "in":Ljava/io/InputStream;
    :try_start_3
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->this$0:Lcom/koushikdutta/ion/loader/StreamLoader;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$context:Landroid/content/Context;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$uri:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/ion/loader/StreamLoader;->getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 50
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v6}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v6

    iget v7, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$resizeWidth:I

    iget v8, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$resizeHeight:I

    invoke-virtual {v6, v2, v7, v8}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Ljava/io/InputStream;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v4

    .line 51
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/io/Closeable;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v6}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 52
    new-instance v5, Landroid/graphics/Point;

    iget v6, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 54
    .local v5, "size":Landroid/graphics/Point;
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->this$0:Lcom/koushikdutta/ion/loader/StreamLoader;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$context:Landroid/content/Context;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$uri:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/ion/loader/StreamLoader;->getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 55
    iget-boolean v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$animateGif:Z

    if-eqz v6, :cond_5e

    const-string v6, "image/gif"

    iget-object v7, v4, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 56
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->this$0:Lcom/koushikdutta/ion/loader/StreamLoader;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$key:Ljava/lang/String;

    invoke-virtual {v6, v7, v5, v2, v4}, Lcom/koushikdutta/ion/loader/StreamLoader;->loadGif(Ljava/lang/String;Landroid/graphics/Point;Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v3

    .line 64
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :goto_4d
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v6, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 65
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v6, v3}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z
    :try_end_56
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_56} :catch_6c
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_56} :catch_8a
    .catchall {:try_start_3 .. :try_end_56} :catchall_98

    .line 74
    new-array v6, v10, [Ljava/io/Closeable;

    aput-object v2, v6, v9

    invoke-static {v6}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 76
    .end local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "size":Landroid/graphics/Point;
    :goto_5d
    return-void

    .line 59
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "size":Landroid/graphics/Point;
    :cond_5e
    :try_start_5e
    invoke-static {v2, v4}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadBitmap(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 60
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_80

    .line 61
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "Bitmap failed to load"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_6c
    .catch Ljava/lang/OutOfMemoryError; {:try_start_5e .. :try_end_6c} :catch_6c
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_6c} :catch_8a
    .catchall {:try_start_5e .. :try_end_6c} :catchall_98

    .line 67
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "size":Landroid/graphics/Point;
    :catch_6c
    move-exception v1

    .line 68
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    :try_start_6d
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    new-instance v7, Ljava/lang/Exception;

    invoke-direct {v7, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z
    :try_end_78
    .catchall {:try_start_6d .. :try_end_78} :catchall_98

    .line 74
    new-array v6, v10, [Ljava/io/Closeable;

    aput-object v2, v6, v9

    invoke-static {v6}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_5d

    .line 62
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "size":Landroid/graphics/Point;
    :cond_80
    :try_start_80
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$key:Ljava/lang/String;

    iget-object v7, v4, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {v3, v6, v7, v0, v5}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V
    :try_end_89
    .catch Ljava/lang/OutOfMemoryError; {:try_start_80 .. :try_end_89} :catch_6c
    .catch Ljava/lang/Exception; {:try_start_80 .. :try_end_89} :catch_8a
    .catchall {:try_start_80 .. :try_end_89} :catchall_98

    .restart local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    goto :goto_4d

    .line 70
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "size":Landroid/graphics/Point;
    :catch_8a
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/Exception;
    :try_start_8b
    iget-object v6, p0, Lcom/koushikdutta/ion/loader/StreamLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v6, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z
    :try_end_90
    .catchall {:try_start_8b .. :try_end_90} :catchall_98

    .line 74
    new-array v6, v10, [Ljava/io/Closeable;

    aput-object v2, v6, v9

    invoke-static {v6}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_5d

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_98
    move-exception v6

    new-array v7, v10, [Ljava/io/Closeable;

    aput-object v2, v7, v9

    invoke-static {v7}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    throw v6
.end method
