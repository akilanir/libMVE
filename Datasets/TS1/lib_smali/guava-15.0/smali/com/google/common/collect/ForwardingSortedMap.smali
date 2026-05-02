.class public abstract Lcom/google/common/collect/ForwardingSortedMap;
.super Lcom/google/common/collect/ForwardingMap;
.source "ForwardingSortedMap.java"

# interfaces
.implements Ljava/util/SortedMap;


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ForwardingSortedMap$StandardKeySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMap",
        "<TK;TV;>;",
        "Ljava/util/SortedMap",
        "<TK;TV;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 62
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMap;-><init>()V

    return-void
.end method

.method private unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5
    .param p1, "k1"    # Ljava/lang/Object;
    .param p2, "k2"    # Ljava/lang/Object;

    .prologue
    .line 114
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->comparator()Ljava/util/Comparator;

    move-result-object v0

    .line 115
    .local v0, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TK;>;"
    if-nez v0, :cond_d

    .line 116
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "k1":Ljava/lang/Object;
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    .line 118
    :goto_c
    return v1

    .restart local p1    # "k1":Ljava/lang/Object;
    :cond_d
    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    goto :goto_c
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<-TK;>;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/SortedMap;->comparator()Ljava/util/Comparator;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 56
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic delegate()Ljava/util/Map;
    .registers 2

    .prologue
    .line 56
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    return-object v0
.end method

.method protected abstract delegate()Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation
.end method

.method public firstKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/SortedMap;->firstKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    .local p1, "toKey":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    return-object v0
.end method

.method public lastKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/SortedMap;->lastKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected standardContainsKey(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    const/4 v3, 0x0

    .line 134
    move-object v2, p0

    .line 135
    .local v2, "self":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Object;TV;>;"
    :try_start_2
    invoke-interface {v2, p1}, Ljava/util/SortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/SortedMap;->firstKey()Ljava/lang/Object;

    move-result-object v0

    .line 136
    .local v0, "ceilingKey":Ljava/lang/Object;
    invoke-direct {p0, v0, p1}, Lcom/google/common/collect/ForwardingSortedMap;->unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I
    :try_end_d
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_d} :catch_12
    .catch Ljava/util/NoSuchElementException; {:try_start_2 .. :try_end_d} :catch_14
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_d} :catch_16

    move-result v4

    if-nez v4, :cond_11

    const/4 v3, 0x1

    .line 142
    .end local v0    # "ceilingKey":Ljava/lang/Object;
    :cond_11
    :goto_11
    return v3

    .line 137
    :catch_12
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/ClassCastException;
    goto :goto_11

    .line 139
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :catch_14
    move-exception v1

    .line 140
    .local v1, "e":Ljava/util/NoSuchElementException;
    goto :goto_11

    .line 141
    .end local v1    # "e":Ljava/util/NoSuchElementException;
    :catch_16
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/NullPointerException;
    goto :goto_11
.end method

.method protected standardRemove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "key"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    const/4 v5, 0x0

    .line 164
    move-object v3, p0

    .line 165
    .local v3, "self":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Object;TV;>;"
    :try_start_2
    invoke-interface {v3, p1}, Ljava/util/SortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 167
    .local v2, "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Object;TV;>;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_32

    .line 168
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 169
    .local v0, "ceilingEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-direct {p0, v6, p1}, Lcom/google/common/collect/ForwardingSortedMap;->unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-nez v6, :cond_32

    .line 170
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 171
    .local v4, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V
    :try_end_2b
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_2b} :catch_2c
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2b} :catch_2f

    .line 180
    .end local v0    # "ceilingEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;TV;>;"
    .end local v2    # "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Object;TV;>;>;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :goto_2b
    return-object v4

    .line 175
    :catch_2c
    move-exception v1

    .local v1, "e":Ljava/lang/ClassCastException;
    move-object v4, v5

    .line 176
    goto :goto_2b

    .line 177
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :catch_2f
    move-exception v1

    .local v1, "e":Ljava/lang/NullPointerException;
    move-object v4, v5

    .line 178
    goto :goto_2b

    .end local v1    # "e":Ljava/lang/NullPointerException;
    .restart local v2    # "entryIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Object;TV;>;>;"
    :cond_32
    move-object v4, v5

    .line 180
    goto :goto_2b
.end method

.method protected standardSubMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 5
    .annotation build Lcom/google/common/annotations/Beta;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    .local p1, "fromKey":Ljava/lang/Object;, "TK;"
    .local p2, "toKey":Ljava/lang/Object;, "TK;"
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/ForwardingSortedMap;->unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gtz v0, :cond_15

    const/4 v0, 0x1

    :goto_7
    const-string v1, "fromKey must be <= toKey"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 193
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingSortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/SortedMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    return-object v0

    .line 192
    :cond_15
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    .local p1, "fromKey":Ljava/lang/Object;, "TK;"
    .local p2, "toKey":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/SortedMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    return-object v0
.end method

.method public tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lcom/google/common/collect/ForwardingSortedMap;, "Lcom/google/common/collect/ForwardingSortedMap<TK;TV;>;"
    .local p1, "fromKey":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMap;->delegate()Ljava/util/SortedMap;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v0

    return-object v0
.end method
