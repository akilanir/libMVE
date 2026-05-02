.class public Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;
.super Lcom/octo/android/robospice/persistence/ObjectPersister;
.source "LruCacheObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/octo/android/robospice/persistence/ObjectPersister",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<TT;>;"
        }
    .end annotation
.end field

.field private lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/octo/android/robospice/persistence/memory/LruCache",
            "<",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/persistence/memory/CacheItem",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/persistence/ObjectPersister;Lcom/octo/android/robospice/persistence/memory/LruCache;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<TT;>;",
            "Lcom/octo/android/robospice/persistence/memory/LruCache",
            "<",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/persistence/memory/CacheItem",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    .local p1, "decoratedPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<TT;>;"
    .local p2, "lruCache":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;>;"
    invoke-virtual {p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getHandledClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/persistence/ObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 30
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    .line 31
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lcom/octo/android/robospice/persistence/memory/LruCache;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/octo/android/robospice/persistence/memory/LruCache",
            "<",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/persistence/memory/CacheItem",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "lruCache":Lcom/octo/android/robospice/persistence/memory/LruCache;, "Lcom/octo/android/robospice/persistence/memory/LruCache<Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 25
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    .line 26
    return-void
.end method


# virtual methods
.method public getAllCacheKeys()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v0, :cond_b

    .line 130
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getAllCacheKeys()Ljava/util/List;

    move-result-object v0

    .line 132
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->snapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_a
.end method

.method public getCreationDateInCache(Ljava/lang/Object;)J
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .line 103
    .local v0, "cacheItem":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    if-eqz v0, :cond_f

    .line 104
    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getCreationDate()J

    move-result-wide v1

    .line 107
    :goto_e
    return-wide v1

    .line 106
    :cond_f
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v1, :cond_1a

    .line 107
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getCreationDateInCache(Ljava/lang/Object;)J

    move-result-wide v1

    goto :goto_e

    .line 110
    :cond_1a
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Data could not be found in cache for cacheKey="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getDecoratedPersister()Lcom/octo/android/robospice/persistence/ObjectPersister;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    return-object v0
.end method

.method public getLruCache()Lcom/octo/android/robospice/persistence/memory/LruCache;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/octo/android/robospice/persistence/memory/LruCache",
            "<",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/persistence/memory/CacheItem",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    return-object v0
.end method

.method public isDataInCache(Ljava/lang/Object;J)Z
    .registers 13
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .param p2, "maxTimeInCacheBeforeExpiry"    # J

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 85
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v5, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .line 87
    .local v0, "cacheItem":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    if-nez v0, :cond_17

    .line 88
    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v3, :cond_16

    .line 89
    iget-object v3, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v3, p1, p2, p3}, Lcom/octo/android/robospice/persistence/ObjectPersister;->isDataInCache(Ljava/lang/Object;J)Z

    move-result v4

    .line 95
    :cond_16
    :goto_16
    return v4

    .line 93
    :cond_17
    const-wide/16 v5, 0x0

    cmp-long v5, p2, v5

    if-eqz v5, :cond_32

    move v1, v3

    .line 94
    .local v1, "dataCanExpire":Z
    :goto_1e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getCreationDate()J

    move-result-wide v7

    sub-long/2addr v5, v7

    cmp-long v5, v5, p2

    if-gtz v5, :cond_34

    move v2, v3

    .line 95
    .local v2, "dataIsNotExpired":Z
    :goto_2c
    if-eqz v1, :cond_30

    if-eqz v2, :cond_16

    :cond_30
    move v4, v3

    goto :goto_16

    .end local v1    # "dataCanExpire":Z
    .end local v2    # "dataIsNotExpired":Z
    :cond_32
    move v1, v4

    .line 93
    goto :goto_1e

    .restart local v1    # "dataCanExpire":Z
    :cond_34
    move v2, v4

    .line 94
    goto :goto_2c
.end method

.method public loadAllDataFromCache()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v4, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v4, :cond_b

    .line 116
    iget-object v4, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v4}, Lcom/octo/android/robospice/persistence/ObjectPersister;->loadAllDataFromCache()Ljava/util/List;

    move-result-object v0

    .line 123
    :cond_a
    return-object v0

    .line 118
    :cond_b
    iget-object v4, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v4}, Lcom/octo/android/robospice/persistence/memory/LruCache;->snapshot()Ljava/util/Map;

    move-result-object v1

    .line 119
    .local v1, "cacheMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v0, "allData":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .line 121
    .local v3, "item":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    invoke-virtual {v3}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getData()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e
.end method

.method public loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;
    .registers 16
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .param p2, "maxTimeInCacheBeforeExpiry"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "J)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    const/4 v7, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 44
    iget-object v8, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v8, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .line 46
    .local v0, "cacheItem":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    if-nez v0, :cond_3e

    .line 47
    const-string v8, "Miss from lru cache for %s"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v8, v5}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 48
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v5, :cond_3c

    .line 49
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v5, p1, p2, p3}, Lcom/octo/android/robospice/persistence/ObjectPersister;->loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v1

    .line 50
    .local v1, "data":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_24

    move-object v1, v7

    .line 66
    .end local v1    # "data":Ljava/lang/Object;, "TT;"
    :goto_23
    return-object v1

    .line 53
    .restart local v1    # "data":Ljava/lang/Object;, "TT;"
    :cond_24
    new-instance v4, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    iget-object v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v5, p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->getCreationDateInCache(Ljava/lang/Object;)J

    move-result-wide v7

    invoke-direct {v4, v7, v8, v1}, Lcom/octo/android/robospice/persistence/memory/CacheItem;-><init>(JLjava/lang/Object;)V

    .line 54
    .local v4, "item":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    const-string v5, "Put in lru cache after miss"

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 55
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v5, p1, v4}, Lcom/octo/android/robospice/persistence/memory/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_23

    .end local v1    # "data":Ljava/lang/Object;, "TT;"
    .end local v4    # "item":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    :cond_3c
    move-object v1, v7

    .line 58
    goto :goto_23

    .line 60
    :cond_3e
    const-string v8, "Hit from lru cache for %s"

    new-array v9, v5, [Ljava/lang/Object;

    aput-object p1, v9, v6

    invoke-static {v8, v9}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 61
    const-wide/16 v8, 0x0

    cmp-long v8, p2, v8

    if-eqz v8, :cond_65

    move v2, v5

    .line 62
    .local v2, "dataCanExpire":Z
    :goto_4e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getCreationDate()J

    move-result-wide v10

    sub-long/2addr v8, v10

    cmp-long v8, v8, p2

    if-gtz v8, :cond_67

    move v3, v5

    .line 63
    .local v3, "dataIsNotExpired":Z
    :goto_5c
    if-eqz v2, :cond_60

    if-eqz v3, :cond_69

    .line 64
    :cond_60
    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getData()Ljava/lang/Object;

    move-result-object v1

    goto :goto_23

    .end local v2    # "dataCanExpire":Z
    .end local v3    # "dataIsNotExpired":Z
    :cond_65
    move v2, v6

    .line 61
    goto :goto_4e

    .restart local v2    # "dataCanExpire":Z
    :cond_67
    move v3, v6

    .line 62
    goto :goto_5c

    .restart local v3    # "dataIsNotExpired":Z
    :cond_69
    move-object v1, v7

    .line 66
    goto :goto_23
.end method

.method public removeAllDataFromCache()V
    .registers 2

    .prologue
    .line 147
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->evictAll()V

    .line 148
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v0, :cond_e

    .line 149
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v0}, Lcom/octo/android/robospice/persistence/ObjectPersister;->removeAllDataFromCache()V

    .line 151
    :cond_e
    return-void
.end method

.method public removeDataFromCache(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "cacheKey"    # Ljava/lang/Object;

    .prologue
    .line 138
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    const/4 v0, 0x0

    .line 139
    .local v0, "result":Z
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v1, :cond_b

    .line 140
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/persistence/ObjectPersister;->removeDataFromCache(Ljava/lang/Object;)Z

    move-result v0

    .line 142
    :cond_b
    if-nez v0, :cond_15

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_17

    :cond_15
    const/4 v1, 0x1

    :goto_16
    return v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;, "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    invoke-direct {v0, p1}, Lcom/octo/android/robospice/persistence/memory/CacheItem;-><init>(Ljava/lang/Object;)V

    .line 73
    .local v0, "itemToCache":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->lruCache:Lcom/octo/android/robospice/persistence/memory/LruCache;

    invoke-virtual {v1, p2, v0}, Lcom/octo/android/robospice/persistence/memory/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v1, "Put in lru cache for %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 76
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    if-eqz v1, :cond_1e

    .line 77
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;->decoratedPersister:Lcom/octo/android/robospice/persistence/ObjectPersister;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_1e
    return-object p1
.end method
