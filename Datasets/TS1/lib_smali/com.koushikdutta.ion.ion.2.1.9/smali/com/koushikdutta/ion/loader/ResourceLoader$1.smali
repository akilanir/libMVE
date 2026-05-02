.class Lcom/koushikdutta/ion/loader/ResourceLoader$1;
.super Ljava/lang/Object;
.source "ResourceLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/ResourceLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/ResourceLoader;

.field final synthetic val$animateGif:Z

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$resizeHeight:I

.field final synthetic val$resizeWidth:I

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

.field final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/ResourceLoader;Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;IIZLjava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 10
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/ResourceLoader;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->this$0:Lcom/koushikdutta/ion/loader/ResourceLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$uri:Ljava/lang/String;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput p5, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$resizeWidth:I

    iput p6, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$resizeHeight:I

    iput-boolean p7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$animateGif:Z

    iput-object p8, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$key:Ljava/lang/String;

    iput-object p9, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    .line 73
    :try_start_0
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$context:Landroid/content/Context;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$uri:Ljava/lang/String;

    # invokes: Lcom/koushikdutta/ion/loader/ResourceLoader;->lookupResource(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    invoke-static {v7, v8}, Lcom/koushikdutta/ion/loader/ResourceLoader;->access$100(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;

    move-result-object v5

    .line 74
    .local v5, "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v7}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v7

    iget-object v8, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->res:Landroid/content/res/Resources;

    iget v9, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->id:I

    iget v10, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$resizeWidth:I

    iget v11, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$resizeHeight:I

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Landroid/content/res/Resources;III)Landroid/graphics/BitmapFactory$Options;

    move-result-object v4

    .line 75
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    new-instance v6, Landroid/graphics/Point;

    iget v7, v4, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v8, v4, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v6, v7, v8}, Landroid/graphics/Point;-><init>(II)V

    .line 77
    .local v6, "size":Landroid/graphics/Point;
    iget-boolean v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$animateGif:Z

    if-eqz v7, :cond_6c

    const-string v7, "image/gif"

    iget-object v8, v4, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6c

    .line 78
    iget-object v7, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->res:Landroid/content/res/Resources;

    iget v8, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->id:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;
    :try_end_38
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_38} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_38} :catch_7e

    move-result-object v2

    .line 80
    .local v2, "in":Ljava/io/InputStream;
    :try_start_39
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->this$0:Lcom/koushikdutta/ion/loader/ResourceLoader;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$key:Ljava/lang/String;

    invoke-virtual {v7, v8, v6, v2, v4}, Lcom/koushikdutta/ion/loader/ResourceLoader;->loadGif(Ljava/lang/String;Landroid/graphics/Point;Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :try_end_40
    .catchall {:try_start_39 .. :try_end_40} :catchall_54

    move-result-object v3

    .line 83
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    const/4 v7, 0x1

    :try_start_42
    new-array v7, v7, [Ljava/io/Closeable;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-static {v7}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 92
    .end local v2    # "in":Ljava/io/InputStream;
    :goto_4a
    sget-object v7, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v7, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 93
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v7, v3}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 101
    .end local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .end local v6    # "size":Landroid/graphics/Point;
    :goto_53
    return-void

    .line 83
    .restart local v2    # "in":Ljava/io/InputStream;
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .restart local v6    # "size":Landroid/graphics/Point;
    :catchall_54
    move-exception v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/io/Closeable;

    const/4 v9, 0x0

    aput-object v2, v8, v9

    invoke-static {v8}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    throw v7
    :try_end_5f
    .catch Ljava/lang/OutOfMemoryError; {:try_start_42 .. :try_end_5f} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_5f} :catch_7e

    .line 95
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .end local v6    # "size":Landroid/graphics/Point;
    :catch_5f
    move-exception v1

    .line 96
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    new-instance v8, Ljava/lang/Exception;

    invoke-direct {v8, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_53

    .line 87
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .restart local v6    # "size":Landroid/graphics/Point;
    :cond_6c
    :try_start_6c
    iget-object v7, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->res:Landroid/content/res/Resources;

    iget v8, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->id:I

    invoke-static {v7, v8, v4}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadBitmap(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 88
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_85

    .line 89
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "Bitmap failed to load"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_7e
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6c .. :try_end_7e} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_7e} :catch_7e

    .line 98
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .end local v6    # "size":Landroid/graphics/Point;
    :catch_7e
    move-exception v1

    .line 99
    .local v1, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v7, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_53

    .line 90
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v4    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v5    # "res":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .restart local v6    # "size":Landroid/graphics/Point;
    :cond_85
    :try_start_85
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;->val$key:Ljava/lang/String;

    iget-object v8, v4, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {v3, v7, v8, v0, v6}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V
    :try_end_8e
    .catch Ljava/lang/OutOfMemoryError; {:try_start_85 .. :try_end_8e} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_8e} :catch_7e

    .restart local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    goto :goto_4a
.end method
