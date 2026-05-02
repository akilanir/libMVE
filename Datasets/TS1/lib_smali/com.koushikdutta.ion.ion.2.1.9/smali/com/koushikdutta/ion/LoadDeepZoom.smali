.class public Lcom/koushikdutta/ion/LoadDeepZoom;
.super Lcom/koushikdutta/ion/LoadBitmapEmitter;
.source "LoadDeepZoom.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xa
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/LoadBitmapEmitter;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/ion/Response",
        "<",
        "Ljava/io/File;",
        ">;>;"
    }
.end annotation


# instance fields
.field fileCache:Lcom/koushikdutta/async/util/FileCache;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZLcom/koushikdutta/async/util/FileCache;)V
    .registers 6
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "urlKey"    # Ljava/lang/String;
    .param p3, "animateGif"    # Z
    .param p4, "fileCache"    # Lcom/koushikdutta/async/util/FileCache;

    .prologue
    .line 30
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/koushikdutta/ion/LoadBitmapEmitter;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZZ)V

    .line 31
    iput-object p4, p0, Lcom/koushikdutta/ion/LoadDeepZoom;->fileCache:Lcom/koushikdutta/async/util/FileCache;

    .line 32
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
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "response":Lcom/koushikdutta/ion/Response;, "Lcom/koushikdutta/ion/Response<Ljava/io/File;>;"
    if-nez p1, :cond_6

    .line 37
    invoke-virtual {p2}, Lcom/koushikdutta/ion/Response;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 39
    :cond_6
    if-eqz p1, :cond_d

    .line 40
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/ion/LoadDeepZoom;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 97
    :cond_c
    :goto_c
    return-void

    .line 44
    :cond_d
    invoke-virtual {p2}, Lcom/koushikdutta/ion/Response;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 46
    .local v0, "tempFile":Ljava/io/File;
    iget-object v1, p0, Lcom/koushikdutta/ion/LoadDeepZoom;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v2, p0, Lcom/koushikdutta/ion/LoadDeepZoom;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_c

    .line 48
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/LoadDeepZoom$1;

    invoke-direct {v2, p0, v0, p2}, Lcom/koushikdutta/ion/LoadDeepZoom$1;-><init>(Lcom/koushikdutta/ion/LoadDeepZoom;Ljava/io/File;Lcom/koushikdutta/ion/Response;)V

    .line 51
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_c
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 26
    check-cast p2, Lcom/koushikdutta/ion/Response;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/LoadDeepZoom;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V

    return-void
.end method
