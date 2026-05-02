.class abstract Lorg/apache/commons/collections/FastHashMap$CollectionView;
.super Ljava/lang/Object;
.source "FastHashMap.java"

# interfaces
.implements Ljava/util/Collection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/FastHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CollectionView"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/collections/FastHashMap$CollectionView$CollectionViewIterator;
    }
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/collections/FastHashMap;


# direct methods
.method public constructor <init>(Lorg/apache/commons/collections/FastHashMap;)V
    .registers 2

    .prologue
    .line 468
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    .line 469
    return-void
.end method

.method static access$300(Lorg/apache/commons/collections/FastHashMap$CollectionView;)Lorg/apache/commons/collections/FastHashMap;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/collections/FastHashMap$CollectionView;

    .prologue
    .line 466
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 618
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 622
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 476
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_17

    .line 477
    iget-object v1, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    monitor-enter v1

    .line 478
    :try_start_9
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 479
    monitor-exit v1

    .line 485
    :goto_13
    return-void

    .line 479
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_14

    throw v0

    .line 481
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 482
    :try_start_1c
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 483
    monitor-exit v1

    goto :goto_13

    :catchall_29
    move-exception v0

    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_1c .. :try_end_2b} :catchall_29

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 554
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 555
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 558
    :goto_12
    return v0

    .line 557
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 558
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_12

    .line 559
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 4
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 564
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 565
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    .line 568
    :goto_12
    return v0

    .line 567
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 568
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v1

    goto :goto_12

    .line 569
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 595
    if-ne p1, p0, :cond_4

    .line 596
    const/4 v0, 0x1

    .line 602
    :goto_3
    return v0

    .line 598
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_17

    .line 599
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3

    .line 601
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 602
    :try_start_1c
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_3

    .line 603
    :catchall_2a
    move-exception v0

    monitor-exit v1
    :try_end_2c
    .catchall {:try_start_1c .. :try_end_2c} :catchall_2a

    throw v0
.end method

.method protected abstract get(Ljava/util/Map;)Ljava/util/Collection;
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 608
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 609
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 612
    :goto_12
    return v0

    .line 611
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 612
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    monitor-exit v1

    goto :goto_12

    .line 613
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 544
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 545
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    .line 548
    :goto_12
    return v0

    .line 547
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 548
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    monitor-exit v1

    goto :goto_12

    .line 549
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 626
    new-instance v0, Lorg/apache/commons/collections/FastHashMap$CollectionView$CollectionViewIterator;

    invoke-direct {v0, p0}, Lorg/apache/commons/collections/FastHashMap$CollectionView$CollectionViewIterator;-><init>(Lorg/apache/commons/collections/FastHashMap$CollectionView;)V

    return-object v0
.end method

.method protected abstract iteratorNext(Ljava/util/Map$Entry;)Ljava/lang/Object;
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 488
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v2, v2, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_24

    .line 489
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    monitor-enter v3

    .line 490
    :try_start_9
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 491
    .local v1, "temp":Ljava/util/HashMap;
    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 492
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iput-object v1, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 493
    monitor-exit v3

    .line 497
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/HashMap;
    :goto_20
    return v0

    .line 494
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_21

    throw v2

    .line 496
    :cond_24
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v3, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 497
    :try_start_29
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v3

    goto :goto_20

    .line 498
    :catchall_37
    move-exception v2

    monitor-exit v3
    :try_end_39
    .catchall {:try_start_29 .. :try_end_39} :catchall_37

    throw v2
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 6
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 503
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v2, v2, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_24

    .line 504
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    monitor-enter v3

    .line 505
    :try_start_9
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 506
    .local v1, "temp":Ljava/util/HashMap;
    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    .line 507
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iput-object v1, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 508
    monitor-exit v3

    .line 512
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/HashMap;
    :goto_20
    return v0

    .line 509
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_21

    throw v2

    .line 511
    :cond_24
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v3, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 512
    :try_start_29
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v3

    goto :goto_20

    .line 513
    :catchall_37
    move-exception v2

    monitor-exit v3
    :try_end_39
    .catchall {:try_start_29 .. :try_end_39} :catchall_37

    throw v2
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 6
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 518
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v2, v2, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v2, :cond_24

    .line 519
    iget-object v3, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    monitor-enter v3

    .line 520
    :try_start_9
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 521
    .local v1, "temp":Ljava/util/HashMap;
    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    .line 522
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iput-object v1, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    .line 523
    monitor-exit v3

    .line 527
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/HashMap;
    :goto_20
    return v0

    .line 524
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_21

    throw v2

    .line 526
    :cond_24
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v3, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v3

    .line 527
    :try_start_29
    iget-object v2, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v2, v2, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v3

    goto :goto_20

    .line 528
    :catchall_37
    move-exception v2

    monitor-exit v3
    :try_end_39
    .catchall {:try_start_29 .. :try_end_39} :catchall_37

    throw v2
.end method

.method public size()I
    .registers 3

    .prologue
    .line 533
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 534
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    .line 537
    :goto_12
    return v0

    .line 536
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 537
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    monitor-exit v1

    goto :goto_12

    .line 538
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 584
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 585
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 588
    :goto_12
    return-object v0

    .line 587
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 588
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_12

    .line 589
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 4
    .param p1, "o"    # [Ljava/lang/Object;

    .prologue
    .line 574
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-boolean v0, v0, Lorg/apache/commons/collections/FastHashMap;->fast:Z

    if-eqz v0, :cond_13

    .line 575
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 578
    :goto_12
    return-object v0

    .line 577
    :cond_13
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v1, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    monitor-enter v1

    .line 578
    :try_start_18
    iget-object v0, p0, Lorg/apache/commons/collections/FastHashMap$CollectionView;->this$0:Lorg/apache/commons/collections/FastHashMap;

    iget-object v0, v0, Lorg/apache/commons/collections/FastHashMap;->map:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/FastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_12

    .line 579
    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_18 .. :try_end_28} :catchall_26

    throw v0
.end method
