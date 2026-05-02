.class public Lcom/koushikdutta/async/AsyncNetworkSocket;
.super Ljava/lang/Object;
.source "AsyncNetworkSocket.java"

# interfaces
.implements Lcom/koushikdutta/async/AsyncSocket;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field allocator:Lcom/koushikdutta/async/util/Allocator;

.field closeReported:Z

.field private mChannel:Lcom/koushikdutta/async/ChannelWrapper;

.field mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

.field private mCompletedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

.field mDataHandler:Lcom/koushikdutta/async/callback/DataCallback;

.field mEndReported:Z

.field private mKey:Ljava/nio/channels/SelectionKey;

.field mPaused:Z

.field mPendingEndException:Ljava/lang/Exception;

.field private mServer:Lcom/koushikdutta/async/AsyncServer;

.field mWriteableHandler:Lcom/koushikdutta/async/callback/WritableCallback;

.field private pending:Lcom/koushikdutta/async/ByteBufferList;

.field socketAddress:Ljava/net/InetSocketAddress;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-class v0, Lcom/koushikdutta/async/AsyncNetworkSocket;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/AsyncNetworkSocket;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    .line 267
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    .line 20
    return-void
.end method

.method private handleRemaining(I)V
    .registers 4
    .param p1, "remaining"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-nez v0, :cond_13

    .line 101
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/nio/channels/CancelledKeyException;

    invoke-direct {v1}, Ljava/nio/channels/CancelledKeyException;-><init>()V

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 102
    :cond_13
    if-lez p1, :cond_35

    .line 104
    sget-boolean v0, Lcom/koushikdutta/async/AsyncNetworkSocket;->$assertionsDisabled:Z

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_27

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 107
    :cond_27
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v1

    or-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 113
    :goto_34
    return-void

    .line 111
    :cond_35
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v1

    and-int/lit8 v1, v1, -0x5

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    goto :goto_34
.end method

.method private spitPending()V
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 293
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-static {p0, v0}, Lcom/koushikdutta/async/Util;->emitAllData(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 295
    :cond_d
    return-void
.end method


# virtual methods
.method attach(Ljava/nio/channels/DatagramChannel;)V
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/DatagramChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lcom/koushikdutta/async/DatagramChannelWrapper;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/DatagramChannelWrapper;-><init>(Ljava/nio/channels/DatagramChannel;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    .line 42
    new-instance v0, Lcom/koushikdutta/async/util/Allocator;

    const/16 v1, 0x2000

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/util/Allocator;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->allocator:Lcom/koushikdutta/async/util/Allocator;

    .line 43
    return-void
.end method

.method attach(Ljava/nio/channels/SocketChannel;Ljava/net/InetSocketAddress;)V
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SocketChannel;
    .param p2, "socketAddress"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    iput-object p2, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->socketAddress:Ljava/net/InetSocketAddress;

    .line 34
    new-instance v0, Lcom/koushikdutta/async/util/Allocator;

    invoke-direct {v0}, Lcom/koushikdutta/async/util/Allocator;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->allocator:Lcom/koushikdutta/async/util/Allocator;

    .line 35
    new-instance v0, Lcom/koushikdutta/async/SocketChannelWrapper;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/SocketChannelWrapper;-><init>(Ljava/nio/channels/SocketChannel;)V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    .line 36
    return-void
.end method

.method public charset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 347
    const/4 v0, 0x0

    return-object v0
.end method

.method public close()V
    .registers 2

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeInternal()V

    .line 186
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportClose(Ljava/lang/Exception;)V

    .line 187
    return-void
.end method

.method public closeInternal()V
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 192
    :try_start_5
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_b

    .line 196
    :goto_a
    return-void

    .line 194
    :catch_b
    move-exception v0

    goto :goto_a
.end method

.method public end()V
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->shutdownOutput()V

    .line 25
    return-void
.end method

.method getChannel()Lcom/koushikdutta/async/ChannelWrapper;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    return-object v0
.end method

.method public getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-object v0
.end method

.method public getDataCallback()Lcom/koushikdutta/async/callback/DataCallback;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mDataHandler:Lcom/koushikdutta/async/callback/DataCallback;

    return-object v0
.end method

.method public getEndCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mCompletedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    return-object v0
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 338
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .registers 2

    .prologue
    .line 334
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->socketAddress:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 329
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method public getSocket()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->getChannel()Lcom/koushikdutta/async/ChannelWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->getSocket()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mWriteableHandler:Lcom/koushikdutta/async/callback/WritableCallback;

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->isChunked()Z

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isPaused()Z
    .registers 2

    .prologue
    .line 324
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    return v0
.end method

.method public onDataWritable()V
    .registers 3

    .prologue
    .line 51
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ChannelWrapper;->isChunked()Z

    move-result v0

    if-nez v0, :cond_15

    .line 53
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v1

    and-int/lit8 v1, v1, -0x5

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 55
    :cond_15
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mWriteableHandler:Lcom/koushikdutta/async/callback/WritableCallback;

    if-eqz v0, :cond_1e

    .line 56
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mWriteableHandler:Lcom/koushikdutta/async/callback/WritableCallback;

    invoke-interface {v0}, Lcom/koushikdutta/async/callback/WritableCallback;->onWriteable()V

    .line 57
    :cond_1e
    return-void
.end method

.method onReadable()I
    .registers 11

    .prologue
    const-wide/16 v8, 0x0

    .line 119
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->spitPending()V

    .line 123
    iget-boolean v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    if-eqz v6, :cond_b

    .line 124
    const/4 v5, 0x0

    .line 169
    :cond_a
    :goto_a
    return v5

    .line 125
    :cond_b
    const/4 v5, 0x0

    .line 127
    .local v5, "total":I
    const/4 v1, 0x0

    .line 130
    .local v1, "closed":Z
    :try_start_d
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v6}, Lcom/koushikdutta/async/util/Allocator;->allocate()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 134
    .local v0, "b":Ljava/nio/ByteBuffer;
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/ChannelWrapper;->read(Ljava/nio/ByteBuffer;)I

    move-result v6

    int-to-long v3, v6

    .line 135
    .local v3, "read":J
    cmp-long v6, v3, v8

    if-gez v6, :cond_4e

    .line 136
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeInternal()V

    .line 137
    const/4 v1, 0x1

    .line 142
    :goto_22
    cmp-long v6, v3, v8

    if-lez v6, :cond_52

    .line 143
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v6, v3, v4}, Lcom/koushikdutta/async/util/Allocator;->track(J)V

    .line 144
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 151
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 152
    iget-object v6, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-static {p0, v6}, Lcom/koushikdutta/async/Util;->emitAllData(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 158
    :goto_38
    if-eqz v1, :cond_a

    .line 159
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportEndPending(Ljava/lang/Exception;)V

    .line 160
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportClose(Ljava/lang/Exception;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_42} :catch_43

    goto :goto_a

    .line 163
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v3    # "read":J
    :catch_43
    move-exception v2

    .line 164
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeInternal()V

    .line 165
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportEndPending(Ljava/lang/Exception;)V

    .line 166
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportClose(Ljava/lang/Exception;)V

    goto :goto_a

    .line 140
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    .restart local v3    # "read":J
    :cond_4e
    int-to-long v6, v5

    add-long/2addr v6, v3

    long-to-int v5, v6

    goto :goto_22

    .line 155
    :cond_52
    :try_start_52
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_55} :catch_43

    goto :goto_38
.end method

.method public pause()V
    .registers 3

    .prologue
    .line 270
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_17

    .line 271
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    new-instance v1, Lcom/koushikdutta/async/AsyncNetworkSocket$2;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncNetworkSocket$2;-><init>(Lcom/koushikdutta/async/AsyncNetworkSocket;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 289
    :cond_16
    :goto_16
    return-void

    .line 280
    :cond_17
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    if-nez v0, :cond_16

    .line 283
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    .line 285
    :try_start_1e
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v1

    and-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_2b} :catch_2c

    goto :goto_16

    .line 287
    :catch_2c
    move-exception v0

    goto :goto_16
.end method

.method protected reportClose(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 174
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeReported:Z

    if-eqz v0, :cond_5

    .line 181
    :cond_4
    :goto_4
    return-void

    .line 176
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeReported:Z

    .line 177
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

    if-eqz v0, :cond_4

    .line 178
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

    goto :goto_4
.end method

.method reportEnd(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 232
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mEndReported:Z

    if-eqz v0, :cond_5

    .line 240
    :cond_4
    :goto_4
    return-void

    .line 234
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mEndReported:Z

    .line 235
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mCompletedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    if-eqz v0, :cond_12

    .line 236
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mCompletedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_4

    .line 237
    :cond_12
    if-eqz p1, :cond_4

    .line 238
    const-string v0, "NIO"

    const-string v1, "Unhandled exception"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method reportEndPending(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 244
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 245
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPendingEndException:Ljava/lang/Exception;

    .line 249
    :goto_a
    return-void

    .line 248
    :cond_b
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportEnd(Ljava/lang/Exception;)V

    goto :goto_a
.end method

.method public resume()V
    .registers 3

    .prologue
    .line 299
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-eq v0, v1, :cond_17

    .line 300
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    new-instance v1, Lcom/koushikdutta/async/AsyncNetworkSocket$3;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/AsyncNetworkSocket$3;-><init>(Lcom/koushikdutta/async/AsyncNetworkSocket;)V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 320
    :cond_16
    :goto_16
    return-void

    .line 309
    :cond_17
    iget-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    if-eqz v0, :cond_16

    .line 311
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPaused:Z

    .line 313
    :try_start_1e
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v1

    or-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_2b} :catch_3a

    .line 317
    :goto_2b
    invoke-direct {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->spitPending()V

    .line 318
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->isOpen()Z

    move-result v0

    if-nez v0, :cond_16

    .line 319
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mPendingEndException:Ljava/lang/Exception;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportEndPending(Ljava/lang/Exception;)V

    goto :goto_16

    .line 315
    :catch_3a
    move-exception v0

    goto :goto_2b
.end method

.method public setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mClosedHander:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 219
    return-void
.end method

.method public setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/DataCallback;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mDataHandler:Lcom/koushikdutta/async/callback/DataCallback;

    .line 208
    return-void
.end method

.method public setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mCompletedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 255
    return-void
.end method

.method public setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V
    .registers 2
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/WritableCallback;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mWriteableHandler:Lcom/koushikdutta/async/callback/WritableCallback;

    .line 202
    return-void
.end method

.method setup(Lcom/koushikdutta/async/AsyncServer;Ljava/nio/channels/SelectionKey;)V
    .registers 3
    .param p1, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .param p2, "key"    # Ljava/nio/channels/SelectionKey;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    .line 65
    iput-object p2, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mKey:Ljava/nio/channels/SelectionKey;

    .line 66
    return-void
.end method

.method public write(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 7
    .param p1, "list"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 70
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v3}, Lcom/koushikdutta/async/AsyncServer;->getAffinity()Ljava/lang/Thread;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    if-eq v3, v4, :cond_17

    .line 71
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    new-instance v4, Lcom/koushikdutta/async/AsyncNetworkSocket$1;

    invoke-direct {v4, p0, p1}, Lcom/koushikdutta/async/AsyncNetworkSocket$1;-><init>(Lcom/koushikdutta/async/AsyncNetworkSocket;Lcom/koushikdutta/async/ByteBufferList;)V

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V

    .line 97
    :cond_16
    :goto_16
    return-void

    .line 79
    :cond_17
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ChannelWrapper;->isConnected()Z

    move-result v3

    if-nez v3, :cond_31

    .line 80
    sget-boolean v3, Lcom/koushikdutta/async/AsyncNetworkSocket;->$assertionsDisabled:Z

    if-nez v3, :cond_16

    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v3}, Lcom/koushikdutta/async/ChannelWrapper;->isChunked()Z

    move-result v3

    if-eqz v3, :cond_16

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 85
    :cond_31
    :try_start_31
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v1

    .line 86
    .local v1, "before":I
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->getAllArray()[Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 87
    .local v0, "arr":[Ljava/nio/ByteBuffer;
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mChannel:Lcom/koushikdutta/async/ChannelWrapper;

    invoke-virtual {v3, v0}, Lcom/koushikdutta/async/ChannelWrapper;->write([Ljava/nio/ByteBuffer;)I

    .line 88
    invoke-virtual {p1, v0}, Lcom/koushikdutta/async/ByteBufferList;->addAll([Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 89
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/koushikdutta/async/AsyncNetworkSocket;->handleRemaining(I)V

    .line 90
    iget-object v3, p0, Lcom/koushikdutta/async/AsyncNetworkSocket;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    sub-int v4, v1, v4

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/AsyncServer;->onDataSent(I)V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_53} :catch_54

    goto :goto_16

    .line 92
    .end local v0    # "arr":[Ljava/nio/ByteBuffer;
    .end local v1    # "before":I
    :catch_54
    move-exception v2

    .line 93
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/koushikdutta/async/AsyncNetworkSocket;->closeInternal()V

    .line 94
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportEndPending(Ljava/lang/Exception;)V

    .line 95
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/AsyncNetworkSocket;->reportClose(Ljava/lang/Exception;)V

    goto :goto_16
.end method
