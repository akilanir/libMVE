.class Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport$1;
.super Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
.source "XHRPollingTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;->send(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport$1;->this$0:Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "source"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p3, "result"    # Ljava/lang/String;

    .prologue
    .line 73
    if-eqz p1, :cond_8

    .line 74
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport$1;->this$0:Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;

    # invokes: Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;->close(Ljava/lang/Exception;)V
    invoke-static {v0, p1}, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;->access$000(Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;Ljava/lang/Exception;)V

    .line 79
    :goto_7
    return-void

    .line 78
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport$1;->this$0:Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;

    # invokes: Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;->sendResult(Ljava/lang/String;)V
    invoke-static {v0, p3}, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;->access$100(Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport;Ljava/lang/String;)V

    goto :goto_7
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Ljava/lang/Object;

    .prologue
    .line 70
    check-cast p2, Lcom/koushikdutta/async/http/AsyncHttpResponse;

    .end local p2    # "x1":Ljava/lang/Object;
    check-cast p3, Ljava/lang/String;

    .end local p3    # "x2":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/socketio/transport/XHRPollingTransport$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/String;)V

    return-void
.end method
