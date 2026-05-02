.class public abstract Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;
.super Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;
.source "InFileObjectPersisterFactory.java"

# interfaces
.implements Lcom/octo/android/robospice/persistence/CacheCleaner;


# instance fields
.field private cacheFolder:Ljava/io/File;

.field private cachePrefix:Ljava/lang/String;

.field private keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 3
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0, p1, v0, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/io/File;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/util/List;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 43
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/util/List;Ljava/io/File;)V
    .registers 6
    .param p1, "application"    # Landroid/app/Application;
    .param p3, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;",
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
    .line 47
    .local p2, "listHandledClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/ObjectPersisterFactory;-><init>(Landroid/app/Application;Ljava/util/List;)V

    .line 48
    invoke-virtual {p0, p3}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->setCacheFolder(Ljava/io/File;)V

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

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

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->setCachePrefix(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public abstract createInFileObjectPersister(Ljava/lang/Class;Ljava/io/File;)Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/io/File;",
            ")",
            "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation
.end method

.method public bridge synthetic createObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/ObjectPersister;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->createObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

    move-result-object v0

    return-object v0
.end method

.method public final createObjectPersister(Ljava/lang/Class;)Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cacheFolder:Ljava/io/File;

    invoke-virtual {p0, p1, v2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->createInFileObjectPersister(Ljava/lang/Class;Ljava/io/File;)Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;

    move-result-object v1

    .line 116
    .local v1, "inFileObjectPersister":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cachePrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->setFactoryCachePrefix(Ljava/lang/String;)V

    .line 117
    iget-object v2, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;->setKeySanitizer(Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;)V
    :try_end_10
    .catch Lcom/octo/android/robospice/persistence/exception/CacheCreationException; {:try_start_0 .. :try_end_10} :catch_11

    .line 118
    return-object v1

    .line 119
    .end local v1    # "inFileObjectPersister":Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;, "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister<TT;>;"
    :catch_11
    move-exception v0

    .line 120
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Could not create cache folder of factory."

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getCacheFolder()Ljava/io/File;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cacheFolder:Ljava/io/File;

    return-object v0
.end method

.method public getCachePrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cachePrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getKeySanitizer()Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    return-object v0
.end method

.method public removeAllDataFromCache()V
    .registers 10

    .prologue
    const/4 v7, 0x0

    .line 128
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->getCacheFolder()Ljava/io/File;

    move-result-object v4

    .line 129
    .local v4, "cacheFolder":Ljava/io/File;
    new-instance v8, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory$1;

    invoke-direct {v8, p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory$1;-><init>(Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;)V

    invoke-virtual {v4, v8}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v3

    .line 137
    .local v3, "cacheFileList":[Ljava/io/File;
    const/4 v0, 0x1

    .line 138
    .local v0, "allDeleted":Z
    if-eqz v3, :cond_14

    array-length v8, v3

    if-nez v8, :cond_15

    .line 147
    :cond_14
    :goto_14
    return-void

    .line 141
    :cond_15
    move-object v1, v3

    .local v1, "arr$":[Ljava/io/File;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_18
    if-ge v5, v6, :cond_2a

    aget-object v2, v1, v5

    .line 142
    .local v2, "cacheFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v8

    if-eqz v8, :cond_28

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    .line 141
    :goto_25
    add-int/lit8 v5, v5, 0x1

    goto :goto_18

    :cond_28
    move v0, v7

    .line 142
    goto :goto_25

    .line 144
    .end local v2    # "cacheFile":Ljava/io/File;
    :cond_2a
    if-nez v0, :cond_2f

    array-length v8, v3

    if-nez v8, :cond_14

    .line 145
    :cond_2f
    const-string v8, "Some file could not be deleted from cache."

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v8, v7}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_14
.end method

.method public setCacheFolder(Ljava/io/File;)V
    .registers 5
    .param p1, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 67
    if-nez p1, :cond_11

    .line 68
    new-instance p1, Ljava/io/File;

    .end local p1    # "cacheFolder":Ljava/io/File;
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getCacheDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "robospice-cache"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 71
    .restart local p1    # "cacheFolder":Ljava/io/File;
    :cond_11
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cacheFolder:Ljava/io/File;

    .line 72
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_42

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_42

    .line 73
    new-instance v0, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The cache folder "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " could not be created."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_42
    return-void
.end method

.method public setCachePrefix(Ljava/lang/String;)V
    .registers 2
    .param p1, "cachePrefix"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->cachePrefix:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setKeySanitizer(Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;)V
    .registers 2
    .param p1, "keySanitizer"    # Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/file/InFileObjectPersisterFactory;->keySanitizer:Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;

    .line 108
    return-void
.end method
