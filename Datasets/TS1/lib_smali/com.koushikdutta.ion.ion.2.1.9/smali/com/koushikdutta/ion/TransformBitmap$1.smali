.class Lcom/koushikdutta/ion/TransformBitmap$1;
.super Ljava/lang/Object;
.source "TransformBitmap.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/TransformBitmap;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/TransformBitmap;

.field final synthetic val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/TransformBitmap;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/TransformBitmap;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iput-object p2, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 56
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v6, v6, Lcom/koushikdutta/ion/TransformBitmap;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v7, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v7, v7, Lcom/koushikdutta/ion/TransformBitmap;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    if-eq v6, v7, :cond_14

    .line 86
    :goto_13
    return-void

    .line 63
    :cond_14
    :try_start_14
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    .line 64
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v6, v6, Lcom/koushikdutta/ion/TransformBitmap;->transforms:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_20
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_46

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/koushikdutta/ion/bitmap/Transform;

    .line 65
    .local v5, "transform":Lcom/koushikdutta/ion/bitmap/Transform;
    invoke-interface {v5, v0}, Lcom/koushikdutta/ion/bitmap/Transform;->transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 66
    if-nez v0, :cond_20

    .line 67
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "failed to transform bitmap"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_3a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_14 .. :try_end_3a} :catch_3a
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_3a} :catch_7b

    .line 80
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "transform":Lcom/koushikdutta/ion/bitmap/Transform;
    :catch_3a
    move-exception v1

    .line 81
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    new-instance v7, Ljava/lang/Exception;

    invoke-direct {v7, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7, v9}, Lcom/koushikdutta/ion/TransformBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_13

    .line 69
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_46
    :try_start_46
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v6, v6, Lcom/koushikdutta/ion/TransformBitmap;->key:Ljava/lang/String;

    iget-object v7, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v7, v7, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->mimeType:Ljava/lang/String;

    iget-object v8, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v8, v8, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    invoke-direct {v3, v6, v7, v0, v8}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 70
    .local v3, "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->val$result:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    iput-object v6, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 72
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v6, v6, Lcom/koushikdutta/ion/TransformBitmap;->postProcess:Ljava/util/ArrayList;

    if-eqz v6, :cond_82

    .line 73
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v6, v6, Lcom/koushikdutta/ion/TransformBitmap;->postProcess:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_82

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/koushikdutta/ion/bitmap/PostProcess;

    .line 74
    .local v4, "p":Lcom/koushikdutta/ion/bitmap/PostProcess;
    invoke-interface {v4, v3}, Lcom/koushikdutta/ion/bitmap/PostProcess;->postProcess(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_7a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_46 .. :try_end_7a} :catch_3a
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_7a} :catch_7b

    goto :goto_6b

    .line 83
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .end local v4    # "p":Lcom/koushikdutta/ion/bitmap/PostProcess;
    :catch_7b
    move-exception v1

    .line 84
    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    invoke-virtual {v6, v1, v9}, Lcom/koushikdutta/ion/TransformBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_13

    .line 78
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "info":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_82
    :try_start_82
    iget-object v6, p0, Lcom/koushikdutta/ion/TransformBitmap$1;->this$0:Lcom/koushikdutta/ion/TransformBitmap;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v3}, Lcom/koushikdutta/ion/TransformBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    :try_end_88
    .catch Ljava/lang/OutOfMemoryError; {:try_start_82 .. :try_end_88} :catch_3a
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_88} :catch_7b

    goto :goto_13
.end method
