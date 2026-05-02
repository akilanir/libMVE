.class Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "AsyncSocketMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Lcom/koushikdutta/async/AsyncSocket;",
        "[",
        "Ljava/net/InetAddress;",
        ">;"
    }
.end annotation


# instance fields
.field lastException:Ljava/lang/Exception;

.field final synthetic this$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

.field final synthetic val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

.field final synthetic val$port:I

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;I)V
    .registers 5
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->this$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iput-object p3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$uri:Landroid/net/Uri;

    iput p4, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$port:I

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected error(Ljava/lang/Exception;)V
    .registers 8
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 198
    invoke-super {p0, p1}, Lcom/koushikdutta/async/future/TransformFuture;->error(Ljava/lang/Exception;)V

    .line 199
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->this$0:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$uri:Landroid/net/Uri;

    iget v3, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$port:I

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->connectCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-virtual/range {v0 .. v5}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 200
    return-void
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 193
    check-cast p1, [Ljava/net/InetAddress;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->transform([Ljava/net/InetAddress;)V

    return-void
.end method

.method protected transform([Ljava/net/InetAddress;)V
    .registers 13
    .param p1, "result"    # [Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 204
    new-instance v4, Lcom/koushikdutta/async/future/Continuation;

    new-instance v6, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1$1;

    invoke-direct {v6, p0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1$1;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;)V

    invoke-direct {v4, v6}, Lcom/koushikdutta/async/future/Continuation;-><init>(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 216
    .local v4, "keepTrying":Lcom/koushikdutta/async/future/Continuation;
    move-object v1, p1

    .local v1, "arr$":[Ljava/net/InetAddress;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_d
    if-ge v2, v5, :cond_33

    aget-object v0, v1, v2

    .line 217
    .local v0, "address":Ljava/net/InetAddress;
    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "%s:%s"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    iget v10, p0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;->val$port:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 218
    .local v3, "inetSockAddress":Ljava/lang/String;
    new-instance v6, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1$2;

    invoke-direct {v6, p0, v3, v0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1$2;-><init>(Lcom/koushikdutta/async/http/AsyncSocketMiddleware$1;Ljava/lang/String;Ljava/net/InetAddress;)V

    invoke-virtual {v4, v6}, Lcom/koushikdutta/async/future/Continuation;->add(Lcom/koushikdutta/async/callback/ContinuationCallback;)Lcom/koushikdutta/async/future/Continuation;

    .line 216
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 256
    .end local v0    # "address":Ljava/net/InetAddress;
    .end local v3    # "inetSockAddress":Ljava/lang/String;
    :cond_33
    invoke-virtual {v4}, Lcom/koushikdutta/async/future/Continuation;->start()Lcom/koushikdutta/async/future/Continuation;

    .line 257
    return-void
.end method
