.class public Lzmq/IpcListener;
.super Lzmq/TcpListener;
.source "IpcListener.java"


# instance fields
.field private final address:Lzmq/IpcAddress;


# direct methods
.method public constructor <init>(Lzmq/IOThread;Lzmq/SocketBase;Lzmq/Options;)V
    .registers 5
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "socket"    # Lzmq/SocketBase;
    .param p3, "options"    # Lzmq/Options;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lzmq/TcpListener;-><init>(Lzmq/IOThread;Lzmq/SocketBase;Lzmq/Options;)V

    .line 33
    new-instance v0, Lzmq/IpcAddress;

    invoke-direct {v0}, Lzmq/IpcAddress;-><init>()V

    iput-object v0, p0, Lzmq/IpcListener;->address:Lzmq/IpcAddress;

    .line 34
    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lzmq/IpcListener;->address:Lzmq/IpcAddress;

    invoke-virtual {v0}, Lzmq/IpcAddress;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAddress(Ljava/lang/String;)I
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 45
    iget-object v2, p0, Lzmq/IpcListener;->address:Lzmq/IpcAddress;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Lzmq/IpcAddress;->resolve(Ljava/lang/String;Z)V

    .line 47
    iget-object v2, p0, Lzmq/IpcListener;->address:Lzmq/IpcAddress;

    invoke-virtual {v2}, Lzmq/IpcAddress;->address()Ljava/net/SocketAddress;

    move-result-object v1

    check-cast v1, Ljava/net/InetSocketAddress;

    .line 48
    .local v1, "sock":Ljava/net/InetSocketAddress;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "fake":Ljava/lang/String;
    invoke-super {p0, v0}, Lzmq/TcpListener;->setAddress(Ljava/lang/String;)I

    move-result v2

    return v2
.end method
