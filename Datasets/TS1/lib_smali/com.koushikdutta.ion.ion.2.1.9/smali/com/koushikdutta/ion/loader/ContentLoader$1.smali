.class Lcom/koushikdutta/ion/loader/ContentLoader$1;
.super Ljava/lang/Object;
.source "ContentLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/ContentLoader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/ContentLoader;

.field final synthetic val$callback:Lcom/koushikdutta/async/future/FutureCallback;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field final synthetic val$ret:Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/ContentLoader;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;Lcom/koushikdutta/async/future/FutureCallback;)V
    .registers 6
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/ContentLoader;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->this$0:Lcom/koushikdutta/ion/loader/ContentLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ret:Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;

    iput-object p5, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 14

    .prologue
    const/4 v12, 0x0

    .line 44
    :try_start_1
    iget-object v0, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v9

    .line 45
    .local v9, "stream":Ljava/io/InputStream;
    if-nez v9, :cond_33

    .line 46
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "Unable to load content stream"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_27} :catch_27

    .line 53
    .end local v9    # "stream":Ljava/io/InputStream;
    :catch_27
    move-exception v8

    .line 54
    .local v8, "e":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ret:Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;

    invoke-virtual {v0, v8}, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;->setComplete(Ljava/lang/Exception;)Z

    .line 55
    iget-object v0, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-interface {v0, v8, v12}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 57
    .end local v8    # "e":Ljava/lang/Exception;
    :goto_32
    return-void

    .line 47
    .restart local v9    # "stream":Ljava/io/InputStream;
    :cond_33
    :try_start_33
    invoke-virtual {v9}, Ljava/io/InputStream;->available()I

    move-result v7

    .line 48
    .local v7, "available":I
    new-instance v1, Lcom/koushikdutta/async/stream/InputStreamDataEmitter;

    iget-object v0, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion;->getHttpClient()Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    invoke-direct {v1, v0, v9}, Lcom/koushikdutta/async/stream/InputStreamDataEmitter;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/InputStream;)V

    .line 49
    .local v1, "emitter":Lcom/koushikdutta/async/stream/InputStreamDataEmitter;
    iget-object v0, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$ret:Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/ion/loader/InputStreamDataEmitterFuture;->setComplete(Ljava/lang/Object;)Z

    .line 50
    iget-object v10, p0, Lcom/koushikdutta/ion/loader/ContentLoader$1;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    const/4 v11, 0x0

    new-instance v0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    int-to-long v2, v7

    sget-object v4, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;-><init>(Lcom/koushikdutta/async/DataEmitter;JLcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    invoke-interface {v10, v11, v0}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_5b} :catch_27

    goto :goto_32
.end method
