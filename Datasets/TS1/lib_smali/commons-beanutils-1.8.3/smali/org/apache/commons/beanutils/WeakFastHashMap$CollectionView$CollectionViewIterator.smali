.class Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;
.super Ljava/lang/Object;
.source "WeakFastHashMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CollectionViewIterator"
.end annotation


# instance fields
.field private expected:Ljava/util/Map;

.field private iterator:Ljava/util/Iterator;

.field private lastReturned:Ljava/util/Map$Entry;

.field private final this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)V
    .registers 3

    .prologue
    .line 659
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    .line 656
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    .line 660
    invoke-static {p1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    .line 661
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->iterator:Ljava/util/Iterator;

    .line 662
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 665
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    if-eq v0, v1, :cond_14

    .line 666
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 668
    :cond_14
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 672
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v1

    if-eq v0, v1, :cond_14

    .line 673
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 675
    :cond_14
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    .line 676
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    iget-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    invoke-virtual {v0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->iteratorNext(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 680
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    if-nez v0, :cond_b

    .line 681
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 683
    :cond_b
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$300(Lorg/apache/commons/beanutils/WeakFastHashMap;)Z

    move-result v0

    if-eqz v0, :cond_55

    .line 684
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v1

    monitor-enter v1

    .line 685
    :try_start_1e
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v2

    if-eq v0, v2, :cond_35

    .line 686
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 691
    :catchall_32
    move-exception v0

    monitor-exit v1
    :try_end_34
    .catchall {:try_start_1e .. :try_end_34} :catchall_32

    throw v0

    .line 688
    :cond_35
    :try_start_35
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v0

    iget-object v2, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    .line 690
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->this$1:Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;->access$500(Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView;)Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->access$400(Lorg/apache/commons/beanutils/WeakFastHashMap;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->expected:Ljava/util/Map;

    .line 691
    monitor-exit v1
    :try_end_54
    .catchall {:try_start_35 .. :try_end_54} :catchall_32

    .line 696
    :goto_54
    return-void

    .line 693
    :cond_55
    iget-object v0, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 694
    iput-object v1, p0, Lorg/apache/commons/beanutils/WeakFastHashMap$CollectionView$CollectionViewIterator;->lastReturned:Ljava/util/Map$Entry;

    goto :goto_54
.end method
