.class Lcom/squareup/okhttp/internal/ws/WebSocket$1;
.super Ljava/lang/Object;
.source "WebSocket.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/ws/WebSocketReader$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/ws/WebSocket;->connect(Lcom/squareup/okhttp/internal/ws/WebSocketListener;)Lcom/squareup/okhttp/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/ws/WebSocket;)V
    .registers 2
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$1;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lokio/Buffer;)V
    .registers 3
    .param p1, "buffer"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$1;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    # invokes: Lcom/squareup/okhttp/internal/ws/WebSocket;->peerClose(Lokio/Buffer;)V
    invoke-static {v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocket;->access$200(Lcom/squareup/okhttp/internal/ws/WebSocket;Lokio/Buffer;)V

    .line 214
    return-void
.end method

.method public onPing(Lokio/Buffer;)V
    .registers 6
    .param p1, "buffer"    # Lokio/Buffer;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$1;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocket;->pongExecutor:Ljava/util/concurrent/Executor;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocket;->access$100(Lcom/squareup/okhttp/internal/ws/WebSocket;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/squareup/okhttp/internal/ws/WebSocket$1$1;

    const-string v2, "WebSocket PongWriter"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-direct {v1, p0, v2, v3, p1}, Lcom/squareup/okhttp/internal/ws/WebSocket$1$1;-><init>(Lcom/squareup/okhttp/internal/ws/WebSocket$1;Ljava/lang/String;[Ljava/lang/Object;Lokio/Buffer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 210
    return-void
.end method
