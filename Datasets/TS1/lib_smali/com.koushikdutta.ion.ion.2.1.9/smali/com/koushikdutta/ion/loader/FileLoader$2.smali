.class Lcom/koushikdutta/ion/loader/FileLoader$2;
.super Ljava/lang/Object;
.source "FileLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/FileLoader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/FileLoader;

.field final synthetic val$callback:Lcom/koushikdutta/async/future/FutureCallback;

.field final synthetic val$ion:Lcom/koushikdutta/ion/Ion;

.field final synthetic val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field final synthetic val$ret:Lcom/koushikdutta/ion/loader/FileLoader$FileFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/FileLoader;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/ion/loader/FileLoader$FileFuture;Lcom/koushikdutta/async/future/FutureCallback;)V
    .registers 6
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/FileLoader;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->this$0:Lcom/koushikdutta/ion/loader/FileLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iput-object p3, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$ion:Lcom/koushikdutta/ion/Ion;

    iput-object p4, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$ret:Lcom/koushikdutta/ion/loader/FileLoader$FileFuture;

    iput-object p5, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/4 v5, 0x0

    .line 92
    new-instance v7, Ljava/io/File;

    iget-object v0, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    .line 93
    .local v7, "file":Ljava/io/File;
    new-instance v1, Lcom/koushikdutta/async/FileDataEmitter;

    iget-object v0, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/Ion;->getHttpClient()Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    invoke-direct {v1, v0, v7}, Lcom/koushikdutta/async/FileDataEmitter;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/File;)V

    .line 94
    .local v1, "emitter":Lcom/koushikdutta/async/FileDataEmitter;
    iget-object v0, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$ret:Lcom/koushikdutta/ion/loader/FileLoader$FileFuture;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/ion/loader/FileLoader$FileFuture;->setComplete(Ljava/lang/Object;)Z

    .line 95
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    new-instance v0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    int-to-long v2, v2

    sget-object v4, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    iget-object v6, p0, Lcom/koushikdutta/ion/loader/FileLoader$2;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct/range {v0 .. v6}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;-><init>(Lcom/koushikdutta/async/DataEmitter;JLcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    invoke-interface {v8, v5, v0}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 96
    return-void
.end method
