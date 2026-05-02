.class public Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;
.super Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
.source "RetrofitObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final converter:Lretrofit/converter/Converter;


# direct methods
.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/lang/Class;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lretrofit/converter/Converter;",
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
    .line 42
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister<TT;>;"
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;-><init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/lang/Class;Ljava/io/File;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lretrofit/converter/Converter;Ljava/lang/Class;Ljava/io/File;)V
    .registers 5
    .param p1, "application"    # Landroid/app/Application;
    .param p2, "converter"    # Lretrofit/converter/Converter;
    .param p4, "cacheFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lretrofit/converter/Converter;",
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
    .line 37
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister<TT;>;"
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;Ljava/io/File;)V

    .line 38
    iput-object p2, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->converter:Lretrofit/converter/Converter;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p0, "x0"    # Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->saveData(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private saveData(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->converter:Lretrofit/converter/Converter;

    invoke-interface {v3, p1}, Lretrofit/converter/Converter;->toBody(Ljava/lang/Object;)Lretrofit/mime/TypedOutput;

    move-result-object v2

    .line 81
    .local v2, "typedBytes":Lretrofit/mime/TypedOutput;
    const/4 v0, 0x0

    .line 83
    .local v0, "out":Ljava/io/FileOutputStream;
    :try_start_7
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_19

    .line 84
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .local v1, "out":Ljava/io/FileOutputStream;
    :try_start_10
    invoke-interface {v2, v1}, Lretrofit/mime/TypedOutput;->writeTo(Ljava/io/OutputStream;)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_20

    .line 86
    if-eqz v1, :cond_18

    .line 87
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 90
    :cond_18
    return-void

    .line 86
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "out":Ljava/io/FileOutputStream;
    :catchall_19
    move-exception v3

    :goto_1a
    if-eqz v0, :cond_1f

    .line 87
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :cond_1f
    throw v3

    .line 86
    .end local v0    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    :catchall_20
    move-exception v3

    move-object v0, v1

    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "out":Ljava/io/FileOutputStream;
    goto :goto_1a
.end method


# virtual methods
.method protected readCacheDataFromFile(Ljava/io/File;)Ljava/lang/Object;
    .registers 10
    .param p1, "file"    # Ljava/io/File;
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

    .prologue
    .line 95
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister<TT;>;"
    const/4 v2, 0x0

    .line 97
    .local v2, "fileInputStream":Ljava/io/InputStream;
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_6} :catch_1e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_4a
    .catchall {:try_start_1 .. :try_end_6} :catchall_51

    .line 98
    .end local v2    # "fileInputStream":Ljava/io/InputStream;
    .local v3, "fileInputStream":Ljava/io/InputStream;
    :try_start_6
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 99
    .local v0, "body":[B
    new-instance v4, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;

    invoke-direct {v4, p0, v0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$2;-><init>(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;[B)V

    .line 116
    .local v4, "typedInput":Lretrofit/mime/TypedInput;
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->converter:Lretrofit/converter/Converter;

    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->getHandledClass()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v5, v4, v6}, Lretrofit/converter/Converter;->fromBody(Lretrofit/mime/TypedInput;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_18} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_18} :catch_59
    .catchall {:try_start_6 .. :try_end_18} :catchall_56

    move-result-object v5

    .line 125
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    move-object v2, v3

    .end local v0    # "body":[B
    .end local v3    # "fileInputStream":Ljava/io/InputStream;
    .end local v4    # "typedInput":Lretrofit/mime/TypedInput;
    .restart local v2    # "fileInputStream":Ljava/io/InputStream;
    :goto_1d
    return-object v5

    .line 117
    :catch_1e
    move-exception v1

    .line 120
    .local v1, "e":Ljava/io/FileNotFoundException;
    :goto_1f
    :try_start_1f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " does not exists"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-static {v5, v6}, Lroboguice/util/temp/Ln;->w(Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_45
    .catchall {:try_start_1f .. :try_end_45} :catchall_51

    .line 121
    const/4 v5, 0x0

    .line 125
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_1d

    .line 122
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_4a
    move-exception v1

    .line 123
    .local v1, "e":Ljava/lang/Exception;
    :goto_4b
    :try_start_4b
    new-instance v5, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;

    invoke-direct {v5, v1}, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_51
    .catchall {:try_start_4b .. :try_end_51} :catchall_51

    .line 125
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_51
    move-exception v5

    :goto_52
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v5

    .end local v2    # "fileInputStream":Ljava/io/InputStream;
    .restart local v3    # "fileInputStream":Ljava/io/InputStream;
    :catchall_56
    move-exception v5

    move-object v2, v3

    .end local v3    # "fileInputStream":Ljava/io/InputStream;
    .restart local v2    # "fileInputStream":Ljava/io/InputStream;
    goto :goto_52

    .line 122
    .end local v2    # "fileInputStream":Ljava/io/InputStream;
    .restart local v3    # "fileInputStream":Ljava/io/InputStream;
    :catch_59
    move-exception v1

    move-object v2, v3

    .end local v3    # "fileInputStream":Ljava/io/InputStream;
    .restart local v2    # "fileInputStream":Ljava/io/InputStream;
    goto :goto_4b

    .line 117
    .end local v2    # "fileInputStream":Ljava/io/InputStream;
    .restart local v3    # "fileInputStream":Ljava/io/InputStream;
    :catch_5c
    move-exception v1

    move-object v2, v3

    .end local v3    # "fileInputStream":Ljava/io/InputStream;
    .restart local v2    # "fileInputStream":Ljava/io/InputStream;
    goto :goto_1f
.end method

.method public saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
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
    .line 53
    .local p0, "this":Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;, "Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-virtual {p0}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->isAsyncSaveEnabled()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 54
    new-instance v1, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister$1;-><init>(Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .local v1, "t":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 75
    .end local v1    # "t":Ljava/lang/Thread;
    :goto_e
    return-object p1

    .line 68
    :cond_f
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister;->saveData(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_12
    .catch Lcom/octo/android/robospice/persistence/exception/CacheSavingException; {:try_start_0 .. :try_end_12} :catch_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_15

    goto :goto_e

    .line 70
    :catch_13
    move-exception v0

    .line 71
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
    throw v0

    .line 72
    .end local v0    # "e":Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
    :catch_15
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    invoke-direct {v2, v0}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
