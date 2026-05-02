.class Lcom/google/common/cache/LocalCache$Segment;
.super Ljava/util/concurrent/locks/ReentrantLock;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Segment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/locks/ReentrantLock;"
    }
.end annotation


# instance fields
.field final accessQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field volatile count:I

.field final keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TK;>;"
        }
    .end annotation
.end field

.field final map:Lcom/google/common/cache/LocalCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field final maxSegmentWeight:J

.field modCount:I

.field final readCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final recencyQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field final statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

.field volatile table:Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field

.field threshold:I

.field totalWeight:I
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field

.field final valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TV;>;"
        }
    .end annotation
.end field

.field final writeQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache;IJLcom/google/common/cache/AbstractCache$StatsCounter;)V
    .registers 8
    .param p2, "initialCapacity"    # I
    .param p3, "maxSegmentWeight"    # J
    .param p5, "statsCounter"    # Lcom/google/common/cache/AbstractCache$StatsCounter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache",
            "<TK;TV;>;IJ",
            "Lcom/google/common/cache/AbstractCache$StatsCounter;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "map":Lcom/google/common/cache/LocalCache;, "Lcom/google/common/cache/LocalCache<TK;TV;>;"
    const/4 v1, 0x0

    .line 2086
    invoke-direct {p0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 2066
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2087
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    .line 2088
    iput-wide p3, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    .line 2089
    invoke-static {p5}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/AbstractCache$StatsCounter;

    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    .line 2090
    invoke-virtual {p0, p2}, Lcom/google/common/cache/LocalCache$Segment;->newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$Segment;->initTable(Ljava/util/concurrent/atomic/AtomicReferenceArray;)V

    .line 2092
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_60

    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    :goto_29
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 2095
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_36

    new-instance v1, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    :cond_36
    iput-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 2098
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesAccessQueue()Z

    move-result v0

    if-eqz v0, :cond_62

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    :goto_43
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    .line 2102
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesWriteQueue()Z

    move-result v0

    if-eqz v0, :cond_67

    new-instance v0, Lcom/google/common/cache/LocalCache$WriteQueue;

    invoke-direct {v0}, Lcom/google/common/cache/LocalCache$WriteQueue;-><init>()V

    :goto_50
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    .line 2106
    invoke-virtual {p1}, Lcom/google/common/cache/LocalCache;->usesAccessQueue()Z

    move-result v0

    if-eqz v0, :cond_6c

    new-instance v0, Lcom/google/common/cache/LocalCache$AccessQueue;

    invoke-direct {v0}, Lcom/google/common/cache/LocalCache$AccessQueue;-><init>()V

    :goto_5d
    iput-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    .line 2109
    return-void

    :cond_60
    move-object v0, v1

    .line 2092
    goto :goto_29

    .line 2098
    :cond_62
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_43

    .line 2102
    :cond_67
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_50

    .line 2106
    :cond_6c
    invoke-static {}, Lcom/google/common/cache/LocalCache;->discardingQueue()Ljava/util/Queue;

    move-result-object v0

    goto :goto_5d
.end method


# virtual methods
.method cleanUp()V
    .registers 4

    .prologue
    .line 3435
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v2}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 3436
    .local v0, "now":J
    invoke-virtual {p0, v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->runLockedCleanup(J)V

    .line 3437
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->runUnlockedCleanup()V

    .line 3438
    return-void
.end method

.method clear()V
    .registers 6

    .prologue
    .line 3212
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget v3, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v3, :cond_5f

    .line 3213
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3215
    :try_start_7
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3216
    .local v2, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_2f

    .line 3217
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_16
    if-eqz v0, :cond_2c

    .line 3219
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 3220
    sget-object v3, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V

    .line 3217
    :cond_27
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_16

    .line 3216
    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 3224
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_2f
    const/4 v1, 0x0

    :goto_30
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_3d

    .line 3225
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3224
    add-int/lit8 v1, v1, 0x1

    goto :goto_30

    .line 3227
    :cond_3d
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearReferenceQueues()V

    .line 3228
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    .line 3229
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    .line 3230
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 3232
    iget v3, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3233
    const/4 v3, 0x0

    iput v3, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_59
    .catchall {:try_start_7 .. :try_end_59} :catchall_60

    .line 3235
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3236
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .line 3239
    .end local v1    # "i":I
    .end local v2    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_5f
    return-void

    .line 3235
    :catchall_60
    move-exception v3

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3236
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method clearKeyReferenceQueue()V
    .registers 2

    .prologue
    .line 2520
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2521
    return-void
.end method

.method clearReferenceQueues()V
    .registers 2

    .prologue
    .line 2511
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2512
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearKeyReferenceQueue()V

    .line 2514
    :cond_b
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 2515
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->clearValueReferenceQueue()V

    .line 2517
    :cond_16
    return-void
.end method

.method clearValueReferenceQueue()V
    .registers 2

    .prologue
    .line 2524
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2525
    return-void
.end method

.method containsKey(Ljava/lang/Object;I)Z
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v3, 0x0

    .line 2773
    :try_start_1
    iget v4, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v4, :cond_26

    .line 2774
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v4}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v1

    .line 2775
    .local v1, "now":J
    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_2a

    move-result-object v0

    .line 2776
    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v0, :cond_17

    .line 2784
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1    # "now":J
    :goto_16
    return v3

    .line 2779
    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v1    # "now":J
    :cond_17
    :try_start_17
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_2a

    move-result-object v4

    if-eqz v4, :cond_22

    const/4 v3, 0x1

    .line 2784
    :cond_22
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_16

    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1    # "now":J
    :cond_26
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_16

    :catchall_2a
    move-exception v3

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v3
.end method

.method containsValue(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "value"    # Ljava/lang/Object;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 2795
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :try_start_0
    iget v7, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v7, :cond_3a

    .line 2796
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v7, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v7}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v4

    .line 2797
    .local v4, "now":J
    iget-object v6, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2798
    .local v6, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    .line 2799
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    if-ge v2, v3, :cond_3a

    .line 2800
    invoke-virtual {v6, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_1b
    if-eqz v0, :cond_37

    .line 2801
    invoke-virtual {p0, v0, v4, v5}, Lcom/google/common/cache/LocalCache$Segment;->getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;

    move-result-object v1

    .line 2802
    .local v1, "entryValue":Ljava/lang/Object;, "TV;"
    if-nez v1, :cond_28

    .line 2800
    :cond_23
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_1b

    .line 2805
    :cond_28
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v7, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v7, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_2f
    .catchall {:try_start_0 .. :try_end_2f} :catchall_3f

    move-result v7

    if-eqz v7, :cond_23

    .line 2806
    const/4 v7, 0x1

    .line 2814
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v4    # "now":J
    .end local v6    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :goto_36
    return v7

    .line 2799
    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v2    # "i":I
    .restart local v3    # "length":I
    .restart local v4    # "now":J
    .restart local v6    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_37
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 2812
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v4    # "now":J
    .end local v6    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :cond_3a
    const/4 v7, 0x0

    .line 2814
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_36

    :catchall_3f
    move-exception v7

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v7
.end method

.method copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "original":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "newNext":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    const/4 v0, 0x0

    .line 2135
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_8

    .line 2149
    :cond_7
    :goto_7
    return-object v0

    .line 2140
    :cond_8
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    .line 2141
    .local v2, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 2142
    .local v1, "value":Ljava/lang/Object;, "TV;"
    if-nez v1, :cond_18

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-nez v3, :cond_7

    .line 2147
    :cond_18
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->entryFactory:Lcom/google/common/cache/LocalCache$EntryFactory;

    invoke-virtual {v3, p0, p1, p2}, Lcom/google/common/cache/LocalCache$EntryFactory;->copyEntry(Lcom/google/common/cache/LocalCache$Segment;Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2148
    .local v0, "newEntry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-interface {v2, v3, v1, v0}, Lcom/google/common/cache/LocalCache$ValueReference;->copyFor(Ljava/lang/ref/ReferenceQueue;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    goto :goto_7
.end method

.method drainKeyReferenceQueue()V
    .registers 5
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2482
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v1, 0x0

    .line 2483
    .local v1, "i":I
    :cond_1
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->keyReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v2

    .local v2, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<+TK;>;"
    if-eqz v2, :cond_17

    move-object v0, v2

    .line 2485
    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2486
    .local v0, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v3, v0}, Lcom/google/common/cache/LocalCache;->reclaimKey(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 2487
    add-int/lit8 v1, v1, 0x1

    const/16 v3, 0x10

    if-ne v1, v3, :cond_1

    .line 2491
    .end local v0    # "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_17
    return-void
.end method

.method drainRecencyQueue()V
    .registers 3
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2587
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_18

    .line 2592
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2593
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2596
    :cond_18
    return-void
.end method

.method drainReferenceQueues()V
    .registers 2
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2471
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesKeyReferences()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2472
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainKeyReferenceQueue()V

    .line 2474
    :cond_b
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->usesValueReferences()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 2475
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainValueReferenceQueue()V

    .line 2477
    :cond_16
    return-void
.end method

.method drainValueReferenceQueue()V
    .registers 5
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2496
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v0, 0x0

    .line 2497
    .local v0, "i":I
    :cond_1
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->valueReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v1

    .local v1, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<+TV;>;"
    if-eqz v1, :cond_17

    move-object v2, v1

    .line 2499
    check-cast v2, Lcom/google/common/cache/LocalCache$ValueReference;

    .line 2500
    .local v2, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v3, v2}, Lcom/google/common/cache/LocalCache;->reclaimValue(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2501
    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x10

    if-ne v0, v3, :cond_1

    .line 2505
    .end local v2    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_17
    return-void
.end method

.method enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V
    .registers 6
    .param p2, "cause"    # Lcom/google/common/cache/RemovalCause;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2635
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2, p2}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 2636
    return-void
.end method

.method enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    .registers 9
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "hash"    # I
    .param p4, "cause"    # Lcom/google/common/cache/RemovalCause;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2641
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget v2, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->getWeight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    .line 2642
    invoke-virtual {p4}, Lcom/google/common/cache/RemovalCause;->wasEvicted()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 2643
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v2}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordEviction()V

    .line 2645
    :cond_14
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->removalNotificationQueue:Ljava/util/Queue;

    sget-object v3, Lcom/google/common/cache/LocalCache;->DISCARDING_QUEUE:Ljava/util/Queue;

    if-eq v2, v3, :cond_2c

    .line 2646
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 2647
    .local v1, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lcom/google/common/cache/RemovalNotification;

    invoke-direct {v0, p1, v1, p4}, Lcom/google/common/cache/RemovalNotification;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/cache/RemovalCause;)V

    .line 2648
    .local v0, "notification":Lcom/google/common/cache/RemovalNotification;, "Lcom/google/common/cache/RemovalNotification<TK;TV;>;"
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->removalNotificationQueue:Ljava/util/Queue;

    invoke-interface {v2, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 2650
    .end local v0    # "notification":Lcom/google/common/cache/RemovalNotification;, "Lcom/google/common/cache/RemovalNotification<TK;TV;>;"
    .end local v1    # "value":Ljava/lang/Object;, "TV;"
    :cond_2c
    return-void
.end method

.method evictEntries()V
    .registers 6
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2658
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache;->evictsBySize()Z

    move-result v1

    if-nez v1, :cond_9

    .line 2669
    :cond_8
    return-void

    .line 2662
    :cond_9
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2663
    :cond_c
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    int-to-long v1, v1

    iget-wide v3, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_8

    .line 2664
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->getNextEvictable()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2665
    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->SIZE:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 2666
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method expand()V
    .registers 19
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2895
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2896
    .local v14, "oldTable":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v12

    .line 2897
    .local v12, "oldCapacity":I
    const/high16 v17, 0x40000000    # 2.0f

    move/from16 v0, v17

    if-lt v12, v0, :cond_f

    .line 2960
    :goto_e
    return-void

    .line 2911
    :cond_f
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2912
    .local v5, "newCount":I
    shl-int/lit8 v17, v12, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-result-object v10

    .line 2913
    .local v10, "newTable":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    mul-int/lit8 v17, v17, 0x3

    div-int/lit8 v17, v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2914
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    add-int/lit8 v8, v17, -0x1

    .line 2915
    .local v8, "newMask":I
    const/4 v13, 0x0

    .local v13, "oldIndex":I
    :goto_32
    if-ge v13, v12, :cond_92

    .line 2918
    invoke-virtual {v14, v13}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2920
    .local v3, "head":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v3, :cond_4b

    .line 2921
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 2922
    .local v11, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v4, v17, v8

    .line 2925
    .local v4, "headIndex":I
    if-nez v11, :cond_4e

    .line 2926
    invoke-virtual {v10, v4, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2915
    .end local v4    # "headIndex":I
    .end local v11    # "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_4b
    add-int/lit8 v13, v13, 0x1

    goto :goto_32

    .line 2931
    .restart local v4    # "headIndex":I
    .restart local v11    # "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_4e
    move-object v15, v3

    .line 2932
    .local v15, "tail":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move/from16 v16, v4

    .line 2933
    .local v16, "tailIndex":I
    move-object v2, v11

    .local v2, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_52
    if-eqz v2, :cond_66

    .line 2934
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v7, v17, v8

    .line 2935
    .local v7, "newIndex":I
    move/from16 v0, v16

    if-eq v7, v0, :cond_61

    .line 2937
    move/from16 v16, v7

    .line 2938
    move-object v15, v2

    .line 2933
    :cond_61
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_52

    .line 2941
    .end local v7    # "newIndex":I
    :cond_66
    move/from16 v0, v16

    invoke-virtual {v10, v0, v15}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2944
    move-object v2, v3

    :goto_6c
    if-eq v2, v15, :cond_4b

    .line 2945
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    and-int v7, v17, v8

    .line 2946
    .restart local v7    # "newIndex":I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2947
    .local v9, "newNext":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v9}, Lcom/google/common/cache/LocalCache$Segment;->copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v6

    .line 2948
    .local v6, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v6, :cond_8a

    .line 2949
    invoke-virtual {v10, v7, v6}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2944
    :goto_85
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_6c

    .line 2951
    :cond_8a
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 2952
    add-int/lit8 v5, v5, -0x1

    goto :goto_85

    .line 2958
    .end local v2    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3    # "head":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4    # "headIndex":I
    .end local v6    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7    # "newIndex":I
    .end local v9    # "newNext":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v11    # "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v15    # "tail":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v16    # "tailIndex":I
    :cond_92
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2959
    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    goto/16 :goto_e
.end method

.method expireEntries(J)V
    .registers 6
    .param p1, "now"    # J
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2616
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2619
    :cond_3
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_27

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1, v0, p1, p2}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 2620
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2621
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2624
    :cond_27
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v0, :cond_4b

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1, v0, p1, p2}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 2625
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    sget-object v2, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, v0, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z

    move-result v1

    if-nez v1, :cond_27

    .line 2626
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2629
    :cond_4b
    return-void
.end method

.method get(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 11
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v0, 0x0

    .line 2751
    :try_start_1
    iget v2, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v2, :cond_39

    .line 2752
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v2}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2753
    .local v5, "now":J
    invoke-virtual {p0, p1, p2, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_3d

    move-result-object v1

    .line 2754
    .local v1, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v1, :cond_17

    .line 2767
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5    # "now":J
    :goto_16
    return-object v0

    .line 2758
    .restart local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v5    # "now":J
    :cond_17
    :try_start_17
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v4

    .line 2759
    .local v4, "value":Ljava/lang/Object;, "TV;"
    if-eqz v4, :cond_36

    .line 2760
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2761
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v7, v0, Lcom/google/common/cache/LocalCache;->defaultLoader:Lcom/google/common/cache/CacheLoader;

    move-object v0, p0

    move v3, p2

    invoke-virtual/range {v0 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_31
    .catchall {:try_start_17 .. :try_end_31} :catchall_3d

    move-result-object v0

    .line 2767
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_16

    .line 2763
    :cond_36
    :try_start_36
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_3d

    .line 2767
    .end local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    .end local v5    # "now":J
    :cond_39
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_16

    :catchall_3d
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v0
.end method

.method get(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .registers 15
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2171
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2172
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2174
    :try_start_6
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    if-eqz v0, :cond_45

    .line 2176
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v1

    .line 2177
    .local v1, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v1, :cond_45

    .line 2178
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v0}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2179
    .local v5, "now":J
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;

    move-result-object v4

    .line 2180
    .local v4, "value":Ljava/lang/Object;, "TV;"
    if-eqz v4, :cond_33

    .line 2181
    invoke-virtual {p0, v1, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2182
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordHits(I)V

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move-object v7, p3

    .line 2183
    invoke-virtual/range {v0 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_6 .. :try_end_2e} :catch_4d
    .catchall {:try_start_6 .. :try_end_2e} :catchall_5e

    move-result-object v0

    .line 2203
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    .end local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    .end local v5    # "now":J
    :goto_32
    return-object v0

    .line 2185
    .restart local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v4    # "value":Ljava/lang/Object;, "TV;"
    .restart local v5    # "now":J
    :cond_33
    :try_start_33
    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v10

    .line 2186
    .local v10, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v10}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 2187
    invoke-virtual {p0, v1, p1, v10}, Lcom/google/common/cache/LocalCache$Segment;->waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_33 .. :try_end_40} :catch_4d
    .catchall {:try_start_33 .. :try_end_40} :catchall_5e

    move-result-object v0

    .line 2203
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_32

    .line 2193
    .end local v1    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    .end local v5    # "now":J
    .end local v10    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_45
    :try_start_45
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->lockedGetOrLoad(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    :try_end_48
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_45 .. :try_end_48} :catch_4d
    .catchall {:try_start_45 .. :try_end_48} :catchall_5e

    move-result-object v0

    .line 2203
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    goto :goto_32

    .line 2194
    :catch_4d
    move-exception v9

    .line 2195
    .local v9, "ee":Ljava/util/concurrent/ExecutionException;
    :try_start_4e
    invoke-virtual {v9}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v8

    .line 2196
    .local v8, "cause":Ljava/lang/Throwable;
    instance-of v0, v8, Ljava/lang/Error;

    if-eqz v0, :cond_63

    .line 2197
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionError;

    check-cast v8, Ljava/lang/Error;

    .end local v8    # "cause":Ljava/lang/Throwable;
    invoke-direct {v0, v8}, Lcom/google/common/util/concurrent/ExecutionError;-><init>(Ljava/lang/Error;)V

    throw v0
    :try_end_5e
    .catchall {:try_start_4e .. :try_end_5e} :catchall_5e

    .line 2203
    .end local v9    # "ee":Ljava/util/concurrent/ExecutionException;
    :catchall_5e
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postReadCleanup()V

    throw v0

    .line 2198
    .restart local v8    # "cause":Ljava/lang/Throwable;
    .restart local v9    # "ee":Ljava/util/concurrent/ExecutionException;
    :cond_63
    :try_start_63
    instance-of v0, v8, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_6d

    .line 2199
    new-instance v0, Lcom/google/common/util/concurrent/UncheckedExecutionException;

    invoke-direct {v0, v8}, Lcom/google/common/util/concurrent/UncheckedExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 2201
    :cond_6d
    throw v9
    :try_end_6e
    .catchall {:try_start_63 .. :try_end_6e} :catchall_5e
.end method

.method getAndRecordStats(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;
    .registers 10
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2342
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, "newValue":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    const/4 v0, 0x0

    .line 2344
    .local v0, "value":Ljava/lang/Object;, "TV;"
    :try_start_1
    invoke-static {p4}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0

    .line 2345
    if-nez v0, :cond_36

    .line 2346
    new-instance v1, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CacheLoader returned null for key "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_26

    .line 2352
    .end local v0    # "value":Ljava/lang/Object;, "TV;"
    :catchall_26
    move-exception v1

    if-nez v0, :cond_35

    .line 2353
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v3

    invoke-interface {v2, v3, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadException(J)V

    .line 2354
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z

    :cond_35
    throw v1

    .line 2348
    .restart local v0    # "value":Ljava/lang/Object;, "TV;"
    :cond_36
    :try_start_36
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadSuccess(J)V

    .line 2349
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/common/cache/LocalCache$Segment;->storeLoadedValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Ljava/lang/Object;)Z
    :try_end_42
    .catchall {:try_start_36 .. :try_end_42} :catchall_26

    .line 2352
    if-nez v0, :cond_50

    .line 2353
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->elapsedNanos()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordLoadException(J)V

    .line 2354
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z

    :cond_50
    return-object v0
.end method

.method getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2695
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0, p2}, Lcom/google/common/cache/LocalCache$Segment;->getFirst(I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_4
    if-eqz v0, :cond_26

    .line 2696
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v2

    if-eq v2, p2, :cond_11

    .line 2695
    :cond_c
    :goto_c
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_4

    .line 2700
    :cond_11
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 2701
    .local v1, "entryKey":Ljava/lang/Object;, "TK;"
    if-nez v1, :cond_1b

    .line 2702
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    goto :goto_c

    .line 2706
    :cond_1b
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v2, v2, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v2, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 2711
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    :goto_25
    return-object v0

    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method getFirst(I)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 4
    .param p1, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2687
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2688
    .local v0, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    return-object v1
.end method

.method getLiveEntry(Ljava/lang/Object;IJ)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .param p3, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "IJ)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    const/4 v1, 0x0

    .line 2716
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->getEntry(Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2717
    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-nez v0, :cond_9

    move-object v0, v1

    .line 2723
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_8
    :goto_8
    return-object v0

    .line 2719
    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_9
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v2, v0, p3, p4}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 2720
    invoke-virtual {p0, p3, p4}, Lcom/google/common/cache/LocalCache$Segment;->tryExpireEntries(J)V

    move-object v0, v1

    .line 2721
    goto :goto_8
.end method

.method getLiveValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Ljava/lang/Object;
    .registers 7
    .param p2, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    const/4 v1, 0x0

    .line 2731
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_c

    .line 2732
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    move-object v0, v1

    .line 2745
    :cond_b
    :goto_b
    return-object v0

    .line 2735
    :cond_c
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 2736
    .local v0, "value":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_1b

    .line 2737
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryDrainReferenceQueues()V

    move-object v0, v1

    .line 2738
    goto :goto_b

    .line 2741
    :cond_1b
    iget-object v2, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v2, p1, p2, p3}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 2742
    invoke-virtual {p0, p2, p3}, Lcom/google/common/cache/LocalCache$Segment;->tryExpireEntries(J)V

    move-object v0, v1

    .line 2743
    goto :goto_b
.end method

.method getNextEvictable()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 2673
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2674
    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ValueReference;->getWeight()I

    move-result v2

    .line 2675
    .local v2, "weight":I
    if-lez v2, :cond_6

    .line 2676
    return-object v0

    .line 2679
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2    # "weight":I
    :cond_1d
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
.end method

.method initTable(Ljava/util/concurrent/atomic/AtomicReferenceArray;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 2116
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "newTable":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2117
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->customWeigher()Z

    move-result v0

    if-nez v0, :cond_21

    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/google/common/cache/LocalCache$Segment;->maxSegmentWeight:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_21

    .line 2119
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    .line 2121
    :cond_21
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2122
    return-void
.end method

.method insertLoadingValueReference(Ljava/lang/Object;IZ)Lcom/google/common/cache/LocalCache$LoadingValueReference;
    .registers 17
    .param p2, "hash"    # I
    .param p3, "checkTime"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;IZ)",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2403
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    const/4 v0, 0x0

    .line 2404
    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2406
    :try_start_4
    iget-object v9, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v9, v9, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v9}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v5

    .line 2407
    .local v5, "now":J
    invoke-virtual {p0, v5, v6}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2409
    iget-object v7, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2410
    .local v7, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    and-int v3, p2, v9

    .line 2411
    .local v3, "index":I
    invoke-virtual {v7, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2414
    .local v2, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, v2

    :goto_20
    if-eqz v0, :cond_74

    .line 2415
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 2416
    .local v1, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v9

    if-ne v9, p2, :cond_6f

    if-eqz v1, :cond_6f

    iget-object v9, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v9, v9, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v9, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6f

    .line 2420
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 2421
    .local v8, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v9

    if-nez v9, :cond_52

    if-eqz p3, :cond_5a

    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getWriteTime()J

    move-result-wide v9

    sub-long v9, v5, v9

    iget-object v11, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-wide v11, v11, Lcom/google/common/cache/LocalCache;->refreshNanos:J
    :try_end_4e
    .catchall {:try_start_4 .. :try_end_4e} :catchall_90

    cmp-long v9, v9, v11

    if-gez v9, :cond_5a

    .line 2426
    :cond_52
    const/4 v4, 0x0

    .line 2445
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2446
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_59
    return-object v4

    .line 2430
    .restart local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_5a
    :try_start_5a
    iget v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2431
    new-instance v4, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v4, v8}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2433
    .local v4, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-interface {v0, v4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_68
    .catchall {:try_start_5a .. :try_end_68} :catchall_90

    .line 2445
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2446
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_59

    .line 2414
    .end local v4    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_6f
    :try_start_6f
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_20

    .line 2438
    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_74
    iget v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2439
    new-instance v4, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>()V

    .line 2440
    .restart local v4    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    invoke-virtual {p0, p1, p2, v2}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    .line 2441
    invoke-interface {v0, v4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2442
    invoke-virtual {v7, v3, v0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_89
    .catchall {:try_start_6f .. :try_end_89} :catchall_90

    .line 2445
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2446
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_59

    .line 2445
    .end local v2    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3    # "index":I
    .end local v4    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .end local v5    # "now":J
    .end local v7    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_90
    move-exception v9

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2446
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v9
.end method

.method loadAsync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 11
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 2321
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    invoke-virtual {p3, p1, p4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->loadFuture(Ljava/lang/Object;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v5

    .line 2322
    .local v5, "loadingFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    new-instance v0, Lcom/google/common/cache/LocalCache$Segment$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/common/cache/LocalCache$Segment$1;-><init>(Lcom/google/common/cache/LocalCache$Segment;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)V

    sget-object v1, Lcom/google/common/cache/LocalCache;->sameThreadExecutor:Lcom/google/common/util/concurrent/ListeningExecutorService;

    invoke-interface {v5, v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 2334
    return-object v5
.end method

.method loadSync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .registers 7
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2315
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    invoke-virtual {p3, p1, p4}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->loadFuture(Ljava/lang/Object;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 2316
    .local v0, "loadingFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/common/cache/LocalCache$Segment;->getAndRecordStats(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method lockedGetOrLoad(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .registers 24
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 2210
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    const/16 v16, 0x0

    .line 2211
    .local v16, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v9, 0x0

    .line 2212
    .local v9, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v4, 0x1

    .line 2214
    .local v4, "createNewEntry":Z
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2217
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 2218
    .local v12, "now":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2220
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    move/from16 v17, v0

    add-int/lit8 v11, v17, -0x1

    .line 2221
    .local v11, "newCount":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 2222
    .local v14, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    and-int v8, p2, v17

    .line 2223
    .local v8, "index":I
    invoke-virtual {v14, v8}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2225
    .local v7, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v7

    .local v5, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_37
    if-eqz v5, :cond_6a

    .line 2226
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 2227
    .local v6, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v17

    move/from16 v0, v17

    move/from16 v1, p2

    if-ne v0, v1, :cond_10f

    if-eqz v6, :cond_10f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_10f

    .line 2229
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v16

    .line 2230
    invoke-interface/range {v16 .. v16}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v17

    if-eqz v17, :cond_a6

    .line 2231
    const/4 v4, 0x0

    .line 2256
    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_6a
    :goto_6a
    if-eqz v4, :cond_84

    .line 2257
    new-instance v10, Lcom/google/common/cache/LocalCache$LoadingValueReference;

    invoke-direct {v10}, Lcom/google/common/cache/LocalCache$LoadingValueReference;-><init>()V
    :try_end_71
    .catchall {:try_start_7 .. :try_end_71} :catchall_d4

    .line 2259
    .end local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local v10, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    if-nez v5, :cond_115

    .line 2260
    :try_start_73
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v7}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v5

    .line 2261
    invoke-interface {v5, v10}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2262
    invoke-virtual {v14, v8, v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_83
    .catchall {:try_start_73 .. :try_end_83} :catchall_137

    move-object v9, v10

    .line 2268
    .end local v10    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :cond_84
    :goto_84
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2269
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .line 2272
    if-eqz v4, :cond_12b

    .line 2277
    :try_start_8c
    monitor-enter v5
    :try_end_8d
    .catchall {:try_start_8c .. :try_end_8d} :catchall_11e

    .line 2278
    :try_start_8d
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/google/common/cache/LocalCache$Segment;->loadSync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Ljava/lang/Object;

    move-result-object v15

    monitor-exit v5
    :try_end_9a
    .catchall {:try_start_8d .. :try_end_9a} :catchall_11b

    .line 2281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    .line 2285
    :goto_a5
    return-object v15

    .line 2233
    .restart local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_a6
    :try_start_a6
    invoke-interface/range {v16 .. v16}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 2234
    .local v15, "value":Ljava/lang/Object;, "TV;"
    if-nez v15, :cond_dc

    .line 2235
    sget-object v17, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 2248
    :goto_b9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 2249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 2250
    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_d3
    .catchall {:try_start_a6 .. :try_end_d3} :catchall_d4

    goto :goto_6a

    .line 2268
    .end local v5    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v7    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v8    # "index":I
    .end local v11    # "newCount":I
    .end local v12    # "now":J
    .end local v14    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .end local v15    # "value":Ljava/lang/Object;, "TV;"
    :catchall_d4
    move-exception v17

    :goto_d5
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2269
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v17

    .line 2236
    .restart local v5    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v7    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v8    # "index":I
    .restart local v11    # "newCount":I
    .restart local v12    # "now":J
    .restart local v14    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .restart local v15    # "value":Ljava/lang/Object;, "TV;"
    :cond_dc
    :try_start_dc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v12, v13}, Lcom/google/common/cache/LocalCache;->isExpired(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)Z

    move-result v17

    if-eqz v17, :cond_f8

    .line 2239
    sget-object v17, Lcom/google/common/cache/RemovalCause;->EXPIRED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, v16

    move-object/from16 v3, v17

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    goto :goto_b9

    .line 2241
    :cond_f8
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V

    .line 2242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordHits(I)V
    :try_end_108
    .catchall {:try_start_dc .. :try_end_108} :catchall_d4

    .line 2268
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2269
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_a5

    .line 2225
    .end local v15    # "value":Ljava/lang/Object;, "TV;"
    :cond_10f
    :try_start_10f
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_112
    .catchall {:try_start_10f .. :try_end_112} :catchall_d4

    move-result-object v5

    goto/16 :goto_37

    .line 2264
    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v10    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :cond_115
    :try_start_115
    invoke-interface {v5, v10}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_118
    .catchall {:try_start_115 .. :try_end_118} :catchall_137

    move-object v9, v10

    .end local v10    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    goto/16 :goto_84

    .line 2279
    :catchall_11b
    move-exception v17

    :try_start_11c
    monitor-exit v5
    :try_end_11d
    .catchall {:try_start_11c .. :try_end_11d} :catchall_11b

    :try_start_11d
    throw v17
    :try_end_11e
    .catchall {:try_start_11d .. :try_end_11e} :catchall_11e

    .line 2281
    :catchall_11e
    move-exception v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-interface/range {v18 .. v19}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    throw v17

    .line 2285
    :cond_12b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v16

    invoke-virtual {v0, v5, v1, v2}, Lcom/google/common/cache/LocalCache$Segment;->waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;

    move-result-object v15

    goto/16 :goto_a5

    .line 2268
    .end local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v10    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    :catchall_137
    move-exception v17

    move-object v9, v10

    .end local v10    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .restart local v9    # "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    goto :goto_d5
.end method

.method newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 6
    .param p2, "hash"    # I
    .param p3    # Lcom/google/common/cache/LocalCache$ReferenceEntry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2126
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v0, v0, Lcom/google/common/cache/LocalCache;->entryFactory:Lcom/google/common/cache/LocalCache$EntryFactory;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1, p2, p3}, Lcom/google/common/cache/LocalCache$EntryFactory;->newEntry(Lcom/google/common/cache/LocalCache$Segment;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    return-object v0
.end method

.method newEntryArray(I)Ljava/util/concurrent/atomic/AtomicReferenceArray;
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/concurrent/atomic/AtomicReferenceArray",
            "<",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 2112
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReferenceArray;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    return-object v0
.end method

.method postReadCleanup()V
    .registers 2

    .prologue
    .line 3411
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    and-int/lit8 v0, v0, 0x3f

    if-nez v0, :cond_d

    .line 3412
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->cleanUp()V

    .line 3414
    :cond_d
    return-void
.end method

.method postWriteCleanup()V
    .registers 1

    .prologue
    .line 3431
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->runUnlockedCleanup()V

    .line 3432
    return-void
.end method

.method preWriteCleanup(J)V
    .registers 3
    .param p1, "now"    # J
    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3424
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->runLockedCleanup(J)V

    .line 3425
    return-void
.end method

.method put(Ljava/lang/Object;ILjava/lang/Object;Z)Ljava/lang/Object;
    .registers 28
    .param p2, "hash"    # I
    .param p4, "onlyIfAbsent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;Z)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 2820
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2822
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v4}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v8

    .line 2823
    .local v8, "now":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2825
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2826
    .local v20, "newCount":I
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    move/from16 v0, v20

    if-le v0, v4, :cond_29

    .line 2827
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->expand()V

    .line 2828
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2831
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v21, v0

    .line 2832
    .local v21, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v21 .. v21}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    and-int v19, p2, v4

    .line 2833
    .local v19, "index":I
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2836
    .local v18, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v5, v18

    .local v5, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_43
    if-eqz v5, :cond_f9

    .line 2837
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v16

    .line 2838
    .local v16, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v4

    move/from16 v0, p2

    if-ne v4, v0, :cond_f3

    if-eqz v16, :cond_f3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v4, v0, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f3

    .line 2842
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v22

    .line 2843
    .local v22, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface/range {v22 .. v22}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v17

    .line 2845
    .local v17, "entryValue":Ljava/lang/Object;, "TV;"
    if-nez v17, :cond_bb

    .line 2846
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2847
    invoke-interface/range {v22 .. v22}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v4

    if-eqz v4, :cond_ab

    .line 2848
    sget-object v4, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2849
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2850
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    move/from16 v20, v0

    .line 2855
    :goto_99
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2856
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_a2
    .catchall {:try_start_3 .. :try_end_a2} :catchall_139

    .line 2857
    const/16 v17, 0x0

    .line 2885
    .end local v17    # "entryValue":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2886
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v16    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v22    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_aa
    return-object v17

    .restart local v16    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v17    # "entryValue":Ljava/lang/Object;, "TV;"
    .restart local v22    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_ab
    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2852
    :try_start_b1
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2853
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    goto :goto_99

    .line 2858
    :cond_bb
    if-eqz p4, :cond_c9

    .line 2862
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v8, v9}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_c2
    .catchall {:try_start_b1 .. :try_end_c2} :catchall_139

    .line 2885
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2886
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_aa

    .line 2866
    :cond_c9
    :try_start_c9
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2867
    sget-object v4, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    .line 2868
    invoke-virtual/range {v4 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2869
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_ec
    .catchall {:try_start_c9 .. :try_end_ec} :catchall_139

    .line 2885
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2886
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_aa

    .line 2836
    .end local v17    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v22    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_f3
    :try_start_f3
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v5

    goto/16 :goto_43

    .line 2876
    .end local v16    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_f9
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2877
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .local v11, "newEntry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v10, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p3

    move-wide v14, v8

    .line 2878
    invoke-virtual/range {v10 .. v15}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2879
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2880
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v20, v4, 0x1

    .line 2881
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 2882
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_12f
    .catchall {:try_start_f3 .. :try_end_12f} :catchall_139

    .line 2883
    const/16 v17, 0x0

    .line 2885
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2886
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto/16 :goto_aa

    .line 2885
    .end local v5    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v8    # "now":J
    .end local v11    # "newEntry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v18    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v19    # "index":I
    .end local v20    # "newCount":I
    .end local v21    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_139
    move-exception v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2886
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v4
.end method

.method reclaimKey(Lcom/google/common/cache/LocalCache$ReferenceEntry;I)Z
    .registers 14
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;I)Z"
        }
    .end annotation

    .prologue
    .line 3288
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3290
    :try_start_3
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3291
    .local v8, "newCount":I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3292
    .local v10, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    and-int v7, p2, v0

    .line 3293
    .local v7, "index":I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3295
    .local v1, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_18
    if-eqz v2, :cond_48

    .line 3296
    if-ne v2, p1, :cond_43

    .line 3297
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3298
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v5

    sget-object v6, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object v0, p0

    move v4, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3300
    .local v9, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3301
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3302
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_50

    .line 3303
    const/4 v0, 0x1

    .line 3309
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3310
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v9    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_42
    return v0

    .line 3295
    :cond_43
    :try_start_43
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_46
    .catchall {:try_start_43 .. :try_end_46} :catchall_50

    move-result-object v2

    goto :goto_18

    .line 3307
    :cond_48
    const/4 v0, 0x0

    .line 3309
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3310
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_42

    .line 3309
    .end local v1    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7    # "index":I
    .end local v8    # "newCount":I
    .end local v10    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_50
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3310
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v0
.end method

.method reclaimValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;)Z
    .registers 16
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v0, 0x0

    .line 3318
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3320
    :try_start_4
    iget v4, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v4, -0x1

    .line 3321
    .local v8, "newCount":I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3322
    .local v10, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    and-int v7, p2, v4

    .line 3323
    .local v7, "index":I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3325
    .local v1, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_19
    if-eqz v2, :cond_6f

    .line 3326
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 3327
    .local v3, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v4

    if-ne v4, p2, :cond_6a

    if-eqz v3, :cond_6a

    iget-object v4, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v4, v4, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v4, p1, v3}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6a

    .line 3329
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v11

    .line 3330
    .local v11, "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    if-ne v11, p3, :cond_5d

    .line 3331
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3332
    sget-object v6, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object v0, p0

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3334
    .local v9, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3335
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3336
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_4f
    .catchall {:try_start_4 .. :try_end_4f} :catchall_7c

    .line 3337
    const/4 v0, 0x1

    .line 3345
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3346
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_5c

    .line 3347
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v3    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v9    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v11    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_5c
    :goto_5c
    return v0

    .line 3345
    .restart local v3    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v11    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_5d
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3346
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_5c

    .line 3347
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_5c

    .line 3325
    .end local v11    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_6a
    :try_start_6a
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_6d
    .catchall {:try_start_6a .. :try_end_6d} :catchall_7c

    move-result-object v2

    goto :goto_19

    .line 3345
    .end local v3    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_6f
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3346
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_5c

    .line 3347
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_5c

    .line 3345
    .end local v1    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v2    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v7    # "index":I
    .end local v8    # "newCount":I
    .end local v10    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_7c
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3346
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v4

    if-nez v4, :cond_89

    .line 3347
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    :cond_89
    throw v0
.end method

.method recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    .registers 5
    .param p2, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2552
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2553
    invoke-interface {p1, p2, p3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2555
    :cond_b
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2556
    return-void
.end method

.method recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    .registers 5
    .param p2, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;J)V"
        }
    .end annotation

    .prologue
    .line 2537
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2538
    invoke-interface {p1, p2, p3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2540
    :cond_b
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->recencyQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2541
    return-void
.end method

.method recordWrite(Lcom/google/common/cache/LocalCache$ReferenceEntry;IJ)V
    .registers 6
    .param p2, "weight"    # I
    .param p3, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;IJ)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2565
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainRecencyQueue()V

    .line 2566
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->totalWeight:I

    .line 2568
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsAccess()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 2569
    invoke-interface {p1, p3, p4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setAccessTime(J)V

    .line 2571
    :cond_13
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->recordsWrite()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 2572
    invoke-interface {p1, p3, p4}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setWriteTime(J)V

    .line 2574
    :cond_1e
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2575
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 2576
    return-void
.end method

.method refresh(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;Z)Ljava/lang/Object;
    .registers 9
    .param p2, "hash"    # I
    .param p4, "checkTime"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;Z)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    const/4 v2, 0x0

    .line 2379
    invoke-virtual {p0, p1, p2, p4}, Lcom/google/common/cache/LocalCache$Segment;->insertLoadingValueReference(Ljava/lang/Object;IZ)Lcom/google/common/cache/LocalCache$LoadingValueReference;

    move-result-object v0

    .line 2381
    .local v0, "loadingValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    if-nez v0, :cond_8

    .line 2393
    :cond_7
    :goto_7
    return-object v2

    .line 2385
    :cond_8
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/google/common/cache/LocalCache$Segment;->loadAsync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Lcom/google/common/cache/CacheLoader;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 2386
    .local v1, "result":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TV;>;"
    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 2388
    :try_start_12
    invoke-static {v1}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_15} :catch_17

    move-result-object v2

    goto :goto_7

    .line 2389
    :catch_17
    move-exception v3

    goto :goto_7
.end method

.method remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 18
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 3062
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3064
    :try_start_3
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v1}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 3065
    .local v12, "now":J
    invoke-virtual {p0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3067
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3068
    .local v10, "newCount":I
    iget-object v14, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3069
    .local v14, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int v9, p2, v1

    .line 3070
    .local v9, "index":I
    invoke-virtual {v14, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3072
    .local v2, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v3, v2

    .local v3, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_23
    if-eqz v3, :cond_7e

    .line 3073
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 3074
    .local v4, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    move/from16 v0, p2

    if-ne v1, v0, :cond_79

    if-eqz v4, :cond_79

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_79

    .line 3076
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3077
    .local v6, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v8

    .line 3080
    .local v8, "entryValue":Ljava/lang/Object;, "TV;"
    if-eqz v8, :cond_68

    .line 3081
    sget-object v7, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    .line 3089
    .local v7, "cause":Lcom/google/common/cache/RemovalCause;
    :goto_4b
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    move-object v1, p0

    move/from16 v5, p2

    .line 3090
    invoke-virtual/range {v1 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 3092
    .local v11, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3093
    invoke-virtual {v14, v9, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3094
    iput v10, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_61
    .catchall {:try_start_3 .. :try_end_61} :catchall_86

    .line 3101
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3102
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    .end local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v11    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_67
    return-object v8

    .line 3082
    .restart local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_68
    :try_start_68
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v1

    if-eqz v1, :cond_71

    .line 3083
    sget-object v7, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;
    :try_end_70
    .catchall {:try_start_68 .. :try_end_70} :catchall_86

    .restart local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    goto :goto_4b

    .line 3086
    .end local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    :cond_71
    const/4 v8, 0x0

    .line 3101
    .end local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3102
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_67

    .line 3072
    .end local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_79
    :try_start_79
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_7c
    .catchall {:try_start_79 .. :try_end_7c} :catchall_86

    move-result-object v3

    goto :goto_23

    .line 3099
    .end local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_7e
    const/4 v8, 0x0

    .line 3101
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3102
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_67

    .line 3101
    .end local v2    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9    # "index":I
    .end local v10    # "newCount":I
    .end local v12    # "now":J
    .end local v14    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_86
    move-exception v1

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3102
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v1
.end method

.method remove(Ljava/lang/Object;ILjava/lang/Object;)Z
    .registers 19
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 3167
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3169
    :try_start_3
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v1}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v12

    .line 3170
    .local v12, "now":J
    invoke-virtual {p0, v12, v13}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3172
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3173
    .local v10, "newCount":I
    iget-object v14, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3174
    .local v14, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    and-int v9, p2, v1

    .line 3175
    .local v9, "index":I
    invoke-virtual {v14, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3177
    .local v2, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v3, v2

    .local v3, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_23
    if-eqz v3, :cond_91

    .line 3178
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 3179
    .local v4, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v1

    move/from16 v0, p2

    if-ne v1, v0, :cond_8c

    if-eqz v4, :cond_8c

    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0, v4}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8c

    .line 3181
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3182
    .local v6, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v8

    .line 3185
    .local v8, "entryValue":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v1, v1, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p3

    invoke-virtual {v1, v0, v8}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_77

    .line 3186
    sget-object v7, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;

    .line 3194
    .local v7, "cause":Lcom/google/common/cache/RemovalCause;
    :goto_55
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    move-object v1, p0

    move/from16 v5, p2

    .line 3195
    invoke-virtual/range {v1 .. v7}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v11

    .line 3197
    .local v11, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v10, v1, -0x1

    .line 3198
    invoke-virtual {v14, v9, v11}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3199
    iput v10, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3200
    sget-object v1, Lcom/google/common/cache/RemovalCause;->EXPLICIT:Lcom/google/common/cache/RemovalCause;
    :try_end_6d
    .catchall {:try_start_3 .. :try_end_6d} :catchall_99

    if-ne v7, v1, :cond_8a

    const/4 v1, 0x1

    .line 3206
    :goto_70
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3207
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    .end local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v11    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_76
    return v1

    .line 3187
    .restart local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_77
    if-nez v8, :cond_82

    :try_start_79
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v1

    if-eqz v1, :cond_82

    .line 3188
    sget-object v7, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;
    :try_end_81
    .catchall {:try_start_79 .. :try_end_81} :catchall_99

    .restart local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    goto :goto_55

    .line 3191
    .end local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    :cond_82
    const/4 v1, 0x0

    .line 3206
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3207
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_76

    .line 3200
    .restart local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    .restart local v11    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_8a
    const/4 v1, 0x0

    goto :goto_70

    .line 3177
    .end local v6    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v7    # "cause":Lcom/google/common/cache/RemovalCause;
    .end local v8    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v11    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_8c
    :try_start_8c
    invoke-interface {v3}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_8f
    .catchall {:try_start_8c .. :try_end_8f} :catchall_99

    move-result-object v3

    goto :goto_23

    .line 3204
    .end local v4    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_91
    const/4 v1, 0x0

    .line 3206
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3207
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_76

    .line 3206
    .end local v2    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9    # "index":I
    .end local v10    # "newCount":I
    .end local v12    # "now":J
    .end local v14    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_99
    move-exception v1

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3207
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v1
.end method

.method removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3279
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    sget-object v0, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    invoke-virtual {p0, p1, v0}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/RemovalCause;)V

    .line 3280
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3281
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3282
    return-void
.end method

.method removeEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;ILcom/google/common/cache/RemovalCause;)Z
    .registers 15
    .param p2, "hash"    # I
    .param p3, "cause"    # Lcom/google/common/cache/RemovalCause;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;I",
            "Lcom/google/common/cache/RemovalCause;",
            ")Z"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3386
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3387
    .local v8, "newCount":I
    iget-object v10, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3388
    .local v10, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    and-int v7, p2, v0

    .line 3389
    .local v7, "index":I
    invoke-virtual {v10, v7}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3391
    .local v1, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v2, v1

    .local v2, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_15
    if-eqz v2, :cond_3e

    .line 3392
    if-ne v2, p1, :cond_39

    .line 3393
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3394
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v5

    move-object v0, p0

    move v4, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v9

    .line 3396
    .local v9, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v0, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v8, v0, -0x1

    .line 3397
    invoke-virtual {v10, v7, v9}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3398
    iput v8, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3399
    const/4 v0, 0x1

    .line 3403
    .end local v9    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_38
    return v0

    .line 3391
    :cond_39
    invoke-interface {v2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    goto :goto_15

    .line 3403
    :cond_3e
    const/4 v0, 0x0

    goto :goto_38
.end method

.method removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;)",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3262
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    iget v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3263
    .local v1, "newCount":I
    invoke-interface {p2}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v2

    .line 3264
    .local v2, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, p1

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_7
    if-eq v0, p2, :cond_1b

    .line 3265
    invoke-virtual {p0, v0, v2}, Lcom/google/common/cache/LocalCache$Segment;->copyEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v3

    .line 3266
    .local v3, "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    if-eqz v3, :cond_15

    .line 3267
    move-object v2, v3

    .line 3264
    :goto_10
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v0

    goto :goto_7

    .line 3269
    :cond_15
    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$Segment;->removeCollectedEntry(Lcom/google/common/cache/LocalCache$ReferenceEntry;)V

    .line 3270
    add-int/lit8 v1, v1, -0x1

    goto :goto_10

    .line 3273
    .end local v3    # "next":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_1b
    iput v1, p0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3274
    return-object v2
.end method

.method removeLoadingValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;)Z
    .registers 13
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "valueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    const/4 v7, 0x0

    .line 3353
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3355
    :try_start_4
    iget-object v5, p0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    .line 3356
    .local v5, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    and-int v3, p2, v8

    .line 3357
    .local v3, "index":I
    invoke-virtual {v5, v3}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3359
    .local v2, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v0, v2

    .local v0, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_15
    if-eqz v0, :cond_64

    .line 3360
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 3361
    .local v1, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v8

    if-ne v8, p2, :cond_5f

    if-eqz v1, :cond_5f

    iget-object v8, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v8, v8, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    invoke-virtual {v8, p1, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5f

    .line 3363
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v6

    .line 3364
    .local v6, "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    if-ne v6, p3, :cond_58

    .line 3365
    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->isActive()Z

    move-result v7

    if-eqz v7, :cond_48

    .line 3366
    invoke-virtual {p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->getOldValue()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V
    :try_end_40
    .catchall {:try_start_4 .. :try_end_40} :catchall_50

    .line 3371
    :goto_40
    const/4 v7, 0x1

    .line 3379
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3380
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v6    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_47
    return v7

    .line 3368
    .restart local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v6    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_48
    :try_start_48
    invoke-virtual {p0, v2, v0}, Lcom/google/common/cache/LocalCache$Segment;->removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v4

    .line 3369
    .local v4, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    invoke-virtual {v5, v3, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V
    :try_end_4f
    .catchall {:try_start_48 .. :try_end_4f} :catchall_50

    goto :goto_40

    .line 3379
    .end local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v2    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v3    # "index":I
    .end local v4    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .end local v6    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :catchall_50
    move-exception v7

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3380
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v7

    .line 3379
    .restart local v0    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v2    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .restart local v3    # "index":I
    .restart local v5    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    .restart local v6    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_58
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3380
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_47

    .line 3359
    .end local v6    # "v":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_5f
    :try_start_5f
    invoke-interface {v0}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_50

    move-result-object v0

    goto :goto_15

    .line 3379
    .end local v1    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_64
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3380
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_47
.end method

.method removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;
    .registers 8
    .param p3    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "hash"    # I
    .param p6, "cause"    # Lcom/google/common/cache/RemovalCause;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;I",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;",
            "Lcom/google/common/cache/RemovalCause;",
            ")",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 3246
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p3, "key":Ljava/lang/Object;, "TK;"
    .local p5, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 3247
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->writeQueue:Ljava/util/Queue;

    invoke-interface {v0, p2}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3248
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->accessQueue:Ljava/util/Queue;

    invoke-interface {v0, p2}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 3250
    invoke-interface {p5}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 3251
    const/4 v0, 0x0

    invoke-interface {p5, v0}, Lcom/google/common/cache/LocalCache$ValueReference;->notifyNewValue(Ljava/lang/Object;)V

    .line 3254
    .end local p1    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_17
    return-object p1

    .restart local p1    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_18
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->removeEntryFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object p1

    goto :goto_17
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 24
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;)TV;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 3016
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3018
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v13

    .line 3019
    .local v13, "now":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3021
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v19, v0

    .line 3022
    .local v19, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    and-int v16, p2, v3

    .line 3023
    .local v16, "index":I
    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3025
    .local v4, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v4

    .local v5, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_2b
    if-eqz v5, :cond_bf

    .line 3026
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 3027
    .local v6, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v3

    move/from16 v0, p2

    if-ne v3, v0, :cond_b9

    if-eqz v6, :cond_b9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b9

    .line 3029
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 3030
    .local v8, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 3031
    .local v15, "entryValue":Ljava/lang/Object;, "TV;"
    if-nez v15, :cond_90

    .line 3032
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_88

    .line 3034
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3035
    .local v17, "newCount":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3036
    sget-object v9, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v3, p0

    move/from16 v7, p2

    invoke-virtual/range {v3 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v18

    .line 3038
    .local v18, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 3039
    move-object/from16 v0, v19

    move/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3040
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_88
    .catchall {:try_start_3 .. :try_end_88} :catchall_c7

    .line 3042
    .end local v17    # "newCount":I
    .end local v18    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_88
    const/4 v15, 0x0

    .line 3055
    .end local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3056
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_8f
    return-object v15

    .line 3045
    .restart local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_90
    :try_start_90
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3046
    sget-object v3, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v9, p0

    move-object v10, v5

    move-object/from16 v11, p1

    move-object/from16 v12, p3

    .line 3047
    invoke-virtual/range {v9 .. v14}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3048
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_b2
    .catchall {:try_start_90 .. :try_end_b2} :catchall_c7

    .line 3055
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3056
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_8f

    .line 3025
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_b9
    :try_start_b9
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_bc
    .catchall {:try_start_b9 .. :try_end_bc} :catchall_c7

    move-result-object v5

    goto/16 :goto_2b

    .line 3053
    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_bf
    const/4 v15, 0x0

    .line 3055
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3056
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_8f

    .line 3055
    .end local v4    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v13    # "now":J
    .end local v16    # "index":I
    .end local v19    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_c7
    move-exception v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3056
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method replace(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)Z
    .registers 25
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ITV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 2963
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValue":Ljava/lang/Object;, "TV;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 2965
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v13

    .line 2966
    .local v13, "now":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 2968
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v19, v0

    .line 2969
    .local v19, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    and-int v16, p2, v3

    .line 2970
    .local v16, "index":I
    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 2972
    .local v4, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object v5, v4

    .local v5, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_2b
    if-eqz v5, :cond_db

    .line 2973
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v6

    .line 2974
    .local v6, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v3

    move/from16 v0, p2

    if-ne v3, v0, :cond_d5

    if-eqz v6, :cond_d5

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v6}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d5

    .line 2976
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v8

    .line 2977
    .local v8, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v15

    .line 2978
    .local v15, "entryValue":Ljava/lang/Object;, "TV;"
    if-nez v15, :cond_90

    .line 2979
    invoke-interface {v8}, Lcom/google/common/cache/LocalCache$ValueReference;->isActive()Z

    move-result v3

    if-eqz v3, :cond_88

    .line 2981
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 2982
    .local v17, "newCount":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2983
    sget-object v9, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v3, p0

    move/from16 v7, p2

    invoke-virtual/range {v3 .. v9}, Lcom/google/common/cache/LocalCache$Segment;->removeValueFromChain(Lcom/google/common/cache/LocalCache$ReferenceEntry;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v18

    .line 2985
    .local v18, "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v17, v3, -0x1

    .line 2986
    move-object/from16 v0, v19

    move/from16 v1, v16

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 2987
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I
    :try_end_88
    .catchall {:try_start_3 .. :try_end_88} :catchall_e3

    .line 2989
    .end local v17    # "newCount":I
    .end local v18    # "newFirst":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :cond_88
    const/4 v3, 0x0

    .line 3009
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3010
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    :goto_8f
    return v3

    .line 2992
    .restart local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .restart local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_90
    :try_start_90
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->valueEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p3

    invoke-virtual {v3, v0, v15}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 2993
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 2994
    sget-object v3, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v3}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    move-object/from16 v9, p0

    move-object v10, v5

    move-object/from16 v11, p1

    move-object/from16 v12, p4

    .line 2995
    invoke-virtual/range {v9 .. v14}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 2996
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_c0
    .catchall {:try_start_90 .. :try_end_c0} :catchall_e3

    .line 2997
    const/4 v3, 0x1

    .line 3009
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3010
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_8f

    .line 3001
    :cond_c8
    :try_start_c8
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v13, v14}, Lcom/google/common/cache/LocalCache$Segment;->recordLockedRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_cd
    .catchall {:try_start_c8 .. :try_end_cd} :catchall_e3

    .line 3002
    const/4 v3, 0x0

    .line 3009
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3010
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_8f

    .line 2972
    .end local v8    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    .end local v15    # "entryValue":Ljava/lang/Object;, "TV;"
    :cond_d5
    :try_start_d5
    invoke-interface {v5}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;
    :try_end_d8
    .catchall {:try_start_d5 .. :try_end_d8} :catchall_e3

    move-result-object v5

    goto/16 :goto_2b

    .line 3007
    .end local v6    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_db
    const/4 v3, 0x0

    .line 3009
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3010
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_8f

    .line 3009
    .end local v4    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v5    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v13    # "now":J
    .end local v16    # "index":I
    .end local v19    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_e3
    move-exception v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3010
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v3
.end method

.method runLockedCleanup(J)V
    .registers 5
    .param p1, "now"    # J

    .prologue
    .line 3441
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 3443
    :try_start_6
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainReferenceQueues()V

    .line 3444
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->expireEntries(J)V

    .line 3445
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->readCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_16

    .line 3447
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3450
    :cond_15
    return-void

    .line 3447
    :catchall_16
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method runUnlockedCleanup()V
    .registers 2

    .prologue
    .line 3454
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->isHeldByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_b

    .line 3455
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v0}, Lcom/google/common/cache/LocalCache;->processPendingNotifications()V

    .line 3457
    :cond_b
    return-void
.end method

.method scheduleRefresh(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;ILjava/lang/Object;JLcom/google/common/cache/CacheLoader;)Ljava/lang/Object;
    .registers 13
    .param p3, "hash"    # I
    .param p5, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;ITV;J",
            "Lcom/google/common/cache/CacheLoader",
            "<-TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 2361
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p4, "oldValue":Ljava/lang/Object;, "TV;"
    .local p7, "loader":Lcom/google/common/cache/CacheLoader;, "Lcom/google/common/cache/CacheLoader<-TK;TV;>;"
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    invoke-virtual {v1}, Lcom/google/common/cache/LocalCache;->refreshes()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getWriteTime()J

    move-result-wide v1

    sub-long v1, p5, v1

    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-wide v3, v3, Lcom/google/common/cache/LocalCache;->refreshNanos:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_28

    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v1

    if-nez v1, :cond_28

    .line 2363
    const/4 v1, 0x1

    invoke-virtual {p0, p2, p3, p7, v1}, Lcom/google/common/cache/LocalCache$Segment;->refresh(Ljava/lang/Object;ILcom/google/common/cache/CacheLoader;Z)Ljava/lang/Object;

    move-result-object v0

    .line 2364
    .local v0, "newValue":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_28

    .line 2368
    .end local v0    # "newValue":Ljava/lang/Object;, "TV;"
    :goto_27
    return-object v0

    :cond_28
    move-object v0, p4

    goto :goto_27
.end method

.method setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V
    .registers 11
    .param p4, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;TV;J)V"
        }
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "Segment.this"
    .end annotation

    .prologue
    .line 2157
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "entry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {p1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v0

    .line 2158
    .local v0, "previous":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->weigher:Lcom/google/common/cache/Weigher;

    invoke-interface {v3, p2, p3}, Lcom/google/common/cache/Weigher;->weigh(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    .line 2159
    .local v2, "weight":I
    if-ltz v2, :cond_26

    const/4 v3, 0x1

    :goto_f
    const-string v4, "Weights must be non-negative"

    invoke-static {v3, v4}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 2161
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->valueStrength:Lcom/google/common/cache/LocalCache$Strength;

    invoke-virtual {v3, p0, p1, p3, v2}, Lcom/google/common/cache/LocalCache$Strength;->referenceValue(Lcom/google/common/cache/LocalCache$Segment;Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;I)Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v1

    .line 2163
    .local v1, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface {p1, v1}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->setValueReference(Lcom/google/common/cache/LocalCache$ValueReference;)V

    .line 2164
    invoke-virtual {p0, p1, v2, p4, p5}, Lcom/google/common/cache/LocalCache$Segment;->recordWrite(Lcom/google/common/cache/LocalCache$ReferenceEntry;IJ)V

    .line 2165
    invoke-interface {v0, p3}, Lcom/google/common/cache/LocalCache$ValueReference;->notifyNewValue(Ljava/lang/Object;)V

    .line 2166
    return-void

    .line 2159
    .end local v1    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_26
    const/4 v3, 0x0

    goto :goto_f
.end method

.method storeLoadedValue(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$LoadingValueReference;Ljava/lang/Object;)Z
    .registers 30
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lcom/google/common/cache/LocalCache$LoadingValueReference",
            "<TK;TV;>;TV;)Z"
        }
    .end annotation

    .prologue
    .line 3108
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "oldValueReference":Lcom/google/common/cache/LocalCache$LoadingValueReference;, "Lcom/google/common/cache/LocalCache$LoadingValueReference<TK;TV;>;"
    .local p4, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->lock()V

    .line 3110
    :try_start_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v5, v5, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v5}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v9

    .line 3111
    .local v9, "now":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lcom/google/common/cache/LocalCache$Segment;->preWriteCleanup(J)V

    .line 3113
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v22, v5, 0x1

    .line 3114
    .local v22, "newCount":I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->threshold:I

    move/from16 v0, v22

    if-le v0, v5, :cond_29

    .line 3115
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->expand()V

    .line 3116
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->count:I

    add-int/lit8 v22, v5, 0x1

    .line 3119
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/common/cache/LocalCache$Segment;->table:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move-object/from16 v23, v0

    .line 3120
    .local v23, "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    and-int v21, p2, v5

    .line 3121
    .local v21, "index":I
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/google/common/cache/LocalCache$ReferenceEntry;

    .line 3123
    .local v20, "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v6, v20

    .local v6, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    :goto_43
    if-eqz v6, :cond_de

    .line 3124
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v18

    .line 3125
    .local v18, "entryKey":Ljava/lang/Object;, "TK;"
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getHash()I

    move-result v5

    move/from16 v0, p2

    if-ne v5, v0, :cond_d8

    if-eqz v18, :cond_d8

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v5, v5, Lcom/google/common/cache/LocalCache;->keyEquivalence:Lcom/google/common/base/Equivalence;

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Lcom/google/common/base/Equivalence;->equivalent(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d8

    .line 3127
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getValueReference()Lcom/google/common/cache/LocalCache$ValueReference;

    move-result-object v24

    .line 3128
    .local v24, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    invoke-interface/range {v24 .. v24}, Lcom/google/common/cache/LocalCache$ValueReference;->get()Ljava/lang/Object;

    move-result-object v19

    .line 3131
    .local v19, "entryValue":Ljava/lang/Object;, "TV;"
    move-object/from16 v0, p3

    move-object/from16 v1, v24

    if-eq v0, v1, :cond_79

    if-nez v19, :cond_b9

    sget-object v5, Lcom/google/common/cache/LocalCache;->UNSET:Lcom/google/common/cache/LocalCache$ValueReference;

    move-object/from16 v0, v24

    if-eq v0, v5, :cond_b9

    .line 3133
    :cond_79
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3134
    invoke-virtual/range {p3 .. p3}, Lcom/google/common/cache/LocalCache$LoadingValueReference;->isActive()Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 3135
    if-nez v19, :cond_b6

    sget-object v17, Lcom/google/common/cache/RemovalCause;->COLLECTED:Lcom/google/common/cache/RemovalCause;

    .line 3137
    .local v17, "cause":Lcom/google/common/cache/RemovalCause;
    :goto_8d
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, v17

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V

    .line 3138
    add-int/lit8 v22, v22, -0x1

    .end local v17    # "cause":Lcom/google/common/cache/RemovalCause;
    :cond_9c
    move-object/from16 v5, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p4

    .line 3140
    invoke-virtual/range {v5 .. v10}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3141
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3142
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_ae
    .catchall {:try_start_3 .. :try_end_ae} :catchall_116

    .line 3143
    const/4 v5, 0x1

    .line 3161
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3162
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    .end local v18    # "entryKey":Ljava/lang/Object;, "TK;"
    .end local v19    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v24    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :goto_b5
    return v5

    .line 3135
    .restart local v18    # "entryKey":Ljava/lang/Object;, "TK;"
    .restart local v19    # "entryValue":Ljava/lang/Object;, "TV;"
    .restart local v24    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_b6
    :try_start_b6
    sget-object v17, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    goto :goto_8d

    .line 3147
    :cond_b9
    new-instance v24, Lcom/google/common/cache/LocalCache$WeightedStrongValueReference;

    .end local v24    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v5, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v5}, Lcom/google/common/cache/LocalCache$WeightedStrongValueReference;-><init>(Ljava/lang/Object;I)V

    .line 3148
    .restart local v24    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    sget-object v5, Lcom/google/common/cache/RemovalCause;->REPLACED:Lcom/google/common/cache/RemovalCause;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3, v5}, Lcom/google/common/cache/LocalCache$Segment;->enqueueNotification(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ValueReference;Lcom/google/common/cache/RemovalCause;)V
    :try_end_d0
    .catchall {:try_start_b6 .. :try_end_d0} :catchall_116

    .line 3149
    const/4 v5, 0x0

    .line 3161
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3162
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_b5

    .line 3123
    .end local v19    # "entryValue":Ljava/lang/Object;, "TV;"
    .end local v24    # "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    :cond_d8
    :try_start_d8
    invoke-interface {v6}, Lcom/google/common/cache/LocalCache$ReferenceEntry;->getNext()Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v6

    goto/16 :goto_43

    .line 3153
    .end local v18    # "entryKey":Ljava/lang/Object;, "TK;"
    :cond_de
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    iput v5, v0, Lcom/google/common/cache/LocalCache$Segment;->modCount:I

    .line 3154
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/cache/LocalCache$Segment;->newEntry(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$ReferenceEntry;)Lcom/google/common/cache/LocalCache$ReferenceEntry;

    move-result-object v12

    .local v12, "newEntry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    move-object/from16 v11, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p4

    move-wide v15, v9

    .line 3155
    invoke-virtual/range {v11 .. v16}, Lcom/google/common/cache/LocalCache$Segment;->setValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 3156
    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->set(ILjava/lang/Object;)V

    .line 3157
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/common/cache/LocalCache$Segment;->count:I

    .line 3158
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->evictEntries()V
    :try_end_10e
    .catchall {:try_start_d8 .. :try_end_10e} :catchall_116

    .line 3159
    const/4 v5, 0x1

    .line 3161
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3162
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    goto :goto_b5

    .line 3161
    .end local v6    # "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v9    # "now":J
    .end local v12    # "newEntry":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v20    # "first":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .end local v21    # "index":I
    .end local v22    # "newCount":I
    .end local v23    # "table":Ljava/util/concurrent/atomic/AtomicReferenceArray;, "Ljava/util/concurrent/atomic/AtomicReferenceArray<Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;>;"
    :catchall_116
    move-exception v5

    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 3162
    invoke-virtual/range {p0 .. p0}, Lcom/google/common/cache/LocalCache$Segment;->postWriteCleanup()V

    throw v5
.end method

.method tryDrainReferenceQueues()V
    .registers 2

    .prologue
    .line 2456
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 2458
    :try_start_6
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->drainReferenceQueues()V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_d

    .line 2460
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2463
    :cond_c
    return-void

    .line 2460
    :catchall_d
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method tryExpireEntries(J)V
    .registers 4
    .param p1, "now"    # J

    .prologue
    .line 2604
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 2606
    :try_start_6
    invoke-virtual {p0, p1, p2}, Lcom/google/common/cache/LocalCache$Segment;->expireEntries(J)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_d

    .line 2608
    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    .line 2612
    :cond_c
    return-void

    .line 2608
    :catchall_d
    move-exception v0

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache$Segment;->unlock()V

    throw v0
.end method

.method waitForLoadingValue(Lcom/google/common/cache/LocalCache$ReferenceEntry;Ljava/lang/Object;Lcom/google/common/cache/LocalCache$ValueReference;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/LocalCache$ReferenceEntry",
            "<TK;TV;>;TK;",
            "Lcom/google/common/cache/LocalCache$ValueReference",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/cache/LocalCache$Segment;, "Lcom/google/common/cache/LocalCache$Segment<TK;TV;>;"
    .local p1, "e":Lcom/google/common/cache/LocalCache$ReferenceEntry;, "Lcom/google/common/cache/LocalCache$ReferenceEntry<TK;TV;>;"
    .local p2, "key":Ljava/lang/Object;, "TK;"
    .local p3, "valueReference":Lcom/google/common/cache/LocalCache$ValueReference;, "Lcom/google/common/cache/LocalCache$ValueReference<TK;TV;>;"
    const/4 v4, 0x1

    .line 2291
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->isLoading()Z

    move-result v3

    if-nez v3, :cond_d

    .line 2292
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2295
    :cond_d
    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_45

    move v3, v4

    :goto_14
    const-string v5, "Recursive load"

    invoke-static {v3, v5}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 2298
    :try_start_19
    invoke-interface {p3}, Lcom/google/common/cache/LocalCache$ValueReference;->waitForValue()Ljava/lang/Object;

    move-result-object v2

    .line 2299
    .local v2, "value":Ljava/lang/Object;, "TV;"
    if-nez v2, :cond_47

    .line 2300
    new-instance v3, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CacheLoader returned null for key "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/google/common/cache/CacheLoader$InvalidCacheLoadException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3e
    .catchall {:try_start_19 .. :try_end_3e} :catchall_3e

    .line 2307
    .end local v2    # "value":Ljava/lang/Object;, "TV;"
    :catchall_3e
    move-exception v3

    iget-object v5, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v5, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    throw v3

    .line 2295
    :cond_45
    const/4 v3, 0x0

    goto :goto_14

    .line 2303
    .restart local v2    # "value":Ljava/lang/Object;, "TV;"
    :cond_47
    :try_start_47
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->map:Lcom/google/common/cache/LocalCache;

    iget-object v3, v3, Lcom/google/common/cache/LocalCache;->ticker:Lcom/google/common/base/Ticker;

    invoke-virtual {v3}, Lcom/google/common/base/Ticker;->read()J

    move-result-wide v0

    .line 2304
    .local v0, "now":J
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/cache/LocalCache$Segment;->recordRead(Lcom/google/common/cache/LocalCache$ReferenceEntry;J)V
    :try_end_52
    .catchall {:try_start_47 .. :try_end_52} :catchall_3e

    .line 2307
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment;->statsCounter:Lcom/google/common/cache/AbstractCache$StatsCounter;

    invoke-interface {v3, v4}, Lcom/google/common/cache/AbstractCache$StatsCounter;->recordMisses(I)V

    return-object v2
.end method
