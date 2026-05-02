.class public Lcom/octo/android/robospice/persistence/CacheManager;
.super Ljava/lang/Object;
.source "CacheManager.java"

# interfaces
.implements Lcom/octo/android/robospice/persistence/ICacheManager;


# instance fields
.field private listPersister:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/octo/android/robospice/persistence/Persister;",
            ">;"
        }
    .end annotation
.end field

.field private mapFactoryToPersister:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;",
            "Ljava/util/List",
            "<",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->listPersister:Ljava/util/Collection;

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->mapFactoryToPersister:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addPersister(Lcom/octo/android/robospice/persistence/Persister;)V
    .registers 5
    .param p1, "persister"    # Lcom/octo/android/robospice/persistence/Persister;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->listPersister:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 44
    instance-of v0, p1, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    if-eqz v0, :cond_16

    .line 47
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->mapFactoryToPersister:Ljava/util/Map;

    check-cast p1, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    .end local p1    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    :cond_15
    return-void

    .line 48
    .restart local p1    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    :cond_16
    instance-of v0, p1, Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-nez v0, :cond_15

    .line 49
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " only supports "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " or "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " instances."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAllCacheKeys(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getAllCacheKeys()Ljava/util/List;
    :try_end_7
    .catch Lcom/octo/android/robospice/persistence/exception/CacheCreationException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 133
    :goto_8
    return-object v1

    .line 131
    :catch_9
    move-exception v0

    .line 132
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    invoke-static {v0}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    .line 133
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_8
.end method

.method public getDateOfDataInCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Date;
    .registers 6
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Date;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getCreationDateInCache(Ljava/lang/Object;)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method protected getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v6, p0, Lcom/octo/android/robospice/persistence/CacheManager;->listPersister:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/octo/android/robospice/persistence/Persister;

    .line 168
    .local v5, "persister":Lcom/octo/android/robospice/persistence/Persister;
    invoke-interface {v5, p1}, Lcom/octo/android/robospice/persistence/Persister;->canHandleClass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 169
    instance-of v6, v5, Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v6, :cond_1f

    .line 170
    check-cast v5, Lcom/octo/android/robospice/persistence/ObjectPersister;

    .line 186
    .end local v5    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    :goto_1e
    return-object v5

    .line 173
    .restart local v5    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    :cond_1f
    instance-of v6, v5, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    if-eqz v6, :cond_6

    move-object v0, v5

    .line 174
    check-cast v0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    .line 176
    .local v0, "factory":Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->canHandleClass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 177
    iget-object v6, p0, Lcom/octo/android/robospice/persistence/CacheManager;->mapFactoryToPersister:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 178
    .local v2, "listPersisterForFactory":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/persistence/ObjectPersister<*>;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/octo/android/robospice/persistence/ObjectPersister;

    .line 179
    .local v4, "objectPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<*>;"
    invoke-virtual {v4, p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->canHandleClass(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_38

    move-object v5, v4

    .line 180
    goto :goto_1e

    .line 183
    .end local v4    # "objectPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<*>;"
    :cond_4c
    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->createObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v3

    .line 184
    .local v3, "newPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;->isAsyncSaveEnabled()Z

    move-result v6

    invoke-virtual {v3, v6}, Lcom/octo/android/robospice/persistence/ObjectPersister;->setAsyncSaveEnabled(Z)V

    .line 185
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v5, v3

    .line 186
    goto :goto_1e

    .line 191
    .end local v0    # "factory":Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
    .end local v2    # "listPersisterForFactory":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/persistence/ObjectPersister<*>;>;"
    .end local v3    # "newPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    .end local v5    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    :cond_5c
    new-instance v6, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is not handled by any registered ObjectPersister. Please add a Persister for this class inside the CacheManager of your SpiceService."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public isDataInCache(Ljava/lang/Class;Ljava/lang/Object;J)Z
    .registers 6
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .param p3, "maxTimeInCacheBeforeExpiry"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "J)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/octo/android/robospice/persistence/ObjectPersister;->isDataInCache(Ljava/lang/Object;J)Z

    move-result v0

    return v0
.end method

.method public loadAllDataFromCache(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 143
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v0

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/ObjectPersister;->loadAllDataFromCache()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;
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
    .line 68
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/octo/android/robospice/persistence/ObjectPersister;->loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeAllDataFromCache()V
    .registers 8

    .prologue
    .line 149
    iget-object v6, p0, Lcom/octo/android/robospice/persistence/CacheManager;->listPersister:Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/octo/android/robospice/persistence/Persister;

    .line 150
    .local v5, "persister":Lcom/octo/android/robospice/persistence/Persister;
    instance-of v6, v5, Lcom/octo/android/robospice/persistence/CacheCleaner;

    if-eqz v6, :cond_1c

    move-object v6, v5

    .line 151
    check-cast v6, Lcom/octo/android/robospice/persistence/CacheCleaner;

    invoke-interface {v6}, Lcom/octo/android/robospice/persistence/CacheCleaner;->removeAllDataFromCache()V

    .line 154
    :cond_1c
    instance-of v6, v5, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    if-eqz v6, :cond_6

    move-object v0, v5

    .line 155
    check-cast v0, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    .line 156
    .local v0, "factory":Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
    iget-object v6, p0, Lcom/octo/android/robospice/persistence/CacheManager;->mapFactoryToPersister:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 157
    .local v3, "listPersisterForFactory":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/persistence/ObjectPersister<*>;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/octo/android/robospice/persistence/ObjectPersister;

    .line 158
    .local v4, "objectPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<*>;"
    invoke-virtual {v4}, Lcom/octo/android/robospice/persistence/ObjectPersister;->removeAllDataFromCache()V

    goto :goto_2f

    .line 163
    .end local v0    # "factory":Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "listPersisterForFactory":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/persistence/ObjectPersister<*>;>;"
    .end local v4    # "objectPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<*>;"
    .end local v5    # "persister":Lcom/octo/android/robospice/persistence/Persister;
    :cond_3f
    return-void
.end method

.method public removeAllDataFromCache(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v1

    invoke-virtual {v1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->removeAllDataFromCache()V
    :try_end_7
    .catch Lcom/octo/android/robospice/persistence/exception/CacheCreationException; {:try_start_0 .. :try_end_7} :catch_8

    .line 122
    :goto_7
    return-void

    .line 119
    :catch_8
    move-exception v0

    .line 120
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    invoke-static {v0}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    goto :goto_7
.end method

.method public removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 5
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
    .line 105
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;->removeDataFromCache(Ljava/lang/Object;)Z
    :try_end_7
    .catch Lcom/octo/android/robospice/persistence/exception/CacheCreationException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v1

    .line 108
    :goto_8
    return v1

    .line 106
    :catch_9
    move-exception v0

    .line 107
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    invoke-static {v0}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    .line 108
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public removePersister(Lcom/octo/android/robospice/persistence/Persister;)V
    .registers 3
    .param p1, "persister"    # Lcom/octo/android/robospice/persistence/Persister;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->listPersister:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 57
    instance-of v0, p1, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;

    if-eqz v0, :cond_e

    .line 58
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/CacheManager;->mapFactoryToPersister:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    :cond_e
    return-void
.end method

.method public saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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
    .line 76
    .local p1, "data":Ljava/lang/Object;, "TT;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/persistence/CacheManager;->getObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;

    move-result-object v0

    .line 77
    .local v0, "classCacheManager":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
