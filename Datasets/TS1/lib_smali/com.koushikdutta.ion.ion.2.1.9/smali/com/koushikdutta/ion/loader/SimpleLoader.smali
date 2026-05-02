.class public Lcom/koushikdutta/ion/loader/SimpleLoader;
.super Ljava/lang/Object;
.source "SimpleLoader.java"

# interfaces
.implements Lcom/koushikdutta/ion/Loader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/ion/Ion;",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/Loader$LoaderEmitter;",
            ">;)",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/DataEmitter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    .local p3, "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/Loader$LoaderEmitter;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/reflect/Type;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 5
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p3, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/ion/Ion;",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "uri"    # Ljava/lang/String;
    .param p5, "resizeWidth"    # I
    .param p6, "resizeHeight"    # I
    .param p7, "animateGif"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/koushikdutta/ion/Ion;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIZ)",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    const/4 v0, 0x0

    return-object v0
.end method

.method public resolve(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p3, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/koushikdutta/ion/Ion;",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    return-object v0
.end method
