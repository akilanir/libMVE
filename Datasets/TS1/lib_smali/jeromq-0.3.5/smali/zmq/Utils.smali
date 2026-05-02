.class Lzmq/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static random:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lzmq/Utils;->random:Ljava/security/SecureRandom;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static bytes(Ljava/nio/ByteBuffer;)[B
    .registers 3
    .param p0, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 135
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    new-array v0, v1, [B

    .line 136
    .local v0, "d":[B
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 137
    return-object v0
.end method

.method public static delete(Ljava/io/File;)Z
    .registers 10
    .param p0, "path"    # Ljava/io/File;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 152
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_9

    .line 164
    :goto_8
    return v7

    .line 155
    :cond_9
    const/4 v5, 0x1

    .line 156
    .local v5, "ret":Z
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 157
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 158
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_2b

    .line 159
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_19
    if-ge v3, v4, :cond_2b

    aget-object v1, v0, v3

    .line 160
    .local v1, "f":Ljava/io/File;
    if-eqz v5, :cond_29

    invoke-static {v1}, Lzmq/Utils;->delete(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_29

    move v5, v6

    .line 159
    :goto_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_29
    move v5, v7

    .line 160
    goto :goto_26

    .line 164
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_2b
    if-eqz v5, :cond_35

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v8

    if-eqz v8, :cond_35

    :goto_33
    move v7, v6

    goto :goto_8

    :cond_35
    move v6, v7

    goto :goto_33
.end method

.method public static generateRandom()I
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lzmq/Utils;->random:Ljava/security/SecureRandom;

    invoke-virtual {v0}, Ljava/security/SecureRandom;->nextInt()I

    move-result v0

    return v0
.end method

.method public static realloc([BI)[B
    .registers 5
    .param p0, "src"    # [B
    .param p1, "size"    # I

    .prologue
    const/4 v2, 0x0

    .line 142
    new-array v0, p1, [B

    .line 143
    .local v0, "dest":[B
    if-eqz p0, :cond_9

    .line 144
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 147
    :cond_9
    return-object v0
.end method

.method public static realloc(Ljava/lang/Class;[Ljava/lang/Object;IZ)[Ljava/lang/Object;
    .registers 8
    .param p2, "size"    # I
    .param p3, "ended"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[TT;IZ)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "src":[Ljava/lang/Object;, "[TT;"
    const/4 v3, 0x0

    .line 93
    array-length v1, p1

    if-le p2, v1, :cond_1c

    .line 94
    invoke-static {p0, p2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    .line 95
    .local v0, "dest":[Ljava/lang/Object;, "[TT;"
    if-eqz p3, :cond_14

    .line 96
    array-length v1, p1

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    :goto_13
    return-object v0

    .line 99
    :cond_14
    array-length v1, p1

    sub-int v1, p2, v1

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_13

    .line 102
    .end local v0    # "dest":[Ljava/lang/Object;, "[TT;"
    :cond_1c
    array-length v1, p1

    if-ge p2, v1, :cond_34

    .line 103
    invoke-static {p0, p2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    .line 104
    .restart local v0    # "dest":[Ljava/lang/Object;, "[TT;"
    if-eqz p3, :cond_30

    .line 105
    array-length v1, p1

    sub-int/2addr v1, p2

    invoke-static {p1, v1, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_13

    .line 108
    :cond_30
    invoke-static {p1, v3, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_13

    .line 112
    .end local v0    # "dest":[Ljava/lang/Object;, "[TT;"
    :cond_34
    move-object v0, p1

    .restart local v0    # "dest":[Ljava/lang/Object;, "[TT;"
    goto :goto_13
.end method

.method public static swap(Ljava/util/List;II)V
    .registers 5
    .param p1, "index1"    # I
    .param p2, "index2"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;II)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-ne p1, p2, :cond_3

    .line 131
    :cond_2
    :goto_2
    return-void

    .line 123
    :cond_3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 124
    .local v0, "item1":Ljava/lang/Object;, "TT;"
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 125
    .local v1, "item2":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_10

    .line 126
    invoke-interface {p0, p2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 128
    :cond_10
    if-eqz v1, :cond_2

    .line 129
    invoke-interface {p0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_2
.end method

.method public static tuneTcpKeepalives(Ljava/net/Socket;IIII)V
    .registers 6
    .param p0, "fd"    # Ljava/net/Socket;
    .param p1, "tcpKeepalive"    # I
    .param p2, "tcpKeepaliveCnt"    # I
    .param p3, "tcpKeepaliveIdle"    # I
    .param p4, "tcpKeepaliveIntvl"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 75
    if-ne p1, v0, :cond_7

    .line 76
    invoke-virtual {p0, v0}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 81
    :cond_6
    :goto_6
    return-void

    .line 78
    :cond_7
    if-nez p1, :cond_6

    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/Socket;->setKeepAlive(Z)V

    goto :goto_6
.end method

.method public static tuneTcpKeepalives(Ljava/nio/channels/SocketChannel;IIII)V
    .registers 6
    .param p0, "ch"    # Ljava/nio/channels/SocketChannel;
    .param p1, "tcpKeepalive"    # I
    .param p2, "tcpKeepaliveCnt"    # I
    .param p3, "tcpKeepaliveIdle"    # I
    .param p4, "tcpKeepaliveIntvl"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-static {v0, p1, p2, p3, p4}, Lzmq/Utils;->tuneTcpKeepalives(Ljava/net/Socket;IIII)V

    .line 69
    return-void
.end method

.method public static tuneTcpSocket(Ljava/net/Socket;)V
    .registers 2
    .param p0, "fd"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 57
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0, v0}, Ljava/net/Socket;->setTcpNoDelay(Z)V
    :try_end_4
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_4} :catch_5

    .line 61
    :goto_4
    return-void

    .line 59
    :catch_5
    move-exception v0

    goto :goto_4
.end method

.method public static tuneTcpSocket(Ljava/nio/channels/SocketChannel;)V
    .registers 2
    .param p0, "ch"    # Ljava/nio/channels/SocketChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-static {v0}, Lzmq/Utils;->tuneTcpSocket(Ljava/net/Socket;)V

    .line 49
    return-void
.end method

.method public static unblockSocket(Ljava/nio/channels/SelectableChannel;)V
    .registers 2
    .param p0, "s"    # Ljava/nio/channels/SelectableChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 86
    return-void
.end method
