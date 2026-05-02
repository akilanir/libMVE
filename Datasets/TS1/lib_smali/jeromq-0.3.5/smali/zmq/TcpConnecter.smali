.class public Lzmq/TcpConnecter;
.super Lzmq/Own;
.source "TcpConnecter.java"

# interfaces
.implements Lzmq/IPollEvents;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final RECONNECT_TIMER_ID:I = 0x1


# instance fields
.field private final addr:Lzmq/Address;

.field private address:Lzmq/Address;

.field private currentReconnectIvl:I

.field private delayedStart:Z

.field private handle:Ljava/nio/channels/SocketChannel;

.field private handleValid:Z

.field private final ioObject:Lzmq/IOObject;

.field private session:Lzmq/SessionBase;

.field private socket:Lzmq/SocketBase;

.field private timerStarted:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lzmq/TcpConnecter;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/IOThread;Lzmq/SessionBase;Lzmq/Options;Lzmq/Address;Z)V
    .registers 8
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "session"    # Lzmq/SessionBase;
    .param p3, "options"    # Lzmq/Options;
    .param p4, "addr"    # Lzmq/Address;
    .param p5, "delayedStart"    # Z

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0, p1, p3}, Lzmq/Own;-><init>(Lzmq/IOThread;Lzmq/Options;)V

    .line 71
    new-instance v0, Lzmq/IOObject;

    invoke-direct {v0, p1}, Lzmq/IOObject;-><init>(Lzmq/IOThread;)V

    iput-object v0, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    .line 72
    iput-object p4, p0, Lzmq/TcpConnecter;->addr:Lzmq/Address;

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    .line 74
    iput-boolean v1, p0, Lzmq/TcpConnecter;->handleValid:Z

    .line 75
    iput-boolean p5, p0, Lzmq/TcpConnecter;->delayedStart:Z

    .line 76
    iput-boolean v1, p0, Lzmq/TcpConnecter;->timerStarted:Z

    .line 77
    iput-object p2, p0, Lzmq/TcpConnecter;->session:Lzmq/SessionBase;

    .line 78
    iget-object v0, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->reconnectIvl:I

    iput v0, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    .line 80
    sget-boolean v0, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v0, :cond_2c

    iget-object v0, p0, Lzmq/TcpConnecter;->addr:Lzmq/Address;

    if-nez v0, :cond_2c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 81
    :cond_2c
    iget-object v0, p0, Lzmq/TcpConnecter;->addr:Lzmq/Address;

    iput-object v0, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    .line 82
    invoke-virtual {p2}, Lzmq/SessionBase;->getSocket()Lzmq/SocketBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    .line 83
    return-void
.end method

.method private addreconnectTimer()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 244
    invoke-direct {p0}, Lzmq/TcpConnecter;->getNewReconnectIvl()I

    move-result v0

    .line 245
    .local v0, "rcIvl":I
    iget-object v1, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3, v4}, Lzmq/IOObject;->addTimer(JI)V

    .line 250
    :try_start_b
    iget-object v1, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v1}, Lzmq/Address;->resolve()Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_10} :catch_1e

    .line 258
    :goto_10
    iget-object v1, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v2, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v2}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lzmq/SocketBase;->eventConnectRetried(Ljava/lang/String;I)V

    .line 259
    iput-boolean v4, p0, Lzmq/TcpConnecter;->timerStarted:Z

    .line 260
    return-void

    .line 252
    :catch_1e
    move-exception v1

    goto :goto_10
.end method

.method private close()V
    .registers 5

    .prologue
    .line 340
    sget-boolean v1, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v1, :cond_e

    iget-object v1, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    if-nez v1, :cond_e

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 342
    :cond_e
    :try_start_e
    iget-object v1, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->close()V

    .line 343
    iget-object v1, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v2, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v2}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2, v3}, Lzmq/SocketBase;->eventClosed(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_20} :catch_24

    .line 348
    :goto_20
    const/4 v1, 0x0

    iput-object v1, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    .line 349
    return-void

    .line 345
    :catch_24
    move-exception v0

    .line 346
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v2, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v2}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lzmq/ZError;->exccode(Ljava/io/IOException;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lzmq/SocketBase;->eventCloseFailed(Ljava/lang/String;I)V

    goto :goto_20
.end method

.method private connect()Ljava/nio/channels/SocketChannel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v2, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/SocketChannel;->finishConnect()Z

    move-result v0

    .line 331
    .local v0, "finished":Z
    sget-boolean v2, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v2, :cond_12

    if-nez v0, :cond_12

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 332
    :cond_12
    iget-object v1, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    .line 334
    .local v1, "ret":Ljava/nio/channels/SocketChannel;
    return-object v1
.end method

.method private getNewReconnectIvl()I
    .registers 5

    .prologue
    .line 268
    iget v1, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    invoke-static {}, Lzmq/Utils;->generateRandom()I

    move-result v2

    iget-object v3, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v3, v3, Lzmq/Options;->reconnectIvl:I

    rem-int/2addr v2, v3

    add-int v0, v1, v2

    .line 273
    .local v0, "thisInterval":I
    iget-object v1, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->reconnectIvlMax:I

    if-lez v1, :cond_31

    iget-object v1, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->reconnectIvlMax:I

    iget-object v2, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->reconnectIvl:I

    if-le v1, v2, :cond_31

    .line 276
    iget v1, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    .line 277
    iget v1, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    iget-object v2, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->reconnectIvlMax:I

    if-lt v1, v2, :cond_31

    .line 278
    iget-object v1, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->reconnectIvlMax:I

    iput v1, p0, Lzmq/TcpConnecter;->currentReconnectIvl:I

    .line 281
    :cond_31
    return v0
.end method

.method private open()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    sget-boolean v4, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v4, :cond_e

    iget-object v4, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    if-eqz v4, :cond_e

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 292
    :cond_e
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    move-result-object v4

    iput-object v4, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    .line 295
    iget-object v4, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-static {v4}, Lzmq/Utils;->unblockSocket(Ljava/nio/channels/SelectableChannel;)V

    .line 298
    iget-object v4, p0, Lzmq/TcpConnecter;->addr:Lzmq/Address;

    if-nez v4, :cond_25

    .line 299
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Null address"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 302
    :cond_25
    iget-object v4, p0, Lzmq/TcpConnecter;->addr:Lzmq/Address;

    invoke-virtual {v4}, Lzmq/Address;->resolved()Lzmq/Address$IZAddress;

    move-result-object v2

    .line 303
    .local v2, "resolved":Lzmq/Address$IZAddress;
    if-nez v2, :cond_35

    .line 304
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Address not resolved"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 307
    :cond_35
    invoke-interface {v2}, Lzmq/Address$IZAddress;->address()Ljava/net/SocketAddress;

    move-result-object v3

    .line 308
    .local v3, "sa":Ljava/net/SocketAddress;
    if-nez v3, :cond_43

    .line 309
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Socket address not resolved"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 312
    :cond_43
    const/4 v1, 0x0

    .line 314
    .local v1, "rc":Z
    :try_start_44
    iget-object v4, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4, v3}, Ljava/nio/channels/SocketChannel;->connect(Ljava/net/SocketAddress;)Z
    :try_end_49
    .catch Ljava/lang/IllegalArgumentException; {:try_start_44 .. :try_end_49} :catch_4b

    move-result v1

    .line 322
    return v1

    .line 316
    :catch_4b
    move-exception v0

    .line 319
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v4, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private startConnecting()V
    .registers 6

    .prologue
    .line 215
    :try_start_0
    invoke-direct {p0}, Lzmq/TcpConnecter;->open()Z

    move-result v1

    .line 218
    .local v1, "rc":Z
    if-eqz v1, :cond_16

    .line 219
    iget-object v2, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->addHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 220
    const/4 v2, 0x1

    iput-boolean v2, p0, Lzmq/TcpConnecter;->handleValid:Z

    .line 221
    iget-object v2, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    invoke-virtual {v2}, Lzmq/IOObject;->connectEvent()V

    .line 239
    .end local v1    # "rc":Z
    :goto_15
    return-void

    .line 226
    .restart local v1    # "rc":Z
    :cond_16
    iget-object v2, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->addHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 227
    const/4 v2, 0x1

    iput-boolean v2, p0, Lzmq/TcpConnecter;->handleValid:Z

    .line 228
    iget-object v2, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->setPollConnect(Ljava/nio/channels/SelectableChannel;)V

    .line 229
    iget-object v2, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v3, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v3}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v2, v3, v4}, Lzmq/SocketBase;->eventConnectDelayed(Ljava/lang/String;I)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_33} :catch_34

    goto :goto_15

    .line 232
    .end local v1    # "rc":Z
    :catch_34
    move-exception v0

    .line 234
    .local v0, "e":Ljava/io/IOException;
    iget-object v2, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    if-eqz v2, :cond_3c

    .line 235
    invoke-direct {p0}, Lzmq/TcpConnecter;->close()V

    .line 237
    :cond_3c
    invoke-direct {p0}, Lzmq/TcpConnecter;->addreconnectTimer()V

    goto :goto_15
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 139
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public connectEvent()V
    .registers 9

    .prologue
    .line 145
    const/4 v2, 0x0

    .line 146
    .local v2, "err":Z
    const/4 v3, 0x0

    .line 148
    .local v3, "fd":Ljava/nio/channels/SocketChannel;
    :try_start_2
    invoke-direct {p0}, Lzmq/TcpConnecter;->connect()Ljava/nio/channels/SocketChannel;
    :try_end_5
    .catch Ljava/net/ConnectException; {:try_start_2 .. :try_end_5} :catch_19
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_5} :catch_1c
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_5} :catch_1f
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_22

    move-result-object v3

    .line 163
    :goto_6
    iget-object v4, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    iget-object v5, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v4, v5}, Lzmq/IOObject;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 164
    const/4 v4, 0x0

    iput-boolean v4, p0, Lzmq/TcpConnecter;->handleValid:Z

    .line 166
    if-eqz v2, :cond_29

    .line 168
    invoke-direct {p0}, Lzmq/TcpConnecter;->close()V

    .line 169
    invoke-direct {p0}, Lzmq/TcpConnecter;->addreconnectTimer()V

    .line 200
    :goto_18
    return-void

    .line 150
    :catch_19
    move-exception v0

    .line 151
    .local v0, "e":Ljava/net/ConnectException;
    const/4 v2, 0x1

    .line 161
    goto :goto_6

    .line 153
    .end local v0    # "e":Ljava/net/ConnectException;
    :catch_1c
    move-exception v0

    .line 154
    .local v0, "e":Ljava/net/SocketException;
    const/4 v2, 0x1

    .line 161
    goto :goto_6

    .line 156
    .end local v0    # "e":Ljava/net/SocketException;
    :catch_1f
    move-exception v0

    .line 157
    .local v0, "e":Ljava/net/SocketTimeoutException;
    const/4 v2, 0x1

    .line 161
    goto :goto_6

    .line 159
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :catch_22
    move-exception v0

    .line 160
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lzmq/ZError$IOException;

    invoke-direct {v4, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v4

    .line 173
    .end local v0    # "e":Ljava/io/IOException;
    :cond_29
    const/4 v4, 0x0

    iput-object v4, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    .line 176
    :try_start_2c
    invoke-static {v3}, Lzmq/Utils;->tuneTcpSocket(Ljava/nio/channels/SocketChannel;)V

    .line 177
    iget-object v4, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->tcpKeepAlive:I

    iget-object v5, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v5, v5, Lzmq/Options;->tcpKeepAliveCnt:I

    iget-object v6, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v6, v6, Lzmq/Options;->tcpKeepAliveIdle:I

    iget-object v7, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget v7, v7, Lzmq/Options;->tcpKeepAliveIntvl:I

    invoke-static {v3, v4, v5, v6, v7}, Lzmq/Utils;->tuneTcpKeepalives(Ljava/nio/channels/SocketChannel;IIII)V
    :try_end_42
    .catch Ljava/net/SocketException; {:try_start_2c .. :try_end_42} :catch_64

    .line 184
    const/4 v1, 0x0

    .line 186
    .local v1, "engine":Lzmq/StreamEngine;
    :try_start_43
    new-instance v1, Lzmq/StreamEngine;

    .end local v1    # "engine":Lzmq/StreamEngine;
    iget-object v4, p0, Lzmq/TcpConnecter;->options:Lzmq/Options;

    iget-object v5, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v5}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v3, v4, v5}, Lzmq/StreamEngine;-><init>(Ljava/nio/channels/SocketChannel;Lzmq/Options;Ljava/lang/String;)V
    :try_end_50
    .catch Lzmq/ZError$InstantiationException; {:try_start_43 .. :try_end_50} :catch_6b

    .line 194
    .restart local v1    # "engine":Lzmq/StreamEngine;
    iget-object v4, p0, Lzmq/TcpConnecter;->session:Lzmq/SessionBase;

    invoke-virtual {p0, v4, v1}, Lzmq/TcpConnecter;->sendAttach(Lzmq/SessionBase;Lzmq/IEngine;)V

    .line 197
    invoke-virtual {p0}, Lzmq/TcpConnecter;->terminate()V

    .line 199
    iget-object v4, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v5, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v5}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lzmq/SocketBase;->eventConnected(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V

    goto :goto_18

    .line 179
    .end local v1    # "engine":Lzmq/StreamEngine;
    :catch_64
    move-exception v0

    .line 180
    .local v0, "e":Ljava/net/SocketException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 188
    .end local v0    # "e":Ljava/net/SocketException;
    :catch_6b
    move-exception v0

    .line 189
    .local v0, "e":Lzmq/ZError$InstantiationException;
    iget-object v4, p0, Lzmq/TcpConnecter;->socket:Lzmq/SocketBase;

    iget-object v5, p0, Lzmq/TcpConnecter;->address:Lzmq/Address;

    invoke-virtual {v5}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Lzmq/SocketBase;->eventConnectDelayed(Ljava/lang/String;I)V

    goto :goto_18
.end method

.method public destroy()V
    .registers 2

    .prologue
    .line 87
    sget-boolean v0, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lzmq/TcpConnecter;->timerStarted:Z

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 88
    :cond_e
    sget-boolean v0, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lzmq/TcpConnecter;->handleValid:Z

    if-eqz v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 89
    :cond_1c
    sget-boolean v0, Lzmq/TcpConnecter;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    iget-object v0, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 90
    :cond_2a
    return-void
.end method

.method public inEvent()V
    .registers 1

    .prologue
    .line 128
    return-void
.end method

.method public outEvent()V
    .registers 1

    .prologue
    .line 134
    return-void
.end method

.method protected processPlug()V
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0, p0}, Lzmq/IOObject;->setHandler(Lzmq/IPollEvents;)V

    .line 96
    iget-boolean v0, p0, Lzmq/TcpConnecter;->delayedStart:Z

    if-eqz v0, :cond_d

    .line 97
    invoke-direct {p0}, Lzmq/TcpConnecter;->addreconnectTimer()V

    .line 102
    :goto_c
    return-void

    .line 100
    :cond_d
    invoke-direct {p0}, Lzmq/TcpConnecter;->startConnecting()V

    goto :goto_c
.end method

.method public processTerm(I)V
    .registers 5
    .param p1, "linger"    # I

    .prologue
    const/4 v2, 0x0

    .line 107
    iget-boolean v0, p0, Lzmq/TcpConnecter;->timerStarted:Z

    if-eqz v0, :cond_d

    .line 108
    iget-object v0, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lzmq/IOObject;->cancelTimer(I)V

    .line 109
    iput-boolean v2, p0, Lzmq/TcpConnecter;->timerStarted:Z

    .line 112
    :cond_d
    iget-boolean v0, p0, Lzmq/TcpConnecter;->handleValid:Z

    if-eqz v0, :cond_1a

    .line 113
    iget-object v0, p0, Lzmq/TcpConnecter;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 114
    iput-boolean v2, p0, Lzmq/TcpConnecter;->handleValid:Z

    .line 117
    :cond_1a
    iget-object v0, p0, Lzmq/TcpConnecter;->handle:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_21

    .line 118
    invoke-direct {p0}, Lzmq/TcpConnecter;->close()V

    .line 121
    :cond_21
    invoke-super {p0, p1}, Lzmq/Own;->processTerm(I)V

    .line 122
    return-void
.end method

.method public bridge synthetic registerTermAcks(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 31
    invoke-super {p0, p1}, Lzmq/Own;->registerTermAcks(I)V

    return-void
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 205
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/TcpConnecter;->timerStarted:Z

    .line 206
    invoke-direct {p0}, Lzmq/TcpConnecter;->startConnecting()V

    .line 207
    return-void
.end method

.method public bridge synthetic unregisterTermAck()V
    .registers 1

    .prologue
    .line 31
    invoke-super {p0}, Lzmq/Own;->unregisterTermAck()V

    return-void
.end method
