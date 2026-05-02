.class final Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/HttpProxyCacheServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SocketProcessorRunnable"
.end annotation


# instance fields
.field private final socket:Ljava/net/Socket;

.field final synthetic this$0:Lcom/danikula/videocache/HttpProxyCacheServer;


# direct methods
.method public constructor <init>(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V
    .registers 3
    .param p2, "socket"    # Ljava/net/Socket;

    .prologue
    .line 325
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    iput-object p2, p0, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;->socket:Ljava/net/Socket;

    .line 327
    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 331
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    iget-object v1, p0, Lcom/danikula/videocache/HttpProxyCacheServer$SocketProcessorRunnable;->socket:Ljava/net/Socket;

    # invokes: Lcom/danikula/videocache/HttpProxyCacheServer;->processSocket(Ljava/net/Socket;)V
    invoke-static {v0, v1}, Lcom/danikula/videocache/HttpProxyCacheServer;->access$300(Lcom/danikula/videocache/HttpProxyCacheServer;Ljava/net/Socket;)V

    .line 332
    return-void
.end method
