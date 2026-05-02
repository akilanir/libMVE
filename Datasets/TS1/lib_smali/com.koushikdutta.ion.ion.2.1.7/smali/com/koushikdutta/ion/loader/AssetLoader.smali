.class public Lcom/koushikdutta/ion/loader/AssetLoader;
.super Lcom/koushikdutta/ion/loader/StreamLoader;
.source "AssetLoader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/koushikdutta/ion/loader/StreamLoader;-><init>()V

    return-void
.end method


# virtual methods
.method protected getInputStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "^/android_asset/"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 11
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
    .line 36
    .local p3, "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/Loader$LoaderEmitter;>;"
    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file:///android_asset/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 37
    const/4 v4, 0x0

    .line 58
    :goto_11
    return-object v4

    .line 39
    :cond_12
    new-instance v4, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;-><init>()V

    .line 40
    .local v4, "ret":Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Ion;->getHttpClient()Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v6

    new-instance v0, Lcom/koushikdutta/ion/loader/AssetLoader$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/loader/AssetLoader$1;-><init>(Lcom/koushikdutta/ion/loader/AssetLoader;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;Lcom/koushikdutta/async/future/FutureCallback;)V

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    goto :goto_11
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
    .line 23
    const-string v0, "file:///android_asset/"

    invoke-virtual {p4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 24
    const/4 v0, 0x0

    .line 26
    :goto_9
    return-object v0

    :cond_a
    invoke-super/range {p0 .. p7}, Lcom/koushikdutta/ion/loader/StreamLoader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    goto :goto_9
.end method
