.class public Lzmq/TcpAddress;
.super Ljava/lang/Object;
.source "TcpAddress.java"

# interfaces
.implements Lzmq/Address$IZAddress;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/TcpAddress$TcpAddressMask;
    }
.end annotation


# instance fields
.field protected address:Ljava/net/InetSocketAddress;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lzmq/TcpAddress;->resolve(Ljava/lang/String;Z)V

    .line 43
    return-void
.end method


# virtual methods
.method public address()Ljava/net/SocketAddress;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    if-eqz v0, :cond_b

    .line 67
    iget-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    .line 69
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public resolve(Ljava/lang/String;Z)V
    .registers 16
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ipv4only"    # Z

    .prologue
    const/4 v12, 0x0

    .line 82
    const/16 v10, 0x3a

    invoke-virtual {p1, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 83
    .local v3, "delimiter":I
    if-gez v3, :cond_f

    .line 84
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 88
    :cond_f
    invoke-virtual {p1, v12, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "addrStr":Ljava/lang/String;
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 92
    .local v9, "portStr":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x2

    if-lt v10, v11, :cond_41

    invoke-virtual {v1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x5b

    if-ne v10, v11, :cond_41

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x5d

    if-ne v10, v11, :cond_41

    .line 94
    const/4 v10, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v1, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 99
    :cond_41
    const-string v10, "*"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_51

    const-string v10, "0"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_70

    .line 101
    :cond_51
    const/4 v8, 0x0

    .line 111
    .local v8, "port":I
    :cond_52
    const/4 v0, 0x0

    .line 113
    .local v0, "addrNet":Ljava/net/InetAddress;
    const-string v10, "*"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5d

    .line 114
    const-string v1, "0.0.0.0"

    .line 117
    :cond_5d
    :try_start_5d
    invoke-static {v1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v2

    .local v2, "arr$":[Ljava/net/InetAddress;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_63
    if-ge v5, v7, :cond_7d

    aget-object v6, v2, v5

    .line 118
    .local v6, "ia":Ljava/net/InetAddress;
    if-eqz p2, :cond_7c

    instance-of v10, v6, Ljava/net/Inet6Address;
    :try_end_6b
    .catch Ljava/net/UnknownHostException; {:try_start_5d .. :try_end_6b} :catch_85

    if-eqz v10, :cond_7c

    .line 117
    add-int/lit8 v5, v5, 0x1

    goto :goto_63

    .line 105
    .end local v0    # "addrNet":Ljava/net/InetAddress;
    .end local v2    # "arr$":[Ljava/net/InetAddress;
    .end local v5    # "i$":I
    .end local v6    # "ia":Ljava/net/InetAddress;
    .end local v7    # "len$":I
    .end local v8    # "port":I
    :cond_70
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 106
    .restart local v8    # "port":I
    if-nez v8, :cond_52

    .line 107
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 121
    .restart local v0    # "addrNet":Ljava/net/InetAddress;
    .restart local v2    # "arr$":[Ljava/net/InetAddress;
    .restart local v5    # "i$":I
    .restart local v6    # "ia":Ljava/net/InetAddress;
    .restart local v7    # "len$":I
    :cond_7c
    move-object v0, v6

    .line 129
    .end local v6    # "ia":Ljava/net/InetAddress;
    :cond_7d
    if-nez v0, :cond_8c

    .line 130
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 125
    .end local v2    # "arr$":[Ljava/net/InetAddress;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    :catch_85
    move-exception v4

    .line 126
    .local v4, "e":Ljava/net/UnknownHostException;
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 133
    .end local v4    # "e":Ljava/net/UnknownHostException;
    .restart local v2    # "arr$":[Ljava/net/InetAddress;
    .restart local v5    # "i$":I
    .restart local v7    # "len$":I
    :cond_8c
    new-instance v10, Ljava/net/InetSocketAddress;

    invoke-direct {v10, v0, v8}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v10, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    .line 134
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 52
    iget-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    if-nez v0, :cond_7

    .line 53
    const-string v0, ""

    .line 60
    :goto_6
    return-object v0

    .line 56
    :cond_7
    iget-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    instance-of v0, v0, Ljava/net/Inet6Address;

    if-eqz v0, :cond_3f

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tcp://["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 60
    :cond_3f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "tcp://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method protected updatePort(I)V
    .registers 4
    .param p1, "port"    # I

    .prologue
    .line 75
    new-instance v0, Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    iput-object v0, p0, Lzmq/TcpAddress;->address:Ljava/net/InetSocketAddress;

    .line 76
    return-void
.end method
