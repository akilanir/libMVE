.class Lzmq/XPub;
.super Lzmq/SocketBase;
.source "XPub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/XPub$XPubSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static markAsMatching:Lzmq/Mtrie$IMtrieHandler;

.field private static sendUnsubscription:Lzmq/Mtrie$IMtrieHandler;


# instance fields
.field private final dist:Lzmq/Dist;

.field private more:Z

.field private final pendingData:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Lzmq/Blob;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingFlags:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final subscriptions:Lzmq/Mtrie;

.field verbose:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-class v0, Lzmq/XPub;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/XPub;->$assertionsDisabled:Z

    .line 59
    new-instance v0, Lzmq/XPub$1;

    invoke-direct {v0}, Lzmq/XPub$1;-><init>()V

    sput-object v0, Lzmq/XPub;->markAsMatching:Lzmq/Mtrie$IMtrieHandler;

    .line 69
    new-instance v0, Lzmq/XPub$2;

    invoke-direct {v0}, Lzmq/XPub$2;-><init>()V

    sput-object v0, Lzmq/XPub;->sendUnsubscription:Lzmq/Mtrie$IMtrieHandler;

    .line 87
    return-void

    .line 25
    :cond_1a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 7
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    const/4 v2, 0x0

    .line 91
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 93
    iget-object v0, p0, Lzmq/XPub;->options:Lzmq/Options;

    const/16 v1, 0x9

    iput v1, v0, Lzmq/Options;->type:I

    .line 94
    iput-boolean v2, p0, Lzmq/XPub;->verbose:Z

    .line 95
    iput-boolean v2, p0, Lzmq/XPub;->more:Z

    .line 97
    new-instance v0, Lzmq/Mtrie;

    invoke-direct {v0}, Lzmq/Mtrie;-><init>()V

    iput-object v0, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    .line 98
    new-instance v0, Lzmq/Dist;

    invoke-direct {v0}, Lzmq/Dist;-><init>()V

    iput-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    .line 99
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    .line 100
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lzmq/XPub;->pendingFlags:Ljava/util/Deque;

    .line 101
    return-void
.end method

.method static synthetic access$000(Lzmq/XPub;)Lzmq/Dist;
    .registers 2
    .param p0, "x0"    # Lzmq/XPub;

    .prologue
    .line 25
    iget-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    return-object v0
.end method

.method static synthetic access$100(Lzmq/XPub;)Ljava/util/Deque;
    .registers 2
    .param p0, "x0"    # Lzmq/XPub;

    .prologue
    .line 25
    iget-object v0, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    return-object v0
.end method

.method static synthetic access$200(Lzmq/XPub;)Ljava/util/Deque;
    .registers 2
    .param p0, "x0"    # Lzmq/XPub;

    .prologue
    .line 25
    iget-object v0, p0, Lzmq/XPub;->pendingFlags:Ljava/util/Deque;

    return-object v0
.end method


# virtual methods
.method protected xattachPipe(Lzmq/Pipe;Z)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 106
    sget-boolean v0, Lzmq/XPub;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 107
    :cond_c
    iget-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->attach(Lzmq/Pipe;)V

    .line 111
    if-eqz p2, :cond_19

    .line 112
    iget-object v0, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lzmq/Mtrie;->add([BLzmq/Pipe;)Z

    .line 117
    :cond_19
    invoke-virtual {p0, p1}, Lzmq/XPub;->xreadActivated(Lzmq/Pipe;)V

    .line 118
    return-void
.end method

.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 235
    iget-object v0, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v0}, Lzmq/Dist;->hasOut()Z

    move-result v0

    return v0
.end method

.method protected xpipeTerminated(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 177
    iget-object v0, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    sget-object v1, Lzmq/XPub;->sendUnsubscription:Lzmq/Mtrie$IMtrieHandler;

    invoke-virtual {v0, p1, v1, p0}, Lzmq/Mtrie;->rm(Lzmq/Pipe;Lzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z

    .line 179
    iget-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->terminated(Lzmq/Pipe;)V

    .line 180
    return-void
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 10
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 124
    const/4 v2, 0x0

    .line 125
    .local v2, "sub":Lzmq/Msg;
    :cond_3
    :goto_3
    invoke-virtual {p1}, Lzmq/Pipe;->read()Lzmq/Msg;

    move-result-object v2

    if-eqz v2, :cond_68

    .line 127
    invoke-virtual {v2}, Lzmq/Msg;->data()[B

    move-result-object v0

    .line 128
    .local v0, "data":[B
    invoke-virtual {v2}, Lzmq/Msg;->size()I

    move-result v1

    .line 129
    .local v1, "size":I
    if-lez v1, :cond_51

    aget-byte v4, v0, v7

    if-eqz v4, :cond_1b

    aget-byte v4, v0, v7

    if-ne v4, v6, :cond_51

    .line 131
    :cond_1b
    aget-byte v4, v0, v7

    if-nez v4, :cond_4a

    .line 132
    iget-object v4, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    invoke-virtual {v4, v0, v6, p1}, Lzmq/Mtrie;->rm([BILzmq/Pipe;)Z

    move-result v3

    .line 140
    .local v3, "unique":Z
    :goto_25
    iget-object v4, p0, Lzmq/XPub;->options:Lzmq/Options;

    iget v4, v4, Lzmq/Options;->type:I

    const/16 v5, 0x9

    if-ne v4, v5, :cond_3

    if-nez v3, :cond_37

    aget-byte v4, v0, v7

    if-ne v4, v6, :cond_3

    iget-boolean v4, p0, Lzmq/XPub;->verbose:Z

    if-eqz v4, :cond_3

    .line 141
    :cond_37
    iget-object v4, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    invoke-static {v0, v6}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 142
    iget-object v4, p0, Lzmq/XPub;->pendingFlags:Ljava/util/Deque;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 135
    .end local v3    # "unique":Z
    :cond_4a
    iget-object v4, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    invoke-virtual {v4, v0, v6, p1}, Lzmq/Mtrie;->add([BILzmq/Pipe;)Z

    move-result v3

    .restart local v3    # "unique":Z
    goto :goto_25

    .line 147
    .end local v3    # "unique":Z
    :cond_51
    iget-object v4, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    invoke-static {v0, v6}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v4, p0, Lzmq/XPub;->pendingFlags:Ljava/util/Deque;

    invoke-virtual {v2}, Lzmq/Msg;->flags()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 151
    .end local v0    # "data":[B
    .end local v1    # "size":I
    :cond_68
    return-void
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 6

    .prologue
    .line 220
    iget-object v3, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 221
    iget-object v3, p0, Lzmq/XPub;->errno:Lzmq/ValueReference;

    const/16 v4, 0x23

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 222
    const/4 v2, 0x0

    .line 229
    :goto_14
    return-object v2

    .line 225
    :cond_15
    iget-object v3, p0, Lzmq/XPub;->pendingData:Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Blob;

    .line 226
    .local v0, "first":Lzmq/Blob;
    new-instance v2, Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Blob;->data()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lzmq/Msg;-><init>([B)V

    .line 227
    .local v2, "msg":Lzmq/Msg;
    iget-object v3, p0, Lzmq/XPub;->pendingFlags:Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->pollFirst()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 228
    .local v1, "flags":I
    invoke-virtual {v2, v1}, Lzmq/Msg;->setFlags(I)V

    goto :goto_14
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 8
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 185
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    .line 188
    .local v0, "msgMore":Z
    iget-boolean v2, p0, Lzmq/XPub;->more:Z

    if-nez v2, :cond_17

    .line 189
    iget-object v2, p0, Lzmq/XPub;->subscriptions:Lzmq/Mtrie;

    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v3

    invoke-virtual {p1}, Lzmq/Msg;->size()I

    move-result v4

    sget-object v5, Lzmq/XPub;->markAsMatching:Lzmq/Mtrie$IMtrieHandler;

    invoke-virtual {v2, v3, v4, v5, p0}, Lzmq/Mtrie;->match([BILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)V

    .line 195
    :cond_17
    iget-object v2, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v2, p1}, Lzmq/Dist;->sendToMatching(Lzmq/Msg;)Z

    move-result v1

    .line 196
    .local v1, "rc":Z
    if-nez v1, :cond_21

    .line 197
    const/4 v2, 0x0

    .line 207
    :goto_20
    return v2

    .line 202
    :cond_21
    if-nez v0, :cond_28

    .line 203
    iget-object v2, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v2}, Lzmq/Dist;->unmatch()V

    .line 206
    :cond_28
    iput-boolean v0, p0, Lzmq/XPub;->more:Z

    .line 207
    const/4 v2, 0x1

    goto :goto_20
.end method

.method public xsetsockopt(ILjava/lang/Object;)Z
    .registers 6
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 162
    const/16 v2, 0x28

    if-eq p1, v2, :cond_7

    .line 167
    .end local p2    # "optval":Ljava/lang/Object;
    :goto_6
    return v0

    .line 165
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_7
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_10

    move v0, v1

    :cond_10
    iput-boolean v0, p0, Lzmq/XPub;->verbose:Z

    move v0, v1

    .line 167
    goto :goto_6
.end method

.method protected xwriteActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 156
    iget-object v0, p0, Lzmq/XPub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->activated(Lzmq/Pipe;)V

    .line 157
    return-void
.end method
