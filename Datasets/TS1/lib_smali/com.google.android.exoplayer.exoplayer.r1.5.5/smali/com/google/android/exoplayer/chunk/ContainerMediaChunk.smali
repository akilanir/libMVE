.class public Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;
.super Lcom/google/android/exoplayer/chunk/BaseMediaChunk;
.source "ContainerMediaChunk.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper$SingleTrackOutput;


# instance fields
.field private final adaptiveMaxHeight:I

.field private final adaptiveMaxWidth:I

.field private volatile bytesLoaded:I

.field private drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private final extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

.field private volatile loadCanceled:Z

.field private mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field private final sampleOffsetUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIJLcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;Lcom/google/android/exoplayer/MediaFormat;IILcom/google/android/exoplayer/drm/DrmInitData;ZI)V
    .registers 36
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "trigger"    # I
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I
    .param p10, "sampleOffsetUs"    # J
    .param p12, "extractorWrapper"    # Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;
    .param p13, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p14, "adaptiveMaxWidth"    # I
    .param p15, "adaptiveMaxHeight"    # I
    .param p16, "drmInitData"    # Lcom/google/android/exoplayer/drm/DrmInitData;
    .param p17, "isMediaFormatFinal"    # Z
    .param p18, "parentId"    # I

    .prologue
    .line 76
    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move/from16 v8, p3

    move-object/from16 v9, p4

    move-wide/from16 v10, p5

    move-wide/from16 v12, p7

    move/from16 v14, p9

    move/from16 v15, p17

    move/from16 v16, p18

    invoke-direct/range {v5 .. v16}, Lcom/google/android/exoplayer/chunk/BaseMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIZI)V

    .line 78
    move-object/from16 v0, p12

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    .line 79
    move-wide/from16 v0, p10

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    .line 80
    move/from16 v0, p14

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->adaptiveMaxWidth:I

    .line 81
    move/from16 v0, p15

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->adaptiveMaxHeight:I

    .line 82
    move-object/from16 v0, p13

    move-wide/from16 v1, p10

    move/from16 v3, p14

    move/from16 v4, p15

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getAdjustedMediaFormat(Lcom/google/android/exoplayer/MediaFormat;JII)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 84
    move-object/from16 v0, p16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 85
    return-void
.end method

.method private static getAdjustedMediaFormat(Lcom/google/android/exoplayer/MediaFormat;JII)Lcom/google/android/exoplayer/MediaFormat;
    .registers 10
    .param p0, "format"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p1, "sampleOffsetUs"    # J
    .param p3, "adaptiveMaxWidth"    # I
    .param p4, "adaptiveMaxHeight"    # I

    .prologue
    const/4 v4, -0x1

    .line 179
    if-nez p0, :cond_5

    .line 180
    const/4 p0, 0x0

    .line 188
    .end local p0    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_4
    :goto_4
    return-object p0

    .line 182
    .restart local p0    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_5
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_1d

    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1d

    .line 183
    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaFormat;->subsampleOffsetUs:J

    add-long/2addr v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->copyWithSubsampleOffsetUs(J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object p0

    .line 185
    :cond_1d
    if-ne p3, v4, :cond_21

    if-eq p4, v4, :cond_4

    .line 186
    :cond_21
    invoke-virtual {p0, p3, p4}, Lcom/google/android/exoplayer/MediaFormat;->copyWithMaxVideoDimensions(II)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object p0

    goto :goto_4
.end method


# virtual methods
.method public final bytesLoaded()J
    .registers 3

    .prologue
    .line 89
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public final cancelLoad()V
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->loadCanceled:Z

    .line 142
    return-void
.end method

.method public final drmInitData(Lcom/google/android/exoplayer/drm/DrmInitData;)V
    .registers 2
    .param p1, "drmInitData"    # Lcom/google/android/exoplayer/drm/DrmInitData;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 112
    return-void
.end method

.method public final format(Lcom/google/android/exoplayer/MediaFormat;)V
    .registers 6
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 116
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    iget v2, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->adaptiveMaxWidth:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->adaptiveMaxHeight:I

    invoke-static {p1, v0, v1, v2, v3}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getAdjustedMediaFormat(Lcom/google/android/exoplayer/MediaFormat;JII)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 118
    return-void
.end method

.method public final getDrmInitData()Lcom/google/android/exoplayer/drm/DrmInitData;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    return-object v0
.end method

.method public final getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public final isLoadCanceled()Z
    .registers 2

    .prologue
    .line 146
    iget-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->loadCanceled:Z

    return v0
.end method

.method public final load()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->bytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer/upstream/DataSpec;I)Lcom/google/android/exoplayer/upstream/DataSpec;

    move-result-object v6

    .line 155
    .local v6, "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :try_start_8
    new-instance v0, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-wide v2, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v4, v6}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;JJ)V

    .line 157
    .local v0, "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    iget v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->bytesLoaded:I

    if-nez v1, :cond_20

    .line 159
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    invoke-virtual {v1, p0}, Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;->init(Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper$SingleTrackOutput;)V
    :try_end_20
    .catchall {:try_start_8 .. :try_end_20} :catchall_4e

    .line 163
    :cond_20
    const/4 v7, 0x0

    .line 164
    .local v7, "result":I
    :goto_21
    if-nez v7, :cond_2e

    :try_start_23
    iget-boolean v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->loadCanceled:Z

    if-nez v1, :cond_2e

    .line 165
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractorWrapper:Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/chunk/ChunkExtractorWrapper;->read(Lcom/google/android/exoplayer/extractor/ExtractorInput;)I
    :try_end_2c
    .catchall {:try_start_23 .. :try_end_2c} :catchall_40

    move-result v7

    goto :goto_21

    .line 168
    :cond_2e
    :try_start_2e
    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v3, v3, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v1, v3

    long-to-int v1, v1

    iput v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->bytesLoaded:I
    :try_end_3a
    .catchall {:try_start_2e .. :try_end_3a} :catchall_4e

    .line 171
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 173
    return-void

    .line 168
    :catchall_40
    move-exception v1

    :try_start_41
    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->bytesLoaded:I

    throw v1
    :try_end_4e
    .catchall {:try_start_41 .. :try_end_4e} :catchall_4e

    .line 171
    .end local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .end local v7    # "result":I
    :catchall_4e
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v1
.end method

.method public final sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I
    .registers 5
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "length"    # I
    .param p3, "allowEndOfInput"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getOutput()Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v0

    return v0
.end method

.method public final sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V
    .registers 4
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getOutput()Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 129
    return-void
.end method

.method public final sampleMetadata(JIII[B)V
    .registers 14
    .param p1, "timeUs"    # J
    .param p3, "flags"    # I
    .param p4, "size"    # I
    .param p5, "offset"    # I
    .param p6, "encryptionKey"    # [B

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getOutput()Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    add-long/2addr v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/DefaultTrackOutput;->sampleMetadata(JIII[B)V

    .line 135
    return-void
.end method

.method public final seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V
    .registers 2
    .param p1, "seekMap"    # Lcom/google/android/exoplayer/extractor/SeekMap;

    .prologue
    .line 107
    return-void
.end method
