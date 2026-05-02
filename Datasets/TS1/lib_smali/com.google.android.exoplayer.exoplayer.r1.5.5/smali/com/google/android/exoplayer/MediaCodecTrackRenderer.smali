.class public abstract Lcom/google/android/exoplayer/MediaCodecTrackRenderer;
.super Lcom/google/android/exoplayer/SampleSourceTrackRenderer;
.source "MediaCodecTrackRenderer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;,
        Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
    }
.end annotation


# static fields
.field private static final MAX_CODEC_HOTSWAP_TIME_MS:J = 0x3e8L

.field private static final RECONFIGURATION_STATE_NONE:I = 0x0

.field private static final RECONFIGURATION_STATE_QUEUE_PENDING:I = 0x2

.field private static final RECONFIGURATION_STATE_WRITE_PENDING:I = 0x1

.field private static final REINITIALIZATION_STATE_NONE:I = 0x0

.field private static final REINITIALIZATION_STATE_SIGNAL_END_OF_STREAM:I = 0x1

.field private static final REINITIALIZATION_STATE_WAIT_END_OF_STREAM:I = 0x2

.field protected static final SOURCE_STATE_NOT_READY:I = 0x0

.field protected static final SOURCE_STATE_READY:I = 0x1

.field protected static final SOURCE_STATE_READY_READ_MAY_FAIL:I = 0x2


# instance fields
.field private codec:Landroid/media/MediaCodec;

.field public final codecCounters:Lcom/google/android/exoplayer/CodecCounters;

.field private codecHasQueuedBuffers:Z

.field private codecHotswapTimeMs:J

.field private codecIsAdaptive:Z

.field private codecNeedsEosFlushWorkaround:Z

.field private codecNeedsEosPropagationWorkaround:Z

.field private codecNeedsFlushWorkaround:Z

.field private codecReceivedEos:Z

.field private codecReconfigurationState:I

.field private codecReconfigured:Z

.field private codecReinitializationState:I

.field private final decodeOnlyPresentationTimestamps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final deviceNeedsAutoFrcWorkaround:Z

.field private drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

.field private final drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

.field protected final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

.field private format:Lcom/google/android/exoplayer/MediaFormat;

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputBuffers:[Ljava/nio/ByteBuffer;

.field private inputIndex:I

.field private inputStreamEnded:Z

.field private final mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

.field private openedDrmSession:Z

.field private final outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private outputBuffers:[Ljava/nio/ByteBuffer;

.field private outputIndex:I

.field private outputStreamEnded:Z

.field private final playClearSamplesWithoutKeys:Z

.field private final sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private sourceState:I

.field private waitingForFirstSyncFrame:Z

.field private waitingForKeys:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V
    .registers 11
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p3, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p4, "playClearSamplesWithoutKeys"    # Z
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 250
    new-array v2, v0, [Lcom/google/android/exoplayer/SampleSource;

    aput-object p1, v2, v1

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;)V

    .line 251
    sget v2, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_50

    :goto_f
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 252
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/MediaCodecSelector;

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    .line 253
    iput-object p3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    .line 254
    iput-boolean p4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    .line 255
    iput-object p5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    .line 256
    iput-object p6, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .line 257
    invoke-static {}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround:Z

    .line 258
    new-instance v0, Lcom/google/android/exoplayer/CodecCounters;

    invoke-direct {v0}, Lcom/google/android/exoplayer/CodecCounters;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    .line 259
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 260
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 261
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    .line 262
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 263
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 264
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 265
    return-void

    :cond_50
    move v0, v1

    .line 251
    goto :goto_f
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;)Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    return-object v0
.end method

.method private static codecNeedsEosFlushWorkaround(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 979
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-gt v0, v1, :cond_10

    const-string v0, "OMX.google.vorbis.decoder"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private static codecNeedsEosPropagationWorkaround(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 964
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x11

    if-gt v0, v1, :cond_10

    const-string v0, "OMX.rk.video_decoder.avc"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private static codecNeedsFlushWorkaround(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x12

    .line 944
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-lt v0, v1, :cond_3a

    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    if-ne v0, v1, :cond_1a

    const-string v0, "OMX.SEC.avc.dec"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, "OMX.SEC.avc.dec.secure"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    :cond_1a
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-ne v0, v1, :cond_3c

    sget-object v0, Lcom/google/android/exoplayer/util/Util;->MODEL:Ljava/lang/String;

    const-string v1, "SM-G800"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3c

    const-string v0, "OMX.Exynos.avc.dec"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    const-string v0, "OMX.Exynos.avc.dec.secure"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    :cond_3a
    const/4 v0, 0x1

    :goto_3b
    return v0

    :cond_3c
    const/4 v0, 0x0

    goto :goto_3b
.end method

.method private static deviceNeedsAutoFrcWorkaround()Z
    .registers 2

    .prologue
    .line 997
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x16

    if-gt v0, v1, :cond_1c

    const-string v0, "foster"

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string v0, "NVIDIA"

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method private drainOutputBuffer(JJ)Z
    .registers 16
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 819
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    if-eqz v0, :cond_6

    .line 820
    const/4 v0, 0x0

    .line 859
    :goto_5
    return v0

    .line 823
    :cond_6
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_18

    .line 824
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDequeueOutputBufferTimeoutUs()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 827
    :cond_18
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_30

    .line 828
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onOutputFormatChanged(Landroid/media/MediaFormat;)V

    .line 829
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    .line 830
    const/4 v0, 0x1

    goto :goto_5

    .line 831
    :cond_30
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v1, -0x3

    if-ne v0, v1, :cond_47

    .line 832
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 833
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    .line 834
    const/4 v0, 0x1

    goto :goto_5

    .line 835
    :cond_47
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_5f

    .line 836
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v0, :cond_5d

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    if-nez v0, :cond_58

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5d

    .line 838
    :cond_58
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 839
    const/4 v0, 0x1

    goto :goto_5

    .line 841
    :cond_5d
    const/4 v0, 0x0

    goto :goto_5

    .line 844
    :cond_5f
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_6c

    .line 845
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 846
    const/4 v0, 0x0

    goto :goto_5

    .line 849
    :cond_6c
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDecodeOnlyIndex(J)I

    move-result v10

    .line 850
    .local v10, "decodeOnlyIndex":I
    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    aget-object v6, v0, v1

    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v0, -0x1

    if-eq v10, v0, :cond_9b

    const/4 v9, 0x1

    :goto_84
    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z

    move-result v0

    if-eqz v0, :cond_9d

    .line 852
    const/4 v0, -0x1

    if-eq v10, v0, :cond_95

    .line 853
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 855
    :cond_95
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 856
    const/4 v0, 0x1

    goto/16 :goto_5

    .line 850
    :cond_9b
    const/4 v9, 0x0

    goto :goto_84

    .line 859
    :cond_9d
    const/4 v0, 0x0

    goto/16 :goto_5
.end method

.method private feedInputBuffer(JZ)Z
    .registers 26
    .param p1, "positionUs"    # J
    .param p3, "firstFeed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 537
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    if-nez v3, :cond_d

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_f

    .line 541
    :cond_d
    const/4 v3, 0x0

    .line 667
    :goto_e
    return v3

    .line 544
    :cond_f
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v3, :cond_42

    .line 545
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 546
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v3, :cond_2b

    .line 547
    const/4 v3, 0x0

    goto :goto_e

    .line 549
    :cond_2b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    aget-object v4, v4, v5

    iput-object v4, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    .line 550
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 553
    :cond_42
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_71

    .line 556
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v3, :cond_56

    .line 563
    :goto_4f
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 564
    const/4 v3, 0x0

    goto :goto_e

    .line 559
    :cond_56
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 560
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x4

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 561
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    goto :goto_4f

    .line 568
    :cond_71
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v3, :cond_80

    .line 570
    const/16 v20, -0x3

    .line 587
    .local v20, "result":I
    :cond_79
    :goto_79
    const/4 v3, -0x2

    move/from16 v0, v20

    if-ne v0, v3, :cond_dc

    .line 588
    const/4 v3, 0x0

    goto :goto_e

    .line 574
    .end local v20    # "result":I
    :cond_80
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_b8

    .line 575
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_89
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v3, v3, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v19

    if-ge v0, v3, :cond_b3

    .line 576
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v3, v3, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move/from16 v0, v19

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [B

    .line 577
    .local v17, "data":[B
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 575
    add-int/lit8 v19, v19, 0x1

    goto :goto_89

    .line 579
    .end local v17    # "data":[B
    :cond_b3
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 581
    .end local v19    # "i":I
    :cond_b8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v20

    .line 582
    .restart local v20    # "result":I
    if-eqz p3, :cond_79

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_79

    const/4 v3, -0x2

    move/from16 v0, v20

    if-ne v0, v3, :cond_79

    .line 583
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    goto :goto_79

    .line 590
    :cond_dc
    const/4 v3, -0x4

    move/from16 v0, v20

    if-ne v0, v3, :cond_100

    .line 591
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_f4

    .line 594
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 595
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 597
    :cond_f4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 598
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 600
    :cond_100
    const/4 v3, -0x1

    move/from16 v0, v20

    if-ne v0, v3, :cond_15d

    .line 601
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_118

    .line 605
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 606
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 608
    :cond_118
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 609
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHasQueuedBuffers:Z

    if-nez v3, :cond_129

    .line 610
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 611
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 614
    :cond_129
    :try_start_129
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v3, :cond_132

    .line 625
    :goto_12f
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 617
    :cond_132
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 618
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x4

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 619
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I
    :try_end_14c
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_129 .. :try_end_14c} :catch_14d

    goto :goto_12f

    .line 621
    :catch_14d
    move-exception v18

    .line 622
    .local v18, "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 623
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v18

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 627
    .end local v18    # "e":Landroid/media/MediaCodec$CryptoException;
    :cond_15d
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    if-eqz v3, :cond_188

    .line 630
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isSyncFrame()Z

    move-result v3

    if-nez v3, :cond_183

    .line 631
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 632
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_180

    .line 635
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 637
    :cond_180
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 639
    :cond_183
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 641
    :cond_188
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isEncrypted()Z

    move-result v21

    .line 642
    .local v21, "sampleEncrypted":Z
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldWaitForKeys(Z)Z

    move-result v3

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 643
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v3, :cond_1a5

    .line 644
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 647
    :cond_1a5
    :try_start_1a5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    .line 648
    .local v12, "bufferSize":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v3, v3, Lcom/google/android/exoplayer/SampleHolder;->size:I

    sub-int v16, v12, v3

    .line 649
    .local v16, "adaptiveReconfigurationBytes":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v7, v3, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 650
    .local v7, "presentationTimeUs":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isDecodeOnly()Z

    move-result v3

    if-eqz v3, :cond_1d2

    .line 651
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    :cond_1d2
    if-eqz v21, :cond_1fd

    .line 654
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move/from16 v0, v16

    invoke-static {v3, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v6

    .line 656
    .local v6, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v5, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueSecureInputBuffer(IILandroid/media/MediaCodec$CryptoInfo;JI)V

    .line 660
    .end local v6    # "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    :goto_1eb
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 661
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHasQueuedBuffers:Z

    .line 662
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 667
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 658
    :cond_1fd
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v11, 0x0

    const/4 v15, 0x0

    move-wide v13, v7

    invoke-virtual/range {v9 .. v15}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_20b
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_1a5 .. :try_end_20b} :catch_20c

    goto :goto_1eb

    .line 663
    .end local v7    # "presentationTimeUs":J
    .end local v12    # "bufferSize":I
    .end local v16    # "adaptiveReconfigurationBytes":I
    :catch_20c
    move-exception v18

    .line 664
    .restart local v18    # "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 665
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v18

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private flushCodec()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 501
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 502
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 503
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 504
    iput-boolean v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 505
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 506
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 507
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    if-nez v0, :cond_20

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    if-eqz v0, :cond_31

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    if-eqz v0, :cond_31

    .line 509
    :cond_20
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 510
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 521
    :goto_26
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_30

    .line 524
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 526
    :cond_30
    return-void

    .line 511
    :cond_31
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    if-eqz v0, :cond_3c

    .line 514
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 515
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    goto :goto_26

    .line 518
    :cond_3c
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 519
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHasQueuedBuffers:Z

    goto :goto_26
.end method

.method private getDecodeOnlyIndex(J)I
    .registers 7
    .param p1, "presentationTimeUs"    # J

    .prologue
    .line 925
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 926
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1d

    .line 927
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-nez v2, :cond_1a

    .line 931
    .end local v0    # "i":I
    :goto_19
    return v0

    .line 926
    .restart local v0    # "i":I
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 931
    :cond_1d
    const/4 v0, -0x1

    goto :goto_19
.end method

.method private static getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;
    .registers 6
    .param p0, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p1, "adaptiveReconfigurationBytes"    # I

    .prologue
    .line 672
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/CryptoInfo;->getFrameworkCryptoInfoV16()Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v0

    .line 673
    .local v0, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    if-nez p1, :cond_9

    .line 683
    :goto_8
    return-object v0

    .line 679
    :cond_9
    iget-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    if-nez v1, :cond_12

    .line 680
    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    .line 682
    :cond_12
    iget-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    add-int/2addr v3, p1

    aput v3, v1, v2

    goto :goto_8
.end method

.method private getFrameworkMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)Landroid/media/MediaFormat;
    .registers 5
    .param p1, "format"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 687
    invoke-virtual {p1}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v0

    .line 688
    .local v0, "mediaFormat":Landroid/media/MediaFormat;
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround:Z

    if-eqz v1, :cond_e

    .line 689
    const-string v1, "auto-frc"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 691
    :cond_e
    return-object v0
.end method

.method private isWithinHotswapPeriod()Z
    .registers 7

    .prologue
    .line 800
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .registers 3
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 388
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V
    .registers 4
    .param p1, "e"    # Landroid/media/MediaCodec$CryptoException;

    .prologue
    .line 901
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_12

    .line 902
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Landroid/media/MediaCodec$CryptoException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 909
    :cond_12
    return-void
.end method

.method private notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .registers 4
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    .prologue
    .line 890
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_12

    .line 891
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 898
    :cond_12
    return-void
.end method

.method private notifyDecoderInitialized(Ljava/lang/String;JJ)V
    .registers 14
    .param p1, "decoderName"    # Ljava/lang/String;
    .param p2, "initializedTimestamp"    # J
    .param p4, "initializationDuration"    # J

    .prologue
    .line 913
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_16

    .line 914
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$3;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$3;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Ljava/lang/String;JJ)V

    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 922
    :cond_16
    return-void
.end method

.method private processEndOfStream()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 879
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 881
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 882
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 887
    :goto_b
    return-void

    .line 884
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 885
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onOutputStreamEnded()V

    goto :goto_b
.end method

.method private readFormat(J)V
    .registers 6
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 494
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    const/4 v2, 0x0

    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v0

    .line 495
    .local v0, "result":I
    const/4 v1, -0x4

    if-ne v0, v1, :cond_f

    .line 496
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 498
    :cond_f
    return-void
.end method

.method private shouldWaitForKeys(Z)Z
    .registers 5
    .param p1, "sampleEncrypted"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 695
    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v2, :cond_6

    .line 706
    :cond_5
    :goto_5
    return v1

    .line 698
    :cond_6
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v0

    .line 699
    .local v0, "drmManagerState":I
    if-nez v0, :cond_1a

    .line 700
    new-instance v1, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 702
    :cond_1a
    const/4 v2, 0x4

    if-eq v0, v2, :cond_5

    if-nez p1, :cond_23

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    if-nez v2, :cond_5

    .line 704
    :cond_23
    const/4 v1, 0x1

    goto :goto_5
.end method


# virtual methods
.method protected canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 6
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "codecIsAdaptive"    # Z
    .param p3, "oldFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p4, "newFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 775
    const/4 v0, 0x0

    return v0
.end method

.method protected final codecInitialized()Z
    .registers 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected abstract configureCodec(Landroid/media/MediaCodec;ZLandroid/media/MediaFormat;Landroid/media/MediaCrypto;)V
.end method

.method protected doSomeWork(JJZ)V
    .registers 9
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "sourceIsReady"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 475
    if-eqz p5, :cond_3c

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    if-nez v0, :cond_39

    move v0, v1

    :goto_9
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 478
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-nez v0, :cond_12

    .line 479
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readFormat(J)V

    .line 481
    :cond_12
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 482
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_33

    .line 483
    const-string v0, "drainAndFeed"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 484
    :cond_1e
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drainOutputBuffer(JJ)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 485
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(JZ)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 486
    :cond_2a
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(JZ)Z

    move-result v0

    if-nez v0, :cond_2a

    .line 488
    :cond_30
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 490
    :cond_33
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/CodecCounters;->ensureUpdated()V

    .line 491
    return-void

    .line 475
    :cond_39
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    goto :goto_9

    :cond_3c
    move v0, v2

    goto :goto_9
.end method

.method protected getDecoderInfo(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;Z)Lcom/google/android/exoplayer/DecoderInfo;
    .registers 5
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p2, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p3, "requiresSecureDecoder"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 295
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-interface {p1, v0, p3}, Lcom/google/android/exoplayer/MediaCodecSelector;->getDecoderInfo(Lcom/google/android/exoplayer/MediaFormat;Z)Lcom/google/android/exoplayer/DecoderInfo;

    move-result-object v0

    return-object v0
.end method

.method protected getDequeueOutputBufferTimeoutUs()J
    .registers 3

    .prologue
    .line 809
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected final getSourceState()I
    .registers 2

    .prologue
    .line 796
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    return v0
.end method

.method protected abstract handlesTrack(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation
.end method

.method protected final handlesTrack(Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 3
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handlesTrack(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v0

    return v0
.end method

.method protected final haveFormat()Z
    .registers 2

    .prologue
    .line 400
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected isEnded()Z
    .registers 2

    .prologue
    .line 780
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .registers 2

    .prologue
    .line 785
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_18

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-nez v0, :cond_18

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    if-nez v0, :cond_16

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_16

    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->isWithinHotswapPeriod()Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method protected final maybeInitCodec()V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 311
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldInitCodec()Z

    move-result v0

    if-nez v0, :cond_7

    .line 383
    :cond_6
    :goto_6
    return-void

    .line 315
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v12, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 316
    .local v12, "mimeType":Ljava/lang/String;
    const/4 v11, 0x0

    .line 317
    .local v11, "mediaCrypto":Landroid/media/MediaCrypto;
    const/4 v13, 0x0

    .line 318
    .local v13, "requiresSecureDecoder":Z
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    if-eqz v0, :cond_51

    .line 319
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    if-nez v0, :cond_1d

    .line 320
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    const-string v4, "Media requires a DrmSessionManager"

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_1d
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v0, :cond_2b

    .line 323
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    invoke-interface {v0, v4}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->open(Lcom/google/android/exoplayer/drm/DrmInitData;)V

    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    .line 326
    :cond_2b
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v9

    .line 327
    .local v9, "drmSessionState":I
    if-nez v9, :cond_3f

    .line 328
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v4}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 329
    :cond_3f
    const/4 v0, 0x3

    if-eq v9, v0, :cond_45

    const/4 v0, 0x4

    if-ne v9, v0, :cond_6

    .line 331
    :cond_45
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getMediaCrypto()Landroid/media/MediaCrypto;

    move-result-object v11

    .line 332
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0, v12}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->requiresSecureDecoderComponent(Ljava/lang/String;)Z

    move-result v13

    .line 339
    .end local v9    # "drmSessionState":I
    :cond_51
    const/4 v8, 0x0

    .line 341
    .local v8, "decoderInfo":Lcom/google/android/exoplayer/DecoderInfo;
    :try_start_52
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {p0, v0, v4, v13}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDecoderInfo(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;Z)Lcom/google/android/exoplayer/DecoderInfo;
    :try_end_59
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_52 .. :try_end_59} :catch_107

    move-result-object v8

    .line 347
    :goto_5a
    if-nez v8, :cond_6a

    .line 348
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const/4 v5, 0x0

    const v14, -0xc34f

    invoke-direct {v0, v4, v5, v13, v14}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZI)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 352
    :cond_6a
    iget-object v1, v8, Lcom/google/android/exoplayer/DecoderInfo;->name:Ljava/lang/String;

    .line 353
    .local v1, "codecName":Ljava/lang/String;
    iget-boolean v0, v8, Lcom/google/android/exoplayer/DecoderInfo;->adaptive:Z

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 354
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    .line 355
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    .line 356
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    .line 358
    :try_start_82
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 359
    .local v6, "codecInitializingTimestamp":J
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createByCodecName("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 360
    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 361
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 362
    const-string v0, "configureCodec"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 363
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-boolean v4, v8, Lcom/google/android/exoplayer/DecoderInfo;->adaptive:Z

    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {p0, v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getFrameworkMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)Landroid/media/MediaFormat;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5, v11}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->configureCodec(Landroid/media/MediaCodec;ZLandroid/media/MediaFormat;Landroid/media/MediaCrypto;)V

    .line 364
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 365
    const-string v0, "codec.start()"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 367
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 368
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 369
    .local v2, "codecInitializedTimestamp":J
    sub-long v4, v2, v6

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyDecoderInitialized(Ljava/lang/String;JJ)V

    .line 371
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 372
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_e7} :catch_117

    .line 377
    .end local v2    # "codecInitializedTimestamp":J
    .end local v6    # "codecInitializingTimestamp":J
    :goto_e7
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getState()I

    move-result v0

    const/4 v4, 0x3

    if-ne v0, v4, :cond_123

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    :goto_f2
    iput-wide v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 379
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 380
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 381
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 382
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v4, v0, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v0, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    goto/16 :goto_6

    .line 342
    .end local v1    # "codecName":Ljava/lang/String;
    :catch_107
    move-exception v10

    .line 343
    .local v10, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const v5, -0xc34e

    invoke-direct {v0, v4, v10, v13, v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZI)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto/16 :goto_5a

    .line 373
    .end local v10    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    .restart local v1    # "codecName":Ljava/lang/String;
    :catch_117
    move-exception v10

    .line 374
    .local v10, "e":Ljava/lang/Exception;
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {v0, v4, v10, v13, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto :goto_e7

    .line 377
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_123
    const-wide/16 v4, -0x1

    goto :goto_f2
.end method

.method protected onDisabled()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 405
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 406
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 408
    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_1d

    .line 411
    :try_start_8
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v0, :cond_14

    .line 412
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 413
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_14
    .catchall {:try_start_8 .. :try_end_14} :catchall_18

    .line 416
    :cond_14
    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    .line 419
    return-void

    .line 416
    :catchall_18
    move-exception v0

    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    throw v0

    .line 410
    :catchall_1d
    move-exception v0

    .line 411
    :try_start_1e
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v1, :cond_2a

    .line 412
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v1}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 413
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_2a
    .catchall {:try_start_1e .. :try_end_2a} :catchall_2e

    .line 416
    :cond_2a
    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    throw v0

    :catchall_2e
    move-exception v0

    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    throw v0
.end method

.method protected onDiscontinuity(J)V
    .registers 4
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 454
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 455
    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 456
    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 457
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_e

    .line 458
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->flushCodec()V

    .line 460
    :cond_e
    return-void
.end method

.method protected onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V
    .registers 7
    .param p1, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 716
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 717
    .local v0, "oldFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 718
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 719
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v1, :cond_20

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {p0, v1, v2, v0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 720
    iput-boolean v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 721
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 732
    :goto_1f
    return-void

    .line 723
    :cond_20
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHasQueuedBuffers:Z

    if-eqz v1, :cond_27

    .line 725
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    goto :goto_1f

    .line 728
    :cond_27
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 729
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    goto :goto_1f
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaFormat;)V
    .registers 2
    .param p1, "outputFormat"    # Landroid/media/MediaFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 745
    return-void
.end method

.method protected onOutputStreamEnded()V
    .registers 1

    .prologue
    .line 756
    return-void
.end method

.method protected onStarted()V
    .registers 1

    .prologue
    .line 465
    return-void
.end method

.method protected onStopped()V
    .registers 1

    .prologue
    .line 470
    return-void
.end method

.method protected abstract processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method protected releaseCodec()V
    .registers 6

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 422
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_40

    .line 423
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 424
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 425
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 426
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 427
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 428
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 429
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 430
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 431
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHasQueuedBuffers:Z

    .line 432
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 433
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    .line 434
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    .line 435
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    .line 436
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 437
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 438
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 439
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    .line 441
    :try_start_34
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_39
    .catchall {:try_start_34 .. :try_end_39} :catchall_45

    .line 444
    :try_start_39
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_3e
    .catchall {:try_start_39 .. :try_end_3e} :catchall_41

    .line 446
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 450
    :cond_40
    return-void

    .line 446
    :catchall_41
    move-exception v0

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    .line 443
    :catchall_45
    move-exception v0

    .line 444
    :try_start_46
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_4b
    .catchall {:try_start_46 .. :try_end_4b} :catchall_4e

    .line 446
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    :catchall_4e
    move-exception v0

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0
.end method

.method protected shouldInitCodec()Z
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
