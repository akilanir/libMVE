.class Lcom/koushikdutta/async/AsyncServer$13;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->connectDatagram(Ljava/net/SocketAddress;)Lcom/koushikdutta/async/AsyncDatagramSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;

.field final synthetic val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

.field final synthetic val$remote:Ljava/net/SocketAddress;

.field final synthetic val$socket:Ljava/nio/channels/DatagramChannel;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)V
    .registers 5
    .param p1, "this$0"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 541
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$13;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$socket:Ljava/nio/channels/DatagramChannel;

    iput-object p4, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$remote:Ljava/net/SocketAddress;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 545
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$13;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$handler:Lcom/koushikdutta/async/AsyncDatagramSocket;

    # invokes: Lcom/koushikdutta/async/AsyncServer;->handleSocket(Lcom/koushikdutta/async/AsyncNetworkSocket;)V
    invoke-static {v1, v2}, Lcom/koushikdutta/async/AsyncServer;->access$700(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/AsyncNetworkSocket;)V

    .line 546
    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$socket:Ljava/nio/channels/DatagramChannel;

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$remote:Ljava/net/SocketAddress;

    invoke-virtual {v1, v2}, Ljava/nio/channels/DatagramChannel;->connect(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_f

    .line 551
    :goto_e
    return-void

    .line 548
    :catch_f
    move-exception v0

    .line 549
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/Closeable;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$socket:Ljava/nio/channels/DatagramChannel;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    goto :goto_e
.end method
