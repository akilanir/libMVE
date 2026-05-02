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
.field public static final DEAFULT_SOCKET_TIMEOUT_MILLIS:I = 0x1f40

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

.field private final socketTimeoutMillis:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;

    .prologue
    .line 76
    const/16 v0, 0x7d0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;I)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;I)V
    .registers 4
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .param p2, "maxPacketSize"    # I

    .prologue
    .line 84
    const/16 v0, 0x1f40

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;II)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;II)V
    .registers 7
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;
    .param p2, "maxPacketSize"    # I
    .param p3, "socketTimeoutMillis"    # I

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    .line 95
    iput p3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketTimeoutMillis:I

    .line 96
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    .line 97
    new-instance v0, Ljava/net/DatagramPacket;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p2}, Ljava/net/DatagramPacket;-><init>([BII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    .line 98
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 158
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    if-eqz v0, :cond_f

    .line 160
    :try_start_6
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/net/MulticastSocket;->leaveGroup(Ljava/net/InetAddress;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_d} :catch_30

    .line 164
    :goto_d
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    .line 166
    :cond_f
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_1a

    .line 167
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 168
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    .line 170
    :cond_1a
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    .line 171
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    .line 172
    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 173
    iget-boolean v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    if-eqz v0, :cond_2f

    .line 174
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    .line 175
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v0, :cond_2f

    .line 176
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    .line 179
    :cond_2f
    return-void

    .line 161
    :catch_30
    move-exception v0

    goto :goto_d
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 183
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
    .registers 7
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;
        }
    .end annotation

    .prologue
    .line 102
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 103
    iget-object v3, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "host":Ljava/lang/String;
    iget-object v3, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getPort()I

    move-result v2

    .line 107
    .local v2, "port":I
    :try_start_e
    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    .line 108
    new-instance v3, Ljava/net/InetSocketAddress;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-direct {v3, v4, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    .line 109
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v3}, Ljava/net/InetAddress;->isMulticastAddress()Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 110
    new-instance v3, Ljava/net/MulticastSocket;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-direct {v3, v4}, Ljava/net/MulticastSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    .line 111
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->address:Ljava/net/InetAddress;

    invoke-virtual {v3, v4}, Ljava/net/MulticastSocket;->joinGroup(Ljava/net/InetAddress;)V

    .line 112
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->multicastSocket:Ljava/net/MulticastSocket;

    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_39} :catch_59

    .line 121
    :goto_39
    :try_start_39
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    iget v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketTimeoutMillis:I

    invoke-virtual {v3, v4}, Ljava/net/DatagramSocket;->setSoTimeout(I)V
    :try_end_40
    .catch Ljava/net/SocketException; {:try_start_39 .. :try_end_40} :catch_60

    .line 126
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->opened:Z

    .line 127
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v3, :cond_4c

    .line 128
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v3}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferStart()V

    .line 130
    :cond_4c
    const-wide/16 v3, -0x1

    return-wide v3

    .line 114
    :cond_4f
    :try_start_4f
    new-instance v3, Ljava/net/DatagramSocket;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-direct {v3, v4}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_58} :catch_59

    goto :goto_39

    .line 116
    :catch_59
    move-exception v0

    .line 117
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v3

    .line 122
    .end local v0    # "e":Ljava/io/IOException;
    :catch_60
    move-exception v0

    .line 123
    .local v0, "e":Ljava/net/SocketException;
    new-instance v3, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v3
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
    .line 135
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    if-nez v3, :cond_1e

    .line 138
    :try_start_4
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->socket:Ljava/net/DatagramSocket;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_b} :catch_39

    .line 143
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v3

    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 144
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v3, :cond_1e

    .line 145
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    iget v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    invoke-interface {v3, v4}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    .line 149
    :cond_1e
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packet:Ljava/net/DatagramPacket;

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v3

    iget v4, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    sub-int v2, v3, v4

    .line 150
    .local v2, "packetOffset":I
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    invoke-static {v3, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 151
    .local v0, "bytesToRead":I
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetBuffer:[B

    invoke-static {v3, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    iget v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/google/android/exoplayer/upstream/UdpDataSource;->packetRemaining:I

    .line 153
    return v0

    .line 139
    .end local v0    # "bytesToRead":I
    .end local v2    # "packetOffset":I
    :catch_39
    move-exception v1

    .line 140
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;

    invoke-direct {v3, v1}, Lcom/google/android/exoplayer/upstream/UdpDataSource$UdpDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v3
.end method
