.class Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;
.super Ljava/lang/Object;
.source "SocketIOConnection.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reconnect(Lcom/koushikdutta/async/future/DependentCancellable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    .prologue
    .line 160
    if-eqz p1, :cond_8

    .line 161
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportDisconnect(Ljava/lang/Exception;)V
    invoke-static {v0, p1}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$000(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/Exception;)V

    .line 168
    :goto_7
    return-void

    .line 165
    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v1, v1, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->request:Lcom/koushikdutta/async/http/socketio/SocketIORequest;

    iget-object v1, v1, Lcom/koushikdutta/async/http/socketio/SocketIORequest;->config:Lcom/koushikdutta/async/http/socketio/SocketIORequest$Config;

    iget-wide v1, v1, Lcom/koushikdutta/async/http/socketio/SocketIORequest$Config;->reconnectDelay:J

    iput-wide v1, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reconnectDelay:J

    .line 166
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iput-object p2, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    .line 167
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->attach()V
    invoke-static {v0}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$100(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;)V

    goto :goto_7
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 157
    check-cast p2, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$1;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;)V

    return-void
.end method
