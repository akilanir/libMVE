.class public Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;
.super Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
.source "InFileInputStreamObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
        "<",
        "Ljava/io/InputStream;",
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
    .line 24
    const-class v0, Ljava/io/InputStream;

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 25
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
    .line 28
    const-class v0, Ljava/io/InputStream;

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;Ljava/io/File;)V

    .line 29
    return-void
.end method


# virtual methods
.method public canHandleClass(Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    const-class v1, Ljava/io/InputStream;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_5} :catch_7

    .line 82
    const/4 v1, 0x1

    .line 84
    :goto_6
    return v1

    .line 83
    :catch_7
    move-exception v0

    .line 84
    .local v0, "ex":Ljava/lang/ClassCastException;
    const/4 v1, 0x0

    goto :goto_6
.end method

.method protected readCacheDataFromFile(Ljava/io/File;)Ljava/io/InputStream;
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    .line 34
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_5} :catch_6

    .line 40
    :goto_5
    return-object v1

    .line 35
    :catch_6
    move-exception v0

    .line 39
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

    .line 40
    const/4 v1, 0x0

    goto :goto_5
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
    .line 21
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->readCacheDataFromFile(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public saveDataToCacheAndReturnData(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 7
    .param p1, "data"    # Ljava/io/InputStream;
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 53
    :try_start_0
    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 55
    .local v0, "byteArray":[B
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->isAsyncSaveEnabled()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 56
    new-instance v2, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;

    invoke-direct {v2, p0, p2, v0}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister$1;-><init>(Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;Ljava/lang/Object;[B)V

    .line 67
    .local v2, "t":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 72
    .end local v2    # "t":Ljava/lang/Thread;
    :goto_12
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v3

    .line 69
    :cond_18
    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3, v0}, Lorg/apache/commons/io/FileUtils;->writeByteArrayToFile(Ljava/io/File;[B)V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1f} :catch_20

    goto :goto_12

    .line 73
    .end local v0    # "byteArray":[B
    :catch_20
    move-exception v1

    .line 74
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    invoke-direct {v3, v1}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/Throwable;)V

    throw v3
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
    .line 21
    check-cast p1, Ljava/io/InputStream;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;->saveDataToCacheAndReturnData(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
