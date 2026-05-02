.class public final Lorg/acra/collections/ImmutableMap;
.super Ljava/lang/Object;
.source "ImmutableMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;
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
        "Ljava/util/Map",
        "<TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private final mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    .line 38
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 42
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 47
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 52
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

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
    .line 58
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v3, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    .line 59
    .local v2, "original":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    new-instance v0, Lorg/acra/collections/ImmutableSet$Builder;

    invoke-direct {v0}, Lorg/acra/collections/ImmutableSet$Builder;-><init>()V

    .line 60
    .local v0, "builder":Lorg/acra/collections/ImmutableSet$Builder;, "Lorg/acra/collections/ImmutableSet$Builder<Ljava/util/Map$Entry<TK;TV;>;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 61
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    new-instance v4, Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;

    invoke-direct {v4, v1}, Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;-><init>(Ljava/util/Map$Entry;)V

    invoke-virtual {v0, v4}, Lorg/acra/collections/ImmutableSet$Builder;->add(Ljava/lang/Object;)V

    goto :goto_f

    .line 63
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    :cond_24
    invoke-virtual {v0}, Lorg/acra/collections/ImmutableSet$Builder;->build()Lorg/acra/collections/ImmutableSet;

    move-result-object v3

    return-object v3
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
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
    .line 68
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 73
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    new-instance v0, Lorg/acra/collections/ImmutableSet;

    iget-object v1, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 99
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lorg/acra/collections/ImmutableMap;, "Lorg/acra/collections/ImmutableMap<TK;TV;>;"
    new-instance v0, Lorg/acra/collections/ImmutableList;

    iget-object v1, p0, Lorg/acra/collections/ImmutableMap;->mMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/collections/ImmutableList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
