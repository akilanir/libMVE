.class Lcom/koushikdutta/ion/TransformBitmap;
.super Lcom/koushikdutta/ion/BitmapCallback;
.source "TransformBitmap.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/TransformBitmap$PostProcessNullTransform;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/BitmapCallback;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
        ">;"
    }
.end annotation


# instance fields
.field downloadKey:Ljava/lang/String;

.field postProcess:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/PostProcess;",
            ">;"
        }
    .end annotation
.end field

.field transforms:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/Transform;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 7
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "transformKey"    # Ljava/lang/String;
    .param p3, "downloadKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/ion/Ion;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/Transform;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/PostProcess;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p4, "transforms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/bitmap/Transform;>;"
    .local p5, "postProcess":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/bitmap/PostProcess;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/koushikdutta/ion/BitmapCallback;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 36
    iput-object p4, p0, Lcom/koushikdutta/ion/TransformBitmap;->transforms:Ljava/util/ArrayList;

    .line 37
    iput-object p3, p0, Lcom/koushikdutta/ion/TransformBitmap;->downloadKey:Ljava/lang/String;

    .line 38
    iput-object p5, p0, Lcom/koushikdutta/ion/TransformBitmap;->postProcess:Ljava/util/ArrayList;

    .line 39
    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 43
    if-eqz p1, :cond_7

    .line 44
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/ion/TransformBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 88
    :cond_6
    :goto_6
    return-void

    .line 48
    :cond_7
    iget-object v0, p0, Lcom/koushikdutta/ion/TransformBitmap;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v0, v0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v1, p0, Lcom/koushikdutta/ion/TransformBitmap;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_6

    .line 50
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/TransformBitmap$1;

    invoke-direct {v1, p0, p2}, Lcom/koushikdutta/ion/TransformBitmap$1;-><init>(Lcom/koushikdutta/ion/TransformBitmap;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 53
    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_6
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 12
    check-cast p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/TransformBitmap;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    return-void
.end method
