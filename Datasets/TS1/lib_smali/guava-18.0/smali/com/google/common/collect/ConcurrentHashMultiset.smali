.class public final Lcom/google/common/collect/ConcurrentHashMultiset;
.super Lcom/google/common/collect/AbstractMultiset;
.source "ConcurrentHashMultiset.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;,
        Lcom/google/common/collect/ConcurrentHashMultiset$FieldSettersHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractMultiset",
        "<TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final transient countMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<TE;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/ConcurrentMap;)V
    .registers 3
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TE;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    .local p1, "countMap":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TE;Ljava/util/concurrent/atomic/AtomicInteger;>;"
    invoke-direct {p0}, Lcom/google/common/collect/AbstractMultiset;-><init>()V

    .line 141
    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 142
    iput-object p1, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    .line 143
    return-void
.end method

.method static synthetic access$100(Lcom/google/common/collect/ConcurrentHashMultiset;)Ljava/util/concurrent/ConcurrentMap;
    .registers 2
    .param p0, "x0"    # Lcom/google/common/collect/ConcurrentHashMultiset;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    return-object v0
.end method

.method public static create()Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/ConcurrentHashMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 87
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset;

    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/common/collect/ConcurrentHashMultiset;-><init>(Ljava/util/concurrent/ConcurrentMap;)V

    return-object v0
.end method

.method public static create(Lcom/google/common/collect/MapMaker;)Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 3
    .param p0, "mapMaker"    # Lcom/google/common/collect/MapMaker;
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/MapMaker;",
            ")",
            "Lcom/google/common/collect/ConcurrentHashMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset;

    invoke-virtual {p0}, Lcom/google/common/collect/MapMaker;->makeMap()Ljava/util/concurrent/ConcurrentMap;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/collect/ConcurrentHashMultiset;-><init>(Ljava/util/concurrent/ConcurrentMap;)V

    return-object v0
.end method

.method public static create(Ljava/lang/Iterable;)Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Lcom/google/common/collect/ConcurrentHashMultiset",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    invoke-static {}, Lcom/google/common/collect/ConcurrentHashMultiset;->create()Lcom/google/common/collect/ConcurrentHashMultiset;

    move-result-object v0

    .line 100
    .local v0, "multiset":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 101
    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 567
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 569
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentMap;

    .line 571
    .local v0, "deserializedCountMap":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TE;Ljava/lang/Integer;>;"
    sget-object v1, Lcom/google/common/collect/ConcurrentHashMultiset$FieldSettersHolder;->COUNT_MAP_FIELD_SETTER:Lcom/google/common/collect/Serialization$FieldSetter;

    invoke-virtual {v1, p0, v0}, Lcom/google/common/collect/Serialization$FieldSetter;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 572
    return-void
.end method

.method private snapshot()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->size()I

    move-result v5

    invoke-static {v5}, Lcom/google/common/collect/Lists;->newArrayListWithExpectedSize(I)Ljava/util/ArrayList;

    move-result-object v4

    .line 191
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<TE;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/Multiset$Entry;

    .line 192
    .local v1, "entry":Lcom/google/common/collect/Multiset$Entry;, "Lcom/google/common/collect/Multiset$Entry<TE;>;"
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    .line 193
    .local v0, "element":Ljava/lang/Object;, "TE;"
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v2

    .local v2, "i":I
    :goto_24
    if-lez v2, :cond_10

    .line 194
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    add-int/lit8 v2, v2, -0x1

    goto :goto_24

    .line 197
    .end local v0    # "element":Ljava/lang/Object;, "TE;"
    .end local v1    # "entry":Lcom/google/common/collect/Multiset$Entry;, "Lcom/google/common/collect/Multiset$Entry<TE;>;"
    .end local v2    # "i":I
    :cond_2c
    return-object v4
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 562
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 563
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 564
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;I)I
    .registers 13
    .param p2, "occurrences"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 212
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    if-nez p2, :cond_c

    .line 214
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset;->count(Ljava/lang/Object;)I

    move-result v7

    .line 248
    :cond_b
    :goto_b
    return v7

    .line 216
    :cond_c
    if-lez p2, :cond_47

    move v5, v6

    :goto_f
    const-string v8, "Invalid occurrences: %s"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v7

    invoke-static {v5, v8, v6}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 219
    :cond_1c
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v5, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 220
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_35

    .line 221
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v6, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {v5, p1, v6}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 222
    .restart local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-eqz v0, :cond_b

    .line 229
    :cond_35
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 230
    .local v3, "oldValue":I
    if-eqz v3, :cond_6f

    .line 232
    :try_start_3b
    invoke-static {v3, p2}, Lcom/google/common/math/IntMath;->checkedAdd(II)I

    move-result v2

    .line 233
    .local v2, "newValue":I
    invoke-virtual {v0, v3, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z
    :try_end_42
    .catch Ljava/lang/ArithmeticException; {:try_start_3b .. :try_end_42} :catch_49

    move-result v5

    if-eqz v5, :cond_35

    move v7, v3

    .line 235
    goto :goto_b

    .end local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v2    # "newValue":I
    .end local v3    # "oldValue":I
    :cond_47
    move v5, v7

    .line 216
    goto :goto_f

    .line 237
    .restart local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    .restart local v3    # "oldValue":I
    :catch_49
    move-exception v4

    .line 238
    .local v4, "overflow":Ljava/lang/ArithmeticException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x41

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v7, "Overflow adding "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " occurrences to a count of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 245
    .end local v4    # "overflow":Ljava/lang/ArithmeticException;
    :cond_6f
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 246
    .local v1, "newCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_b

    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p1, v0, v1}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    goto :goto_b
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic addAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 529
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 530
    return-void
.end method

.method public bridge synthetic contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public count(Ljava/lang/Object;)I
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 154
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    iget-object v1, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v1, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 155
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    goto :goto_b
.end method

.method createElementSet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 449
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    iget-object v1, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 450
    .local v0, "delegate":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    new-instance v1, Lcom/google/common/collect/ConcurrentHashMultiset$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ConcurrentHashMultiset$1;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Ljava/util/Set;)V

    return-object v1
.end method

.method public createEntrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 476
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Lcom/google/common/collect/ConcurrentHashMultiset$1;)V

    return-object v0
.end method

.method distinctElements()I
    .registers 2

    .prologue
    .line 480
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic elementSet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/AbstractMultiset;->elementSet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method entryIterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/common/collect/Multiset$Entry",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 490
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset$2;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ConcurrentHashMultiset$2;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;)V

    .line 508
    .local v0, "readOnlyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/common/collect/Multiset$Entry<TE;>;>;"
    new-instance v1, Lcom/google/common/collect/ConcurrentHashMultiset$3;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ConcurrentHashMultiset$3;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/AbstractMultiset;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hashCode()I
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/AbstractMultiset;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 484
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/AbstractMultiset;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;I)I
    .registers 11
    .param p1, "element"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "occurrences"    # I

    .prologue
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 277
    if-nez p2, :cond_9

    .line 278
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset;->count(Ljava/lang/Object;)I

    move-result v5

    .line 299
    :cond_8
    :goto_8
    return v5

    .line 280
    :cond_9
    if-lez p2, :cond_3e

    move v3, v4

    :goto_c
    const-string v6, "Invalid occurrences: %s"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-static {v3, v6, v4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 282
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v3, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 283
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-eqz v0, :cond_8

    .line 287
    :cond_23
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    .line 288
    .local v2, "oldValue":I
    if-eqz v2, :cond_8

    .line 289
    sub-int v3, v2, p2

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 290
    .local v1, "newValue":I
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 291
    if-nez v1, :cond_3c

    .line 294
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_3c
    move v5, v2

    .line 296
    goto :goto_8

    .end local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v1    # "newValue":I
    .end local v2    # "oldValue":I
    :cond_3e
    move v3, v5

    .line 280
    goto :goto_c
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic removeAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public removeExactly(Ljava/lang/Object;I)Z
    .registers 12
    .param p1, "element"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "occurrences"    # I

    .prologue
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 316
    if-nez p2, :cond_5

    .line 337
    :cond_4
    :goto_4
    return v4

    .line 319
    :cond_5
    if-lez p2, :cond_21

    move v3, v4

    :goto_8
    const-string v6, "Invalid occurrences: %s"

    new-array v7, v4, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static {v3, v6, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 321
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v3, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 322
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_23

    move v4, v5

    .line 323
    goto :goto_4

    .end local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_21
    move v3, v5

    .line 319
    goto :goto_8

    .line 326
    .restart local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_23
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    .line 327
    .local v2, "oldValue":I
    if-ge v2, p2, :cond_2b

    move v4, v5

    .line 328
    goto :goto_4

    .line 330
    :cond_2b
    sub-int v1, v2, p2

    .line 331
    .local v1, "newValue":I
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 332
    if-nez v1, :cond_4

    .line 335
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method public bridge synthetic retainAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public setCount(Ljava/lang/Object;I)I
    .registers 9
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    const/4 v3, 0x0

    .line 350
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    const-string v4, "count"

    invoke-static {p2, v4}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 353
    :cond_9
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v4, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 354
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_28

    .line 355
    if-nez p2, :cond_17

    move v2, v3

    .line 386
    :cond_16
    :goto_16
    return v2

    .line 358
    :cond_17
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v5, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v5, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {v4, p1, v5}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 359
    .restart local v0    # "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_28

    move v2, v3

    .line 360
    goto :goto_16

    .line 367
    :cond_28
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    .line 368
    .local v2, "oldValue":I
    if-nez v2, :cond_49

    .line 369
    if-nez p2, :cond_32

    move v2, v3

    .line 370
    goto :goto_16

    .line 372
    :cond_32
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 373
    .local v1, "newCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_47

    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4, p1, v0, v1}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    :cond_47
    move v2, v3

    .line 375
    goto :goto_16

    .line 380
    .end local v1    # "newCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_49
    invoke-virtual {v0, v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 381
    if-nez p2, :cond_16

    .line 384
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_16
.end method

.method public setCount(Ljava/lang/Object;II)Z
    .registers 11
    .param p2, "expectedOldCount"    # I
    .param p3, "newCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;II)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 405
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    const-string v5, "oldCount"

    invoke-static {p2, v5}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 407
    const-string v5, "newCount"

    invoke-static {p3, v5}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 409
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v5, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 410
    .local v0, "existingCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    if-nez v0, :cond_2e

    .line 411
    if-eqz p2, :cond_1d

    move v3, v4

    .line 443
    :cond_1c
    :goto_1c
    return v3

    .line 413
    :cond_1d
    if-eqz p3, :cond_1c

    .line 417
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v6, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {v5, p1, v6}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1c

    move v3, v4

    goto :goto_1c

    .line 420
    :cond_2e
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    .line 421
    .local v2, "oldValue":I
    if-ne v2, p2, :cond_64

    .line 422
    if-nez v2, :cond_56

    .line 423
    if-nez p3, :cond_3e

    .line 425
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_1c

    .line 428
    :cond_3e
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 429
    .local v1, "newCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_53

    iget-object v5, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p1, v0, v1}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_54

    :cond_53
    move v4, v3

    :cond_54
    move v3, v4

    goto :goto_1c

    .line 433
    .end local v1    # "newCounter":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_56
    invoke-virtual {v0, v2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v5

    if-eqz v5, :cond_64

    .line 434
    if-nez p3, :cond_1c

    .line 437
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_64
    move v3, v4

    .line 443
    goto :goto_1c
.end method

.method public size()I
    .registers 7

    .prologue
    .line 165
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    const-wide/16 v1, 0x0

    .line 166
    .local v1, "sum":J
    iget-object v4, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 167
    .local v3, "value":Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v1, v4

    .line 168
    goto :goto_c

    .line 169
    .end local v3    # "value":Ljava/util/concurrent/atomic/AtomicInteger;
    :cond_1f
    invoke-static {v1, v2}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result v4

    return v4
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 178
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->snapshot()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->snapshot()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    .local p0, "this":Lcom/google/common/collect/ConcurrentHashMultiset;, "Lcom/google/common/collect/ConcurrentHashMultiset<TE;>;"
    invoke-super {p0}, Lcom/google/common/collect/AbstractMultiset;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
