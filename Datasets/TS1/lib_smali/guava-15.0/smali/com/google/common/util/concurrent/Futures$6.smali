.class final Lcom/google/common/util/concurrent/Futures$6;
.super Ljava/lang/Object;
.source "Futures.java"

# interfaces
.implements Lcom/google/common/util/concurrent/Futures$FutureCombiner;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/Futures;->listFuture(Lcom/google/common/collect/ImmutableList;ZLjava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/Futures$FutureCombiner",
        "<TV;",
        "Ljava/util/List",
        "<TV;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1618
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic combine(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 1618
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/Futures$6;->combine(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public combine(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/common/base/Optional",
            "<TV;>;>;)",
            "Ljava/util/List",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 1621
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/base/Optional<TV;>;>;"
    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    .line 1622
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/Optional;

    .line 1623
    .local v0, "element":Lcom/google/common/base/Optional;, "Lcom/google/common/base/Optional<TV;>;"
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Lcom/google/common/base/Optional;->orNull()Ljava/lang/Object;

    move-result-object v3

    :goto_1a
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_1e
    const/4 v3, 0x0

    goto :goto_1a

    .line 1625
    .end local v0    # "element":Lcom/google/common/base/Optional;, "Lcom/google/common/base/Optional<TV;>;"
    :cond_20
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method
