.class public Lorg/zeromq/ZMQQueue;
.super Ljava/lang/Object;
.source "ZMQQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final inSocket:Lorg/zeromq/ZMQ$Socket;

.field private final outSocket:Lorg/zeromq/ZMQ$Socket;


# direct methods
.method public constructor <init>(Lorg/zeromq/ZMQ$Context;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;)V
    .registers 4
    .param p1, "context"    # Lorg/zeromq/ZMQ$Context;
    .param p2, "inSocket"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "outSocket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Lorg/zeromq/ZMQQueue;->inSocket:Lorg/zeromq/ZMQ$Socket;

    .line 43
    iput-object p3, p0, Lorg/zeromq/ZMQQueue;->outSocket:Lorg/zeromq/ZMQ$Socket;

    .line 44
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 49
    iget-object v0, p0, Lorg/zeromq/ZMQQueue;->inSocket:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$Socket;->base()Lzmq/SocketBase;

    move-result-object v0

    iget-object v1, p0, Lorg/zeromq/ZMQQueue;->outSocket:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v1}, Lorg/zeromq/ZMQ$Socket;->base()Lzmq/SocketBase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lzmq/ZMQ;->proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z

    .line 50
    return-void
.end method
