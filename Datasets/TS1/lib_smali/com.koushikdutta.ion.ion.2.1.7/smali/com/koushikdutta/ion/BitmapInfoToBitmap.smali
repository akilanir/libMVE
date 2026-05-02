.class Lcom/koushikdutta/ion/BitmapInfoToBitmap;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "BitmapInfoToBitmap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Landroid/graphics/Bitmap;",
        "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
        ">;"
    }
.end annotation


# instance fields
.field contextReference:Lcom/koushikdutta/ion/ContextReference;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/ContextReference;)V
    .registers 2
    .param p1, "contextReference"    # Lcom/koushikdutta/ion/ContextReference;

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    .line 12
    return-void
.end method


# virtual methods
.method protected transform(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 3
    .param p1, "result"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/ContextReference;->isAlive()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 17
    invoke-virtual {p0}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->cancel()Z

    .line 25
    :goto_b
    return-void

    .line 21
    :cond_c
    iget-object v0, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    if-eqz v0, :cond_16

    .line 22
    iget-object v0, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_b

    .line 24
    :cond_16
    iget-object v0, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->setComplete(Ljava/lang/Object;)Z

    goto :goto_b
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 8
    check-cast p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/BitmapInfoToBitmap;->transform(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    return-void
.end method
