.class public abstract Lzmq/SocketBase;
.super Lzmq/Own;
.source "SocketBase.java"

# interfaces
.implements Lzmq/IPollEvents;
.implements Lzmq/Pipe$IPipeEvents;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private ctxTerminated:Z

.field private destroyed:Z

.field private final endpoints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lzmq/Own;",
            ">;"
        }
    .end annotation
.end field

.field protected errno:Lzmq/ValueReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/ValueReference",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private handle:Ljava/nio/channels/SelectableChannel;

.field private final inprocs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field

.field private lastTsc:J

.field private final mailbox:Lzmq/Mailbox;

.field private monitorEvents:I

.field private monitorSocket:Lzmq/SocketBase;

.field private final pipes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field

.field private poller:Lzmq/Poller;

.field private rcvmore:Z

.field private tag:I

.field private ticks:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-class v0, Lzmq/SocketBase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/SocketBase;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Lzmq/Ctx;II)V
    .registers 8
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    const/4 v1, 0x0

    .line 81
    invoke-direct {p0, p1, p2}, Lzmq/Own;-><init>(Lzmq/Ctx;I)V

    .line 82
    const v0, -0x45221351

    iput v0, p0, Lzmq/SocketBase;->tag:I

    .line 83
    iput-boolean v1, p0, Lzmq/SocketBase;->ctxTerminated:Z

    .line 84
    iput-boolean v1, p0, Lzmq/SocketBase;->destroyed:Z

    .line 85
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lzmq/SocketBase;->lastTsc:J

    .line 86
    iput v1, p0, Lzmq/SocketBase;->ticks:I

    .line 87
    iput-boolean v1, p0, Lzmq/SocketBase;->rcvmore:Z

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    .line 89
    iput v1, p0, Lzmq/SocketBase;->monitorEvents:I

    .line 91
    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iput p3, v0, Lzmq/Options;->socketId:I

    .line 92
    iget-object v2, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    const/16 v0, 0x46

    invoke-virtual {p1, v0}, Lzmq/Ctx;->get(I)I

    move-result v0

    if-eqz v0, :cond_66

    const/4 v0, -0x1

    :goto_29
    iput v0, v2, Lzmq/Options;->linger:I

    .line 94
    new-instance v0, Lzmq/MultiMap;

    invoke-direct {v0}, Lzmq/MultiMap;-><init>()V

    iput-object v0, p0, Lzmq/SocketBase;->endpoints:Ljava/util/Map;

    .line 95
    new-instance v0, Lzmq/MultiMap;

    invoke-direct {v0}, Lzmq/MultiMap;-><init>()V

    iput-object v0, p0, Lzmq/SocketBase;->inprocs:Ljava/util/Map;

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    .line 98
    new-instance v0, Lzmq/Mailbox;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "socket-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lzmq/Mailbox;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    .line 100
    new-instance v0, Lzmq/ValueReference;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lzmq/ValueReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    .line 101
    return-void

    :cond_66
    move v0, v1

    .line 92
    goto :goto_29
.end method

.method private addEndpoint(Ljava/lang/String;Lzmq/Own;)V
    .registers 4
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "endpoint"    # Lzmq/Own;

    .prologue
    .line 550
    invoke-virtual {p0, p2}, Lzmq/SocketBase;->launchChild(Lzmq/Own;)V

    .line 551
    iget-object v0, p0, Lzmq/SocketBase;->endpoints:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    return-void
.end method

.method private attachPipe(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 215
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lzmq/SocketBase;->attachPipe(Lzmq/Pipe;Z)V

    .line 216
    return-void
.end method

.method private attachPipe(Lzmq/Pipe;Z)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 222
    invoke-virtual {p1, p0}, Lzmq/Pipe;->setEventSink(Lzmq/Pipe$IPipeEvents;)V

    .line 223
    iget-object v0, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    invoke-virtual {p0, p1, p2}, Lzmq/SocketBase;->xattachPipe(Lzmq/Pipe;Z)V

    .line 230
    invoke-virtual {p0}, Lzmq/SocketBase;->isTerminating()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 231
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->registerTermAcks(I)V

    .line 232
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lzmq/Pipe;->terminate(Z)V

    .line 234
    :cond_19
    return-void
.end method

.method private checkDestroy()V
    .registers 3

    .prologue
    .line 1005
    iget-boolean v0, p0, Lzmq/SocketBase;->destroyed:Z

    if-eqz v0, :cond_14

    .line 1007
    iget-object v0, p0, Lzmq/SocketBase;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/SocketBase;->handle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 1009
    invoke-virtual {p0, p0}, Lzmq/SocketBase;->destroySocket(Lzmq/SocketBase;)V

    .line 1012
    invoke-virtual {p0}, Lzmq/SocketBase;->sendReaped()V

    .line 1015
    invoke-super {p0}, Lzmq/Own;->processDestroy()V

    .line 1017
    :cond_14
    return-void
.end method

.method private checkProtocol(Ljava/lang/String;)V
    .registers 5
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 195
    const-string v0, "inproc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "ipc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "tcp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 197
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 203
    :cond_1e
    const-string v0, "pgm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    const-string v0, "epgm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    :cond_2e
    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6d

    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_6d

    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_6d

    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_6d

    .line 206
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 210
    :cond_6d
    return-void
.end method

.method public static create(ILzmq/Ctx;II)Lzmq/SocketBase;
    .registers 8
    .param p0, "type"    # I
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    .line 117
    const/4 v0, 0x0

    .line 118
    .local v0, "s":Lzmq/SocketBase;
    packed-switch p0, :pswitch_data_60

    .line 156
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :pswitch_1d
    new-instance v0, Lzmq/Pair;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Pair;-><init>(Lzmq/Ctx;II)V

    .line 158
    .restart local v0    # "s":Lzmq/SocketBase;
    :goto_22
    return-object v0

    .line 123
    :pswitch_23
    new-instance v0, Lzmq/Pub;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Pub;-><init>(Lzmq/Ctx;II)V

    .line 124
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 126
    :pswitch_29
    new-instance v0, Lzmq/Sub;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Sub;-><init>(Lzmq/Ctx;II)V

    .line 127
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 129
    :pswitch_2f
    new-instance v0, Lzmq/Req;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Req;-><init>(Lzmq/Ctx;II)V

    .line 130
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 132
    :pswitch_35
    new-instance v0, Lzmq/Rep;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Rep;-><init>(Lzmq/Ctx;II)V

    .line 133
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 135
    :pswitch_3b
    new-instance v0, Lzmq/Dealer;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Dealer;-><init>(Lzmq/Ctx;II)V

    .line 136
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 138
    :pswitch_41
    new-instance v0, Lzmq/Router;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Router;-><init>(Lzmq/Ctx;II)V

    .line 139
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 141
    :pswitch_47
    new-instance v0, Lzmq/Pull;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Pull;-><init>(Lzmq/Ctx;II)V

    .line 142
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 144
    :pswitch_4d
    new-instance v0, Lzmq/Push;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/Push;-><init>(Lzmq/Ctx;II)V

    .line 145
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 148
    :pswitch_53
    new-instance v0, Lzmq/XPub;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/XPub;-><init>(Lzmq/Ctx;II)V

    .line 149
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 152
    :pswitch_59
    new-instance v0, Lzmq/XSub;

    .end local v0    # "s":Lzmq/SocketBase;
    invoke-direct {v0, p1, p2, p3}, Lzmq/XSub;-><init>(Lzmq/Ctx;II)V

    .line 153
    .restart local v0    # "s":Lzmq/SocketBase;
    goto :goto_22

    .line 118
    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_23
        :pswitch_29
        :pswitch_2f
        :pswitch_35
        :pswitch_3b
        :pswitch_41
        :pswitch_47
        :pswitch_4d
        :pswitch_53
        :pswitch_59
    .end packed-switch
.end method

.method private extractFlags(Lzmq/Msg;)V
    .registers 3
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 1071
    invoke-virtual {p1}, Lzmq/Msg;->flags()I

    move-result v0

    and-int/lit8 v0, v0, 0x40

    if-lez v0, :cond_18

    .line 1072
    sget-boolean v0, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget-boolean v0, v0, Lzmq/Options;->recvIdentity:Z

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1076
    :cond_18
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    iput-boolean v0, p0, Lzmq/SocketBase;->rcvmore:Z

    .line 1077
    return-void
.end method

.method private processCommands(IZ)Z
    .registers 13
    .param p1, "timeout"    # I
    .param p2, "throttle"    # Z

    .prologue
    const/4 v3, 0x1

    const-wide/16 v8, 0x0

    .line 826
    if-eqz p1, :cond_20

    .line 828
    iget-object v4, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    int-to-long v5, p1

    invoke-virtual {v4, v5, v6}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    .line 859
    .local v0, "cmd":Lzmq/Command;
    :goto_c
    if-nez v0, :cond_46

    .line 866
    iget-boolean v4, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v4, :cond_1f

    .line 867
    iget-object v3, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    const v4, 0x9523dfd

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 868
    const/4 v3, 0x0

    .line 871
    .end local v0    # "cmd":Lzmq/Command;
    :cond_1f
    return v3

    .line 835
    :cond_20
    const-wide/16 v1, 0x0

    .line 843
    .local v1, "tsc":J
    cmp-long v4, v1, v8

    if-eqz v4, :cond_3f

    if-eqz p2, :cond_3f

    .line 847
    iget-wide v4, p0, Lzmq/SocketBase;->lastTsc:J

    cmp-long v4, v1, v4

    if-ltz v4, :cond_3d

    iget-wide v4, p0, Lzmq/SocketBase;->lastTsc:J

    sub-long v4, v1, v4

    sget-object v6, Lzmq/Config;->MAX_COMMAND_DELAY:Lzmq/Config;

    invoke-virtual {v6}, Lzmq/Config;->getValue()I

    move-result v6

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_1f

    .line 850
    :cond_3d
    iput-wide v1, p0, Lzmq/SocketBase;->lastTsc:J

    .line 854
    :cond_3f
    iget-object v4, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v4, v8, v9}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    .restart local v0    # "cmd":Lzmq/Command;
    goto :goto_c

    .line 863
    .end local v1    # "tsc":J
    :cond_46
    invoke-virtual {v0}, Lzmq/Command;->destination()Lzmq/ZObject;

    move-result-object v4

    invoke-virtual {v4, v0}, Lzmq/ZObject;->processCommand(Lzmq/Command;)V

    .line 864
    iget-object v4, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v4, v8, v9}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    goto :goto_c
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 991
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bind(Ljava/lang/String;)Z
    .registers 16
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 317
    iget-boolean v12, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v12, :cond_c

    .line 318
    new-instance v10, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v10}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v10

    .line 322
    :cond_c
    invoke-direct {p0, v10, v10}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v1

    .line 323
    .local v1, "brc":Z
    if-nez v1, :cond_14

    move v8, v10

    .line 400
    :goto_13
    return v8

    .line 330
    :cond_14
    :try_start_14
    new-instance v9, Ljava/net/URI;

    invoke-direct {v9, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/net/URISyntaxException; {:try_start_14 .. :try_end_19} :catch_45

    .line 335
    .local v9, "uri":Ljava/net/URI;
    invoke-virtual {v9}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v7

    .line 336
    .local v7, "protocol":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 337
    .local v0, "address":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 338
    .local v6, "path":Ljava/lang/String;
    if-nez v0, :cond_28

    .line 339
    move-object v0, v6

    .line 342
    :cond_28
    invoke-direct {p0, v7}, Lzmq/SocketBase;->checkProtocol(Ljava/lang/String;)V

    .line 344
    const-string v12, "inproc"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_58

    .line 345
    new-instance v3, Lzmq/Ctx$Endpoint;

    iget-object v10, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-direct {v3, p0, v10}, Lzmq/Ctx$Endpoint;-><init>(Lzmq/SocketBase;Lzmq/Options;)V

    .line 346
    .local v3, "endpoint":Lzmq/Ctx$Endpoint;
    invoke-virtual {p0, p1, v3}, Lzmq/SocketBase;->registerEndpoint(Ljava/lang/String;Lzmq/Ctx$Endpoint;)Z

    move-result v8

    .line 347
    .local v8, "rc":Z
    if-eqz v8, :cond_4c

    .line 349
    iget-object v10, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iput-object p1, v10, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    goto :goto_13

    .line 332
    .end local v0    # "address":Ljava/lang/String;
    .end local v3    # "endpoint":Lzmq/Ctx$Endpoint;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "protocol":Ljava/lang/String;
    .end local v8    # "rc":Z
    .end local v9    # "uri":Ljava/net/URI;
    :catch_45
    move-exception v2

    .line 333
    .local v2, "e":Ljava/net/URISyntaxException;
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 352
    .end local v2    # "e":Ljava/net/URISyntaxException;
    .restart local v0    # "address":Ljava/lang/String;
    .restart local v3    # "endpoint":Lzmq/Ctx$Endpoint;
    .restart local v6    # "path":Ljava/lang/String;
    .restart local v7    # "protocol":Ljava/lang/String;
    .restart local v8    # "rc":Z
    .restart local v9    # "uri":Ljava/net/URI;
    :cond_4c
    iget-object v10, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    const/16 v11, 0x30

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    goto :goto_13

    .line 356
    .end local v3    # "endpoint":Lzmq/Ctx$Endpoint;
    .end local v8    # "rc":Z
    :cond_58
    const-string v12, "pgm"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_68

    const-string v12, "epgm"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6d

    .line 359
    :cond_68
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->connect(Ljava/lang/String;)Z

    move-result v8

    goto :goto_13

    .line 364
    :cond_6d
    iget-object v12, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget-wide v12, v12, Lzmq/Options;->affinity:J

    invoke-virtual {p0, v12, v13}, Lzmq/SocketBase;->chooseIoThread(J)Lzmq/IOThread;

    move-result-object v4

    .line 365
    .local v4, "ioThread":Lzmq/IOThread;
    if-nez v4, :cond_7f

    .line 366
    new-instance v10, Ljava/lang/IllegalStateException;

    const-string v11, "EMTHREAD"

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 369
    :cond_7f
    const-string v12, "tcp"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b8

    .line 370
    new-instance v5, Lzmq/TcpListener;

    iget-object v12, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-direct {v5, v4, p0, v12}, Lzmq/TcpListener;-><init>(Lzmq/IOThread;Lzmq/SocketBase;Lzmq/Options;)V

    .line 371
    .local v5, "listener":Lzmq/TcpListener;
    invoke-virtual {v5, v0}, Lzmq/TcpListener;->setAddress(Ljava/lang/String;)I

    move-result v8

    .line 372
    .local v8, "rc":I
    if-eqz v8, :cond_a6

    .line 373
    invoke-virtual {v5}, Lzmq/TcpListener;->destroy()V

    .line 374
    invoke-virtual {p0, v0, v8}, Lzmq/SocketBase;->eventBindFailed(Ljava/lang/String;I)V

    .line 375
    iget-object v11, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v8, v10

    .line 376
    goto/16 :goto_13

    .line 380
    :cond_a6
    iget-object v10, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-virtual {v5}, Lzmq/TcpListener;->getAddress()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    .line 382
    iget-object v10, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget-object v10, v10, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    invoke-direct {p0, v10, v5}, Lzmq/SocketBase;->addEndpoint(Ljava/lang/String;Lzmq/Own;)V

    move v8, v11

    .line 383
    goto/16 :goto_13

    .line 386
    .end local v5    # "listener":Lzmq/TcpListener;
    .end local v8    # "rc":I
    :cond_b8
    const-string v12, "ipc"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_ed

    .line 387
    new-instance v5, Lzmq/IpcListener;

    iget-object v12, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-direct {v5, v4, p0, v12}, Lzmq/IpcListener;-><init>(Lzmq/IOThread;Lzmq/SocketBase;Lzmq/Options;)V

    .line 388
    .local v5, "listener":Lzmq/IpcListener;
    invoke-virtual {v5, v0}, Lzmq/IpcListener;->setAddress(Ljava/lang/String;)I

    move-result v8

    .line 389
    .restart local v8    # "rc":I
    if-eqz v8, :cond_df

    .line 390
    invoke-virtual {v5}, Lzmq/IpcListener;->destroy()V

    .line 391
    invoke-virtual {p0, v0, v8}, Lzmq/SocketBase;->eventBindFailed(Ljava/lang/String;I)V

    .line 392
    iget-object v11, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v8, v10

    .line 393
    goto/16 :goto_13

    .line 397
    :cond_df
    iget-object v10, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-virtual {v5}, Lzmq/IpcListener;->getAddress()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v10, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    .line 399
    invoke-direct {p0, p1, v5}, Lzmq/SocketBase;->addEndpoint(Ljava/lang/String;Lzmq/Own;)V

    move v8, v11

    .line 400
    goto/16 :goto_13

    .line 403
    .end local v5    # "listener":Lzmq/IpcListener;
    .end local v8    # "rc":I
    :cond_ed
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-direct {v10, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10
.end method

.method public checkTag()Z
    .registers 3

    .prologue
    .line 111
    iget v0, p0, Lzmq/SocketBase;->tag:I

    const v1, -0x45221351

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public close()V
    .registers 2

    .prologue
    .line 783
    const v0, -0x21524111

    iput v0, p0, Lzmq/SocketBase;->tag:I

    .line 788
    invoke-virtual {p0, p0}, Lzmq/SocketBase;->sendReap(Lzmq/SocketBase;)V

    .line 789
    return-void
.end method

.method public connect(Ljava/lang/String;)Z
    .registers 29
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 408
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lzmq/SocketBase;->ctxTerminated:Z

    move/from16 v24, v0

    if-eqz v24, :cond_e

    .line 409
    new-instance v24, Lzmq/ZError$CtxTerminatedException;

    invoke-direct/range {v24 .. v24}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v24

    .line 413
    :cond_e
    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    .line 414
    .local v5, "brc":Z
    if-nez v5, :cond_21

    .line 415
    const/16 v24, 0x0

    .line 543
    :goto_20
    return v24

    .line 421
    :cond_21
    :try_start_21
    new-instance v22, Ljava/net/URI;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_2a
    .catch Ljava/net/URISyntaxException; {:try_start_21 .. :try_end_2a} :catch_5b

    .line 427
    .local v22, "uri":Ljava/net/URI;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v18

    .line 428
    .local v18, "protocol":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v4

    .line 429
    .local v4, "address":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v15

    .line 430
    .local v15, "path":Ljava/lang/String;
    if-nez v4, :cond_39

    .line 431
    move-object v4, v15

    .line 434
    :cond_39
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lzmq/SocketBase;->checkProtocol(Ljava/lang/String;)V

    .line 436
    const-string v24, "inproc"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_24a

    .line 442
    invoke-virtual/range {p0 .. p1}, Lzmq/SocketBase;->findEndpoint(Ljava/lang/String;)Lzmq/Ctx$Endpoint;

    move-result-object v16

    .line 443
    .local v16, "peer":Lzmq/Ctx$Endpoint;
    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    move-object/from16 v24, v0

    if-nez v24, :cond_64

    .line 444
    const/16 v24, 0x0

    goto :goto_20

    .line 423
    .end local v4    # "address":Ljava/lang/String;
    .end local v15    # "path":Ljava/lang/String;
    .end local v16    # "peer":Lzmq/Ctx$Endpoint;
    .end local v18    # "protocol":Ljava/lang/String;
    .end local v22    # "uri":Ljava/net/URI;
    :catch_5b
    move-exception v7

    .line 424
    .local v7, "e":Ljava/net/URISyntaxException;
    new-instance v24, Ljava/lang/IllegalArgumentException;

    move-object/from16 v0, v24

    invoke-direct {v0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v24

    .line 448
    .end local v7    # "e":Ljava/net/URISyntaxException;
    .restart local v4    # "address":Ljava/lang/String;
    .restart local v15    # "path":Ljava/lang/String;
    .restart local v16    # "peer":Lzmq/Ctx$Endpoint;
    .restart local v18    # "protocol":Ljava/lang/String;
    .restart local v22    # "uri":Ljava/net/URI;
    :cond_64
    const/16 v21, 0x0

    .line 449
    .local v21, "sndhwm":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->sendHwm:I

    move/from16 v24, v0

    if-eqz v24, :cond_9c

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->recvHwm:I

    move/from16 v24, v0

    if-eqz v24, :cond_9c

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->sendHwm:I

    move/from16 v24, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lzmq/Options;->recvHwm:I

    move/from16 v25, v0

    add-int v21, v24, v25

    .line 452
    :cond_9c
    const/16 v19, 0x0

    .line 453
    .local v19, "rcvhwm":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->recvHwm:I

    move/from16 v24, v0

    if-eqz v24, :cond_d4

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->sendHwm:I

    move/from16 v24, v0

    if-eqz v24, :cond_d4

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->recvHwm:I

    move/from16 v24, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lzmq/Options;->sendHwm:I

    move/from16 v25, v0

    add-int v19, v24, v25

    .line 458
    :cond_d4
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v14, v0, [Lzmq/ZObject;

    const/16 v24, 0x0

    aput-object p0, v14, v24

    const/16 v24, 0x1

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    move-object/from16 v25, v0

    aput-object v25, v14, v24

    .line 459
    .local v14, "parents":[Lzmq/ZObject;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Lzmq/Pipe;

    move-object/from16 v17, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    aput-object v25, v17, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput-object v25, v17, v24

    .line 460
    .local v17, "pipes":[Lzmq/Pipe;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v8, v0, [I

    const/16 v24, 0x0

    aput v21, v8, v24

    const/16 v24, 0x1

    aput v19, v8, v24

    .line 461
    .local v8, "hwms":[I
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v6, v0, [Z

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-boolean v0, v0, Lzmq/Options;->delayOnDisconnect:Z

    move/from16 v25, v0

    aput-boolean v25, v6, v24

    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-boolean v0, v0, Lzmq/Options;->delayOnClose:Z

    move/from16 v25, v0

    aput-boolean v25, v6, v24

    .line 462
    .local v6, "delays":[Z
    move-object/from16 v0, v17

    invoke-static {v14, v0, v8, v6}, Lzmq/Pipe;->pipepair([Lzmq/ZObject;[Lzmq/Pipe;[I[Z)V

    .line 465
    const/16 v24, 0x0

    aget-object v24, v17, v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lzmq/SocketBase;->attachPipe(Lzmq/Pipe;)V

    .line 468
    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-boolean v0, v0, Lzmq/Options;->recvIdentity:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1a8

    .line 469
    new-instance v10, Lzmq/Msg;

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-byte v0, v0, Lzmq/Options;->identitySize:B

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-direct {v10, v0}, Lzmq/Msg;-><init>(I)V

    .line 470
    .local v10, "id":Lzmq/Msg;
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lzmq/Options;->identity:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-byte v0, v0, Lzmq/Options;->identitySize:B

    move/from16 v26, v0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v10, v0, v1, v2}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    .line 471
    const/16 v24, 0x40

    move/from16 v0, v24

    invoke-virtual {v10, v0}, Lzmq/Msg;->setFlags(I)V

    .line 472
    const/16 v24, 0x0

    aget-object v24, v17, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v23

    .line 473
    .local v23, "written":Z
    sget-boolean v24, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v24, :cond_1a1

    if-nez v23, :cond_1a1

    new-instance v24, Ljava/lang/AssertionError;

    invoke-direct/range {v24 .. v24}, Ljava/lang/AssertionError;-><init>()V

    throw v24

    .line 474
    :cond_1a1
    const/16 v24, 0x0

    aget-object v24, v17, v24

    invoke-virtual/range {v24 .. v24}, Lzmq/Pipe;->flush()V

    .line 478
    .end local v10    # "id":Lzmq/Msg;
    .end local v23    # "written":Z
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-boolean v0, v0, Lzmq/Options;->recvIdentity:Z

    move/from16 v24, v0

    if-eqz v24, :cond_210

    .line 479
    new-instance v10, Lzmq/Msg;

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-byte v0, v0, Lzmq/Options;->identitySize:B

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-direct {v10, v0}, Lzmq/Msg;-><init>(I)V

    .line 480
    .restart local v10    # "id":Lzmq/Msg;
    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lzmq/Options;->identity:[B

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget-byte v0, v0, Lzmq/Options;->identitySize:B

    move/from16 v26, v0

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v10, v0, v1, v2}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    .line 481
    const/16 v24, 0x40

    move/from16 v0, v24

    invoke-virtual {v10, v0}, Lzmq/Msg;->setFlags(I)V

    .line 482
    const/16 v24, 0x1

    aget-object v24, v17, v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v23

    .line 483
    .restart local v23    # "written":Z
    sget-boolean v24, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v24, :cond_209

    if-nez v23, :cond_209

    new-instance v24, Ljava/lang/AssertionError;

    invoke-direct/range {v24 .. v24}, Ljava/lang/AssertionError;-><init>()V

    throw v24

    .line 484
    :cond_209
    const/16 v24, 0x1

    aget-object v24, v17, v24

    invoke-virtual/range {v24 .. v24}, Lzmq/Pipe;->flush()V

    .line 490
    .end local v10    # "id":Lzmq/Msg;
    .end local v23    # "written":Z
    :cond_210
    move-object/from16 v0, v16

    iget-object v0, v0, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    aget-object v25, v17, v25

    const/16 v26, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lzmq/SocketBase;->sendBind(Lzmq/Own;Lzmq/Pipe;Z)V

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    iput-object v0, v1, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    .line 496
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->inprocs:Ljava/util/Map;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aget-object v25, v17, v25

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    const/16 v24, 0x1

    goto/16 :goto_20

    .line 502
    .end local v6    # "delays":[Z
    .end local v8    # "hwms":[I
    .end local v14    # "parents":[Lzmq/ZObject;
    .end local v16    # "peer":Lzmq/Ctx$Endpoint;
    .end local v17    # "pipes":[Lzmq/Pipe;
    .end local v19    # "rcvhwm":I
    .end local v21    # "sndhwm":I
    :cond_24a
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-wide v0, v0, Lzmq/Options;->affinity:J

    move-wide/from16 v24, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Lzmq/SocketBase;->chooseIoThread(J)Lzmq/IOThread;

    move-result-object v11

    .line 503
    .local v11, "ioThread":Lzmq/IOThread;
    if-nez v11, :cond_268

    .line 504
    new-instance v24, Ljava/lang/IllegalStateException;

    const-string v25, "Empty IO Thread"

    invoke-direct/range {v24 .. v25}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 506
    :cond_268
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->ipv4only:I

    move/from16 v24, v0

    if-eqz v24, :cond_29f

    const/4 v12, 0x1

    .line 507
    .local v12, "ipv4only":Z
    :goto_277
    new-instance v13, Lzmq/Address;

    move-object/from16 v0, v18

    invoke-direct {v13, v0, v4, v12}, Lzmq/Address;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 510
    .local v13, "paddr":Lzmq/Address;
    invoke-virtual {v13}, Lzmq/Address;->resolve()Z

    .line 513
    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move/from16 v0, v24

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-static {v11, v0, v1, v2, v13}, Lzmq/SessionBase;->create(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)Lzmq/SessionBase;

    move-result-object v20

    .line 515
    .local v20, "session":Lzmq/SessionBase;
    sget-boolean v24, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v24, :cond_2a1

    if-nez v20, :cond_2a1

    new-instance v24, Ljava/lang/AssertionError;

    invoke-direct/range {v24 .. v24}, Ljava/lang/AssertionError;-><init>()V

    throw v24

    .line 506
    .end local v12    # "ipv4only":Z
    .end local v13    # "paddr":Lzmq/Address;
    .end local v20    # "session":Lzmq/SessionBase;
    :cond_29f
    const/4 v12, 0x0

    goto :goto_277

    .line 519
    .restart local v12    # "ipv4only":Z
    .restart local v13    # "paddr":Lzmq/Address;
    .restart local v20    # "session":Lzmq/SessionBase;
    :cond_2a1
    const/4 v9, 0x0

    .line 520
    .local v9, "icanhasall":Z
    const-string v24, "pgm"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_2ba

    const-string v24, "epgm"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_2bb

    .line 521
    :cond_2ba
    const/4 v9, 0x1

    .line 524
    :cond_2bb
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lzmq/Options;->delayAttachOnConnect:I

    move/from16 v24, v0

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_2d1

    if-eqz v9, :cond_35a

    .line 526
    :cond_2d1
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v14, v0, [Lzmq/ZObject;

    const/16 v24, 0x0

    aput-object p0, v14, v24

    const/16 v24, 0x1

    aput-object v20, v14, v24

    .line 527
    .restart local v14    # "parents":[Lzmq/ZObject;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Lzmq/Pipe;

    move-object/from16 v17, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    aput-object v25, v17, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput-object v25, v17, v24

    .line 528
    .restart local v17    # "pipes":[Lzmq/Pipe;
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v8, v0, [I

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lzmq/Options;->sendHwm:I

    move/from16 v25, v0

    aput v25, v8, v24

    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lzmq/Options;->recvHwm:I

    move/from16 v25, v0

    aput v25, v8, v24

    .line 529
    .restart local v8    # "hwms":[I
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v6, v0, [Z

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-boolean v0, v0, Lzmq/Options;->delayOnDisconnect:Z

    move/from16 v25, v0

    aput-boolean v25, v6, v24

    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget-boolean v0, v0, Lzmq/Options;->delayOnClose:Z

    move/from16 v25, v0

    aput-boolean v25, v6, v24

    .line 530
    .restart local v6    # "delays":[Z
    move-object/from16 v0, v17

    invoke-static {v14, v0, v8, v6}, Lzmq/Pipe;->pipepair([Lzmq/ZObject;[Lzmq/Pipe;[I[Z)V

    .line 533
    const/16 v24, 0x0

    aget-object v24, v17, v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v9}, Lzmq/SocketBase;->attachPipe(Lzmq/Pipe;Z)V

    .line 536
    const/16 v24, 0x1

    aget-object v24, v17, v24

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lzmq/SessionBase;->attachPipe(Lzmq/Pipe;)V

    .line 540
    .end local v6    # "delays":[Z
    .end local v8    # "hwms":[I
    .end local v14    # "parents":[Lzmq/ZObject;
    .end local v17    # "pipes":[Lzmq/Pipe;
    :cond_35a
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/SocketBase;->options:Lzmq/Options;

    move-object/from16 v24, v0

    invoke-virtual {v13}, Lzmq/Address;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    iput-object v0, v1, Lzmq/Options;->lastEndpoint:Ljava/lang/String;

    .line 542
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lzmq/SocketBase;->addEndpoint(Ljava/lang/String;Lzmq/Own;)V

    .line 543
    const/16 v24, 0x1

    goto/16 :goto_20
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 985
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public destroy()V
    .registers 2

    .prologue
    .line 164
    :try_start_0
    iget-object v0, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_17

    .line 169
    :goto_5
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    .line 170
    sget-boolean v0, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    iget-boolean v0, p0, Lzmq/SocketBase;->destroyed:Z

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 171
    :cond_16
    return-void

    .line 166
    :catch_17
    move-exception v0

    goto :goto_5
.end method

.method public errno()I
    .registers 2

    .prologue
    .line 1291
    iget-object v0, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v0}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public eventAcceptFailed(Ljava/lang/String;I)V
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "errno"    # I

    .prologue
    .line 1197
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_7

    .line 1202
    :goto_6
    return-void

    .line 1201
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x40

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventAccepted(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ch"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1188
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x20

    if-nez v0, :cond_7

    .line 1193
    :goto_6
    return-void

    .line 1192
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x20

    invoke-direct {v0, v1, p1, p2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventBindFailed(Ljava/lang/String;I)V
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "errno"    # I

    .prologue
    .line 1179
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_7

    .line 1184
    :goto_6
    return-void

    .line 1183
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x10

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventCloseFailed(Ljava/lang/String;I)V
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "errno"    # I

    .prologue
    .line 1215
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit16 v0, v0, 0x100

    if-nez v0, :cond_7

    .line 1220
    :goto_6
    return-void

    .line 1219
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x100

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventClosed(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ch"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1206
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit16 v0, v0, 0x80

    if-nez v0, :cond_7

    .line 1211
    :goto_6
    return-void

    .line 1210
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x80

    invoke-direct {v0, v1, p1, p2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventConnectDelayed(Ljava/lang/String;I)V
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "errno"    # I

    .prologue
    .line 1152
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_7

    .line 1157
    :goto_6
    return-void

    .line 1156
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/4 v1, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventConnectRetried(Ljava/lang/String;I)V
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "interval"    # I

    .prologue
    .line 1161
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_7

    .line 1166
    :goto_6
    return-void

    .line 1165
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/4 v1, 0x4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventConnected(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ch"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1143
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_7

    .line 1148
    :goto_6
    return-void

    .line 1147
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1, p2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventDisconnected(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ch"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1224
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit16 v0, v0, 0x200

    if-nez v0, :cond_7

    .line 1229
    :goto_6
    return-void

    .line 1228
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x200

    invoke-direct {v0, v1, p1, p2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public eventListening(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "ch"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1170
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_7

    .line 1175
    :goto_6
    return-void

    .line 1174
    :cond_7
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x8

    invoke-direct {v0, v1, p1, p2}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    goto :goto_6
.end method

.method public getFD()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 1260
    iget-object v0, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    return-object v0
.end method

.method public getMailbox()Lzmq/Mailbox;
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    return-object v0
.end method

.method public getSocketOpt(I)I
    .registers 7
    .param p1, "option"    # I

    .prologue
    const/16 v4, 0xf

    const/4 v2, 0x0

    .line 254
    if-eq p1, v4, :cond_f

    iget-boolean v3, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v3, :cond_f

    .line 255
    new-instance v2, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v2}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v2

    .line 259
    :cond_f
    const/16 v3, 0xd

    if-ne p1, v3, :cond_19

    .line 260
    iget-boolean v3, p0, Lzmq/SocketBase;->rcvmore:Z

    if-eqz v3, :cond_18

    const/4 v2, 0x1

    .line 278
    :cond_18
    :goto_18
    return v2

    .line 262
    :cond_19
    if-ne p1, v4, :cond_53

    .line 263
    invoke-direct {p0, v2, v2}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v0

    .line 264
    .local v0, "rc":Z
    if-nez v0, :cond_34

    iget-object v2, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v2}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x9523dfd

    if-ne v2, v3, :cond_34

    .line 265
    const/4 v2, -0x1

    goto :goto_18

    .line 267
    :cond_34
    sget-boolean v2, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v2, :cond_40

    if-nez v0, :cond_40

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 268
    :cond_40
    const/4 v1, 0x0

    .line 269
    .local v1, "val":I
    invoke-virtual {p0}, Lzmq/SocketBase;->hasOut()Z

    move-result v2

    if-eqz v2, :cond_49

    .line 270
    or-int/lit8 v1, v1, 0x2

    .line 272
    :cond_49
    invoke-virtual {p0}, Lzmq/SocketBase;->hasIn()Z

    move-result v2

    if-eqz v2, :cond_51

    .line 273
    or-int/lit8 v1, v1, 0x1

    :cond_51
    move v2, v1

    .line 275
    goto :goto_18

    .line 278
    .end local v0    # "rc":Z
    .end local v1    # "val":I
    :cond_53
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->getsockoptx(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_18
.end method

.method public getsockoptx(I)Ljava/lang/Object;
    .registers 6
    .param p1, "option"    # I

    .prologue
    const/4 v2, 0x0

    .line 283
    iget-boolean v3, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v3, :cond_b

    .line 284
    new-instance v2, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v2}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v2

    .line 287
    :cond_b
    const/16 v3, 0xd

    if-ne p1, v3, :cond_19

    .line 288
    iget-boolean v3, p0, Lzmq/SocketBase;->rcvmore:Z

    if-eqz v3, :cond_14

    const/4 v2, 0x1

    :cond_14
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 312
    :goto_18
    return-object v2

    .line 291
    :cond_19
    const/16 v3, 0xe

    if-ne p1, v3, :cond_24

    .line 292
    iget-object v2, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v2}, Lzmq/Mailbox;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    goto :goto_18

    .line 295
    :cond_24
    const/16 v3, 0xf

    if-ne p1, v3, :cond_67

    .line 296
    invoke-direct {p0, v2, v2}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v0

    .line 297
    .local v0, "rc":Z
    if-nez v0, :cond_45

    iget-object v2, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v2}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const v3, 0x9523dfd

    if-ne v2, v3, :cond_45

    .line 298
    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_18

    .line 300
    :cond_45
    sget-boolean v2, Lzmq/SocketBase;->$assertionsDisabled:Z

    if-nez v2, :cond_51

    if-nez v0, :cond_51

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 301
    :cond_51
    const/4 v1, 0x0

    .line 302
    .local v1, "val":I
    invoke-virtual {p0}, Lzmq/SocketBase;->hasOut()Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 303
    or-int/lit8 v1, v1, 0x2

    .line 305
    :cond_5a
    invoke-virtual {p0}, Lzmq/SocketBase;->hasIn()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 306
    or-int/lit8 v1, v1, 0x1

    .line 308
    :cond_62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_18

    .line 312
    .end local v0    # "rc":Z
    .end local v1    # "val":I
    :cond_67
    iget-object v2, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-virtual {v2, p1}, Lzmq/Options;->getsockopt(I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_18
.end method

.method hasIn()Z
    .registers 2

    .prologue
    .line 795
    invoke-virtual {p0}, Lzmq/SocketBase;->xhasIn()Z

    move-result v0

    return v0
.end method

.method hasOut()Z
    .registers 2

    .prologue
    .line 800
    invoke-virtual {p0}, Lzmq/SocketBase;->xhasOut()Z

    move-result v0

    return v0
.end method

.method public hiccuped(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 1034
    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->delayAttachOnConnect:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_c

    .line 1035
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lzmq/Pipe;->terminate(Z)V

    .line 1041
    :goto_b
    return-void

    .line 1039
    :cond_c
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xhiccuped(Lzmq/Pipe;)V

    goto :goto_b
.end method

.method public inEvent()V
    .registers 3

    .prologue
    .line 968
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    invoke-direct {p0, v0, v1}, Lzmq/SocketBase;->processCommands(IZ)Z
    :try_end_5
    .catch Lzmq/ZError$CtxTerminatedException; {:try_start_2 .. :try_end_5} :catch_9

    .line 973
    :goto_5
    invoke-direct {p0}, Lzmq/SocketBase;->checkDestroy()V

    .line 974
    return-void

    .line 970
    :catch_9
    move-exception v0

    goto :goto_5
.end method

.method public monitor(Ljava/lang/String;I)Z
    .registers 13
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "events"    # I

    .prologue
    const/4 v5, 0x0

    .line 1082
    iget-boolean v7, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v7, :cond_b

    .line 1083
    new-instance v7, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v7}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v7

    .line 1087
    :cond_b
    if-nez p1, :cond_12

    .line 1088
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    .line 1089
    const/4 v5, 0x1

    .line 1138
    :cond_11
    :goto_11
    return v5

    .line 1095
    :cond_12
    :try_start_12
    new-instance v6, Ljava/net/URI;

    invoke-direct {v6, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/net/URISyntaxException; {:try_start_12 .. :try_end_17} :catch_3c

    .line 1100
    .local v6, "uri":Ljava/net/URI;
    invoke-virtual {v6}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    .line 1101
    .local v4, "protocol":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 1102
    .local v0, "address":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 1103
    .local v3, "path":Ljava/lang/String;
    if-nez v0, :cond_26

    .line 1104
    move-object v0, v3

    .line 1107
    :cond_26
    invoke-direct {p0, v4}, Lzmq/SocketBase;->checkProtocol(Ljava/lang/String;)V

    .line 1110
    const-string v7, "inproc"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_43

    .line 1111
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    .line 1112
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "inproc socket required"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1097
    .end local v0    # "address":Ljava/lang/String;
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "protocol":Ljava/lang/String;
    .end local v6    # "uri":Ljava/net/URI;
    :catch_3c
    move-exception v1

    .line 1098
    .local v1, "e":Ljava/net/URISyntaxException;
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-direct {v7, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 1116
    .end local v1    # "e":Ljava/net/URISyntaxException;
    .restart local v0    # "address":Ljava/lang/String;
    .restart local v3    # "path":Ljava/lang/String;
    .restart local v4    # "protocol":Ljava/lang/String;
    .restart local v6    # "uri":Ljava/net/URI;
    :cond_43
    iput p2, p0, Lzmq/SocketBase;->monitorEvents:I

    .line 1118
    invoke-virtual {p0}, Lzmq/SocketBase;->getCtx()Lzmq/Ctx;

    move-result-object v7

    invoke-virtual {v7, v5}, Lzmq/Ctx;->createSocket(I)Lzmq/SocketBase;

    move-result-object v7

    iput-object v7, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    .line 1119
    iget-object v7, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    if-eqz v7, :cond_11

    .line 1124
    const/4 v2, 0x0

    .line 1126
    .local v2, "linger":I
    :try_start_54
    iget-object v7, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    const/16 v8, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lzmq/SocketBase;->setSocketOpt(ILjava/lang/Object;)V
    :try_end_5f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_54 .. :try_end_5f} :catch_6b

    .line 1134
    iget-object v7, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    invoke-virtual {v7, p1}, Lzmq/SocketBase;->bind(Ljava/lang/String;)Z

    move-result v5

    .line 1135
    .local v5, "rc":Z
    if-nez v5, :cond_11

    .line 1136
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    goto :goto_11

    .line 1128
    .end local v5    # "rc":Z
    :catch_6b
    move-exception v1

    .line 1129
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    .line 1130
    throw v1
.end method

.method protected monitorEvent(Lzmq/ZMQ$Event;)V
    .registers 3
    .param p1, "event"    # Lzmq/ZMQ$Event;

    .prologue
    .line 1233
    iget-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    if-nez v0, :cond_5

    .line 1238
    :goto_4
    return-void

    .line 1237
    :cond_5
    iget-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    invoke-virtual {p1, v0}, Lzmq/ZMQ$Event;->write(Lzmq/SocketBase;)Z

    goto :goto_4
.end method

.method public outEvent()V
    .registers 2

    .prologue
    .line 979
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public pipeTerminated(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 1047
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xpipeTerminated(Lzmq/Pipe;)V

    .line 1050
    iget-object v1, p0, Lzmq/SocketBase;->inprocs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1051
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Pipe;>;>;"
    :cond_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1052
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_d

    .line 1053
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 1060
    :cond_22
    iget-object v1, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1061
    invoke-virtual {p0}, Lzmq/SocketBase;->isTerminating()Z

    move-result v1

    if-eqz v1, :cond_30

    .line 1062
    invoke-virtual {p0}, Lzmq/SocketBase;->unregisterTermAck()V

    .line 1064
    :cond_30
    return-void
.end method

.method protected processBind(Lzmq/Pipe;)V
    .registers 2
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 889
    invoke-direct {p0, p1}, Lzmq/SocketBase;->attachPipe(Lzmq/Pipe;)V

    .line 890
    return-void
.end method

.method protected processDestroy()V
    .registers 2

    .prologue
    .line 914
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/SocketBase;->destroyed:Z

    .line 915
    return-void
.end method

.method protected processStop()V
    .registers 2

    .prologue
    .line 881
    invoke-virtual {p0}, Lzmq/SocketBase;->stopMonitor()V

    .line 882
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/SocketBase;->ctxTerminated:Z

    .line 884
    return-void
.end method

.method protected processTerm(I)V
    .registers 5
    .param p1, "linger"    # I

    .prologue
    .line 898
    invoke-virtual {p0, p0}, Lzmq/SocketBase;->unregisterEndpoints(Lzmq/SocketBase;)V

    .line 901
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget-object v1, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_1b

    .line 902
    iget-object v1, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/Pipe;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lzmq/Pipe;->terminate(Z)V

    .line 901
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 904
    :cond_1b
    iget-object v1, p0, Lzmq/SocketBase;->pipes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, v1}, Lzmq/SocketBase;->registerTermAcks(I)V

    .line 907
    invoke-super {p0, p1}, Lzmq/Own;->processTerm(I)V

    .line 908
    return-void
.end method

.method public readActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 1022
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xreadActivated(Lzmq/Pipe;)V

    .line 1023
    return-void
.end method

.method public recv(I)Lzmq/Msg;
    .registers 15
    .param p1, "flags"    # I

    .prologue
    const/16 v12, 0x23

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 692
    iget-boolean v5, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v5, :cond_16

    .line 693
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    const v6, 0x9523dfd

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move-object v3, v7

    .line 776
    :goto_15
    return-object v3

    .line 705
    :cond_16
    iget v5, p0, Lzmq/SocketBase;->ticks:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/SocketBase;->ticks:I

    sget-object v8, Lzmq/Config;->INBOUND_POLL_RATE:Lzmq/Config;

    invoke-virtual {v8}, Lzmq/Config;->getValue()I

    move-result v8

    if-ne v5, v8, :cond_2e

    .line 706
    invoke-direct {p0, v6, v6}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    if-nez v5, :cond_2c

    move-object v3, v7

    .line 707
    goto :goto_15

    .line 709
    :cond_2c
    iput v6, p0, Lzmq/SocketBase;->ticks:I

    .line 713
    :cond_2e
    invoke-virtual {p0}, Lzmq/SocketBase;->xrecv()Lzmq/Msg;

    move-result-object v3

    .line 714
    .local v3, "msg":Lzmq/Msg;
    if-nez v3, :cond_44

    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v5}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, v12, :cond_44

    move-object v3, v7

    .line 715
    goto :goto_15

    .line 719
    :cond_44
    if-eqz v3, :cond_4a

    .line 720
    invoke-direct {p0, v3}, Lzmq/SocketBase;->extractFlags(Lzmq/Msg;)V

    goto :goto_15

    .line 728
    :cond_4a
    and-int/lit8 v5, p1, 0x1

    if-gtz v5, :cond_54

    iget-object v5, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v5, v5, Lzmq/Options;->recvTimeout:I

    if-nez v5, :cond_6a

    .line 729
    :cond_54
    invoke-direct {p0, v6, v6}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    if-nez v5, :cond_5c

    move-object v3, v7

    .line 730
    goto :goto_15

    .line 732
    :cond_5c
    iput v6, p0, Lzmq/SocketBase;->ticks:I

    .line 734
    invoke-virtual {p0}, Lzmq/SocketBase;->xrecv()Lzmq/Msg;

    move-result-object v3

    .line 735
    if-nez v3, :cond_66

    move-object v3, v7

    .line 736
    goto :goto_15

    .line 738
    :cond_66
    invoke-direct {p0, v3}, Lzmq/SocketBase;->extractFlags(Lzmq/Msg;)V

    goto :goto_15

    .line 744
    :cond_6a
    iget-object v5, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v4, v5, Lzmq/Options;->recvTimeout:I

    .line 745
    .local v4, "timeout":I
    if-gez v4, :cond_82

    const-wide/16 v1, 0x0

    .line 749
    .local v1, "end":J
    :goto_72
    iget v5, p0, Lzmq/SocketBase;->ticks:I

    if-eqz v5, :cond_8a

    const/4 v0, 0x1

    .line 751
    .local v0, "block":Z
    :cond_77
    :goto_77
    if-eqz v0, :cond_8c

    move v5, v4

    :goto_7a
    invoke-direct {p0, v5, v6}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    if-nez v5, :cond_8e

    move-object v3, v7

    .line 752
    goto :goto_15

    .line 745
    .end local v0    # "block":Z
    .end local v1    # "end":J
    :cond_82
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v8

    int-to-long v10, v4

    add-long v1, v8, v10

    goto :goto_72

    .restart local v1    # "end":J
    :cond_8a
    move v0, v6

    .line 749
    goto :goto_77

    .restart local v0    # "block":Z
    :cond_8c
    move v5, v6

    .line 751
    goto :goto_7a

    .line 754
    :cond_8e
    invoke-virtual {p0}, Lzmq/SocketBase;->xrecv()Lzmq/Msg;

    move-result-object v3

    .line 756
    if-eqz v3, :cond_9b

    .line 757
    iput v6, p0, Lzmq/SocketBase;->ticks:I

    .line 775
    invoke-direct {p0, v3}, Lzmq/SocketBase;->extractFlags(Lzmq/Msg;)V

    goto/16 :goto_15

    .line 761
    :cond_9b
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v5}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, v12, :cond_ac

    move-object v3, v7

    .line 762
    goto/16 :goto_15

    .line 765
    :cond_ac
    const/4 v0, 0x1

    .line 766
    if-lez v4, :cond_77

    .line 767
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v8

    sub-long v8, v1, v8

    long-to-int v4, v8

    .line 768
    if-gtz v4, :cond_77

    .line 769
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move-object v3, v7

    .line 770
    goto/16 :goto_15
.end method

.method public bridge synthetic registerTermAcks(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 32
    invoke-super {p0, p1}, Lzmq/Own;->registerTermAcks(I)V

    return-void
.end method

.method public send(Lzmq/Msg;I)Z
    .registers 16
    .param p1, "msg"    # Lzmq/Msg;
    .param p2, "flags"    # I

    .prologue
    const/16 v12, 0x23

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 616
    iget-boolean v5, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v5, :cond_16

    .line 617
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    const v7, 0x9523dfd

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v5, v6

    .line 687
    :goto_15
    return v5

    .line 622
    :cond_16
    if-nez p1, :cond_1e

    .line 623
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    .line 627
    :cond_1e
    invoke-direct {p0, v6, v7}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v0

    .line 628
    .local v0, "brc":Z
    if-nez v0, :cond_26

    move v5, v6

    .line 629
    goto :goto_15

    .line 633
    :cond_26
    invoke-virtual {p1, v7}, Lzmq/Msg;->resetFlags(I)V

    .line 636
    and-int/lit8 v5, p2, 0x2

    if-lez v5, :cond_30

    .line 637
    invoke-virtual {p1, v7}, Lzmq/Msg;->setFlags(I)V

    .line 641
    :cond_30
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xsend(Lzmq/Msg;)Z

    move-result v3

    .line 643
    .local v3, "rc":Z
    if-eqz v3, :cond_38

    move v5, v7

    .line 644
    goto :goto_15

    .line 647
    :cond_38
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v5}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, v12, :cond_48

    move v5, v6

    .line 648
    goto :goto_15

    .line 653
    :cond_48
    and-int/lit8 v5, p2, 0x1

    if-gtz v5, :cond_52

    iget-object v5, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v5, v5, Lzmq/Options;->sendTimeout:I

    if-nez v5, :cond_54

    :cond_52
    move v5, v6

    .line 654
    goto :goto_15

    .line 659
    :cond_54
    iget-object v5, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v4, v5, Lzmq/Options;->sendTimeout:I

    .line 660
    .local v4, "timeout":I
    if-gez v4, :cond_64

    const-wide/16 v1, 0x0

    .line 666
    .local v1, "end":J
    :cond_5c
    :goto_5c
    invoke-direct {p0, v4, v6}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    if-nez v5, :cond_6c

    move v5, v6

    .line 667
    goto :goto_15

    .line 660
    .end local v1    # "end":J
    :cond_64
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v8

    int-to-long v10, v4

    add-long v1, v8, v10

    goto :goto_5c

    .line 670
    .restart local v1    # "end":J
    :cond_6c
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xsend(Lzmq/Msg;)Z

    move-result v3

    .line 671
    if-eqz v3, :cond_74

    move v5, v7

    .line 687
    goto :goto_15

    .line 675
    :cond_74
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-virtual {v5}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, v12, :cond_84

    move v5, v6

    .line 676
    goto :goto_15

    .line 679
    :cond_84
    if-lez v4, :cond_5c

    .line 680
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v8

    sub-long v8, v1, v8

    long-to-int v4, v8

    .line 681
    if-gtz v4, :cond_5c

    .line 682
    iget-object v5, p0, Lzmq/SocketBase;->errno:Lzmq/ValueReference;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v5, v6

    .line 683
    goto/16 :goto_15
.end method

.method public setSocketOpt(ILjava/lang/Object;)V
    .registers 4
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    .line 238
    iget-boolean v0, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v0, :cond_a

    .line 239
    new-instance v0, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v0}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v0

    .line 243
    :cond_a
    invoke-virtual {p0, p1, p2}, Lzmq/SocketBase;->xsetsockopt(ILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 250
    :goto_10
    return-void

    .line 249
    :cond_11
    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    invoke-virtual {v0, p1, p2}, Lzmq/Options;->setSocketOpt(ILjava/lang/Object;)V

    goto :goto_10
.end method

.method public startReaping(Lzmq/Poller;)V
    .registers 4
    .param p1, "poller"    # Lzmq/Poller;

    .prologue
    .line 808
    iput-object p1, p0, Lzmq/SocketBase;->poller:Lzmq/Poller;

    .line 809
    iget-object v0, p0, Lzmq/SocketBase;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    iput-object v0, p0, Lzmq/SocketBase;->handle:Ljava/nio/channels/SelectableChannel;

    .line 810
    iget-object v0, p0, Lzmq/SocketBase;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/SocketBase;->handle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1, p0}, Lzmq/Poller;->addHandle(Ljava/nio/channels/SelectableChannel;Lzmq/IPollEvents;)V

    .line 811
    iget-object v0, p0, Lzmq/SocketBase;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/SocketBase;->handle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 815
    invoke-virtual {p0}, Lzmq/SocketBase;->terminate()V

    .line 816
    invoke-direct {p0}, Lzmq/SocketBase;->checkDestroy()V

    .line 817
    return-void
.end method

.method public stop()V
    .registers 1

    .prologue
    .line 187
    invoke-virtual {p0}, Lzmq/SocketBase;->sendStop()V

    .line 188
    return-void
.end method

.method protected stopMonitor()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 1242
    iget-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    if-eqz v0, :cond_25

    .line 1243
    iget v0, p0, Lzmq/SocketBase;->monitorEvents:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_1b

    .line 1244
    new-instance v0, Lzmq/ZMQ$Event;

    const/16 v1, 0x400

    const-string v2, ""

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lzmq/SocketBase;->monitorEvent(Lzmq/ZMQ$Event;)V

    .line 1246
    :cond_1b
    iget-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    invoke-virtual {v0}, Lzmq/SocketBase;->close()V

    .line 1247
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/SocketBase;->monitorSocket:Lzmq/SocketBase;

    .line 1248
    iput v4, p0, Lzmq/SocketBase;->monitorEvents:I

    .line 1250
    :cond_25
    return-void
.end method

.method public termEndpoint(Ljava/lang/String;)Z
    .registers 12
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 556
    iget-boolean v9, p0, Lzmq/SocketBase;->ctxTerminated:Z

    if-eqz v9, :cond_c

    .line 557
    new-instance v7, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v7}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v7

    .line 561
    :cond_c
    if-nez p1, :cond_14

    .line 562
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-direct {v7}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v7

    .line 567
    :cond_14
    invoke-direct {p0, v7, v7}, Lzmq/SocketBase;->processCommands(IZ)Z

    move-result v5

    .line 568
    .local v5, "rc":Z
    if-nez v5, :cond_1b

    .line 610
    :cond_1a
    :goto_1a
    return v7

    .line 575
    :cond_1b
    :try_start_1b
    new-instance v6, Ljava/net/URI;

    invoke-direct {v6, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_20
    .catch Ljava/net/URISyntaxException; {:try_start_1b .. :try_end_20} :catch_57

    .line 581
    .local v6, "uri":Ljava/net/URI;
    invoke-virtual {v6}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    .line 583
    .local v4, "protocol":Ljava/lang/String;
    const-string v9, "inproc"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_60

    .line 584
    iget-object v9, p0, Lzmq/SocketBase;->inprocs:Ljava/util/Map;

    invoke-interface {v9, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 588
    iget-object v7, p0, Lzmq/SocketBase;->inprocs:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 589
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Pipe;>;>;"
    :goto_3e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5e

    .line 590
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lzmq/Pipe;

    invoke-virtual {v7, v8}, Lzmq/Pipe;->terminate(Z)V

    .line 591
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_3e

    .line 577
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Pipe;>;>;"
    .end local v4    # "protocol":Ljava/lang/String;
    .end local v6    # "uri":Ljava/net/URI;
    :catch_57
    move-exception v0

    .line 578
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-direct {v7, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .end local v0    # "e":Ljava/net/URISyntaxException;
    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Pipe;>;>;"
    .restart local v4    # "protocol":Ljava/lang/String;
    .restart local v6    # "uri":Ljava/net/URI;
    :cond_5e
    move v7, v8

    .line 593
    goto :goto_1a

    .line 596
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Pipe;>;>;"
    :cond_60
    iget-object v9, p0, Lzmq/SocketBase;->endpoints:Ljava/util/Map;

    invoke-interface {v9, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 600
    iget-object v7, p0, Lzmq/SocketBase;->endpoints:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 602
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Own;>;>;"
    :cond_72
    :goto_72
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_97

    .line 603
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 604
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Own;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_72

    .line 607
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lzmq/Own;

    invoke-virtual {p0, v7}, Lzmq/SocketBase;->termChild(Lzmq/Own;)V

    .line 608
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_72

    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Own;>;"
    :cond_97
    move v7, v8

    .line 610
    goto :goto_1a
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 997
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/SocketBase;->options:Lzmq/Options;

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

.method public typeString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1265
    iget-object v0, p0, Lzmq/SocketBase;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    packed-switch v0, :pswitch_data_26

    .line 1285
    const-string v0, "UNKOWN"

    :goto_9
    return-object v0

    .line 1267
    :pswitch_a
    const-string v0, "PAIR"

    goto :goto_9

    .line 1269
    :pswitch_d
    const-string v0, "PUB"

    goto :goto_9

    .line 1271
    :pswitch_10
    const-string v0, "SUB"

    goto :goto_9

    .line 1273
    :pswitch_13
    const-string v0, "REQ"

    goto :goto_9

    .line 1275
    :pswitch_16
    const-string v0, "REP"

    goto :goto_9

    .line 1277
    :pswitch_19
    const-string v0, "DEALER"

    goto :goto_9

    .line 1279
    :pswitch_1c
    const-string v0, "ROUTER"

    goto :goto_9

    .line 1281
    :pswitch_1f
    const-string v0, "PULL"

    goto :goto_9

    .line 1283
    :pswitch_22
    const-string v0, "PUSH"

    goto :goto_9

    .line 1265
    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_a
        :pswitch_d
        :pswitch_10
        :pswitch_13
        :pswitch_16
        :pswitch_19
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
    .end packed-switch
.end method

.method public bridge synthetic unregisterTermAck()V
    .registers 1

    .prologue
    .line 32
    invoke-super {p0}, Lzmq/Own;->unregisterTermAck()V

    return-void
.end method

.method public writeActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 1028
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->xwriteActivated(Lzmq/Pipe;)V

    .line 1029
    return-void
.end method

.method protected abstract xattachPipe(Lzmq/Pipe;Z)V
.end method

.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 937
    const/4 v0, 0x0

    return v0
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 927
    const/4 v0, 0x0

    return v0
.end method

.method protected xhiccuped(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 957
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected abstract xpipeTerminated(Lzmq/Pipe;)V
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 947
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must Override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 3

    .prologue
    .line 942
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must Override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 932
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must Override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected xsetsockopt(ILjava/lang/Object;)Z
    .registers 4
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    .line 922
    const/4 v0, 0x0

    return v0
.end method

.method protected xwriteActivated(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 952
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Must Override"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
