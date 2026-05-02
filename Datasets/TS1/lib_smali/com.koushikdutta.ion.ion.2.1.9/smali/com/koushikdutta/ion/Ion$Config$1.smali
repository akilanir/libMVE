.class Lcom/koushikdutta/ion/Ion$Config$1;
.super Ljava/lang/Object;
.source "Ion.java"

# interfaces
.implements Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/Ion$Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/Ion$Config;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/Ion$Config;)V
    .registers 2
    .param p1, "this$1"    # Lcom/koushikdutta/ion/Ion$Config;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/koushikdutta/ion/Ion$Config$1;->this$1:Lcom/koushikdutta/ion/Ion$Config;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createAsyncHttpRequest(Landroid/net/Uri;Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 559
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;-><init>(Landroid/net/Uri;Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)V

    .line 560
    .local v0, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    iget-object v1, p0, Lcom/koushikdutta/ion/Ion$Config$1;->this$1:Lcom/koushikdutta/ion/Ion$Config;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion;->userAgent:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_20

    .line 561
    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    const-string v2, "User-Agent"

    iget-object v3, p0, Lcom/koushikdutta/ion/Ion$Config$1;->this$1:Lcom/koushikdutta/ion/Ion$Config;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion$Config;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->userAgent:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 562
    :cond_20
    return-object v0
.end method
