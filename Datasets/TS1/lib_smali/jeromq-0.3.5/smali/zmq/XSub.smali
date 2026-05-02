.class public Lzmq/XSub;
.super Lzmq/SocketBase;
.source "XSub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/XSub$XSubSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sendSubscription:Lzmq/Trie$ITrieHandler;


# instance fields
.field private final dist:Lzmq/Dist;

.field private final fq:Lzmq/FQ;

.field private hashMessage:Z

.field private message:Lzmq/Msg;

.field private more:Z

.field private final subscriptions:Lzmq/Trie;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/XSub;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/XSub;->$assertionsDisabled:Z

    .line 53
    new-instance v0, Lzmq/XSub$1;

    invoke-direct {v0}, Lzmq/XSub$1;-><init>()V

    sput-object v0, Lzmq/XSub;->sendSubscription:Lzmq/Trie$ITrieHandler;

    .line 75
    return-void

    .line 22
    :cond_13
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

    .line 79
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 81
    iget-object v0, p0, Lzmq/XSub;->options:Lzmq/Options;

    const/16 v1, 0xa

    iput v1, v0, Lzmq/Options;->type:I

    .line 82
    iput-boolean v2, p0, Lzmq/XSub;->hashMessage:Z

    .line 83
    iput-boolean v2, p0, Lzmq/XSub;->more:Z

    .line 85
    iget-object v0, p0, Lzmq/XSub;->options:Lzmq/Options;

    iput v2, v0, Lzmq/Options;->linger:I

    .line 86
    new-instance v0, Lzmq/FQ;

    invoke-direct {v0}, Lzmq/FQ;-><init>()V

    iput-object v0, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    .line 87
    new-instance v0, Lzmq/Dist;

    invoke-direct {v0}, Lzmq/Dist;-><init>()V

    iput-object v0, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    .line 88
    new-instance v0, Lzmq/Trie;

    invoke-direct {v0}, Lzmq/Trie;-><init>()V

    iput-object v0, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    .line 89
    return-void
.end method

.method private match(Lzmq/Msg;)Z
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 251
    iget-object v0, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lzmq/Trie;->check([B)Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected xattachPipe(Lzmq/Pipe;Z)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 94
    sget-boolean v0, Lzmq/XSub;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 95
    :cond_c
    iget-object v0, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->attach(Lzmq/Pipe;)V

    .line 96
    iget-object v0, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->attach(Lzmq/Pipe;)V

    .line 99
    iget-object v0, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    sget-object v1, Lzmq/XSub;->sendSubscription:Lzmq/Trie$ITrieHandler;

    invoke-virtual {v0, v1, p1}, Lzmq/Trie;->apply(Lzmq/Trie$ITrieHandler;Ljava/lang/Object;)V

    .line 100
    invoke-virtual {p1}, Lzmq/Pipe;->flush()V

    .line 101
    return-void
.end method

.method protected xhasIn()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 212
    iget-boolean v1, p0, Lzmq/XSub;->more:Z

    if-eqz v1, :cond_6

    .line 237
    :cond_5
    :goto_5
    return v0

    .line 218
    :cond_6
    iget-boolean v1, p0, Lzmq/XSub;->hashMessage:Z

    if-nez v1, :cond_5

    .line 226
    :cond_a
    iget-object v1, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    iget-object v2, p0, Lzmq/XSub;->errno:Lzmq/ValueReference;

    invoke-virtual {v1, v2}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v1

    iput-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    .line 230
    iget-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    if-nez v1, :cond_1a

    .line 231
    const/4 v0, 0x0

    goto :goto_5

    .line 235
    :cond_1a
    iget-object v1, p0, Lzmq/XSub;->options:Lzmq/Options;

    iget-boolean v1, v1, Lzmq/Options;->filter:Z

    if-eqz v1, :cond_28

    iget-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    invoke-direct {p0, v1}, Lzmq/XSub;->match(Lzmq/Msg;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 236
    :cond_28
    iput-boolean v0, p0, Lzmq/XSub;->hashMessage:Z

    goto :goto_5

    .line 242
    :cond_2b
    iget-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 243
    iget-object v1, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    iget-object v2, p0, Lzmq/XSub;->errno:Lzmq/ValueReference;

    invoke-virtual {v1, v2}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v1

    iput-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    .line 244
    sget-boolean v1, Lzmq/XSub;->$assertionsDisabled:Z

    if-nez v1, :cond_2b

    iget-object v1, p0, Lzmq/XSub;->message:Lzmq/Msg;

    if-nez v1, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x1

    return v0
.end method

.method protected xhiccuped(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 126
    iget-object v0, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    sget-object v1, Lzmq/XSub;->sendSubscription:Lzmq/Trie$ITrieHandler;

    invoke-virtual {v0, v1, p1}, Lzmq/Trie;->apply(Lzmq/Trie$ITrieHandler;Ljava/lang/Object;)V

    .line 127
    invoke-virtual {p1}, Lzmq/Pipe;->flush()V

    .line 128
    return-void
.end method

.method protected xpipeTerminated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 118
    iget-object v0, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->terminated(Lzmq/Pipe;)V

    .line 119
    iget-object v0, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->terminated(Lzmq/Pipe;)V

    .line 120
    return-void
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 106
    iget-object v0, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->activated(Lzmq/Pipe;)V

    .line 107
    return-void
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 4

    .prologue
    .line 168
    const/4 v0, 0x0

    .line 172
    .local v0, "msg":Lzmq/Msg;
    iget-boolean v1, p0, Lzmq/XSub;->hashMessage:Z

    if-eqz v1, :cond_12

    .line 173
    iget-object v0, p0, Lzmq/XSub;->message:Lzmq/Msg;

    .line 174
    const/4 v1, 0x0

    iput-boolean v1, p0, Lzmq/XSub;->hashMessage:Z

    .line 175
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    iput-boolean v1, p0, Lzmq/XSub;->more:Z

    move-object v1, v0

    .line 196
    :goto_11
    return-object v1

    .line 184
    :cond_12
    iget-object v1, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    iget-object v2, p0, Lzmq/XSub;->errno:Lzmq/ValueReference;

    invoke-virtual {v1, v2}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v0

    .line 188
    if-nez v0, :cond_1e

    .line 189
    const/4 v1, 0x0

    goto :goto_11

    .line 194
    :cond_1e
    iget-boolean v1, p0, Lzmq/XSub;->more:Z

    if-nez v1, :cond_2e

    iget-object v1, p0, Lzmq/XSub;->options:Lzmq/Options;

    iget-boolean v1, v1, Lzmq/Options;->filter:Z

    if-eqz v1, :cond_2e

    invoke-direct {p0, v0}, Lzmq/XSub;->match(Lzmq/Msg;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 195
    :cond_2e
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    iput-boolean v1, p0, Lzmq/XSub;->more:Z

    move-object v1, v0

    .line 196
    goto :goto_11

    .line 201
    :cond_36
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 202
    iget-object v1, p0, Lzmq/XSub;->fq:Lzmq/FQ;

    iget-object v2, p0, Lzmq/XSub;->errno:Lzmq/ValueReference;

    invoke-virtual {v1, v2}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v0

    .line 203
    sget-boolean v1, Lzmq/XSub;->$assertionsDisabled:Z

    if-nez v1, :cond_36

    if-nez v0, :cond_36

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 6
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    .line 133
    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v0

    .line 135
    .local v0, "data":[B
    array-length v2, v0

    if-lt v2, v1, :cond_11

    aget-byte v2, v0, v3

    if-eqz v2, :cond_19

    aget-byte v2, v0, v3

    if-eq v2, v1, :cond_19

    .line 136
    :cond_11
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "subscription flag"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 140
    :cond_19
    aget-byte v2, v0, v3

    if-ne v2, v1, :cond_29

    .line 146
    iget-object v2, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    invoke-virtual {v2, v0, v1}, Lzmq/Trie;->add([BI)Z

    .line 147
    iget-object v1, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    invoke-virtual {v1, p1}, Lzmq/Dist;->sendToAll(Lzmq/Msg;)Z

    move-result v1

    .line 155
    :cond_28
    :goto_28
    return v1

    .line 150
    :cond_29
    iget-object v2, p0, Lzmq/XSub;->subscriptions:Lzmq/Trie;

    invoke-virtual {v2, v0, v1}, Lzmq/Trie;->rm([BI)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 151
    iget-object v1, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    invoke-virtual {v1, p1}, Lzmq/Dist;->sendToAll(Lzmq/Msg;)Z

    move-result v1

    goto :goto_28
.end method

.method protected xwriteActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 112
    iget-object v0, p0, Lzmq/XSub;->dist:Lzmq/Dist;

    invoke-virtual {v0, p1}, Lzmq/Dist;->activated(Lzmq/Pipe;)V

    .line 113
    return-void
.end method
