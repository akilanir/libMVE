.class public Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;
.super Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;
.source "InFileBitmapObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/file/InFileObjectPersister",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_QUALITY:I = 0x64


# instance fields
.field private compressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private decodingOptions:Landroid/graphics/BitmapFactory$Options;

.field private quality:I


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
    .line 34
    const-class v0, Landroid/graphics/Bitmap;

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;)V

    .line 29
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    .line 31
    const/16 v0, 0x64

    iput v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->quality:I

    .line 35
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
    .line 38
    const-class v0, Landroid/graphics/Bitmap;

    invoke-direct {p0, p1, v0, p2}, Lcom/octo/android/robospice/persistence/file/InFileObjectPersister;-><init>(Landroid/app/Application;Ljava/lang/Class;Ljava/io/File;)V

    .line 29
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    .line 31
    const/16 v0, 0x64

    iput v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->quality:I

    .line 39
    return-void
.end method


# virtual methods
.method public getCompressFormat()Landroid/graphics/Bitmap$CompressFormat;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    return-object v0
.end method

.method public getDecodingOptions()Landroid/graphics/BitmapFactory$Options;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    return-object v0
.end method

.method public getQuality()I
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->quality:I

    return v0
.end method

.method protected readCacheDataFromFile(Ljava/io/File;)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 44
    const/4 v2, 0x0

    .line 46
    .local v2, "is":Ljava/io/FileInputStream;
    :try_start_3
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_c} :catch_2e
    .catchall {:try_start_3 .. :try_end_c} :catchall_45

    .line 47
    .end local v2    # "is":Ljava/io/FileInputStream;
    .local v3, "is":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    :try_start_d
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-static {v3, v4, v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_12} :catch_50
    .catchall {:try_start_d .. :try_end_12} :catchall_4d

    move-result-object v0

    .line 51
    .local v0, "data":Landroid/graphics/Bitmap;
    if-eqz v3, :cond_18

    .line 52
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 55
    :cond_18
    if-nez v0, :cond_4c

    .line 56
    new-instance v4, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;

    const-string v5, "Found the file %s but could not decode bitmap."

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 48
    .end local v0    # "data":Landroid/graphics/Bitmap;
    .end local v3    # "is":Ljava/io/FileInputStream;
    .restart local v2    # "is":Ljava/io/FileInputStream;
    :catch_2e
    move-exception v1

    .line 49
    .local v1, "ex":Ljava/lang/Throwable;
    :goto_2f
    :try_start_2f
    new-instance v4, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;

    const-string v5, "Found the file %s but could not decode bitmap."

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_45
    .catchall {:try_start_2f .. :try_end_45} :catchall_45

    .line 51
    .end local v1    # "ex":Ljava/lang/Throwable;
    :catchall_45
    move-exception v4

    :goto_46
    if-eqz v2, :cond_4b

    .line 52
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    :cond_4b
    throw v4

    .line 58
    .end local v2    # "is":Ljava/io/FileInputStream;
    .restart local v0    # "data":Landroid/graphics/Bitmap;
    .restart local v3    # "is":Ljava/io/FileInputStream;
    :cond_4c
    return-object v0

    .line 51
    .end local v0    # "data":Landroid/graphics/Bitmap;
    :catchall_4d
    move-exception v4

    move-object v2, v3

    .end local v3    # "is":Ljava/io/FileInputStream;
    .restart local v2    # "is":Ljava/io/FileInputStream;
    goto :goto_46

    .line 48
    .end local v2    # "is":Ljava/io/FileInputStream;
    .restart local v3    # "is":Ljava/io/FileInputStream;
    :catch_50
    move-exception v1

    move-object v2, v3

    .end local v3    # "is":Ljava/io/FileInputStream;
    .restart local v2    # "is":Ljava/io/FileInputStream;
    goto :goto_2f
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
    .line 25
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->readCacheDataFromFile(Ljava/io/File;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public saveDataToCacheAndReturnData(Landroid/graphics/Bitmap;Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "data"    # Landroid/graphics/Bitmap;
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;
        }
    .end annotation

    .prologue
    .line 63
    const/4 v3, 0x0

    .line 66
    .local v3, "out":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v0

    .line 67
    .local v0, "cacheFile":Ljava/io/File;
    new-instance v4, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_f} :catch_47
    .catchall {:try_start_1 .. :try_end_f} :catchall_3b

    .line 69
    .end local v3    # "out":Ljava/io/BufferedOutputStream;
    .local v4, "out":Ljava/io/BufferedOutputStream;
    :try_start_f
    iget-object v5, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v6, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->quality:I

    invoke-virtual {p1, v5, v6, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v1

    .line 70
    .local v1, "didCompress":Z
    if-nez v1, :cond_40

    .line 71
    new-instance v5, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    const-string v6, "Could not compress bitmap for path: %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p0, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->getCacheFile(Ljava/lang/Object;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_33} :catch_33
    .catchall {:try_start_f .. :try_end_33} :catchall_44

    .line 75
    .end local v1    # "didCompress":Z
    :catch_33
    move-exception v2

    move-object v3, v4

    .line 76
    .end local v0    # "cacheFile":Ljava/io/File;
    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    .local v2, "e":Ljava/io/IOException;
    .restart local v3    # "out":Ljava/io/BufferedOutputStream;
    :goto_35
    :try_start_35
    new-instance v5, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;

    invoke-direct {v5, v2}, Lcom/octo/android/robospice/persistence/exception/CacheSavingException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_3b
    .catchall {:try_start_35 .. :try_end_3b} :catchall_3b

    .line 78
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_3b
    move-exception v5

    :goto_3c
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v5

    .end local v3    # "out":Ljava/io/BufferedOutputStream;
    .restart local v0    # "cacheFile":Ljava/io/File;
    .restart local v1    # "didCompress":Z
    .restart local v4    # "out":Ljava/io/BufferedOutputStream;
    :cond_40
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    return-object p1

    .end local v1    # "didCompress":Z
    :catchall_44
    move-exception v5

    move-object v3, v4

    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    .restart local v3    # "out":Ljava/io/BufferedOutputStream;
    goto :goto_3c

    .line 75
    .end local v0    # "cacheFile":Ljava/io/File;
    :catch_47
    move-exception v2

    goto :goto_35
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
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->saveDataToCacheAndReturnData(Landroid/graphics/Bitmap;Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public setCompressFormat(Landroid/graphics/Bitmap$CompressFormat;)V
    .registers 2
    .param p1, "compressFormat"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 96
    return-void
.end method

.method public setDecodingOptions(Landroid/graphics/BitmapFactory$Options;)V
    .registers 2
    .param p1, "decodingOptions"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    .line 88
    return-void
.end method

.method public setQuality(I)V
    .registers 2
    .param p1, "quality"    # I

    .prologue
    .line 103
    iput p1, p0, Lcom/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister;->quality:I

    .line 104
    return-void
.end method
