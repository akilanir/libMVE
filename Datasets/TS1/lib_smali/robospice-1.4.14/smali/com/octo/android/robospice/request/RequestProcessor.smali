.class public Lcom/octo/android/robospice/request/RequestProcessor;
.super Ljava/lang/Object;
.source "RequestProcessor.java"


# instance fields
.field private final cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

.field private isStopped:Z

.field private final mapRequestToRequestListener:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

.field private final requestRunner:Lcom/octo/android/robospice/request/RequestRunner;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/persistence/CacheManager;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/RequestRunner;)V
    .registers 5
    .param p1, "cacheManager"    # Lcom/octo/android/robospice/persistence/CacheManager;
    .param p2, "requestProgressManager"    # Lcom/octo/android/robospice/request/RequestProgressManager;
    .param p3, "requestRunner"    # Lcom/octo/android/robospice/request/RequestRunner;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    .line 48
    iput-object p1, p0, Lcom/octo/android/robospice/request/RequestProcessor;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    .line 49
    iput-object p2, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    .line 50
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-virtual {p2, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->setMapRequestToRequestListener(Ljava/util/Map;)V

    .line 51
    iput-object p3, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestRunner:Lcom/octo/android/robospice/request/RequestRunner;

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/octo/android/robospice/request/RequestProcessor;)Lcom/octo/android/robospice/request/RequestProgressManager;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/request/RequestProcessor;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/octo/android/robospice/request/RequestProcessor;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/request/RequestProcessor;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const/4 v7, 0x0

    .line 58
    iget-boolean v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->isStopped:Z

    if-eqz v5, :cond_24

    .line 59
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Dropping request : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " as processor is stopped."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 133
    :goto_23
    return-void

    .line 63
    :cond_24
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Adding request to queue "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " size is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 65
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_8d

    .line 66
    iget-object v6, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    monitor-enter v6

    .line 67
    :try_start_63
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_6d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 68
    .local v1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    invoke-virtual {p1, v1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6d

    .line 69
    invoke-virtual {v1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cancel()V

    .line 70
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 71
    monitor-exit v6

    goto :goto_23

    .line 74
    .end local v1    # "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_89
    move-exception v5

    monitor-exit v6
    :try_end_8b
    .catchall {:try_start_63 .. :try_end_8b} :catchall_89

    throw v5

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_8c
    :try_start_8c
    monitor-exit v6
    :try_end_8d
    .catchall {:try_start_8c .. :try_end_8d} :catchall_89

    .line 77
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_8d
    const/4 v0, 0x0

    .line 80
    .local v0, "aggregated":Z
    iget-object v6, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    monitor-enter v6

    .line 81
    :try_start_91
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 83
    .local v3, "listRequestListenerForThisRequest":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-nez v3, :cond_d6

    .line 84
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isProcessable()Z

    move-result v5

    if-eqz v5, :cond_c5

    .line 85
    const-string v5, "Adding entry for type %s and cacheKey %s."

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v7}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 86
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-static {v5}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 87
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v5, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    :cond_c5
    :goto_c5
    monitor-exit v6
    :try_end_c6
    .catchall {:try_start_91 .. :try_end_c6} :catchall_ee

    .line 95
    if-eqz p2, :cond_cd

    if-eqz v3, :cond_cd

    .line 96
    invoke-interface {v3, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 99
    :cond_cd
    if-eqz v0, :cond_f1

    .line 100
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    goto/16 :goto_23

    .line 90
    :cond_d6
    :try_start_d6
    const-string v5, "Request for type %s and cacheKey %s already exists."

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v7}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 91
    const/4 v0, 0x1

    goto :goto_c5

    .line 93
    .end local v3    # "listRequestListenerForThisRequest":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :catchall_ee
    move-exception v5

    monitor-exit v6
    :try_end_f0
    .catchall {:try_start_d6 .. :try_end_f0} :catchall_ee

    throw v5

    .line 104
    .restart local v3    # "listRequestListenerForThisRequest":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    :cond_f1
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isProcessable()Z

    move-result v5

    if-eqz v5, :cond_116

    .line 105
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 116
    new-instance v4, Lcom/octo/android/robospice/request/RequestProcessor$1;

    invoke-direct {v4, p0, p1}, Lcom/octo/android/robospice/request/RequestProcessor$1;-><init>(Lcom/octo/android/robospice/request/RequestProcessor;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 124
    .local v4, "requestCancellationListener":Lcom/octo/android/robospice/request/listener/RequestCancellationListener;
    invoke-virtual {p1, v4}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V

    .line 126
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_124

    .line 127
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 128
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_23

    .line 107
    .end local v4    # "requestCancellationListener":Lcom/octo/android/robospice/request/listener/RequestCancellationListener;
    :cond_116
    if-nez v3, :cond_11d

    .line 108
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 110
    :cond_11d
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v5, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    goto/16 :goto_23

    .line 131
    .restart local v4    # "requestCancellationListener":Lcom/octo/android/robospice/request/listener/RequestCancellationListener;
    :cond_124
    iget-object v5, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestRunner:Lcom/octo/android/robospice/request/RequestRunner;

    invoke-interface {v5, p1}, Lcom/octo/android/robospice/request/RequestRunner;->executeRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    goto/16 :goto_23
.end method

.method public addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 199
    return-void
.end method

.method public dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Collection",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 146
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/RequestProgressManager;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V

    .line 147
    return-void
.end method

.method public isFailOnCacheError()Z
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestRunner:Lcom/octo/android/robospice/request/RequestRunner;

    invoke-interface {v0}, Lcom/octo/android/robospice/request/RequestRunner;->isFailOnCacheError()Z

    move-result v0

    return v0
.end method

.method public isStopped()Z
    .registers 2

    .prologue
    .line 211
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->isStopped:Z

    return v0
.end method

.method public removeAllDataFromCache()V
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/CacheManager;->removeAllDataFromCache()V

    .line 159
    return-void
.end method

.method public removeAllDataFromCache(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 154
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->removeAllDataFromCache(Ljava/lang/Class;)V

    .line 155
    return-void
.end method

.method public removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/persistence/CacheManager;->removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 203
    return-void
.end method

.method public setFailOnCacheError(Z)V
    .registers 3
    .param p1, "failOnCacheError"    # Z

    .prologue
    .line 166
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestRunner:Lcom/octo/android/robospice/request/RequestRunner;

    invoke-interface {v0, p1}, Lcom/octo/android/robospice/request/RequestRunner;->setFailOnCacheError(Z)V

    .line 167
    return-void
.end method

.method public shouldStop()V
    .registers 2

    .prologue
    .line 206
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->isStopped:Z

    .line 207
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor;->requestRunner:Lcom/octo/android/robospice/request/RequestRunner;

    invoke-interface {v0}, Lcom/octo/android/robospice/request/RequestRunner;->shouldStop()V

    .line 208
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v4, 0x5d

    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .local v2, "stringBuilder":Ljava/lang/StringBuilder;
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 173
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    const-string v3, " request count= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    iget-object v3, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 179
    const-string v3, ", listeners per requests = ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    iget-object v3, p0, Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_87

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 181
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 184
    const-string v3, " --> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_79

    .line 186
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_3d

    .line 188
    :cond_79
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_3d

    .line 191
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    :cond_87
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 193
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 194
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
