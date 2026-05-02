.class Lcom/koushikdutta/ion/loader/FileLoader$1;
.super Ljava/lang/Object;
.source "FileLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/FileLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/FileLoader;

.field final synthetic val$animateGif:Z

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$resizeHeight:I

.field final synthetic val$resizeWidth:I

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

.field final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/FileLoader;Lcom/koushikdutta/async/future/SimpleFuture;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;IIZLjava/lang/String;)V
    .registers 9
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/FileLoader;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->this$0:Lcom/koushikdutta/ion/loader/FileLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$uri:Ljava/lang/String;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput p5, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$resizeWidth:I

    iput p6, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$resizeHeight:I

    iput-boolean p7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$animateGif:Z

    iput-object p8, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    .line 45
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v7}, Lcom/koushikdutta/async/future/SimpleFuture;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 78
    :goto_8
    return-void

    .line 50
    :cond_9
    :try_start_9
    new-instance v2, Ljava/io/File;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$uri:Ljava/lang/String;

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    .line 51
    .local v2, "file":Ljava/io/File;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v7}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v7

    iget v8, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$resizeWidth:I

    iget v9, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$resizeHeight:I

    invoke-virtual {v7, v2, v8, v9}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->prepareBitmapOptions(Ljava/io/File;II)Landroid/graphics/BitmapFactory$Options;

    move-result-object v5

    .line 52
    .local v5, "options":Landroid/graphics/BitmapFactory$Options;
    new-instance v6, Landroid/graphics/Point;

    iget v7, v5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v8, v5, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v6, v7, v8}, Landroid/graphics/Point;-><init>(II)V

    .line 54
    .local v6, "size":Landroid/graphics/Point;
    iget-boolean v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$animateGif:Z

    if-eqz v7, :cond_78

    const-string v7, "image/gif"

    iget-object v8, v5, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_78

    .line 55
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_3e
    .catch Ljava/lang/OutOfMemoryError; {:try_start_9 .. :try_end_3e} :catch_59
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_3e} :catch_71

    .line 57
    .local v3, "fin":Ljava/io/FileInputStream;
    :try_start_3e
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->this$0:Lcom/koushikdutta/ion/loader/FileLoader;

    iget-object v8, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$key:Ljava/lang/String;

    invoke-virtual {v7, v8, v6, v3, v5}, Lcom/koushikdutta/ion/loader/FileLoader;->loadGif(Ljava/lang/String;Landroid/graphics/Point;Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :try_end_45
    .catchall {:try_start_3e .. :try_end_45} :catchall_66

    move-result-object v4

    .line 60
    .local v4, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    const/4 v7, 0x1

    :try_start_47
    new-array v7, v7, [Ljava/io/Closeable;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    invoke-static {v7}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 69
    .end local v3    # "fin":Ljava/io/FileInputStream;
    :goto_4f
    sget-object v7, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v7, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 70
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v7, v4}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z
    :try_end_58
    .catch Ljava/lang/OutOfMemoryError; {:try_start_47 .. :try_end_58} :catch_59
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_58} :catch_71

    goto :goto_8

    .line 72
    .end local v2    # "file":Ljava/io/File;
    .end local v4    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v5    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v6    # "size":Landroid/graphics/Point;
    :catch_59
    move-exception v1

    .line 73
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    new-instance v8, Ljava/lang/Exception;

    invoke-direct {v8, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    goto :goto_8

    .line 60
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fin":Ljava/io/FileInputStream;
    .restart local v5    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v6    # "size":Landroid/graphics/Point;
    :catchall_66
    move-exception v7

    const/4 v8, 0x1

    :try_start_68
    new-array v8, v8, [Ljava/io/Closeable;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    invoke-static {v8}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    throw v7
    :try_end_71
    .catch Ljava/lang/OutOfMemoryError; {:try_start_68 .. :try_end_71} :catch_59
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_71} :catch_71

    .line 75
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .end local v5    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v6    # "size":Landroid/graphics/Point;
    :catch_71
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v7, v1}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_8

    .line 64
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v5    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v6    # "size":Landroid/graphics/Point;
    :cond_78
    :try_start_78
    invoke-static {v2, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadBitmap(Ljava/io/File;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 65
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_86

    .line 66
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "Bitmap failed to load"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7

    .line 67
    :cond_86
    new-instance v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v7, p0, Lcom/koushikdutta/ion/loader/FileLoader$1;->val$key:Ljava/lang/String;

    iget-object v8, v5, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {v4, v7, v8, v0, v6}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V
    :try_end_8f
    .catch Ljava/lang/OutOfMemoryError; {:try_start_78 .. :try_end_8f} :catch_59
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_8f} :catch_71

    .restart local v4    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    goto :goto_4f
.end method
