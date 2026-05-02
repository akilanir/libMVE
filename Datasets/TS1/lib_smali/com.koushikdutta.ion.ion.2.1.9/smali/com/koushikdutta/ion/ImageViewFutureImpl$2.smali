.class Lcom/koushikdutta/ion/ImageViewFutureImpl$2;
.super Ljava/lang/Object;
.source "ImageViewFutureImpl.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/ImageViewFutureImpl;->withBitmapInfo()Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Landroid/widget/ImageView;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/ImageViewFutureImpl;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/ImageViewFutureImpl;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/ImageViewFutureImpl;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;->this$0:Lcom/koushikdutta/ion/ImageViewFutureImpl;

    iput-object p2, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Landroid/widget/ImageView;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Landroid/widget/ImageView;

    .prologue
    .line 75
    new-instance v2, Lcom/koushikdutta/ion/ImageViewBitmapInfo;

    invoke-direct {v2}, Lcom/koushikdutta/ion/ImageViewBitmapInfo;-><init>()V

    .line 76
    .local v2, "val":Lcom/koushikdutta/ion/ImageViewBitmapInfo;
    const/4 v0, 0x0

    .line 77
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz p2, :cond_c

    .line 78
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 79
    :cond_c
    instance-of v3, v0, Lcom/koushikdutta/ion/IonDrawable;

    if-eqz v3, :cond_19

    move-object v1, v0

    .line 80
    check-cast v1, Lcom/koushikdutta/ion/IonDrawable;

    .line 81
    .local v1, "id":Lcom/koushikdutta/ion/IonDrawable;
    invoke-virtual {v1}, Lcom/koushikdutta/ion/IonDrawable;->getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v3

    iput-object v3, v2, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 83
    .end local v1    # "id":Lcom/koushikdutta/ion/IonDrawable;
    :cond_19
    iput-object p1, v2, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->exception:Ljava/lang/Exception;

    .line 84
    iput-object p2, v2, Lcom/koushikdutta/ion/ImageViewBitmapInfo;->imageView:Landroid/widget/ImageView;

    .line 85
    iget-object v3, p0, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-virtual {v3, v2}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    .line 86
    return-void
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 72
    check-cast p2, Landroid/widget/ImageView;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/ImageViewFutureImpl$2;->onCompleted(Ljava/lang/Exception;Landroid/widget/ImageView;)V

    return-void
.end method
