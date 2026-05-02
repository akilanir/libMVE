.class Lcom/koushikdutta/ion/LoadBitmap;
.super Lcom/koushikdutta/ion/LoadBitmapEmitter;
.source "LoadBitmap.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/LoadBitmapEmitter;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/ion/Response",
        "<",
        "Lcom/koushikdutta/async/ByteBufferList;",
        ">;>;"
    }
.end annotation


# instance fields
.field resizeHeight:I

.field resizeWidth:I


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZIIZ)V
    .registers 7
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "urlKey"    # Ljava/lang/String;
    .param p3, "put"    # Z
    .param p4, "resizeWidth"    # I
    .param p5, "resizeHeight"    # I
    .param p6, "animateGif"    # Z

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3, p6}, Lcom/koushikdutta/ion/LoadBitmapEmitter;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZZ)V

    .line 23
    iput p4, p0, Lcom/koushikdutta/ion/LoadBitmap;->resizeWidth:I

    .line 24
    iput p5, p0, Lcom/koushikdutta/ion/LoadBitmap;->resizeHeight:I

    .line 25
    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Lcom/koushikdutta/ion/Response",
            "<",
            "Lcom/koushikdutta/async/ByteBufferList;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "response":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<Lcom/koushikdutta/async/ByteBufferList;>;"
    if-nez p1, :cond_6

    .line 30
    invoke-virtual {p2}, Lcom/koushikdutta/ion/Response;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 31
    :cond_6
    if-eqz p1, :cond_d

    .line 32
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/ion/LoadBitmap;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 90
    :goto_c
    return-void

    .line 35
    :cond_d
    invoke-virtual {p2}, Lcom/koushikdutta/ion/Response;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/ByteBufferList;

    .line 37
    .local v0, "result":Lcom/koushikdutta/async/ByteBufferList;
    iget-object v1, p0, Lcom/koushikdutta/ion/LoadBitmap;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v2, p0, Lcom/koushikdutta/ion/LoadBitmap;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p0, :cond_23

    .line 38
    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    goto :goto_c

    .line 39
    :cond_23
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/LoadBitmap$1;

    invoke-direct {v2, p0, v0, p2}, Lcom/koushikdutta/ion/LoadBitmap$1;-><init>(Lcom/koushikdutta/ion/LoadBitmap;Lcom/koushikdutta/async/ByteBufferList;Lcom/koushikdutta/ion/Response;)V

    .line 42
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_c
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 17
    check-cast p2, Lcom/koushikdutta/ion/Response;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/LoadBitmap;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V

    return-void
.end method
