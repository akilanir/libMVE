.class Lcom/koushikdutta/async/AsyncServer$ConnectFuture;
.super Lcom/koushikdutta/async/future/SimpleFuture;
.source "AsyncServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/SimpleFuture",
        "<",
        "Lcom/koushikdutta/async/AsyncNetworkSocket;",
        ">;"
    }
.end annotation


# instance fields
.field callback:Lcom/koushikdutta/async/callback/ConnectCallback;

.field socket:Ljava/nio/channels/SocketChannel;

.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;


# direct methods
.method private constructor <init>(Lcom/koushikdutta/async/AsyncServer;)V
    .registers 2

    .prologue
    .line 329
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->this$0:Lcom/koushikdutta/async/AsyncServer;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncServer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/async/AsyncServer;
    .param p2, "x1"    # Lcom/koushikdutta/async/AsyncServer$1;

    .prologue
    .line 329
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    return-void
.end method


# virtual methods
.method protected cancelCleanup()V
    .registers 2

    .prologue
    .line 332
    invoke-super {p0}, Lcom/koushikdutta/async/future/SimpleFuture;->cancelCleanup()V

    .line 334
    :try_start_3
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->socket:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_c

    .line 335
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$ConnectFuture;->socket:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_c} :catch_d

    .line 339
    :cond_c
    :goto_c
    return-void

    .line 337
    :catch_d
    move-exception v0

    goto :goto_c
.end method
