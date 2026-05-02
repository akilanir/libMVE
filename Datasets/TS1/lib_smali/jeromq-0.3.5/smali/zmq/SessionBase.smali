.class Lzmq/SessionBase;
.super Lzmq/Own;
.source "SessionBase.java"

# interfaces
.implements Lzmq/Pipe$IPipeEvents;
.implements Lzmq/IPollEvents;
.implements Lzmq/IMsgSink;
.implements Lzmq/IMsgSource;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LINGER_TIMER_ID:I = 0x20


# instance fields
.field private final addr:Lzmq/Address;

.field private connect:Z

.field private engine:Lzmq/IEngine;

.field private hasLingerTimer:Z

.field private identityReceived:Z

.field private identitySent:Z

.field private incompleteIn:Z

.field private ioObject:Lzmq/IOObject;

.field private ioThread:Lzmq/IOThread;

.field private pending:Z

.field private pipe:Lzmq/Pipe;

.field protected socket:Lzmq/SocketBase;

.field private final terminatingPipes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-class v0, Lzmq/SessionBase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V
    .registers 9
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "connect"    # Z
    .param p3, "socket"    # Lzmq/SocketBase;
    .param p4, "options"    # Lzmq/Options;
    .param p5, "addr"    # Lzmq/Address;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 130
    invoke-direct {p0, p1, p4}, Lzmq/Own;-><init>(Lzmq/IOThread;Lzmq/Options;)V

    .line 131
    new-instance v0, Lzmq/IOObject;

    invoke-direct {v0, p1}, Lzmq/IOObject;-><init>(Lzmq/IOThread;)V

    iput-object v0, p0, Lzmq/SessionBase;->ioObject:Lzmq/IOObject;

    .line 133
    iput-boolean p2, p0, Lzmq/SessionBase;->connect:Z

    .line 134
    iput-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    .line 135
    iput-boolean v1, p0, Lzmq/SessionBase;->incompleteIn:Z

    .line 136
    iput-boolean v1, p0, Lzmq/SessionBase;->pending:Z

    .line 137
    iput-object v2, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    .line 138
    iput-object p3, p0, Lzmq/SessionBase;->socket:Lzmq/SocketBase;

    .line 139
    iput-object p1, p0, Lzmq/SessionBase;->ioThread:Lzmq/IOThread;

    .line 140
    iput-boolean v1, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    .line 141
    iput-boolean v1, p0, Lzmq/SessionBase;->identitySent:Z

    .line 142
    iput-boolean v1, p0, Lzmq/SessionBase;->identityReceived:Z

    .line 143
    iput-object p5, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    .line 145
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    .line 146
    return-void
.end method

.method private cleanPipes()V
    .registers 3

    .prologue
    .line 239
    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v1, :cond_26

    .line 242
    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v1}, Lzmq/Pipe;->rollback()V

    .line 243
    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v1}, Lzmq/Pipe;->flush()V

    .line 246
    :cond_e
    iget-boolean v1, p0, Lzmq/SessionBase;->incompleteIn:Z

    if-eqz v1, :cond_26

    .line 247
    invoke-virtual {p0}, Lzmq/SessionBase;->pullMsg()Lzmq/Msg;

    move-result-object v0

    .line 248
    .local v0, "msg":Lzmq/Msg;
    if-nez v0, :cond_e

    .line 249
    sget-boolean v1, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lzmq/SessionBase;->incompleteIn:Z

    if-eqz v1, :cond_26

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 255
    .end local v0    # "msg":Lzmq/Msg;
    :cond_26
    return-void
.end method

.method public static create(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)Lzmq/SessionBase;
    .registers 11
    .param p0, "ioThread"    # Lzmq/IOThread;
    .param p1, "connect"    # Z
    .param p2, "socket"    # Lzmq/SocketBase;
    .param p3, "options"    # Lzmq/Options;
    .param p4, "addr"    # Lzmq/Address;

    .prologue
    .line 75
    const/4 v0, 0x0

    .line 76
    .local v0, "s":Lzmq/SessionBase;
    iget v1, p3, Lzmq/Options;->type:I

    packed-switch v1, :pswitch_data_9a

    .line 122
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p3, Lzmq/Options;->type:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :pswitch_21
    new-instance v0, Lzmq/Req$ReqSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Req$ReqSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 124
    .restart local v0    # "s":Lzmq/SessionBase;
    :goto_2b
    return-object v0

    .line 82
    :pswitch_2c
    new-instance v0, Lzmq/Dealer$DealerSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Dealer$DealerSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 84
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 86
    :pswitch_37
    new-instance v0, Lzmq/Rep$RepSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Rep$RepSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 88
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 90
    :pswitch_42
    new-instance v0, Lzmq/Router$RouterSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Router$RouterSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 92
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 94
    :pswitch_4d
    new-instance v0, Lzmq/Pub$PubSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Pub$PubSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 96
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 98
    :pswitch_58
    new-instance v0, Lzmq/XPub$XPubSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/XPub$XPubSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 100
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 102
    :pswitch_63
    new-instance v0, Lzmq/Sub$SubSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Sub$SubSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 104
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 106
    :pswitch_6e
    new-instance v0, Lzmq/XSub$XSubSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/XSub$XSubSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 108
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 110
    :pswitch_79
    new-instance v0, Lzmq/Push$PushSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Push$PushSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 112
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 114
    :pswitch_84
    new-instance v0, Lzmq/Pull$PullSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Pull$PullSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 116
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 118
    :pswitch_8f
    new-instance v0, Lzmq/Pair$PairSession;

    .end local v0    # "s":Lzmq/SessionBase;
    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lzmq/Pair$PairSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 120
    .restart local v0    # "s":Lzmq/SessionBase;
    goto :goto_2b

    .line 76
    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_8f
        :pswitch_4d
        :pswitch_63
        :pswitch_21
        :pswitch_37
        :pswitch_2c
        :pswitch_42
        :pswitch_84
        :pswitch_79
        :pswitch_58
        :pswitch_6e
    .end packed-switch
.end method

.method private detached()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 437
    iget-boolean v0, p0, Lzmq/SessionBase;->connect:Z

    if-nez v0, :cond_9

    .line 438
    invoke-virtual {p0}, Lzmq/SessionBase;->terminate()V

    .line 464
    :cond_8
    :goto_8
    return-void

    .line 444
    :cond_9
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_44

    iget-object v0, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->delayAttachOnConnect:I

    if-ne v0, v2, :cond_44

    iget-object v0, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    invoke-virtual {v0}, Lzmq/Address;->protocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "pgm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    iget-object v0, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    invoke-virtual {v0}, Lzmq/Address;->protocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "epgm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 446
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->hiccup()V

    .line 447
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lzmq/Pipe;->terminate(Z)V

    .line 448
    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 449
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    .line 452
    :cond_44
    invoke-virtual {p0}, Lzmq/SessionBase;->reset()V

    .line 455
    iget-object v0, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->reconnectIvl:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_51

    .line 456
    invoke-direct {p0, v2}, Lzmq/SessionBase;->startConnecting(Z)V

    .line 461
    :cond_51
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_64

    iget-object v0, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_8

    .line 462
    :cond_64
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->hiccup()V

    goto :goto_8
.end method

.method private startConnecting(Z)V
    .registers 8
    .param p1, "wait"    # Z

    .prologue
    .line 468
    sget-boolean v2, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v2, :cond_e

    iget-boolean v2, p0, Lzmq/SessionBase;->connect:Z

    if-nez v2, :cond_e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 472
    :cond_e
    iget-object v2, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-wide v2, v2, Lzmq/Options;->affinity:J

    invoke-virtual {p0, v2, v3}, Lzmq/SessionBase;->chooseIoThread(J)Lzmq/IOThread;

    move-result-object v1

    .line 473
    .local v1, "ioThread":Lzmq/IOThread;
    sget-boolean v2, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v2, :cond_22

    if-nez v1, :cond_22

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 477
    :cond_22
    iget-object v2, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    invoke-virtual {v2}, Lzmq/Address;->protocol()Ljava/lang/String;

    move-result-object v2

    const-string v3, "tcp"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 478
    new-instance v0, Lzmq/TcpConnecter;

    iget-object v3, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-object v4, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    move-object v2, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lzmq/TcpConnecter;-><init>(Lzmq/IOThread;Lzmq/SessionBase;Lzmq/Options;Lzmq/Address;Z)V

    .line 480
    .local v0, "connecter":Lzmq/TcpConnecter;
    invoke-virtual {p0, v0}, Lzmq/SessionBase;->launchChild(Lzmq/Own;)V

    .line 492
    .end local v0    # "connecter":Lzmq/TcpConnecter;
    :cond_3e
    :goto_3e
    return-void

    .line 484
    :cond_3f
    iget-object v2, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    invoke-virtual {v2}, Lzmq/Address;->protocol()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ipc"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 485
    new-instance v0, Lzmq/IpcConnecter;

    iget-object v3, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-object v4, p0, Lzmq/SessionBase;->addr:Lzmq/Address;

    move-object v2, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lzmq/IpcConnecter;-><init>(Lzmq/IOThread;Lzmq/SessionBase;Lzmq/Options;Lzmq/Address;Z)V

    .line 487
    .local v0, "connecter":Lzmq/IpcConnecter;
    invoke-virtual {p0, v0}, Lzmq/SessionBase;->launchChild(Lzmq/Own;)V

    goto :goto_3e

    .line 491
    .end local v0    # "connecter":Lzmq/IpcConnecter;
    :cond_5c
    sget-boolean v2, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v2, :cond_3e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 521
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public attachPipe(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 168
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-virtual {p0}, Lzmq/SessionBase;->isTerminating()Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 169
    :cond_10
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_1e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 170
    :cond_1e
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    if-nez p1, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 171
    :cond_2a
    iput-object p1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    .line 172
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0, p0}, Lzmq/Pipe;->setEventSink(Lzmq/Pipe$IPipeEvents;)V

    .line 173
    return-void
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 515
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public destroy()V
    .registers 3

    .prologue
    .line 151
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 154
    :cond_e
    iget-boolean v0, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    if-eqz v0, :cond_1c

    .line 155
    iget-object v0, p0, Lzmq/SessionBase;->ioObject:Lzmq/IOObject;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lzmq/IOObject;->cancelTimer(I)V

    .line 156
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    .line 160
    :cond_1c
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    if-eqz v0, :cond_25

    .line 161
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    invoke-interface {v0}, Lzmq/IEngine;->terminate()V

    .line 163
    :cond_25
    return-void
.end method

.method public detach()V
    .registers 2

    .prologue
    .line 372
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    .line 375
    invoke-direct {p0}, Lzmq/SessionBase;->cleanPipes()V

    .line 378
    invoke-direct {p0}, Lzmq/SessionBase;->detached()V

    .line 381
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_12

    .line 382
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkRead()Z

    .line 384
    :cond_12
    return-void
.end method

.method public flush()V
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_9

    .line 231
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->flush()V

    .line 233
    :cond_9
    return-void
.end method

.method public getSocket()Lzmq/SocketBase;
    .registers 2

    .prologue
    .line 327
    iget-object v0, p0, Lzmq/SessionBase;->socket:Lzmq/SocketBase;

    return-object v0
.end method

.method public hiccuped(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 321
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must Override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public inEvent()V
    .registers 2

    .prologue
    .line 503
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public outEvent()V
    .registers 2

    .prologue
    .line 509
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public pipeTerminated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    const/4 v2, 0x0

    .line 261
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_17

    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eq v0, p1, :cond_17

    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 263
    :cond_17
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-ne v0, p1, :cond_41

    .line 265
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    .line 266
    iget-boolean v0, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    if-eqz v0, :cond_2b

    .line 267
    iget-object v0, p0, Lzmq/SessionBase;->ioObject:Lzmq/IOObject;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lzmq/IOObject;->cancelTimer(I)V

    .line 268
    iput-boolean v2, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    .line 279
    :cond_2b
    :goto_2b
    iget-boolean v0, p0, Lzmq/SessionBase;->pending:Z

    if-eqz v0, :cond_40

    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-nez v0, :cond_40

    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 280
    iput-boolean v2, p0, Lzmq/SessionBase;->pending:Z

    .line 281
    invoke-super {p0, v2}, Lzmq/Own;->processTerm(I)V

    .line 283
    :cond_40
    return-void

    .line 273
    :cond_41
    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_2b
.end method

.method protected processAttach(Lzmq/IEngine;)V
    .registers 11
    .param p1, "engine"    # Lzmq/IEngine;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 342
    sget-boolean v4, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    if-nez p1, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 345
    :cond_10
    iget-object v4, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-nez v4, :cond_65

    invoke-virtual {p0}, Lzmq/SessionBase;->isTerminating()Z

    move-result v4

    if-nez v4, :cond_65

    .line 346
    new-array v2, v7, [Lzmq/ZObject;

    aput-object p0, v2, v5

    iget-object v4, p0, Lzmq/SessionBase;->socket:Lzmq/SocketBase;

    aput-object v4, v2, v6

    .line 347
    .local v2, "parents":[Lzmq/ZObject;
    new-array v3, v7, [Lzmq/Pipe;

    aput-object v8, v3, v5

    aput-object v8, v3, v6

    .line 348
    .local v3, "pipes":[Lzmq/Pipe;
    new-array v1, v7, [I

    iget-object v4, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->recvHwm:I

    aput v4, v1, v5

    iget-object v4, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->sendHwm:I

    aput v4, v1, v6

    .line 349
    .local v1, "hwms":[I
    new-array v0, v7, [Z

    iget-object v4, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-boolean v4, v4, Lzmq/Options;->delayOnClose:Z

    aput-boolean v4, v0, v5

    iget-object v4, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-boolean v4, v4, Lzmq/Options;->delayOnDisconnect:Z

    aput-boolean v4, v0, v6

    .line 350
    .local v0, "delays":[Z
    invoke-static {v2, v3, v1, v0}, Lzmq/Pipe;->pipepair([Lzmq/ZObject;[Lzmq/Pipe;[I[Z)V

    .line 353
    aget-object v4, v3, v5

    invoke-virtual {v4, p0}, Lzmq/Pipe;->setEventSink(Lzmq/Pipe$IPipeEvents;)V

    .line 356
    sget-boolean v4, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v4, :cond_5a

    iget-object v4, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v4, :cond_5a

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 357
    :cond_5a
    aget-object v4, v3, v5

    iput-object v4, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    .line 360
    iget-object v4, p0, Lzmq/SessionBase;->socket:Lzmq/SocketBase;

    aget-object v5, v3, v6

    invoke-virtual {p0, v4, v5}, Lzmq/SessionBase;->sendBind(Lzmq/Own;Lzmq/Pipe;)V

    .line 364
    .end local v0    # "delays":[Z
    .end local v1    # "hwms":[I
    .end local v2    # "parents":[Lzmq/ZObject;
    .end local v3    # "pipes":[Lzmq/Pipe;
    :cond_65
    sget-boolean v4, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v4, :cond_73

    iget-object v4, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    if-eqz v4, :cond_73

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 365
    :cond_73
    iput-object p1, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    .line 366
    iget-object v4, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    iget-object v5, p0, Lzmq/SessionBase;->ioThread:Lzmq/IOThread;

    invoke-interface {v4, v5, p0}, Lzmq/IEngine;->plug(Lzmq/IOThread;Lzmq/SessionBase;)V

    .line 367
    return-void
.end method

.method protected processPlug()V
    .registers 2

    .prologue
    .line 333
    iget-object v0, p0, Lzmq/SessionBase;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0, p0}, Lzmq/IOObject;->setHandler(Lzmq/IPollEvents;)V

    .line 334
    iget-boolean v0, p0, Lzmq/SessionBase;->connect:Z

    if-eqz v0, :cond_d

    .line 335
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lzmq/SessionBase;->startConnecting(Z)V

    .line 337
    :cond_d
    return-void
.end method

.method protected processTerm(I)V
    .registers 8
    .param p1, "linger"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 388
    sget-boolean v2, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    iget-boolean v2, p0, Lzmq/SessionBase;->pending:Z

    if-eqz v2, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 393
    :cond_10
    iget-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-nez v2, :cond_20

    iget-object v2, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 394
    invoke-super {p0, v1}, Lzmq/Own;->processTerm(I)V

    .line 419
    :cond_1f
    :goto_1f
    return-void

    .line 398
    :cond_20
    iput-boolean v0, p0, Lzmq/SessionBase;->pending:Z

    .line 403
    if-lez p1, :cond_3c

    .line 404
    sget-boolean v2, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v2, :cond_32

    iget-boolean v2, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    if-eqz v2, :cond_32

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 405
    :cond_32
    iget-object v2, p0, Lzmq/SessionBase;->ioObject:Lzmq/IOObject;

    int-to-long v3, p1

    const/16 v5, 0x20

    invoke-virtual {v2, v3, v4, v5}, Lzmq/IOObject;->addTimer(JI)V

    .line 406
    iput-boolean v0, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    .line 411
    :cond_3c
    iget-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v2, :cond_1f

    .line 412
    iget-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz p1, :cond_4d

    :goto_44
    invoke-virtual {v2, v0}, Lzmq/Pipe;->terminate(Z)V

    .line 417
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkRead()Z

    goto :goto_1f

    :cond_4d
    move v0, v1

    .line 412
    goto :goto_44
.end method

.method public pullMsg()Lzmq/Msg;
    .registers 5

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 178
    iget-boolean v2, p0, Lzmq/SessionBase;->identitySent:Z

    if-nez v2, :cond_20

    .line 179
    new-instance v0, Lzmq/Msg;

    iget-object v1, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-byte v1, v1, Lzmq/Options;->identitySize:B

    invoke-direct {v0, v1}, Lzmq/Msg;-><init>(I)V

    .line 180
    .local v0, "msg":Lzmq/Msg;
    iget-object v1, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-object v1, v1, Lzmq/Options;->identity:[B

    iget-object v2, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-byte v2, v2, Lzmq/Options;->identitySize:B

    invoke-virtual {v0, v1, v3, v2}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    .line 181
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/SessionBase;->identitySent:Z

    .line 182
    iput-boolean v3, p0, Lzmq/SessionBase;->incompleteIn:Z

    .line 197
    .end local v0    # "msg":Lzmq/Msg;
    :goto_1f
    return-object v0

    .line 187
    :cond_20
    iget-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-nez v2, :cond_26

    move-object v0, v1

    .line 188
    goto :goto_1f

    .line 191
    :cond_26
    iget-object v2, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v2}, Lzmq/Pipe;->read()Lzmq/Msg;

    move-result-object v0

    .line 192
    .restart local v0    # "msg":Lzmq/Msg;
    if-nez v0, :cond_30

    move-object v0, v1

    .line 193
    goto :goto_1f

    .line 195
    :cond_30
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    iput-boolean v1, p0, Lzmq/SessionBase;->incompleteIn:Z

    goto :goto_1f
.end method

.method public pushMsg(Lzmq/Msg;)I
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    const/4 v0, 0x0

    .line 205
    iget-boolean v1, p0, Lzmq/SessionBase;->identityReceived:Z

    if-nez v1, :cond_14

    .line 206
    const/16 v1, 0x40

    invoke-virtual {p1, v1}, Lzmq/Msg;->setFlags(I)V

    .line 207
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/SessionBase;->identityReceived:Z

    .line 209
    iget-object v1, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget-boolean v1, v1, Lzmq/Options;->recvIdentity:Z

    if-nez v1, :cond_14

    .line 218
    :cond_13
    :goto_13
    return v0

    .line 214
    :cond_14
    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eqz v1, :cond_20

    iget-object v1, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v1, p1}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 218
    :cond_20
    const/16 v0, 0x23

    goto :goto_13
.end method

.method public readActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 289
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eq v0, p1, :cond_16

    .line 290
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_1f

    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 294
    :cond_16
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    if-eqz v0, :cond_20

    .line 295
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    invoke-interface {v0}, Lzmq/IEngine;->activateOut()V

    .line 300
    :cond_1f
    :goto_1f
    return-void

    .line 298
    :cond_20
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkRead()Z

    goto :goto_1f
.end method

.method protected reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 224
    iput-boolean v0, p0, Lzmq/SessionBase;->identitySent:Z

    .line 225
    iput-boolean v0, p0, Lzmq/SessionBase;->identityReceived:Z

    .line 226
    return-void
.end method

.method public timerEvent(I)V
    .registers 4
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x0

    .line 426
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    const/16 v0, 0x20

    if-eq p1, v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 427
    :cond_f
    iput-boolean v1, p0, Lzmq/SessionBase;->hasLingerTimer:Z

    .line 430
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_1f

    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 431
    :cond_1f
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    invoke-virtual {v0, v1}, Lzmq/Pipe;->terminate(Z)V

    .line 432
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/SessionBase;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->socketId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 306
    iget-object v0, p0, Lzmq/SessionBase;->pipe:Lzmq/Pipe;

    if-eq v0, p1, :cond_16

    .line 307
    sget-boolean v0, Lzmq/SessionBase;->$assertionsDisabled:Z

    if-nez v0, :cond_1f

    iget-object v0, p0, Lzmq/SessionBase;->terminatingPipes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 311
    :cond_16
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    if-eqz v0, :cond_1f

    .line 312
    iget-object v0, p0, Lzmq/SessionBase;->engine:Lzmq/IEngine;

    invoke-interface {v0}, Lzmq/IEngine;->activateIn()V

    .line 314
    :cond_1f
    return-void
.end method
