.class final Lorg/bson/util/AbstractCopyOnWriteMap$Values;
.super Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView;
.source "AbstractCopyOnWriteMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/AbstractCopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/util/AbstractCopyOnWriteMap;


# direct methods
.method private constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap;)V
    .registers 2

    .prologue
    .line 336
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    iput-object p1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {p0}, Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap;Lorg/bson/util/AbstractCopyOnWriteMap$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/bson/util/AbstractCopyOnWriteMap;
    .param p2, "x1"    # Lorg/bson/util/AbstractCopyOnWriteMap$1;

    .prologue
    .line 336
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    invoke-direct {p0, p1}, Lorg/bson/util/AbstractCopyOnWriteMap$Values;-><init>(Lorg/bson/util/AbstractCopyOnWriteMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 4

    .prologue
    .line 344
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 346
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;

    move-result-object v0

    .line 347
    .local v0, "map":Ljava/util/Map;, "TM;"
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 348
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1b
    .catchall {:try_start_9 .. :try_end_1b} :catchall_25

    .line 350
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 352
    return-void

    .line 350
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_25
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method getDelegate()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;
    invoke-static {v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$000(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 355
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 357
    :try_start_9
    invoke-virtual {p0, p1}, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->contains(Ljava/lang/Object;)Z
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_3e

    move-result v1

    if-nez v1, :cond_1a

    .line 358
    const/4 v1, 0x0

    .line 367
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_19
    return v1

    .line 360
    :cond_1a
    :try_start_1a
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_3e

    move-result-object v0

    .line 362
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_20
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z
    :try_end_27
    .catchall {:try_start_20 .. :try_end_27} :catchall_37

    move-result v1

    .line 364
    :try_start_28
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_3e

    .line 367
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_19

    .line 364
    :catchall_37
    move-exception v1

    :try_start_38
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_3e
    .catchall {:try_start_38 .. :try_end_3e} :catchall_3e

    .line 367
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_3e
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 372
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 374
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2d

    move-result-object v0

    .line 376
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_f
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_26

    move-result v1

    .line 378
    :try_start_17
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_2d

    .line 381
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    .line 378
    :catchall_26
    move-exception v1

    :try_start_27
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2d
    .catchall {:try_start_27 .. :try_end_2d} :catchall_2d

    .line 381
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$Values;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.Values;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 388
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2d

    move-result-object v0

    .line 390
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_f
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_26

    move-result v1

    .line 392
    :try_start_17
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_2d

    .line 395
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    .line 392
    :catchall_26
    move-exception v1

    :try_start_27
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2d
    .catchall {:try_start_27 .. :try_end_2d} :catchall_2d

    .line 395
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$Values;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
