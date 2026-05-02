.class Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "WebSocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/ws/WebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReaderRunnable"
.end annotation


# instance fields
.field private final listener:Lcom/squareup/okhttp/internal/ws/WebSocketListener;

.field private final reader:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/internal/ws/WebSocket;Ljava/lang/String;Lcom/squareup/okhttp/internal/ws/WebSocketReader;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V
    .registers 7
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "reader"    # Lcom/squareup/okhttp/internal/ws/WebSocketReader;
    .param p4, "listener"    # Lcom/squareup/okhttp/internal/ws/WebSocketListener;

    .prologue
    .line 346
    iput-object p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    .line 347
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WebSocketReader "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 348
    iput-object p3, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->reader:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    .line 349
    iput-object p4, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->listener:Lcom/squareup/okhttp/internal/ws/WebSocketListener;

    .line 350
    return-void
.end method


# virtual methods
.method protected execute()V
    .registers 4

    .prologue
    .line 353
    :goto_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocket;->readerClosed:Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/ws/WebSocket;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocket;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 355
    :try_start_8
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->reader:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->readMessage()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_e

    goto :goto_0

    .line 356
    :catch_e
    move-exception v0

    .line 357
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocket;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;->listener:Lcom/squareup/okhttp/internal/ws/WebSocketListener;

    # invokes: Lcom/squareup/okhttp/internal/ws/WebSocket;->readerErrorClose(Ljava/io/IOException;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V
    invoke-static {v1, v0, v2}, Lcom/squareup/okhttp/internal/ws/WebSocket;->access$400(Lcom/squareup/okhttp/internal/ws/WebSocket;Ljava/io/IOException;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V

    .line 361
    .end local v0    # "e":Ljava/io/IOException;
    :cond_16
    return-void
.end method
