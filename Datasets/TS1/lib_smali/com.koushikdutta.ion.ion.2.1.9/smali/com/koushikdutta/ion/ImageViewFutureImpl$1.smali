.class final Lcom/koushikdutta/ion/ImageViewFutureImpl$1;
.super Lcom/koushikdutta/ion/ImageViewFutureImpl;
.source "ImageViewFutureImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/ImageViewFutureImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/koushikdutta/ion/ImageViewFutureImpl;-><init>()V

    .line 17
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "uri"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/ImageViewFutureImpl$1;->setComplete(Ljava/lang/Exception;)Z

    .line 18
    return-void
.end method


# virtual methods
.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 15
    check-cast p1, Lcom/koushikdutta/ion/IonDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/ImageViewFutureImpl;->transform(Lcom/koushikdutta/ion/IonDrawable;)V

    return-void
.end method
