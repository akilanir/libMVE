.class public Lcom/octo/android/robospice/request/DefaultRequestRunner;
.super Ljava/lang/Object;
.source "DefaultRequestRunner.java"

# interfaces
.implements Lcom/octo/android/robospice/request/RequestRunner;


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private final cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

.field private executorLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private failOnCacheError:Z

.field private isStopped:Z

.field private final networkStateChecker:Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

.field private final requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/octo/android/robospice/persistence/CacheManager;Ljava/util/concurrent/ExecutorService;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/networkstate/NetworkStateChecker;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cacheManager"    # Lcom/octo/android/robospice/persistence/CacheManager;
    .param p3, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p4, "requestProgressBroadcaster"    # Lcom/octo/android/robospice/request/RequestProgressManager;
    .param p5, "networkStateChecker"    # Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 54
    iput-object p1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->applicationContext:Landroid/content/Context;

    .line 55
    iput-object p2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    .line 56
    iput-object p5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->networkStateChecker:Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

    .line 58
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 60
    iput-object p3, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 61
    iput-object p4, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    .line 63
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->networkStateChecker:Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

    invoke-interface {v0, p1}, Lcom/octo/android/robospice/networkstate/NetworkStateChecker;->checkPermissions(Landroid/content/Context;)V

    .line 64
    return-void
.end method

.method private static getTimeString(J)Ljava/lang/String;
    .registers 6
    .param p0, "millis"    # J

    .prologue
    .line 291
    const-string v0, "%02d ms"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private handleRetry(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
    .registers 5
    .param p2, "e"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/persistence/exception/SpiceException;",
            ")V"
        }
    .end annotation

    .prologue
    .line 270
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 271
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/octo/android/robospice/retry/RetryPolicy;->retry(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    .line 272
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;

    move-result-object v0

    invoke-interface {v0}, Lcom/octo/android/robospice/retry/RetryPolicy;->getRetryCount()I

    move-result v0

    if-lez v0, :cond_25

    .line 273
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;

    invoke-direct {v1, p0, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;-><init>(Lcom/octo/android/robospice/request/DefaultRequestRunner;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 288
    :goto_24
    return-void

    .line 287
    :cond_25
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    goto :goto_24
.end method

.method private loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;
    .registers 6
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .param p3, "maxTimeInCacheBeforeExpiry"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            "J)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/octo/android/robospice/persistence/CacheManager;->loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 8
    .param p0, "startTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 295
    .local p2, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    const-string v0, "It tooks %s to process request %s."

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, p0

    invoke-static {v3, v4}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->getTimeString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 296
    return-void
.end method

.method private saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "data":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/persistence/CacheManager;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public executeRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 71
    :try_start_5
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->isStopped:Z

    if-eqz v0, :cond_2e

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Dropping request : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " as runner is stopped."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_28
    .catchall {:try_start_5 .. :try_end_28} :catchall_37

    .line 77
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 79
    :goto_2d
    return-void

    .line 75
    :cond_2e
    :try_start_2e
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->planRequestExecution(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_37

    .line 77
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_2d

    :catchall_37
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public isFailOnCacheError()Z
    .registers 2

    .prologue
    .line 234
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->failOnCacheError:Z

    return v0
.end method

.method public isStopped()Z
    .registers 2

    .prologue
    .line 254
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->isStopped:Z

    return v0
.end method

.method protected planRequestExecution(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;

    invoke-direct {v2, p0, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;-><init>(Lcom/octo/android/robospice/request/DefaultRequestRunner;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 230
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    invoke-virtual {p1, v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setFuture(Ljava/util/concurrent/Future;)V

    .line 231
    return-void
.end method

.method protected processRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    const/4 v9, 0x0

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 83
    .local v3, "startTime":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Processing request : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 85
    const/4 v2, 0x0

    .line 90
    .local v2, "result":Ljava/lang/Object;, "TT;"
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->createProgressListener(Lcom/octo/android/robospice/request/CachedSpiceRequest;)Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    move-result-object v1

    .line 92
    .local v1, "requestProgressListener":Lcom/octo/android/robospice/request/listener/RequestProgressListener;
    invoke-virtual {p1, v1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setRequestProgressListener(Lcom/octo/android/robospice/request/listener/RequestProgressListener;)V

    .line 94
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_ae

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getCacheDuration()J

    move-result-wide v5

    const-wide/16 v7, -0x1

    cmp-long v5, v5, v7

    if-eqz v5, :cond_ae

    .line 97
    :try_start_37
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Loading request from cache : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 98
    sget-object v5, Lcom/octo/android/robospice/request/listener/RequestStatus;->READING_FROM_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p1, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 99
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getCacheDuration()J

    move-result-wide v7

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 102
    if-eqz v2, :cond_93

    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Request loaded from cache : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " result="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 104
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, v2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V

    .line 105
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 210
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    :goto_92
    return-void

    .line 107
    .restart local v2    # "result":Ljava/lang/Object;, "TT;"
    :cond_93
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isAcceptingDirtyCache()Z

    move-result v5

    if-eqz v5, :cond_ae

    .line 111
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v6

    const-wide/16 v7, 0x0

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 112
    if-eqz v2, :cond_ae

    .line 113
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, v2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestSuccessButDontCompleteRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V
    :try_end_ae
    .catch Lcom/octo/android/robospice/persistence/exception/SpiceException; {:try_start_37 .. :try_end_ae} :catch_e0

    .line 129
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    :cond_ae
    :goto_ae
    const-string v5, "Cache content not available or expired or disabled"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 130
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->networkStateChecker:Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

    iget-object v6, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->applicationContext:Landroid/content/Context;

    invoke-interface {v5, v6}, Lcom/octo/android/robospice/networkstate/NetworkStateChecker;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_108

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isOffline()Z

    move-result v5

    if-nez v5, :cond_108

    .line 131
    const-string v5, "Network is down."

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 133
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_dc

    .line 135
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    new-instance v6, Lcom/octo/android/robospice/exception/NoNetworkException;

    invoke-direct {v6}, Lcom/octo/android/robospice/exception/NoNetworkException;-><init>()V

    invoke-virtual {v5, p1, v6}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    .line 138
    :cond_dc
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto :goto_92

    .line 116
    :catch_e0
    move-exception v0

    .line 117
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/SpiceException;
    const-string v5, "Cache file could not be read."

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 118
    iget-boolean v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->failOnCacheError:Z

    if-eqz v5, :cond_f3

    .line 119
    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->handleRetry(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    .line 120
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto :goto_92

    .line 123
    :cond_f3
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/octo/android/robospice/persistence/CacheManager;->removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z

    .line 124
    const-string v5, "Cache file deleted."

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_ae

    .line 144
    .end local v0    # "e":Lcom/octo/android/robospice/persistence/exception/SpiceException;
    :cond_108
    :try_start_108
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_144

    .line 145
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_111
    .catch Ljava/lang/Exception; {:try_start_108 .. :try_end_111} :catch_112

    goto :goto_92

    .line 152
    :catch_112
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_199

    .line 154
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "An exception occurred during request network execution :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 155
    new-instance v5, Lcom/octo/android/robospice/exception/NetworkException;

    const-string v6, "Exception occurred during invocation of web service."

    invoke-direct {v5, v6, v0}, Lcom/octo/android/robospice/exception/NetworkException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v5}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->handleRetry(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    .line 159
    :goto_13f
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_92

    .line 148
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_144
    :try_start_144
    const-string v5, "Calling netwok request."

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 149
    sget-object v5, Lcom/octo/android/robospice/request/listener/RequestStatus;->LOADING_FROM_NETWORK:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p1, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 150
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->loadDataFromNetwork()Ljava/lang/Object;

    move-result-object v2

    .line 151
    .restart local v2    # "result":Ljava/lang/Object;, "TT;"
    const-string v5, "Network request call ended."

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_15d
    .catch Ljava/lang/Exception; {:try_start_144 .. :try_end_15d} :catch_112

    .line 163
    if-eqz v2, :cond_1f1

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1f1

    .line 167
    :try_start_165
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_1a1

    .line 168
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_16e
    .catch Lcom/octo/android/robospice/persistence/exception/SpiceException; {:try_start_165 .. :try_end_16e} :catch_170

    goto/16 :goto_92

    .line 181
    :catch_170
    move-exception v0

    .line 182
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/SpiceException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "An exception occurred during service execution :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/exception/SpiceException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 183
    iget-boolean v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->failOnCacheError:Z

    if-eqz v5, :cond_1cb

    .line 184
    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->handleRetry(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    .line 185
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_92

    .line 157
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    .local v0, "e":Ljava/lang/Exception;
    :cond_199
    const-string v5, "An exception occurred during request network execution but request was cancelled, so listeners are not called."

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_13f

    .line 171
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "result":Ljava/lang/Object;, "TT;"
    :cond_1a1
    :try_start_1a1
    const-string v5, "Start caching content..."

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 172
    sget-object v5, Lcom/octo/android/robospice/request/listener/RequestStatus;->WRITING_TO_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p1, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 173
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {p0, v2, v5}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 174
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_1c1

    .line 175
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_92

    .line 178
    :cond_1c1
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, v2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V

    .line 179
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_1c9
    .catch Lcom/octo/android/robospice/persistence/exception/SpiceException; {:try_start_1a1 .. :try_end_1c9} :catch_170

    goto/16 :goto_92

    .line 188
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/SpiceException;
    :cond_1cb
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_1d6

    .line 189
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_92

    .line 197
    :cond_1d6
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, v2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V

    .line 199
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/octo/android/robospice/persistence/CacheManager;->removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z

    .line 200
    const-string v5, "Cache file deleted."

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v0, v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto/16 :goto_92

    .line 206
    .end local v0    # "e":Lcom/octo/android/robospice/persistence/exception/SpiceException;
    :cond_1f1
    iget-object v5, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, v2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V

    .line 207
    invoke-static {v3, v4, p1}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->printRequestProcessingDuration(JLcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_92
.end method

.method public setFailOnCacheError(Z)V
    .registers 2
    .param p1, "failOnCacheError"    # Z

    .prologue
    .line 238
    iput-boolean p1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->failOnCacheError:Z

    .line 239
    return-void
.end method

.method public shouldStop()V
    .registers 3

    .prologue
    .line 243
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 246
    const/4 v0, 0x1

    :try_start_6
    iput-boolean v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->isStopped:Z

    .line 247
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V
    :try_end_d
    .catchall {:try_start_6 .. :try_end_d} :catchall_13

    .line 249
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 251
    return-void

    .line 249
    :catchall_13
    move-exception v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executorLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
