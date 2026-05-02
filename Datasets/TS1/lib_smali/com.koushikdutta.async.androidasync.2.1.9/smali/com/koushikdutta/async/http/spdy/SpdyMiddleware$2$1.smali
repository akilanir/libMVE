.class Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;
.super Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;
.source "SpdyMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field hasReceivedSettings:Z

.field final synthetic this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/Protocol;)V
    .registers 4
    .param p1, "this$1"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;
    .param p2, "x0"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p3, "x1"    # Lcom/koushikdutta/async/http/Protocol;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    invoke-direct {p0, p2, p3}, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;-><init>(Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/Protocol;)V

    return-void
.end method


# virtual methods
.method public settings(ZLcom/koushikdutta/async/http/spdy/Settings;)V
    .registers 7
    .param p1, "clearPrevious"    # Z
    .param p2, "settings"    # Lcom/koushikdutta/async/http/spdy/Settings;

    .prologue
    .line 223
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->settings(ZLcom/koushikdutta/async/http/spdy/Settings;)V

    .line 224
    iget-boolean v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->hasReceivedSettings:Z

    if-nez v1, :cond_5e

    .line 225
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->hasReceivedSettings:Z

    .line 227
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v1, v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v1, v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v2, v2, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .line 229
    .local v0, "waiter":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    iget-object v1, v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->originalCancellable:Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-virtual {v1}, Lcom/koushikdutta/async/future/SimpleCancellable;->setComplete()Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 230
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v1, v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "using new spdy connection for host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v3, v3, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v3, v3, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 231
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v1, v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v2, v2, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;->this$1:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    iget-object v3, v3, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->newSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    invoke-static {v1, v2, p0, v3}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$400(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;Lcom/koushikdutta/async/callback/ConnectCallback;)V

    .line 234
    :cond_5b
    invoke-virtual {v0, p0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->setComplete(Ljava/lang/Object;)Z

    .line 236
    .end local v0    # "waiter":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    :cond_5e
    return-void
.end method
