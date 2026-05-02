.class Lcom/koushikdutta/ion/loader/HttpLoader$1;
.super Ljava/lang/Object;
.source "HttpLoader.java"

# interfaces
.implements Lcom/koushikdutta/async/http/callback/HttpConnectCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/loader/HttpLoader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/loader/HttpLoader;

.field final synthetic val$callback:Lcom/koushikdutta/async/future/FutureCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/loader/HttpLoader;Lcom/koushikdutta/async/future/FutureCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/loader/HttpLoader;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/koushikdutta/ion/loader/HttpLoader$1;->this$0:Lcom/koushikdutta/ion/loader/HttpLoader;

    iput-object p2, p0, Lcom/koushikdutta/ion/loader/HttpLoader$1;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V
    .registers 12
    .param p1, "ex"    # Ljava/lang/Exception;
    .param p2, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;

    .prologue
    .line 29
    const-wide/16 v2, -0x1

    .line 30
    .local v2, "length":J
    sget-object v4, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_NETWORK:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 31
    .local v4, "loadedFrom":Lcom/koushikdutta/ion/ResponseServedFrom;
    const/4 v5, 0x0

    .line 32
    .local v5, "headers":Lcom/koushikdutta/ion/HeadersResponse;
    const/4 v6, 0x0

    .line 33
    .local v6, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    if-eqz p2, :cond_3a

    .line 34
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->getRequest()Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-result-object v6

    .line 35
    new-instance v5, Lcom/koushikdutta/ion/HeadersResponse;

    .end local v5    # "headers":Lcom/koushikdutta/ion/HeadersResponse;
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result v0

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->message()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v8

    invoke-direct {v5, v0, v1, v8}, Lcom/koushikdutta/ion/HeadersResponse;-><init>(ILjava/lang/String;Lcom/koushikdutta/async/http/Headers;)V

    .line 36
    .restart local v5    # "headers":Lcom/koushikdutta/ion/HeadersResponse;
    invoke-virtual {v5}, Lcom/koushikdutta/ion/HeadersResponse;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/async/http/HttpUtil;->contentLength(Lcom/koushikdutta/async/http/Headers;)I

    move-result v0

    int-to-long v2, v0

    .line 37
    invoke-interface {p2}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    const-string v1, "X-Served-From"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 38
    .local v7, "servedFrom":Ljava/lang/String;
    const-string v0, "cache"

    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 39
    sget-object v4, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 43
    .end local v7    # "servedFrom":Ljava/lang/String;
    :cond_3a
    :goto_3a
    iget-object v8, p0, Lcom/koushikdutta/ion/loader/HttpLoader$1;->val$callback:Lcom/koushikdutta/async/future/FutureCallback;

    new-instance v0, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    move-object v1, p2

    invoke-direct/range {v0 .. v6}, Lcom/koushikdutta/ion/Loader$LoaderEmitter;-><init>(Lcom/koushikdutta/async/DataEmitter;JLcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    invoke-interface {v8, p1, v0}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 45
    return-void

    .line 40
    .restart local v7    # "servedFrom":Ljava/lang/String;
    :cond_46
    const-string v0, "conditional-cache"

    invoke-static {v7, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 41
    sget-object v4, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CONDITIONAL_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    goto :goto_3a
.end method
