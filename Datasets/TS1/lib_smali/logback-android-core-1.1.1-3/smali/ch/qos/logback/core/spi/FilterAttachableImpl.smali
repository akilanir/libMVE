.class public final Lch/qos/logback/core/spi/FilterAttachableImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/FilterAttachable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/spi/FilterAttachable",
        "<TE;>;"
    }
.end annotation


# instance fields
.field filterList:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lch/qos/logback/core/filter/Filter",
            "<TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/spi/FilterAttachableImpl;->filterList:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method


# virtual methods
.method public addFilter(Lch/qos/logback/core/filter/Filter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/filter/Filter",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/spi/FilterAttachableImpl;->filterList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public clearAllFilters()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/spi/FilterAttachableImpl;->filterList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    return-void
.end method

.method public getCopyOfAttachedFiltersList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/filter/Filter",
            "<TE;>;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lch/qos/logback/core/spi/FilterAttachableImpl;->filterList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lch/qos/logback/core/spi/FilterReply;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/spi/FilterAttachableImpl;->filterList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/filter/Filter;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/filter/Filter;->decide(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    sget-object v2, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    if-eq v0, v2, :cond_1e

    sget-object v2, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    if-ne v0, v2, :cond_6

    :cond_1e
    :goto_1e
    return-object v0

    :cond_1f
    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_1e
.end method
