.class Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware$1;
.super Ljava/lang/Object;
.source "AsyncSSLSocketMiddleware.java"

# interfaces
.implements Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->createHandshakeCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

.field final synthetic val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware$1;->this$0:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware$1;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "socket"    # Lcom/koushikdutta/async/AsyncSSLSocket;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware$1;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-interface {v0, p1, p2}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 77
    return-void
.end method
