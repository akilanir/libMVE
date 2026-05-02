.class public Lorg/ini4j/BasicMultiMap;
.super Ljava/lang/Object;
.source "BasicMultiMap.java"

# interfaces
.implements Lorg/ini4j/MultiMap;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/BasicMultiMap$ShadowEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/ini4j/MultiMap",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x417542d36c202fd5L


# instance fields
.field private final _impl:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/List",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 38
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-direct {p0, v0}, Lorg/ini4j/BasicMultiMap;-><init>(Ljava/util/Map;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/List",
            "<TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "impl":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/util/List<TV;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    .line 44
    return-void
.end method

.method private getList(Ljava/lang/Object;Z)Ljava/util/List;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "create"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Z)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 232
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 234
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_16

    if-eqz p2, :cond_16

    .line 236
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 237
    .restart local v0    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    :cond_16
    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    return-void
.end method

.method public add(Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 5
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;I)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 64
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 68
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 69
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 73
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 78
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    const/4 v2, 0x0

    .line 80
    .local v2, "ret":Z
    iget-object v3, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 82
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 84
    const/4 v2, 0x1

    .line 90
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_1e
    return v2
.end method

.method public entrySet()Ljava/util/Set;
    .registers 5
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
    .line 95
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 97
    .local v2, "ret":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-virtual {p0}, Lorg/ini4j/BasicMultiMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 99
    .local v1, "key":Ljava/lang/Object;, "TK;"
    new-instance v3, Lorg/ini4j/BasicMultiMap$ShadowEntry;

    invoke-direct {v3, p0, v1}, Lorg/ini4j/BasicMultiMap$ShadowEntry;-><init>(Lorg/ini4j/BasicMultiMap;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 102
    .end local v1    # "key":Ljava/lang/Object;, "TK;"
    :cond_20
    return-object v2
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 109
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_9

    const/4 v1, 0x0

    :goto_8
    return-object v1

    :cond_9
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_8
.end method

.method public get(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 116
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_9

    const/4 v1, 0x0

    :goto_8
    return-object v1

    :cond_9
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_8
.end method

.method public getAll(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 53
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public length(Ljava/lang/Object;)I
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    const/4 v1, 0x0

    .line 126
    invoke-direct {p0, p1, v1}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 128
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_8

    :goto_7
    return v1

    :cond_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_7
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x0

    .line 134
    .local v0, "ret":Ljava/lang/Object;, "TV;"
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v1

    .line 136
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 138
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    .end local v0    # "ret":Ljava/lang/Object;, "TV;"
    :goto_f
    return-object v0

    .line 142
    .restart local v0    # "ret":Ljava/lang/Object;, "TV;"
    :cond_10
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_f
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 5
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;I)TV;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/List",
            "<TV;>;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 178
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    instance-of v4, p1, Lorg/ini4j/MultiMap;

    if-eqz v4, :cond_21

    move-object v3, p1

    .line 158
    check-cast v3, Lorg/ini4j/MultiMap;

    .line 160
    .local v3, "mm":Lorg/ini4j/MultiMap;, "Lorg/ini4j/MultiMap<TK;TV;>;"
    invoke-interface {v3}, Lorg/ini4j/MultiMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 162
    .local v1, "key":Ljava/lang/Object;
    invoke-interface {v3, v1}, Lorg/ini4j/MultiMap;->getAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lorg/ini4j/BasicMultiMap;->putAll(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;

    goto :goto_f

    .line 167
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/Object;
    .end local v3    # "mm":Lorg/ini4j/MultiMap;, "Lorg/ini4j/MultiMap<TK;TV;>;"
    :cond_21
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 169
    .local v2, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v2, v4}, Lorg/ini4j/BasicMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    .line 172
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    :cond_3b
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v1, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 187
    .local v0, "prev":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_b
.end method

.method public remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)TV;"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    const/4 v0, 0x0

    .line 193
    .local v0, "ret":Ljava/lang/Object;, "TV;"
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lorg/ini4j/BasicMultiMap;->getList(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v1

    .line 195
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz v1, :cond_17

    .line 197
    invoke-interface {v1, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .line 198
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 200
    iget-object v2, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .end local v0    # "ret":Ljava/lang/Object;, "TV;"
    :cond_17
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 209
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 214
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    iget-object v0, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "this":Lorg/ini4j/BasicMultiMap;, "Lorg/ini4j/BasicMultiMap<TK;TV;>;"
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 221
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v3, p0, Lorg/ini4j/BasicMultiMap;->_impl:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 223
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_15

    .line 226
    .end local v2    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_25
    return-object v0
.end method
