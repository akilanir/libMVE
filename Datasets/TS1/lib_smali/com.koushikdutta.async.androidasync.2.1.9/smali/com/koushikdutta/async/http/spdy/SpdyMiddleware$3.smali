.class Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;
.super Ljava/lang/Object;
.source "SpdyMiddleware.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/ConnectCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$superCallback:Lcom/koushikdutta/async/callback/ConnectCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->val$superCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V
    .registers 6
    .param p1, "ex"    # Ljava/lang/Exception;
    .param p2, "socket"    # Lcom/koushikdutta/async/AsyncSocket;

    .prologue
    .line 311
    if-eqz p1, :cond_13

    .line 312
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v1, v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->val$key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .line 313
    .local v0, "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    if-eqz v0, :cond_13

    .line 314
    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->setComplete(Ljava/lang/Exception;)Z

    .line 316
    .end local v0    # "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    :cond_13
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;->val$superCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-interface {v1, p1, p2}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 317
    return-void
.end method
