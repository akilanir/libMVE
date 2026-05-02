.class public Lorg/zeromq/ZMQ$PollItem;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PollItem"
.end annotation


# instance fields
.field private final base:Lzmq/PollItem;

.field private final socket:Lorg/zeromq/ZMQ$Socket;


# direct methods
.method public constructor <init>(Ljava/nio/channels/SelectableChannel;I)V
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "ops"    # I

    .prologue
    .line 1802
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1803
    new-instance v0, Lzmq/PollItem;

    invoke-direct {v0, p1, p2}, Lzmq/PollItem;-><init>(Ljava/nio/channels/SelectableChannel;I)V

    iput-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    .line 1804
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    .line 1805
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZMQ$Socket;I)V
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "ops"    # I

    .prologue
    .line 1796
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1797
    iput-object p1, p0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    .line 1798
    new-instance v0, Lzmq/PollItem;

    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p1}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lzmq/PollItem;-><init>(Lzmq/SocketBase;I)V

    iput-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    .line 1799
    return-void
.end method

.method static synthetic access$200(Lorg/zeromq/ZMQ$PollItem;)Lzmq/PollItem;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZMQ$PollItem;

    .prologue
    .line 1790
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    return-object v0
.end method


# virtual methods
.method protected final base()Lzmq/PollItem;
    .registers 2

    .prologue
    .line 1809
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1851
    instance-of v3, p1, Lorg/zeromq/ZMQ$PollItem;

    if-nez v3, :cond_7

    .line 1864
    :cond_6
    :goto_6
    return v1

    :cond_7
    move-object v0, p1

    .line 1855
    check-cast v0, Lorg/zeromq/ZMQ$PollItem;

    .line 1856
    .local v0, "target":Lorg/zeromq/ZMQ$PollItem;
    iget-object v3, p0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    if-eqz v3, :cond_16

    iget-object v3, p0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    iget-object v4, v0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    if-ne v3, v4, :cond_16

    move v1, v2

    .line 1857
    goto :goto_6

    .line 1860
    :cond_16
    invoke-virtual {p0}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    if-eqz v3, :cond_6

    invoke-virtual {p0}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v4

    if-ne v3, v4, :cond_6

    move v1, v2

    .line 1861
    goto :goto_6
.end method

.method public final getRawSocket()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 1814
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    return-object v0
.end method

.method public final getSocket()Lorg/zeromq/ZMQ$Socket;
    .registers 2

    .prologue
    .line 1819
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->socket:Lorg/zeromq/ZMQ$Socket;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1845
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final isError()Z
    .registers 2

    .prologue
    .line 1834
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Lzmq/PollItem;->isError()Z

    move-result v0

    return v0
.end method

.method public final isReadable()Z
    .registers 2

    .prologue
    .line 1824
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Lzmq/PollItem;->isReadable()Z

    move-result v0

    return v0
.end method

.method public final isWritable()Z
    .registers 2

    .prologue
    .line 1829
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Lzmq/PollItem;->isWritable()Z

    move-result v0

    return v0
.end method

.method public final readyOps()I
    .registers 2

    .prologue
    .line 1839
    iget-object v0, p0, Lorg/zeromq/ZMQ$PollItem;->base:Lzmq/PollItem;

    invoke-virtual {v0}, Lzmq/PollItem;->readyOps()I

    move-result v0

    return v0
.end method
