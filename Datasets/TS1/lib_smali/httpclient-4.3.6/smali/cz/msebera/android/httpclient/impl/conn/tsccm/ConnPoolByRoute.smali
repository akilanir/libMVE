.class public Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;
.super Lcz/msebera/android/httpclient/impl/conn/tsccm/AbstractConnPool;
.source "ConnPoolByRoute.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected final connPerRoute:Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;

.field private final connTTL:J

.field private final connTTLTimeUnit:Ljava/util/concurrent/TimeUnit;

.field protected final freeConnections:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected final leasedConnections:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;",
            ">;"
        }
    .end annotation
.end field

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field protected volatile maxTotalConnections:I

.field protected volatile numConnections:I

.field protected final operator:Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;

.field private final poolLock:Ljava/util/concurrent/locks/Lock;

.field protected final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;",
            ">;"
        }
    .end annotation
.end field

.field protected volatile shutdown:Z

.field protected final waitingThreads:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;I)V
    .registers 11
    .param p1, "operator"    # Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;
    .param p2, "connPerRoute"    # Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;
    .param p3, "maxTotalConnections"    # I

    .prologue
    .line 114
    const-wide/16 v4, -0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;-><init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;IJLjava/util/concurrent/TimeUnit;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;IJLjava/util/concurrent/TimeUnit;)V
    .registers 9
    .param p1, "operator"    # Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;
    .param p2, "connPerRoute"    # Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;
    .param p3, "maxTotalConnections"    # I
    .param p4, "connTTL"    # J
    .param p6, "connTTLTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 126
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/AbstractConnPool;-><init>()V

    .line 73
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 127
    const-string v0, "Connection operator"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 128
    const-string v0, "Connections per route"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 129
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/AbstractConnPool;->poolLock:Ljava/util/concurrent/locks/Lock;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    .line 130
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/AbstractConnPool;->leasedConnections:Ljava/util/Set;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    .line 131
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->operator:Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;

    .line 132
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connPerRoute:Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;

    .line 133
    iput p3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->maxTotalConnections:I

    .line 134
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->createFreeConnQueue()Ljava/util/Queue;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    .line 135
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->createWaitingThreadQueue()Ljava/util/Queue;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    .line 136
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->createRouteToPoolMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    .line 137
    iput-wide p4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connTTL:J

    .line 138
    iput-object p6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connTTLTimeUnit:Ljava/util/concurrent/TimeUnit;

    .line 139
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 5
    .param p1, "operator"    # Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;
    .param p2, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 152
    .line 153
    invoke-static {p2}, Lcz/msebera/android/httpclient/conn/params/ConnManagerParams;->getMaxConnectionsPerRoute(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;

    move-result-object v0

    .line 154
    invoke-static {p2}, Lcz/msebera/android/httpclient/conn/params/ConnManagerParams;->getMaxTotalConnections(Lcz/msebera/android/httpclient/params/HttpParams;)I

    move-result v1

    .line 152
    invoke-direct {p0, p1, v0, v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;-><init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;I)V

    .line 155
    return-void
.end method

.method static synthetic access$000(Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;)Ljava/util/concurrent/locks/Lock;
    .registers 2
    .param p0, "x0"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;

    .prologue
    .line 71
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method private closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    .registers 6
    .param p1, "entry"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .prologue
    .line 216
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v0

    .line 217
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/OperatedClientConnection;
    if-eqz v0, :cond_9

    .line 219
    :try_start_6
    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_a

    .line 224
    :cond_9
    :goto_9
    return-void

    .line 220
    :catch_a
    move-exception v1

    .line 221
    .local v1, "ex":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v3, "I/O error closing connection"

    invoke-virtual {v2, v3, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_9
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 10

    .prologue
    .line 742
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Closing expired connections"

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 743
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 745
    .local v2, "now":J
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 747
    :try_start_10
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 748
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_16
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 749
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 750
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    invoke-virtual {v0, v2, v3}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->isExpired(J)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 751
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_51

    .line 752
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Closing connection expired @ "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getExpiry()J

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 754
    :cond_51
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 755
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_57
    .catchall {:try_start_10 .. :try_end_57} :catchall_58

    goto :goto_16

    .line 759
    .end local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :catchall_58
    move-exception v4

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v4

    .restart local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_5f
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 761
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v4, 0x0

    .line 715
    const-string v6, "Time unit"

    invoke-static {p3, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 716
    cmp-long v6, p1, v4

    if-lez v6, :cond_c

    move-wide v4, p1

    .line 717
    .local v4, "t":J
    :cond_c
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_36

    .line 718
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Closing connections idle longer than "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 721
    :cond_36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {p3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    sub-long v0, v6, v8

    .line 722
    .local v0, "deadline":J
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 724
    :try_start_45
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v6}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 725
    .local v3, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_4b
    :goto_4b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_96

    .line 726
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 727
    .local v2, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getUpdated()J

    move-result-wide v6

    cmp-long v6, v6, v0

    if-gtz v6, :cond_4b

    .line 728
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_88

    .line 729
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Closing connection last used @ "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getUpdated()J

    move-result-wide v9

    invoke-direct {v8, v9, v10}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 731
    :cond_88
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 732
    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_8e
    .catchall {:try_start_45 .. :try_end_8e} :catchall_8f

    goto :goto_4b

    .line 736
    .end local v2    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .end local v3    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :catchall_8f
    move-exception v6

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v6

    .restart local v3    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_96
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 738
    return-void
.end method

.method protected createEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .registers 9
    .param p1, "rospl"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .param p2, "op"    # Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;

    .prologue
    .line 545
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 546
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating new connection ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 550
    :cond_2a
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v2

    iget-wide v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connTTL:J

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connTTLTimeUnit:Ljava/util/concurrent/TimeUnit;

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;-><init>(Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;JLjava/util/concurrent/TimeUnit;)V

    .line 552
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 554
    :try_start_3d
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->createdEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    .line 555
    iget v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    .line 556
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_4b
    .catchall {:try_start_3d .. :try_end_4b} :catchall_51

    .line 558
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 561
    return-object v0

    .line 558
    :catchall_51
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method protected createFreeConnQueue()Ljava/util/Queue;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue",
            "<",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 164
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    return-object v0
.end method

.method protected createRouteToPoolMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method protected createWaitingThreadQueue()Ljava/util/Queue;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue",
            "<",
            "Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    return-object v0
.end method

.method public deleteClosedConnections()V
    .registers 5

    .prologue
    .line 691
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 693
    :try_start_5
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 694
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 695
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 696
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getConnection()Lcz/msebera/android/httpclient/conn/OperatedClientConnection;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/conn/OperatedClientConnection;->isOpen()Z

    move-result v2

    if-nez v2, :cond_b

    .line 697
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 698
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_27
    .catchall {:try_start_5 .. :try_end_27} :catchall_28

    goto :goto_b

    .line 702
    .end local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :catchall_28
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .restart local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_2f
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 704
    return-void
.end method

.method protected deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    .registers 7
    .param p1, "entry"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .prologue
    .line 578
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getPlannedRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v1

    .line 580
    .local v1, "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 581
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleting connection ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 582
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 581
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 585
    :cond_38
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 588
    :try_start_3d
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    .line 590
    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v0

    .line 591
    .local v0, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)Z

    .line 592
    iget v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    .line 593
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->isUnused()Z

    move-result v2

    if-eqz v2, :cond_59

    .line 594
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_59
    .catchall {:try_start_3d .. :try_end_59} :catchall_5f

    .line 598
    :cond_59
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 600
    return-void

    .line 598
    .end local v0    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    :catchall_5f
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method

.method protected deleteLeastUsedEntry()V
    .registers 4

    .prologue
    .line 608
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 611
    :try_start_5
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 613
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    if-eqz v0, :cond_18

    .line 614
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->deleteEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_28

    .line 620
    :cond_12
    :goto_12
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 622
    return-void

    .line 615
    :cond_18
    :try_start_18
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 616
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "No free connection to delete"

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_18 .. :try_end_27} :catchall_28

    goto :goto_12

    .line 620
    .end local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    :catchall_28
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public freeEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;ZJLjava/util/concurrent/TimeUnit;)V
    .registers 12
    .param p1, "entry"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .param p2, "reusable"    # Z
    .param p3, "validDuration"    # J
    .param p5, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 427
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getPlannedRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v1

    .line 428
    .local v1, "route":Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_38

    .line 429
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Releasing connection ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 430
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 429
    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 433
    :cond_38
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 435
    :try_start_3d
    iget-boolean v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->shutdown:Z

    if-eqz v3, :cond_4a

    .line 438
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_44
    .catchall {:try_start_3d .. :try_end_44} :catchall_dc

    .line 470
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 472
    :goto_49
    return-void

    .line 443
    :cond_4a
    :try_start_4a
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 445
    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v0

    .line 447
    .local v0, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    if-eqz p2, :cond_cf

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getCapacity()I

    move-result v3

    if-ltz v3, :cond_cf

    .line 448
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_b7

    .line 450
    const-wide/16 v3, 0x0

    cmp-long v3, p3, v3

    if-lez v3, :cond_cc

    .line 451
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 455
    .local v2, "s":Ljava/lang/String;
    :goto_87
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Pooling connection ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 456
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]; keep alive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 455
    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 458
    .end local v2    # "s":Ljava/lang/String;
    :cond_b7
    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->freeEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    .line 459
    invoke-virtual {p1, p3, p4, p5}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->updateExpiry(JLjava/util/concurrent/TimeUnit;)V

    .line 460
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v3, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 467
    :goto_c2
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->notifyWaitingThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)V
    :try_end_c5
    .catchall {:try_start_4a .. :try_end_c5} :catchall_dc

    .line 470
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto/16 :goto_49

    .line 453
    :cond_cc
    :try_start_cc
    const-string v2, "indefinitely"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_87

    .line 462
    .end local v2    # "s":Ljava/lang/String;
    :cond_cf
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    .line 463
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->dropEntry()V

    .line 464
    iget v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I
    :try_end_db
    .catchall {:try_start_cc .. :try_end_db} :catchall_dc

    goto :goto_c2

    .line 470
    .end local v0    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    :catchall_dc
    move-exception v3

    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3
.end method

.method public getConnectionsInPool()I
    .registers 3

    .prologue
    .line 268
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 270
    :try_start_5
    iget v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 272
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_d
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getConnectionsInPool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)I
    .registers 5
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .prologue
    const/4 v1, 0x0

    .line 256
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 259
    const/4 v2, 0x0

    :try_start_7
    invoke-virtual {p0, p1, v2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v0

    .line 260
    .local v0, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getEntryCount()I
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_17

    move-result v1

    .line 263
    :cond_11
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v1

    .end local v0    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    :catchall_17
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method protected getEntryBlocking(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .registers 18
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "timeout"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "aborter"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/conn/ConnectionPoolTimeoutException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 328
    const/4 v1, 0x0

    .line 329
    .local v1, "deadline":Ljava/util/Date;
    const-wide/16 v7, 0x0

    cmp-long v7, p3, v7

    if-lez v7, :cond_17

    .line 330
    new-instance v1, Ljava/util/Date;

    .line 331
    .end local v1    # "deadline":Ljava/util/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    move-object/from16 v0, p5

    invoke-virtual {v0, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v9

    add-long/2addr v7, v9

    invoke-direct {v1, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 334
    .restart local v1    # "deadline":Ljava/util/Date;
    :cond_17
    const/4 v2, 0x0

    .line 335
    .local v2, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 338
    const/4 v7, 0x1

    :try_start_1e
    invoke-virtual {p0, p1, v7}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v4

    .line 339
    .local v4, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    const/4 v6, 0x0

    .line 341
    .local v6, "waitingThread":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    :cond_23
    :goto_23
    if-nez v2, :cond_8d

    .line 342
    iget-boolean v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->shutdown:Z

    if-nez v7, :cond_93

    const/4 v7, 0x1

    :goto_2a
    const-string v8, "Connection pool shut down"

    invoke-static {v7, v8}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 344
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_87

    .line 345
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] total kept alive: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v9}, Ljava/util/Queue;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", total issued: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    .line 346
    invoke-interface {v9}, Ljava/util/Set;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", total allocated: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " out of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->maxTotalConnections:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 345
    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 356
    :cond_87
    invoke-virtual {p0, v4, p2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getFreeEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;Ljava/lang/Object;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    :try_end_8a
    .catchall {:try_start_1e .. :try_end_8a} :catchall_182

    move-result-object v2

    .line 357
    if-eqz v2, :cond_95

    .line 419
    :cond_8d
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 421
    return-object v2

    .line 342
    :cond_93
    const/4 v7, 0x0

    goto :goto_2a

    .line 361
    :cond_95
    :try_start_95
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getCapacity()I

    move-result v7

    if-lez v7, :cond_f8

    const/4 v3, 0x1

    .line 363
    .local v3, "hasCapacity":Z
    :goto_9c
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_e8

    .line 364
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Available capacity: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getCapacity()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " out of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 365
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getMaxEntries()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 364
    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 369
    :cond_e8
    if-eqz v3, :cond_fa

    iget v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    iget v8, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->maxTotalConnections:I

    if-ge v7, v8, :cond_fa

    .line 371
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->operator:Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;

    invoke-virtual {p0, v4, v7}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->createEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    move-result-object v2

    goto/16 :goto_23

    .line 361
    .end local v3    # "hasCapacity":Z
    :cond_f8
    const/4 v3, 0x0

    goto :goto_9c

    .line 373
    .restart local v3    # "hasCapacity":Z
    :cond_fa
    if-eqz v3, :cond_114

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_114

    .line 375
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->deleteLeastUsedEntry()V

    .line 378
    const/4 v7, 0x1

    invoke-virtual {p0, p1, v7}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v4

    .line 379
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->operator:Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;

    invoke-virtual {p0, v4, v7}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->createEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;Lcz/msebera/android/httpclient/conn/ClientConnectionOperator;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    move-result-object v2

    goto/16 :goto_23

    .line 383
    :cond_114
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_144

    .line 384
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Need to wait for connection ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 388
    :cond_144
    if-nez v6, :cond_155

    .line 389
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    .line 390
    invoke-interface {v7}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v7

    invoke-virtual {p0, v7, v4}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->newWaitingThread(Ljava/util/concurrent/locks/Condition;Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;

    move-result-object v6

    .line 391
    move-object/from16 v0, p6

    invoke-virtual {v0, v6}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;->setWaitingThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;)V
    :try_end_155
    .catchall {:try_start_95 .. :try_end_155} :catchall_182

    .line 394
    :cond_155
    const/4 v5, 0x0

    .line 396
    .local v5, "success":Z
    :try_start_156
    invoke-virtual {v4, v6}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->queueThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;)V

    .line 397
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v7, v6}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 398
    invoke-virtual {v6, v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;->await(Ljava/util/Date;)Z
    :try_end_161
    .catchall {:try_start_156 .. :try_end_161} :catchall_189

    move-result v5

    .line 405
    :try_start_162
    invoke-virtual {v4, v6}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->removeThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;)V

    .line 406
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v7, v6}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 410
    if-nez v5, :cond_23

    if-eqz v1, :cond_23

    .line 411
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-gtz v7, :cond_23

    .line 412
    new-instance v7, Lcz/msebera/android/httpclient/conn/ConnectionPoolTimeoutException;

    const-string v8, "Timeout waiting for connection from pool"

    invoke-direct {v7, v8}, Lcz/msebera/android/httpclient/conn/ConnectionPoolTimeoutException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_182
    .catchall {:try_start_162 .. :try_end_182} :catchall_182

    .line 419
    .end local v3    # "hasCapacity":Z
    .end local v4    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .end local v5    # "success":Z
    .end local v6    # "waitingThread":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    :catchall_182
    move-exception v7

    iget-object v8, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v8}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v7

    .line 405
    .restart local v3    # "hasCapacity":Z
    .restart local v4    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .restart local v5    # "success":Z
    .restart local v6    # "waitingThread":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    :catchall_189
    move-exception v7

    :try_start_18a
    invoke-virtual {v4, v6}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->removeThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;)V

    .line 406
    iget-object v8, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v8, v6}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    throw v7
    :try_end_193
    .catchall {:try_start_18a .. :try_end_193} :catchall_182
.end method

.method protected getFreeEntry(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;Ljava/lang/Object;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .registers 8
    .param p1, "rospl"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 484
    const/4 v1, 0x0

    .line 485
    .local v1, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 487
    const/4 v0, 0x0

    .line 488
    .local v0, "done":Z
    :cond_7
    :goto_7
    if-nez v0, :cond_da

    .line 490
    :try_start_9
    invoke-virtual {p1, p2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->allocEntry(Ljava/lang/Object;)Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    move-result-object v1

    .line 492
    if-eqz v1, :cond_a3

    .line 493
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_43

    .line 494
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Getting free connection ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 495
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 494
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 498
    :cond_43
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v2, v1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    .line 499
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->isExpired(J)Z

    move-result v2

    if-eqz v2, :cond_9b

    .line 502
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_86

    .line 503
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Closing expired free connection ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 504
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 503
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 506
    :cond_86
    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    .line 510
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->dropEntry()V

    .line 511
    iget v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I
    :try_end_92
    .catchall {:try_start_9 .. :try_end_92} :catchall_94

    goto/16 :goto_7

    .line 526
    :catchall_94
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 513
    :cond_9b
    :try_start_9b
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 514
    const/4 v0, 0x1

    goto/16 :goto_7

    .line 518
    :cond_a3
    const/4 v0, 0x1

    .line 519
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 520
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No free connections ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 521
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 520
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_d8
    .catchall {:try_start_9b .. :try_end_d8} :catchall_94

    goto/16 :goto_7

    .line 526
    :cond_da
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 528
    return-object v1
.end method

.method protected getLock()Ljava/util/concurrent/locks/Lock;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method public getMaxTotalConnections()I
    .registers 2

    .prologue
    .line 825
    iget v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->maxTotalConnections:I

    return v0
.end method

.method protected getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .registers 7
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "create"    # Z

    .prologue
    .line 237
    const/4 v1, 0x0

    .line 238
    .local v1, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 241
    :try_start_6
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-object v1, v0

    .line 242
    if-nez v1, :cond_1d

    if-eqz p2, :cond_1d

    .line 244
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->newRouteSpecificPool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v1

    .line 245
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_6 .. :try_end_1d} :catchall_23

    .line 249
    :cond_1d
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 252
    return-object v1

    .line 249
    :catchall_23
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method

.method protected handleLostEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)V
    .registers 5
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .prologue
    .line 627
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 630
    const/4 v1, 0x1

    :try_start_6
    invoke-virtual {p0, p1, v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->getRoutePool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Z)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    move-result-object v0

    .line 631
    .local v0, "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->dropEntry()V

    .line 632
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->isUnused()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 633
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    :cond_18
    iget v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->numConnections:I

    .line 637
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->notifyWaitingThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)V
    :try_end_21
    .catchall {:try_start_6 .. :try_end_21} :catchall_27

    .line 640
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 642
    return-void

    .line 640
    .end local v0    # "rospl":Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    :catchall_27
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method protected newRouteSpecificPool(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;
    .registers 4
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .prologue
    .line 197
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->connPerRoute:Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;

    invoke-direct {v0, p1, v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;-><init>(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;)V

    return-object v0
.end method

.method protected newWaitingThread(Ljava/util/concurrent/locks/Condition;Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    .registers 4
    .param p1, "cond"    # Ljava/util/concurrent/locks/Condition;
    .param p2, "rospl"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    .prologue
    .line 212
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;

    invoke-direct {v0, p1, p2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;-><init>(Ljava/util/concurrent/locks/Condition;Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)V

    return-object v0
.end method

.method protected notifyWaitingThread(Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;)V
    .registers 7
    .param p1, "rospl"    # Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;

    .prologue
    .line 659
    const/4 v1, 0x0

    .line 661
    .local v1, "waitingThread":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 664
    if-eqz p1, :cond_47

    :try_start_8
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->hasThread()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 665
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 666
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Notifying thread waiting on pool ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 667
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 666
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 669
    :cond_38
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/RouteSpecificPool;->nextThread()Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;

    move-result-object v1

    .line 679
    :cond_3c
    :goto_3c
    if-eqz v1, :cond_41

    .line 680
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;->wakeup()V
    :try_end_41
    .catchall {:try_start_8 .. :try_end_41} :catchall_79

    .line 684
    :cond_41
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 686
    return-void

    .line 670
    :cond_47
    :try_start_47
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_69

    .line 671
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 672
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v3, "Notifying thread waiting on any pool"

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 674
    :cond_5e
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;

    move-object v1, v0

    goto :goto_3c

    .line 675
    :cond_69
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 676
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v3, "Notifying no-one, there are no waiting threads"

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_78
    .catchall {:try_start_47 .. :try_end_78} :catchall_79

    goto :goto_3c

    .line 684
    :catchall_79
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
.end method

.method public requestPoolEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/impl/conn/tsccm/PoolEntryRequest;
    .registers 5
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 281
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;-><init>()V

    .line 283
    .local v0, "aborter":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;
    new-instance v1, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute$1;

    invoke-direct {v1, p0, v0, p1, p2}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute$1;-><init>(Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThreadAborter;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)V

    return-object v1
.end method

.method public setMaxTotalConnections(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 812
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 814
    :try_start_5
    iput p1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->maxTotalConnections:I
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_d

    .line 816
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 818
    return-void

    .line 816
    :catchall_d
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public shutdown()V
    .registers 9

    .prologue
    .line 765
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 767
    :try_start_5
    iget-boolean v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->shutdown:Z
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_2b

    if-eqz v5, :cond_f

    .line 804
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 806
    :goto_e
    return-void

    .line 770
    :cond_f
    const/4 v5, 0x1

    :try_start_10
    iput-boolean v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->shutdown:Z

    .line 773
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->leasedConnections:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 774
    .local v1, "iter1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    .line 775
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 776
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 777
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V
    :try_end_2a
    .catchall {:try_start_10 .. :try_end_2a} :catchall_2b

    goto :goto_18

    .line 804
    .end local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    .end local v1    # "iter1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :catchall_2b
    move-exception v5

    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v6}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v5

    .line 781
    .restart local v1    # "iter1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :cond_32
    :try_start_32
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->freeConnections:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 782
    .local v2, "iter2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;>;"
    :goto_38
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_83

    .line 783
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;

    .line 784
    .restart local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 786
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_7f

    .line 787
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Closing connection ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 788
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getPlannedRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 787
    invoke-virtual {v5, v6}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 790
    :cond_7f
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->closeConnection(Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;)V

    goto :goto_38

    .line 794
    .end local v0    # "entry":Lcz/msebera/android/httpclient/impl/conn/tsccm/BasicPoolEntry;
    :cond_83
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->waitingThreads:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 795
    .local v3, "iwth":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;>;"
    :goto_89
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 796
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;

    .line 797
    .local v4, "waiter":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 798
    invoke-virtual {v4}, Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;->wakeup()V

    goto :goto_89

    .line 801
    .end local v4    # "waiter":Lcz/msebera/android/httpclient/impl/conn/tsccm/WaitingThread;
    :cond_9c
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->routeToPool:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V
    :try_end_a1
    .catchall {:try_start_32 .. :try_end_a1} :catchall_2b

    .line 804
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ConnPoolByRoute;->poolLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v5}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto/16 :goto_e
.end method
