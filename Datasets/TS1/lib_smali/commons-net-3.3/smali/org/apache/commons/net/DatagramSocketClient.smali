.class public abstract Lorg/apache/commons/net/DatagramSocketClient;
.super Ljava/lang/Object;
.source "DatagramSocketClient.java"


# static fields
.field private static final __DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;


# instance fields
.field protected _isOpen_:Z

.field protected _socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

.field protected _socket_:Ljava/net/DatagramSocket;

.field protected _timeout_:I

.field private charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    new-instance v0, Lorg/apache/commons/net/DefaultDatagramSocketFactory;

    invoke-direct {v0}, Lorg/apache/commons/net/DefaultDatagramSocketFactory;-><init>()V

    sput-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 85
    iput v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    .line 86
    iput-boolean v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 87
    sget-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    .line 88
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_9

    .line 164
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 166
    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 167
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 168
    return-void
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getCharsetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultTimeout()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getSoTimeout()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getSoTimeout()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 178
    iget-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return v0
.end method

.method public open()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 105
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 107
    return-void
.end method

.method public open(I)V
    .registers 4
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(I)Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 125
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 127
    return-void
.end method

.method public open(ILjava/net/InetAddress;)V
    .registers 5
    .param p1, "port"    # I
    .param p2, "laddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 147
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 148
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 149
    return-void
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 312
    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->charset:Ljava/nio/charset/Charset;

    .line 313
    return-void
.end method

.method public setDatagramSocketFactory(Lorg/apache/commons/net/DatagramSocketFactory;)V
    .registers 3
    .param p1, "factory"    # Lorg/apache/commons/net/DatagramSocketFactory;

    .prologue
    .line 277
    if-nez p1, :cond_7

    .line 278
    sget-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    .line 282
    :goto_6
    return-void

    .line 280
    :cond_7
    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    goto :goto_6
.end method

.method public setDefaultTimeout(I)V
    .registers 2
    .param p1, "timeout"    # I

    .prologue
    .line 195
    iput p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    .line 196
    return-void
.end method

.method public setSoTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 223
    return-void
.end method
