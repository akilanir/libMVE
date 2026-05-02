.class public final Lcom/google/android/exoplayer/upstream/UdpDataSource;
.super Ljava/lang/Object;
.source "UdpDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/UriDataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;
    }
.end annotation


# static fields
.field public static final DEFAULT_MAX_PACKET_SIZE:I = 0x7d0


# instance fields
.field private address:Ljava/net/InetAddress;

.field private dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

.field private final listener:Lcom/google/android/exoplayer/upstream/TransferListener;

.field private multicastSocket:Ljava/net/MulticastSocket;

.field private opened:Z

.field private final packet:Ljava/net/DatagramPacket;

.field private packetBuffer:[B

.field private packetRemaining:I

.field private socket:Ljava/net/DatagramSocket;

.field private socketAddress:Ljava/net/InetSocketAddress;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;

    .prologue
    .line 69
    const/16 v0, 0x7d0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;I)V
    .registers 6
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .param p2, "maxPacketSize"    # I

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    .line 78
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    .line 79
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p2}, Ljava/net/DatagramPacket;-><init>([BII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    .line 80
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    if-eqz v0, :cond_f

    .line 137
    :try_start_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/net/MulticastSocket;->leaveGroup(Ljava/net/InetAddress;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_30

    .line 141
    :goto_d
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    .line 143
    :cond_f
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_1a

    .line 144
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 145
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    .line 147
    :cond_1a
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    .line 148
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    .line 149
    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 150
    iget-boolean v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    if-eqz v0, :cond_2f

    .line 151
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    .line 152
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v0, :cond_2f

    .line 153
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    .line 156
    :cond_2f
    return-void

    .line 138
    :catch_30
    move-exception v0

    goto :goto_d
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v0, v0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .registers 9
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x3a

    .line 84
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 85
    iget-object v4, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "uri":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 90
    .local v2, "port":I
    :try_start_21
    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v4

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    .line 91
    new-instance v4, Ljava/net/InetSocketAddress;

    iget-object v5, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-direct {v4, v5, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    .line 92
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v4}, Ljava/net/InetAddress;->isMulticastAddress()Z

    move-result v4

    if-eqz v4, :cond_5b

    .line 93
    new-instance v4, Ljava/net/MulticastSocket;

    iget-object v5, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-direct {v4, v5}, Ljava/net/MulticastSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    .line 94
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iget-object v5, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v4, v5}, Ljava/net/MulticastSocket;->joinGroup(Ljava/net/InetAddress;)V

    .line 95
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_4c} :catch_65

    .line 103
    :goto_4c
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    .line 104
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v4, :cond_58

    .line 105
    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v4}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferStart()V

    .line 107
    :cond_58
    const-wide/16 v4, -0x1

    return-wide v4

    .line 97
    :cond_5b
    :try_start_5b
    new-instance v4, Ljava/net/DatagramSocket;

    iget-object v5, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-direct {v4, v5}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_64} :catch_65

    goto :goto_4c

    .line 99
    :catch_65
    move-exception v0

    .line 100
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;

    invoke-direct {v4, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v4
.end method

.method public read([BII)I
    .registers 9
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;
        }
    .end annotation

    .prologue
    .line 112
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    if-nez v3, :cond_1e

    .line 115
    :try_start_4
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_b} :catch_39

    .line 120
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 121
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v3, :cond_1e

    .line 122
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    iget v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    invoke-interface {v3, v4}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    .line 126
    :cond_1e
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v3

    iget v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    sub-int v2, v3, v4

    .line 127
    .local v2, "packetOffset":I
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    invoke-static {v3, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 128
    .local v0, "bytesToRead":I
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    invoke-static {v3, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 129
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 130
    return v0

    .line 116
    .end local v0    # "bytesToRead":I
    .end local v2    # "packetOffset":I
    :catch_39
    move-exception v1

    .line 117
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;

    invoke-direct {v3, v1}, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v3
.end method
