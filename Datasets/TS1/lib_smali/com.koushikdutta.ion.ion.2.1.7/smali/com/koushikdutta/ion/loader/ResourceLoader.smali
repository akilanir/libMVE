.class public Lcom/koushikdutta/ion/loader/ResourceLoader;
.super Lcom/koushikdutta/ion/loader/StreamLoader;
.source "ResourceLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/koushikdutta/ion/loader/StreamLoader;-><init>()V

    .line 30
    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .registers 3
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/koushikdutta/ion/loader/ResourceLoader;->lookupResource(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;

    move-result-object v0

    return-object v0
.end method

.method private static lookupResource(Landroid/content/Context;Ljava/lang/String;)Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 36
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 37
    .local v7, "u":Landroid/net/Uri;
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    if-nez v8, :cond_14

    .line 38
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "uri is not a valid resource uri"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 39
    :cond_14
    invoke-virtual {v7}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "pkg":Ljava/lang/String;
    invoke-virtual {p0, v3, v10}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v0

    .line 41
    .local v0, "ctx":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 43
    .local v4, "res":Landroid/content/res/Resources;
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v11, :cond_47

    .line 44
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 55
    .local v1, "id":I
    :cond_3c
    new-instance v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;

    const/4 v8, 0x0

    invoke-direct {v5, v8}, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;-><init>(Lcom/koushikdutta/ion/loader/ResourceLoader$1;)V

    .line 56
    .local v5, "ret":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    iput-object v4, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->res:Landroid/content/res/Resources;

    .line 57
    iput v1, v5, Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;->id:I

    .line 58
    return-object v5

    .line 45
    .end local v1    # "id":I
    .end local v5    # "ret":Lcom/koushikdutta/ion/loader/ResourceLoader$Resource;
    :cond_47
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_74

    .line 46
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 47
    .local v6, "type":Ljava/lang/String;
    invoke-virtual {v7}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 48
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v4, v2, v6, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 49
    .restart local v1    # "id":I
    if-nez v1, :cond_3c

    .line 50
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "resource not found in given package"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 53
    .end local v1    # "id":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_74
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "uri is not a valid resource uri"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
.end method


# virtual methods
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
    .line 109
    .local p3, "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/Loader$LoaderEmitter;>;"
    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.resource:/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 110
    const/4 v4, 0x0

    .line 132
    :goto_11
    return-object v4

    .line 112
    :cond_12
    new-instance v4, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;

    invoke-direct {v4}, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;-><init>()V

    .line 113
    .local v4, "ret":Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Ion;->getHttpClient()Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v6

    new-instance v0, Lcom/koushikdutta/ion/loader/ResourceLoader$2;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/loader/ResourceLoader$2;-><init>(Lcom/koushikdutta/ion/loader/ResourceLoader;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;Lcom/koushikdutta/async/future/FutureCallback;)V

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    goto :goto_11
.end method

.method public loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;
    .registers 19
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
    .line 63
    if-eqz p4, :cond_a

    const-string v0, "android.resource:/"

    invoke-virtual {p4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 64
    :cond_a
    const/4 v9, 0x0

    .line 104
    :goto_b
    return-object v9

    .line 66
    :cond_c
    new-instance v9, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v9}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 69
    .local v9, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getBitmapLoadExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v10

    new-instance v0, Lcom/koushikdutta/ion/loader/ResourceLoader$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p4

    move-object v4, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object v8, p3

    invoke-direct/range {v0 .. v9}, Lcom/koushikdutta/ion/loader/ResourceLoader$1;-><init>(Lcom/koushikdutta/ion/loader/ResourceLoader;Landroid/content/Context;Ljava/lang/String;Lcom/koushikdutta/ion/Ion;IIZLjava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {v10, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_b
.end method
