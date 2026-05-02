.class public abstract Lcz/msebera/android/httpclient/pool/AbstractConnPool;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lcz/msebera/android/httpclient/pool/ConnPool;
.implements Lcz/msebera/android/httpclient/pool/ConnPoolControl;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "E:",
        "Lcz/msebera/android/httpclient/pool/PoolEntry",
        "<TT;TC;>;>",
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/pool/ConnPool",
        "<TT;TE;>;",
        "Lcz/msebera/android/httpclient/pool/ConnPoolControl",
        "<TT;>;"
    }
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

.field private final connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/pool/ConnFactory",
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
            "Lcz/msebera/android/httpclient/pool/PoolEntryFuture",
            "<TE;>;>;"
        }
    .end annotation
.end field

.field private final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Lcz/msebera/android/httpclient/pool/RouteSpecificPool",
            "<TT;TC;TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/pool/ConnFactory;II)V
    .registers 5
    .param p2, "defaultMaxPerRoute"    # I
    .param p3, "maxTotal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/ConnFactory",
            "<TT;TC;>;II)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "connFactory":Lcz/msebera/android/httpclient/pool/ConnFactory;, "Lcz/msebera/android/httpclient/pool/ConnFactory<TT;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const-string v0, "Connection factory"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/ConnFactory;

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;

    .line 85
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I

    .line 86
    const-string v0, "Max total value"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    .line 87
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 90
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 91
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    .line 93
    return-void
.end method

.method static synthetic access$000(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;
    .registers 8
    .param p0, "x0"    # Lcz/msebera/android/httpclient/pool/AbstractConnPool;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;
    .param p3, "x3"    # J
    .param p5, "x4"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "x5"    # Lcz/msebera/android/httpclient/pool/PoolEntryFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct/range {p0 .. p6}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;

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
    .line 331
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 332
    .local v0, "v":Ljava/lang/Integer;
    if-eqz v0, :cond_f

    .line 333
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 335
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I

    goto :goto_e
.end method

.method private getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcz/msebera/android/httpclient/pool/RouteSpecificPool",
            "<TT;TC;TE;>;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 145
    .local v0, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    if-nez v0, :cond_14

    .line 146
    new-instance v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool$1;

    .end local v0    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-direct {v0, p0, p1, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$1;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    .restart local v0    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :cond_14
    return-object v0
.end method

.method private getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;
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
            "Lcz/msebera/android/httpclient/pool/PoolEntryFuture",
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
    .line 211
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p6, "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    const/4 v4, 0x0

    .line 212
    .local v4, "deadline":Ljava/util/Date;
    const-wide/16 v17, 0x0

    cmp-long v17, p3, v17

    if-lez v17, :cond_1c

    .line 213
    new-instance v4, Ljava/util/Date;

    .line 214
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

    .line 217
    .restart local v4    # "deadline":Ljava/util/Date;
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 219
    :try_start_25
    invoke-direct/range {p0 .. p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v13

    .line 220
    .local v13, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    const/4 v5, 0x0

    .line 221
    .local v5, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_2a
    if-nez v5, :cond_18e

    .line 222
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    move/from16 v17, v0

    if-nez v17, :cond_66

    const/16 v17, 0x1

    :goto_36
    const-string v18, "Connection pool shut down"

    invoke-static/range {v17 .. v18}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 224
    :goto_3b
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getFree(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v5

    .line 225
    if-nez v5, :cond_69

    .line 236
    :cond_43
    if-eqz v5, :cond_9c

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_5b
    .catchall {:try_start_25 .. :try_end_5b} :catchall_91

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v6, v5

    .end local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .local v6, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :goto_65
    return-object v6

    .line 222
    .end local v6    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .restart local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_66
    const/16 v17, 0x0

    goto :goto_36

    .line 228
    :cond_69
    :try_start_69
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isClosed()Z

    move-result v17

    if-nez v17, :cond_7b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-wide/from16 v0, v17

    invoke-virtual {v5, v0, v1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isExpired(J)Z

    move-result v17

    if-eqz v17, :cond_43

    .line 229
    :cond_7b
    invoke-virtual {v5}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 231
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v13, v5, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->free(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V
    :try_end_90
    .catchall {:try_start_69 .. :try_end_90} :catchall_91

    goto :goto_3b

    .line 299
    .end local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .end local v13    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_91
    move-exception v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v17

    .line 243
    .restart local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .restart local v13    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_9c
    :try_start_9c
    invoke-direct/range {p0 .. p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v11

    .line 245
    .local v11, "maxPerRoute":I
    const/16 v17, 0x0

    invoke-virtual {v13}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v18

    add-int/lit8 v18, v18, 0x1

    sub-int v18, v18, v11

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 246
    .local v7, "excess":I
    if-lez v7, :cond_b9

    .line 247
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_b1
    if-ge v9, v7, :cond_b9

    .line 248
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getLastUsed()Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v10

    .line 249
    .local v10, "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    if-nez v10, :cond_13e

    .line 258
    .end local v9    # "i":I
    .end local v10    # "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_b9
    invoke-virtual {v13}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v17

    move/from16 v0, v17

    if-ge v0, v11, :cond_153

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->size()I

    move-result v16

    .line 260
    .local v16, "totalUsed":I
    move-object/from16 v0, p0

    iget v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    move/from16 v17, v0

    sub-int v17, v17, v16

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 261
    .local v8, "freeCapacity":I
    if-lez v8, :cond_153

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->size()I

    move-result v15

    .line 263
    .local v15, "totalAvailable":I
    add-int/lit8 v17, v8, -0x1

    move/from16 v0, v17

    if-le v15, v0, :cond_115

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_115

    .line 265
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 266
    .restart local v10    # "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 267
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v12

    .line 268
    .local v12, "otherpool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v12, v10}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z

    .line 271
    .end local v10    # "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .end local v12    # "otherpool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/pool/ConnFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 272
    .local v3, "conn":Ljava/lang/Object;, "TC;"
    invoke-virtual {v13, v3}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->add(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v5

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_132
    .catchall {:try_start_9c .. :try_end_132} :catchall_91

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v6, v5

    .end local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .restart local v6    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    goto/16 :goto_65

    .line 252
    .end local v3    # "conn":Ljava/lang/Object;, "TC;"
    .end local v6    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .end local v8    # "freeCapacity":I
    .end local v15    # "totalAvailable":I
    .end local v16    # "totalUsed":I
    .restart local v5    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .restart local v9    # "i":I
    .restart local v10    # "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_13e
    :try_start_13e
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 254
    invoke-virtual {v13, v10}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z
    :try_end_14f
    .catchall {:try_start_13e .. :try_end_14f} :catchall_91

    .line 247
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_b1

    .line 278
    .end local v9    # "i":I
    .end local v10    # "lastUsed":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_153
    const/4 v14, 0x0

    .line 280
    .local v14, "success":Z
    :try_start_154
    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->queue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 282
    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;->await(Ljava/util/Date;)Z
    :try_end_16b
    .catchall {:try_start_154 .. :try_end_16b} :catchall_196

    move-result v14

    .line 288
    :try_start_16c
    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->unqueue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 292
    if-nez v14, :cond_2a

    if-eqz v4, :cond_2a

    .line 293
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v17

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    cmp-long v17, v17, v19

    if-gtz v17, :cond_2a

    .line 297
    .end local v7    # "excess":I
    .end local v11    # "maxPerRoute":I
    .end local v14    # "success":Z
    :cond_18e
    new-instance v17, Ljava/util/concurrent/TimeoutException;

    const-string v18, "Timeout waiting for connection"

    invoke-direct/range {v17 .. v18}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 288
    .restart local v7    # "excess":I
    .restart local v11    # "maxPerRoute":I
    .restart local v14    # "success":Z
    :catchall_196
    move-exception v17

    move-object/from16 v0, p6

    invoke-virtual {v13, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->unqueue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    throw v17
    :try_end_1aa
    .catchall {:try_start_16c .. :try_end_1aa} :catchall_91
.end method

.method private purgePoolMap()V
    .registers 6

    .prologue
    .line 469
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 470
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;>;"
    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 471
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 472
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 473
    .local v2, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v4

    add-int/2addr v3, v4

    if-nez v3, :cond_a

    .line 474
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_a

    .line 477
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;"
    .end local v2    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_2b
    return-void
.end method


# virtual methods
.method public closeExpired()V
    .registers 4

    .prologue
    .line 508
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 509
    .local v0, "now":J
    new-instance v2, Lcz/msebera/android/httpclient/pool/AbstractConnPool$4;

    invoke-direct {v2, p0, v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$4;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V

    .line 518
    return-void
.end method

.method public closeIdle(JLjava/util/concurrent/TimeUnit;)V
    .registers 10
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 487
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 488
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 489
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_11

    .line 490
    const-wide/16 v2, 0x0

    .line 492
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 493
    .local v0, "deadline":J
    new-instance v4, Lcz/msebera/android/httpclient/pool/AbstractConnPool$3;

    invoke-direct {v4, p0, v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$3;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V

    .line 502
    return-void
.end method

.method protected abstract createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)TE;"
        }
    .end annotation
.end method

.method protected enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 432
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "callback":Lcz/msebera/android/httpclient/pool/PoolEntryCallback;, "Lcz/msebera/android/httpclient/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 434
    :try_start_5
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 435
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 436
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 437
    .local v0, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/pool/PoolEntryCallback;->process(Lcz/msebera/android/httpclient/pool/PoolEntry;)V

    .line 438
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 439
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, v3}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v2

    .line 440
    .local v2, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z

    .line 441
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_2e
    .catchall {:try_start_5 .. :try_end_2e} :catchall_2f

    goto :goto_b

    .line 446
    .end local v0    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .end local v2    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_2f
    move-exception v3

    iget-object v4, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .line 444
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_36
    :try_start_36
    invoke-direct {p0}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->purgePoolMap()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_2f

    .line 446
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 448
    return-void
.end method

.method protected enumLeased(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 456
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "callback":Lcz/msebera/android/httpclient/pool/PoolEntryCallback;, "Lcz/msebera/android/httpclient/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 458
    :try_start_5
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 459
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 460
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 461
    .local v0, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/pool/PoolEntryCallback;->process(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_1b

    goto :goto_b

    .line 464
    .end local v0    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :catchall_1b
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :cond_22
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 466
    return-void
.end method

.method public getDefaultMaxPerRoute()I
    .registers 3

    .prologue
    .line 369
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 371
    :try_start_5
    iget v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 373
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

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
    .line 389
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 390
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 392
    :try_start_a
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_14

    move-result v0

    .line 394
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_14
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxTotal()I
    .registers 3

    .prologue
    .line 350
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 352
    :try_start_5
    iget v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 354
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getStats(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolStats;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcz/msebera/android/httpclient/pool/PoolStats;"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v1, "Route"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 413
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 415
    :try_start_a
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v0

    .line 416
    .local v0, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    new-instance v1, Lcz/msebera/android/httpclient/pool/PoolStats;

    .line 417
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getLeasedCount()I

    move-result v2

    .line 418
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    .line 419
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAvailableCount()I

    move-result v4

    .line 420
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcz/msebera/android/httpclient/pool/PoolStats;-><init>(IIII)V
    :try_end_23
    .catchall {:try_start_a .. :try_end_23} :catchall_29

    .line 422
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    .end local v0    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_29
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public getTotalStats()Lcz/msebera/android/httpclient/pool/PoolStats;
    .registers 6

    .prologue
    .line 399
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 401
    :try_start_5
    new-instance v0, Lcz/msebera/android/httpclient/pool/PoolStats;

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 402
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 403
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 404
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcz/msebera/android/httpclient/pool/PoolStats;-><init>(IIII)V
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_24

    .line 407
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_24
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public isShutdown()Z
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

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
    .line 202
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lcz/msebera/android/httpclient/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;Lcz/msebera/android/httpclient/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
    .registers 10
    .param p2, "state"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "Lcz/msebera/android/httpclient/concurrent/FutureCallback",
            "<TE;>;)",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 168
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    .local p3, "callback":Lcz/msebera/android/httpclient/concurrent/FutureCallback;, "Lcz/msebera/android/httpclient/concurrent/FutureCallback<TE;>;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :goto_a
    const-string v1, "Connection pool shut down"

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 170
    new-instance v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool$2;

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object v1, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$2;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/util/concurrent/locks/Lock;Lcz/msebera/android/httpclient/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 169
    :cond_1b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected onLease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    return-void
.end method

.method protected onRelease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    return-void
.end method

.method public release(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V
    .registers 7
    .param p2, "reusable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 306
    :try_start_5
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 307
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v1

    .line 308
    .local v1, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v1, p1, p2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->free(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V

    .line 309
    if-eqz p2, :cond_3c

    iget-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-nez v2, :cond_3c

    .line 310
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 311
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->onRelease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V

    .line 315
    :goto_26
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->nextPending()Lcz/msebera/android/httpclient/pool/PoolEntryFuture;

    move-result-object v0

    .line 316
    .local v0, "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    if-eqz v0, :cond_47

    .line 317
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 321
    :goto_31
    if-eqz v0, :cond_36

    .line 322
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;->wakeup()V
    :try_end_36
    .catchall {:try_start_5 .. :try_end_36} :catchall_40

    .line 326
    .end local v0    # "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    .end local v1    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_36
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 328
    return-void

    .line 313
    .restart local v1    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_3c
    :try_start_3c
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_40

    goto :goto_26

    .line 326
    .end local v1    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_40
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 319
    .restart local v0    # "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    .restart local v1    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_47
    :try_start_47
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;
    :try_end_4f
    .catchall {:try_start_47 .. :try_end_4f} :catchall_40

    .restart local v0    # "future":Lcz/msebera/android/httpclient/pool/PoolEntryFuture;, "Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    goto :goto_31
.end method

.method public bridge synthetic release(Ljava/lang/Object;Z)V
    .registers 3

    .prologue
    .line 63
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    check-cast p1, Lcz/msebera/android/httpclient/pool/PoolEntry;

    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->release(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V

    return-void
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 359
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max per route value"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNegative(ILjava/lang/String;)I

    .line 360
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 362
    :try_start_a
    iput p1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_12

    .line 364
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 366
    return-void

    .line 364
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

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
    .line 378
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, "route":Ljava/lang/Object;, "TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 379
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNegative(ILjava/lang/String;)I

    .line 380
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 382
    :try_start_f
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_1e

    .line 384
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 386
    return-void

    .line 384
    :catchall_1e
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxTotal(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 340
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max value"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNegative(ILjava/lang/String;)I

    .line 341
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 343
    :try_start_a
    iput p1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_12

    .line 345
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 347
    return-void

    .line 345
    :catchall_12
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public shutdown()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v2, :cond_5

    .line 141
    :goto_4
    return-void

    .line 123
    :cond_5
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    .line 124
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 126
    :try_start_d
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 127
    .local v0, "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_23

    goto :goto_13

    .line 139
    .end local v0    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :catchall_23
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 129
    :cond_2a
    :try_start_2a
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 130
    .restart local v0    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    goto :goto_30

    .line 132
    .end local v0    # "entry":Lcz/msebera/android/httpclient/pool/PoolEntry;, "TE;"
    :cond_40
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 133
    .local v1, "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->shutdown()V

    goto :goto_4a

    .line 135
    .end local v1    # "pool":Lcz/msebera/android/httpclient/pool/RouteSpecificPool;, "Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_5a
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 136
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 137
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V
    :try_end_69
    .catchall {:try_start_2a .. :try_end_69} :catchall_23

    .line 139
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 522
    .local p0, "this":Lcz/msebera/android/httpclient/pool/AbstractConnPool;, "Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 523
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[leased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 525
    const-string v1, "][available: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 527
    const-string v1, "][pending: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 528
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 529
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
