.class public Lzmq/Ctx;
.super Ljava/lang/Object;
.source "Ctx.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Ctx$Endpoint;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final REAPER_TID:I = 0x1

.field public static final TERM_TID:I

.field private static maxSocketId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private blocky:Z

.field private final emptySlots:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final endpoints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lzmq/Ctx$Endpoint;",
            ">;"
        }
    .end annotation
.end field

.field private final endpointsSync:Ljava/util/concurrent/locks/Lock;

.field private ioThreadCount:I

.field private final ioThreads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lzmq/IOThread;",
            ">;"
        }
    .end annotation
.end field

.field private maxSockets:I

.field private final optSync:Ljava/util/concurrent/locks/Lock;

.field private reaper:Lzmq/Reaper;

.field private slotCount:I

.field private final slotSync:Ljava/util/concurrent/locks/Lock;

.field private slots:[Lzmq/Mailbox;

.field private final sockets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lzmq/SocketBase;",
            ">;"
        }
    .end annotation
.end field

.field private starting:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private tag:I

.field private final termMailbox:Lzmq/Mailbox;

.field private terminating:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 39
    const-class v0, Lzmq/Ctx;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_a
    sput-boolean v0, Lzmq/Ctx;->$assertionsDisabled:Z

    .line 101
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lzmq/Ctx;->maxSocketId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void

    :cond_14
    move v0, v1

    .line 39
    goto :goto_a
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lzmq/Ctx;->starting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 120
    const v0, -0x54523502

    iput v0, p0, Lzmq/Ctx;->tag:I

    .line 121
    iput-boolean v2, p0, Lzmq/Ctx;->terminating:Z

    .line 122
    iput-object v3, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    .line 123
    iput v2, p0, Lzmq/Ctx;->slotCount:I

    .line 124
    iput-object v3, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    .line 125
    const/16 v0, 0x400

    iput v0, p0, Lzmq/Ctx;->maxSockets:I

    .line 126
    iput v1, p0, Lzmq/Ctx;->ioThreadCount:I

    .line 127
    iput-boolean v1, p0, Lzmq/Ctx;->blocky:Z

    .line 128
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    .line 129
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    .line 130
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    .line 132
    new-instance v0, Lzmq/Mailbox;

    const-string v1, "terminater"

    invoke-direct {v0, v1}, Lzmq/Mailbox;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/Ctx;->termMailbox:Lzmq/Mailbox;

    .line 134
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    .line 136
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    .line 137
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lzmq/Ctx;->endpoints:Ljava/util/Map;

    .line 138
    return-void
.end method

.method private destroy()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v2, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/IOThread;

    .line 143
    .local v1, "it":Lzmq/IOThread;
    invoke-virtual {v1}, Lzmq/IOThread;->stop()V

    goto :goto_6

    .line 145
    .end local v1    # "it":Lzmq/IOThread;
    :cond_16
    iget-object v2, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/IOThread;

    .line 146
    .restart local v1    # "it":Lzmq/IOThread;
    invoke-virtual {v1}, Lzmq/IOThread;->close()V

    goto :goto_1c

    .line 149
    .end local v1    # "it":Lzmq/IOThread;
    :cond_2c
    iget-object v2, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    if-eqz v2, :cond_35

    .line 150
    iget-object v2, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    invoke-virtual {v2}, Lzmq/Reaper;->close()V

    .line 152
    :cond_35
    iget-object v2, p0, Lzmq/Ctx;->termMailbox:Lzmq/Mailbox;

    invoke-virtual {v2}, Lzmq/Mailbox;->close()V

    .line 154
    const v2, -0x21524111

    iput v2, p0, Lzmq/Ctx;->tag:I

    .line 155
    return-void
.end method


# virtual methods
.method public checkTag()Z
    .registers 3

    .prologue
    .line 160
    iget v0, p0, Lzmq/Ctx;->tag:I

    const v1, -0x54523502

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method chooseIoThread(J)Lzmq/IOThread;
    .registers 11
    .param p1, "affinity"    # J

    .prologue
    const-wide/16 v6, 0x0

    .line 396
    iget-object v4, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 397
    const/4 v3, 0x0

    .line 413
    :cond_b
    return-object v3

    .line 401
    :cond_c
    const/4 v2, -0x1

    .line 402
    .local v2, "minLoad":I
    const/4 v3, 0x0

    .line 404
    .local v3, "selectedIoThread":Lzmq/IOThread;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget-object v4, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-eq v0, v4, :cond_b

    .line 405
    cmp-long v4, p1, v6

    if-eqz v4, :cond_23

    const-wide/16 v4, 0x1

    shl-long/2addr v4, v0

    and-long/2addr v4, p1

    cmp-long v4, v4, v6

    if-lez v4, :cond_3c

    .line 406
    :cond_23
    iget-object v4, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzmq/IOThread;

    invoke-virtual {v4}, Lzmq/IOThread;->getLoad()I

    move-result v1

    .line 407
    .local v1, "load":I
    if-eqz v3, :cond_33

    if-ge v1, v2, :cond_3c

    .line 408
    :cond_33
    move v2, v1

    .line 409
    iget-object v4, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "selectedIoThread":Lzmq/IOThread;
    check-cast v3, Lzmq/IOThread;

    .line 404
    .end local v1    # "load":I
    .restart local v3    # "selectedIoThread":Lzmq/IOThread;
    :cond_3c
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public createSocket(I)Lzmq/SocketBase;
    .registers 13
    .param p1, "type"    # I

    .prologue
    const/4 v8, 0x0

    .line 277
    const/4 v4, 0x0

    .line 278
    .local v4, "s":Lzmq/SocketBase;
    iget-object v7, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 280
    :try_start_7
    iget-object v7, p0, Lzmq/Ctx;->starting:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v7

    if-eqz v7, :cond_8e

    .line 285
    iget-object v7, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_6e

    .line 287
    :try_start_16
    iget v3, p0, Lzmq/Ctx;->maxSockets:I

    .line 288
    .local v3, "mazmq":I
    iget v2, p0, Lzmq/Ctx;->ioThreadCount:I
    :try_end_1a
    .catchall {:try_start_16 .. :try_end_1a} :catchall_67

    .line 291
    .local v2, "ios":I
    :try_start_1a
    iget-object v7, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 293
    add-int v7, v3, v2

    add-int/lit8 v7, v7, 0x2

    iput v7, p0, Lzmq/Ctx;->slotCount:I

    .line 294
    iget v7, p0, Lzmq/Ctx;->slotCount:I

    new-array v7, v7, [Lzmq/Mailbox;

    iput-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    .line 298
    iget-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    const/4 v9, 0x0

    iget-object v10, p0, Lzmq/Ctx;->termMailbox:Lzmq/Mailbox;

    aput-object v10, v7, v9

    .line 301
    new-instance v7, Lzmq/Reaper;

    const/4 v9, 0x1

    invoke-direct {v7, p0, v9}, Lzmq/Reaper;-><init>(Lzmq/Ctx;I)V

    iput-object v7, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    .line 303
    iget-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    const/4 v9, 0x1

    iget-object v10, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    invoke-virtual {v10}, Lzmq/Reaper;->getMailbox()Lzmq/Mailbox;

    move-result-object v10

    aput-object v10, v7, v9

    .line 304
    iget-object v7, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    invoke-virtual {v7}, Lzmq/Reaper;->start()V

    .line 307
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_4b
    add-int/lit8 v7, v2, 0x2

    if-eq v0, v7, :cond_75

    .line 308
    new-instance v1, Lzmq/IOThread;

    invoke-direct {v1, p0, v0}, Lzmq/IOThread;-><init>(Lzmq/Ctx;I)V

    .line 310
    .local v1, "ioThread":Lzmq/IOThread;
    iget-object v7, p0, Lzmq/Ctx;->ioThreads:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    iget-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    invoke-virtual {v1}, Lzmq/IOThread;->getMailbox()Lzmq/Mailbox;

    move-result-object v9

    aput-object v9, v7, v0

    .line 312
    invoke-virtual {v1}, Lzmq/IOThread;->start()V

    .line 307
    add-int/lit8 v0, v0, 0x1

    goto :goto_4b

    .line 291
    .end local v0    # "i":I
    .end local v1    # "ioThread":Lzmq/IOThread;
    .end local v2    # "ios":I
    .end local v3    # "mazmq":I
    :catchall_67
    move-exception v7

    iget-object v8, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7
    :try_end_6e
    .catchall {:try_start_1a .. :try_end_6e} :catchall_6e

    .line 349
    :catchall_6e
    move-exception v7

    iget-object v8, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7

    .line 316
    .restart local v0    # "i":I
    .restart local v2    # "ios":I
    .restart local v3    # "mazmq":I
    :cond_75
    :try_start_75
    iget v7, p0, Lzmq/Ctx;->slotCount:I

    add-int/lit8 v0, v7, -0x1

    .line 317
    :goto_79
    add-int/lit8 v7, v2, 0x2

    if-lt v0, v7, :cond_8e

    .line 318
    iget-object v7, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 319
    iget-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    const/4 v9, 0x0

    aput-object v9, v7, v0

    .line 317
    add-int/lit8 v0, v0, -0x1

    goto :goto_79

    .line 324
    .end local v0    # "i":I
    .end local v2    # "ios":I
    .end local v3    # "mazmq":I
    :cond_8e
    iget-boolean v7, p0, Lzmq/Ctx;->terminating:Z

    if-eqz v7, :cond_98

    .line 325
    new-instance v7, Lzmq/ZError$CtxTerminatedException;

    invoke-direct {v7}, Lzmq/ZError$CtxTerminatedException;-><init>()V

    throw v7

    .line 329
    :cond_98
    iget-object v7, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    invoke-interface {v7}, Ljava/util/Deque;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a8

    .line 330
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "EMFILE"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 334
    :cond_a8
    iget-object v7, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    invoke-interface {v7}, Ljava/util/Deque;->pollLast()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 337
    .local v6, "slot":I
    sget-object v7, Lzmq/Ctx;->maxSocketId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v5

    .line 340
    .local v5, "sid":I
    invoke-static {p1, p0, v6, v5}, Lzmq/SocketBase;->create(ILzmq/Ctx;II)Lzmq/SocketBase;

    move-result-object v4

    .line 341
    if-nez v4, :cond_d0

    .line 342
    iget-object v7, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V
    :try_end_c9
    .catchall {:try_start_75 .. :try_end_c9} :catchall_6e

    .line 349
    iget-object v7, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v4, v8

    .line 352
    .end local v4    # "s":Lzmq/SocketBase;
    :goto_cf
    return-object v4

    .line 345
    .restart local v4    # "s":Lzmq/SocketBase;
    :cond_d0
    :try_start_d0
    iget-object v7, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    iget-object v7, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    invoke-virtual {v4}, Lzmq/SocketBase;->getMailbox()Lzmq/Mailbox;

    move-result-object v8

    aput-object v8, v7, v6
    :try_end_dd
    .catchall {:try_start_d0 .. :try_end_dd} :catchall_6e

    .line 349
    iget-object v7, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_cf
.end method

.method public destroySocket(Lzmq/SocketBase;)V
    .registers 5
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 357
    iget-object v1, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 361
    :try_start_5
    invoke-virtual {p1}, Lzmq/SocketBase;->getTid()I

    move-result v0

    .line 362
    .local v0, "tid":I
    iget-object v1, p0, Lzmq/Ctx;->emptySlots:Ljava/util/Deque;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 363
    iget-object v1, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 366
    iget-object v1, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 370
    iget-boolean v1, p0, Lzmq/Ctx;->terminating:Z

    if-eqz v1, :cond_2d

    iget-object v1, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 371
    iget-object v1, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    invoke-virtual {v1}, Lzmq/Reaper;->stop()V
    :try_end_2d
    .catchall {:try_start_5 .. :try_end_2d} :catchall_33

    .line 375
    :cond_2d
    iget-object v1, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 377
    return-void

    .line 375
    .end local v0    # "tid":I
    :catchall_33
    move-exception v1

    iget-object v2, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method findEndpoint(Ljava/lang/String;)Lzmq/Ctx$Endpoint;
    .registers 7
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 454
    const/4 v1, 0x0

    .line 455
    .local v1, "endpoint":Lzmq/Ctx$Endpoint;
    iget-object v2, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 458
    :try_start_6
    iget-object v2, p0, Lzmq/Ctx;->endpoints:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lzmq/Ctx$Endpoint;

    move-object v1, v0

    .line 459
    if-nez v1, :cond_24

    .line 461
    new-instance v2, Lzmq/Ctx$Endpoint;

    const/4 v3, 0x0

    new-instance v4, Lzmq/Options;

    invoke-direct {v4}, Lzmq/Options;-><init>()V

    invoke-direct {v2, v3, v4}, Lzmq/Ctx$Endpoint;-><init>(Lzmq/SocketBase;Lzmq/Options;)V
    :try_end_1d
    .catchall {:try_start_6 .. :try_end_1d} :catchall_2f

    .line 471
    iget-object v3, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v1, v2

    .line 473
    .end local v1    # "endpoint":Lzmq/Ctx$Endpoint;
    :goto_23
    return-object v1

    .line 468
    .restart local v1    # "endpoint":Lzmq/Ctx$Endpoint;
    :cond_24
    :try_start_24
    iget-object v2, v1, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    invoke-virtual {v2}, Lzmq/SocketBase;->incSeqnum()V
    :try_end_29
    .catchall {:try_start_24 .. :try_end_29} :catchall_2f

    .line 471
    iget-object v2, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_23

    :catchall_2f
    move-exception v2

    iget-object v3, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method

.method public get(I)I
    .registers 6
    .param p1, "option"    # I

    .prologue
    const/4 v1, 0x1

    .line 259
    const/4 v0, 0x0

    .line 260
    .local v0, "rc":I
    const/4 v2, 0x2

    if-ne p1, v2, :cond_8

    .line 261
    iget v0, p0, Lzmq/Ctx;->maxSockets:I

    .line 272
    :goto_7
    return v0

    .line 263
    :cond_8
    if-ne p1, v1, :cond_d

    .line 264
    iget v0, p0, Lzmq/Ctx;->ioThreadCount:I

    goto :goto_7

    .line 266
    :cond_d
    const/16 v2, 0x46

    if-ne p1, v2, :cond_19

    .line 267
    iget-boolean v2, p0, Lzmq/Ctx;->blocky:Z

    if-eqz v2, :cond_17

    move v0, v1

    :goto_16
    goto :goto_7

    :cond_17
    const/4 v0, 0x0

    goto :goto_16

    .line 270
    :cond_19
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "option = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getReaper()Lzmq/ZObject;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    return-object v0
.end method

.method registerEndpoint(Ljava/lang/String;Lzmq/Ctx$Endpoint;)Z
    .registers 6
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "endpoint"    # Lzmq/Ctx$Endpoint;

    .prologue
    .line 419
    iget-object v1, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 421
    const/4 v0, 0x0

    .line 423
    .local v0, "inserted":Lzmq/Ctx$Endpoint;
    :try_start_6
    iget-object v1, p0, Lzmq/Ctx;->endpoints:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "inserted":Lzmq/Ctx$Endpoint;
    check-cast v0, Lzmq/Ctx$Endpoint;
    :try_end_e
    .catchall {:try_start_6 .. :try_end_e} :catchall_17

    .line 426
    .restart local v0    # "inserted":Lzmq/Ctx$Endpoint;
    iget-object v1, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 428
    if-eqz v0, :cond_1e

    .line 429
    const/4 v1, 0x0

    .line 431
    :goto_16
    return v1

    .line 426
    .end local v0    # "inserted":Lzmq/Ctx$Endpoint;
    :catchall_17
    move-exception v1

    iget-object v2, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1

    .line 431
    .restart local v0    # "inserted":Lzmq/Ctx$Endpoint;
    :cond_1e
    const/4 v1, 0x1

    goto :goto_16
.end method

.method sendCommand(ILzmq/Command;)V
    .registers 4
    .param p1, "tid"    # I
    .param p2, "command"    # Lzmq/Command;

    .prologue
    .line 388
    iget-object v0, p0, Lzmq/Ctx;->slots:[Lzmq/Mailbox;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Lzmq/Mailbox;->send(Lzmq/Command;)V

    .line 389
    return-void
.end method

.method public set(II)Z
    .registers 6
    .param p1, "option"    # I
    .param p2, "optval"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 222
    const/4 v2, 0x2

    if-ne p1, v2, :cond_1b

    if-lt p2, v0, :cond_1b

    .line 223
    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 225
    :try_start_c
    iput p2, p0, Lzmq/Ctx;->maxSockets:I
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_14

    .line 228
    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 254
    :goto_13
    return v0

    .line 228
    :catchall_14
    move-exception v0

    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    .line 232
    :cond_1b
    if-ne p1, v0, :cond_33

    if-ltz p2, :cond_33

    .line 233
    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 235
    :try_start_24
    iput p2, p0, Lzmq/Ctx;->ioThreadCount:I
    :try_end_26
    .catchall {:try_start_24 .. :try_end_26} :catchall_2c

    .line 238
    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_13

    :catchall_2c
    move-exception v0

    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    .line 242
    :cond_33
    const/16 v2, 0x46

    if-ne p1, v2, :cond_50

    if-ltz p2, :cond_50

    .line 243
    iget-object v2, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 245
    if-eqz p2, :cond_41

    move v1, v0

    :cond_41
    :try_start_41
    iput-boolean v1, p0, Lzmq/Ctx;->blocky:Z
    :try_end_43
    .catchall {:try_start_41 .. :try_end_43} :catchall_49

    .line 248
    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_13

    :catchall_49
    move-exception v0

    iget-object v1, p0, Lzmq/Ctx;->optSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0

    :cond_50
    move v0, v1

    .line 252
    goto :goto_13
.end method

.method public terminate()V
    .registers 9

    .prologue
    .line 170
    const v5, -0x21524111

    iput v5, p0, Lzmq/Ctx;->tag:I

    .line 172
    iget-object v5, p0, Lzmq/Ctx;->starting:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-nez v5, :cond_8d

    .line 173
    iget-object v5, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 177
    :try_start_12
    iget-boolean v3, p0, Lzmq/Ctx;->terminating:Z

    .line 178
    .local v3, "restarted":Z
    const/4 v5, 0x1

    iput-boolean v5, p0, Lzmq/Ctx;->terminating:Z

    .line 181
    if-nez v3, :cond_43

    .line 185
    iget-object v5, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzmq/SocketBase;

    .line 186
    .local v4, "socket":Lzmq/SocketBase;
    invoke-virtual {v4}, Lzmq/SocketBase;->stop()V
    :try_end_2e
    .catchall {:try_start_12 .. :try_end_2e} :catchall_2f

    goto :goto_1f

    .line 194
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "restarted":Z
    .end local v4    # "socket":Lzmq/SocketBase;
    :catchall_2f
    move-exception v5

    iget-object v6, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5

    .line 188
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "restarted":Z
    :cond_36
    :try_start_36
    iget-object v5, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_43

    .line 189
    iget-object v5, p0, Lzmq/Ctx;->reaper:Lzmq/Reaper;

    invoke-virtual {v5}, Lzmq/Reaper;->stop()V
    :try_end_43
    .catchall {:try_start_36 .. :try_end_43} :catchall_2f

    .line 194
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_43
    iget-object v5, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 197
    iget-object v5, p0, Lzmq/Ctx;->termMailbox:Lzmq/Mailbox;

    const-wide/16 v6, -0x1

    invoke-virtual {v5, v6, v7}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    .line 198
    .local v0, "cmd":Lzmq/Command;
    if-nez v0, :cond_58

    .line 199
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 201
    :cond_58
    sget-boolean v5, Lzmq/Ctx;->$assertionsDisabled:Z

    if-nez v5, :cond_6a

    invoke-virtual {v0}, Lzmq/Command;->type()Lzmq/Command$Type;

    move-result-object v5

    sget-object v6, Lzmq/Command$Type;->DONE:Lzmq/Command$Type;

    if-eq v5, v6, :cond_6a

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 202
    :cond_6a
    iget-object v5, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 204
    :try_start_6f
    sget-boolean v5, Lzmq/Ctx;->$assertionsDisabled:Z

    if-nez v5, :cond_88

    iget-object v5, p0, Lzmq/Ctx;->sockets:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_88

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5
    :try_end_81
    .catchall {:try_start_6f .. :try_end_81} :catchall_81

    .line 207
    :catchall_81
    move-exception v5

    iget-object v6, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5

    :cond_88
    iget-object v5, p0, Lzmq/Ctx;->slotSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 213
    .end local v0    # "cmd":Lzmq/Command;
    .end local v3    # "restarted":Z
    :cond_8d
    :try_start_8d
    invoke-direct {p0}, Lzmq/Ctx;->destroy()V
    :try_end_90
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_90} :catch_91

    .line 218
    return-void

    .line 215
    :catch_91
    move-exception v1

    .line 216
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method unregisterEndpoints(Lzmq/SocketBase;)V
    .registers 6
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 436
    iget-object v2, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 439
    :try_start_5
    iget-object v2, p0, Lzmq/Ctx;->endpoints:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 440
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Ctx$Endpoint;>;>;"
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 441
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 442
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Ctx$Endpoint;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Ctx$Endpoint;

    iget-object v2, v2, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    if-ne v2, p1, :cond_f

    .line 443
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_28
    .catchall {:try_start_5 .. :try_end_28} :catchall_29

    goto :goto_f

    .line 448
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Ctx$Endpoint;>;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Ctx$Endpoint;>;>;"
    :catchall_29
    move-exception v2

    iget-object v3, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lzmq/Ctx$Endpoint;>;>;"
    :cond_30
    iget-object v2, p0, Lzmq/Ctx;->endpointsSync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 450
    return-void
.end method
