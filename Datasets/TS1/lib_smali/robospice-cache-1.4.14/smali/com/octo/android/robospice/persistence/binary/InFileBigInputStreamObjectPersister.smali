.class public final Lcom/octo/android/robospice/persistence/binary/InFileBigInputStreamObjectPersister;
.super Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;
.source "InFileBigInputStreamObjectPersister.java"


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 2
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;-><init>(Landroid/app/Application;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Ljava/io/File;)V
    .registers 3
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister;-><init>(Landroid/app/Application;Ljava/io/File;)V

    .line 33
    return-void
.end method


# virtual methods
.method public saveDataToCacheAndReturnData(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 8
    .param p1, "data"    # Ljava/io/InputStream;
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v1, 0x0

    .line 44
    .local v1, "output":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBigInputStreamObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_1a
    .catchall {:try_start_1 .. :try_end_a} :catchall_21

    .line 45
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .local v2, "output":Ljava/io/FileOutputStream;
    :try_start_a
    invoke-static {p1, v2}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 46
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBigInputStreamObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_16} :catch_29
    .catchall {:try_start_a .. :try_end_16} :catchall_26

    .line 50
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    return-object v3

    .line 47
    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    :catch_1a
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/IOException;
    :goto_1b
    :try_start_1b
    new-instance v3, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    invoke-direct {v3, v0}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_21
    .catchall {:try_start_1b .. :try_end_21} :catchall_21

    .line 50
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_21
    move-exception v3

    :goto_22
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v3

    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v2    # "output":Ljava/io/FileOutputStream;
    :catchall_26
    move-exception v3

    move-object v1, v2

    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    goto :goto_22

    .line 47
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v2    # "output":Ljava/io/FileOutputStream;
    :catch_29
    move-exception v0

    move-object v1, v2

    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    goto :goto_1b
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
    .line 25
    check-cast p1, Ljava/io/InputStream;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBigInputStreamObjectPersister;->saveDataToCacheAndReturnData(Ljava/io/InputStream;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public setAsyncSaveEnabled(Z)V
    .registers 4
    .param p1, "isAsyncSaveEnabled"    # Z

    .prologue
    .line 56
    if-eqz p1, :cond_a

    .line 57
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Asynchronous saving operation not supported."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_a
    return-void
.end method
