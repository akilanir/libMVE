.class public Lzmq/Router;
.super Lzmq/SocketBase;
.source "Router.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Router$Outpipe;,
        Lzmq/Router$RouterSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final anonymousPipes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field

.field private currentOut:Lzmq/Pipe;

.field private final fq:Lzmq/FQ;

.field private handover:Z

.field private identitySent:Z

.field private mandatory:Z

.field private moreIn:Z

.field private moreOut:Z

.field private nextPeerId:I

.field private final outpipes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lzmq/Blob;",
            "Lzmq/Router$Outpipe;",
            ">;"
        }
    .end annotation
.end field

.field private prefetched:Z

.field private prefetchedId:Lzmq/Msg;

.field private prefetchedMsg:Lzmq/Msg;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-class v0, Lzmq/Router;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Router;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 6
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    const/4 v1, 0x0

    .line 96
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 97
    iput-boolean v1, p0, Lzmq/Router;->prefetched:Z

    .line 98
    iput-boolean v1, p0, Lzmq/Router;->identitySent:Z

    .line 99
    iput-boolean v1, p0, Lzmq/Router;->moreIn:Z

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .line 101
    iput-boolean v1, p0, Lzmq/Router;->moreOut:Z

    .line 102
    invoke-static {}, Lzmq/Utils;->generateRandom()I

    move-result v0

    iput v0, p0, Lzmq/Router;->nextPeerId:I

    .line 103
    iput-boolean v1, p0, Lzmq/Router;->mandatory:Z

    .line 104
    iput-boolean v1, p0, Lzmq/Router;->handover:Z

    .line 106
    iget-object v0, p0, Lzmq/Router;->options:Lzmq/Options;

    const/4 v1, 0x6

    iput v1, v0, Lzmq/Options;->type:I

    .line 108
    new-instance v0, Lzmq/FQ;

    invoke-direct {v0}, Lzmq/FQ;-><init>()V

    iput-object v0, p0, Lzmq/Router;->fq:Lzmq/FQ;

    .line 109
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0}, Lzmq/Msg;-><init>()V

    iput-object v0, p0, Lzmq/Router;->prefetchedId:Lzmq/Msg;

    .line 110
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0}, Lzmq/Msg;-><init>()V

    iput-object v0, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    .line 112
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lzmq/Router;->anonymousPipes:Ljava/util/Set;

    .line 113
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    .line 121
    iget-object v0, p0, Lzmq/Router;->options:Lzmq/Options;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lzmq/Options;->recvIdentity:Z

    .line 122
    return-void
.end method

.method private identifyPeer(Lzmq/Pipe;)Z
    .registers 12
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    const/4 v9, 0x5

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 376
    invoke-virtual {p1}, Lzmq/Pipe;->read()Lzmq/Msg;

    move-result-object v3

    .line 377
    .local v3, "msg":Lzmq/Msg;
    if-nez v3, :cond_a

    .line 419
    :cond_9
    :goto_9
    return v6

    .line 381
    :cond_a
    invoke-virtual {v3}, Lzmq/Msg;->size()I

    move-result v8

    if-nez v8, :cond_37

    .line 383
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 384
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 385
    iget v8, p0, Lzmq/Router;->nextPeerId:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lzmq/Router;->nextPeerId:I

    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 386
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    invoke-static {v8, v6}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v2

    .line 414
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .local v2, "identity":Lzmq/Blob;
    :cond_28
    :goto_28
    invoke-virtual {p1, v2}, Lzmq/Pipe;->setIdentity(Lzmq/Blob;)V

    .line 416
    new-instance v5, Lzmq/Router$Outpipe;

    invoke-direct {v5, p0, p1, v7}, Lzmq/Router$Outpipe;-><init>(Lzmq/Router;Lzmq/Pipe;Z)V

    .line 417
    .local v5, "outpipe":Lzmq/Router$Outpipe;
    iget-object v6, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v6, v7

    .line 419
    goto :goto_9

    .line 389
    .end local v2    # "identity":Lzmq/Blob;
    .end local v5    # "outpipe":Lzmq/Router$Outpipe;
    :cond_37
    invoke-virtual {v3}, Lzmq/Msg;->data()[B

    move-result-object v8

    invoke-static {v8, v7}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v2

    .line 391
    .restart local v2    # "identity":Lzmq/Blob;
    iget-object v8, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v8, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_28

    .line 392
    iget-boolean v8, p0, Lzmq/Router;->handover:Z

    if-eqz v8, :cond_9

    .line 398
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 399
    .restart local v0    # "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 400
    iget v8, p0, Lzmq/Router;->nextPeerId:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lzmq/Router;->nextPeerId:I

    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 401
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    invoke-static {v8, v6}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v4

    .line 405
    .local v4, "newIdentity":Lzmq/Blob;
    iget-object v6, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v6, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/Router$Outpipe;

    .line 406
    .local v1, "existingOutpipe":Lzmq/Router$Outpipe;
    # getter for: Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;
    invoke-static {v1}, Lzmq/Router$Outpipe;->access$000(Lzmq/Router$Outpipe;)Lzmq/Pipe;

    move-result-object v6

    invoke-virtual {v6, v4}, Lzmq/Pipe;->setIdentity(Lzmq/Blob;)V

    .line 408
    iget-object v6, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v6, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    # getter for: Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;
    invoke-static {v1}, Lzmq/Router$Outpipe;->access$000(Lzmq/Router$Outpipe;)Lzmq/Pipe;

    move-result-object v6

    invoke-virtual {v6, v7}, Lzmq/Pipe;->terminate(Z)V

    goto :goto_28
.end method


# virtual methods
.method protected rollback()V
    .registers 2

    .prologue
    .line 313
    iget-object v0, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    if-eqz v0, :cond_f

    .line 314
    iget-object v0, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->rollback()V

    .line 315
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .line 316
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/Router;->moreOut:Z

    .line 318
    :cond_f
    return-void
.end method

.method public xattachPipe(Lzmq/Pipe;Z)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 127
    sget-boolean v1, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v1, :cond_c

    if-nez p1, :cond_c

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 129
    :cond_c
    invoke-direct {p0, p1}, Lzmq/Router;->identifyPeer(Lzmq/Pipe;)Z

    move-result v0

    .line 130
    .local v0, "identityOk":Z
    if-eqz v0, :cond_18

    .line 131
    iget-object v1, p0, Lzmq/Router;->fq:Lzmq/FQ;

    invoke-virtual {v1, p1}, Lzmq/FQ;->attach(Lzmq/Pipe;)V

    .line 136
    :goto_17
    return-void

    .line 134
    :cond_18
    iget-object v1, p0, Lzmq/Router;->anonymousPipes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_17
.end method

.method protected xhasIn()Z
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 325
    iget-boolean v2, p0, Lzmq/Router;->moreIn:Z

    if-eqz v2, :cond_8

    move v2, v3

    .line 360
    :goto_7
    return v2

    .line 330
    :cond_8
    iget-boolean v2, p0, Lzmq/Router;->prefetched:Z

    if-eqz v2, :cond_e

    move v2, v3

    .line 331
    goto :goto_7

    .line 336
    :cond_e
    new-instance v1, Lzmq/ValueReference;

    invoke-direct {v1}, Lzmq/ValueReference;-><init>()V

    .line 337
    .local v1, "pipe":Lzmq/ValueReference;, "Lzmq/ValueReference<Lzmq/Pipe;>;"
    iget-object v2, p0, Lzmq/Router;->fq:Lzmq/FQ;

    iget-object v5, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    invoke-virtual {v2, v5, v1}, Lzmq/FQ;->recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v2

    iput-object v2, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    .line 343
    :goto_1d
    iget-object v2, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    if-eqz v2, :cond_34

    iget-object v2, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    invoke-virtual {v2}, Lzmq/Msg;->isIdentity()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 344
    iget-object v2, p0, Lzmq/Router;->fq:Lzmq/FQ;

    iget-object v5, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    invoke-virtual {v2, v5, v1}, Lzmq/FQ;->recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v2

    iput-object v2, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    goto :goto_1d

    .line 347
    :cond_34
    iget-object v2, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    if-nez v2, :cond_3a

    move v2, v4

    .line 348
    goto :goto_7

    .line 351
    :cond_3a
    sget-boolean v2, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v2, :cond_4a

    invoke-virtual {v1}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_4a

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 353
    :cond_4a
    invoke-virtual {v1}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Pipe;

    invoke-virtual {v2}, Lzmq/Pipe;->getIdentity()Lzmq/Blob;

    move-result-object v0

    .line 354
    .local v0, "identity":Lzmq/Blob;
    new-instance v2, Lzmq/Msg;

    invoke-virtual {v0}, Lzmq/Blob;->data()[B

    move-result-object v5

    invoke-direct {v2, v5}, Lzmq/Msg;-><init>([B)V

    iput-object v2, p0, Lzmq/Router;->prefetchedId:Lzmq/Msg;

    .line 355
    iget-object v2, p0, Lzmq/Router;->prefetchedId:Lzmq/Msg;

    invoke-virtual {v2, v3}, Lzmq/Msg;->setFlags(I)V

    .line 357
    iput-boolean v3, p0, Lzmq/Router;->prefetched:Z

    .line 358
    iput-boolean v4, p0, Lzmq/Router;->identitySent:Z

    move v2, v3

    .line 360
    goto :goto_7
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 369
    const/4 v0, 0x1

    return v0
.end method

.method public xpipeTerminated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 155
    iget-object v1, p0, Lzmq/Router;->anonymousPipes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2c

    .line 156
    iget-object v1, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-virtual {p1}, Lzmq/Pipe;->getIdentity()Lzmq/Blob;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Router$Outpipe;

    .line 157
    .local v0, "old":Lzmq/Router$Outpipe;
    sget-boolean v1, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v1, :cond_20

    if-nez v0, :cond_20

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 159
    :cond_20
    iget-object v1, p0, Lzmq/Router;->fq:Lzmq/FQ;

    invoke-virtual {v1, p1}, Lzmq/FQ;->terminated(Lzmq/Pipe;)V

    .line 160
    iget-object v1, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    if-ne p1, v1, :cond_2c

    .line 161
    const/4 v1, 0x0

    iput-object v1, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .line 164
    .end local v0    # "old":Lzmq/Router$Outpipe;
    :cond_2c
    return-void
.end method

.method public xreadActivated(Lzmq/Pipe;)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 169
    iget-object v1, p0, Lzmq/Router;->anonymousPipes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 170
    iget-object v1, p0, Lzmq/Router;->fq:Lzmq/FQ;

    invoke-virtual {v1, p1}, Lzmq/FQ;->activated(Lzmq/Pipe;)V

    .line 179
    :cond_d
    :goto_d
    return-void

    .line 173
    :cond_e
    invoke-direct {p0, p1}, Lzmq/Router;->identifyPeer(Lzmq/Pipe;)Z

    move-result v0

    .line 174
    .local v0, "identityOk":Z
    if-eqz v0, :cond_d

    .line 175
    iget-object v1, p0, Lzmq/Router;->anonymousPipes:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 176
    iget-object v1, p0, Lzmq/Router;->fq:Lzmq/FQ;

    invoke-virtual {v1, p1}, Lzmq/FQ;->attach(Lzmq/Pipe;)V

    goto :goto_d
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 8

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x1

    .line 257
    const/4 v1, 0x0

    .line 258
    .local v1, "msg":Lzmq/Msg;
    iget-boolean v4, p0, Lzmq/Router;->prefetched:Z

    if-eqz v4, :cond_21

    .line 259
    iget-boolean v4, p0, Lzmq/Router;->identitySent:Z

    if-nez v4, :cond_19

    .line 260
    iget-object v1, p0, Lzmq/Router;->prefetchedId:Lzmq/Msg;

    .line 261
    iput-object v3, p0, Lzmq/Router;->prefetchedId:Lzmq/Msg;

    .line 262
    iput-boolean v6, p0, Lzmq/Router;->identitySent:Z

    .line 269
    :goto_11
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v3

    iput-boolean v3, p0, Lzmq/Router;->moreIn:Z

    move-object v3, v1

    .line 307
    :cond_18
    :goto_18
    return-object v3

    .line 265
    :cond_19
    iget-object v1, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    .line 266
    iput-object v3, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    .line 267
    const/4 v3, 0x0

    iput-boolean v3, p0, Lzmq/Router;->prefetched:Z

    goto :goto_11

    .line 273
    :cond_21
    new-instance v2, Lzmq/ValueReference;

    invoke-direct {v2}, Lzmq/ValueReference;-><init>()V

    .line 274
    .local v2, "pipe":Lzmq/ValueReference;, "Lzmq/ValueReference<Lzmq/Pipe;>;"
    iget-object v4, p0, Lzmq/Router;->fq:Lzmq/FQ;

    iget-object v5, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    invoke-virtual {v4, v5, v2}, Lzmq/FQ;->recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v1

    .line 280
    :goto_2e
    if-eqz v1, :cond_3f

    invoke-virtual {v1}, Lzmq/Msg;->isIdentity()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 281
    iget-object v4, p0, Lzmq/Router;->fq:Lzmq/FQ;

    iget-object v5, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    invoke-virtual {v4, v5, v2}, Lzmq/FQ;->recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v1

    goto :goto_2e

    .line 284
    :cond_3f
    if-eqz v1, :cond_18

    .line 288
    sget-boolean v3, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v3, :cond_51

    invoke-virtual {v2}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_51

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 291
    :cond_51
    iget-boolean v3, p0, Lzmq/Router;->moreIn:Z

    if-eqz v3, :cond_5d

    .line 292
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v3

    iput-boolean v3, p0, Lzmq/Router;->moreIn:Z

    :goto_5b
    move-object v3, v1

    .line 307
    goto :goto_18

    .line 298
    :cond_5d
    iput-object v1, p0, Lzmq/Router;->prefetchedMsg:Lzmq/Msg;

    .line 299
    iput-boolean v6, p0, Lzmq/Router;->prefetched:Z

    .line 301
    invoke-virtual {v2}, Lzmq/ValueReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzmq/Pipe;

    invoke-virtual {v3}, Lzmq/Pipe;->getIdentity()Lzmq/Blob;

    move-result-object v0

    .line 302
    .local v0, "identity":Lzmq/Blob;
    new-instance v1, Lzmq/Msg;

    .end local v1    # "msg":Lzmq/Msg;
    invoke-virtual {v0}, Lzmq/Blob;->data()[B

    move-result-object v3

    invoke-direct {v1, v3}, Lzmq/Msg;-><init>([B)V

    .line 303
    .restart local v1    # "msg":Lzmq/Msg;
    invoke-virtual {v1, v6}, Lzmq/Msg;->setFlags(I)V

    .line 304
    iput-boolean v6, p0, Lzmq/Router;->identitySent:Z

    goto :goto_5b
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 9
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    const/4 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 199
    iget-boolean v5, p0, Lzmq/Router;->moreOut:Z

    if-nez v5, :cond_68

    .line 200
    sget-boolean v5, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v5, :cond_15

    iget-object v5, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    if-eqz v5, :cond_15

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 205
    :cond_15
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v5

    if-eqz v5, :cond_66

    .line 206
    iput-boolean v4, p0, Lzmq/Router;->moreOut:Z

    .line 211
    invoke-virtual {p1}, Lzmq/Msg;->data()[B

    move-result-object v5

    invoke-static {v5, v4}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v0

    .line 212
    .local v0, "identity":Lzmq/Blob;
    iget-object v5, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Router$Outpipe;

    .line 214
    .local v2, "op":Lzmq/Router$Outpipe;
    if-eqz v2, :cond_54

    .line 215
    # getter for: Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;
    invoke-static {v2}, Lzmq/Router$Outpipe;->access$000(Lzmq/Router$Outpipe;)Lzmq/Pipe;

    move-result-object v5

    iput-object v5, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .line 216
    iget-object v5, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    invoke-virtual {v5}, Lzmq/Pipe;->checkWrite()Z

    move-result v5

    if-nez v5, :cond_66

    .line 217
    # setter for: Lzmq/Router$Outpipe;->active:Z
    invoke-static {v2, v3}, Lzmq/Router$Outpipe;->access$102(Lzmq/Router$Outpipe;Z)Z

    .line 218
    iput-object v6, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .line 219
    iget-boolean v5, p0, Lzmq/Router;->mandatory:Z

    if-eqz v5, :cond_66

    .line 220
    iput-boolean v3, p0, Lzmq/Router;->moreOut:Z

    .line 221
    iget-object v4, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    const/16 v5, 0x23

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 251
    .end local v0    # "identity":Lzmq/Blob;
    .end local v2    # "op":Lzmq/Router$Outpipe;
    :goto_53
    return v3

    .line 226
    .restart local v0    # "identity":Lzmq/Blob;
    .restart local v2    # "op":Lzmq/Router$Outpipe;
    :cond_54
    iget-boolean v5, p0, Lzmq/Router;->mandatory:Z

    if-eqz v5, :cond_66

    .line 227
    iput-boolean v3, p0, Lzmq/Router;->moreOut:Z

    .line 228
    iget-object v4, p0, Lzmq/Router;->errno:Lzmq/ValueReference;

    const/16 v5, 0x41

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    goto :goto_53

    .end local v0    # "identity":Lzmq/Blob;
    .end local v2    # "op":Lzmq/Router$Outpipe;
    :cond_66
    move v3, v4

    .line 233
    goto :goto_53

    .line 237
    :cond_68
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v3

    iput-boolean v3, p0, Lzmq/Router;->moreOut:Z

    .line 240
    iget-object v3, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    if-eqz v3, :cond_7c

    .line 241
    iget-object v3, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    invoke-virtual {v3, p1}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v1

    .line 242
    .local v1, "ok":Z
    if-nez v1, :cond_7e

    .line 243
    iput-object v6, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    .end local v1    # "ok":Z
    :cond_7c
    :goto_7c
    move v3, v4

    .line 251
    goto :goto_53

    .line 245
    .restart local v1    # "ok":Z
    :cond_7e
    iget-boolean v3, p0, Lzmq/Router;->moreOut:Z

    if-nez v3, :cond_7c

    .line 246
    iget-object v3, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    invoke-virtual {v3}, Lzmq/Pipe;->flush()V

    .line 247
    iput-object v6, p0, Lzmq/Router;->currentOut:Lzmq/Pipe;

    goto :goto_7c
.end method

.method public xsetsockopt(ILjava/lang/Object;)Z
    .registers 6
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 141
    const/16 v2, 0x21

    if-ne p1, v2, :cond_12

    .line 142
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_f

    move v0, v1

    :cond_f
    iput-boolean v0, p0, Lzmq/Router;->mandatory:Z

    .line 149
    :goto_11
    return v1

    .line 145
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_12
    const/16 v2, 0x38

    if-ne p1, v2, :cond_22

    .line 146
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "optval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_1f

    move v0, v1

    :cond_1f
    iput-boolean v0, p0, Lzmq/Router;->handover:Z

    goto :goto_11

    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_22
    move v1, v0

    .line 149
    goto :goto_11
.end method

.method public xwriteActivated(Lzmq/Pipe;)V
    .registers 6
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 184
    iget-object v2, p0, Lzmq/Router;->outpipes:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 185
    .local v1, "it":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lzmq/Blob;Lzmq/Router$Outpipe;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Router$Outpipe;

    # getter for: Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;
    invoke-static {v2}, Lzmq/Router$Outpipe;->access$000(Lzmq/Router$Outpipe;)Lzmq/Pipe;

    move-result-object v2

    if-ne v2, p1, :cond_a

    .line 186
    sget-boolean v2, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v2, :cond_38

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Router$Outpipe;

    # getter for: Lzmq/Router$Outpipe;->active:Z
    invoke-static {v2}, Lzmq/Router$Outpipe;->access$100(Lzmq/Router$Outpipe;)Z

    move-result v2

    if-eqz v2, :cond_38

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 187
    :cond_38
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Router$Outpipe;

    const/4 v3, 0x1

    # setter for: Lzmq/Router$Outpipe;->active:Z
    invoke-static {v2, v3}, Lzmq/Router$Outpipe;->access$102(Lzmq/Router$Outpipe;Z)Z

    .line 192
    .end local v1    # "it":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lzmq/Blob;Lzmq/Router$Outpipe;>;"
    :cond_42
    return-void

    .line 191
    :cond_43
    sget-boolean v2, Lzmq/Router;->$assertionsDisabled:Z

    if-nez v2, :cond_42

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method
