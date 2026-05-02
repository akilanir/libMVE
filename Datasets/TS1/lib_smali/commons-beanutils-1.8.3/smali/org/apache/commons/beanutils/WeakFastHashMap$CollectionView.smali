.class abstract Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;
.super Ljava/lang/Object;
.source "WeakFastHashMap.java"

# interfaces
.implements Ljava/util/Collection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/WeakFastHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CollectionView"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;
    }
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/WeakFastHashMap;)V
    .registers 2

    .prologue
    .line 492
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 493
    return-void
.end method

.method static access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    .prologue
    .line 490
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 642
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 646
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 500
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 501
    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    monitor-enter v1

    .line 502
    :try_start_b
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->createMap()Ljava/util/Map;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$402(Lorg/apache/commons/beanutils/WeakFastHashMap;Ljava/util/Map;)Ljava/util/Map;

    .line 503
    monitor-exit v1

    .line 509
    :goto_17
    return-void

    .line 503
    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_b .. :try_end_1a} :catchall_18

    throw v0

    .line 505
    :cond_1b
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 506
    :try_start_22
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 507
    monitor-exit v1

    goto :goto_17

    :catchall_31
    move-exception v0

    monitor-exit v1
    :try_end_33
    .catchall {:try_start_22 .. :try_end_33} :catchall_31

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 578
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 579
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 582
    :goto_16
    return v0

    .line 581
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 582
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_16

    .line 583
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 4
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 588
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 589
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    .line 592
    :goto_16
    return v0

    .line 591
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 592
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v1

    goto :goto_16

    .line 593
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 619
    if-ne p1, p0, :cond_4

    .line 620
    const/4 v0, 0x1

    .line 626
    :goto_3
    return v0

    .line 622
    :cond_4
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 623
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3

    .line 625
    :cond_1b
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 626
    :try_start_22
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    goto :goto_3

    .line 627
    :catchall_32
    move-exception v0

    monitor-exit v1
    :try_end_34
    .catchall {:try_start_22 .. :try_end_34} :catchall_32

    throw v0
.end method

.method protected abstract get(Ljava/util/Map;)Ljava/util/Collection;
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 632
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 633
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 636
    :goto_16
    return v0

    .line 635
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 636
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    monitor-exit v1

    goto :goto_16

    .line 637
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 568
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 569
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    .line 572
    :goto_16
    return v0

    .line 571
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 572
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    monitor-exit v1

    goto :goto_16

    .line 573
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 650
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;-><init>(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)V

    return-object v0
.end method

.method protected abstract iteratorNext(Ljava/util/Map$Entry;)Ljava/lang/Object;
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 512
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 513
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    monitor-enter v3

    .line 514
    :try_start_b
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    iget-object v4, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 515
    .local v1, "temp":Ljava/util/Map;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 516
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$402(Lorg/apache/commons/beanutils/WeakFastHashMap;Ljava/util/Map;)Ljava/util/Map;

    .line 517
    monitor-exit v3

    .line 521
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/Map;
    :goto_25
    return v0

    .line 518
    :catchall_26
    move-exception v2

    monitor-exit v3
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_26

    throw v2

    .line 520
    :cond_29
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v3

    monitor-enter v3

    .line 521
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v3

    goto :goto_25

    .line 522
    :catchall_40
    move-exception v2

    monitor-exit v3
    :try_end_42
    .catchall {:try_start_30 .. :try_end_42} :catchall_40

    throw v2
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 7
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 527
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 528
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    monitor-enter v3

    .line 529
    :try_start_b
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    iget-object v4, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 530
    .local v1, "temp":Ljava/util/Map;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    .line 531
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$402(Lorg/apache/commons/beanutils/WeakFastHashMap;Ljava/util/Map;)Ljava/util/Map;

    .line 532
    monitor-exit v3

    .line 536
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/Map;
    :goto_25
    return v0

    .line 533
    :catchall_26
    move-exception v2

    monitor-exit v3
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_26

    throw v2

    .line 535
    :cond_29
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v3

    monitor-enter v3

    .line 536
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v3

    goto :goto_25

    .line 537
    :catchall_40
    move-exception v2

    monitor-exit v3
    :try_end_42
    .catchall {:try_start_30 .. :try_end_42} :catchall_40

    throw v2
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 7
    .param p1, "o"    # Ljava/util/Collection;

    .prologue
    .line 542
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 543
    iget-object v3, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    monitor-enter v3

    .line 544
    :try_start_b
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    iget-object v4, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/commons/beanutils/WeakFastHashMap;->cloneMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 545
    .local v1, "temp":Ljava/util/Map;
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    .line 546
    .local v0, "r":Z
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$402(Lorg/apache/commons/beanutils/WeakFastHashMap;Ljava/util/Map;)Ljava/util/Map;

    .line 547
    monitor-exit v3

    .line 551
    .end local v0    # "r":Z
    .end local v1    # "temp":Ljava/util/Map;
    :goto_25
    return v0

    .line 548
    :catchall_26
    move-exception v2

    monitor-exit v3
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_26

    throw v2

    .line 550
    :cond_29
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v3

    monitor-enter v3

    .line 551
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    monitor-exit v3

    goto :goto_25

    .line 552
    :catchall_40
    move-exception v2

    monitor-exit v3
    :try_end_42
    .catchall {:try_start_30 .. :try_end_42} :catchall_40

    throw v2
.end method

.method public size()I
    .registers 3

    .prologue
    .line 557
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 558
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    .line 561
    :goto_16
    return v0

    .line 560
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 561
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    monitor-exit v1

    goto :goto_16

    .line 562
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 608
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 609
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 612
    :goto_16
    return-object v0

    .line 611
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 612
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_16

    .line 613
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 4
    .param p1, "o"    # [Ljava/lang/Object;

    .prologue
    .line 598
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 599
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 602
    :goto_16
    return-object v0

    .line 601
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    .line 602
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->this$0:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->get(Ljava/util/Map;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    monitor-exit v1

    goto :goto_16

    .line 603
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_1e .. :try_end_30} :catchall_2e

    throw v0
.end method
