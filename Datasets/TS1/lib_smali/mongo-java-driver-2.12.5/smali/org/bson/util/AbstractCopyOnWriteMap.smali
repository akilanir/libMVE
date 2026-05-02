.class abstract Lorg/bson/util/AbstractCopyOnWriteMap;
.super Ljava/lang/Object;
.source "AbstractCopyOnWriteMap.java"

# interfaces
.implements Ljava/util/concurrent/ConcurrentMap;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/util/AbstractCopyOnWriteMap$1;,
        Lorg/bson/util/AbstractCopyOnWriteMap$Mutable;,
        Lorg/bson/util/AbstractCopyOnWriteMap$Immutable;,
        Lorg/bson/util/AbstractCopyOnWriteMap$View;,
        Lorg/bson/util/AbstractCopyOnWriteMap$CollectionView;,
        Lorg/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator;,
        Lorg/bson/util/AbstractCopyOnWriteMap$EntrySet;,
        Lorg/bson/util/AbstractCopyOnWriteMap$Values;,
        Lorg/bson/util/AbstractCopyOnWriteMap$KeySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        "M::",
        "Ljava/util/Map",
        "<TK;TV;>;>",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/ConcurrentMap",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/ThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3e9325c57bad8916L


# instance fields
.field private volatile delegate:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TM;"
        }
    .end annotation

    .annotation runtime Lorg/bson/util/annotations/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field private final transient lock:Ljava/util/concurrent/locks/Lock;

.field private final view:Lorg/bson/util/AbstractCopyOnWriteMap$View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/AbstractCopyOnWriteMap$View",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/Map;Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;)V
    .registers 5
    .param p2, "viewType"    # Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N::",
            "Ljava/util/Map",
            "<+TK;+TV;>;>(TN;",
            "Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "map":Ljava/util/Map;, "TN;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    .line 69
    const-string v1, "delegate"

    const-string v0, "map"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    .line 70
    const-string v0, "viewType"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-virtual {v0, p0}, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->get(Lorg/bson/util/AbstractCopyOnWriteMap;)Lorg/bson/util/AbstractCopyOnWriteMap$View;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->view:Lorg/bson/util/AbstractCopyOnWriteMap$View;

    .line 71
    return-void
.end method

.method static synthetic access$000(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/bson/util/AbstractCopyOnWriteMap;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100(Lorg/bson/util/AbstractCopyOnWriteMap;)Ljava/util/concurrent/locks/Lock;
    .registers 2
    .param p0, "x0"    # Lorg/bson/util/AbstractCopyOnWriteMap;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 549
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    if-nez p1, :cond_8

    .line 550
    if-nez p2, :cond_6

    const/4 v0, 0x1

    .line 552
    :goto_5
    return v0

    .line 550
    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    .line 552
    :cond_8
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method


# virtual methods
.method public final clear()V
    .registers 3

    .prologue
    .line 88
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 90
    :try_start_5
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_16

    .line 92
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 94
    return-void

    .line 92
    :catchall_16
    move-exception v0

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public final containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 239
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 243
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected copy()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 207
    :try_start_5
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy(Ljava/util/Map;)Ljava/util/Map;
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_11

    move-result-object v0

    .line 209
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_11
    move-exception v0

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method abstract copy(Ljava/util/Map;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N::",
            "Ljava/util/Map",
            "<+TK;+TV;>;>(TN;)TM;"
        }
    .end annotation

    .annotation runtime Lorg/bson/util/annotations/GuardedBy;
        value = "lock"
    .end annotation
.end method

.method public final entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->view:Lorg/bson/util/AbstractCopyOnWriteMap$View;

    invoke-virtual {v0}, Lorg/bson/util/AbstractCopyOnWriteMap$View;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 260
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 247
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final getDelegate()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    return-object v0
.end method

.method public final hashCode()I
    .registers 2

    .prologue
    .line 265
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    return v0
.end method

.method public final isEmpty()Z
    .registers 2

    .prologue
    .line 251
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 227
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->view:Lorg/bson/util/AbstractCopyOnWriteMap$View;

    invoke-virtual {v0}, Lorg/bson/util/AbstractCopyOnWriteMap$View;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 165
    :try_start_5
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_1b

    move-result-object v0

    .line 167
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_9
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_16

    move-result-object v1

    .line 169
    :try_start_d
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_1b

    .line 172
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    .line 169
    :catchall_16
    move-exception v1

    :try_start_17
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_1b
    .catchall {:try_start_17 .. :try_end_1b} :catchall_1b

    .line 172
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_1b
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final putAll(Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 194
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "t":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 196
    :try_start_5
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;

    move-result-object v0

    .line 197
    .local v0, "map":Ljava/util/Map;, "TM;"
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 198
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_15

    .line 200
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 202
    return-void

    .line 200
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_15
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 179
    :try_start_5
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a

    .line 180
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_23

    move-result-object v0

    .line 182
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_11
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_1e

    move-result-object v1

    .line 184
    :try_start_15
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_23

    .line 189
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :goto_1d
    return-object v1

    .line 184
    .restart local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_1e
    move-exception v1

    :try_start_1f
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_23

    .line 189
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_23
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1

    .line 187
    :cond_2a
    :try_start_2a
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2f
    .catchall {:try_start_2a .. :try_end_2f} :catchall_23

    move-result-object v1

    .line 189
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1d
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 100
    :try_start_5
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_2a

    move-result v1

    if-nez v1, :cond_14

    .line 101
    const/4 v1, 0x0

    .line 110
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_13
    return-object v1

    .line 103
    :cond_14
    :try_start_14
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_2a

    move-result-object v0

    .line 105
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_18
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_25

    move-result-object v1

    .line 107
    :try_start_1c
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_2a

    .line 110
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_13

    .line 107
    :catchall_25
    move-exception v1

    :try_start_26
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2a
    .catchall {:try_start_26 .. :try_end_2a} :catchall_2a

    .line 110
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2a
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 115
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 117
    :try_start_5
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 118
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;

    move-result-object v0

    .line 119
    .local v0, "map":Ljava/util/Map;, "TM;"
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_23
    .catchall {:try_start_5 .. :try_end_23} :catchall_31

    .line 121
    const/4 v1, 0x1

    .line 126
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :goto_29
    return v1

    .line 123
    :cond_2a
    const/4 v1, 0x0

    .line 126
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_29

    :catchall_31
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 148
    :try_start_5
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_2a

    move-result v1

    if-nez v1, :cond_14

    .line 149
    const/4 v1, 0x0

    .line 158
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_13
    return-object v1

    .line 151
    :cond_14
    :try_start_14
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;
    :try_end_17
    .catchall {:try_start_14 .. :try_end_17} :catchall_2a

    move-result-object v0

    .line 153
    .local v0, "map":Ljava/util/Map;, "TM;"
    :try_start_18
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_25

    move-result-object v1

    .line 155
    :try_start_1c
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_2a

    .line 158
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_13

    .line 155
    :catchall_25
    move-exception v1

    :try_start_26
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V

    throw v1
    :try_end_2a
    .catchall {:try_start_26 .. :try_end_2a} :catchall_2a

    .line 158
    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_2a
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;TV;)Z"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "oldValue":Ljava/lang/Object;, "TV;"
    .local p3, "newValue":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 133
    :try_start_5
    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lorg/bson/util/AbstractCopyOnWriteMap;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_16
    .catchall {:try_start_5 .. :try_end_16} :catchall_31

    move-result v1

    if-nez v1, :cond_20

    .line 134
    :cond_19
    const/4 v1, 0x0

    .line 141
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :goto_1f
    return v1

    .line 136
    :cond_20
    :try_start_20
    invoke-virtual {p0}, Lorg/bson/util/AbstractCopyOnWriteMap;->copy()Ljava/util/Map;

    move-result-object v0

    .line 137
    .local v0, "map":Ljava/util/Map;, "TM;"
    invoke-interface {v0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    invoke-virtual {p0, v0}, Lorg/bson/util/AbstractCopyOnWriteMap;->set(Ljava/util/Map;)V
    :try_end_2a
    .catchall {:try_start_20 .. :try_end_2a} :catchall_31

    .line 139
    const/4 v1, 0x1

    .line 141
    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_1f

    .end local v0    # "map":Ljava/util/Map;, "TM;"
    :catchall_31
    move-exception v1

    iget-object v2, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method protected set(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)V"
        }
    .end annotation

    .annotation runtime Lorg/bson/util/annotations/GuardedBy;
        value = "lock"
    .end annotation

    .prologue
    .line 215
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    .local p1, "map":Ljava/util/Map;, "TM;"
    iput-object p1, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    .line 216
    return-void
.end method

.method public final size()I
    .registers 2

    .prologue
    .line 255
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 274
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->delegate:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lorg/bson/util/AbstractCopyOnWriteMap;, "Lorg/bson/util/AbstractCopyOnWriteMap<TK;TV;TM;>;"
    iget-object v0, p0, Lorg/bson/util/AbstractCopyOnWriteMap;->view:Lorg/bson/util/AbstractCopyOnWriteMap$View;

    invoke-virtual {v0}, Lorg/bson/util/AbstractCopyOnWriteMap$View;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
