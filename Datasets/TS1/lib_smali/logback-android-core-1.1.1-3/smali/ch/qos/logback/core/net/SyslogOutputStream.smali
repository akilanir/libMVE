.class public Lch/qos/logback/core/net/SyslogOutputStream;
.super Ljava/io/OutputStream;


# static fields
.field private static final MAX_LEN:I = 0x400


# instance fields
.field private address:Ljava/net/InetAddress;

.field private baos:Ljava/io/ByteArrayOutputStream;

.field private ds:Ljava/net/DatagramSocket;

.field private final port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;,
            Ljava/net/SocketException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->address:Ljava/net/InetAddress;

    iput p2, p0, Lch/qos/logback/core/net/SyslogOutputStream;->port:I

    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0}, Ljava/net/DatagramSocket;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->ds:Ljava/net/DatagramSocket;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->address:Ljava/net/InetAddress;

    iput-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->ds:Ljava/net/DatagramSocket;

    return-void
.end method

.method public flush()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    new-instance v1, Ljava/net/DatagramPacket;

    array-length v2, v0

    iget-object v3, p0, Lch/qos/logback/core/net/SyslogOutputStream;->address:Ljava/net/InetAddress;

    iget v4, p0, Lch/qos/logback/core/net/SyslogOutputStream;->port:I

    invoke-direct {v1, v0, v2, v3, v4}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    iget-object v2, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :cond_25

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v2, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    :goto_21
    array-length v0, v0

    if-nez v0, :cond_2b

    :cond_24
    :goto_24
    return-void

    :cond_25
    iget-object v2, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    goto :goto_21

    :cond_2b
    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->ds:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->ds:Ljava/net/DatagramSocket;

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    goto :goto_24
.end method

.method public getPort()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->port:I

    return v0
.end method

.method getSendBufferSize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->ds:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getSendBufferSize()I

    move-result v0

    return v0
.end method

.method public write(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    return-void
.end method

.method public write([BII)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/SyslogOutputStream;->baos:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    return-void
.end method
