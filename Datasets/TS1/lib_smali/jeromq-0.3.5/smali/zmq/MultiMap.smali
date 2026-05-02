.class public Lzmq/MultiMap;
.super Ljava/lang/Object;
.source "MultiMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/MultiMap$MultiMapEntrySet;,
        Lzmq/MultiMap$MultiMapEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K::",
        "Ljava/lang/Comparable",
        "<-TK;>;V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private id:J

.field private final keys:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<TK;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private final values:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 37
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lzmq/MultiMap;->id:J

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    .line 40
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lzmq/MultiMap;)Ljava/util/TreeMap;
    .registers 2
    .param p0, "x0"    # Lzmq/MultiMap;

    .prologue
    .line 30
    iget-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    return-object v0
.end method

.method static synthetic access$100(Lzmq/MultiMap;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lzmq/MultiMap;

    .prologue
    .line 30
    iget-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    return-object v0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 204
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 205
    iget-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 206
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 211
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 217
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
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
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    new-instance v0, Lzmq/MultiMap$MultiMapEntrySet;

    invoke-direct {v0, p0, p0}, Lzmq/MultiMap$MultiMapEntrySet;-><init>(Lzmq/MultiMap;Lzmq/MultiMap;)V

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
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
    .line 229
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v1, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v1, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 230
    .local v0, "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    if-nez v0, :cond_c

    .line 231
    const/4 v1, 0x0

    .line 233
    :goto_b
    return-object v1

    :cond_c
    iget-object v1, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_b
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 239
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

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
    .line 245
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Comparable;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v1, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 252
    .local v0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    if-nez v0, :cond_31

    .line 253
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 254
    .restart local v0    # "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iget-wide v1, p0, Lzmq/MultiMap;->id:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    iget-object v1, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    :goto_1d
    iget-object v1, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    iget-wide v2, p0, Lzmq/MultiMap;->id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    iget-wide v1, p0, Lzmq/MultiMap;->id:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lzmq/MultiMap;->id:J

    .line 263
    const/4 v1, 0x0

    return-object v1

    .line 258
    :cond_31
    iget-wide v1, p0, Lzmq/MultiMap;->id:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 30
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lzmq/MultiMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    .local p1, "src":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 270
    .local v1, "o":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Comparable;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lzmq/MultiMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 272
    .end local v1    # "o":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    :cond_22
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 277
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v2, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v2, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 278
    .local v0, "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    if-nez v0, :cond_c

    .line 279
    const/4 v1, 0x0

    .line 285
    :cond_b
    :goto_b
    return-object v1

    .line 281
    :cond_c
    iget-object v2, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 282
    .local v1, "old":Ljava/lang/Object;, "TV;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 283
    iget-object v2, p0, Lzmq/MultiMap;->keys:Ljava/util/TreeMap;

    invoke-virtual {v2, p1}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method

.method public size()I
    .registers 2

    .prologue
    .line 291
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 297
    .local p0, "this":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iget-object v0, p0, Lzmq/MultiMap;->values:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
