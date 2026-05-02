.class abstract Lzmq/Own;
.super Lzmq/ZObject;
.source "Own.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected final options:Lzmq/Options;

.field private final owned:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lzmq/Own;",
            ">;"
        }
    .end annotation
.end field

.field private owner:Lzmq/Own;

.field private processedSeqnum:J

.field private final sendSeqnum:Ljava/util/concurrent/atomic/AtomicLong;

.field private termAcks:I

.field private terminating:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lzmq/Own;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Own;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;I)V
    .registers 7
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 61
    invoke-direct {p0, p1, p2}, Lzmq/ZObject;-><init>(Lzmq/Ctx;I)V

    .line 62
    iput-boolean v1, p0, Lzmq/Own;->terminating:Z

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lzmq/Own;->sendSeqnum:Ljava/util/concurrent/atomic/AtomicLong;

    .line 64
    iput-wide v2, p0, Lzmq/Own;->processedSeqnum:J

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    .line 66
    iput v1, p0, Lzmq/Own;->termAcks:I

    .line 68
    new-instance v0, Lzmq/Options;

    invoke-direct {v0}, Lzmq/Options;-><init>()V

    iput-object v0, p0, Lzmq/Own;->options:Lzmq/Options;

    .line 69
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    .line 70
    return-void
.end method

.method public constructor <init>(Lzmq/IOThread;Lzmq/Options;)V
    .registers 7
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "options"    # Lzmq/Options;

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 75
    invoke-direct {p0, p1}, Lzmq/ZObject;-><init>(Lzmq/ZObject;)V

    .line 76
    iput-object p2, p0, Lzmq/Own;->options:Lzmq/Options;

    .line 77
    iput-boolean v1, p0, Lzmq/Own;->terminating:Z

    .line 78
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lzmq/Own;->sendSeqnum:Ljava/util/concurrent/atomic/AtomicLong;

    .line 79
    iput-wide v2, p0, Lzmq/Own;->processedSeqnum:J

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    .line 81
    iput v1, p0, Lzmq/Own;->termAcks:I

    .line 83
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    .line 84
    return-void
.end method

.method private checkTermAcks()V
    .registers 5

    .prologue
    .line 254
    iget-boolean v0, p0, Lzmq/Own;->terminating:Z

    if-eqz v0, :cond_32

    iget-wide v0, p0, Lzmq/Own;->processedSeqnum:J

    iget-object v2, p0, Lzmq/Own;->sendSeqnum:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_32

    iget v0, p0, Lzmq/Own;->termAcks:I

    if-nez v0, :cond_32

    .line 257
    sget-boolean v0, Lzmq/Own;->$assertionsDisabled:Z

    if-nez v0, :cond_26

    iget-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_26

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 261
    :cond_26
    iget-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    if-eqz v0, :cond_2f

    .line 262
    iget-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    invoke-virtual {p0, v0}, Lzmq/Own;->sendTermAck(Lzmq/Own;)V

    .line 266
    :cond_2f
    invoke-virtual {p0}, Lzmq/Own;->processDestroy()V

    .line 268
    :cond_32
    return-void
.end method

.method private setOwner(Lzmq/Own;)V
    .registers 3
    .param p1, "owner"    # Lzmq/Own;

    .prologue
    .line 97
    sget-boolean v0, Lzmq/Own;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 98
    :cond_e
    iput-object p1, p0, Lzmq/Own;->owner:Lzmq/Own;

    .line 99
    return-void
.end method


# virtual methods
.method public abstract destroy()V
.end method

.method incSeqnum()V
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lzmq/Own;->sendSeqnum:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 108
    return-void
.end method

.method protected isTerminating()Z
    .registers 2

    .prologue
    .line 202
    iget-boolean v0, p0, Lzmq/Own;->terminating:Z

    return v0
.end method

.method protected launchChild(Lzmq/Own;)V
    .registers 2
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 123
    invoke-direct {p1, p0}, Lzmq/Own;->setOwner(Lzmq/Own;)V

    .line 126
    invoke-virtual {p0, p1}, Lzmq/Own;->sendPlug(Lzmq/Own;)V

    .line 129
    invoke-virtual {p0, p0, p1}, Lzmq/Own;->sendOwn(Lzmq/Own;Lzmq/Own;)V

    .line 130
    return-void
.end method

.method protected processDestroy()V
    .registers 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lzmq/Own;->destroy()V

    .line 93
    return-void
.end method

.method protected processOwn(Lzmq/Own;)V
    .registers 3
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 167
    iget-boolean v0, p0, Lzmq/Own;->terminating:Z

    if-eqz v0, :cond_d

    .line 168
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lzmq/Own;->registerTermAcks(I)V

    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lzmq/Own;->sendTerm(Lzmq/Own;I)V

    .line 175
    :goto_c
    return-void

    .line 174
    :cond_d
    iget-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_c
.end method

.method protected processSeqnum()V
    .registers 5

    .prologue
    .line 113
    iget-wide v0, p0, Lzmq/Own;->processedSeqnum:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lzmq/Own;->processedSeqnum:J

    .line 116
    invoke-direct {p0}, Lzmq/Own;->checkTermAcks()V

    .line 117
    return-void
.end method

.method protected processTerm(I)V
    .registers 5
    .param p1, "linger"    # I

    .prologue
    .line 212
    sget-boolean v2, Lzmq/Own;->$assertionsDisabled:Z

    if-nez v2, :cond_e

    iget-boolean v2, p0, Lzmq/Own;->terminating:Z

    if-eqz v2, :cond_e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 215
    :cond_e
    iget-object v2, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/Own;

    .line 216
    .local v1, "it":Lzmq/Own;
    invoke-virtual {p0, v1, p1}, Lzmq/Own;->sendTerm(Lzmq/Own;I)V

    goto :goto_14

    .line 218
    .end local v1    # "it":Lzmq/Own;
    :cond_24
    iget-object v2, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {p0, v2}, Lzmq/Own;->registerTermAcks(I)V

    .line 219
    iget-object v2, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 223
    const/4 v2, 0x1

    iput-boolean v2, p0, Lzmq/Own;->terminating:Z

    .line 224
    invoke-direct {p0}, Lzmq/Own;->checkTermAcks()V

    .line 225
    return-void
.end method

.method protected processTermAck()V
    .registers 1

    .prologue
    .line 249
    invoke-virtual {p0}, Lzmq/Own;->unregisterTermAck()V

    .line 250
    return-void
.end method

.method protected processTermReq(Lzmq/Own;)V
    .registers 3
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 143
    iget-boolean v0, p0, Lzmq/Own;->terminating:Z

    if-eqz v0, :cond_5

    .line 161
    :cond_4
    :goto_4
    return-void

    .line 151
    :cond_5
    iget-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 155
    iget-object v0, p0, Lzmq/Own;->owned:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 156
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lzmq/Own;->registerTermAcks(I)V

    .line 160
    iget-object v0, p0, Lzmq/Own;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->linger:I

    invoke-virtual {p0, p1, v0}, Lzmq/Own;->sendTerm(Lzmq/Own;I)V

    goto :goto_4
.end method

.method public registerTermAcks(I)V
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 234
    iget v0, p0, Lzmq/Own;->termAcks:I

    add-int/2addr v0, p1

    iput v0, p0, Lzmq/Own;->termAcks:I

    .line 235
    return-void
.end method

.method protected termChild(Lzmq/Own;)V
    .registers 2
    .param p1, "object"    # Lzmq/Own;

    .prologue
    .line 135
    invoke-virtual {p0, p1}, Lzmq/Own;->processTermReq(Lzmq/Own;)V

    .line 136
    return-void
.end method

.method protected terminate()V
    .registers 2

    .prologue
    .line 184
    iget-boolean v0, p0, Lzmq/Own;->terminating:Z

    if-eqz v0, :cond_5

    .line 197
    :goto_4
    return-void

    .line 190
    :cond_5
    iget-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    if-nez v0, :cond_11

    .line 191
    iget-object v0, p0, Lzmq/Own;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->linger:I

    invoke-virtual {p0, v0}, Lzmq/Own;->processTerm(I)V

    goto :goto_4

    .line 196
    :cond_11
    iget-object v0, p0, Lzmq/Own;->owner:Lzmq/Own;

    invoke-virtual {p0, v0, p0}, Lzmq/Own;->sendTermReq(Lzmq/Own;Lzmq/Own;)V

    goto :goto_4
.end method

.method public unregisterTermAck()V
    .registers 2

    .prologue
    .line 239
    sget-boolean v0, Lzmq/Own;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget v0, p0, Lzmq/Own;->termAcks:I

    if-gtz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 240
    :cond_e
    iget v0, p0, Lzmq/Own;->termAcks:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Own;->termAcks:I

    .line 243
    invoke-direct {p0}, Lzmq/Own;->checkTermAcks()V

    .line 244
    return-void
.end method
