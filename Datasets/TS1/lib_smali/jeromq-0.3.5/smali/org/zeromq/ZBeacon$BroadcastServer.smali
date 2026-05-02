.class Lorg/zeromq/ZBeacon$BroadcastServer;
.super Ljava/lang/Thread;
.source "ZBeacon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZBeacon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BroadcastServer"
.end annotation


# instance fields
.field private handle:Ljava/nio/channels/DatagramChannel;

.field private final ignoreLocalAddress:Z

.field final synthetic this$0:Lorg/zeromq/ZBeacon;


# direct methods
.method public constructor <init>(Lorg/zeromq/ZBeacon;Z)V
    .registers 8
    .param p2, "ignoreLocalAddress"    # Z

    .prologue
    .line 178
    iput-object p1, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->this$0:Lorg/zeromq/ZBeacon;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 179
    iput-boolean p2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->ignoreLocalAddress:Z

    .line 182
    :try_start_7
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v2

    iput-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->handle:Ljava/nio/channels/DatagramChannel;

    .line 183
    iget-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->handle:Ljava/nio/channels/DatagramChannel;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/channels/DatagramChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 184
    iget-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->handle:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v2}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v1

    .line 185
    .local v1, "sock":Ljava/net/DatagramSocket;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V

    .line 186
    new-instance v2, Ljava/net/InetSocketAddress;

    const/4 v3, 0x4

    new-array v3, v3, [B

    fill-array-data v3, :array_3c

    invoke-static {v3}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v3

    # getter for: Lorg/zeromq/ZBeacon;->port:I
    invoke-static {p1}, Lorg/zeromq/ZBeacon;->access$100(Lorg/zeromq/ZBeacon;)I

    move-result v4

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v1, v2}, Ljava/net/DatagramSocket;->bind(Ljava/net/SocketAddress;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_33} :catch_34

    .line 191
    return-void

    .line 188
    .end local v1    # "sock":Ljava/net/DatagramSocket;
    :catch_34
    move-exception v0

    .line 189
    .local v0, "ioException":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 186
    nop

    :array_3c
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private handleMessage(Ljava/nio/ByteBuffer;ILjava/net/InetAddress;)V
    .registers 8
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # I
    .param p3, "from"    # Ljava/net/InetAddress;

    .prologue
    .line 232
    iget-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->prefix:[B
    invoke-static {v2}, Lorg/zeromq/ZBeacon;->access$400(Lorg/zeromq/ZBeacon;)[B

    move-result-object v2

    array-length v2, v2

    if-ge p2, v2, :cond_a

    .line 243
    :cond_9
    :goto_9
    return-void

    .line 235
    :cond_a
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 237
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    iget-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->prefix:[B
    invoke-static {v2}, Lorg/zeromq/ZBeacon;->access$400(Lorg/zeromq/ZBeacon;)[B

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_27

    .line 238
    aget-byte v2, v0, v1

    iget-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->prefix:[B
    invoke-static {v3}, Lorg/zeromq/ZBeacon;->access$400(Lorg/zeromq/ZBeacon;)[B

    move-result-object v3

    aget-byte v3, v3, v1

    if-ne v2, v3, :cond_9

    .line 237
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 242
    :cond_27
    iget-object v2, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->listener:Lorg/zeromq/ZBeacon$Listener;
    invoke-static {v2}, Lorg/zeromq/ZBeacon;->access$500(Lorg/zeromq/ZBeacon;)Lorg/zeromq/ZBeacon$Listener;

    move-result-object v2

    invoke-static {v0, p2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    invoke-interface {v2, p3, v3}, Lorg/zeromq/ZBeacon$Listener;->onBeacon(Ljava/net/InetAddress;[B)V

    goto :goto_9
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 196
    const v6, 0xffff

    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 199
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    :cond_7
    :goto_7
    invoke-static {}, Lorg/zeromq/ZBeacon$BroadcastServer;->interrupted()Z

    move-result v6

    if-nez v6, :cond_4f

    .line 200
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 202
    :try_start_10
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 203
    .local v2, "read":I
    iget-object v6, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->handle:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v6, v0}, Ljava/nio/channels/DatagramChannel;->receive(Ljava/nio/ByteBuffer;)Ljava/net/SocketAddress;

    move-result-object v3

    .line 204
    .local v3, "sender":Ljava/net/SocketAddress;
    if-eqz v3, :cond_7

    .line 208
    check-cast v3, Ljava/net/InetSocketAddress;

    .end local v3    # "sender":Ljava/net/SocketAddress;
    invoke-virtual {v3}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    .line 210
    .local v4, "senderAddress":Ljava/net/InetAddress;
    iget-boolean v6, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->ignoreLocalAddress:Z

    if-eqz v6, :cond_44

    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    invoke-virtual {v4}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v6

    if-nez v6, :cond_7

    invoke-virtual {v4}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v6

    if-nez v6, :cond_7

    .line 217
    :cond_44
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    sub-int v5, v2, v6

    .line 218
    .local v5, "size":I
    invoke-direct {p0, v0, v5, v4}, Lorg/zeromq/ZBeacon$BroadcastServer;->handleMessage(Ljava/nio/ByteBuffer;ILjava/net/InetAddress;)V
    :try_end_4d
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_10 .. :try_end_4d} :catch_4e
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_4d} :catch_59

    goto :goto_7

    .line 220
    .end local v2    # "read":I
    .end local v4    # "senderAddress":Ljava/net/InetAddress;
    .end local v5    # "size":I
    :catch_4e
    move-exception v1

    .line 227
    :cond_4f
    iget-object v6, p0, Lorg/zeromq/ZBeacon$BroadcastServer;->handle:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v6}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/DatagramSocket;->close()V

    .line 228
    return-void

    .line 223
    :catch_59
    move-exception v1

    .line 224
    .local v1, "ioException":Ljava/io/IOException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method
