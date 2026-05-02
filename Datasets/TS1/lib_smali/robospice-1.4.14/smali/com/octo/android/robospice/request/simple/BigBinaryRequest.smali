.class public Lcom/octo/android/robospice/request/simple/BigBinaryRequest;
.super Lcom/octo/android/robospice/request/simple/BinaryRequest;
.source "BigBinaryRequest.java"


# instance fields
.field protected cacheFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "cacheFile"    # Ljava/io/File;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/request/simple/BinaryRequest;-><init>(Ljava/lang/String;)V

    .line 36
    iput-object p2, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    .line 37
    return-void
.end method


# virtual methods
.method public getCacheFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    return-object v0
.end method

.method public processStream(ILjava/io/InputStream;)Ljava/io/InputStream;
    .registers 10
    .param p1, "contentLength"    # I
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    const/4 v0, 0x0

    .line 44
    .local v0, "fileOutputStream":Ljava/io/OutputStream;
    :try_start_1
    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/io/File;->setLastModified(J)Z

    move-result v2

    .line 45
    .local v2, "isTouchedNow":Z
    if-nez v2, :cond_1e

    .line 46
    const-string v3, "Modification time of file %s could not be changed normally "

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 48
    :cond_1e
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_39

    .line 49
    .end local v0    # "fileOutputStream":Ljava/io/OutputStream;
    .local v1, "fileOutputStream":Ljava/io/OutputStream;
    :try_start_25
    new-instance v3, Lcom/octo/android/robospice/request/ProgressByteProcessor;

    int-to-long v4, p1

    invoke-direct {v3, p0, v1, v4, v5}, Lcom/octo/android/robospice/request/ProgressByteProcessor;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/io/OutputStream;J)V

    invoke-virtual {p0, p2, v3}, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->readBytes(Ljava/io/InputStream;Lcom/octo/android/robospice/request/ProgressByteProcessor;)V

    .line 50
    new-instance v3, Ljava/io/FileInputStream;

    iget-object v4, p0, Lcom/octo/android/robospice/request/simple/BigBinaryRequest;->cacheFile:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_35
    .catchall {:try_start_25 .. :try_end_35} :catchall_3e

    .line 52
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    return-object v3

    .end local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .end local v2    # "isTouchedNow":Z
    .restart local v0    # "fileOutputStream":Ljava/io/OutputStream;
    :catchall_39
    move-exception v3

    :goto_3a
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v3

    .end local v0    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v2    # "isTouchedNow":Z
    :catchall_3e
    move-exception v3

    move-object v0, v1

    .end local v1    # "fileOutputStream":Ljava/io/OutputStream;
    .restart local v0    # "fileOutputStream":Ljava/io/OutputStream;
    goto :goto_3a
.end method
