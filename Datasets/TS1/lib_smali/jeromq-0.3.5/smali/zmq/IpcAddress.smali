.class public Lzmq/IpcAddress;
.super Ljava/lang/Object;
.source "IpcAddress.java"

# interfaces
.implements Lzmq/Address$IZAddress;


# instance fields
.field private address:Ljava/net/InetSocketAddress;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public address()Ljava/net/SocketAddress;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lzmq/IpcAddress;->address:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public resolve(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ip4only"    # Z

    .prologue
    .line 45
    iput-object p1, p0, Lzmq/IpcAddress;->name:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 48
    .local v1, "hash":I
    if-gez v1, :cond_9

    .line 49
    neg-int v1, v1

    .line 51
    :cond_9
    const v2, 0xd8f0

    rem-int/2addr v1, v2

    .line 52
    add-int/lit16 v1, v1, 0x2710

    .line 55
    :try_start_f
    new-instance v2, Ljava/net/InetSocketAddress;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v2, p0, Lzmq/IpcAddress;->address:Ljava/net/InetSocketAddress;
    :try_end_1b
    .catch Ljava/net/UnknownHostException; {:try_start_f .. :try_end_1b} :catch_1c

    .line 60
    return-void

    .line 57
    :catch_1c
    move-exception v0

    .line 58
    .local v0, "e":Ljava/net/UnknownHostException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 35
    iget-object v0, p0, Lzmq/IpcAddress;->name:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 36
    const-string v0, ""

    .line 39
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ipc://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/IpcAddress;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
