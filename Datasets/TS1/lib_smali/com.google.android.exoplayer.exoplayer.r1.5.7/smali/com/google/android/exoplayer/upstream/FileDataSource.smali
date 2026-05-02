.class public final Lcom/google/android/exoplayer/upstream/FileDataSource;
.super Ljava/lang/Object;
.source "FileDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/UriDataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
    }
.end annotation


# instance fields
.field private bytesRemaining:J

.field private file:Ljava/io/RandomAccessFile;

.field private final listener:Lcom/google/android/exoplayer/upstream/TransferListener;

.field private opened:Z

.field private uriString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    .line 61
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 116
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->uriString:Ljava/lang/String;

    .line 117
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_1e

    .line 119
    :try_start_8
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_1f
    .catchall {:try_start_8 .. :try_end_d} :catchall_26

    .line 123
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 124
    iget-boolean v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    if-eqz v1, :cond_1e

    .line 125
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 126
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_1e

    .line 127
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    .line 132
    :cond_1e
    return-void

    .line 120
    :catch_1f
    move-exception v0

    .line 121
    .local v0, "e":Ljava/io/IOException;
    :try_start_20
    new-instance v1, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1
    :try_end_26
    .catchall {:try_start_20 .. :try_end_26} :catchall_26

    .line 123
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_26
    move-exception v1

    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 124
    iget-boolean v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    if-eqz v2, :cond_38

    .line 125
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 126
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v2, :cond_38

    .line 127
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    :cond_38
    throw v1
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->uriString:Ljava/lang/String;

    return-object v0
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .registers 7
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 66
    :try_start_0
    iget-object v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->uriString:Ljava/lang/String;

    .line 67
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 68
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 69
    iget-wide v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_46

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    iget-wide v3, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    sub-long/2addr v1, v3

    :goto_2f
    iput-wide v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    .line 71
    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_49

    .line 72
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3f} :catch_3f

    .line 74
    :catch_3f
    move-exception v0

    .line 75
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1

    .line 69
    .end local v0    # "e":Ljava/io/IOException;
    :cond_46
    :try_start_46
    iget-wide v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_48} :catch_3f

    goto :goto_2f

    .line 78
    :cond_49
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 79
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_55

    .line 80
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferStart()V

    .line 83
    :cond_55
    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    return-wide v1
.end method

.method public read([BII)I
    .registers 11
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 88
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_a

    .line 89
    const/4 v0, -0x1

    .line 105
    :cond_9
    :goto_9
    return v0

    .line 91
    :cond_a
    const/4 v0, 0x0

    .line 93
    .local v0, "bytesRead":I
    :try_start_b
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v3, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    int-to-long v5, p3

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v2, p1, p2, v3}, Ljava/io/RandomAccessFile;->read([BII)I
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_18} :catch_2b

    move-result v0

    .line 98
    if-lez v0, :cond_9

    .line 99
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    .line 100
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v2, :cond_9

    .line 101
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    goto :goto_9

    .line 94
    :catch_2b
    move-exception v1

    .line 95
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v2, v1}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method
