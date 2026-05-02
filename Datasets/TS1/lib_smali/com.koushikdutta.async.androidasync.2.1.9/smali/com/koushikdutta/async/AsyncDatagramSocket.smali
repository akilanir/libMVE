.class public Lcom/koushikdutta/async/AsyncDatagramSocket;
.super Lcom/koushikdutta/async/AsyncNetworkSocket;
.source "AsyncDatagramSocket.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;-><init>()V

    return-void
.end method


# virtual methods
.method public connect(Ljava/net/InetSocketAddress;)V
    .registers 3
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncDatagramSocket;->socketAddress:Ljava/net/InetSocketAddress;

    .line 22
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/DatagramChannel;->connect(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;

    .line 23
    return-void
.end method

.method public disconnect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncDatagramSocket;->socketAddress:Ljava/net/InetSocketAddress;

    .line 10
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/DatagramChannelWrapper;->disconnect()V

    .line 11
    return-void
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .registers 2

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 16
    invoke-super {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    .line 17
    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/DatagramChannelWrapper;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    goto :goto_a
.end method

.method public send(Ljava/lang/String;ILjava/nio/ByteBuffer;)V
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_1b

    .line 27
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/AsyncDatagramSocket$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/koushikdutta/async/AsyncDatagramSocket$1;-><init>(Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/lang/String;ILjava/nio/ByteBuffer;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 45
    :goto_1a
    return-void

    .line 37
    :cond_1b
    :try_start_1b
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, p3, v1}, Ljava/nio/channels/DatagramChannel;->send(Ljava/nio/ByteBuffer;Ljava/net/SocketAddress;)I
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_2b} :catch_2c

    goto :goto_1a

    .line 39
    :catch_2c
    move-exception v0

    goto :goto_1a
.end method

.method public send(Ljava/net/InetSocketAddress;Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .param p2, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_1b

    .line 48
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/async/AsyncDatagramSocket$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/koushikdutta/async/AsyncDatagramSocket$2;-><init>(Lcom/koushikdutta/async/AsyncDatagramSocket;Ljava/net/InetSocketAddress;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 66
    :goto_1a
    return-void

    .line 58
    :cond_1b
    :try_start_1b
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncDatagramSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    iget-object v0, v0, Lcom/koushikdutta/async/DatagramChannelWrapper;->mChannel:Ljava/nio/channels/DatagramChannel;

    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, p2, v1}, Ljava/nio/channels/DatagramChannel;->send(Ljava/nio/ByteBuffer;Ljava/net/SocketAddress;)I
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_33} :catch_34

    goto :goto_1a

    .line 60
    :catch_34
    move-exception v0

    goto :goto_1a
.end method
