.class Lzmq/Pipe;
.super Lzmq/ZObject;
.source "Pipe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Pipe$State;,
        Lzmq/Pipe$IPipeEvents;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private delay:Z

.field private hwm:I

.field private identity:Lzmq/Blob;

.field private inActive:Z

.field private inpipe:Lzmq/YPipe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YPipe",
            "<",
            "Lzmq/Msg;",
            ">;"
        }
    .end annotation
.end field

.field private lwm:I

.field private msgsRead:J

.field private msgsWritten:J

.field private outActive:Z

.field private outpipe:Lzmq/YPipe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YPipe",
            "<",
            "Lzmq/Msg;",
            ">;"
        }
    .end annotation
.end field

.field private parent:Lzmq/ZObject;

.field private peer:Lzmq/Pipe;

.field private peersMsgsRead:J

.field private sink:Lzmq/Pipe$IPipeEvents;

.field private state:Lzmq/Pipe$State;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-class v0, Lzmq/Pipe;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private constructor <init>(Lzmq/ZObject;Lzmq/YPipe;Lzmq/YPipe;IIZ)V
    .registers 11
    .param p1, "parent"    # Lzmq/ZObject;
    .param p4, "inhwm"    # I
    .param p5, "outhwm"    # I
    .param p6, "delay"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzmq/ZObject;",
            "Lzmq/YPipe",
            "<",
            "Lzmq/Msg;",
            ">;",
            "Lzmq/YPipe",
            "<",
            "Lzmq/Msg;",
            ">;IIZ)V"
        }
    .end annotation

    .prologue
    .local p2, "inpipe":Lzmq/YPipe;, "Lzmq/YPipe<Lzmq/Msg;>;"
    .local p3, "outpipe":Lzmq/YPipe;, "Lzmq/YPipe<Lzmq/Msg;>;"
    const/4 v3, 0x0

    const/4 v0, 0x1

    const-wide/16 v1, 0x0

    .line 98
    invoke-direct {p0, p1}, Lzmq/ZObject;-><init>(Lzmq/ZObject;)V

    .line 99
    iput-object p2, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    .line 100
    iput-object p3, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 101
    iput-boolean v0, p0, Lzmq/Pipe;->inActive:Z

    .line 102
    iput-boolean v0, p0, Lzmq/Pipe;->outActive:Z

    .line 103
    iput p5, p0, Lzmq/Pipe;->hwm:I

    .line 104
    invoke-static {p4}, Lzmq/Pipe;->computeLwm(I)I

    move-result v0

    iput v0, p0, Lzmq/Pipe;->lwm:I

    .line 105
    iput-wide v1, p0, Lzmq/Pipe;->msgsRead:J

    .line 106
    iput-wide v1, p0, Lzmq/Pipe;->msgsWritten:J

    .line 107
    iput-wide v1, p0, Lzmq/Pipe;->peersMsgsRead:J

    .line 108
    iput-object v3, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    .line 109
    iput-object v3, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    .line 110
    sget-object v0, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 111
    iput-boolean p6, p0, Lzmq/Pipe;->delay:Z

    .line 113
    iput-object p1, p0, Lzmq/Pipe;->parent:Lzmq/ZObject;

    .line 114
    return-void
.end method

.method private static computeLwm(I)I
    .registers 2
    .param p0, "hwm"    # I

    .prologue
    .line 499
    sget-object v0, Lzmq/Config;->MAX_WM_DELTA:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    if-le p0, v0, :cond_13

    sget-object v0, Lzmq/Config;->MAX_WM_DELTA:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    sub-int v0, p0, v0

    :goto_12
    return v0

    :cond_13
    add-int/lit8 v0, p0, 0x1

    div-int/lit8 v0, v0, 0x2

    goto :goto_12
.end method

.method private delimit()V
    .registers 3

    .prologue
    .line 506
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_b

    .line 507
    sget-object v0, Lzmq/Pipe$State;->DELIMITED:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 520
    :cond_a
    :goto_a
    return-void

    .line 511
    :cond_b
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_1e

    .line 512
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 513
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    .line 514
    sget-object v0, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    goto :goto_a

    .line 519
    :cond_1e
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static isDelimiter(Lzmq/Msg;)Z
    .registers 2
    .param p0, "msg"    # Lzmq/Msg;

    .prologue
    .line 472
    invoke-virtual {p0}, Lzmq/Msg;->isDelimiter()Z

    move-result v0

    return v0
.end method

.method public static pipepair([Lzmq/ZObject;[Lzmq/Pipe;[I[Z)V
    .registers 15
    .param p0, "parents"    # [Lzmq/ZObject;
    .param p1, "pipes"    # [Lzmq/Pipe;
    .param p2, "hwms"    # [I
    .param p3, "delays"    # [Z

    .prologue
    .line 128
    new-instance v2, Lzmq/YPipe;

    sget-object v0, Lzmq/Config;->MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    invoke-direct {v2, v0}, Lzmq/YPipe;-><init>(I)V

    .line 129
    .local v2, "upipe1":Lzmq/YPipe;, "Lzmq/YPipe<Lzmq/Msg;>;"
    new-instance v3, Lzmq/YPipe;

    sget-object v0, Lzmq/Config;->MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    invoke-direct {v3, v0}, Lzmq/YPipe;-><init>(I)V

    .line 131
    .local v3, "upipe2":Lzmq/YPipe;, "Lzmq/YPipe<Lzmq/Msg;>;"
    const/4 v7, 0x0

    new-instance v0, Lzmq/Pipe;

    const/4 v1, 0x0

    aget-object v1, p0, v1

    const/4 v4, 0x1

    aget v4, p2, v4

    const/4 v5, 0x0

    aget v5, p2, v5

    const/4 v6, 0x0

    aget-boolean v6, p3, v6

    invoke-direct/range {v0 .. v6}, Lzmq/Pipe;-><init>(Lzmq/ZObject;Lzmq/YPipe;Lzmq/YPipe;IIZ)V

    aput-object v0, p1, v7

    .line 133
    const/4 v0, 0x1

    new-instance v4, Lzmq/Pipe;

    const/4 v1, 0x1

    aget-object v5, p0, v1

    const/4 v1, 0x0

    aget v8, p2, v1

    const/4 v1, 0x1

    aget v9, p2, v1

    const/4 v1, 0x1

    aget-boolean v10, p3, v1

    move-object v6, v3

    move-object v7, v2

    invoke-direct/range {v4 .. v10}, Lzmq/Pipe;-><init>(Lzmq/ZObject;Lzmq/YPipe;Lzmq/YPipe;IIZ)V

    aput-object v4, p1, v0

    .line 136
    const/4 v0, 0x0

    aget-object v0, p1, v0

    const/4 v1, 0x1

    aget-object v1, p1, v1

    invoke-direct {v0, v1}, Lzmq/Pipe;->setPeer(Lzmq/Pipe;)V

    .line 137
    const/4 v0, 0x1

    aget-object v0, p1, v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-direct {v0, v1}, Lzmq/Pipe;->setPeer(Lzmq/Pipe;)V

    .line 139
    return-void
.end method

.method private setPeer(Lzmq/Pipe;)V
    .registers 3
    .param p1, "peer"    # Lzmq/Pipe;

    .prologue
    .line 146
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 147
    :cond_c
    iput-object p1, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    .line 148
    return-void
.end method


# virtual methods
.method public checkRead()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 171
    iget-boolean v1, p0, Lzmq/Pipe;->inActive:Z

    if-eqz v1, :cond_11

    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v3, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-eq v1, v3, :cond_13

    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v3, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-eq v1, v3, :cond_13

    :cond_11
    move v1, v2

    .line 190
    :goto_12
    return v1

    .line 176
    :cond_13
    iget-object v1, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->checkRead()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 177
    iput-boolean v2, p0, Lzmq/Pipe;->inActive:Z

    move v1, v2

    .line 178
    goto :goto_12

    .line 183
    :cond_1f
    iget-object v1, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->probe()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/Msg;

    invoke-static {v1}, Lzmq/Pipe;->isDelimiter(Lzmq/Msg;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 184
    iget-object v1, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Msg;

    .line 185
    .local v0, "msg":Lzmq/Msg;
    sget-boolean v1, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v1, :cond_41

    if-nez v0, :cond_41

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 186
    :cond_41
    invoke-direct {p0}, Lzmq/Pipe;->delimit()V

    move v1, v2

    .line 187
    goto :goto_12

    .line 190
    .end local v0    # "msg":Lzmq/Msg;
    :cond_46
    const/4 v1, 0x1

    goto :goto_12
.end method

.method public checkWrite()Z
    .registers 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 228
    iget-boolean v3, p0, Lzmq/Pipe;->outActive:Z

    if-eqz v3, :cond_c

    iget-object v3, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v4, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-eq v3, v4, :cond_d

    .line 239
    :cond_c
    :goto_c
    return v1

    .line 232
    :cond_d
    iget v3, p0, Lzmq/Pipe;->hwm:I

    if-lez v3, :cond_23

    iget-wide v3, p0, Lzmq/Pipe;->msgsWritten:J

    iget-wide v5, p0, Lzmq/Pipe;->peersMsgsRead:J

    sub-long/2addr v3, v5

    iget v5, p0, Lzmq/Pipe;->hwm:I

    int-to-long v5, v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_23

    move v0, v2

    .line 234
    .local v0, "full":Z
    :goto_1e
    if-eqz v0, :cond_25

    .line 235
    iput-boolean v1, p0, Lzmq/Pipe;->outActive:Z

    goto :goto_c

    .end local v0    # "full":Z
    :cond_23
    move v0, v1

    .line 232
    goto :goto_1e

    .restart local v0    # "full":Z
    :cond_25
    move v1, v2

    .line 239
    goto :goto_c
.end method

.method public flush()V
    .registers 3

    .prologue
    .line 276
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_7

    .line 283
    :cond_6
    :goto_6
    return-void

    .line 280
    :cond_7
    iget-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v0}, Lzmq/YPipe;->flush()Z

    move-result v0

    if-nez v0, :cond_6

    .line 281
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendActivateRead(Lzmq/Pipe;)V

    goto :goto_6
.end method

.method public getIdentity()Lzmq/Blob;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lzmq/Pipe;->identity:Lzmq/Blob;

    return-object v0
.end method

.method public hiccup()V
    .registers 3

    .prologue
    .line 528
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-eq v0, v1, :cond_7

    .line 542
    :goto_6
    return-void

    .line 534
    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    .line 537
    new-instance v0, Lzmq/YPipe;

    sget-object v1, Lzmq/Config;->MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

    invoke-virtual {v1}, Lzmq/Config;->getValue()I

    move-result v1

    invoke-direct {v0, v1}, Lzmq/YPipe;-><init>(I)V

    iput-object v0, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    .line 538
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Pipe;->inActive:Z

    .line 541
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    iget-object v1, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {p0, v0, v1}, Lzmq/Pipe;->sendHiccup(Lzmq/Pipe;Ljava/lang/Object;)V

    goto :goto_6
.end method

.method protected processActivateRead()V
    .registers 3

    .prologue
    .line 288
    iget-boolean v0, p0, Lzmq/Pipe;->inActive:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-eq v0, v1, :cond_10

    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_18

    .line 289
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Pipe;->inActive:Z

    .line 290
    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    invoke-interface {v0, p0}, Lzmq/Pipe$IPipeEvents;->readActivated(Lzmq/Pipe;)V

    .line 292
    :cond_18
    return-void
.end method

.method protected processActivateWrite(J)V
    .registers 5
    .param p1, "msgsRead"    # J

    .prologue
    .line 298
    iput-wide p1, p0, Lzmq/Pipe;->peersMsgsRead:J

    .line 300
    iget-boolean v0, p0, Lzmq/Pipe;->outActive:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_14

    .line 301
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Pipe;->outActive:Z

    .line 302
    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    invoke-interface {v0, p0}, Lzmq/Pipe$IPipeEvents;->writeActivated(Lzmq/Pipe;)V

    .line 304
    :cond_14
    return-void
.end method

.method protected processHiccup(Ljava/lang/Object;)V
    .registers 4
    .param p1, "pipe"    # Ljava/lang/Object;

    .prologue
    .line 312
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 313
    :cond_e
    iget-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v0}, Lzmq/YPipe;->flush()Z

    .line 314
    :cond_13
    iget-object v0, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v0}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_13

    .line 319
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_27

    if-nez p1, :cond_27

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 320
    :cond_27
    check-cast p1, Lzmq/YPipe;

    .end local p1    # "pipe":Ljava/lang/Object;
    iput-object p1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 321
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Pipe;->outActive:Z

    .line 324
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_39

    .line 325
    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    invoke-interface {v0, p0}, Lzmq/Pipe$IPipeEvents;->hiccuped(Lzmq/Pipe;)V

    .line 327
    :cond_39
    return-void
.end method

.method protected processPipeTerm()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 337
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_1c

    .line 338
    iget-boolean v0, p0, Lzmq/Pipe;->delay:Z

    if-nez v0, :cond_17

    .line 339
    sget-object v0, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 340
    iput-object v2, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 341
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    .line 370
    :cond_16
    :goto_16
    return-void

    .line 344
    :cond_17
    sget-object v0, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    goto :goto_16

    .line 351
    :cond_1c
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->DELIMITED:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_2e

    .line 352
    sget-object v0, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 353
    iput-object v2, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 354
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    goto :goto_16

    .line 361
    :cond_2e
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_40

    .line 362
    sget-object v0, Lzmq/Pipe$State;->DOUBLE_TERMINATED:Lzmq/Pipe$State;

    iput-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 363
    iput-object v2, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 364
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    goto :goto_16

    .line 369
    :cond_40
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected processPipeTermAck()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 376
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    if-nez v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 377
    :cond_f
    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    invoke-interface {v0, p0}, Lzmq/Pipe$IPipeEvents;->pipeTerminated(Lzmq/Pipe;)V

    .line 383
    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    if-ne v0, v1, :cond_2c

    .line 384
    iput-object v2, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 385
    iget-object v0, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v0}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    .line 396
    :cond_21
    iget-object v0, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {v0}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_21

    .line 400
    iput-object v2, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    .line 403
    return-void

    .line 388
    :cond_2c
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    if-eq v0, v1, :cond_21

    iget-object v0, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v1, Lzmq/Pipe$State;->DOUBLE_TERMINATED:Lzmq/Pipe$State;

    if-eq v0, v1, :cond_21

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public read()Lzmq/Msg;
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 196
    iget-boolean v2, p0, Lzmq/Pipe;->inActive:Z

    if-eqz v2, :cond_11

    iget-object v2, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v3, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-eq v2, v3, :cond_13

    iget-object v2, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v3, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-eq v2, v3, :cond_13

    :cond_11
    move-object v0, v1

    .line 221
    :cond_12
    :goto_12
    return-object v0

    .line 200
    :cond_13
    iget-object v2, p0, Lzmq/Pipe;->inpipe:Lzmq/YPipe;

    invoke-virtual {v2}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Msg;

    .line 202
    .local v0, "msg":Lzmq/Msg;
    if-nez v0, :cond_22

    .line 203
    const/4 v2, 0x0

    iput-boolean v2, p0, Lzmq/Pipe;->inActive:Z

    move-object v0, v1

    .line 204
    goto :goto_12

    .line 208
    :cond_22
    invoke-virtual {v0}, Lzmq/Msg;->isDelimiter()Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 209
    invoke-direct {p0}, Lzmq/Pipe;->delimit()V

    move-object v0, v1

    .line 210
    goto :goto_12

    .line 213
    :cond_2d
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    if-nez v1, :cond_3a

    .line 214
    iget-wide v1, p0, Lzmq/Pipe;->msgsRead:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lzmq/Pipe;->msgsRead:J

    .line 217
    :cond_3a
    iget v1, p0, Lzmq/Pipe;->lwm:I

    if-lez v1, :cond_12

    iget-wide v1, p0, Lzmq/Pipe;->msgsRead:J

    iget v3, p0, Lzmq/Pipe;->lwm:I

    int-to-long v3, v3

    rem-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_12

    .line 218
    iget-object v1, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    iget-wide v2, p0, Lzmq/Pipe;->msgsRead:J

    invoke-virtual {p0, v1, v2, v3}, Lzmq/Pipe;->sendActivateWrite(Lzmq/Pipe;J)V

    goto :goto_12
.end method

.method public rollback()V
    .registers 3

    .prologue
    .line 265
    iget-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    if-eqz v1, :cond_20

    .line 266
    :cond_4
    iget-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->unwrite()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Msg;

    .local v0, "msg":Lzmq/Msg;
    if-eqz v0, :cond_20

    .line 267
    sget-boolean v1, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v1, :cond_4

    invoke-virtual {v0}, Lzmq/Msg;->flags()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    if-gtz v1, :cond_4

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 270
    .end local v0    # "msg":Lzmq/Msg;
    :cond_20
    return-void
.end method

.method public setEventSink(Lzmq/Pipe$IPipeEvents;)V
    .registers 3
    .param p1, "sink"    # Lzmq/Pipe$IPipeEvents;

    .prologue
    .line 153
    sget-boolean v0, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 154
    :cond_e
    iput-object p1, p0, Lzmq/Pipe;->sink:Lzmq/Pipe$IPipeEvents;

    .line 155
    return-void
.end method

.method public setIdentity(Lzmq/Blob;)V
    .registers 2
    .param p1, "identity"    # Lzmq/Blob;

    .prologue
    .line 160
    iput-object p1, p0, Lzmq/Pipe;->identity:Lzmq/Blob;

    .line 161
    return-void
.end method

.method public terminate(Z)V
    .registers 6
    .param p1, "delay"    # Z

    .prologue
    const/4 v3, 0x0

    .line 412
    iput-boolean p1, p0, Lzmq/Pipe;->delay:Z

    .line 415
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    if-eq v1, v2, :cond_f

    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->DOUBLE_TERMINATED:Lzmq/Pipe$State;

    if-ne v1, v2, :cond_10

    .line 467
    :cond_f
    :goto_f
    return-void

    .line 420
    :cond_10
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    if-eq v1, v2, :cond_f

    .line 425
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->ACTIVE:Lzmq/Pipe$State;

    if-ne v1, v2, :cond_3f

    .line 426
    iget-object v1, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v1}, Lzmq/Pipe;->sendPipeTerm(Lzmq/Pipe;)V

    .line 427
    sget-object v1, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    iput-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    .line 453
    :cond_25
    :goto_25
    iput-boolean v3, p0, Lzmq/Pipe;->outActive:Z

    .line 455
    iget-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    if-eqz v1, :cond_f

    .line 457
    invoke-virtual {p0}, Lzmq/Pipe;->rollback()V

    .line 462
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0}, Lzmq/Msg;-><init>()V

    .line 463
    .local v0, "msg":Lzmq/Msg;
    invoke-virtual {v0}, Lzmq/Msg;->initDelimiter()V

    .line 464
    iget-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v1, v0, v3}, Lzmq/YPipe;->write(Ljava/lang/Object;Z)V

    .line 465
    invoke-virtual {p0}, Lzmq/Pipe;->flush()V

    goto :goto_f

    .line 431
    .end local v0    # "msg":Lzmq/Msg;
    :cond_3f
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-ne v1, v2, :cond_56

    iget-boolean v1, p0, Lzmq/Pipe;->delay:Z

    if-nez v1, :cond_56

    .line 432
    const/4 v1, 0x0

    iput-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    .line 433
    iget-object v1, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v1}, Lzmq/Pipe;->sendPipeTermAck(Lzmq/Pipe;)V

    .line 434
    sget-object v1, Lzmq/Pipe$State;->TERMINATING:Lzmq/Pipe$State;

    iput-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    goto :goto_25

    .line 437
    :cond_56
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->PENDING:Lzmq/Pipe$State;

    if-eq v1, v2, :cond_25

    .line 443
    iget-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    sget-object v2, Lzmq/Pipe$State;->DELIMITED:Lzmq/Pipe$State;

    if-ne v1, v2, :cond_6c

    .line 444
    iget-object v1, p0, Lzmq/Pipe;->peer:Lzmq/Pipe;

    invoke-virtual {p0, v1}, Lzmq/Pipe;->sendPipeTerm(Lzmq/Pipe;)V

    .line 445
    sget-object v1, Lzmq/Pipe$State;->TERMINATED:Lzmq/Pipe$State;

    iput-object v1, p0, Lzmq/Pipe;->state:Lzmq/Pipe$State;

    goto :goto_25

    .line 449
    :cond_6c
    sget-boolean v1, Lzmq/Pipe;->$assertionsDisabled:Z

    if-nez v1, :cond_25

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 547
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/Pipe;->parent:Lzmq/ZObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lzmq/Msg;)Z
    .registers 7
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 246
    invoke-virtual {p0}, Lzmq/Pipe;->checkWrite()Z

    move-result v1

    if-nez v1, :cond_8

    .line 247
    const/4 v1, 0x0

    .line 257
    :goto_7
    return v1

    .line 250
    :cond_8
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    .line 251
    .local v0, "more":Z
    iget-object v1, p0, Lzmq/Pipe;->outpipe:Lzmq/YPipe;

    invoke-virtual {v1, p1, v0}, Lzmq/YPipe;->write(Ljava/lang/Object;Z)V

    .line 253
    if-nez v0, :cond_1a

    .line 254
    iget-wide v1, p0, Lzmq/Pipe;->msgsWritten:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lzmq/Pipe;->msgsWritten:J

    .line 257
    :cond_1a
    const/4 v1, 0x1

    goto :goto_7
.end method
