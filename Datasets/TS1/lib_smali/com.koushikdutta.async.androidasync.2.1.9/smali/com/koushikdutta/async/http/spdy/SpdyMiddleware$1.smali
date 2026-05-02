.class Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;
.super Ljava/lang/Object;
.source "SpdyMiddleware.java"

# interfaces
.implements Lcom/koushikdutta/async/http/AsyncSSLEngineConfigurator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public configureEngine(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    .registers 6
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->configure(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    invoke-static {v0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$000(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V

    .line 46
    return-void
.end method
