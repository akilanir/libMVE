.class public final Lcom/google/android/exoplayer/hls/HlsSampleSource;
.super Ljava/lang/Object;
.source "HlsSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;
    }
.end annotation


# static fields
.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT:I = 0x3

.field private static final NO_RESET_PENDING:J = -0x8000000000000000L

.field private static final PRIMARY_TYPE_AUDIO:I = 0x2

.field private static final PRIMARY_TYPE_NONE:I = 0x0

.field private static final PRIMARY_TYPE_TEXT:I = 0x1

.field private static final PRIMARY_TYPE_VIDEO:I = 0x3


# instance fields
.field private final bufferSizeContribution:I

.field private final chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

.field private final chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

.field private chunkSourceTrackIndices:[I

.field private currentLoadStartTimeMs:J

.field private currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

.field private currentLoadableException:Ljava/io/IOException;

.field private currentLoadableExceptionCount:I

.field private currentLoadableExceptionTimestamp:J

.field private currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

.field private downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

.field private downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

.field private downstreamPositionUs:J

.field private enabledTrackCount:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

.field private final eventSourceId:I

.field private extractorTrackEnabledStates:[Z

.field private extractorTrackIndices:[I

.field private final extractors:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private lastSeekPositionUs:J

.field private final loadControl:Lcom/google/android/exoplayer/LoadControl;

.field private loadControlRegistered:Z

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private loadingFinished:Z

.field private final minLoadableRetryCount:I

.field private pendingDiscontinuities:[Z

.field private pendingResetPositionUs:J

.field private prepared:Z

.field private previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

.field private remainingReleaseCount:I

.field private trackCount:I

.field private trackEnabledStates:[Z

.field private trackFormats:[Lcom/google/android/exoplayer/MediaFormat;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/LoadControl;I)V
    .registers 11
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I

    .prologue
    const/4 v4, 0x0

    .line 114
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/hls/HlsSampleSource;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/LoadControl;ILandroid/os/Handler;Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;I)V

    .line 115
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/LoadControl;ILandroid/os/Handler;Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;I)V
    .registers 15
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;
    .param p6, "eventSourceId"    # I

    .prologue
    .line 120
    const/4 v7, 0x3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/hls/HlsSampleSource;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/LoadControl;ILandroid/os/Handler;Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;II)V

    .line 122
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/LoadControl;ILandroid/os/Handler;Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;II)V
    .registers 10
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;
    .param p6, "eventSourceId"    # I
    .param p7, "minLoadableRetryCount"    # I

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    .line 128
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    .line 129
    iput p3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->bufferSizeContribution:I

    .line 130
    iput p7, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->minLoadableRetryCount:I

    .line 131
    iput-object p4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    .line 132
    iput-object p5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    .line 133
    iput p6, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventSourceId:I

    .line 134
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 135
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    .line 136
    new-instance v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    .line 137
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/hls/HlsSampleSource;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/HlsSampleSource;

    .prologue
    .line 45
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventSourceId:I

    return v0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/hls/HlsSampleSource;)Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/HlsSampleSource;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    return-object v0
.end method

.method private buildTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;)V
    .registers 22
    .param p1, "extractor"    # Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .prologue
    .line 498
    const/4 v14, 0x0

    .line 499
    .local v14, "primaryExtractorTrackType":I
    const/4 v13, -0x1

    .line 500
    .local v13, "primaryExtractorTrackIndex":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getTrackCount()I

    move-result v6

    .line 501
    .local v6, "extractorTrackCount":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_7
    if-ge v9, v6, :cond_46

    .line 502
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getMediaFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v12, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 504
    .local v12, "mimeType":Ljava/lang/String;
    invoke-static {v12}, Lcom/google/android/exoplayer/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_25

    .line 505
    const/16 v17, 0x3

    .line 513
    .local v17, "trackType":I
    :goto_1b
    move/from16 v0, v17

    if-le v0, v14, :cond_3a

    .line 514
    move/from16 v14, v17

    .line 515
    move v13, v9

    .line 501
    :cond_22
    :goto_22
    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 506
    .end local v17    # "trackType":I
    :cond_25
    invoke-static {v12}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_2e

    .line 507
    const/16 v17, 0x2

    .restart local v17    # "trackType":I
    goto :goto_1b

    .line 508
    .end local v17    # "trackType":I
    :cond_2e
    invoke-static {v12}, Lcom/google/android/exoplayer/util/MimeTypes;->isText(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_37

    .line 509
    const/16 v17, 0x1

    .restart local v17    # "trackType":I
    goto :goto_1b

    .line 511
    .end local v17    # "trackType":I
    :cond_37
    const/16 v17, 0x0

    .restart local v17    # "trackType":I
    goto :goto_1b

    .line 516
    :cond_3a
    move/from16 v0, v17

    if-ne v0, v14, :cond_22

    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v13, v0, :cond_22

    .line 519
    const/4 v13, -0x1

    goto :goto_22

    .line 524
    .end local v12    # "mimeType":Ljava/lang/String;
    .end local v17    # "trackType":I
    :cond_46
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getTrackCount()I

    move-result v2

    .line 525
    .local v2, "chunkSourceTrackCount":I
    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v13, v0, :cond_14e

    const/4 v5, 0x1

    .line 526
    .local v5, "expandPrimaryExtractorTrack":Z
    :goto_57
    move-object/from16 v0, p0

    iput v6, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    .line 527
    if-eqz v5, :cond_6d

    .line 528
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    add-int/lit8 v19, v2, -0x1

    add-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    .line 532
    :cond_6d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    .line 533
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [Z

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    .line 534
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [Z

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    .line 535
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    .line 536
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSourceTrackIndices:[I

    .line 537
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    move/from16 v18, v0

    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    .line 538
    new-array v0, v6, [Z

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    .line 541
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getDurationUs()J

    move-result-wide v3

    .line 542
    .local v3, "durationUs":J
    const/4 v15, 0x0

    .line 543
    .local v15, "trackIndex":I
    const/4 v9, 0x0

    move/from16 v16, v15

    .end local v15    # "trackIndex":I
    .local v16, "trackIndex":I
    :goto_f1
    if-ge v9, v6, :cond_19c

    .line 544
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getMediaFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Lcom/google/android/exoplayer/MediaFormat;->copyWithDurationUs(J)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v8

    .line 545
    .local v8, "format":Lcom/google/android/exoplayer/MediaFormat;
    const/4 v11, 0x0

    .line 546
    .local v11, "language":Ljava/lang/String;
    iget-object v0, v8, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_151

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getMuxedAudioLanguage()Ljava/lang/String;

    move-result-object v11

    .line 551
    :cond_114
    :goto_114
    if-ne v9, v13, :cond_17b

    .line 552
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_117
    if-ge v10, v2, :cond_173

    .line 553
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    move-object/from16 v18, v0

    aput v9, v18, v16

    .line 554
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSourceTrackIndices:[I

    move-object/from16 v18, v0

    aput v10, v18, v16

    .line 555
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getFixedTrackVariant(I)Lcom/google/android/exoplayer/hls/Variant;

    move-result-object v7

    .line 556
    .local v7, "fixedTrackVariant":Lcom/google/android/exoplayer/hls/Variant;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v19, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "trackIndex":I
    .restart local v15    # "trackIndex":I
    if-nez v7, :cond_168

    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/google/android/exoplayer/MediaFormat;->copyAsAdaptive(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v18

    :goto_147
    aput-object v18, v19, v16

    .line 552
    add-int/lit8 v10, v10, 0x1

    move/from16 v16, v15

    .end local v15    # "trackIndex":I
    .restart local v16    # "trackIndex":I
    goto :goto_117

    .line 525
    .end local v3    # "durationUs":J
    .end local v5    # "expandPrimaryExtractorTrack":Z
    .end local v7    # "fixedTrackVariant":Lcom/google/android/exoplayer/hls/Variant;
    .end local v8    # "format":Lcom/google/android/exoplayer/MediaFormat;
    .end local v10    # "j":I
    .end local v11    # "language":Ljava/lang/String;
    .end local v16    # "trackIndex":I
    :cond_14e
    const/4 v5, 0x0

    goto/16 :goto_57

    .line 548
    .restart local v3    # "durationUs":J
    .restart local v5    # "expandPrimaryExtractorTrack":Z
    .restart local v8    # "format":Lcom/google/android/exoplayer/MediaFormat;
    .restart local v11    # "language":Ljava/lang/String;
    .restart local v16    # "trackIndex":I
    :cond_151
    const-string v18, "application/eia-608"

    iget-object v0, v8, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_114

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getMuxedCaptionLanguage()Ljava/lang/String;

    move-result-object v11

    goto :goto_114

    .line 556
    .end local v16    # "trackIndex":I
    .restart local v7    # "fixedTrackVariant":Lcom/google/android/exoplayer/hls/Variant;
    .restart local v10    # "j":I
    .restart local v15    # "trackIndex":I
    :cond_168
    iget-object v0, v7, Lcom/google/android/exoplayer/hls/Variant;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-static {v8, v0, v11}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->copyWithFixedTrackInfo(Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v18

    goto :goto_147

    .end local v7    # "fixedTrackVariant":Lcom/google/android/exoplayer/hls/Variant;
    .end local v15    # "trackIndex":I
    .restart local v16    # "trackIndex":I
    :cond_173
    move/from16 v15, v16

    .line 543
    .end local v10    # "j":I
    .end local v16    # "trackIndex":I
    .restart local v15    # "trackIndex":I
    :goto_175
    add-int/lit8 v9, v9, 0x1

    move/from16 v16, v15

    .end local v15    # "trackIndex":I
    .restart local v16    # "trackIndex":I
    goto/16 :goto_f1

    .line 560
    :cond_17b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    move-object/from16 v18, v0

    aput v9, v18, v16

    .line 561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSourceTrackIndices:[I

    move-object/from16 v18, v0

    const/16 v19, -0x1

    aput v19, v18, v16

    .line 562
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v18, v0

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "trackIndex":I
    .restart local v15    # "trackIndex":I
    invoke-virtual {v8, v11}, Lcom/google/android/exoplayer/MediaFormat;->copyWithLanguage(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v19

    aput-object v19, v18, v16

    goto :goto_175

    .line 565
    .end local v8    # "format":Lcom/google/android/exoplayer/MediaFormat;
    .end local v11    # "language":Ljava/lang/String;
    .end local v15    # "trackIndex":I
    .restart local v16    # "trackIndex":I
    :cond_19c
    return-void
.end method

.method private clearCurrentLoadable()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 676
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 677
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 678
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 679
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    .line 680
    return-void
.end method

.method private clearState()V
    .registers 3

    .prologue
    .line 667
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 668
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->clear()V

    .line 667
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 670
    :cond_17
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 671
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 672
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 673
    return-void
.end method

.method private static copyWithFixedTrackInfo(Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/Format;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 9
    .param p0, "format"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p1, "fixedTrackFormat"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p2, "language"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 593
    iget v1, p1, Lcom/google/android/exoplayer/chunk/Format;->width:I

    if-ne v1, v0, :cond_16

    move v3, v0

    .line 594
    .local v3, "width":I
    :goto_6
    iget v1, p1, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-ne v1, v0, :cond_19

    move v4, v0

    .line 595
    .local v4, "height":I
    :goto_b
    iget-object v1, p1, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, p1, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    move-object v0, p0

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaFormat;->copyWithFixedTrackInfo(Ljava/lang/String;IIILjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0

    .line 593
    .end local v3    # "width":I
    .end local v4    # "height":I
    :cond_16
    iget v3, p1, Lcom/google/android/exoplayer/chunk/Format;->width:I

    goto :goto_6

    .line 594
    .restart local v3    # "width":I
    :cond_19
    iget v4, p1, Lcom/google/android/exoplayer/chunk/Format;->height:I

    goto :goto_b
.end method

.method private discardSamplesForDisabledTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;J)V
    .registers 6
    .param p1, "extractor"    # Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .param p2, "timeUs"    # J

    .prologue
    .line 633
    invoke-virtual {p1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v1

    if-nez v1, :cond_7

    .line 641
    :cond_6
    return-void

    .line 636
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_6

    .line 637
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_16

    .line 638
    invoke-virtual {p1, v0, p2, p3}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->discardUntil(IJ)V

    .line 636
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method private getCurrentExtractor()Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .registers 4

    .prologue
    .line 623
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .line 624
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    :goto_8
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2b

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->haveSamplesForEnabledTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 626
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->clear()V

    .line 627
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    check-cast v0, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .restart local v0    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    goto :goto_8

    .line 629
    :cond_2b
    return-object v0
.end method

.method private getNextLoadPositionUs()J
    .registers 3

    .prologue
    .line 748
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 749
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 751
    :goto_8
    return-wide v0

    :cond_9
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-nez v0, :cond_15

    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-eqz v0, :cond_18

    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-nez v0, :cond_18

    :cond_15
    const-wide/16 v0, -0x1

    goto :goto_8

    :cond_18
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-wide v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    goto :goto_8

    :cond_21
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-wide v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    goto :goto_8
.end method

.method private getRetryDelayMillis(J)J
    .registers 7
    .param p1, "errorCount"    # J

    .prologue
    .line 765
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private haveSamplesForEnabledTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;)Z
    .registers 5
    .param p1, "extractor"    # Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .prologue
    const/4 v1, 0x0

    .line 644
    invoke-virtual {p1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v2

    if-nez v2, :cond_8

    .line 652
    :cond_7
    :goto_7
    return v1

    .line 647
    :cond_8
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 648
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_1c

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->hasSamples(I)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 649
    const/4 v1, 0x1

    goto :goto_7

    .line 647
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method private isPendingReset()Z
    .registers 5

    .prologue
    .line 761
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isTsChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z
    .registers 3
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;

    .prologue
    .line 757
    instance-of v0, p1, Lcom/google/android/exoplayer/hls/TsChunk;

    return v0
.end method

.method private maybeStartLoading()V
    .registers 31

    .prologue
    .line 683
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v27

    .line 684
    .local v27, "now":J
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getNextLoadPositionUs()J

    move-result-wide v7

    .line 685
    .local v7, "nextLoadPositionUs":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v3, :cond_55

    const/16 v24, 0x1

    .line 686
    .local v24, "isBackedOff":Z
    :goto_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v3

    if-nez v3, :cond_1c

    if-eqz v24, :cond_58

    :cond_1c
    const/4 v9, 0x1

    .line 689
    .local v9, "loadingOrBackedOff":Z
    :goto_1d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    move-object/from16 v4, p0

    invoke-interface/range {v3 .. v9}, Lcom/google/android/exoplayer/LoadControl;->update(Ljava/lang/Object;JJZ)Z

    move-result v26

    .line 692
    .local v26, "nextLoader":Z
    if-eqz v24, :cond_5a

    .line 693
    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionTimestamp:J

    sub-long v20, v27, v3

    .line 694
    .local v20, "elapsedMillis":J
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    int-to-long v3, v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getRetryDelayMillis(J)J

    move-result-wide v3

    cmp-long v3, v20, v3

    if-ltz v3, :cond_54

    .line 695
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 696
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    move-object/from16 v0, p0

    invoke-virtual {v3, v4, v0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    .line 741
    .end local v20    # "elapsedMillis":J
    :cond_54
    :goto_54
    return-void

    .line 685
    .end local v9    # "loadingOrBackedOff":Z
    .end local v24    # "isBackedOff":Z
    .end local v26    # "nextLoader":Z
    :cond_55
    const/16 v24, 0x0

    goto :goto_10

    .line 686
    .restart local v24    # "isBackedOff":Z
    :cond_58
    const/4 v9, 0x0

    goto :goto_1d

    .line 701
    .restart local v9    # "loadingOrBackedOff":Z
    .restart local v26    # "nextLoader":Z
    :cond_5a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v3

    if-nez v3, :cond_54

    if-eqz v26, :cond_54

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-eqz v3, :cond_72

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-eqz v3, :cond_54

    .line 705
    :cond_72
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    const-wide/high16 v10, -0x8000000000000000L

    cmp-long v3, v3, v10

    if-eqz v3, :cond_bf

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    :goto_88
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-virtual {v5, v6, v3, v4, v10}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getChunkOperation(Lcom/google/android/exoplayer/hls/TsChunk;JLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V

    .line 708
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-boolean v0, v3, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->endOfStream:Z

    move/from16 v22, v0

    .line 709
    .local v22, "endOfStream":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v0, v3, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    move-object/from16 v25, v0

    .line 710
    .local v25, "nextLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkOperationHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->clear()V

    .line 712
    if-eqz v22, :cond_c4

    .line 713
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 714
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    const-wide/16 v14, -0x1

    const/16 v16, 0x0

    move-object/from16 v11, p0

    invoke-interface/range {v10 .. v16}, Lcom/google/android/exoplayer/LoadControl;->update(Ljava/lang/Object;JJZ)Z

    goto :goto_54

    .line 705
    .end local v22    # "endOfStream":Z
    .end local v25    # "nextLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    :cond_bf
    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    goto :goto_88

    .line 717
    .restart local v22    # "endOfStream":Z
    .restart local v25    # "nextLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    :cond_c4
    if-eqz v25, :cond_54

    .line 721
    move-wide/from16 v0, v27

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadStartTimeMs:J

    .line 722
    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 723
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v3

    if-eqz v3, :cond_15c

    .line 724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    move-object/from16 v29, v0

    check-cast v29, Lcom/google/android/exoplayer/hls/TsChunk;

    .line 725
    .local v29, "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v3

    if-eqz v3, :cond_f2

    .line 726
    const-wide/high16 v3, -0x8000000000000000L

    move-object/from16 v0, p0

    iput-wide v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 728
    :cond_f2
    move-object/from16 v0, v29

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->extractorWrapper:Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    move-object/from16 v23, v0

    .line 729
    .local v23, "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_10e

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v0, v23

    if-eq v3, v0, :cond_124

    .line 730
    :cond_10e
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v3}, Lcom/google/android/exoplayer/LoadControl;->getAllocator()Lcom/google/android/exoplayer/upstream/Allocator;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->init(Lcom/google/android/exoplayer/upstream/Allocator;)V

    .line 731
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 733
    :cond_124
    move-object/from16 v0, v29

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v11, v3, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    move-object/from16 v0, v29

    iget v13, v0, Lcom/google/android/exoplayer/hls/TsChunk;->type:I

    move-object/from16 v0, v29

    iget v14, v0, Lcom/google/android/exoplayer/hls/TsChunk;->trigger:I

    move-object/from16 v0, v29

    iget-object v15, v0, Lcom/google/android/exoplayer/hls/TsChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v0, v29

    iget-wide v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    move-wide/from16 v16, v0

    move-object/from16 v0, v29

    iget-wide v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    move-wide/from16 v18, v0

    move-object/from16 v10, p0

    invoke-direct/range {v10 .. v19}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadStarted(JIILcom/google/android/exoplayer/chunk/Format;JJ)V

    .line 735
    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 740
    .end local v23    # "extractorWrapper":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    .end local v29    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    :goto_14d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    move-object/from16 v0, p0

    invoke-virtual {v3, v4, v0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto/16 :goto_54

    .line 737
    :cond_15c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v3, v3, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-wide v11, v3, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget v13, v3, Lcom/google/android/exoplayer/chunk/Chunk;->type:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget v14, v3, Lcom/google/android/exoplayer/chunk/Chunk;->trigger:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v15, v3, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    const-wide/16 v16, -0x1

    const-wide/16 v18, -0x1

    move-object/from16 v10, p0

    invoke-direct/range {v10 .. v19}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadStarted(JIILcom/google/android/exoplayer/chunk/Format;JJ)V

    goto :goto_14d
.end method

.method private notifyDownstreamFormatChanged(Lcom/google/android/exoplayer/chunk/Format;IJ)V
    .registers 12
    .param p1, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p2, "trigger"    # I
    .param p3, "positionUs"    # J

    .prologue
    .line 823
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    if-eqz v0, :cond_16

    .line 824
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/hls/HlsSampleSource$5;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/hls/HlsSampleSource$5;-><init>(Lcom/google/android/exoplayer/hls/HlsSampleSource;Lcom/google/android/exoplayer/chunk/Format;IJ)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 832
    :cond_16
    return-void
.end method

.method private notifyLoadCanceled(J)V
    .registers 5
    .param p1, "bytesLoaded"    # J

    .prologue
    .line 800
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    if-eqz v0, :cond_12

    .line 801
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/hls/HlsSampleSource$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsSampleSource$3;-><init>(Lcom/google/android/exoplayer/hls/HlsSampleSource;J)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 808
    :cond_12
    return-void
.end method

.method private notifyLoadCompleted(JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V
    .registers 31
    .param p1, "bytesLoaded"    # J
    .param p3, "type"    # I
    .param p4, "trigger"    # I
    .param p5, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p6, "mediaStartTimeUs"    # J
    .param p8, "mediaEndTimeUs"    # J
    .param p10, "elapsedRealtimeMs"    # J
    .param p12, "loadDurationMs"    # J

    .prologue
    .line 788
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v1, :cond_2e

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    if-eqz v1, :cond_2e

    .line 789
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    move-object/from16 v16, v0

    new-instance v1, Lcom/google/android/exoplayer/hls/HlsSampleSource$2;

    move-object/from16 v2, p0

    move-wide/from16 v3, p1

    move/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    move-wide/from16 v12, p10

    move-wide/from16 v14, p12

    invoke-direct/range {v1 .. v15}, Lcom/google/android/exoplayer/hls/HlsSampleSource$2;-><init>(Lcom/google/android/exoplayer/hls/HlsSampleSource;JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 797
    :cond_2e
    return-void
.end method

.method private notifyLoadError(Ljava/io/IOException;)V
    .registers 4
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 811
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    if-eqz v0, :cond_12

    .line 812
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/hls/HlsSampleSource$4;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/hls/HlsSampleSource$4;-><init>(Lcom/google/android/exoplayer/hls/HlsSampleSource;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 819
    :cond_12
    return-void
.end method

.method private notifyLoadStarted(JIILcom/google/android/exoplayer/chunk/Format;JJ)V
    .registers 22
    .param p1, "length"    # J
    .param p3, "type"    # I
    .param p4, "trigger"    # I
    .param p5, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p6, "mediaStartTimeUs"    # J
    .param p8, "mediaEndTimeUs"    # J

    .prologue
    .line 774
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventListener:Lcom/google/android/exoplayer/hls/HlsSampleSource$EventListener;

    if-eqz v0, :cond_1d

    .line 775
    iget-object v11, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/hls/HlsSampleSource$1;

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-wide/from16 v7, p6

    move-wide/from16 v9, p8

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/hls/HlsSampleSource$1;-><init>(Lcom/google/android/exoplayer/hls/HlsSampleSource;JIILcom/google/android/exoplayer/chunk/Format;JJ)V

    invoke-virtual {v11, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 783
    :cond_1d
    return-void
.end method

.method private restartFrom(J)V
    .registers 4
    .param p1, "positionUs"    # J

    .prologue
    .line 656
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 657
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 658
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 659
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 664
    :goto_12
    return-void

    .line 661
    :cond_13
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    .line 662
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    goto :goto_12
.end method

.method private seekToInternal(J)V
    .registers 5
    .param p1, "positionUs"    # J

    .prologue
    .line 605
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    .line 606
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 607
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([ZZ)V

    .line 608
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->seek()V

    .line 609
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->restartFrom(J)V

    .line 610
    return-void
.end method

.method private setTrackEnabledState(IZ)V
    .registers 7
    .param p1, "track"    # I
    .param p2, "enabledState"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 574
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v1, v1, p1

    if-eq v1, p2, :cond_2a

    move v1, v2

    :goto_9
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 575
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    aget v0, v1, p1

    .line 576
    .local v0, "extractorTrack":I
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    aget-boolean v1, v1, v0

    if-eq v1, p2, :cond_17

    move v3, v2

    :cond_17
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 577
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aput-boolean p2, v1, p1

    .line 578
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackEnabledStates:[Z

    aput-boolean p2, v1, v0

    .line 579
    iget v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-eqz p2, :cond_2c

    :goto_26
    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    .line 580
    return-void

    .end local v0    # "extractorTrack":I
    :cond_2a
    move v1, v3

    .line 574
    goto :goto_9

    .line 579
    .restart local v0    # "extractorTrack":I
    :cond_2c
    const/4 v2, -0x1

    goto :goto_26
.end method


# virtual methods
.method public continueBuffering(IJ)Z
    .registers 12
    .param p1, "track"    # I
    .param p2, "playbackPositionUs"    # J

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 258
    iget-boolean v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 259
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v5, v5, p1

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 260
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 261
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_21

    .line 262
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getCurrentExtractor()Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    move-result-object v5

    iget-wide v6, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    invoke-direct {p0, v5, v6, v7}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->discardSamplesForDisabledTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;J)V

    .line 264
    :cond_21
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 265
    iget-boolean v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-eqz v5, :cond_29

    .line 281
    :cond_28
    :goto_28
    return v3

    .line 268
    :cond_29
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v5

    if-nez v5, :cond_37

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_39

    :cond_37
    move v3, v4

    .line 269
    goto :goto_28

    .line 271
    :cond_39
    const/4 v1, 0x0

    .local v1, "extractorIndex":I
    :goto_3a
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    if-ge v1, v5, :cond_50

    .line 272
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .line 273
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v5

    if-nez v5, :cond_52

    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    :cond_50
    move v3, v4

    .line 281
    goto :goto_28

    .line 276
    .restart local v0    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    :cond_52
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    aget v2, v5, p1

    .line 277
    .local v2, "extractorTrack":I
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->hasSamples(I)Z

    move-result v5

    if-nez v5, :cond_28

    .line 271
    add-int/lit8 v1, v1, 0x1

    goto :goto_3a
.end method

.method public disable(I)V
    .registers 5
    .param p1, "track"    # I

    .prologue
    const/4 v2, 0x0

    .line 238
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 239
    invoke-direct {p0, p1, v2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->setTrackEnabledState(IZ)V

    .line 240
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-nez v0, :cond_2e

    .line 241
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->reset()V

    .line 242
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 243
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    if-eqz v0, :cond_21

    .line 244
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/LoadControl;->unregister(Ljava/lang/Object;)V

    .line 245
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    .line 247
    :cond_21
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 248
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 254
    :cond_2e
    :goto_2e
    return-void

    .line 250
    :cond_2f
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    .line 251
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0}, Lcom/google/android/exoplayer/LoadControl;->trimAllocator()V

    goto :goto_2e
.end method

.method public enable(IJ)V
    .registers 10
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 199
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 200
    invoke-direct {p0, p1, v4}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->setTrackEnabledState(IZ)V

    .line 201
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aput-object v5, v2, p1

    .line 202
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    const/4 v3, 0x0

    aput-boolean v3, v2, p1

    .line 203
    iput-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 204
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    .line 205
    .local v1, "wasLoadControlRegistered":Z
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    if-nez v2, :cond_24

    .line 206
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    iget v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->bufferSizeContribution:I

    invoke-interface {v2, p0, v3}, Lcom/google/android/exoplayer/LoadControl;->register(Ljava/lang/Object;I)V

    .line 207
    iput-boolean v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    .line 210
    :cond_24
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isLive()Z

    move-result v2

    if-eqz v2, :cond_2e

    const-wide/16 p2, 0x0

    .line 211
    :cond_2e
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSourceTrackIndices:[I

    aget v0, v2, p1

    .line 212
    .local v0, "chunkSourceTrack":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_46

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getSelectedTrackIndex()I

    move-result v2

    if-eq v0, v2, :cond_46

    .line 217
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->selectTrack(I)V

    .line 218
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->seekToInternal(J)V

    .line 234
    :cond_45
    :goto_45
    return-void

    .line 221
    :cond_46
    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-ne v2, v4, :cond_45

    .line 222
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    .line 223
    if-eqz v1, :cond_58

    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    cmp-long v2, v2, p2

    if-nez v2, :cond_58

    .line 228
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    goto :goto_45

    .line 230
    :cond_58
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 231
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->restartFrom(J)V

    goto :goto_45
.end method

.method public getBufferedPositionUs()J
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 380
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 381
    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v2, :cond_17

    move v2, v3

    :goto_b
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 382
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 383
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 394
    :cond_16
    :goto_16
    return-wide v0

    .line 381
    :cond_17
    const/4 v2, 0x0

    goto :goto_b

    .line 384
    :cond_19
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-eqz v2, :cond_20

    .line 385
    const-wide/16 v0, -0x3

    goto :goto_16

    .line 387
    :cond_20
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getLargestParsedTimestampUs()J

    move-result-wide v0

    .line 388
    .local v0, "largestParsedTimestampUs":J
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-le v2, v3, :cond_4c

    .line 391
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getLargestParsedTimestampUs()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 394
    :cond_4c
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-nez v2, :cond_16

    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    goto :goto_16
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 3
    .param p1, "track"    # I

    .prologue
    .line 193
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 194
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getTrackCount()I
    .registers 2

    .prologue
    .line 187
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 188
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    return v0
.end method

.method public maybeThrowError()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    iget v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->minLoadableRetryCount:I

    if-le v0, v1, :cond_d

    .line 354
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v0

    .line 355
    :cond_d
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    if-nez v0, :cond_16

    .line 356
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maybeThrowError()V

    .line 358
    :cond_16
    return-void
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadCanceled(J)V

    .line 437
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v0, :cond_13

    .line 438
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->restartFrom(J)V

    .line 443
    :goto_12
    return-void

    .line 440
    :cond_13
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    .line 441
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0}, Lcom/google/android/exoplayer/LoadControl;->trimAllocator()V

    goto :goto_12
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .registers 16
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    const-wide/16 v6, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 416
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    if-ne p1, v0, :cond_55

    move v0, v1

    :goto_9
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 417
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 418
    .local v10, "now":J
    iget-wide v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadStartTimeMs:J

    sub-long v12, v10, v3

    .line 419
    .local v12, "loadDurationMs":J
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->onChunkLoadCompleted(Lcom/google/android/exoplayer/chunk/Chunk;)V

    .line 420
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 421
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    if-ne v0, v3, :cond_57

    :goto_29
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 422
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 423
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v1

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget v3, v0, Lcom/google/android/exoplayer/hls/TsChunk;->type:I

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget v4, v0, Lcom/google/android/exoplayer/hls/TsChunk;->trigger:I

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-object v5, v0, Lcom/google/android/exoplayer/hls/TsChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-wide v6, v0, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-wide v8, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    move-object v0, p0

    invoke-direct/range {v0 .. v13}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadCompleted(JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V

    .line 430
    :goto_4e
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 431
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 432
    return-void

    .end local v10    # "now":J
    .end local v12    # "loadDurationMs":J
    :cond_55
    move v0, v2

    .line 416
    goto :goto_9

    .restart local v10    # "now":J
    .restart local v12    # "loadDurationMs":J
    :cond_57
    move v1, v2

    .line 421
    goto :goto_29

    .line 427
    :cond_59
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v1

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget v3, v0, Lcom/google/android/exoplayer/chunk/Chunk;->type:I

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget v4, v0, Lcom/google/android/exoplayer/chunk/Chunk;->trigger:I

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v5, v0, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object v0, p0

    move-wide v8, v6

    invoke-direct/range {v0 .. v13}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadCompleted(JIILcom/google/android/exoplayer/chunk/Format;JJJJ)V

    goto :goto_4e
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .registers 5
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 447
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-virtual {v0, v1, p2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/io/IOException;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 449
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    if-nez v0, :cond_18

    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v0

    if-nez v0, :cond_18

    .line 450
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 452
    :cond_18
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 458
    :goto_1b
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyLoadError(Ljava/io/IOException;)V

    .line 459
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 460
    return-void

    .line 454
    :cond_22
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 455
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    .line 456
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionTimestamp:J

    goto :goto_1b
.end method

.method public prepare(J)Z
    .registers 8
    .param p1, "positionUs"    # J

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 147
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-eqz v1, :cond_8

    move v1, v2

    .line 182
    :goto_7
    return v1

    .line 149
    :cond_8
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->prepare()Z

    move-result v1

    if-nez v1, :cond_12

    move v1, v3

    .line 150
    goto :goto_7

    .line 152
    :cond_12
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_46

    .line 155
    :goto_1a
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .line 156
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 157
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->buildTracks(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;)V

    .line 158
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    .line 159
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    move v1, v2

    .line 160
    goto :goto_7

    .line 161
    :cond_32
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-le v1, v2, :cond_46

    .line 162
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->clear()V

    goto :goto_1a

    .line 169
    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    :cond_46
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-nez v1, :cond_5c

    .line 170
    new-instance v1, Lcom/google/android/exoplayer/upstream/Loader;

    const-string v4, "Loader:HLS"

    invoke-direct {v1, v4}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 171
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->bufferSizeContribution:I

    invoke-interface {v1, p0, v4}, Lcom/google/android/exoplayer/LoadControl;->register(Ljava/lang/Object;I)V

    .line 172
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    .line 174
    :cond_5c
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v1

    if-nez v1, :cond_68

    .line 178
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 179
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 181
    :cond_68
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    move v1, v3

    .line 182
    goto :goto_7
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I
    .registers 15
    .param p1, "track"    # I
    .param p2, "playbackPositionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 296
    iget-boolean v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 297
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 299
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v5, v5, p1

    if-nez v5, :cond_13

    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v5

    if-eqz v5, :cond_15

    .line 300
    :cond_13
    const/4 v5, -0x2

    .line 348
    :goto_14
    return v5

    .line 303
    :cond_15
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getCurrentExtractor()Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    move-result-object v1

    .line 304
    .local v1, "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v5

    if-nez v5, :cond_21

    .line 305
    const/4 v5, -0x2

    goto :goto_14

    .line 308
    :cond_21
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v5, :cond_2f

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v6, v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3c

    .line 310
    :cond_2f
    iget-object v5, v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v6, v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->trigger:I

    iget-wide v7, v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->startTimeUs:J

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->notifyDownstreamFormatChanged(Lcom/google/android/exoplayer/chunk/Format;IJ)V

    .line 311
    iget-object v5, v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->format:Lcom/google/android/exoplayer/chunk/Format;

    iput-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 314
    :cond_3c
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_51

    .line 317
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->configureSpliceTo(Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;)V

    .line 320
    :cond_51
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractorTrackIndices:[I

    aget v3, v5, p1

    .line 321
    .local v3, "extractorTrack":I
    const/4 v2, 0x0

    .line 322
    .local v2, "extractorIndex":I
    :cond_56
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    add-int/lit8 v6, v2, 0x1

    if-le v5, v6, :cond_78

    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->hasSamples(I)Z

    move-result v5

    if-nez v5, :cond_78

    .line 325
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    check-cast v1, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;

    .line 326
    .restart local v1    # "extractor":Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;
    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->isPrepared()Z

    move-result v5

    if-nez v5, :cond_56

    .line 327
    const/4 v5, -0x2

    goto :goto_14

    .line 331
    :cond_78
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getMediaFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    .line 332
    .local v4, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-eqz v4, :cond_90

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v5, v5, p1

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer/MediaFormat;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_90

    .line 333
    iput-object v4, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 334
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aput-object v4, v5, p1

    .line 335
    const/4 v5, -0x4

    goto :goto_14

    .line 338
    :cond_90
    invoke-virtual {v1, v3, p5}, Lcom/google/android/exoplayer/hls/HlsExtractorWrapper;->getSample(ILcom/google/android/exoplayer/SampleHolder;)Z

    move-result v5

    if-eqz v5, :cond_af

    .line 339
    iget-wide v5, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v7, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    cmp-long v5, v5, v7

    if-gez v5, :cond_ab

    const/4 v0, 0x1

    .line 340
    .local v0, "decodeOnly":Z
    :goto_9f
    iget v6, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    if-eqz v0, :cond_ad

    const/high16 v5, 0x8000000

    :goto_a5
    or-int/2addr v5, v6

    iput v5, p5, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 341
    const/4 v5, -0x3

    goto/16 :goto_14

    .line 339
    .end local v0    # "decodeOnly":Z
    :cond_ab
    const/4 v0, 0x0

    goto :goto_9f

    .line 340
    .restart local v0    # "decodeOnly":Z
    :cond_ad
    const/4 v5, 0x0

    goto :goto_a5

    .line 344
    .end local v0    # "decodeOnly":Z
    :cond_af
    iget-boolean v5, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-eqz v5, :cond_b6

    .line 345
    const/4 v5, -0x1

    goto/16 :goto_14

    .line 348
    :cond_b6
    const/4 v5, -0x2

    goto/16 :goto_14
.end method

.method public readDiscontinuity(I)J
    .registers 4
    .param p1, "track"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_e

    .line 287
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    const/4 v1, 0x0

    aput-boolean v1, v0, p1

    .line 288
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    .line 290
    :goto_d
    return-wide v0

    :cond_e
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_d
.end method

.method public register()Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .registers 2

    .prologue
    .line 141
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    .line 142
    return-object p0
.end method

.method public release()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 401
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    if-lez v0, :cond_29

    const/4 v0, 0x1

    :goto_6
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 402
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    if-nez v0, :cond_28

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_28

    .line 403
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    if-eqz v0, :cond_20

    .line 404
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/LoadControl;->unregister(Ljava/lang/Object;)V

    .line 405
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadControlRegistered:Z

    .line 407
    :cond_20
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 408
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 410
    :cond_28
    return-void

    :cond_29
    move v0, v1

    .line 401
    goto :goto_6
.end method

.method public seekToUs(J)V
    .registers 6
    .param p1, "positionUs"    # J

    .prologue
    .line 362
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 363
    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v2, :cond_28

    const/4 v2, 0x1

    :goto_a
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 365
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->isLive()Z

    move-result v2

    if-eqz v2, :cond_17

    const-wide/16 p1, 0x0

    .line 368
    :cond_17
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v2

    if-eqz v2, :cond_2a

    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 369
    .local v0, "currentPositionUs":J
    :goto_1f
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 370
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    .line 371
    cmp-long v2, v0, p1

    if-nez v2, :cond_2d

    .line 376
    :goto_27
    return-void

    .line 363
    .end local v0    # "currentPositionUs":J
    :cond_28
    const/4 v2, 0x0

    goto :goto_a

    .line 368
    :cond_2a
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    goto :goto_1f

    .line 375
    .restart local v0    # "currentPositionUs":J
    :cond_2d
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->seekToInternal(J)V

    goto :goto_27
.end method

.method usToMs(J)J
    .registers 5
    .param p1, "timeUs"    # J

    .prologue
    .line 769
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    return-wide v0
.end method
