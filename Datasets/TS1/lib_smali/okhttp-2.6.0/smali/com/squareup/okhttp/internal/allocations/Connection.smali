.class public final Lcom/squareup/okhttp/internal/allocations/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/allocations/Connection$Stream;,
        Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;,
        Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    }
.end annotation


# instance fields
.field private allocationLimit:I

.field private final allocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;",
            ">;"
        }
    .end annotation
.end field

.field idleAt:J

.field private noNewAllocations:Z

.field private final pool:Lcom/squareup/okhttp/ConnectionPool;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/ConnectionPool;)V
    .registers 4
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    .line 49
    const/4 v0, 0x1

    iput v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocationLimit:I

    .line 53
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->idleAt:J

    .line 56
    iput-object p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    .line 57
    return-void
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/allocations/Connection;)Lcom/squareup/okhttp/ConnectionPool;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/internal/allocations/Connection;Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/allocations/Connection;
    .param p1, "x1"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/allocations/Connection;->remove(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V

    return-void
.end method

.method private remove(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V
    .registers 8
    .param p1, "streamAllocation"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    .prologue
    .line 89
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_7
    if-ge v0, v1, :cond_2e

    .line 90
    iget-object v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;

    .line 91
    .local v2, "weakReference":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;
    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_2b

    .line 92
    iget-object v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 94
    iget-object v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 95
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->idleAt:J

    .line 99
    :cond_2a
    return-void

    .line 89
    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 102
    .end local v2    # "weakReference":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;
    :cond_2e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unexpected allocation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public noNewStreams()V
    .registers 4

    .prologue
    .line 110
    iget-object v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 111
    const/4 v1, 0x1

    :try_start_4
    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->noNewAllocations:Z

    .line 112
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 113
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->rescind()V

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 115
    :cond_1d
    monitor-exit v2

    .line 116
    return-void

    .line 115
    .end local v0    # "i":I
    :catchall_1f
    move-exception v1

    monitor-exit v2
    :try_end_21
    .catchall {:try_start_4 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public pruneLeakedAllocations()V
    .registers 7

    .prologue
    .line 138
    iget-object v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v3

    .line 139
    :try_start_3
    iget-object v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;>;"
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    .line 140
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;

    .line 141
    .local v1, "reference":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_9

    .line 142
    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Call "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->name:Ljava/lang/String;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->access$300(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " leaked a connection. Did you forget to close a response body?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 144
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->noNewAllocations:Z

    .line 145
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 146
    iget-object v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 147
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->idleAt:J

    goto :goto_9

    .line 152
    .end local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;>;"
    .end local v1    # "reference":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;
    :catchall_52
    move-exception v2

    monitor-exit v3
    :try_end_54
    .catchall {:try_start_3 .. :try_end_54} :catchall_52

    throw v2

    .restart local v0    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;>;"
    :cond_55
    :try_start_55
    monitor-exit v3
    :try_end_56
    .catchall {:try_start_55 .. :try_end_56} :catchall_52

    .line 153
    return-void
.end method

.method public release(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V
    .registers 5
    .param p1, "streamAllocation"    # Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    .prologue
    .line 78
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 79
    :try_start_3
    # getter for: Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z
    invoke-static {p1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->access$100(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)Z

    move-result v0

    if-eqz v0, :cond_14

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "already released"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0

    .line 81
    :cond_14
    const/4 v0, 0x1

    :try_start_15
    # setter for: Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->released:Z
    invoke-static {p1, v0}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->access$102(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;Z)Z

    .line 82
    # getter for: Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->stream:Lcom/squareup/okhttp/internal/allocations/Connection$Stream;
    invoke-static {p1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;->access$200(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)Lcom/squareup/okhttp/internal/allocations/Connection$Stream;

    move-result-object v0

    if-nez v0, :cond_21

    .line 83
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/allocations/Connection;->remove(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;)V

    .line 85
    :cond_21
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_15 .. :try_end_22} :catchall_11

    .line 86
    return-void
.end method

.method public reserve(Ljava/lang/String;)Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 64
    iget-object v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 65
    :try_start_4
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->noNewAllocations:Z

    if-nez v1, :cond_12

    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget v3, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocationLimit:I

    if-lt v1, v3, :cond_14

    :cond_12
    monitor-exit v2

    .line 69
    :goto_13
    return-object v0

    .line 67
    :cond_14
    new-instance v0, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;-><init>(Lcom/squareup/okhttp/internal/allocations/Connection;Lcom/squareup/okhttp/internal/allocations/Connection$1;)V

    .line 68
    .local v0, "result":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    new-instance v3, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;

    invoke-direct {v3, v0, p1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;-><init>(Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    monitor-exit v2

    goto :goto_13

    .line 70
    .end local v0    # "result":Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocation;
    :catchall_26
    move-exception v1

    monitor-exit v2
    :try_end_28
    .catchall {:try_start_4 .. :try_end_28} :catchall_26

    throw v1
.end method

.method public setAllocationLimit(I)V
    .registers 5
    .param p1, "allocationLimit"    # I

    .prologue
    .line 123
    iget-object v2, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v2

    .line 124
    if-gez p1, :cond_e

    :try_start_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 129
    :catchall_b
    move-exception v1

    monitor-exit v2
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_b

    throw v1

    .line 125
    :cond_e
    :try_start_e
    iput p1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocationLimit:I

    .line 126
    move v0, p1

    .local v0, "i":I
    :goto_11
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_27

    .line 127
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/allocations/Connection$StreamAllocationReference;->rescind()V

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 129
    :cond_27
    monitor-exit v2
    :try_end_28
    .catchall {:try_start_e .. :try_end_28} :catchall_b

    .line 130
    return-void
.end method

.method size()I
    .registers 3

    .prologue
    .line 157
    iget-object v1, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->pool:Lcom/squareup/okhttp/ConnectionPool;

    monitor-enter v1

    .line 158
    :try_start_3
    iget-object v0, p0, Lcom/squareup/okhttp/internal/allocations/Connection;->allocations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 159
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method
