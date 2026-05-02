.class public Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;
.super Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
.source "InFileStringObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


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
    .line 21
    const-class v0, Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 22
    return-void
.end method


# virtual methods
.method public canHandleClass(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic readCacheDataFromFile(Ljava/io/File;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->readCacheDataFromFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected readCacheDataFromFile(Ljava/io/File;)Ljava/lang/String;
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 32
    :try_start_0
    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_5} :catch_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_30

    move-result-object v1

    .line 38
    :goto_6
    return-object v1

    .line 33
    :catch_7
    move-exception v0

    .line 37
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " does not exists"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->w(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 38
    const/4 v1, 0x0

    goto :goto_6

    .line 39
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_30
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;

    invoke-direct {v1, v0}, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 18
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->saveDataToCacheAndReturnData(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public saveDataToCacheAndReturnData(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .registers 7
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Saving String "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " into cacheKey = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 48
    :try_start_23
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->isAsyncSaveEnabled()Z

    move-result v2

    if-eqz v2, :cond_32

    .line 50
    new-instance v1, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister$1;-><init>(Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .local v1, "t":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 67
    .end local v1    # "t":Ljava/lang/Thread;
    :goto_31
    return-object p1

    .line 62
    :cond_32
    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/string/InFileStringObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {v2, p1, v3}, Lorg/apache/commons/io/FileUtils;->writeStringToFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_3b} :catch_3c

    goto :goto_31

    .line 64
    :catch_3c
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    invoke-direct {v2, v0}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
