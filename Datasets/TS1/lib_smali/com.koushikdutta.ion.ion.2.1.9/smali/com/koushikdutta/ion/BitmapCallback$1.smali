.class final Lcom/koushikdutta/ion/BitmapCallback$1;
.super Ljava/lang/Object;
.source "BitmapCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/BitmapCallback;->getBitmapSnapshot(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/koushikdutta/ion/BitmapCallback;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$postProcess:Ljava/util/ArrayList;

.field final synthetic val$transformKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Lcom/koushikdutta/ion/BitmapCallback;Ljava/util/ArrayList;)V
    .registers 5

    .prologue
    .line 48
    iput-object p1, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput-object p2, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$transformKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$callback:Lcom/koushikdutta/ion/BitmapCallback;

    iput-object p4, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$postProcess:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 51
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v7, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$transformKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$callback:Lcom/koushikdutta/ion/BitmapCallback;

    if-eq v6, v7, :cond_10

    .line 82
    :goto_f
    return-void

    .line 57
    :cond_10
    :try_start_10
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$transformKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/koushikdutta/async/util/FileCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 58
    .local v2, "file":Ljava/io/File;
    const/4 v6, 0x0

    invoke-static {v2, v6}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->loadBitmap(Ljava/io/File;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 59
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_39

    .line 60
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "Bitmap failed to load"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2d
    .catch Ljava/lang/OutOfMemoryError; {:try_start_10 .. :try_end_2d} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_2d} :catch_61

    .line 72
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "file":Ljava/io/File;
    :catch_2d
    move-exception v1

    .line 73
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$callback:Lcom/koushikdutta/ion/BitmapCallback;

    new-instance v7, Ljava/lang/Exception;

    invoke-direct {v7, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7, v9}, Lcom/koushikdutta/ion/BitmapCallback;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_f

    .line 61
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "file":Ljava/io/File;
    :cond_39
    :try_start_39
    new-instance v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$transformKey:Ljava/lang/String;

    const-string v7, "image/jpeg"

    const/4 v8, 0x0

    invoke-direct {v4, v6, v7, v0, v8}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 62
    .local v4, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    sget-object v6, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v6, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 64
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$postProcess:Ljava/util/ArrayList;

    if-eqz v6, :cond_77

    .line 65
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$postProcess:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_51
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_77

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/koushikdutta/ion/bitmap/PostProcess;

    .line 66
    .local v5, "p":Lcom/koushikdutta/ion/bitmap/PostProcess;
    invoke-interface {v5, v4}, Lcom/koushikdutta/ion/bitmap/PostProcess;->postProcess(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_60
    .catch Ljava/lang/OutOfMemoryError; {:try_start_39 .. :try_end_60} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_60} :catch_61

    goto :goto_51

    .line 75
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v5    # "p":Lcom/koushikdutta/ion/bitmap/PostProcess;
    :catch_61
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$callback:Lcom/koushikdutta/ion/BitmapCallback;

    invoke-virtual {v6, v1, v9}, Lcom/koushikdutta/ion/BitmapCallback;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 78
    :try_start_67
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$transformKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_74} :catch_75

    goto :goto_f

    .line 79
    :catch_75
    move-exception v6

    goto :goto_f

    .line 70
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v4    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_77
    :try_start_77
    iget-object v6, p0, Lcom/koushikdutta/ion/BitmapCallback$1;->val$callback:Lcom/koushikdutta/ion/BitmapCallback;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v4}, Lcom/koushikdutta/ion/BitmapCallback;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_7d
    .catch Ljava/lang/OutOfMemoryError; {:try_start_77 .. :try_end_7d} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_7d} :catch_61

    goto :goto_f
.end method
