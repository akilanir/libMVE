.class public Lzmq/Address;
.super Ljava/lang/Object;
.source "Address.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Address$IZAddress;
    }
.end annotation


# instance fields
.field private final address:Ljava/lang/String;

.field private final ipv4only:Z

.field private final protocol:Ljava/lang/String;

.field private resolved:Lzmq/Address$IZAddress;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "ipv4only"    # Z

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    .line 43
    iput-object p2, p0, Lzmq/Address;->address:Ljava/lang/String;

    .line 44
    iput-boolean p3, p0, Lzmq/Address;->ipv4only:Z

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/net/SocketAddress;)V
    .registers 5
    .param p1, "socketAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v0, p1

    .line 50
    check-cast v0, Ljava/net/InetSocketAddress;

    .line 51
    .local v0, "sockAddr":Ljava/net/InetSocketAddress;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lzmq/Address;->address:Ljava/lang/String;

    .line 52
    const-string v1, "tcp"

    iput-object v1, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    .line 53
    const/4 v1, 0x0

    iput-object v1, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    .line 54
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    instance-of v1, v1, Ljava/net/Inet6Address;

    if-nez v1, :cond_3e

    const/4 v1, 0x1

    :goto_3b
    iput-boolean v1, p0, Lzmq/Address;->ipv4only:Z

    .line 55
    return-void

    .line 54
    :cond_3e
    const/4 v1, 0x0

    goto :goto_3b
.end method


# virtual methods
.method public address()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lzmq/Address;->address:Ljava/lang/String;

    return-object v0
.end method

.method public isResolved()Z
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public protocol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public resolve()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    .line 96
    iget-object v1, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    const-string v2, "tcp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 97
    new-instance v1, Lzmq/TcpAddress;

    invoke-direct {v1}, Lzmq/TcpAddress;-><init>()V

    iput-object v1, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    .line 98
    iget-object v1, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    iget-object v2, p0, Lzmq/Address;->address:Ljava/lang/String;

    iget-boolean v3, p0, Lzmq/Address;->ipv4only:Z

    invoke-interface {v1, v2, v3}, Lzmq/Address$IZAddress;->resolve(Ljava/lang/String;Z)V

    .line 107
    :goto_1b
    return v0

    .line 101
    :cond_1c
    iget-object v1, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    const-string v2, "ipc"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 102
    new-instance v1, Lzmq/IpcAddress;

    invoke-direct {v1}, Lzmq/IpcAddress;-><init>()V

    iput-object v1, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    .line 103
    iget-object v1, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    iget-object v2, p0, Lzmq/Address;->address:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lzmq/Address$IZAddress;->resolve(Ljava/lang/String;Z)V

    goto :goto_1b

    .line 107
    :cond_35
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public resolved()Lzmq/Address$IZAddress;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 60
    iget-object v0, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    const-string v1, "tcp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lzmq/Address;->isResolved()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 61
    iget-object v0, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    invoke-interface {v0}, Lzmq/Address$IZAddress;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    :goto_16
    return-object v0

    .line 63
    :cond_17
    iget-object v0, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    const-string v1, "ipc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0}, Lzmq/Address;->isResolved()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 64
    iget-object v0, p0, Lzmq/Address;->resolved:Lzmq/Address$IZAddress;

    invoke-interface {v0}, Lzmq/Address$IZAddress;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 66
    :cond_2e
    iget-object v0, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5a

    iget-object v0, p0, Lzmq/Address;->address:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5a

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lzmq/Address;->protocol:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/Address;->address:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 70
    :cond_5a
    const-string v0, ""

    goto :goto_16
.end method
