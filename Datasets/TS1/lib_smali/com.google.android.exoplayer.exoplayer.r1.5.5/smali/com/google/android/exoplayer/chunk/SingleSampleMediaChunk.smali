.class public final Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;
.super Lcom/google/android/exoplayer/chunk/BaseMediaChunk;
.source "SingleSampleMediaChunk.java"


# instance fields
.field private volatile bytesLoaded:I

.field private volatile loadCanceled:Z

.field private final sampleDrmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private final sampleFormat:Lcom/google/android/exoplayer/MediaFormat;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJILcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/drm/DrmInitData;I)V
    .registers 26
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "trigger"    # I
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I
    .param p10, "sampleFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p11, "sampleDrmInitData"    # Lcom/google/android/exoplayer/drm/DrmInitData;
    .param p12, "parentId"    # I

    .prologue
    .line 54
    const/4 v11, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move/from16 v10, p9

    move/from16 v12, p12

    invoke-direct/range {v1 .. v12}, Lcom/google/android/exoplayer/chunk/BaseMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIZI)V

    .line 56
    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 57
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleDrmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 58
    return-void
.end method


# virtual methods
.method public bytesLoaded()J
    .registers 3

    .prologue
    .line 62
    iget v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public cancelLoad()V
    .registers 2

    .prologue
    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->loadCanceled:Z

    .line 80
    return-void
.end method

.method public getDrmInitData()Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleDrmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object v0
.end method

.method public getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public isLoadCanceled()Z
    .registers 2

    .prologue
    .line 84
    iget-boolean v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->loadCanceled:Z

    return v0
.end method

.method public load()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget v1, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer/upstream/DataSpec;I)Lcom/google/android/exoplayer/upstream/DataSpec;

    move-result-object v7

    .line 93
    .local v7, "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :try_start_8
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0, v7}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    .line 95
    const/4 v8, 0x0

    .line 96
    .local v8, "result":I
    :goto_e
    const/4 v0, -0x1

    if-eq v8, v0, :cond_25

    .line 97
    iget v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    add-int/2addr v0, v8

    iput v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    .line 98
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->getOutput()Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    const v2, 0x7fffffff

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;->sampleData(Lcom/google/android/exoplayer/upstream/DataSource;IZ)I

    move-result v8

    goto :goto_e

    .line 100
    :cond_25
    iget v4, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded:I

    .line 101
    .local v4, "sampleSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->getOutput()Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->startTimeUs:J

    const/4 v3, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;->sampleMetadata(JIII[B)V
    :try_end_33
    .catchall {:try_start_8 .. :try_end_33} :catchall_39

    .line 103
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 105
    return-void

    .line 103
    .end local v4    # "sampleSize":I
    .end local v8    # "result":I
    :catchall_39
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v0
.end method
