.class Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;
.super Ljava/lang/Object;
.source "SocketIOConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->setupHeartbeat()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

.field final synthetic val$ts:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;)V
    .registers 3

    .prologue
    .line 174
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iput-object p2, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->val$ts:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 177
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget v0, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->heartbeat:I

    if-lez v0, :cond_1a

    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->val$ts:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    iget-object v1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v1, v1, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    if-ne v0, v1, :cond_1a

    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->val$ts:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->val$ts:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 184
    :cond_1a
    :goto_1a
    return-void

    .line 180
    :cond_1b
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v0, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    const-string v1, "2:::"

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->send(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v0, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    if-eqz v0, :cond_1a

    .line 183
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v0, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    iget-object v1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$3;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget v1, v1, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->heartbeat:I

    int-to-long v1, v1

    invoke-virtual {v0, p0, v1, v2}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    goto :goto_1a
.end method
