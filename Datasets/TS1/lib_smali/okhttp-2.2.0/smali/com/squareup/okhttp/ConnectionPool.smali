.class public final Lcom/squareup/okhttp/ConnectionPool;
.super Ljava/lang/Object;
.source "ConnectionPool.java"


# static fields
.field private static final DEFAULT_KEEP_ALIVE_DURATION_MS:J = 0x493e0L

.field private static final systemDefault:Lcom/squareup/okhttp/ConnectionPool;


# instance fields
.field private final connections:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/squareup/okhttp/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionsCleanupRunnable:Ljava/lang/Runnable;

.field private executor:Ljava/util/concurrent/Executor;

.field private final keepAliveDurationNs:J

.field private final maxIdleConnections:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 60
    const-string v5, "http.keepAlive"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "keepAlive":Ljava/lang/String;
    const-string v5, "http.keepAliveDuration"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, "keepAliveDuration":Ljava/lang/String;
    const-string v5, "http.maxConnections"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "maxIdleConnections":Ljava/lang/String;
    if-eqz v1, :cond_29

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 65
    .local v2, "keepAliveDurationMs":J
    :goto_18
    if-eqz v0, :cond_2d

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2d

    .line 66
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    .line 72
    :goto_28
    return-void

    .line 63
    .end local v2    # "keepAliveDurationMs":J
    :cond_29
    const-wide/32 v2, 0x493e0

    goto :goto_18

    .line 67
    .restart local v2    # "keepAliveDurationMs":J
    :cond_2d
    if-eqz v4, :cond_3b

    .line 68
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    goto :goto_28

    .line 70
    :cond_3b
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    const/4 v6, 0x5

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    goto :goto_28
.end method

.method public constructor <init>(IJ)V
    .registers 14
    .param p1, "maxIdleConnections"    # I
    .param p2, "keepAliveDurationMs"    # J

    .prologue
    const-wide/16 v8, 0x3e8

    const/4 v2, 0x1

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    .line 91
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x0

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v7, "OkHttp ConnectionPool"

    .line 93
    invoke-static {v7, v2}, Lcom/squareup/okhttp/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->executor:Ljava/util/concurrent/Executor;

    .line 95
    new-instance v0, Lcom/squareup/okhttp/ConnectionPool$1;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/ConnectionPool$1;-><init>(Lcom/squareup/okhttp/ConnectionPool;)V

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    .line 102
    iput p1, p0, Lcom/squareup/okhttp/ConnectionPool;->maxIdleConnections:I

    .line 103
    mul-long v0, p2, v8

    mul-long/2addr v0, v8

    iput-wide v0, p0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    .line 104
    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/ConnectionPool;)V
    .registers 1
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionPool;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/squareup/okhttp/ConnectionPool;->runCleanupUntilPoolIsEmpty()V

    return-void
.end method

.method private addConnection(Lcom/squareup/okhttp/Connection;)V
    .registers 5
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 205
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    .line 206
    .local v0, "empty":Z
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 207
    if-eqz v0, :cond_15

    .line 208
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->executor:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 212
    :goto_14
    return-void

    .line 210
    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_14
.end method

.method public static getDefault()Lcom/squareup/okhttp/ConnectionPool;
    .registers 1

    .prologue
    .line 107
    sget-object v0, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    return-object v0
.end method

.method private runCleanupUntilPoolIsEmpty()V
    .registers 2

    .prologue
    .line 241
    :cond_0
    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionPool;->performCleanup()Z

    move-result v0

    if-nez v0, :cond_0

    return-void
.end method


# virtual methods
.method public evictAll()V
    .registers 5

    .prologue
    .line 229
    monitor-enter p0

    .line 230
    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 231
    .local v2, "toEvict":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    iget-object v3, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 232
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_25

    .line 234
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_13
    if-ge v0, v1, :cond_28

    .line 235
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/squareup/okhttp/Connection;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v3

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 234
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 232
    .end local v0    # "i":I
    .end local v1    # "size":I
    .end local v2    # "toEvict":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    :catchall_25
    move-exception v3

    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v3

    .line 237
    .restart local v0    # "i":I
    .restart local v1    # "size":I
    .restart local v2    # "toEvict":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    :cond_28
    return-void
.end method

.method public declared-synchronized get(Lcom/squareup/okhttp/Address;)Lcom/squareup/okhttp/Connection;
    .registers 10
    .param p1, "address"    # Lcom/squareup/okhttp/Address;

    .prologue
    .line 137
    monitor-enter p0

    const/4 v2, 0x0

    .line 138
    .local v2, "foundConnection":Lcom/squareup/okhttp/Connection;
    :try_start_2
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    iget-object v5, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v3

    .line 139
    .local v3, "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v4

    if-eqz v4, :cond_52

    .line 140
    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Connection;

    .line 141
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/squareup/okhttp/Address;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 142
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 143
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getIdleStartTimeNs()J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-wide v6, p0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_e

    .line 146
    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    .line 147
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z
    :try_end_43
    .catchall {:try_start_2 .. :try_end_43} :catchall_84

    move-result v4

    if-nez v4, :cond_51

    .line 149
    :try_start_46
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/Platform;->tagSocket(Ljava/net/Socket;)V
    :try_end_51
    .catch Ljava/net/SocketException; {:try_start_46 .. :try_end_51} :catch_61
    .catchall {:try_start_46 .. :try_end_51} :catchall_84

    .line 157
    :cond_51
    move-object v2, v0

    .line 161
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_52
    if-eqz v2, :cond_5f

    :try_start_54
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 162
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V
    :try_end_5f
    .catchall {:try_start_54 .. :try_end_5f} :catchall_84

    .line 165
    :cond_5f
    monitor-exit p0

    return-object v2

    .line 150
    .restart local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :catch_61
    move-exception v1

    .line 151
    .local v1, "e":Ljava/net/SocketException;
    :try_start_62
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v4

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 153
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to tagSocket(): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V
    :try_end_83
    .catchall {:try_start_62 .. :try_end_83} :catchall_84

    goto :goto_e

    .line 137
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    .end local v1    # "e":Ljava/net/SocketException;
    .end local v3    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :catchall_84
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized getConnectionCount()I
    .registers 2

    .prologue
    .line 112
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getConnections()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Connection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 334
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getHttpConnectionCount()I
    .registers 3

    .prologue
    .line 132
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionPool;->getMultiplexedConnectionCount()I
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_e

    move-result v1

    sub-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMultiplexedConnectionCount()I
    .registers 5

    .prologue
    .line 123
    monitor-enter p0

    const/4 v1, 0x0

    .line 124
    .local v1, "total":I
    :try_start_2
    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Connection;

    .line 125
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z
    :try_end_17
    .catchall {:try_start_2 .. :try_end_17} :catchall_1f

    move-result v3

    if-eqz v3, :cond_8

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 127
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_1d
    monitor-exit p0

    return v1

    .line 123
    :catchall_1f
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getSpdyConnectionCount()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 118
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/squareup/okhttp/ConnectionPool;->getMultiplexedConnectionCount()I
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result v0

    monitor-exit p0

    return v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method performCleanup()Z
    .registers 24

    .prologue
    .line 266
    monitor-enter p0

    .line 267
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_11

    const/16 v19, 0x0

    monitor-exit p0

    .line 317
    :goto_10
    return v19

    .line 269
    :cond_11
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 270
    .local v3, "evictableConnections":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    const/4 v7, 0x0

    .line 271
    .local v7, "idleConnectionCount":I
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 272
    .local v14, "now":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    .line 275
    .local v12, "nanosUntilNextEviction":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->size()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v6

    .line 276
    .local v6, "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :cond_33
    :goto_33
    invoke-interface {v6}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v19

    if-eqz v19, :cond_70

    .line 277
    invoke-interface {v6}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/Connection;

    .line 278
    .local v2, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getIdleStartTimeNs()J

    move-result-wide v19

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    move-wide/from16 v21, v0

    add-long v19, v19, v21

    sub-long v10, v19, v14

    .line 279
    .local v10, "nanosUntilEviction":J
    const-wide/16 v19, 0x0

    cmp-long v19, v10, v19

    if-lez v19, :cond_59

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v19

    if-nez v19, :cond_63

    .line 280
    :cond_59
    invoke-interface {v6}, Ljava/util/ListIterator;->remove()V

    .line 281
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_33

    .line 309
    .end local v2    # "connection":Lcom/squareup/okhttp/Connection;
    .end local v3    # "evictableConnections":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    .end local v6    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    .end local v7    # "idleConnectionCount":I
    .end local v10    # "nanosUntilEviction":J
    .end local v12    # "nanosUntilNextEviction":J
    .end local v14    # "now":J
    :catchall_60
    move-exception v19

    monitor-exit p0
    :try_end_62
    .catchall {:try_start_1 .. :try_end_62} :catchall_60

    throw v19

    .line 282
    .restart local v2    # "connection":Lcom/squareup/okhttp/Connection;
    .restart local v3    # "evictableConnections":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Connection;>;"
    .restart local v6    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    .restart local v7    # "idleConnectionCount":I
    .restart local v10    # "nanosUntilEviction":J
    .restart local v12    # "nanosUntilNextEviction":J
    .restart local v14    # "now":J
    :cond_63
    :try_start_63
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->isIdle()Z

    move-result v19

    if-eqz v19, :cond_33

    .line 283
    add-int/lit8 v7, v7, 0x1

    .line 284
    invoke-static {v12, v13, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    goto :goto_33

    .line 289
    .end local v2    # "connection":Lcom/squareup/okhttp/Connection;
    .end local v10    # "nanosUntilEviction":J
    :cond_70
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->size()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v6

    .line 290
    :cond_84
    :goto_84
    invoke-interface {v6}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v19

    if-eqz v19, :cond_a9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/squareup/okhttp/ConnectionPool;->maxIdleConnections:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-le v7, v0, :cond_a9

    .line 291
    invoke-interface {v6}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/Connection;

    .line 292
    .restart local v2    # "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->isIdle()Z

    move-result v19

    if-eqz v19, :cond_84

    .line 293
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    invoke-interface {v6}, Ljava/util/ListIterator;->remove()V

    .line 295
    add-int/lit8 v7, v7, -0x1

    goto :goto_84

    .line 300
    .end local v2    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_a9
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z
    :try_end_ac
    .catchall {:try_start_63 .. :try_end_ac} :catchall_60

    move-result v19

    if-eqz v19, :cond_cd

    .line 302
    const-wide/32 v19, 0xf4240

    :try_start_b2
    div-long v8, v12, v19

    .line 303
    .local v8, "millisUntilNextEviction":J
    const-wide/32 v19, 0xf4240

    mul-long v19, v19, v8

    sub-long v16, v12, v19

    .line 304
    .local v16, "remainderNanos":J
    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v8, v9, v1}, Ljava/lang/Object;->wait(JI)V
    :try_end_c7
    .catch Ljava/lang/InterruptedException; {:try_start_b2 .. :try_end_c7} :catch_cc
    .catchall {:try_start_b2 .. :try_end_c7} :catchall_60

    .line 305
    const/16 v19, 0x1

    :try_start_c9
    monitor-exit p0

    goto/16 :goto_10

    .line 306
    .end local v8    # "millisUntilNextEviction":J
    .end local v16    # "remainderNanos":J
    :catch_cc
    move-exception v19

    .line 309
    :cond_cd
    monitor-exit p0
    :try_end_ce
    .catchall {:try_start_c9 .. :try_end_ce} :catchall_60

    .line 312
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v18

    .local v18, "size":I
    :goto_d3
    move/from16 v0, v18

    if-ge v5, v0, :cond_e7

    .line 313
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/squareup/okhttp/Connection;

    .line 314
    .local v4, "expiredConnection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v4}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 312
    add-int/lit8 v5, v5, 0x1

    goto :goto_d3

    .line 317
    .end local v4    # "expiredConnection":Lcom/squareup/okhttp/Connection;
    :cond_e7
    const/16 v19, 0x1

    goto/16 :goto_10
.end method

.method recycle(Lcom/squareup/okhttp/Connection;)V
    .registers 6
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 175
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 202
    :cond_6
    :goto_6
    return-void

    .line 179
    :cond_7
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 183
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 184
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_6

    .line 189
    :cond_1b
    :try_start_1b
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Platform;->untagSocket(Ljava/net/Socket;)V
    :try_end_26
    .catch Ljava/net/SocketException; {:try_start_1b .. :try_end_26} :catch_35

    .line 197
    monitor-enter p0

    .line 198
    :try_start_27
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionPool;->addConnection(Lcom/squareup/okhttp/Connection;)V

    .line 199
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->incrementRecycleCount()V

    .line 200
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->resetIdleStartTime()V

    .line 201
    monitor-exit p0

    goto :goto_6

    :catchall_32
    move-exception v1

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_27 .. :try_end_34} :catchall_32

    throw v1

    .line 190
    :catch_35
    move-exception v0

    .line 192
    .local v0, "e":Ljava/net/SocketException;
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to untagSocket(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 193
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_6
.end method

.method replaceCleanupExecutorForTests(Ljava/util/concurrent/Executor;)V
    .registers 2
    .param p1, "cleanupExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 325
    iput-object p1, p0, Lcom/squareup/okhttp/ConnectionPool;->executor:Ljava/util/concurrent/Executor;

    .line 326
    return-void
.end method

.method share(Lcom/squareup/okhttp/Connection;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 219
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v0

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 220
    :cond_c
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v0

    if-nez v0, :cond_13

    .line 224
    :goto_12
    return-void

    .line 221
    :cond_13
    monitor-enter p0

    .line 222
    :try_start_14
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/ConnectionPool;->addConnection(Lcom/squareup/okhttp/Connection;)V

    .line 223
    monitor-exit p0

    goto :goto_12

    :catchall_19
    move-exception v0

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_19

    throw v0
.end method
