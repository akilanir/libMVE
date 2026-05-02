.class public Lcom/danikula/videocache/file/FileCache;
.super Ljava/lang/Object;
.source "FileCache.java"

# interfaces
.implements Lcom/danikula/videocache/Cache;


# static fields
.field private static final TEMP_POSTFIX:Ljava/lang/String; = ".download"


# instance fields
.field private dataFile:Ljava/io/RandomAccessFile;

.field private final diskUsage:Lcom/danikula/videocache/file/DiskUsage;

.field public file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 24
    new-instance v0, Lcom/danikula/videocache/file/UnlimitedDiskUsage;

    invoke-direct {v0}, Lcom/danikula/videocache/file/UnlimitedDiskUsage;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/danikula/videocache/file/FileCache;-><init>(Ljava/io/File;Lcom/danikula/videocache/file/DiskUsage;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/danikula/videocache/file/DiskUsage;)V
    .registers 10
    .param p1, "file"    # Ljava/io/File;
    .param p2, "diskUsage"    # Lcom/danikula/videocache/file/DiskUsage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-nez p2, :cond_2b

    .line 30
    :try_start_5
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_b} :catch_b

    .line 38
    :catch_b
    move-exception v2

    .line 39
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error using file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " as disc cache"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 32
    .end local v2    # "e":Ljava/io/IOException;
    :cond_2b
    :try_start_2b
    iput-object p2, p0, Lcom/danikula/videocache/file/FileCache;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    .line 33
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 34
    .local v1, "directory":Ljava/io/File;
    invoke-static {v1}, Lcom/danikula/videocache/file/Files;->makeDir(Ljava/io/File;)V

    .line 35
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    .line 36
    .local v0, "completed":Z
    if-eqz v0, :cond_4b

    move-object v3, p1

    :goto_3b
    iput-object v3, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    .line 37
    new-instance v4, Ljava/io/RandomAccessFile;

    iget-object v5, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    if-eqz v0, :cond_6c

    const-string v3, "r"

    :goto_45
    invoke-direct {v4, v5, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    .line 41
    return-void

    .line 36
    :cond_4b
    new-instance v3, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".download"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_3b

    .line 37
    :cond_6c
    const-string v3, "rw"
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_6e} :catch_b

    goto :goto_45
.end method

.method private isTempFile(Ljava/io/File;)Z
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 123
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".download"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public declared-synchronized append([BI)V
    .registers 9
    .param p1, "data"    # [B
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 66
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/danikula/videocache/file/FileCache;->isCompleted()Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 67
    new-instance v2, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error append cache: cache file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is completed!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_28} :catch_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_4c

    .line 71
    :catch_28
    move-exception v0

    .line 72
    .local v0, "e":Ljava/io/IOException;
    :try_start_29
    const-string v1, "Error writing %d bytes to %s from buffer with size %d"

    .line 73
    .local v1, "format":Ljava/lang/String;
    new-instance v2, Lcom/danikula/videocache/ProxyCacheException;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    array-length v5, p1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_4c
    .catchall {:try_start_29 .. :try_end_4c} :catchall_4c

    .line 66
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "format":Ljava/lang/String;
    :catchall_4c
    move-exception v2

    monitor-exit p0

    throw v2

    .line 69
    :cond_4f
    :try_start_4f
    iget-object v2, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {p0}, Lcom/danikula/videocache/file/FileCache;->available()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 70
    iget-object v2, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, p2}, Ljava/io/RandomAccessFile;->write([BII)V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_5f} :catch_28
    .catchall {:try_start_4f .. :try_end_5f} :catchall_4c

    .line 75
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized available()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 46
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_a
    .catchall {:try_start_1 .. :try_end_6} :catchall_26

    move-result-wide v1

    long-to-int v1, v1

    monitor-exit p0

    return v1

    .line 47
    :catch_a
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/IOException;
    :try_start_b
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading length of file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_26
    .catchall {:try_start_b .. :try_end_26} :catchall_26

    .line 46
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_26
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 80
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    .line 81
    iget-object v1, p0, Lcom/danikula/videocache/file/FileCache;->diskUsage:Lcom/danikula/videocache/file/DiskUsage;

    iget-object v2, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-interface {v1, v2}, Lcom/danikula/videocache/file/DiskUsage;->touch(Ljava/io/File;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_d} :catch_f
    .catchall {:try_start_1 .. :try_end_d} :catchall_2b

    .line 85
    monitor-exit p0

    return-void

    .line 82
    :catch_f
    move-exception v0

    .line 83
    .local v0, "e":Ljava/io/IOException;
    :try_start_10
    new-instance v1, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error closing file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_2b
    .catchall {:try_start_10 .. :try_end_2b} :catchall_2b

    .line 80
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_2b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized complete()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 89
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/danikula/videocache/file/FileCache;->isCompleted()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_66

    move-result v4

    if-eqz v4, :cond_9

    .line 106
    :goto_7
    monitor-exit p0

    return-void

    .line 93
    :cond_9
    :try_start_9
    invoke-virtual {p0}, Lcom/danikula/videocache/file/FileCache;->close()V

    .line 94
    iget-object v4, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const-string v7, ".download"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    iget-object v4, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-direct {v0, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 96
    .local v0, "completedFile":Ljava/io/File;
    iget-object v4, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v4, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    .line 97
    .local v3, "renamed":Z
    if-nez v3, :cond_69

    .line 98
    new-instance v4, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error renaming file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for completion!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_66
    .catchall {:try_start_9 .. :try_end_66} :catchall_66

    .line 89
    .end local v0    # "completedFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "renamed":Z
    :catchall_66
    move-exception v4

    monitor-exit p0

    throw v4

    .line 100
    .restart local v0    # "completedFile":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "renamed":Z
    :cond_69
    :try_start_69
    iput-object v0, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;
    :try_end_6b
    .catchall {:try_start_69 .. :try_end_6b} :catchall_66

    .line 102
    :try_start_6b
    new-instance v4, Ljava/io/RandomAccessFile;

    iget-object v5, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    const-string v6, "r"

    invoke-direct {v4, v5, v6}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_76} :catch_77
    .catchall {:try_start_6b .. :try_end_76} :catchall_66

    goto :goto_7

    .line 103
    :catch_77
    move-exception v1

    .line 104
    .local v1, "e":Ljava/io/IOException;
    :try_start_78
    new-instance v4, Lcom/danikula/videocache/ProxyCacheException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error opening "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " as disc cache"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_99
    .catchall {:try_start_78 .. :try_end_99} :catchall_66
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    return-object v0
.end method

.method public declared-synchronized isCompleted()Z
    .registers 2

    .prologue
    .line 110
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/danikula/videocache/file/FileCache;->file:Ljava/io/File;

    invoke-direct {p0, v0}, Lcom/danikula/videocache/file/FileCache;->isTempFile(Ljava/io/File;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_e

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_a
    monitor-exit p0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([BJI)I
    .registers 11
    .param p1, "buffer"    # [B
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/danikula/videocache/ProxyCacheException;
        }
    .end annotation

    .prologue
    .line 55
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, p2, p3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 56
    iget-object v2, p0, Lcom/danikula/videocache/file/FileCache;->dataFile:Ljava/io/RandomAccessFile;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, p4}, Ljava/io/RandomAccessFile;->read([BII)I
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_c} :catch_f
    .catchall {:try_start_1 .. :try_end_c} :catchall_40

    move-result v2

    monitor-exit p0

    return v2

    .line 57
    :catch_f
    move-exception v0

    .line 58
    .local v0, "e":Ljava/io/IOException;
    :try_start_10
    const-string v1, "Error reading %d bytes with offset %d from file[%d bytes] to buffer[%d bytes]"

    .line 59
    .local v1, "format":Ljava/lang/String;
    new-instance v2, Lcom/danikula/videocache/ProxyCacheException;

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-virtual {p0}, Lcom/danikula/videocache/file/FileCache;->available()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    array-length v5, p1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/danikula/videocache/ProxyCacheException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_40
    .catchall {:try_start_10 .. :try_end_40} :catchall_40

    .line 55
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "format":Ljava/lang/String;
    :catchall_40
    move-exception v2

    monitor-exit p0

    throw v2
.end method
