.class Lcom/koushikdutta/async/SocketChannelWrapper;
.super Lcom/koushikdutta/async/ChannelWrapper;
.source "SocketChannelWrapper.java"


# instance fields
.field mChannel:Ljava/nio/channels/SocketChannel;


# direct methods
.method constructor <init>(Ljava/nio/channels/SocketChannel;)V
    .registers 2
    .param p1, "channel"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/ChannelWrapper;-><init>(Ljava/nio/channels/spi/AbstractSelectableChannel;)V

    .line 20
    iput-object p1, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    .line 21
    return-void
.end method


# virtual methods
.method public getLocalPort()I
    .registers 2

    .prologue
    .line 15
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getSocket()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v0

    return v0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method public read([Ljava/nio/ByteBuffer;)J
    .registers 4
    .param p1, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->read([Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    return-wide v0
.end method

.method public read([Ljava/nio/ByteBuffer;II)J
    .registers 6
    .param p1, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "i"    # I
    .param p3, "i2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/channels/SocketChannel;->read([Ljava/nio/ByteBuffer;II)J

    move-result-wide v0

    return-wide v0
.end method

.method public register(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;
    .registers 3
    .param p1, "sel"    # Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/channels/ClosedChannelException;
        }
    .end annotation

    .prologue
    .line 40
    const/16 v0, 0x8

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/SocketChannelWrapper;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    move-result-object v0

    return-object v0
.end method

.method public shutdownInput()V
    .registers 2

    .prologue
    .line 55
    :try_start_0
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_a

    .line 59
    :goto_9
    return-void

    .line 57
    :catch_a
    move-exception v0

    goto :goto_9
.end method

.method public shutdownOutput()V
    .registers 2

    .prologue
    .line 46
    :try_start_0
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_a

    .line 50
    :goto_9
    return-void

    .line 48
    :catch_a
    move-exception v0

    goto :goto_9
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .registers 3
    .param p1, "src"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method public write([Ljava/nio/ByteBuffer;)I
    .registers 4
    .param p1, "src"    # [Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/koushikdutta/async/SocketChannelWrapper;->mChannel:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/SocketChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method
