.class Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;
.super Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView;
.source "AbstractCopyOnWriteMap.java"

# interfaces
.implements Ljava/util/Set;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/AbstractCopyOnWriteMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView",
        "<TK;>;",
        "Ljava/util/Set",
        "<TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/util/AbstractCopyOnWriteMap;


# direct methods
.method private constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap;)V
    .registers 2

    .prologue
    .line 281
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    iput-object p1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-direct {p0}, Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/bson/util/AbstractCopyOnWriteMap;Lorg/bson/util/AbstractCopyOnWriteMap$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/bson/util/AbstractCopyOnWriteMap;
    .param p2, "x1"    # Lorg/bson/util/AbstractCopyOnWriteMap$1;

    .prologue
    .line 281
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    invoke-direct {p0, p1}, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;-><init>(Lorg/bson/util/AbstractCopyOnWriteMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 4

    .prologue
    .line 293
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 295
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;

    move-result-object v0

    .line 296
    .local v0, "map":Ljava/util/Map;, "TM;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 297
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1b
    .catchall {:try_start_9 .. :try_end_1b} :catchall_25

    .line 299
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 301
    return-void

    .line 299
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_25
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

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
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 285
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;
    invoke-static {v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$000(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 304
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v0, p1}, Lorg/bson/util/AbstractCopyOnWriteMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
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
    .line 308
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 310
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2d

    move-result-object v0

    .line 312
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_f
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_26

    move-result v1

    .line 314
    :try_start_17
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_2d

    .line 317
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    .line 314
    :catchall_26
    move-exception v1

    :try_start_27
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2d
    .catchall {:try_start_27 .. :try_end_2d} :catchall_2d

    .line 317
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

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
    .line 322
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>.KeySet;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 324
    :try_start_9
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_2d

    move-result-object v0

    .line 326
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_f
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z
    :try_end_16
    .catchall {:try_start_f .. :try_end_16} :catchall_26

    move-result v1

    .line 328
    :try_start_17
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_2d

    .line 331
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    .line 328
    :catchall_26
    move-exception v1

    :try_start_27
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    invoke-virtual {v2, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2d
    .catchall {:try_start_27 .. :try_end_2d} :catchall_2d

    .line 331
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2d
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;->this$0:Lorg/bson/util/AbstractCopyOnWriteMap;

    # getter for: Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;
    invoke-static {v2}, Lorg/bson/util/AbstractCopyOnWriteMap;->access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
