.class public abstract Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
.super Lcom/octo/android/robospice/persistence/ObjectPersister;
.source "InFileObjectPersister.java"


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


# static fields
.field static final CACHE_PREFIX_END:Ljava/lang/String; = "_"

.field static final DEFAULT_ROOT_CACHE_DIR:Ljava/lang/String; = "robospice-cache"


# instance fields
.field private cacheFolder:Ljava/io/File;

.field private factoryCachePrefix:Ljava/lang/String;

.field private keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;


# direct methods
.method public constructor <init>(Landroid/app/Application;Ljava/lang/Class;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->factoryCachePrefix:Ljava/lang/String;

    .line 53
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->setCacheFolder(Ljava/io/File;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/lang/Class;Ljava/io/File;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p3, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->factoryCachePrefix:Ljava/lang/String;

    .line 58
    invoke-virtual {p0, p3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->setCacheFolder(Ljava/io/File;)V

    .line 59
    return-void
.end method


# virtual methods
.method protected final fromKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "cacheKey"    # Ljava/lang/String;

    .prologue
    .line 245
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->isUsingKeySanitizer()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 247
    :try_start_6
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    invoke-interface {v1, p1}, Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;->desanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_e
    .catch Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion; {:try_start_6 .. :try_end_e} :catch_10

    move-object p1, v1

    .line 253
    .end local p1    # "cacheKey":Ljava/lang/String;
    :cond_f
    :goto_f
    return-object p1

    .line 248
    .restart local p1    # "cacheKey":Ljava/lang/String;
    :catch_10
    move-exception v0

    .line 249
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
    const-string v1, "Key could not be desanitized, falling back on original key."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_f
.end method

.method public getAllCacheKeys()Ljava/util/List;
    .registers 12
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
    .line 103
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCachePrefix()Ljava/lang/String;

    move-result-object v6

    .line 104
    .local v6, "prefix":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    .line 105
    .local v7, "prefixLength":I
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFolder()Ljava/io/File;

    move-result-object v9

    new-instance v10, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;

    invoke-direct {v10, p0, v6}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$1;-><init>(Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "cacheFileNameList":[Ljava/lang/String;
    if-nez v2, :cond_1c

    .line 113
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v8

    .line 120
    :cond_1b
    return-object v8

    .line 115
    :cond_1c
    new-instance v8, Ljava/util/ArrayList;

    array-length v9, v2

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 116
    .local v8, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_25
    if-ge v4, v5, :cond_1b

    aget-object v1, v0, v4

    .line 117
    .local v1, "cacheFileName":Ljava/lang/String;
    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, "cacheKey":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->fromKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    add-int/lit8 v4, v4, 0x1

    goto :goto_25
.end method

.method public final getCacheFile(Ljava/lang/Object;)Ljava/io/File;
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;

    .prologue
    .line 206
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFolder()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCachePrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->toKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public final getCacheFolder()Ljava/io/File;
    .registers 2

    .prologue
    .line 87
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->cacheFolder:Ljava/io/File;

    return-object v0
.end method

.method protected final getCachePrefix()Ljava/lang/String;
    .registers 3

    .prologue
    .line 260
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->factoryCachePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getHandledClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
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
    .line 92
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    .line 93
    .local v0, "cacheFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 94
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    return-wide v1

    .line 96
    :cond_f
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

.method public getKeySanitizer()Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;
    .registers 2

    .prologue
    .line 202
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    return-object v0
.end method

.method protected isCachedAndNotExpired(Ljava/io/File;J)Z
    .registers 10
    .param p1, "cacheFile"    # Ljava/io/File;
    .param p2, "maxTimeInCacheBeforeExpiry"    # J

    .prologue
    .line 269
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 270
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 271
    .local v0, "timeInCache":J
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-eqz v2, :cond_1a

    cmp-long v2, v0, p2

    if-gtz v2, :cond_1c

    .line 272
    :cond_1a
    const/4 v2, 0x1

    .line 275
    .end local v0    # "timeInCache":J
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method protected isCachedAndNotExpired(Ljava/lang/Object;J)Z
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .param p2, "maxTimeInCacheBeforeExpiry"    # J

    .prologue
    .line 264
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    .line 265
    .local v0, "cacheFile":Ljava/io/File;
    invoke-virtual {p0, v0, p2, p3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->isCachedAndNotExpired(Ljava/io/File;J)Z

    move-result v1

    return v1
.end method

.method public isDataInCache(Ljava/lang/Object;J)Z
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .param p2, "maxTimeInCacheBeforeExpiry"    # J

    .prologue
    .line 172
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    .line 173
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0, p2, p3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->isCachedAndNotExpired(Ljava/io/File;J)Z

    move-result v1

    return v1
.end method

.method public isUsingKeySanitizer()Z
    .registers 2

    .prologue
    .line 181
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public loadAllDataFromCache()Ljava/util/List;
    .registers 7
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
    .line 126
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getAllCacheKeys()Ljava/util/List;

    move-result-object v0

    .line 127
    .local v0, "allCacheKeys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 128
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 129
    .local v2, "key":Ljava/lang/Object;
    const-wide/16 v4, 0x0

    invoke-virtual {p0, v2, v4, v5}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 131
    .end local v2    # "key":Ljava/lang/Object;
    :cond_25
    return-object v3
.end method

.method public loadDataFromCache(Ljava/lang/Object;J)Ljava/lang/Object;
    .registers 6
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .param p2, "maxTimeInCache"    # J
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
    .line 162
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    .line 163
    .local v0, "file":Ljava/io/File;
    invoke-virtual {p0, v0, p2, p3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->isCachedAndNotExpired(Ljava/io/File;J)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 164
    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->readCacheDataFromFile(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v1

    .line 167
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method protected abstract readCacheDataFromFile(Ljava/io/File;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation
.end method

.method public removeAllDataFromCache()V
    .registers 10

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    const/4 v7, 0x0

    .line 141
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFolder()Ljava/io/File;

    move-result-object v4

    .line 142
    .local v4, "cacheFolder":Ljava/io/File;
    new-instance v8, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;

    invoke-direct {v8, p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister$2;-><init>(Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;)V

    invoke-virtual {v4, v8}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v3

    .line 150
    .local v3, "cacheFileList":[Ljava/io/File;
    const/4 v0, 0x1

    .line 151
    .local v0, "allDeleted":Z
    move-object v1, v3

    .local v1, "arr$":[Ljava/io/File;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_12
    if-ge v5, v6, :cond_24

    aget-object v2, v1, v5

    .line 152
    .local v2, "cacheFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v8

    if-eqz v8, :cond_22

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    .line 151
    :goto_1f
    add-int/lit8 v5, v5, 0x1

    goto :goto_12

    :cond_22
    move v0, v7

    .line 152
    goto :goto_1f

    .line 154
    .end local v2    # "cacheFile":Ljava/io/File;
    :cond_24
    if-nez v0, :cond_29

    array-length v8, v3

    if-nez v8, :cond_30

    .line 155
    :cond_29
    const-string v8, "Some file could not be deleted from cache."

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v8, v7}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 157
    :cond_30
    return-void
.end method

.method public removeDataFromCache(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "cacheKey"    # Ljava/lang/Object;

    .prologue
    .line 136
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    return v0
.end method

.method public setCacheFolder(Ljava/io/File;)V
    .registers 6
    .param p1, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    if-nez p1, :cond_11

    .line 76
    new-instance p1, Ljava/io/File;

    .end local p1    # "cacheFolder":Ljava/io/File;
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getCacheDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "robospice-cache"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 78
    .restart local p1    # "cacheFolder":Ljava/io/File;
    :cond_11
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    monitor-enter v1

    .line 79
    :try_start_1a
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_4c

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_4c

    .line 80
    new-instance v0, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The cache folder "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " could not be created."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :catchall_49
    move-exception v0

    monitor-exit v1
    :try_end_4b
    .catchall {:try_start_1a .. :try_end_4b} :catchall_49

    throw v0

    :cond_4c
    :try_start_4c
    monitor-exit v1
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_49

    .line 83
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->cacheFolder:Ljava/io/File;

    .line 84
    return-void
.end method

.method setFactoryCachePrefix(Ljava/lang/String;)V
    .registers 2
    .param p1, "factoryCachePrefix"    # Ljava/lang/String;

    .prologue
    .line 214
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->factoryCachePrefix:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setKeySanitizer(Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;)V
    .registers 2
    .param p1, "keySanitizer"    # Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    .prologue
    .line 194
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    .line 195
    return-void
.end method

.method protected final toKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "cacheKey"    # Ljava/lang/String;

    .prologue
    .line 224
    .local p0, "this":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->isUsingKeySanitizer()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 226
    :try_start_6
    iget-object v1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    invoke-interface {v1, p1}, Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;->sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_e
    .catch Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion; {:try_start_6 .. :try_end_e} :catch_10

    move-object p1, v1

    .line 232
    .end local p1    # "cacheKey":Ljava/lang/String;
    :cond_f
    :goto_f
    return-object p1

    .line 227
    .restart local p1    # "cacheKey":Ljava/lang/String;
    :catch_10
    move-exception v0

    .line 228
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
    const-string v1, "Key could not be sanitized, falling back on original key."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_f
.end method
