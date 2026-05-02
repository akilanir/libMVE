.class public final Lcom/google/android/exoplayer/hls/TsChunk;
.super Lcom/google/android/exoplayer/chunk/MediaChunk;
.source "TsChunk.java"


# instance fields
.field private bytesLoaded:I

.field public final discontinuitySequenceNumber:I

.field public final extractorWrapper:Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

.field private final isEncrypted:Z

.field private volatile loadCanceled:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJIILcom/google/android/exoplayer/hls/HlsExtractorWrapper;[B[B)V
    .registers 26
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "trigger"    # I
    .param p4, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I
    .param p10, "discontinuitySequenceNumber"    # I
    .param p11, "extractorWrapper"    # Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .param p12, "encryptionKey"    # [B
    .param p13, "encryptionIv"    # [B

    .prologue
    .line 65
    move-object/from16 v0, p12

    move-object/from16 v1, p13

    invoke-static {p1, v0, v1}, Lcom/google/android/exoplayer/hls/TsChunk;->buildDataSource(Lcom/google/android/exoplayer/upstream/DataSource;[B[B)Lcom/google/android/exoplayer/upstream/DataSource;

    move-result-object v3

    move-object v2, p0

    move-object v4, p2

    move v5, p3

    move-object/from16 v6, p4

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    move/from16 v11, p9

    invoke-direct/range {v2 .. v11}, Lcom/google/android/exoplayer/chunk/MediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;JJI)V

    .line 67
    move/from16 v0, p10

    iput v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->discontinuitySequenceNumber:I

    .line 68
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->extractorWrapper:Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .line 70
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    instance-of v2, v2, Lcom/google/android/exoplayer/hls/Aes128DataSource;

    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/TsChunk;->isEncrypted:Z

    .line 71
    return-void
.end method

.method private static buildDataSource(Lcom/google/android/exoplayer/upstream/DataSource;[B[B)Lcom/google/android/exoplayer/upstream/DataSource;
    .registers 4
    .param p0, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p1, "encryptionKey"    # [B
    .param p2, "encryptionIv"    # [B

    .prologue
    .line 133
    if-eqz p1, :cond_4

    if-nez p2, :cond_5

    .line 136
    .end local p0    # "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    :cond_4
    :goto_4
    return-object p0

    .restart local p0    # "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    :cond_5
    new-instance v0, Lcom/google/android/exoplayer/hls/Aes128DataSource;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/exoplayer/hls/Aes128DataSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;[B[B)V

    move-object p0, v0

    goto :goto_4
.end method


# virtual methods
.method public bytesLoaded()J
    .registers 3

    .prologue
    .line 75
    iget v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public cancelLoad()V
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    .line 83
    return-void
.end method

.method public isLoadCanceled()Z
    .registers 2

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

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
    .line 98
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->isEncrypted:Z

    if-eqz v1, :cond_31

    .line 99
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 100
    .local v6, "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    iget v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I

    if-eqz v1, :cond_2f

    const/4 v8, 0x1

    .line 107
    .local v8, "skipLoadedBytes":Z
    :goto_b
    :try_start_b
    new-instance v0, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-wide v2, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v4, v6}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/DefaultExtractorInput;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;JJ)V

    .line 109
    .local v0, "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    if-eqz v8, :cond_21

    .line 110
    iget v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V
    :try_end_21
    .catchall {:try_start_b .. :try_end_21} :catchall_5b

    .line 113
    :cond_21
    const/4 v7, 0x0

    .line 114
    .local v7, "result":I
    :goto_22
    if-nez v7, :cond_3b

    :try_start_24
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    if-nez v1, :cond_3b

    .line 115
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->extractorWrapper:Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->read(Lcom/google/android/exoplayer/extractor/ExtractorInput;)I
    :try_end_2d
    .catchall {:try_start_24 .. :try_end_2d} :catchall_4d

    move-result v7

    goto :goto_22

    .line 100
    .end local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .end local v7    # "result":I
    .end local v8    # "skipLoadedBytes":Z
    :cond_2f
    const/4 v8, 0x0

    goto :goto_b

    .line 102
    .end local v6    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_31
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget v2, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer/util/Util;->getRemainderDataSpec(Lcom/google/android/exoplayer/upstream/DataSpec;I)Lcom/google/android/exoplayer/upstream/DataSpec;

    move-result-object v6

    .line 103
    .restart local v6    # "loadDataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    const/4 v8, 0x0

    .restart local v8    # "skipLoadedBytes":Z
    goto :goto_b

    .line 118
    .restart local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .restart local v7    # "result":I
    :cond_3b
    :try_start_3b
    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v3, v3, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v1, v3

    long-to-int v1, v1

    iput v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I
    :try_end_47
    .catchall {:try_start_3b .. :try_end_47} :catchall_5b

    .line 121
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 123
    return-void

    .line 118
    :catchall_4d
    move-exception v1

    :try_start_4e
    invoke-interface {v0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v4, v4, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    sub-long/2addr v2, v4

    long-to-int v2, v2

    iput v2, p0, Lcom/google/android/exoplayer/hls/TsChunk;->bytesLoaded:I

    throw v1
    :try_end_5b
    .catchall {:try_start_4e .. :try_end_5b} :catchall_5b

    .line 121
    .end local v0    # "input":Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .end local v7    # "result":I
    :catchall_5b
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v1
.end method
