.class public final Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;
.super Ljava/lang/Object;
.source "CacheDataSink.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;
    }
.end annotation


# instance fields
.field private final cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

.field private dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

.field private dataSpecBytesWritten:J

.field private file:Ljava/io/File;

.field private final maxCacheFileSize:J

.field private outputStream:Ljava/io/FileOutputStream;

.field private outputStreamBytesWritten:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/cache/Cache;J)V
    .registers 5
    .param p1, "cache"    # Lcom/google/android/exoplayer/upstream/cache/Cache;
    .param p2, "maxCacheFileSize"    # J

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/cache/Cache;

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    .line 63
    iput-wide p2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    .line 64
    return-void
.end method

.method private closeCurrentOutputStream()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 119
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    if-nez v1, :cond_6

    .line 138
    :goto_5
    return-void

    .line 123
    :cond_6
    const/4 v0, 0x0

    .line 125
    .local v0, "success":Z
    :try_start_7
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 126
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_15
    .catchall {:try_start_7 .. :try_end_15} :catchall_2f

    .line 127
    const/4 v0, 0x1

    .line 129
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    invoke-static {v1}, Lcom/google/android/exoplayer/util/Util;->closeQuietly(Ljava/io/OutputStream;)V

    .line 130
    if-eqz v0, :cond_29

    .line 131
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/upstream/cache/Cache;->commitFile(Ljava/io/File;)V

    .line 135
    :goto_24
    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    .line 136
    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    goto :goto_5

    .line 133
    :cond_29
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_24

    .line 129
    :catchall_2f
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->closeQuietly(Ljava/io/OutputStream;)V

    .line 130
    if-eqz v0, :cond_43

    .line 131
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-interface {v2, v3}, Lcom/google/android/exoplayer/upstream/cache/Cache;->commitFile(Ljava/io/File;)V

    .line 135
    :goto_3e
    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    .line 136
    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    throw v1

    .line 133
    :cond_43
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_3e
.end method

.method private openNextOutputStream()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v1, v1, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v2, v2, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    add-long/2addr v2, v4

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    iget-wide v6, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    sub-long/2addr v4, v6

    iget-wide v6, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/google/android/exoplayer/upstream/cache/Cache;->startFile(Ljava/lang/String;JJ)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    .line 114
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    .line 115
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    .line 116
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 105
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->closeCurrentOutputStream()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 109
    return-void

    .line 106
    :catch_4
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)Lcom/google/android/exoplayer/upstream/DataSink;
    .registers 7
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 70
    iget-wide v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_16

    const/4 v1, 0x1

    :goto_9
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 72
    :try_start_c
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 73
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    .line 74
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->openNextOutputStream()V
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_15} :catch_18

    .line 75
    return-object p0

    .line 70
    :cond_16
    const/4 v1, 0x0

    goto :goto_9

    .line 76
    :catch_18
    move-exception v0

    .line 77
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v1, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public write([BII)V
    .registers 13
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 85
    .local v1, "bytesWritten":I
    :goto_1
    if-ge v1, p3, :cond_3a

    .line 86
    :try_start_3
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    iget-wide v5, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_11

    .line 87
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->closeCurrentOutputStream()V

    .line 88
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->openNextOutputStream()V

    .line 90
    :cond_11
    sub-int v3, p3, v1

    int-to-long v3, v3

    iget-wide v5, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->maxCacheFileSize:J

    iget-wide v7, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    sub-long/2addr v5, v7

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v0, v3

    .line 92
    .local v0, "bytesToWrite":I
    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStream:Ljava/io/FileOutputStream;

    add-int v4, p2, v1

    invoke-virtual {v3, p1, v4, v0}, Ljava/io/FileOutputStream;->write([BII)V

    .line 93
    add-int/2addr v1, v0

    .line 94
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->outputStreamBytesWritten:J

    .line 95
    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;->dataSpecBytesWritten:J
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_32} :catch_33

    goto :goto_1

    .line 97
    .end local v0    # "bytesToWrite":I
    :catch_33
    move-exception v2

    .line 98
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;

    invoke-direct {v3, v2}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;-><init>(Ljava/io/IOException;)V

    throw v3

    .line 100
    .end local v2    # "e":Ljava/io/IOException;
    :cond_3a
    return-void
.end method
