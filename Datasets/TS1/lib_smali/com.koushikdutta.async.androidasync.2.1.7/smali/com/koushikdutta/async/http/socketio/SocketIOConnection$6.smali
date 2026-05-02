.class Lcom/koushikdutta/async/http/socketio/SocketIOConnection$6;
.super Ljava/lang/Object;
.source "SocketIOConnection.java"

# interfaces
.implements Lcom/koushikdutta/async/http/socketio/SocketIOConnection$SelectCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportConnect(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;)V
    .registers 2

    .prologue
    .line 269
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$6;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelect(Lcom/koushikdutta/async/http/socketio/SocketIOClient;)V
    .registers 4
    .param p1, "client"    # Lcom/koushikdutta/async/http/socketio/SocketIOClient;

    .prologue
    .line 272
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 292
    :cond_6
    :goto_6
    return-void

    .line 274
    :cond_7
    iget-boolean v1, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->connected:Z

    if-nez v1, :cond_17

    .line 276
    const/4 v1, 0x1

    iput-boolean v1, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->connected:Z

    .line 277
    iget-object v0, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->connectCallback:Lcom/koushikdutta/async/http/socketio/ConnectCallback;

    .line 278
    .local v0, "callback":Lcom/koushikdutta/async/http/socketio/ConnectCallback;
    if-eqz v0, :cond_6

    .line 279
    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Lcom/koushikdutta/async/http/socketio/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/socketio/SocketIOClient;)V

    goto :goto_6

    .line 281
    .end local v0    # "callback":Lcom/koushikdutta/async/http/socketio/ConnectCallback;
    :cond_17
    iget-boolean v1, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->disconnected:Z

    if-eqz v1, :cond_6

    .line 283
    const/4 v1, 0x0

    iput-boolean v1, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->disconnected:Z

    .line 284
    iget-object v0, p1, Lcom/koushikdutta/async/http/socketio/SocketIOClient;->reconnectCallback:Lcom/koushikdutta/async/http/socketio/ReconnectCallback;

    .line 285
    .local v0, "callback":Lcom/koushikdutta/async/http/socketio/ReconnectCallback;
    if-eqz v0, :cond_6

    .line 286
    invoke-interface {v0}, Lcom/koushikdutta/async/http/socketio/ReconnectCallback;->onReconnect()V

    goto :goto_6
.end method
