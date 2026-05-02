.class public Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;
.super Ljava/lang/Object;
.source "WebSocketTransport.java"

# interfaces
.implements Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;


# instance fields
.field private sessionId:Ljava/lang/String;

.field private stringCallback:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;

.field private webSocket:Lcom/koushikdutta/async/http/WebSocket;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/http/WebSocket;Ljava/lang/String;)V
    .registers 5
    .param p1, "webSocket"    # Lcom/koushikdutta/async/http/WebSocket;
    .param p2, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    .line 15
    iput-object p2, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->sessionId:Ljava/lang/String;

    .line 16
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    new-instance v1, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;

    invoke-direct {v1}, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;-><init>()V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/http/WebSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 17
    return-void
.end method


# virtual methods
.method public disconnect()V
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/WebSocket;->close()V

    .line 32
    return-void
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/WebSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    return-object v0
.end method

.method public getSessionId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->sessionId:Ljava/lang/String;

    return-object v0
.end method

.method public heartbeats()Z
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/WebSocket;->isOpen()Z

    move-result v0

    return v0
.end method

.method public send(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/http/WebSocket;->send(Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 3
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/http/WebSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 27
    return-void
.end method

.method public setStringCallback(Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->stringCallback:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;

    if-ne v0, p1, :cond_5

    .line 61
    :goto_4
    return-void

    .line 49
    :cond_5
    if-nez p1, :cond_10

    .line 50
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/http/WebSocket;->setStringCallback(Lcom/koushikdutta/async/http/WebSocket$StringCallback;)V

    .line 60
    :goto_d
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->stringCallback:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;

    goto :goto_4

    .line 52
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;->webSocket:Lcom/koushikdutta/async/http/WebSocket;

    new-instance v1, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport$1;

    invoke-direct {v1, p0, p1}, Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport$1;-><init>(Lcom/koushikdutta/async/http/socketio/transport/WebSocketTransport;Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/http/WebSocket;->setStringCallback(Lcom/koushikdutta/async/http/WebSocket$StringCallback;)V

    goto :goto_d
.end method
