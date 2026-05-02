.class public Lch/qos/logback/core/ContextBase;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/Context;
.implements Lch/qos/logback/core/spi/LifeCycle;


# instance fields
.field private birthTime:J

.field configurationLock:Lch/qos/logback/core/spi/LogbackLock;

.field private volatile executorService:Ljava/util/concurrent/ExecutorService;

.field private lifeCycleManager:Lch/qos/logback/core/LifeCycleManager;

.field private name:Ljava/lang/String;

.field objectMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field propertyMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private sm:Lch/qos/logback/core/status/StatusManager;

.field private started:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lch/qos/logback/core/ContextBase;->birthTime:J

    new-instance v0, Lch/qos/logback/core/BasicStatusManager;

    invoke-direct {v0}, Lch/qos/logback/core/BasicStatusManager;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->sm:Lch/qos/logback/core/status/StatusManager;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->propertyMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->objectMap:Ljava/util/Map;

    new-instance v0, Lch/qos/logback/core/spi/LogbackLock;

    invoke-direct {v0}, Lch/qos/logback/core/spi/LogbackLock;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->configurationLock:Lch/qos/logback/core/spi/LogbackLock;

    return-void
.end method

.method private declared-synchronized stopExecutorService()V
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-static {v0}, Lch/qos/logback/core/util/ExecutorServiceUtil;->shutdown(Ljava/util/concurrent/ExecutorService;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    :cond_d
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getBirthTime()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/ContextBase;->birthTime:J

    return-wide v0
.end method

.method public getConfigurationLock()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->configurationLock:Lch/qos/logback/core/spi/LogbackLock;

    return-object v0
.end method

.method public getCopyOfPropertyMap()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lch/qos/logback/core/ContextBase;->propertyMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_10

    monitor-enter p0

    :try_start_5
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_f

    invoke-static {}, Lch/qos/logback/core/util/ExecutorServiceUtil;->newExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    :cond_f
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_13

    :cond_10
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->executorService:Ljava/util/concurrent/ExecutorService;

    return-object v0

    :catchall_13
    move-exception v0

    :try_start_14
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_13

    throw v0
.end method

.method declared-synchronized getLifeCycleManager()Lch/qos/logback/core/LifeCycleManager;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->lifeCycleManager:Lch/qos/logback/core/LifeCycleManager;

    if-nez v0, :cond_c

    new-instance v0, Lch/qos/logback/core/LifeCycleManager;

    invoke-direct {v0}, Lch/qos/logback/core/LifeCycleManager;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/ContextBase;->lifeCycleManager:Lch/qos/logback/core/LifeCycleManager;

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->lifeCycleManager:Lch/qos/logback/core/LifeCycleManager;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->objectMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "CONTEXT_NAME"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lch/qos/logback/core/ContextBase;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->propertyMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_c
.end method

.method public getStatusManager()Lch/qos/logback/core/status/StatusManager;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->sm:Lch/qos/logback/core/status/StatusManager;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/ContextBase;->started:Z

    return v0
.end method

.method public putObject(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->objectMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public putProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->propertyMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public register(Lch/qos/logback/core/spi/LifeCycle;)V
    .registers 3

    invoke-virtual {p0}, Lch/qos/logback/core/ContextBase;->getLifeCycleManager()Lch/qos/logback/core/LifeCycleManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lch/qos/logback/core/LifeCycleManager;->register(Lch/qos/logback/core/spi/LifeCycle;)V

    return-void
.end method

.method public reset()V
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/ContextBase;->getLifeCycleManager()Lch/qos/logback/core/LifeCycleManager;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/LifeCycleManager;->reset()V

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->propertyMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->objectMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    if-eqz p1, :cond_b

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    :goto_a
    return-void

    :cond_b
    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    if-eqz v0, :cond_19

    const-string v0, "default"

    iget-object v1, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    :cond_19
    iput-object p1, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    goto :goto_a

    :cond_1c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context has been already given a name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setStatusManager(Lch/qos/logback/core/status/StatusManager;)V
    .registers 4

    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null StatusManager not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    iput-object p1, p0, Lch/qos/logback/core/ContextBase;->sm:Lch/qos/logback/core/status/StatusManager;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/ContextBase;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/ContextBase;->stopExecutorService()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/ContextBase;->started:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/ContextBase;->name:Ljava/lang/String;

    return-object v0
.end method
