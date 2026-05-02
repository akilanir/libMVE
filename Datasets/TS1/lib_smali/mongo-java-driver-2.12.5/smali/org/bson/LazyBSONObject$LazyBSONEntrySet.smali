.class Lorg/bson/LazyBSONObject$LazyBSONEntrySet;
.super Lorg/bson/LazyBSONObject$ReadOnlySet;
.source "LazyBSONObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/LazyBSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LazyBSONEntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/LazyBSONObject$ReadOnlySet",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/LazyBSONObject;


# direct methods
.method constructor <init>(Lorg/bson/LazyBSONObject;)V
    .registers 2

    .prologue
    .line 252
    iput-object p1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {p0, p1}, Lorg/bson/LazyBSONObject$ReadOnlySet;-><init>(Lorg/bson/LazyBSONObject;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 266
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 267
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1, p1}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 268
    const/4 v1, 0x1

    .line 271
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 276
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 277
    .local v0, "cur":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 278
    const/4 v2, 0x0

    .line 282
    .end local v0    # "cur":Ljava/lang/Object;
    :goto_15
    return v2

    :cond_16
    const/4 v2, 0x1

    goto :goto_15
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-virtual {v0}, Lorg/bson/LazyBSONObject;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 287
    new-instance v0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;

    iget-object v1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {v0, v1}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;-><init>(Lorg/bson/LazyBSONObject;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 255
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-virtual {v0}, Lorg/bson/LazyBSONObject;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 292
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->size()I

    move-result v1

    new-array v0, v1, [Ljava/util/Map$Entry;

    .line 293
    .local v0, "array":[Ljava/util/Map$Entry;
    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 299
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->size()I

    move-result v4

    .line 301
    .local v4, "size":I
    array-length v5, p1

    if-lt v5, v4, :cond_1d

    move-object v3, p1

    .line 304
    .local v3, "localArray":[Ljava/lang/Object;, "[TT;"
    :goto_8
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 305
    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v0, 0x0

    .line 306
    .local v0, "i":I
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 307
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_d

    .line 301
    .end local v0    # "i":I
    .end local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v3    # "localArray":[Ljava/lang/Object;, "[TT;"
    :cond_1d
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    move-object v3, v5

    goto :goto_8

    .line 310
    .restart local v0    # "i":I
    .restart local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3    # "localArray":[Ljava/lang/Object;, "[TT;"
    :cond_2f
    array-length v5, v3

    if-le v5, v0, :cond_35

    .line 311
    const/4 v5, 0x0

    aput-object v5, v3, v0

    .line 314
    :cond_35
    return-object v3
.end method
