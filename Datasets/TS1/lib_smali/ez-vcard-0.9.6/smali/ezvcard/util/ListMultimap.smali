.class public Lezvcard/util/ListMultimap;
.super Ljava/lang/Object;
.source "ListMultimap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;",
        "Ljava/util/List",
        "<TV;>;>;>;"
    }
.end annotation


# instance fields
.field private final map:Ljava/util/Map;
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
    .line 55
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    .line 57
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 63
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    .line 65
    return-void
.end method

.method public constructor <init>(Lezvcard/util/ListMultimap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/util/ListMultimap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "orig":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    invoke-direct {p0}, Lezvcard/util/ListMultimap;-><init>()V

    .line 73
    invoke-virtual {p1}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 74
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/List<TV;>;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v3, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 77
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/List<TV;>;>;"
    .end local v2    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_28
    return-void
.end method

.method private get(Ljava/lang/Object;Z)Ljava/util/List;
    .registers 5
    .param p2, "add"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;Z)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 117
    iget-object v1, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 118
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_1a

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .restart local v0    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz p2, :cond_1a

    .line 121
    iget-object v1, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_1a
    return-object v0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 203
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 204
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    const/4 v1, 0x0

    .line 281
    if-ne p0, p1, :cond_5

    .line 282
    const/4 v1, 0x1

    .line 289
    :cond_4
    :goto_4
    return v1

    .line 283
    :cond_5
    if-eqz p1, :cond_4

    .line 285
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_4

    move-object v0, p1

    .line 288
    check-cast v0, Lezvcard/util/ListMultimap;

    .line 289
    .local v0, "other":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<**>;"
    iget-object v1, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    iget-object v2, v0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4
.end method

.method public first(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 134
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz v0, :cond_c

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    :cond_c
    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_d
.end method

.method public get(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/util/ListMultimap;->get(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/List",
            "<TV;>;>;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 276
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 231
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    invoke-virtual {p0}, Lezvcard/util/ListMultimap;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/List",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
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
    .line 211
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lezvcard/util/ListMultimap;->get(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 86
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    return-void
.end method

.method public putAll(Ljava/lang/Object;Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "values":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lezvcard/util/ListMultimap;->get(Ljava/lang/Object;Z)Ljava/util/List;

    move-result-object v0

    .line 96
    .local v0, "existingValues":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 97
    return-void
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 154
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz v0, :cond_13

    .line 155
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 157
    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public removeAll(Ljava/lang/Object;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v1, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 167
    .local v0, "removed":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-nez v0, :cond_12

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .end local v0    # "removed":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_12
    return-object v0
.end method

.method public replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 179
    .local v0, "replaced":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz p2, :cond_9

    .line 180
    invoke-virtual {p0, p1, p2}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    :cond_9
    return-object v0
.end method

.method public replace(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Collection",
            "<TV;>;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "values":Ljava/util/Collection;, "Ljava/util/Collection<TV;>;"
    invoke-virtual {p0, p1}, Lezvcard/util/ListMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 193
    .local v0, "replaced":Ljava/util/List;, "Ljava/util/List<TV;>;"
    if-eqz p2, :cond_f

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_f

    .line 194
    invoke-virtual {p0, p1, p2}, Lezvcard/util/ListMultimap;->putAll(Ljava/lang/Object;Ljava/util/Collection;)V

    .line 196
    :cond_f
    return-object v0
.end method

.method protected sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TK;"
        }
    .end annotation

    .prologue
    .line 261
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    return-object p1
.end method

.method public size()I
    .registers 5

    .prologue
    .line 239
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    const/4 v1, 0x0

    .line 240
    .local v1, "size":I
    iget-object v3, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 241
    .local v2, "value":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v1, v3

    .line 242
    goto :goto_b

    .line 243
    .end local v2    # "value":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_1d
    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 271
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    iget-object v0, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "this":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<TK;TV;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v3, p0, Lezvcard/util/ListMultimap;->map:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 221
    .local v2, "value":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_f

    .line 223
    .end local v2    # "value":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_1f
    return-object v1
.end method
