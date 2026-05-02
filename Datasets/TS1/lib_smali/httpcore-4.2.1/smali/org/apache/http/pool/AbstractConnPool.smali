.class public abstract Lorg/apache/http/pool/AbstractConnPool;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/http/pool/ConnPool;
.implements Lorg/apache/http/pool/ConnPoolControl;


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
        "Ljava/lang/Object;",
        "Lorg/apache/http/pool/ConnPool",
        "<TT;TE;>;",
        "Lorg/apache/http/pool/ConnPoolControl",
        "<TT;>;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
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

.field private final connFactory:Lorg/apache/http/pool/ConnFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/pool/ConnFactory",
            "<TT;TC;>;"
        }
    .end annotation
.end field

.field private volatile defaultMaxPerRoute:I

.field private volatile isShutDown:Z

.field private final leased:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final maxPerRoute:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile maxTotal:I

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

.field private final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/pool/ConnFactory;II)V
    .registers 6
    .param p2, "defaultMaxPerRoute"    # I
    .param p3, "maxTotal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnFactory",
            "<TT;TC;>;II)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "connFactory":Lorg/apache/http/pool/ConnFactory;, "Lorg/apache/http/pool/ConnFactory<TT;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    if-nez p1, :cond_d

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection factory may not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_d
    if-gtz p2, :cond_17

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max per route value may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_17
    if-gtz p3, :cond_21

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max total value may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_21
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    .line 92
    iput-object p1, p0, Lorg/apache/http/pool/AbstractConnPool;->connFactory:Lorg/apache/http/pool/ConnFactory;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 95
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 96
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    .line 98
    iput p2, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I

    .line 99
    iput p3, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    .line 100
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;
    .registers 8
    .param p0, "x0"    # Lorg/apache/http/pool/AbstractConnPool;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;
    .param p3, "x3"    # J
    .param p5, "x4"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "x5"    # Lorg/apache/http/pool/PoolEntryFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct/range {p0 .. p6}, Lorg/apache/http/pool/AbstractConnPool;->getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v0

    return-object v0
.end method

.method private getMax(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 333
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 334
    .local v0, "v":Ljava/lang/Integer;
    if-eqz v0, :cond_f

    .line 335
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 337
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I

    goto :goto_e
.end method

.method private getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;"
        }
    .end annotation

    .prologue
    .line 139
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/RouteSpecificPool;

    .line 140
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    if-nez v0, :cond_14

    .line 141
    new-instance v0, Lorg/apache/http/pool/AbstractConnPool$1;

    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-direct {v0, p0, p1, p1}, Lorg/apache/http/pool/AbstractConnPool$1;-><init>(Lorg/apache/http/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .restart local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_14
    return-object v0
.end method

.method private getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/pool/PoolEntryFuture;)Lorg/apache/http/pool/PoolEntry;
    .registers 28
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "timeout"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lorg/apache/http/pool/PoolEntryFuture",
            "<TE;>;)TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 208
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p6, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    const/4 v4, 0x0

    .line 209
    .local v4, "deadline":Ljava/util/Date;
    const-wide/16 v17, 0x0

    cmp-long v17, p3, v17

    if-lez v17, :cond_1c

    .line 210
    new-instance v4, Ljava/util/Date;

    .end local v4    # "deadline":Ljava/util/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-object/from16 v0, p5

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v19

    add-long v17, v17, v19

    move-wide/from16 v0, v17

    invoke-direct {v4, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 214
    .restart local v4    # "deadline":Ljava/util/Date;
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 216
    :try_start_25
    invoke-direct/range {p0 .. p1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v13

    .line 217
    .local v13, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    const/4 v5, 0x0

    .line 218
    .local v5, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_2a
    if-nez v5, :cond_18b

    .line 219
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    move/from16 v17, v0

    if-eqz v17, :cond_6e

    .line 220
    new-instance v17, Ljava/lang/IllegalStateException;

    const-string v18, "Connection pool shut down"

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_3c
    .catchall {:try_start_25 .. :try_end_3c} :catchall_3c

    .line 298
    .end local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v13    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_3c
    move-exception v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v17

    .line 227
    .restart local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v13    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_47
    :try_start_47
    invoke-virtual {v5}, Lorg/apache/http/pool/PoolEntry;->isClosed()Z

    move-result v17

    if-nez v17, :cond_59

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v5, v0, v1}, Lorg/apache/http/pool/PoolEntry;->isExpired(J)Z

    move-result v17

    if-eqz v17, :cond_76

    .line 228
    :cond_59
    invoke-virtual {v5}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 230
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v13, v5, v0}, Lorg/apache/http/pool/RouteSpecificPool;->free(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 223
    :cond_6e
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Lorg/apache/http/pool/RouteSpecificPool;->getFree(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v5

    .line 224
    if-nez v5, :cond_47

    .line 235
    :cond_76
    if-eqz v5, :cond_99

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_8e
    .catchall {:try_start_47 .. :try_end_8e} :catchall_3c

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v6, v5

    .end local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .local v6, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :goto_98
    return-object v6

    .line 242
    .end local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_99
    :try_start_99
    invoke-direct/range {p0 .. p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v11

    .line 244
    .local v11, "maxPerRoute":I
    const/16 v17, 0x0

    invoke-virtual {v13}, Lorg/apache/http/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v18

    add-int/lit8 v18, v18, 0x1

    sub-int v18, v18, v11

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 245
    .local v7, "excess":I
    if-lez v7, :cond_b6

    .line 246
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_ae
    if-ge v9, v7, :cond_b6

    .line 247
    invoke-virtual {v13}, Lorg/apache/http/pool/RouteSpecificPool;->getLastUsed()Lorg/apache/http/pool/PoolEntry;

    move-result-object v10

    .line 248
    .local v10, "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    if-nez v10, :cond_13b

    .line 257
    .end local v9    # "i":I
    .end local v10    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_b6
    invoke-virtual {v13}, Lorg/apache/http/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v17

    move/from16 v0, v17

    if-ge v0, v11, :cond_150

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->size()I

    move-result v16

    .line 259
    .local v16, "totalUsed":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    move/from16 v17, v0

    sub-int v17, v17, v16

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 260
    .local v8, "freeCapacity":I
    if-lez v8, :cond_150

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->size()I

    move-result v15

    .line 262
    .local v15, "totalAvailable":I
    add-int/lit8 v17, v8, -0x1

    move/from16 v0, v17

    if-le v15, v0, :cond_112

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_112

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/http/pool/PoolEntry;

    .line 265
    .restart local v10    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v10}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 266
    invoke-virtual {v10}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v12

    .line 267
    .local v12, "otherpool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v12, v10}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z

    .line 270
    .end local v10    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v12    # "otherpool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_112
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->connFactory:Lorg/apache/http/pool/ConnFactory;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lorg/apache/http/pool/ConnFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 271
    .local v3, "conn":Ljava/lang/Object;, "TC;"
    invoke-virtual {v13, v3}, Lorg/apache/http/pool/RouteSpecificPool;->add(Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;

    move-result-object v5

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_12f
    .catchall {:try_start_99 .. :try_end_12f} :catchall_3c

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v6, v5

    .end local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    goto/16 :goto_98

    .line 251
    .end local v3    # "conn":Ljava/lang/Object;, "TC;"
    .end local v6    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v8    # "freeCapacity":I
    .end local v15    # "totalAvailable":I
    .end local v16    # "totalUsed":I
    .restart local v5    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .restart local v9    # "i":I
    .restart local v10    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_13b
    :try_start_13b
    invoke-virtual {v10}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 253
    invoke-virtual {v13, v10}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z
    :try_end_14c
    .catchall {:try_start_13b .. :try_end_14c} :catchall_3c

    .line 246
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_ae

    .line 277
    .end local v9    # "i":I
    .end local v10    # "lastUsed":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_150
    const/4 v14, 0x0

    .line 279
    .local v14, "success":Z
    :try_start_151
    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lorg/apache/http/pool/RouteSpecificPool;->queue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 280
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 281
    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Lorg/apache/http/pool/PoolEntryFuture;->await(Ljava/util/Date;)Z
    :try_end_168
    .catchall {:try_start_151 .. :try_end_168} :catchall_193

    move-result v14

    .line 287
    :try_start_169
    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lorg/apache/http/pool/RouteSpecificPool;->unqueue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 291
    if-nez v14, :cond_2a

    if-eqz v4, :cond_2a

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v17

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gtz v17, :cond_2a

    .line 296
    .end local v7    # "excess":I
    .end local v11    # "maxPerRoute":I
    .end local v14    # "success":Z
    :cond_18b
    new-instance v17, Ljava/util/concurrent/TimeoutException;

    const-string v18, "Timeout waiting for connection"

    invoke-direct/range {v17 .. v18}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 287
    .restart local v7    # "excess":I
    .restart local v11    # "maxPerRoute":I
    .restart local v14    # "success":Z
    :catchall_193
    move-exception v17

    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lorg/apache/http/pool/RouteSpecificPool;->unqueue(Lorg/apache/http/pool/PoolEntryFuture;)V

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    throw v17
    :try_end_1a7
    .catchall {:try_start_169 .. :try_end_1a7} :catchall_3c
.end method

.method private notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/RouteSpecificPool",
            "<TT;TC;TE;>;)V"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {p1}, Lorg/apache/http/pool/RouteSpecificPool;->nextPending()Lorg/apache/http/pool/PoolEntryFuture;

    move-result-object v0

    .line 304
    .local v0, "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    if-eqz v0, :cond_11

    .line 305
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 309
    :goto_b
    if-eqz v0, :cond_10

    .line 310
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntryFuture;->wakeup()V

    .line 312
    :cond_10
    return-void

    .line 307
    :cond_11
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    check-cast v0, Lorg/apache/http/pool/PoolEntryFuture;

    .restart local v0    # "future":Lorg/apache/http/pool/PoolEntryFuture;, "Lorg/apache/http/pool/PoolEntryFuture<TE;>;"
    goto :goto_b
.end method


# virtual methods
.method public closeExpired()V
    .registers 8

    .prologue
    .line 478
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 479
    .local v2, "now":J
    iget-object v5, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 481
    :try_start_9
    iget-object v5, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 482
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 483
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 484
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0, v2, v3}, Lorg/apache/http/pool/PoolEntry;->isExpired(J)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 485
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 486
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v4

    .line 487
    .local v4, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v4, v0}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z

    .line 488
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 489
    invoke-direct {p0, v4}, Lorg/apache/http/pool/AbstractConnPool;->notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    :try_end_35
    .catchall {:try_start_9 .. :try_end_35} :catchall_36

    goto :goto_f

    .line 493
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v4    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_36
    move-exception v5

    iget-object v6, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5

    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_3d
    iget-object v5, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 495
    return-void
.end method

.method public closeIdle(JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 448
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    if-nez p3, :cond_a

    .line 449
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Time unit must not be null."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 451
    :cond_a
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    .line 452
    .local v5, "time":J
    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    if-gez v7, :cond_16

    .line 453
    const-wide/16 v5, 0x0

    .line 455
    :cond_16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v0, v7, v5

    .line 456
    .local v0, "deadline":J
    iget-object v7, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 458
    :try_start_21
    iget-object v7, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 459
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_27
    :goto_27
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_57

    .line 460
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/pool/PoolEntry;

    .line 461
    .local v2, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v2}, Lorg/apache/http/pool/PoolEntry;->getUpdated()J

    move-result-wide v7

    cmp-long v7, v7, v0

    if-gtz v7, :cond_27

    .line 462
    invoke-virtual {v2}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 463
    invoke-virtual {v2}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v4

    .line 464
    .local v4, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v4, v2}, Lorg/apache/http/pool/RouteSpecificPool;->remove(Lorg/apache/http/pool/PoolEntry;)Z

    .line 465
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 466
    invoke-direct {p0, v4}, Lorg/apache/http/pool/AbstractConnPool;->notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    :try_end_4f
    .catchall {:try_start_21 .. :try_end_4f} :catchall_50

    goto :goto_27

    .line 470
    .end local v2    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v4    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_50
    move-exception v7

    iget-object v8, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7

    .restart local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_57
    iget-object v7, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 472
    return-void
.end method

.method protected abstract createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)TE;"
        }
    .end annotation
.end method

.method public getDefaultMaxPerRoute()I
    .registers 3

    .prologue
    .line 375
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 377
    :try_start_5
    iget v0, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 379
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxPerRoute(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 399
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_a

    .line 400
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Route may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 402
    :cond_a
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 404
    :try_start_f
    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I
    :try_end_12
    .catchall {:try_start_f .. :try_end_12} :catchall_19

    move-result v0

    .line 406
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_19
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxTotal()I
    .registers 3

    .prologue
    .line 354
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 356
    :try_start_5
    iget v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 358
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lorg/apache/http/pool/PoolStats;"
        }
    .end annotation

    .prologue
    .line 424
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_a

    .line 425
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Route may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 427
    :cond_a
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 429
    :try_start_f
    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v0

    .line 430
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    new-instance v1, Lorg/apache/http/pool/PoolStats;

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getLeasedCount()I

    move-result v2

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    invoke-virtual {v0}, Lorg/apache/http/pool/RouteSpecificPool;->getAvailableCount()I

    move-result v4

    invoke-direct {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/apache/http/pool/PoolStats;-><init>(IIII)V
    :try_end_28
    .catchall {:try_start_f .. :try_end_28} :catchall_2e

    .line 436
    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_2e
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public getTotalStats()Lorg/apache/http/pool/PoolStats;
    .registers 6

    .prologue
    .line 411
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 413
    :try_start_5
    new-instance v0, Lorg/apache/http/pool/PoolStats;

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/apache/http/pool/PoolStats;-><init>(IIII)V
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_24

    .line 419
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_24
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public isShutdown()Z
    .registers 2

    .prologue
    .line 108
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v0, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    return v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 4
    .param p2, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/http/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/http/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
    .registers 10
    .param p2, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TE;>;)",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p3, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TE;>;"
    if-nez p1, :cond_a

    .line 164
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Route may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_a
    iget-boolean v0, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v0, :cond_16

    .line 167
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Connection pool shut down"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_16
    new-instance v0, Lorg/apache/http/pool/AbstractConnPool$2;

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object v1, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/pool/AbstractConnPool$2;-><init>(Lorg/apache/http/pool/AbstractConnPool;Ljava/util/concurrent/locks/Lock;Lorg/apache/http/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public bridge synthetic release(Ljava/lang/Object;Z)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Z

    .prologue
    .line 62
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    check-cast p1, Lorg/apache/http/pool/PoolEntry;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/pool/AbstractConnPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    return-void
.end method

.method public release(Lorg/apache/http/pool/PoolEntry;Z)V
    .registers 6
    .param p2, "reusable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .prologue
    .line 315
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 317
    :try_start_5
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 318
    invoke-virtual {p1}, Lorg/apache/http/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/http/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;

    move-result-object v0

    .line 319
    .local v0, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v0, p1, p2}, Lorg/apache/http/pool/RouteSpecificPool;->free(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 320
    if-eqz p2, :cond_2c

    iget-boolean v1, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-nez v1, :cond_2c

    .line 321
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 325
    :goto_23
    invoke-direct {p0, v0}, Lorg/apache/http/pool/AbstractConnPool;->notifyPending(Lorg/apache/http/pool/RouteSpecificPool;)V
    :try_end_26
    .catchall {:try_start_5 .. :try_end_26} :catchall_30

    .line 328
    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_26
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 330
    return-void

    .line 323
    .restart local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_2c
    :try_start_2c
    invoke-virtual {p1}, Lorg/apache/http/pool/PoolEntry;->close()V
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_30

    goto :goto_23

    .line 328
    .end local v0    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_30
    move-exception v1

    iget-object v2, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 363
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    if-gtz p1, :cond_a

    .line 364
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max value may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_a
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 368
    :try_start_f
    iput p1, p0, Lorg/apache/http/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_11
    .catchall {:try_start_f .. :try_end_11} :catchall_17

    .line 370
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 372
    return-void

    .line 370
    :catchall_17
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxPerRoute(Ljava/lang/Object;I)V
    .registers 5
    .param p2, "max"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .line 384
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_a

    .line 385
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Route may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_a
    if-gtz p2, :cond_14

    .line 388
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max value may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 390
    :cond_14
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 392
    :try_start_19
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catchall {:try_start_19 .. :try_end_22} :catchall_28

    .line 394
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 396
    return-void

    .line 394
    :catchall_28
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxTotal(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 342
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    if-gtz p1, :cond_a

    .line 343
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max value may not be negative or zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_a
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 347
    :try_start_f
    iput p1, p0, Lorg/apache/http/pool/AbstractConnPool;->maxTotal:I
    :try_end_11
    .catchall {:try_start_f .. :try_end_11} :catchall_17

    .line 349
    iget-object v0, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 351
    return-void

    .line 349
    :catchall_17
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public shutdown()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v3, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v3, :cond_5

    .line 136
    :goto_4
    return-void

    .line 118
    :cond_5
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/http/pool/AbstractConnPool;->isShutDown:Z

    .line 119
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 121
    :try_start_d
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 122
    .local v0, "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_23

    goto :goto_13

    .line 134
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_23
    move-exception v3

    iget-object v4, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .line 124
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2a
    :try_start_2a
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_30
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/pool/PoolEntry;

    .line 125
    .restart local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lorg/apache/http/pool/PoolEntry;->close()V

    goto :goto_30

    .line 127
    .end local v0    # "entry":Lorg/apache/http/pool/PoolEntry;, "TE;"
    :cond_40
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/pool/RouteSpecificPool;

    .line 128
    .local v2, "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2}, Lorg/apache/http/pool/RouteSpecificPool;->shutdown()V

    goto :goto_4a

    .line 130
    .end local v2    # "pool":Lorg/apache/http/pool/RouteSpecificPool;, "Lorg/apache/http/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_5a
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 131
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 132
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V
    :try_end_69
    .catchall {:try_start_2a .. :try_end_69} :catchall_23

    .line 134
    iget-object v3, p0, Lorg/apache/http/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 499
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool;, "Lorg/apache/http/pool/AbstractConnPool<TT;TC;TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[leased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 502
    const-string v1, "][available: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 504
    const-string v1, "][pending: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    iget-object v1, p0, Lorg/apache/http/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 506
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
