.class public Lzmq/TcpListener;
.super Lzmq/Own;
.source "TcpListener.java"

# interfaces
.implements Lzmq/IPollEvents;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static isWindows:Z


# instance fields
.field private final address:Lzmq/TcpAddress;

.field private endpoint:Ljava/lang/String;

.field private handle:Ljava/nio/channels/ServerSocketChannel;

.field private final ioObject:Lzmq/IOObject;

.field private socket:Lzmq/SocketBase;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 27
    const-class v1, Lzmq/TcpListener;

    invoke-virtual {v1}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v1

    if-nez v1, :cond_22

    move v1, v2

    :goto_b
    sput-boolean v1, Lzmq/TcpListener;->$assertionsDisabled:Z

    .line 32
    const-string v1, "os.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "os":Ljava/lang/String;
    const-string v1, "win"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_24

    :goto_1f
    sput-boolean v2, Lzmq/TcpListener;->isWindows:Z

    .line 34
    return-void

    .end local v0    # "os":Ljava/lang/String;
    :cond_22
    move v1, v3

    .line 27
    goto :goto_b

    .restart local v0    # "os":Ljava/lang/String;
    :cond_24
    move v2, v3

    .line 33
    goto :goto_1f
.end method

.method public constructor <init>(Lzmq/IOThread;Lzmq/SocketBase;Lzmq/Options;)V
    .registers 5
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "socket"    # Lzmq/SocketBase;
    .param p3, "options"    # Lzmq/Options;

    .prologue
    .line 52
    invoke-direct {p0, p1, p3}, Lzmq/Own;-><init>(Lzmq/IOThread;Lzmq/Options;)V

    .line 54
    new-instance v0, Lzmq/IOObject;

    invoke-direct {v0, p1}, Lzmq/IOObject;-><init>(Lzmq/IOThread;)V

    iput-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    .line 55
    new-instance v0, Lzmq/TcpAddress;

    invoke-direct {v0}, Lzmq/TcpAddress;-><init>()V

    iput-object v0, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    .line 57
    iput-object p2, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    .line 58
    return-void
.end method

.method private accept()Ljava/nio/channels/SocketChannel;
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 176
    const/4 v4, 0x0

    .line 178
    .local v4, "sock":Ljava/net/Socket;
    :try_start_2
    iget-object v6, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v6}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_b} :catch_3e

    move-result-object v4

    .line 184
    iget-object v6, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget-object v6, v6, Lzmq/Options;->tcpAcceptFilters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_40

    .line 185
    const/4 v3, 0x0

    .line 186
    .local v3, "matched":Z
    iget-object v6, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget-object v6, v6, Lzmq/Options;->tcpAcceptFilters:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_38

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/TcpAddress$TcpAddressMask;

    .line 187
    .local v0, "am":Lzmq/TcpAddress$TcpAddressMask;
    iget-object v6, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    invoke-virtual {v6}, Lzmq/TcpAddress;->address()Ljava/net/SocketAddress;

    move-result-object v6

    invoke-virtual {v0, v6}, Lzmq/TcpAddress$TcpAddressMask;->matchAddress(Ljava/net/SocketAddress;)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 188
    const/4 v3, 0x1

    .line 192
    .end local v0    # "am":Lzmq/TcpAddress$TcpAddressMask;
    :cond_38
    if-nez v3, :cond_40

    .line 194
    :try_start_3a
    invoke-virtual {v4}, Ljava/net/Socket;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_45

    .line 201
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "matched":Z
    :goto_3d
    return-object v5

    .line 180
    :catch_3e
    move-exception v1

    .line 181
    .local v1, "e":Ljava/io/IOException;
    goto :goto_3d

    .line 201
    .end local v1    # "e":Ljava/io/IOException;
    :cond_40
    invoke-virtual {v4}, Ljava/net/Socket;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v5

    goto :goto_3d

    .line 196
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "matched":Z
    :catch_45
    move-exception v6

    goto :goto_3d
.end method

.method private close()V
    .registers 5

    .prologue
    .line 126
    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    if-nez v1, :cond_5

    .line 138
    :goto_4
    return-void

    .line 131
    :cond_5
    :try_start_5
    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->close()V

    .line 132
    iget-object v1, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v2, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    iget-object v3, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1, v2, v3}, Lzmq/SocketBase;->eventClosed(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_13} :catch_17

    .line 137
    :goto_13
    const/4 v1, 0x0

    iput-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    goto :goto_4

    .line 134
    :catch_17
    move-exception v0

    .line 135
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v2, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    invoke-static {v0}, Lzmq/ZError;->exccode(Ljava/io/IOException;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lzmq/SocketBase;->eventCloseFailed(Ljava/lang/String;I)V

    goto :goto_13
.end method


# virtual methods
.method public acceptEvent()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 87
    const/4 v2, 0x0

    .line 90
    .local v2, "fd":Ljava/nio/channels/SocketChannel;
    :try_start_2
    invoke-direct {p0}, Lzmq/TcpListener;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v2

    .line 91
    invoke-static {v2}, Lzmq/Utils;->tuneTcpSocket(Ljava/nio/channels/SocketChannel;)V

    .line 92
    iget-object v5, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v5, v5, Lzmq/Options;->tcpKeepAlive:I

    iget-object v6, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v6, v6, Lzmq/Options;->tcpKeepAliveCnt:I

    iget-object v7, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v7, v7, Lzmq/Options;->tcpKeepAliveIdle:I

    iget-object v8, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v8, v8, Lzmq/Options;->tcpKeepAliveIntvl:I

    invoke-static {v2, v5, v6, v7, v8}, Lzmq/Utils;->tuneTcpKeepalives(Ljava/nio/channels/SocketChannel;IIII)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1c} :catch_54

    .line 102
    const/4 v1, 0x0

    .line 104
    .local v1, "engine":Lzmq/StreamEngine;
    :try_start_1d
    new-instance v1, Lzmq/StreamEngine;

    .end local v1    # "engine":Lzmq/StreamEngine;
    iget-object v5, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget-object v6, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    invoke-direct {v1, v2, v5, v6}, Lzmq/StreamEngine;-><init>(Ljava/nio/channels/SocketChannel;Lzmq/Options;Ljava/lang/String;)V
    :try_end_26
    .catch Lzmq/ZError$InstantiationException; {:try_start_1d .. :try_end_26} :catch_61

    .line 112
    .restart local v1    # "engine":Lzmq/StreamEngine;
    iget-object v5, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget-wide v5, v5, Lzmq/Options;->affinity:J

    invoke-virtual {p0, v5, v6}, Lzmq/TcpListener;->chooseIoThread(J)Lzmq/IOThread;

    move-result-object v3

    .line 115
    .local v3, "ioThread":Lzmq/IOThread;
    iget-object v5, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v6, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    new-instance v7, Lzmq/Address;

    invoke-virtual {v2}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v8

    invoke-direct {v7, v8}, Lzmq/Address;-><init>(Ljava/net/SocketAddress;)V

    invoke-static {v3, v9, v5, v6, v7}, Lzmq/SessionBase;->create(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)Lzmq/SessionBase;

    move-result-object v4

    .line 117
    .local v4, "session":Lzmq/SessionBase;
    invoke-virtual {v4}, Lzmq/SessionBase;->incSeqnum()V

    .line 118
    invoke-virtual {p0, v4}, Lzmq/TcpListener;->launchChild(Lzmq/Own;)V

    .line 119
    invoke-virtual {p0, v4, v1, v9}, Lzmq/TcpListener;->sendAttach(Lzmq/SessionBase;Lzmq/IEngine;Z)V

    .line 120
    iget-object v5, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v6, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    invoke-virtual {v5, v6, v2}, Lzmq/SocketBase;->eventAccepted(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V

    .line 121
    .end local v1    # "engine":Lzmq/StreamEngine;
    .end local v3    # "ioThread":Lzmq/IOThread;
    .end local v4    # "session":Lzmq/SessionBase;
    :goto_53
    return-void

    .line 94
    :catch_54
    move-exception v0

    .line 97
    .local v0, "e":Ljava/io/IOException;
    iget-object v5, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v6, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    invoke-static {v0}, Lzmq/ZError;->exccode(Ljava/io/IOException;)I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lzmq/SocketBase;->eventAcceptFailed(Ljava/lang/String;I)V

    goto :goto_53

    .line 106
    .end local v0    # "e":Ljava/io/IOException;
    :catch_61
    move-exception v0

    .line 107
    .local v0, "e":Lzmq/ZError$InstantiationException;
    iget-object v5, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v6, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    const/16 v7, 0x16

    invoke-virtual {v5, v6, v7}, Lzmq/SocketBase;->eventAcceptFailed(Ljava/lang/String;I)V

    goto :goto_53
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 219
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public destroy()V
    .registers 2

    .prologue
    .line 63
    sget-boolean v0, Lzmq/TcpListener;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 64
    :cond_e
    return-void
.end method

.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    invoke-virtual {v0}, Lzmq/TcpAddress;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public inEvent()V
    .registers 2

    .prologue
    .line 207
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public outEvent()V
    .registers 2

    .prologue
    .line 213
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processPlug()V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0, p0}, Lzmq/IOObject;->setHandler(Lzmq/IPollEvents;)V

    .line 71
    iget-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->addHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 72
    iget-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->setPollAccept(Ljava/nio/channels/SelectableChannel;)V

    .line 73
    return-void
.end method

.method protected processTerm(I)V
    .registers 4
    .param p1, "linger"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0, p0}, Lzmq/IOObject;->setHandler(Lzmq/IPollEvents;)V

    .line 79
    iget-object v0, p0, Lzmq/TcpListener;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 80
    invoke-direct {p0}, Lzmq/TcpListener;->close()V

    .line 81
    invoke-super {p0, p1}, Lzmq/Own;->processTerm(I)V

    .line 82
    return-void
.end method

.method public bridge synthetic registerTermAcks(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 27
    invoke-super {p0, p1}, Lzmq/Own;->registerTermAcks(I)V

    return-void
.end method

.method public setAddress(Ljava/lang/String;)I
    .registers 7
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 148
    iget-object v3, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    iget-object v4, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->ipv4only:I

    if-lez v4, :cond_63

    :goto_a
    invoke-virtual {v3, p1, v1}, Lzmq/TcpAddress;->resolve(Ljava/lang/String;Z)V

    .line 151
    :try_start_d
    invoke-static {}, Ljava/nio/channels/ServerSocketChannel;->open()Ljava/nio/channels/ServerSocketChannel;

    move-result-object v1

    iput-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    .line 152
    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/nio/channels/ServerSocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 153
    sget-boolean v1, Lzmq/TcpListener;->isWindows:Z

    if-nez v1, :cond_27

    .line 154
    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 156
    :cond_27
    iget-object v1, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v1

    iget-object v3, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    invoke-virtual {v3}, Lzmq/TcpAddress;->address()Ljava/net/SocketAddress;

    move-result-object v3

    iget-object v4, p0, Lzmq/TcpListener;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->backlog:I

    invoke-virtual {v1, v3, v4}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 157
    iget-object v1, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    invoke-virtual {v1}, Lzmq/TcpAddress;->getPort()I

    move-result v1

    if-nez v1, :cond_51

    .line 158
    iget-object v1, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    iget-object v3, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v3}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v3

    invoke-virtual {v1, v3}, Lzmq/TcpAddress;->updatePort(I)V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_51} :catch_65

    .line 165
    :cond_51
    iget-object v1, p0, Lzmq/TcpListener;->address:Lzmq/TcpAddress;

    invoke-virtual {v1}, Lzmq/TcpAddress;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    .line 166
    iget-object v1, p0, Lzmq/TcpListener;->socket:Lzmq/SocketBase;

    iget-object v3, p0, Lzmq/TcpListener;->endpoint:Ljava/lang/String;

    iget-object v4, p0, Lzmq/TcpListener;->handle:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v1, v3, v4}, Lzmq/SocketBase;->eventListening(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V

    .line 167
    :goto_62
    return v2

    :cond_63
    move v1, v2

    .line 148
    goto :goto_a

    .line 161
    :catch_65
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0}, Lzmq/TcpListener;->close()V

    .line 163
    const/16 v2, 0x30

    goto :goto_62
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 225
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic unregisterTermAck()V
    .registers 1

    .prologue
    .line 27
    invoke-super {p0}, Lzmq/Own;->unregisterTermAck()V

    return-void
.end method
