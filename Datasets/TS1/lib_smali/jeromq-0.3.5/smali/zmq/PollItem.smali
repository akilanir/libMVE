.class public Lzmq/PollItem;
.super Ljava/lang/Object;
.source "PollItem.java"


# instance fields
.field private channel:Ljava/nio/channels/SelectableChannel;

.field private interest:I

.field private ready:I

.field private socket:Lzmq/SocketBase;

.field private zinterest:I


# direct methods
.method public constructor <init>(Ljava/nio/channels/SelectableChannel;I)V
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "ops"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    .line 51
    iput-object p1, p0, Lzmq/PollItem;->channel:Ljava/nio/channels/SelectableChannel;

    .line 52
    invoke-direct {p0, p2}, Lzmq/PollItem;->init(I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lzmq/SocketBase;)V
    .registers 4
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    const/4 v1, -0x1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/PollItem;->channel:Ljava/nio/channels/SelectableChannel;

    .line 37
    iput v1, p0, Lzmq/PollItem;->zinterest:I

    .line 38
    iput v1, p0, Lzmq/PollItem;->interest:I

    .line 39
    return-void
.end method

.method public constructor <init>(Lzmq/SocketBase;I)V
    .registers 4
    .param p1, "socket"    # Lzmq/SocketBase;
    .param p2, "ops"    # I

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/PollItem;->channel:Ljava/nio/channels/SelectableChannel;

    .line 45
    invoke-direct {p0, p2}, Lzmq/PollItem;->init(I)V

    .line 46
    return-void
.end method

.method private init(I)V
    .registers 4
    .param p1, "ops"    # I

    .prologue
    .line 57
    iput p1, p0, Lzmq/PollItem;->zinterest:I

    .line 58
    const/4 v0, 0x0

    .line 59
    .local v0, "interest":I
    and-int/lit8 v1, p1, 0x1

    if-lez v1, :cond_9

    .line 60
    or-int/lit8 v0, v0, 0x1

    .line 62
    :cond_9
    and-int/lit8 v1, p1, 0x2

    if-lez v1, :cond_13

    .line 63
    iget-object v1, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    if-eqz v1, :cond_19

    .line 64
    or-int/lit8 v0, v0, 0x1

    .line 70
    :cond_13
    :goto_13
    iput v0, p0, Lzmq/PollItem;->interest:I

    .line 71
    const/4 v1, 0x0

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 72
    return-void

    .line 67
    :cond_19
    or-int/lit8 v0, v0, 0x4

    goto :goto_13
.end method


# virtual methods
.method protected final getChannel()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    if-eqz v0, :cond_b

    .line 102
    iget-object v0, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    invoke-virtual {v0}, Lzmq/SocketBase;->getFD()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    .line 105
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lzmq/PollItem;->channel:Ljava/nio/channels/SelectableChannel;

    goto :goto_a
.end method

.method public final getRawSocket()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lzmq/PollItem;->channel:Ljava/nio/channels/SelectableChannel;

    return-object v0
.end method

.method public final getSocket()Lzmq/SocketBase;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    return-object v0
.end method

.method public final interestOps()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lzmq/PollItem;->interest:I

    return v0
.end method

.method public final interestOps(I)I
    .registers 3
    .param p1, "ops"    # I

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lzmq/PollItem;->init(I)V

    .line 117
    iget v0, p0, Lzmq/PollItem;->interest:I

    return v0
.end method

.method public final isError()Z
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lzmq/PollItem;->ready:I

    and-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final isReadable()Z
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lzmq/PollItem;->ready:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final isWritable()Z
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lzmq/PollItem;->ready:I

    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final readyOps()I
    .registers 2

    .prologue
    .line 154
    iget v0, p0, Lzmq/PollItem;->ready:I

    return v0
.end method

.method public final readyOps(Ljava/nio/channels/SelectionKey;I)I
    .registers 6
    .param p1, "key"    # Ljava/nio/channels/SelectionKey;
    .param p2, "nevents"    # I

    .prologue
    .line 122
    const/4 v1, 0x0

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 124
    iget-object v1, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    if-eqz v1, :cond_36

    .line 125
    iget-object v1, p0, Lzmq/PollItem;->socket:Lzmq/SocketBase;

    const/16 v2, 0xf

    invoke-virtual {v1, v2}, Lzmq/SocketBase;->getSocketOpt(I)I

    move-result v0

    .line 126
    .local v0, "events":I
    if-gez v0, :cond_13

    .line 127
    const/4 v1, -0x1

    .line 149
    .end local v0    # "events":I
    :goto_12
    return v1

    .line 130
    .restart local v0    # "events":I
    :cond_13
    iget v1, p0, Lzmq/PollItem;->zinterest:I

    and-int/lit8 v1, v1, 0x2

    if-lez v1, :cond_23

    and-int/lit8 v1, v0, 0x2

    if-lez v1, :cond_23

    .line 131
    iget v1, p0, Lzmq/PollItem;->ready:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 133
    :cond_23
    iget v1, p0, Lzmq/PollItem;->zinterest:I

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_33

    and-int/lit8 v1, v0, 0x1

    if-lez v1, :cond_33

    .line 134
    iget v1, p0, Lzmq/PollItem;->ready:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 149
    .end local v0    # "events":I
    :cond_33
    :goto_33
    iget v1, p0, Lzmq/PollItem;->ready:I

    goto :goto_12

    .line 137
    :cond_36
    if-lez p2, :cond_33

    .line 138
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v1

    if-eqz v1, :cond_44

    .line 139
    iget v1, p0, Lzmq/PollItem;->ready:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 141
    :cond_44
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 142
    iget v1, p0, Lzmq/PollItem;->ready:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p0, Lzmq/PollItem;->ready:I

    .line 144
    :cond_50
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v1

    if-nez v1, :cond_62

    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 145
    :cond_62
    iget v1, p0, Lzmq/PollItem;->ready:I

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lzmq/PollItem;->ready:I

    goto :goto_33
.end method
