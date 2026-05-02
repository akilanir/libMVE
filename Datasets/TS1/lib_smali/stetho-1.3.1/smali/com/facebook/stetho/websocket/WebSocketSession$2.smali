.class Lcom/facebook/stetho/websocket/WebSocketSession$2;
.super Ljava/lang/Object;
.source "WebSocketSession.java"

# interfaces
.implements Lcom/facebook/stetho/websocket/WriteCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/websocket/WebSocketSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/websocket/WebSocketSession;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/websocket/WebSocketSession;)V
    .registers 2
    .param p1, "this$0"    # Lcom/facebook/stetho/websocket/WebSocketSession;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/facebook/stetho/websocket/WebSocketSession$2;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/io/IOException;)V
    .registers 3
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$2;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    # invokes: Lcom/facebook/stetho/websocket/WebSocketSession;->signalError(Ljava/io/IOException;)V
    invoke-static {v0, p1}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$000(Lcom/facebook/stetho/websocket/WebSocketSession;Ljava/io/IOException;)V

    .line 188
    return-void
.end method

.method public onSuccess()V
    .registers 1

    .prologue
    .line 193
    return-void
.end method
