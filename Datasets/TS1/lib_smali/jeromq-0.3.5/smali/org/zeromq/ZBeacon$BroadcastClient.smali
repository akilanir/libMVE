.class Lorg/zeromq/ZBeacon$BroadcastClient;
.super Ljava/lang/Thread;
.source "ZBeacon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZBeacon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BroadcastClient"
.end annotation


# instance fields
.field private broadcastChannel:Ljava/nio/channels/DatagramChannel;

.field private final broadcastInetSocketAddress:Ljava/net/InetSocketAddress;

.field final synthetic this$0:Lorg/zeromq/ZBeacon;


# direct methods
.method public constructor <init>(Lorg/zeromq/ZBeacon;)V
    .registers 5

    .prologue
    .line 131
    iput-object p1, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->this$0:Lorg/zeromq/ZBeacon;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 132
    new-instance v0, Ljava/net/InetSocketAddress;

    # getter for: Lorg/zeromq/ZBeacon;->broadcastInetAddress:Ljava/net/InetAddress;
    invoke-static {p1}, Lorg/zeromq/ZBeacon;->access$000(Lorg/zeromq/ZBeacon;)Ljava/net/InetAddress;

    move-result-object v1

    # getter for: Lorg/zeromq/ZBeacon;->port:I
    invoke-static {p1}, Lorg/zeromq/ZBeacon;->access$100(Lorg/zeromq/ZBeacon;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v0, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastInetSocketAddress:Ljava/net/InetSocketAddress;

    .line 133
    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 139
    :try_start_0
    invoke-static {}, Ljava/nio/channels/DatagramChannel;->open()Ljava/nio/channels/DatagramChannel;

    move-result-object v3

    iput-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastChannel:Ljava/nio/channels/DatagramChannel;

    .line 140
    iget-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v3}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/net/DatagramSocket;->setBroadcast(Z)V

    .line 141
    :goto_10
    invoke-static {}, Lorg/zeromq/ZBeacon$BroadcastClient;->interrupted()Z
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_13} :catch_3f
    .catchall {:try_start_0 .. :try_end_13} :catchall_46

    move-result v3

    if-nez v3, :cond_32

    .line 143
    :try_start_16
    iget-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastChannel:Ljava/nio/channels/DatagramChannel;

    iget-object v4, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->beacon:[B
    invoke-static {v4}, Lorg/zeromq/ZBeacon;->access$200(Lorg/zeromq/ZBeacon;)[B

    move-result-object v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastInetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v3, v4, v5}, Ljava/nio/channels/DatagramChannel;->send(Ljava/nio/ByteBuffer;Ljava/net/SocketAddress;)I

    .line 144
    iget-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->this$0:Lorg/zeromq/ZBeacon;

    # getter for: Lorg/zeromq/ZBeacon;->broadcastInterval:J
    invoke-static {v3}, Lorg/zeromq/ZBeacon;->access$300(Lorg/zeromq/ZBeacon;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_30
    .catch Ljava/lang/InterruptedException; {:try_start_16 .. :try_end_30} :catch_31
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_30} :catch_38
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_30} :catch_3f
    .catchall {:try_start_16 .. :try_end_30} :catchall_46

    goto :goto_10

    .line 146
    :catch_31
    move-exception v1

    .line 159
    :cond_32
    :try_start_32
    iget-object v3, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v3}, Ljava/nio/channels/DatagramChannel;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_37} :catch_4d

    .line 165
    return-void

    .line 149
    :catch_38
    move-exception v0

    .line 150
    .local v0, "exception":Ljava/lang/Exception;
    :try_start_39
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3f} :catch_3f
    .catchall {:try_start_39 .. :try_end_3f} :catchall_46

    .line 154
    .end local v0    # "exception":Ljava/lang/Exception;
    :catch_3f
    move-exception v2

    .line 155
    .local v2, "ioException":Ljava/io/IOException;
    :try_start_40
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_46
    .catchall {:try_start_40 .. :try_end_46} :catchall_46

    .line 158
    .end local v2    # "ioException":Ljava/io/IOException;
    :catchall_46
    move-exception v3

    .line 159
    :try_start_47
    iget-object v4, p0, Lorg/zeromq/ZBeacon$BroadcastClient;->broadcastChannel:Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v4}, Ljava/nio/channels/DatagramChannel;->close()V
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4c} :catch_54

    .line 162
    throw v3

    .line 161
    :catch_4d
    move-exception v2

    .line 162
    .restart local v2    # "ioException":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 161
    .end local v2    # "ioException":Ljava/io/IOException;
    :catch_54
    move-exception v2

    .line 162
    .restart local v2    # "ioException":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
