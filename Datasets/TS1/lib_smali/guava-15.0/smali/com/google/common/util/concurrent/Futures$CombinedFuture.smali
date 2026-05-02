.class Lcom/google/common/util/concurrent/Futures$CombinedFuture;
.super Lcom/google/common/util/concurrent/AbstractFuture;
.source "Futures.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/Futures;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CombinedFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/AbstractFuture",
        "<TC;>;"
    }
.end annotation


# static fields
.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field final allMustSucceed:Z

.field combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/Futures$FutureCombiner",
            "<TV;TC;>;"
        }
    .end annotation
.end field

.field futures:Lcom/google/common/collect/ImmutableCollection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableCollection",
            "<+",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<+TV;>;>;"
        }
    .end annotation
.end field

.field final remaining:Ljava/util/concurrent/atomic/AtomicInteger;

.field values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/common/base/Optional",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1459
    const-class v0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/ImmutableCollection;ZLjava/util/concurrent/Executor;Lcom/google/common/util/concurrent/Futures$FutureCombiner;)V
    .registers 7
    .param p2, "allMustSucceed"    # Z
    .param p3, "listenerExecutor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableCollection",
            "<+",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<+TV;>;>;Z",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/common/util/concurrent/Futures$FutureCombiner",
            "<TV;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 1471
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture<TV;TC;>;"
    .local p1, "futures":Lcom/google/common/collect/ImmutableCollection;, "Lcom/google/common/collect/ImmutableCollection<+Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;>;"
    .local p4, "combiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFuture;-><init>()V

    .line 1472
    iput-object p1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    .line 1473
    iput-boolean p2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->allMustSucceed:Z

    .line 1474
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableCollection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1475
    iput-object p4, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1476
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableCollection;->size()I

    move-result v0

    invoke-static {v0}, Lcom/google/common/collect/Lists;->newArrayListWithCapacity(I)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->values:Ljava/util/List;

    .line 1477
    invoke-virtual {p0, p3}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->init(Ljava/util/concurrent/Executor;)V

    .line 1478
    return-void
.end method

.method static synthetic access$400(Lcom/google/common/util/concurrent/Futures$CombinedFuture;ILjava/util/concurrent/Future;)V
    .registers 3
    .param p0, "x0"    # Lcom/google/common/util/concurrent/Futures$CombinedFuture;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/util/concurrent/Future;

    .prologue
    .line 1458
    invoke-direct {p0, p1, p2}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->setOneValue(ILjava/util/concurrent/Future;)V

    return-void
.end method

.method private setExceptionAndMaybeLog(Ljava/lang/Throwable;)V
    .registers 6
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 1547
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture<TV;TC;>;"
    const/4 v0, 0x0

    .line 1548
    .local v0, "result":Z
    iget-boolean v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->allMustSucceed:Z

    if-eqz v1, :cond_9

    .line 1551
    invoke-super {p0, p1}, Lcom/google/common/util/concurrent/AbstractFuture;->setException(Ljava/lang/Throwable;)Z

    move-result v0

    .line 1553
    :cond_9
    instance-of v1, p1, Ljava/lang/Error;

    if-nez v1, :cond_13

    iget-boolean v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->allMustSucceed:Z

    if-eqz v1, :cond_1c

    if-nez v0, :cond_1c

    .line 1554
    :cond_13
    sget-object v1, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v3, "input future failed."

    invoke-virtual {v1, v2, v3, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1556
    :cond_1c
    return-void
.end method

.method private setOneValue(ILjava/util/concurrent/Future;)V
    .registers 13
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Future",
            "<+TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture<TV;TC;>;"
    .local p2, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TV;>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1562
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->values:Ljava/util/List;

    .line 1570
    .local v2, "localValues":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/base/Optional<TV;>;>;"
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v6

    if-nez v6, :cond_c

    if-nez v2, :cond_1c

    .line 1575
    :cond_c
    iget-boolean v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->allMustSucceed:Z

    if-nez v6, :cond_16

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isCancelled()Z

    move-result v6

    if-eqz v6, :cond_4f

    :cond_16
    move v6, v8

    :goto_17
    const-string v9, "Future was done before all dependencies completed"

    invoke-static {v6, v9}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1580
    :cond_1c
    :try_start_1c
    invoke-interface {p2}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v6

    const-string v9, "Tried to set value from future which is not done"

    invoke-static {v6, v9}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1582
    invoke-static {p2}, Lcom/google/common/util/concurrent/Uninterruptibles;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v4

    .line 1583
    .local v4, "returnValue":Ljava/lang/Object;, "TV;"
    if-eqz v2, :cond_32

    .line 1584
    invoke-static {v4}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v6

    invoke-interface {v2, p1, v6}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1c .. :try_end_32} :catch_5b
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1c .. :try_end_32} :catch_8b
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_32} :catch_ba
    .catchall {:try_start_1c .. :try_end_32} :catchall_e7

    .line 1597
    :cond_32
    iget-object v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v3

    .line 1598
    .local v3, "newRemaining":I
    if-ltz v3, :cond_51

    :goto_3a
    const-string v6, "Less than 0 remaining futures"

    invoke-static {v8, v6}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1599
    if-nez v3, :cond_4e

    .line 1600
    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1601
    .local v1, "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    if-eqz v1, :cond_53

    if-eqz v2, :cond_53

    .line 1602
    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    .line 1608
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    .end local v4    # "returnValue":Ljava/lang/Object;, "TV;"
    :cond_4e
    :goto_4e
    return-void

    .end local v3    # "newRemaining":I
    :cond_4f
    move v6, v7

    .line 1575
    goto :goto_17

    .restart local v3    # "newRemaining":I
    .restart local v4    # "returnValue":Ljava/lang/Object;, "TV;"
    :cond_51
    move v8, v7

    .line 1598
    goto :goto_3a

    .line 1604
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_53
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    goto :goto_4e

    .line 1586
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    .end local v3    # "newRemaining":I
    .end local v4    # "returnValue":Ljava/lang/Object;, "TV;"
    :catch_5b
    move-exception v0

    .line 1587
    .local v0, "e":Ljava/util/concurrent/CancellationException;
    :try_start_5c
    iget-boolean v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->allMustSucceed:Z

    if-eqz v6, :cond_64

    .line 1590
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->cancel(Z)Z
    :try_end_64
    .catchall {:try_start_5c .. :try_end_64} :catchall_e7

    .line 1597
    :cond_64
    iget-object v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v3

    .line 1598
    .restart local v3    # "newRemaining":I
    if-ltz v3, :cond_81

    :goto_6c
    const-string v6, "Less than 0 remaining futures"

    invoke-static {v8, v6}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1599
    if-nez v3, :cond_4e

    .line 1600
    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1601
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    if-eqz v1, :cond_83

    if-eqz v2, :cond_83

    .line 1602
    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    goto :goto_4e

    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_81
    move v8, v7

    .line 1598
    goto :goto_6c

    .line 1604
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_83
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    goto :goto_4e

    .line 1592
    .end local v0    # "e":Ljava/util/concurrent/CancellationException;
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    .end local v3    # "newRemaining":I
    :catch_8b
    move-exception v0

    .line 1593
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_8c
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->setExceptionAndMaybeLog(Ljava/lang/Throwable;)V
    :try_end_93
    .catchall {:try_start_8c .. :try_end_93} :catchall_e7

    .line 1597
    iget-object v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v3

    .line 1598
    .restart local v3    # "newRemaining":I
    if-ltz v3, :cond_b0

    :goto_9b
    const-string v6, "Less than 0 remaining futures"

    invoke-static {v8, v6}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1599
    if-nez v3, :cond_4e

    .line 1600
    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1601
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    if-eqz v1, :cond_b2

    if-eqz v2, :cond_b2

    .line 1602
    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    goto :goto_4e

    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_b0
    move v8, v7

    .line 1598
    goto :goto_9b

    .line 1604
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_b2
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    goto :goto_4e

    .line 1594
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    .end local v3    # "newRemaining":I
    :catch_ba
    move-exception v5

    .line 1595
    .local v5, "t":Ljava/lang/Throwable;
    :try_start_bb
    invoke-direct {p0, v5}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->setExceptionAndMaybeLog(Ljava/lang/Throwable;)V
    :try_end_be
    .catchall {:try_start_bb .. :try_end_be} :catchall_e7

    .line 1597
    iget-object v6, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v3

    .line 1598
    .restart local v3    # "newRemaining":I
    if-ltz v3, :cond_dc

    :goto_c6
    const-string v6, "Less than 0 remaining futures"

    invoke-static {v8, v6}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1599
    if-nez v3, :cond_4e

    .line 1600
    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1601
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    if-eqz v1, :cond_de

    if-eqz v2, :cond_de

    .line 1602
    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    goto/16 :goto_4e

    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_dc
    move v8, v7

    .line 1598
    goto :goto_c6

    .line 1604
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_de
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v6

    invoke-static {v6}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    goto/16 :goto_4e

    .line 1597
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    .end local v3    # "newRemaining":I
    .end local v5    # "t":Ljava/lang/Throwable;
    :catchall_e7
    move-exception v6

    iget-object v9, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v3

    .line 1598
    .restart local v3    # "newRemaining":I
    if-ltz v3, :cond_105

    :goto_f0
    const-string v7, "Less than 0 remaining futures"

    invoke-static {v8, v7}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 1599
    if-nez v3, :cond_104

    .line 1600
    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1601
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    if-eqz v1, :cond_107

    if-eqz v2, :cond_107

    .line 1602
    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    .line 1607
    .end local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_104
    :goto_104
    throw v6

    :cond_105
    move v8, v7

    .line 1598
    goto :goto_f0

    .line 1604
    .restart local v1    # "localCombiner":Lcom/google/common/util/concurrent/Futures$FutureCombiner;, "Lcom/google/common/util/concurrent/Futures$FutureCombiner<TV;TC;>;"
    :cond_107
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isDone()Z

    move-result v7

    invoke-static {v7}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    goto :goto_104
.end method


# virtual methods
.method protected init(Ljava/util/concurrent/Executor;)V
    .registers 9
    .param p1, "listenerExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 1485
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture<TV;TC;>;"
    new-instance v5, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;

    invoke-direct {v5, p0}, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;-><init>(Lcom/google/common/util/concurrent/Futures$CombinedFuture;)V

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->sameThreadExecutor()Lcom/google/common/util/concurrent/ListeningExecutorService;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 1510
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableCollection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_22

    .line 1511
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/google/common/util/concurrent/Futures$FutureCombiner;->combine(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->set(Ljava/lang/Object;)Z

    .line 1538
    :cond_21
    return-void

    .line 1516
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableCollection;->size()I

    move-result v5

    if-ge v0, v5, :cond_34

    .line 1517
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->values:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1516
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 1528
    :cond_34
    const/4 v0, 0x0

    .line 1529
    iget-object v5, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_3b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 1530
    .local v4, "listenable":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    move v3, v0

    .line 1531
    .local v3, "index":I
    new-instance v5, Lcom/google/common/util/concurrent/Futures$CombinedFuture$2;

    invoke-direct {v5, p0, v3, v4}, Lcom/google/common/util/concurrent/Futures$CombinedFuture$2;-><init>(Lcom/google/common/util/concurrent/Futures$CombinedFuture;ILcom/google/common/util/concurrent/ListenableFuture;)V

    invoke-interface {v4, v5, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    move v0, v1

    .line 1537
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_3b
.end method
