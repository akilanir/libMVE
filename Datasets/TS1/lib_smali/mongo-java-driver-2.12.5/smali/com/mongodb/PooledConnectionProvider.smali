.class Lcom/mongodb/PooledConnectionProvider;
.super Ljava/lang/Object;
.source "PooledConnectionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;
    }
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private volatile closed:Z

.field private final clusterId:Ljava/lang/String;

.field private final connectionFactory:Lcom/mongodb/ConnectionFactory;

.field private final connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

.field private final generation:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile hasWorked:Z

.field private final maintenanceTask:Ljava/lang/Runnable;

.field private final pool:Lcom/mongodb/ConcurrentPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentPool",
            "<",
            "Lcom/mongodb/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private final serverAddress:Lcom/mongodb/ServerAddress;

.field private final settings:Lcom/mongodb/ConnectionPoolSettings;

.field private final sizeMaintenanceTimer:Ljava/util/concurrent/ExecutorService;

.field private final waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "connection"

    invoke-static {v0}, Lcom/mongodb/Loggers;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/PooledConnectionProvider;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/ConnectionFactory;Lcom/mongodb/ConnectionPoolSettings;Lcom/mongodb/ConnectionPoolListener;)V
    .registers 9
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p3, "connectionFactory"    # Lcom/mongodb/ConnectionFactory;
    .param p4, "settings"    # Lcom/mongodb/ConnectionPoolSettings;
    .param p5, "connectionPoolListener"    # Lcom/mongodb/ConnectionPoolListener;

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 37
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->generation:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 51
    iput-object p3, p0, Lcom/mongodb/PooledConnectionProvider;->connectionFactory:Lcom/mongodb/ConnectionFactory;

    .line 52
    const-string v1, "clusterId"

    invoke-static {v1, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    .line 53
    const-string v1, "serverAddress"

    invoke-static {v1, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerAddress;

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 54
    const-string v1, "settings"

    invoke-static {v1, p4}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ConnectionPoolSettings;

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    .line 55
    new-instance v0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;-><init>(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/PooledConnectionProvider$1;)V

    .line 56
    .local v0, "connectionItemFactory":Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;
    new-instance v1, Lcom/mongodb/ConcurrentPool;

    invoke-virtual {p4}, Lcom/mongodb/ConnectionPoolSettings;->getMaxSize()I

    move-result v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/ConcurrentPool;-><init>(ILcom/mongodb/ConcurrentPool$ItemFactory;)V

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    .line 57
    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->createMaintenanceTask()Ljava/lang/Runnable;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->maintenanceTask:Ljava/lang/Runnable;

    .line 58
    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->createTimer()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->sizeMaintenanceTimer:Ljava/util/concurrent/ExecutorService;

    .line 59
    const-string v1, "connectionPoolListener"

    invoke-static {v1, p5}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ConnectionPoolListener;

    iput-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    .line 60
    new-instance v1, Lcom/mongodb/ConnectionPoolOpenedEvent;

    invoke-direct {v1, p1, p2, p4}, Lcom/mongodb/ConnectionPoolOpenedEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/ConnectionPoolSettings;)V

    invoke-interface {p5, v1}, Lcom/mongodb/ConnectionPoolListener;->connectionPoolOpened(Lcom/mongodb/ConnectionPoolOpenedEvent;)V

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/PooledConnectionProvider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->shouldPrune()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionPoolListener;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;
    .param p1, "x1"    # Lcom/mongodb/Connection;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->fromPreviousGeneration(Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;
    .param p1, "x1"    # Lcom/mongodb/Connection;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->pastMaxLifeTime(Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;
    .param p1, "x1"    # Lcom/mongodb/Connection;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->pastMaxIdleTime(Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/mongodb/PooledConnectionProvider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-boolean v0, p0, Lcom/mongodb/PooledConnectionProvider;->closed:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;
    .param p1, "x1"    # Lcom/mongodb/Connection;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->shouldPrune(Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/logging/Logger;
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lcom/mongodb/PooledConnectionProvider;->LOGGER:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConcurrentPool;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mongodb/PooledConnectionProvider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->shouldEnsureMinSize()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionPoolSettings;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mongodb/PooledConnectionProvider;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->generation:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionFactory;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->connectionFactory:Lcom/mongodb/ConnectionFactory;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mongodb/PooledConnectionProvider;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/PooledConnectionProvider;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    return-object v0
.end method

.method private createMaintenanceTask()Ljava/lang/Runnable;
    .registers 3

    .prologue
    .line 121
    const/4 v0, 0x0

    .line 122
    .local v0, "newMaintenanceTask":Ljava/lang/Runnable;
    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->shouldPrune()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-direct {p0}, Lcom/mongodb/PooledConnectionProvider;->shouldEnsureMinSize()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 123
    :cond_d
    new-instance v0, Lcom/mongodb/PooledConnectionProvider$1;

    .end local v0    # "newMaintenanceTask":Ljava/lang/Runnable;
    invoke-direct {v0, p0}, Lcom/mongodb/PooledConnectionProvider$1;-><init>(Lcom/mongodb/PooledConnectionProvider;)V

    .line 137
    .restart local v0    # "newMaintenanceTask":Ljava/lang/Runnable;
    :cond_12
    return-object v0
.end method

.method private createTimer()Ljava/util/concurrent/ExecutorService;
    .registers 8

    .prologue
    .line 141
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->maintenanceTask:Ljava/lang/Runnable;

    if-nez v1, :cond_6

    .line 142
    const/4 v0, 0x0

    .line 147
    :goto_5
    return-object v0

    .line 144
    :cond_6
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    .line 145
    .local v0, "newTimer":Ljava/util/concurrent/ScheduledExecutorService;
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->maintenanceTask:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3}, Lcom/mongodb/ConnectionPoolSettings;->getMaintenanceInitialDelay(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5}, Lcom/mongodb/ConnectionPoolSettings;->getMaintenanceFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_5
.end method

.method private expired(JJJ)Z
    .registers 9
    .param p1, "startTime"    # J
    .param p3, "curTime"    # J
    .param p5, "maxTime"    # J

    .prologue
    .line 176
    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-eqz v0, :cond_e

    sub-long v0, p3, p1

    cmp-long v0, v0, p5

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private fromPreviousGeneration(Lcom/mongodb/Connection;)Z
    .registers 4
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->generation:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-interface {p1}, Lcom/mongodb/Connection;->getGeneration()I

    move-result v1

    if-le v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private pastMaxIdleTime(Lcom/mongodb/Connection;)Z
    .registers 9
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 164
    invoke-interface {p1}, Lcom/mongodb/Connection;->getLastUsedAt()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v5}, Lcom/mongodb/ConnectionPoolSettings;->getMaxConnectionIdleTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v5

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/PooledConnectionProvider;->expired(JJJ)Z

    move-result v0

    return v0
.end method

.method private pastMaxLifeTime(Lcom/mongodb/Connection;)Z
    .registers 9
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 168
    invoke-interface {p1}, Lcom/mongodb/Connection;->getOpenedAt()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v5}, Lcom/mongodb/ConnectionPoolSettings;->getMaxConnectionLifeTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v5

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/PooledConnectionProvider;->expired(JJJ)Z

    move-result v0

    return v0
.end method

.method private shouldEnsureMinSize()Z
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolSettings;->getMinSize()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private shouldPrune()Z
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    .line 156
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings;->getMaxConnectionIdleTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1a

    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings;->getMaxConnectionLifeTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1c

    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method private shouldPrune(Lcom/mongodb/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->fromPreviousGeneration(Lcom/mongodb/Connection;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->pastMaxLifeTime(Lcom/mongodb/Connection;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->pastMaxIdleTime(Lcom/mongodb/Connection;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/mongodb/PooledConnectionProvider;->closed:Z

    if-nez v0, :cond_23

    .line 102
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentPool;->close()V

    .line 103
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->sizeMaintenanceTimer:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_12

    .line 104
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->sizeMaintenanceTimer:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 106
    :cond_12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/PooledConnectionProvider;->closed:Z

    .line 107
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v1, Lcom/mongodb/ConnectionPoolEvent;

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ConnectionPoolEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ConnectionPoolListener;->connectionPoolClosed(Lcom/mongodb/ConnectionPoolEvent;)V

    .line 109
    :cond_23
    return-void
.end method

.method public doMaintenance()V
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->maintenanceTask:Ljava/lang/Runnable;

    if-eqz v0, :cond_9

    .line 116
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->maintenanceTask:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 118
    :cond_9
    return-void
.end method

.method public get()Lcom/mongodb/Connection;
    .registers 4

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings;->getMaxWaitTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v0, v1, v2}, Lcom/mongodb/PooledConnectionProvider;->get(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;
    .registers 12
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 69
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v2}, Lcom/mongodb/ConnectionPoolSettings;->getMaxWaitQueueSize()I

    move-result v2

    if-le v1, v2, :cond_47

    .line 70
    new-instance v1, Lcom/mongodb/MongoWaitQueueFullException;

    const-string v2, "Too many threads are already waiting for a connection. Max number of threads (maxWaitQueueSize) of %d has been exceeded."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mongodb/PooledConnectionProvider;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v5}, Lcom/mongodb/ConnectionPoolSettings;->getMaxWaitQueueSize()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/MongoWaitQueueFullException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2a
    .catchall {:try_start_0 .. :try_end_2a} :catchall_2a

    .line 84
    :catchall_2a
    move-exception v1

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 85
    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v3, Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v5, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;J)V

    invoke-interface {v2, v3}, Lcom/mongodb/ConnectionPoolListener;->waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V

    throw v1

    .line 74
    :cond_47
    :try_start_47
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v2, Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;J)V

    invoke-interface {v1, v2}, Lcom/mongodb/ConnectionPoolListener;->waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V

    .line 75
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    invoke-virtual {v1, p1, p2, p3}, Lcom/mongodb/ConcurrentPool;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/Connection;

    .line 76
    .local v0, "connection":Lcom/mongodb/Connection;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mongodb/PooledConnectionProvider;->hasWorked:Z

    .line 77
    :goto_68
    invoke-direct {p0, v0}, Lcom/mongodb/PooledConnectionProvider;->shouldPrune(Lcom/mongodb/Connection;)Z

    move-result v1

    if-eqz v1, :cond_7d

    .line 78
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/mongodb/ConcurrentPool;->release(Ljava/lang/Object;Z)V

    .line 79
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    invoke-virtual {v1, p1, p2, p3}, Lcom/mongodb/ConcurrentPool;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "connection":Lcom/mongodb/Connection;
    check-cast v0, Lcom/mongodb/Connection;

    .restart local v0    # "connection":Lcom/mongodb/Connection;
    goto :goto_68

    .line 81
    :cond_7d
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v2, Lcom/mongodb/ConnectionEvent;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-direct {v2, v3, v4}, Lcom/mongodb/ConnectionEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v1, v2}, Lcom/mongodb/ConnectionPoolListener;->connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V
    :try_end_8b
    .catchall {:try_start_47 .. :try_end_8b} :catchall_2a

    .line 84
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 85
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v2, Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;J)V

    invoke-interface {v1, v2}, Lcom/mongodb/ConnectionPoolListener;->waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V

    return-object v0
.end method

.method public hasWorked()Z
    .registers 2

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/mongodb/PooledConnectionProvider;->hasWorked:Z

    return v0
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->generation:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 181
    return-void
.end method

.method public release(Lcom/mongodb/Connection;)V
    .registers 6
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/mongodb/PooledConnectionProvider;->closed:Z

    if-nez v0, :cond_12

    .line 91
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;

    new-instance v1, Lcom/mongodb/ConnectionEvent;

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ConnectionEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ConnectionPoolListener;->connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V

    .line 93
    :cond_12
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider;->pool:Lcom/mongodb/ConcurrentPool;

    invoke-interface {p1}, Lcom/mongodb/Connection;->isClosed()Z

    move-result v0

    if-nez v0, :cond_20

    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider;->shouldPrune(Lcom/mongodb/Connection;)Z

    move-result v0

    if-eqz v0, :cond_25

    :cond_20
    const/4 v0, 0x1

    :goto_21
    invoke-virtual {v1, p1, v0}, Lcom/mongodb/ConcurrentPool;->release(Ljava/lang/Object;Z)V

    .line 94
    return-void

    .line 93
    :cond_25
    const/4 v0, 0x0

    goto :goto_21
.end method
