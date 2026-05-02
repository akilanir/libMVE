.class public final Lcom/google/android/exoplayer/SingleSampleSource;
.super Ljava/lang/Object;
.source "SingleSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;


# static fields
.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT:I = 0x3

.field private static final INITIAL_SAMPLE_SIZE:I = 0x1

.field private static final STATE_END_OF_STREAM:I = 0x2

.field private static final STATE_SEND_FORMAT:I = 0x0

.field private static final STATE_SEND_SAMPLE:I = 0x1


# instance fields
.field private currentLoadableException:Ljava/io/IOException;

.field private currentLoadableExceptionCount:I

.field private currentLoadableExceptionTimestamp:J

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final format:Lcom/google/android/exoplayer/MediaFormat;

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private loadingFinished:Z

.field private final minLoadableRetryCount:I

.field private pendingDiscontinuityPositionUs:J

.field private sampleData:[B

.field private sampleSize:I

.field private state:I

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/MediaFormat;)V
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "format"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 68
    const/4 v0, 0x3

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/exoplayer/SingleSampleSource;-><init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/MediaFormat;I)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/MediaFormat;I)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "format"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p4, "minLoadableRetryCount"    # I

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->uri:Landroid/net/Uri;

    .line 74
    iput-object p2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 75
    iput-object p3, p0, Lcom/google/android/exoplayer/SingleSampleSource;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 76
    iput p4, p0, Lcom/google/android/exoplayer/SingleSampleSource;->minLoadableRetryCount:I

    .line 77
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    .line 78
    return-void
.end method

.method private clearCurrentLoadableException()V
    .registers 2

    .prologue
    .line 199
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 200
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionCount:I

    .line 201
    return-void
.end method

.method private getRetryDelayMillis(J)J
    .registers 7
    .param p1, "errorCount"    # J

    .prologue
    .line 204
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private maybeStartLoading()V
    .registers 7

    .prologue
    .line 185
    iget-boolean v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loadingFinished:Z

    if-nez v2, :cond_11

    iget v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_11

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 196
    :cond_11
    :goto_11
    return-void

    .line 188
    :cond_12
    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v2, :cond_2c

    .line 189
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionTimestamp:J

    sub-long v0, v2, v4

    .line 190
    .local v0, "elapsedMillis":J
    iget v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionCount:I

    int-to-long v2, v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/SingleSampleSource;->getRetryDelayMillis(J)J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_11

    .line 193
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 195
    .end local v0    # "elapsedMillis":J
    :cond_2c
    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v2, p0, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_11
.end method


# virtual methods
.method public cancelLoad()V
    .registers 1

    .prologue
    .line 233
    return-void
.end method

.method public continueBuffering(IJ)Z
    .registers 5
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/google/android/exoplayer/SingleSampleSource;->maybeStartLoading()V

    .line 114
    iget-boolean v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loadingFinished:Z

    return v0
.end method

.method public disable(I)V
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 171
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    .line 172
    return-void
.end method

.method public enable(IJ)V
    .registers 6
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    .line 105
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    .line 106
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->pendingDiscontinuityPositionUs:J

    .line 107
    invoke-direct {p0}, Lcom/google/android/exoplayer/SingleSampleSource;->clearCurrentLoadableException()V

    .line 108
    invoke-direct {p0}, Lcom/google/android/exoplayer/SingleSampleSource;->maybeStartLoading()V

    .line 109
    return-void
.end method

.method public getBufferedPositionUs()J
    .registers 3

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loadingFinished:Z

    if-eqz v0, :cond_7

    const-wide/16 v0, -0x3

    :goto_6
    return-wide v0

    :cond_7
    const-wide/16 v0, 0x0

    goto :goto_6
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->format:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method public isLoadCanceled()Z
    .registers 2

    .prologue
    .line 237
    const/4 v0, 0x0

    return v0
.end method

.method public load()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 243
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    .line 246
    :try_start_3
    iget-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v3, p0, Lcom/google/android/exoplayer/SingleSampleSource;->uri:Landroid/net/Uri;

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;)V

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    .line 248
    const/4 v0, 0x0

    .line 249
    .local v0, "result":I
    :goto_10
    const/4 v1, -0x1

    if-eq v0, v1, :cond_3d

    .line 250
    iget v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    .line 251
    iget v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    array-length v2, v2

    if-ne v1, v2, :cond_2c

    .line 252
    iget-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    .line 254
    :cond_2c
    iget-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    iget v3, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    iget-object v4, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    array-length v4, v4

    iget v5, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    sub-int/2addr v4, v5

    invoke-interface {v1, v2, v3, v4}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_43

    move-result v0

    goto :goto_10

    .line 257
    :cond_3d
    iget-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 259
    return-void

    .line 257
    .end local v0    # "result":I
    :catchall_43
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v1
.end method

.method public maybeThrowError()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionCount:I

    iget v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->minLoadableRetryCount:I

    if-le v0, v1, :cond_d

    .line 120
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v0

    .line 122
    :cond_d
    return-void
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 218
    return-void
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 3
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loadingFinished:Z

    .line 212
    invoke-direct {p0}, Lcom/google/android/exoplayer/SingleSampleSource;->clearCurrentLoadableException()V

    .line 213
    return-void
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .registers 5
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 222
    iput-object p2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 223
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionCount:I

    .line 224
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->currentLoadableExceptionTimestamp:J

    .line 225
    invoke-direct {p0}, Lcom/google/android/exoplayer/SingleSampleSource;->maybeStartLoading()V

    .line 226
    return-void
.end method

.method public prepare(J)Z
    .registers 6
    .param p1, "positionUs"    # J

    .prologue
    .line 87
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-nez v0, :cond_22

    .line 88
    new-instance v0, Lcom/google/android/exoplayer/upstream/Loader;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Loader:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v2, v2, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 90
    :cond_22
    const/4 v0, 0x1

    return v0
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I
    .registers 12
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v5, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 134
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    if-ne v0, v5, :cond_9

    .line 135
    const/4 v0, -0x1

    .line 152
    :goto_8
    return v0

    .line 136
    :cond_9
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    if-nez v0, :cond_15

    .line 137
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->format:Lcom/google/android/exoplayer/MediaFormat;

    iput-object v0, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 138
    iput v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    .line 139
    const/4 v0, -0x4

    goto :goto_8

    .line 142
    :cond_15
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    if-ne v0, v1, :cond_23

    move v0, v1

    :goto_1a
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 143
    iget-boolean v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loadingFinished:Z

    if-nez v0, :cond_25

    .line 144
    const/4 v0, -0x2

    goto :goto_8

    :cond_23
    move v0, v2

    .line 142
    goto :goto_1a

    .line 146
    :cond_25
    const-wide/16 v3, 0x0

    iput-wide v3, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 147
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    iput v0, p5, Lcom/google/android/exoplayer/SampleHolder;->size:I

    .line 148
    iput v1, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 149
    iget v0, p5, Lcom/google/android/exoplayer/SampleHolder;->size:I

    invoke-virtual {p5, v0}, Lcom/google/android/exoplayer/SampleHolder;->ensureSpaceForWrite(I)V

    .line 150
    iget-object v0, p5, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleData:[B

    iget v3, p0, Lcom/google/android/exoplayer/SingleSampleSource;->sampleSize:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 151
    iput v5, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    .line 152
    const/4 v0, -0x3

    goto :goto_8
.end method

.method public readDiscontinuity(I)J
    .registers 6
    .param p1, "track"    # I

    .prologue
    .line 126
    iget-wide v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->pendingDiscontinuityPositionUs:J

    .line 127
    .local v0, "discontinuityPositionUs":J
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/google/android/exoplayer/SingleSampleSource;->pendingDiscontinuityPositionUs:J

    .line 128
    return-wide v0
.end method

.method public register()Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .registers 1

    .prologue
    .line 82
    return-object p0
.end method

.method public release()V
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_c

    .line 177
    iget-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 178
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 180
    :cond_c
    return-void
.end method

.method public seekToUs(J)V
    .registers 5
    .param p1, "positionUs"    # J

    .prologue
    .line 158
    iget v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_a

    .line 159
    iput-wide p1, p0, Lcom/google/android/exoplayer/SingleSampleSource;->pendingDiscontinuityPositionUs:J

    .line 160
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/SingleSampleSource;->state:I

    .line 162
    :cond_a
    return-void
.end method
