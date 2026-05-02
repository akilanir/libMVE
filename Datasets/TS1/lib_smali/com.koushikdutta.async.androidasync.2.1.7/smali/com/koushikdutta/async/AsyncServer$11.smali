.class Lcom/koushikdutta/async/AsyncServer$11;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->openDatagram(Ljava/net/SocketAddress;Z)Lcom/koushikdutta/async/AsyncDatagramSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;

.field final synthetic val$address:Ljava/net/SocketAddress;

.field final synthetic val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

.field final synthetic val$reuseAddress:Z

.field final synthetic val$socket:Ljava/nio/channels/DatagramChannel;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;ZLjava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;Lcom/koushikdutta/async/AsyncDatagramSocket;)V
    .registers 6

    .prologue
    .line 486
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$11;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iput-boolean p2, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$reuseAddress:Z

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$socket:Ljava/nio/channels/DatagramChannel;

    iput-object p4, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$address:Ljava/net/SocketAddress;

    iput-object p5, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 490
    :try_start_0
    iget-boolean v1, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$reuseAddress:Z

    if-eqz v1, :cond_f

    .line 491
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$socket:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v1}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v1

    iget-boolean v2, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$reuseAddress:Z

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V

    .line 492
    :cond_f
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$socket:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v1}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$address:Ljava/net/SocketAddress;

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->bind(Ljava/net/SocketAddress;)V

    .line 493
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$11;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

    # invokes: Lcom/koushikdutta/async/AsyncServer;->handleSocket(Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    invoke-static {v1, v2}, Lcom/koushikdutta/async/AsyncServer;->access$600(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_21} :catch_22

    .line 499
    :goto_21
    return-void

    .line 495
    :catch_22
    move-exception v0

    .line 496
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "NIO"

    const-string v2, "Datagram error"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 497
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/Closeable;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer$11;->val$socket:Ljava/nio/channels/DatagramChannel;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_21
.end method
