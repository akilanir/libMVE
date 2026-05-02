.class public Lcom/koushikdutta/async/ByteBufferList;
.super Ljava/lang/Object;
.source "ByteBufferList.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x9
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/ByteBufferList$Reclaimer;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

.field private static final LOCK:Ljava/lang/Object;

.field public static MAX_ITEM_SIZE:I

.field private static MAX_SIZE:I

.field static currentSize:I

.field static maxItem:I

.field static reclaimed:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mBuffers:Lcom/koushikdutta/async/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/ArrayDeque",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field order:Ljava/nio/ByteOrder;

.field private remaining:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 17
    const-class v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_34

    const/4 v0, 0x1

    :goto_a
    sput-boolean v0, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    .line 412
    new-instance v0, Ljava/util/PriorityQueue;

    const/16 v2, 0x8

    new-instance v3, Lcom/koushikdutta/async/ByteBufferList$Reclaimer;

    invoke-direct {v3}, Lcom/koushikdutta/async/ByteBufferList$Reclaimer;-><init>()V

    invoke-direct {v0, v2, v3}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    sput-object v0, Lcom/koushikdutta/async/ByteBufferList;->reclaimed:Ljava/util/PriorityQueue;

    .line 423
    const/high16 v0, 0x100000

    sput v0, Lcom/koushikdutta/async/ByteBufferList;->MAX_SIZE:I

    .line 424
    const/high16 v0, 0x40000

    sput v0, Lcom/koushikdutta/async/ByteBufferList;->MAX_ITEM_SIZE:I

    .line 425
    sput v1, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    .line 426
    sput v1, Lcom/koushikdutta/async/ByteBufferList;->maxItem:I

    .line 483
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/ByteBufferList;->LOCK:Ljava/lang/Object;

    .line 539
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

    return-void

    :cond_34
    move v0, v1

    .line 17
    goto :goto_a
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/koushikdutta/async/ArrayDeque;

    invoke-direct {v0}, Lcom/koushikdutta/async/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    .line 21
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 32
    return-void
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "buf"    # [B

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v1, Lcom/koushikdutta/async/ArrayDeque;

    invoke-direct {v1}, Lcom/koushikdutta/async/ArrayDeque;-><init>()V

    iput-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    .line 21
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    .line 91
    const/4 v1, 0x0

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 40
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 41
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 42
    return-void
.end method

.method public varargs constructor <init>([Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "b"    # [Ljava/nio/ByteBuffer;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/koushikdutta/async/ArrayDeque;

    invoke-direct {v0}, Lcom/koushikdutta/async/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    .line 21
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 35
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/ByteBufferList;->addAll([Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 36
    return-void
.end method

.method private addRemaining(I)V
    .registers 3
    .param p1, "remaining"    # I

    .prologue
    .line 335
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    if-ltz v0, :cond_b

    .line 336
    iget v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 337
    :cond_b
    return-void
.end method

.method private static getReclaimed()Ljava/util/PriorityQueue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/PriorityQueue",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 415
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    .line 416
    .local v0, "mainLooper":Landroid/os/Looper;
    if-eqz v0, :cond_12

    .line 417
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    if-ne v1, v2, :cond_12

    .line 418
    const/4 v1, 0x0

    .line 420
    :goto_11
    return-object v1

    :cond_12
    sget-object v1, Lcom/koushikdutta/async/ByteBufferList;->reclaimed:Ljava/util/PriorityQueue;

    goto :goto_11
.end method

.method public static obtain(I)Ljava/nio/ByteBuffer;
    .registers 8
    .param p0, "size"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 486
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->maxItem:I

    if-gt p0, v2, :cond_56

    .line 487
    invoke-static {}, Lcom/koushikdutta/async/ByteBufferList;->getReclaimed()Ljava/util/PriorityQueue;

    move-result-object v0

    .line 488
    .local v0, "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    if-eqz v0, :cond_56

    .line 489
    sget-object v6, Lcom/koushikdutta/async/ByteBufferList;->LOCK:Ljava/lang/Object;

    monitor-enter v6

    .line 490
    :cond_f
    :try_start_f
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    move-result v2

    if-lez v2, :cond_55

    .line 491
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 492
    .local v1, "ret":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    move-result v2

    if-nez v2, :cond_24

    .line 493
    const/4 v2, 0x0

    sput v2, Lcom/koushikdutta/async/ByteBufferList;->maxItem:I

    .line 494
    :cond_24
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    sub-int/2addr v2, v5

    sput v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    .line 495
    sget-boolean v2, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v2, :cond_4d

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->size()I

    move-result v2

    if-eqz v2, :cond_49

    move v5, v3

    :goto_38
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    if-nez v2, :cond_4b

    move v2, v3

    :goto_3d
    xor-int/2addr v2, v5

    if-nez v2, :cond_4d

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 502
    .end local v1    # "ret":Ljava/nio/ByteBuffer;
    :catchall_46
    move-exception v2

    monitor-exit v6
    :try_end_48
    .catchall {:try_start_f .. :try_end_48} :catchall_46

    throw v2

    .restart local v1    # "ret":Ljava/nio/ByteBuffer;
    :cond_49
    move v5, v4

    .line 495
    goto :goto_38

    :cond_4b
    move v2, v4

    goto :goto_3d

    .line 496
    :cond_4d
    :try_start_4d
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    if-lt v2, p0, :cond_f

    .line 498
    monitor-exit v6

    .line 508
    .end local v0    # "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    :goto_54
    return-object v1

    .line 502
    .end local v1    # "ret":Ljava/nio/ByteBuffer;
    .restart local v0    # "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    :cond_55
    monitor-exit v6
    :try_end_56
    .catchall {:try_start_4d .. :try_end_56} :catchall_46

    .line 507
    .end local v0    # "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    :cond_56
    const/16 v2, 0x2000

    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 508
    .restart local v1    # "ret":Ljava/nio/ByteBuffer;
    goto :goto_54
.end method

.method public static obtainArray([Ljava/nio/ByteBuffer;I)V
    .registers 14
    .param p0, "arr"    # [Ljava/nio/ByteBuffer;
    .param p1, "size"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 512
    invoke-static {}, Lcom/koushikdutta/async/ByteBufferList;->getReclaimed()Ljava/util/PriorityQueue;

    move-result-object v5

    .line 513
    .local v5, "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    const/4 v2, 0x0

    .line 514
    .local v2, "index":I
    const/4 v6, 0x0

    .line 516
    .local v6, "total":I
    if-eqz v5, :cond_7f

    .line 517
    sget-object v11, Lcom/koushikdutta/async/ByteBufferList;->LOCK:Ljava/lang/Object;

    monitor-enter v11

    move v3, v2

    .line 518
    .end local v2    # "index":I
    .local v3, "index":I
    :goto_e
    :try_start_e
    invoke-virtual {v5}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-lez v7, :cond_5c

    if-ge v6, p1, :cond_5c

    array-length v7, p0

    add-int/lit8 v7, v7, -0x1

    if-ge v3, v7, :cond_5c

    .line 519
    invoke-virtual {v5}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 520
    .local v0, "b":Ljava/nio/ByteBuffer;
    sget v7, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    sub-int/2addr v7, v10

    sput v7, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    .line 521
    sget-boolean v7, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v7, :cond_4b

    invoke-virtual {v5}, Ljava/util/PriorityQueue;->size()I

    move-result v7

    if-eqz v7, :cond_47

    move v10, v8

    :goto_35
    sget v7, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    if-nez v7, :cond_49

    move v7, v8

    :goto_3a
    xor-int/2addr v7, v10

    if-nez v7, :cond_4b

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7
    :try_end_43
    .catchall {:try_start_e .. :try_end_43} :catchall_43

    .line 526
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :catchall_43
    move-exception v7

    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    :goto_45
    :try_start_45
    monitor-exit v11
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_7b

    throw v7

    .end local v2    # "index":I
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    .restart local v3    # "index":I
    :cond_47
    move v10, v9

    .line 521
    goto :goto_35

    :cond_49
    move v7, v9

    goto :goto_3a

    .line 522
    :cond_4b
    sub-int v7, p1, v6

    :try_start_4d
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I
    :try_end_54
    .catchall {:try_start_4d .. :try_end_54} :catchall_43

    move-result v4

    .line 523
    .local v4, "needed":I
    add-int/2addr v6, v4

    .line 524
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    :try_start_58
    aput-object v0, p0, v3
    :try_end_5a
    .catchall {:try_start_58 .. :try_end_5a} :catchall_7b

    move v3, v2

    .line 525
    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_e

    .line 526
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v4    # "needed":I
    :cond_5c
    :try_start_5c
    monitor-exit v11
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_43

    .line 529
    :goto_5d
    if-ge v6, p1, :cond_7d

    .line 530
    const/16 v7, 0x2000

    sub-int v8, p1, v6

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 531
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    aput-object v0, p0, v3

    .line 534
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    :goto_6f
    move v1, v2

    .local v1, "i":I
    :goto_70
    array-length v7, p0

    if-ge v1, v7, :cond_7a

    .line 535
    sget-object v7, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

    aput-object v7, p0, v1

    .line 534
    add-int/lit8 v1, v1, 0x1

    goto :goto_70

    .line 537
    :cond_7a
    return-void

    .line 526
    .end local v1    # "i":I
    :catchall_7b
    move-exception v7

    goto :goto_45

    .end local v2    # "index":I
    .restart local v3    # "index":I
    :cond_7d
    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    goto :goto_6f

    :cond_7f
    move v3, v2

    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_5d
.end method

.method private read(I)Ljava/nio/ByteBuffer;
    .registers 11
    .param p1, "count"    # I

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v6

    if-ge v6, p1, :cond_2d

    .line 235
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "count : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 237
    :cond_2d
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    .line 238
    .local v2, "first":Ljava/nio/ByteBuffer;
    :goto_35
    if-eqz v2, :cond_51

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-nez v6, :cond_51

    .line 239
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/nio/ByteBuffer;

    invoke-static {v6}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 240
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "first":Ljava/nio/ByteBuffer;
    check-cast v2, Ljava/nio/ByteBuffer;

    .restart local v2    # "first":Ljava/nio/ByteBuffer;
    goto :goto_35

    .line 243
    :cond_51
    if-nez v2, :cond_56

    .line 244
    sget-object v6, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

    .line 271
    :goto_55
    return-object v6

    .line 247
    :cond_56
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-lt v6, p1, :cond_63

    .line 248
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v6

    goto :goto_55

    .line 251
    :cond_63
    invoke-static {p1}, Lcom/koushikdutta/async/ByteBufferList;->obtain(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 252
    .local v4, "ret":Ljava/nio/ByteBuffer;
    invoke-virtual {v4, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 253
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 254
    .local v1, "bytes":[B
    const/4 v3, 0x0

    .line 255
    .local v3, "offset":I
    const/4 v0, 0x0

    .line 256
    .local v0, "bb":Ljava/nio/ByteBuffer;
    :cond_70
    :goto_70
    if-ge v3, p1, :cond_93

    .line 257
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 258
    .restart local v0    # "bb":Ljava/nio/ByteBuffer;
    sub-int v6, p1, v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 259
    .local v5, "toRead":I
    invoke-virtual {v0, v1, v3, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 260
    add-int/2addr v3, v5

    .line 261
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-nez v6, :cond_70

    .line 262
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 263
    const/4 v0, 0x0

    goto :goto_70

    .line 268
    .end local v5    # "toRead":I
    :cond_93
    if-eqz v0, :cond_a0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-lez v6, :cond_a0

    .line 269
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 270
    :cond_a0
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6, v4}, Lcom/koushikdutta/async/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 271
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v6

    goto :goto_55
.end method

.method public static reclaim(Ljava/nio/ByteBuffer;)V
    .registers 8
    .param p0, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 445
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 481
    :cond_a
    :goto_a
    return-void

    .line 447
    :cond_b
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    if-nez v2, :cond_a

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-ne v2, v5, :cond_a

    .line 449
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    const/16 v5, 0x2000

    if-lt v2, v5, :cond_a

    .line 451
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    sget v5, Lcom/koushikdutta/async/ByteBufferList;->MAX_ITEM_SIZE:I

    if-gt v2, v5, :cond_a

    .line 454
    invoke-static {}, Lcom/koushikdutta/async/ByteBufferList;->getReclaimed()Ljava/util/PriorityQueue;

    move-result-object v1

    .line 455
    .local v1, "r":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Ljava/nio/ByteBuffer;>;"
    if-eqz v1, :cond_a

    .line 458
    sget-object v6, Lcom/koushikdutta/async/ByteBufferList;->LOCK:Ljava/lang/Object;

    monitor-enter v6

    .line 459
    :goto_35
    :try_start_35
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    sget v5, Lcom/koushikdutta/async/ByteBufferList;->MAX_SIZE:I

    if-le v2, v5, :cond_64

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->size()I

    move-result v2

    if-lez v2, :cond_64

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-ge v2, v5, :cond_64

    .line 461
    invoke-virtual {v1}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 462
    .local v0, "head":Ljava/nio/ByteBuffer;
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    sub-int/2addr v2, v5

    sput v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    goto :goto_35

    .line 480
    .end local v0    # "head":Ljava/nio/ByteBuffer;
    :catchall_61
    move-exception v2

    monitor-exit v6
    :try_end_63
    .catchall {:try_start_35 .. :try_end_63} :catchall_61

    throw v2

    .line 465
    :cond_64
    :try_start_64
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    sget v5, Lcom/koushikdutta/async/ByteBufferList;->MAX_SIZE:I

    if-le v2, v5, :cond_6c

    .line 467
    monitor-exit v6

    goto :goto_a

    .line 470
    :cond_6c
    sget-boolean v2, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v2, :cond_7c

    invoke-static {p0}, Lcom/koushikdutta/async/ByteBufferList;->reclaimedContains(Ljava/nio/ByteBuffer;)Z

    move-result v2

    if-eqz v2, :cond_7c

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 472
    :cond_7c
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 473
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 474
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    add-int/2addr v2, v5

    sput v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    .line 476
    invoke-virtual {v1, p0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 477
    sget-boolean v2, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v2, :cond_b0

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->size()I

    move-result v2

    if-eqz v2, :cond_ac

    move v5, v3

    :goto_9e
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->currentSize:I

    if-nez v2, :cond_ae

    move v2, v3

    :goto_a3
    xor-int/2addr v2, v5

    if-nez v2, :cond_b0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    :cond_ac
    move v5, v4

    goto :goto_9e

    :cond_ae
    move v2, v4

    goto :goto_a3

    .line 479
    :cond_b0
    sget v2, Lcom/koushikdutta/async/ByteBufferList;->maxItem:I

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    sput v2, Lcom/koushikdutta/async/ByteBufferList;->maxItem:I

    .line 480
    monitor-exit v6
    :try_end_bd
    .catchall {:try_start_64 .. :try_end_bd} :catchall_61

    goto/16 :goto_a
.end method

.method private static reclaimedContains(Ljava/nio/ByteBuffer;)Z
    .registers 4
    .param p0, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 437
    sget-object v2, Lcom/koushikdutta/async/ByteBufferList;->reclaimed:Ljava/util/PriorityQueue;

    invoke-virtual {v2}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 438
    .local v1, "other":Ljava/nio/ByteBuffer;
    if-ne v1, p0, :cond_6

    .line 439
    const/4 v2, 0x1

    .line 441
    .end local v1    # "other":Ljava/nio/ByteBuffer;
    :goto_15
    return v2

    :cond_16
    const/4 v2, 0x0

    goto :goto_15
.end method

.method public static setMaxItemSize(I)V
    .registers 1
    .param p0, "size"    # I

    .prologue
    .line 433
    sput p0, Lcom/koushikdutta/async/ByteBufferList;->MAX_ITEM_SIZE:I

    .line 434
    return-void
.end method

.method public static setMaxPoolSize(I)V
    .registers 1
    .param p0, "size"    # I

    .prologue
    .line 429
    sput p0, Lcom/koushikdutta/async/ByteBufferList;->MAX_SIZE:I

    .line 430
    return-void
.end method

.method public static writeOutputStream(Ljava/io/OutputStream;Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 546
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v0, v3, [B

    .line 547
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .line 548
    .local v2, "offset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 549
    .local v1, "length":I
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 556
    :goto_14
    invoke-virtual {p0, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 557
    return-void

    .line 552
    .end local v0    # "bytes":[B
    .end local v1    # "length":I
    .end local v2    # "offset":I
    :cond_18
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 553
    .restart local v0    # "bytes":[B
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int v2, v3, v4

    .line 554
    .restart local v2    # "offset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .restart local v1    # "length":I
    goto :goto_14
.end method


# virtual methods
.method public add(Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 2
    .param p1, "b"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 280
    invoke-virtual {p1, p0}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 281
    return-object p0
.end method

.method public add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 5
    .param p1, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 285
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-gtz v1, :cond_a

    .line 287
    invoke-static {p1}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 309
    :goto_9
    return-object p0

    .line 290
    :cond_a
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->addRemaining(I)V

    .line 293
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v1

    if-lez v1, :cond_55

    .line 294
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 295
    .local v0, "last":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-lt v1, v2, :cond_55

    .line 296
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 297
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 298
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 299
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 300
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 301
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 302
    invoke-static {p1}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 303
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->trim()V

    goto :goto_9

    .line 307
    .end local v0    # "last":Ljava/nio/ByteBuffer;
    :cond_55
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 308
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->trim()V

    goto :goto_9
.end method

.method public varargs addAll([Lcom/koushikdutta/async/ByteBufferList;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 6
    .param p1, "bb"    # [Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 51
    move-object v0, p1

    .local v0, "arr$":[Lcom/koushikdutta/async/ByteBufferList;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_d

    aget-object v1, v0, v2

    .line 52
    .local v1, "b":Lcom/koushikdutta/async/ByteBufferList;
    invoke-virtual {v1, p0}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 53
    .end local v1    # "b":Lcom/koushikdutta/async/ByteBufferList;
    :cond_d
    return-object p0
.end method

.method public varargs addAll([Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 6
    .param p1, "bb"    # [Ljava/nio/ByteBuffer;

    .prologue
    .line 45
    move-object v0, p1

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_d

    aget-object v1, v0, v2

    .line 46
    .local v1, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 45
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 47
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    :cond_d
    return-object p0
.end method

.method public addFirst(Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 313
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-gtz v1, :cond_a

    .line 314
    invoke-static {p1}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    .line 332
    :goto_9
    return-void

    .line 317
    :cond_a
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->addRemaining(I)V

    .line 320
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v1

    if-lez v1, :cond_44

    .line 321
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 322
    .local v0, "first":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-lt v1, v2, :cond_44

    .line 323
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 324
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 325
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 326
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 327
    invoke-static {p1}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_9

    .line 331
    .end local v0    # "first":Ljava/nio/ByteBuffer;
    :cond_44
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    goto :goto_9
.end method

.method public get()B
    .registers 3

    .prologue
    .line 142
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 143
    .local v0, "ret":B
    iget v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 144
    return v0
.end method

.method public get(I)Lcom/koushikdutta/async/ByteBufferList;
    .registers 4
    .param p1, "length"    # I

    .prologue
    .line 221
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    .line 222
    .local v0, "ret":Lcom/koushikdutta/async/ByteBufferList;
    invoke-virtual {p0, v0, p1}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;I)V

    .line 223
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/ByteBufferList;->order(Ljava/nio/ByteOrder;)Lcom/koushikdutta/async/ByteBufferList;

    move-result-object v1

    return-object v1
.end method

.method public get(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 3
    .param p1, "into"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 217
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;I)V

    .line 218
    return-void
.end method

.method public get(Lcom/koushikdutta/async/ByteBufferList;I)V
    .registers 10
    .param p1, "into"    # Lcom/koushikdutta/async/ByteBufferList;
    .param p2, "length"    # I

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v5

    if-ge v5, p2, :cond_e

    .line 181
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "length"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 182
    :cond_e
    const/4 v2, 0x0

    .line 184
    .local v2, "offset":I
    :goto_f
    if-ge v2, p2, :cond_65

    .line 185
    iget-object v5, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v5}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 186
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 188
    .local v3, "remaining":I
    if-nez v3, :cond_23

    .line 189
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_f

    .line 193
    :cond_23
    add-int v5, v2, v3

    if-le v5, p2, :cond_60

    .line 194
    sub-int v1, p2, v2

    .line 196
    .local v1, "need":I
    invoke-static {v1}, Lcom/koushikdutta/async/ByteBufferList;->obtain(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 197
    .local v4, "subset":Ljava/nio/ByteBuffer;
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 198
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 199
    invoke-virtual {p1, v4}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 200
    iget-object v5, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v5, v0}, Lcom/koushikdutta/async/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 201
    sget-boolean v5, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v5, :cond_50

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-ge v5, v1, :cond_50

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 202
    :cond_50
    sget-boolean v5, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v5, :cond_65

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    if-eqz v5, :cond_65

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 207
    .end local v1    # "need":I
    .end local v4    # "subset":Ljava/nio/ByteBuffer;
    :cond_60
    invoke-virtual {p1, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 210
    add-int/2addr v2, v3

    .line 211
    goto :goto_f

    .line 213
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v3    # "remaining":I
    :cond_65
    iget v5, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    sub-int/2addr v5, p2

    iput v5, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 214
    return-void
.end method

.method public get([B)V
    .registers 4
    .param p1, "bytes"    # [B

    .prologue
    .line 154
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/koushikdutta/async/ByteBufferList;->get([BII)V

    .line 155
    return-void
.end method

.method public get([BII)V
    .registers 10
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v4

    if-ge v4, p3, :cond_e

    .line 159
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "length"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 161
    :cond_e
    move v1, p3

    .line 162
    .local v1, "need":I
    :cond_f
    :goto_f
    if-lez v1, :cond_46

    .line 163
    iget-object v4, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 164
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 165
    .local v2, "read":I
    if-eqz p1, :cond_26

    .line 166
    invoke-virtual {v0, p1, p2, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 167
    :cond_26
    sub-int/2addr v1, v2

    .line 168
    add-int/2addr p2, v2

    .line 169
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    if-nez v4, :cond_f

    .line 170
    iget-object v4, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v4}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 171
    .local v3, "removed":Ljava/nio/ByteBuffer;
    sget-boolean v4, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v4, :cond_42

    if-eq v0, v3, :cond_42

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 172
    :cond_42
    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_f

    .line 176
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "read":I
    .end local v3    # "removed":Ljava/nio/ByteBuffer;
    :cond_46
    iget v4, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    sub-int/2addr v4, p3

    iput v4, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 177
    return-void
.end method

.method public getAll()Ljava/nio/ByteBuffer;
    .registers 2

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    if-nez v0, :cond_9

    .line 228
    sget-object v0, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

    .line 230
    :goto_8
    return-object v0

    .line 229
    :cond_9
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    .line 230
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remove()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_8
.end method

.method public getAllArray()[Ljava/nio/ByteBuffer;
    .registers 3

    .prologue
    .line 80
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v1

    new-array v0, v1, [Ljava/nio/ByteBuffer;

    .line 81
    .local v0, "ret":[Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/ArrayDeque;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "ret":[Ljava/nio/ByteBuffer;
    check-cast v0, [Ljava/nio/ByteBuffer;

    .line 82
    .restart local v0    # "ret":[Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->clear()V

    .line 83
    const/4 v1, 0x0

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 84
    return-object v0
.end method

.method public getAllByteArray()[B
    .registers 5

    .prologue
    .line 65
    iget-object v2, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v2}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_31

    .line 66
    iget-object v2, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v2}, Lcom/koushikdutta/async/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 67
    .local v0, "peek":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v3

    if-ne v2, v3, :cond_31

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 68
    const/4 v2, 0x0

    iput v2, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 69
    iget-object v2, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v2}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    .line 76
    .end local v0    # "peek":Ljava/nio/ByteBuffer;
    :goto_30
    return-object v1

    .line 73
    :cond_31
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v2

    new-array v1, v2, [B

    .line 74
    .local v1, "ret":[B
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->get([B)V

    goto :goto_30
.end method

.method public getByteChar()C
    .registers 3

    .prologue
    .line 130
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    int-to-char v0, v1

    .line 131
    .local v0, "ret":C
    iget v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 132
    return v0
.end method

.method public getBytes(I)[B
    .registers 3
    .param p1, "length"    # I

    .prologue
    .line 57
    new-array v0, p1, [B

    .line 58
    .local v0, "ret":[B
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->get([B)V

    .line 59
    return-object v0
.end method

.method public getInt()I
    .registers 3

    .prologue
    .line 124
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 125
    .local v0, "ret":I
    iget v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/lit8 v1, v1, -0x4

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 126
    return v0
.end method

.method public getLong()J
    .registers 4

    .prologue
    .line 148
    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    .line 149
    .local v0, "ret":J
    iget v2, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/lit8 v2, v2, -0x8

    iput v2, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 150
    return-wide v0
.end method

.method public getShort()S
    .registers 3

    .prologue
    .line 136
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    .line 137
    .local v0, "ret":S
    iget v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    add-int/lit8 v1, v1, -0x2

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 138
    return v0
.end method

.method public hasRemaining()Z
    .registers 2

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public order(Ljava/nio/ByteOrder;)Lcom/koushikdutta/async/ByteBufferList;
    .registers 2
    .param p1, "order"    # Ljava/nio/ByteOrder;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    .line 28
    return-object p0
.end method

.method public order()Ljava/nio/ByteOrder;
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->order:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method public peekBytes(I)[B
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 113
    new-array v0, p1, [B

    .line 114
    .local v0, "ret":[B
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 115
    return-object v0
.end method

.method public peekInt()I
    .registers 2

    .prologue
    .line 105
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method public peekLong()J
    .registers 3

    .prologue
    .line 109
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public peekShort()S
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    return v0
.end method

.method public peekString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 362
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->peekString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public peekString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 10
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 367
    if-nez p1, :cond_4

    .line 368
    sget-object p1, Lcom/koushikdutta/async/util/Charsets;->US_ASCII:Ljava/nio/charset/Charset;

    .line 369
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 370
    .local v1, "builder":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v6}, Lcom/koushikdutta/async/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 374
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v6

    if-eqz v6, :cond_38

    .line 375
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    new-array v2, v6, [B

    .line 376
    .local v2, "bytes":[B
    const/4 v5, 0x0

    .line 377
    .local v5, "offset":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 378
    .local v4, "length":I
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 385
    :goto_2f
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v2, v5, v4, p1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f

    .line 381
    .end local v2    # "bytes":[B
    .end local v4    # "length":I
    .end local v5    # "offset":I
    :cond_38
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 382
    .restart local v2    # "bytes":[B
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v6

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    add-int v5, v6, v7

    .line 383
    .restart local v5    # "offset":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .restart local v4    # "length":I
    goto :goto_2f

    .line 387
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v2    # "bytes":[B
    .end local v4    # "length":I
    .end local v5    # "offset":I
    :cond_4b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public readString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 391
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->readString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 395
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/ByteBufferList;->peekString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, "ret":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 397
    return-object v0
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 340
    :goto_0
    iget-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v0

    if-lez v0, :cond_14

    .line 341
    iget-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/koushikdutta/async/ByteBufferList;->reclaim(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 343
    :cond_14
    sget-boolean v0, Lcom/koushikdutta/async/ByteBufferList;->$assertionsDisabled:Z

    if-nez v0, :cond_26

    iget-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v0

    if-eqz v0, :cond_26

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 344
    :cond_26
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 345
    return-void
.end method

.method public remaining()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    return v0
.end method

.method public remove()Ljava/nio/ByteBuffer;
    .registers 4

    .prologue
    .line 348
    iget-object v1, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v1}, Lcom/koushikdutta/async/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 349
    .local v0, "ret":Ljava/nio/ByteBuffer;
    iget v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/koushikdutta/async/ByteBufferList;->remaining:I

    .line 350
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/koushikdutta/async/ByteBufferList;->mBuffers:Lcom/koushikdutta/async/ArrayDeque;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ArrayDeque;->size()I

    move-result v0

    return v0
.end method

.method public skip(I)Lcom/koushikdutta/async/ByteBufferList;
    .registers 4
    .param p1, "length"    # I

    .prologue
    .line 119
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/koushikdutta/async/ByteBufferList;->get([BII)V

    .line 120
    return-object p0
.end method

.method public spewString()V
    .registers 3

    .prologue
    .line 358
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lcom/koushikdutta/async/ByteBufferList;->peekString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 359
    return-void
.end method

.method public trim()V
    .registers 2

    .prologue
    .line 276
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/koushikdutta/async/ByteBufferList;->read(I)Ljava/nio/ByteBuffer;

    .line 277
    return-void
.end method
