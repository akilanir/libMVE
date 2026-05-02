.class public Lzmq/MultiMap$MultiMapEntrySet;
.super Ljava/lang/Object;
.source "MultiMap.java"

# interfaces
.implements Ljava/util/Set;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/MultiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MultiMapEntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Set",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private id:J

.field private iit:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private key:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private map:Lzmq/MultiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/MultiMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lzmq/MultiMap;


# direct methods
.method public constructor <init>(Lzmq/MultiMap;Lzmq/MultiMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzmq/MultiMap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p2, "map":Lzmq/MultiMap;, "Lzmq/MultiMap<TK;TV;>;"
    iput-object p1, p0, Lzmq/MultiMap$MultiMapEntrySet;->this$0:Lzmq/MultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p2, p0, Lzmq/MultiMap$MultiMapEntrySet;->map:Lzmq/MultiMap;

    .line 85
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 74
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lzmq/MultiMap$MultiMapEntrySet;->add(Ljava/util/Map$Entry;)Z

    move-result v0

    return v0
.end method

.method public add(Ljava/util/Map$Entry;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)Z"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;)Z"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/util/Map$Entry<TK;TV;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 102
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 108
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 169
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->iit:Ljava/util/Iterator;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->iit:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_32

    .line 170
    :cond_c
    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    .line 171
    const/4 v1, 0x0

    .line 179
    :goto_15
    return v1

    .line 174
    :cond_16
    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 175
    .local v0, "item":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/ArrayList<Ljava/lang/Long;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Comparable;

    iput-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->key:Ljava/lang/Comparable;

    .line 176
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->iit:Ljava/util/Iterator;

    .line 179
    .end local v0    # "item":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/ArrayList<Ljava/lang/Long;>;>;"
    :cond_32
    const/4 v1, 0x1

    goto :goto_15
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 120
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->map:Lzmq/MultiMap;

    # getter for: Lzmq/MultiMap;->keys:Ljava/util/TreeMap;
    invoke-static {v0}, Lzmq/MultiMap;->access$000(Lzmq/MultiMap;)Ljava/util/TreeMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->it:Ljava/util/Iterator;

    .line 127
    return-object p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 74
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    invoke-virtual {p0}, Lzmq/MultiMap$MultiMapEntrySet;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->iit:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->id:J

    .line 186
    new-instance v0, Lzmq/MultiMap$MultiMapEntry;

    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->this$0:Lzmq/MultiMap;

    iget-object v2, p0, Lzmq/MultiMap$MultiMapEntrySet;->key:Ljava/lang/Comparable;

    iget-object v3, p0, Lzmq/MultiMap$MultiMapEntrySet;->map:Lzmq/MultiMap;

    # getter for: Lzmq/MultiMap;->values:Ljava/util/HashMap;
    invoke-static {v3}, Lzmq/MultiMap;->access$100(Lzmq/MultiMap;)Ljava/util/HashMap;

    move-result-object v3

    iget-wide v4, p0, Lzmq/MultiMap$MultiMapEntrySet;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lzmq/MultiMap$MultiMapEntry;-><init>(Lzmq/MultiMap;Ljava/lang/Comparable;Ljava/lang/Object;)V

    return-object v0
.end method

.method public remove()V
    .registers 4

    .prologue
    .line 192
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->iit:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 193
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->map:Lzmq/MultiMap;

    # getter for: Lzmq/MultiMap;->values:Ljava/util/HashMap;
    invoke-static {v0}, Lzmq/MultiMap;->access$100(Lzmq/MultiMap;)Ljava/util/HashMap;

    move-result-object v0

    iget-wide v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->id:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->map:Lzmq/MultiMap;

    # getter for: Lzmq/MultiMap;->keys:Ljava/util/TreeMap;
    invoke-static {v0}, Lzmq/MultiMap;->access$000(Lzmq/MultiMap;)Ljava/util/TreeMap;

    move-result-object v0

    iget-object v1, p0, Lzmq/MultiMap$MultiMapEntrySet;->key:Ljava/lang/Comparable;

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 195
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntrySet;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 197
    :cond_2d
    return-void
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 133
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 139
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 151
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 157
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
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
    .line 163
    .local p0, "this":Lzmq/MultiMap$MultiMapEntrySet;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntrySet;"
    .local p1, "arg0":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
