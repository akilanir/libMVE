.class abstract Lorg/apache/http/pool/RouteSpecificPool;
.super Ljava/lang/Object;
.source "RouteSpecificPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "E:",
        "Lorg/apache/http/pool/PoolEntry",
        "<TT;TC;>;>",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final available:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final leased:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final pending:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;>;"
        }
    .end annotation
.end field

.field private final route:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/apache/http/pool/RouteSpecificPool;->route:Ljava/lang/Object;

    .line 47
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    .line 48
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    .line 49
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    .line 50
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)TE;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "conn":Ljava/lang/Object;, "TC;"
    invoke-virtual {p0, p1}, Lorg/apache/http/pool/RouteSpecificPool;->createEntry(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v0

    .line 136
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 137
    return-object v0
.end method

.method protected abstract createEntry(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)TE;"
        }
    .end annotation
.end method

.method public free(Lorg/apache/http/pool/PoolEntry;Z)V
    .registers 7
    .param p2, "reusable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    if-nez p1, :cond_a

    .line 122
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Pool entry may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_a
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 125
    .local v0, "found":Z
    if-nez v0, :cond_31

    .line 126
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Entry "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has not been leased from this pool"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 129
    :cond_31
    if-eqz p2, :cond_38

    .line 130
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 132
    :cond_38
    return-void
.end method

.method public getAllocatedCount()I
    .registers 3

    .prologue
    .line 71
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getAvailableCount()I
    .registers 2

    .prologue
    .line 67
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public getFree(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .registers 5
    .param p1, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TE;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v2, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    .line 76
    if-eqz p1, :cond_2f

    .line 77
    iget-object v2, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 78
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 79
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 80
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->getState()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 81
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 82
    iget-object v2, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 97
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :goto_2e
    return-object v0

    .line 87
    :cond_2f
    iget-object v2, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 88
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_50

    .line 89
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 90
    .restart local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->getState()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_35

    .line 91
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 92
    iget-object v2, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    .line 97
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_50
    const/4 v0, 0x0

    goto :goto_2e
.end method

.method public getLastUsed()Lorg/apache/http/pool/PoolEntry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    .line 102
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 104
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getLeasedCount()I
    .registers 2

    .prologue
    .line 59
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method

.method public getPendingCount()I
    .registers 2

    .prologue
    .line 63
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public final getRoute()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->route:Ljava/lang/Object;

    return-object v0
.end method

.method public nextPending()Lorg/apache/http/pool/PoolEntryFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntryFuture;

    return-object v0
.end method

.method public queue(Lorg/apache/http/pool/PoolEntryFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    if-nez p1, :cond_3

    .line 145
    :goto_2
    return-void

    .line 144
    :cond_3
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public remove(Lorg/apache/http/pool/PoolEntry;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    if-nez p1, :cond_a

    .line 110
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Pool entry may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_a
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 113
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 114
    const/4 v0, 0x0

    .line 117
    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x1

    goto :goto_1b
.end method

.method public shutdown()V
    .registers 5

    .prologue
    .line 159
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/pool/PoolEntryFuture;

    .line 160
    .local v1, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/http/pool/PoolEntryFuture;->cancel(Z)Z

    goto :goto_6

    .line 162
    .end local v1    # "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    :cond_17
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 163
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 164
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V

    goto :goto_22

    .line 166
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_32
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 167
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 168
    .restart local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V

    goto :goto_3d

    .line 170
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_4d
    iget-object v3, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 171
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 175
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[route: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->route:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 178
    const-string v1, "][leased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->leased:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    const-string v1, "][available: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    const-string v1, "][pending: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    iget-object v1, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 184
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unqueue(Lorg/apache/http/pool/PoolEntryFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    .local p1, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    if-nez p1, :cond_3

    .line 156
    :goto_2
    return-void

    .line 155
    :cond_3
    iget-object v0, p0, Lorg/apache/http/pool/RouteSpecificPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_2
.end method
