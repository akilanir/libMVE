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

.field private codecHotswapTimeMs:J

.field private codecIsAdaptive:Z

.field private codecNeedsDiscardToSpsWorkaround:Z

.field private codecNeedsEosFlushWorkaround:Z

.field private codecNeedsEosPropagationWorkaround:Z

.field private codecNeedsFlushWorkaround:Z

.field private codecNeedsMonoChannelCountWorkaround:Z

.field private codecReceivedBuffers:Z

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
    .registers 14
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p3, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p4, "playClearSamplesWithoutKeys"    # Z
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .prologue
    .line 253
    const/4 v0, 0x1

    new-array v1, v0, [Lcom/google/android/exoplayer/SampleSource;

    const/4 v0, 0x0

    aput-object p1, v1, v0

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V

    .line 255
    return-void
.end method

.method public constructor <init>([Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V
    .registers 10
    .param p1, "sources"    # [Lcom/google/android/exoplayer/SampleSource;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p3, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p4, "playClearSamplesWithoutKeys"    # Z
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .prologue
    const/4 v1, 0x0

    .line 274
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;-><init>([Lcom/google/android/exoplayer/SampleSource;)V

    .line 275
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_4c

    const/4 v0, 0x1

    :goto_b
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 276
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/MediaCodecSelector;

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    .line 277
    iput-object p3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    .line 278
    iput-boolean p4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    .line 279
    iput-object p5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    .line 280
    iput-object p6, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .line 281
    invoke-static {}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround:Z

    .line 282
    new-instance v0, Lcom/google/android/exoplayer/CodecCounters;

    invoke-direct {v0}, Lcom/google/android/exoplayer/CodecCounters;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    .line 283
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 284
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    .line 286
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 287
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 288
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 289
    return-void

    :cond_4c
    move v0, v1

    .line 275
    goto :goto_b
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;)Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    return-object v0
.end method

.method private static codecNeedsDiscardToSpsWorkaround(Ljava/lang/String;Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "format"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 1041
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_18

    iget-object v0, p1, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "OMX.MTK.VIDEO.DECODER.AVC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method private static codecNeedsEosFlushWorkaround(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1073
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
    .line 1058
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

    .line 1023
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

.method private static codecNeedsMonoChannelCountWorkaround(Ljava/lang/String;Lcom/google/android/exoplayer/MediaFormat;)Z
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "format"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    const/4 v0, 0x1

    .line 1090
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x12

    if-gt v1, v2, :cond_14

    iget v1, p1, Lcom/google/android/exoplayer/MediaFormat;->channelCount:I

    if-ne v1, v0, :cond_14

    const-string v1, "OMX.MTK.AUDIO.DECODER.MP3"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private static deviceNeedsAutoFrcWorkaround()Z
    .registers 2

    .prologue
    .line 1109
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
    .line 884
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    if-eqz v0, :cond_6

    .line 885
    const/4 v0, 0x0

    .line 924
    :goto_5
    return v0

    .line 888
    :cond_6
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_18

    .line 889
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDequeueOutputBufferTimeoutUs()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 892
    :cond_18
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_22

    .line 893
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processOutputFormat()V

    .line 894
    const/4 v0, 0x1

    goto :goto_5

    .line 895
    :cond_22
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v1, -0x3

    if-ne v0, v1, :cond_39

    .line 896
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 897
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    .line 898
    const/4 v0, 0x1

    goto :goto_5

    .line 899
    :cond_39
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_51

    .line 900
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v0, :cond_4f

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    if-nez v0, :cond_4a

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4f

    .line 902
    :cond_4a
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 903
    const/4 v0, 0x1

    goto :goto_5

    .line 905
    :cond_4f
    const/4 v0, 0x0

    goto :goto_5

    .line 908
    :cond_51
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_5e

    .line 909
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 910
    const/4 v0, 0x0

    goto :goto_5

    .line 913
    :cond_5e
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDecodeOnlyIndex(J)I

    move-result v10

    .line 914
    .local v10, "decodeOnlyIndex":I
    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    aget-object v6, v0, v1

    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v0, -0x1

    if-eq v10, v0, :cond_94

    const/4 v9, 0x1

    :goto_76
    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-virtual/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z

    move-result v0

    if-eqz v0, :cond_96

    .line 916
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onProcessedOutputBuffer(J)V

    .line 917
    const/4 v0, -0x1

    if-eq v10, v0, :cond_8e

    .line 918
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 920
    :cond_8e
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 921
    const/4 v0, 0x1

    goto/16 :goto_5

    .line 914
    :cond_94
    const/4 v9, 0x0

    goto :goto_76

    .line 924
    :cond_96
    const/4 v0, 0x0

    goto/16 :goto_5
.end method

.method private feedInputBuffer(JZ)Z
    .registers 29
    .param p1, "positionUs"    # J
    .param p3, "firstFeed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 565
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    if-nez v3, :cond_d

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_f

    .line 569
    :cond_d
    const/4 v3, 0x0

    .line 706
    :goto_e
    return v3

    .line 572
    :cond_f
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v3, :cond_42

    .line 573
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    const-wide/16 v9, 0x0

    invoke-virtual {v3, v9, v10}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 574
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v3, :cond_2b

    .line 575
    const/4 v3, 0x0

    goto :goto_e

    .line 577
    :cond_2b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    aget-object v6, v6, v9

    iput-object v6, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    .line 578
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 581
    :cond_42
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v6, 0x1

    if-ne v3, v6, :cond_71

    .line 584
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v3, :cond_56

    .line 591
    :goto_4f
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 592
    const/4 v3, 0x0

    goto :goto_e

    .line 587
    :cond_56
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 588
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x4

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 589
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    goto :goto_4f

    .line 596
    :cond_71
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v3, :cond_80

    .line 598
    const/16 v24, -0x3

    .line 615
    .local v24, "result":I
    :cond_79
    :goto_79
    const/4 v3, -0x2

    move/from16 v0, v24

    if-ne v0, v3, :cond_dc

    .line 616
    const/4 v3, 0x0

    goto :goto_e

    .line 602
    .end local v24    # "result":I
    :cond_80
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v6, 0x1

    if-ne v3, v6, :cond_b8

    .line 603
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_89
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v3, v3, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v23

    if-ge v0, v3, :cond_b3

    .line 604
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v3, v3, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move/from16 v0, v23

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [B

    .line 605
    .local v21, "data":[B
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 603
    add-int/lit8 v23, v23, 0x1

    goto :goto_89

    .line 607
    .end local v21    # "data":[B
    :cond_b3
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 609
    .end local v23    # "i":I
    :cond_b8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2, v3, v6}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v24

    .line 610
    .restart local v24    # "result":I
    if-eqz p3, :cond_79

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    const/4 v6, 0x1

    if-ne v3, v6, :cond_79

    const/4 v3, -0x2

    move/from16 v0, v24

    if-ne v0, v3, :cond_79

    .line 611
    const/4 v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    goto :goto_79

    .line 618
    :cond_dc
    const/4 v3, -0x4

    move/from16 v0, v24

    if-ne v0, v3, :cond_100

    .line 619
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_f4

    .line 622
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 623
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 625
    :cond_f4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 626
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 628
    :cond_100
    const/4 v3, -0x1

    move/from16 v0, v24

    if-ne v0, v3, :cond_15d

    .line 629
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_118

    .line 633
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 634
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 636
    :cond_118
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 637
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedBuffers:Z

    if-nez v3, :cond_129

    .line 638
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processEndOfStream()V

    .line 639
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 642
    :cond_129
    :try_start_129
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    if-eqz v3, :cond_132

    .line 653
    :goto_12f
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 645
    :cond_132
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 646
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const/4 v9, 0x4

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 647
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I
    :try_end_14c
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_129 .. :try_end_14c} :catch_14d

    goto :goto_12f

    .line 649
    :catch_14d
    move-exception v22

    .line 650
    .local v22, "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 651
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v22

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 655
    .end local v22    # "e":Landroid/media/MediaCodec$CryptoException;
    :cond_15d
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    if-eqz v3, :cond_188

    .line 658
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isSyncFrame()Z

    move-result v3

    if-nez v3, :cond_183

    .line 659
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->clearData()V

    .line 660
    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_180

    .line 663
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 665
    :cond_180
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 667
    :cond_183
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 669
    :cond_188
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isEncrypted()Z

    move-result v8

    .line 670
    .local v8, "sampleEncrypted":Z
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldWaitForKeys(Z)Z

    move-result v3

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 671
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v3, :cond_1a3

    .line 672
    const/4 v3, 0x0

    goto/16 :goto_e

    .line 674
    :cond_1a3
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsDiscardToSpsWorkaround:Z

    if-eqz v3, :cond_1c8

    if-nez v8, :cond_1c8

    .line 675
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/google/android/exoplayer/util/NalUnitUtil;->discardToSps(Ljava/nio/ByteBuffer;)V

    .line 676
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    if-nez v3, :cond_1c3

    .line 677
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 679
    :cond_1c3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsDiscardToSpsWorkaround:Z

    .line 682
    :cond_1c8
    :try_start_1c8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v3, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    .line 683
    .local v7, "bufferSize":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v3, v3, Lcom/google/android/exoplayer/SampleHolder;->size:I

    sub-int v20, v7, v3

    .line 684
    .local v20, "adaptiveReconfigurationBytes":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v4, v3, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 685
    .local v4, "presentationTimeUs":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/SampleHolder;->isDecodeOnly()Z

    move-result v3

    if-eqz v3, :cond_1f5

    .line 686
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 689
    :cond_1f5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v6, v3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onQueuedInputBuffer(JLjava/nio/ByteBuffer;IZ)V

    .line 691
    if-eqz v8, :cond_236

    .line 692
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move/from16 v0, v20

    invoke-static {v3, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v12

    .line 694
    .local v12, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v11, 0x0

    const/4 v15, 0x0

    move-wide v13, v4

    invoke-virtual/range {v9 .. v15}, Landroid/media/MediaCodec;->queueSecureInputBuffer(IILandroid/media/MediaCodec$CryptoInfo;JI)V

    .line 698
    .end local v12    # "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    :goto_21a
    const/4 v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 699
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedBuffers:Z

    .line 700
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 701
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v6, v3, Lcom/google/android/exoplayer/CodecCounters;->inputBufferCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v3, Lcom/google/android/exoplayer/CodecCounters;->inputBufferCount:I

    .line 706
    const/4 v3, 0x1

    goto/16 :goto_e

    .line 696
    :cond_236
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v15, 0x0

    const/16 v19, 0x0

    move/from16 v16, v7

    move-wide/from16 v17, v4

    invoke-virtual/range {v13 .. v19}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_248
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_1c8 .. :try_end_248} :catch_249

    goto :goto_21a

    .line 702
    .end local v4    # "presentationTimeUs":J
    .end local v7    # "bufferSize":I
    .end local v20    # "adaptiveReconfigurationBytes":I
    :catch_249
    move-exception v22

    .line 703
    .restart local v22    # "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 704
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v22

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

    .line 529
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 530
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 531
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 532
    iput-boolean v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 533
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 534
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 535
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    if-nez v0, :cond_20

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    if-eqz v0, :cond_31

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    if-eqz v0, :cond_31

    .line 537
    :cond_20
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 538
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 549
    :goto_26
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_30

    .line 552
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 554
    :cond_30
    return-void

    .line 539
    :cond_31
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    if-eqz v0, :cond_3c

    .line 542
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 543
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    goto :goto_26

    .line 546
    :cond_3c
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 547
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedBuffers:Z

    goto :goto_26
.end method

.method private getDecodeOnlyIndex(J)I
    .registers 7
    .param p1, "presentationTimeUs"    # J

    .prologue
    .line 1004
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 1005
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1d

    .line 1006
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-nez v2, :cond_1a

    .line 1010
    .end local v0    # "i":I
    :goto_19
    return v0

    .line 1005
    .restart local v0    # "i":I
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1010
    :cond_1d
    const/4 v0, -0x1

    goto :goto_19
.end method

.method private static getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;
    .registers 6
    .param p0, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p1, "adaptiveReconfigurationBytes"    # I

    .prologue
    .line 711
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/CryptoInfo;->getFrameworkCryptoInfoV16()Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v0

    .line 712
    .local v0, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    if-nez p1, :cond_9

    .line 722
    :goto_8
    return-object v0

    .line 718
    :cond_9
    iget-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    if-nez v1, :cond_12

    .line 719
    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    .line 721
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
    .line 726
    invoke-virtual {p1}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v0

    .line 727
    .local v0, "mediaFormat":Landroid/media/MediaFormat;
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->deviceNeedsAutoFrcWorkaround:Z

    if-eqz v1, :cond_e

    .line 728
    const-string v1, "auto-frc"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 730
    :cond_e
    return-object v0
.end method

.method private isWithinHotswapPeriod()Z
    .registers 7

    .prologue
    .line 865
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
    .line 413
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 414
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V
    .registers 4
    .param p1, "e"    # Landroid/media/MediaCodec$CryptoException;

    .prologue
    .line 980
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_12

    .line 981
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Landroid/media/MediaCodec$CryptoException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 988
    :cond_12
    return-void
.end method

.method private notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .registers 4
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    .prologue
    .line 969
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_12

    .line 970
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 977
    :cond_12
    return-void
.end method

.method private notifyDecoderInitialized(Ljava/lang/String;JJ)V
    .registers 14
    .param p1, "decoderName"    # Ljava/lang/String;
    .param p2, "initializedTimestamp"    # J
    .param p4, "initializationDuration"    # J

    .prologue
    .line 992
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_16

    .line 993
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$3;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$3;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Ljava/lang/String;JJ)V

    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1001
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
    .line 958
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 960
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 961
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 966
    :goto_b
    return-void

    .line 963
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 964
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onOutputStreamEnded()V

    goto :goto_b
.end method

.method private processOutputFormat()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 933
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    .line 934
    .local v0, "format":Landroid/media/MediaFormat;
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsMonoChannelCountWorkaround:Z

    if-eqz v1, :cond_10

    .line 935
    const-string v1, "channel-count"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 937
    :cond_10
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onOutputFormatChanged(Landroid/media/MediaFormat;)V

    .line 938
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    .line 939
    return-void
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
    .line 522
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    const/4 v2, 0x0

    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v0

    .line 523
    .local v0, "result":I
    const/4 v1, -0x4

    if-ne v0, v1, :cond_f

    .line 524
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 526
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

    .line 734
    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v2, :cond_6

    .line 745
    :cond_5
    :goto_5
    return v1

    .line 737
    :cond_6
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v0

    .line 738
    .local v0, "drmManagerState":I
    if-nez v0, :cond_1a

    .line 739
    new-instance v1, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 741
    :cond_1a
    const/4 v2, 0x4

    if-eq v0, v2, :cond_5

    if-nez p1, :cond_23

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    if-nez v2, :cond_5

    .line 743
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
    .line 840
    const/4 v0, 0x0

    return v0
.end method

.method protected final codecInitialized()Z
    .registers 2

    .prologue
    .line 422
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

    .line 503
    if-eqz p5, :cond_3c

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    if-nez v0, :cond_39

    move v0, v1

    :goto_9
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 506
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-nez v0, :cond_12

    .line 507
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readFormat(J)V

    .line 509
    :cond_12
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 510
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_33

    .line 511
    const-string v0, "drainAndFeed"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 512
    :cond_1e
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drainOutputBuffer(JJ)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 513
    invoke-direct {p0, p1, p2, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(JZ)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 514
    :cond_2a
    invoke-direct {p0, p1, p2, v2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(JZ)Z

    move-result v0

    if-nez v0, :cond_2a

    .line 516
    :cond_30
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 518
    :cond_33
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/CodecCounters;->ensureUpdated()V

    .line 519
    return-void

    .line 503
    :cond_39
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    goto :goto_9

    :cond_3c
    move v0, v2

    goto :goto_9
.end method

.method protected getDecoderInfo(Lcom/google/android/exoplayer/MediaCodecSelector;Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;
    .registers 5
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer/MediaCodecSelector;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "requiresSecureDecoder"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 319
    invoke-interface {p1, p2, p3}, Lcom/google/android/exoplayer/MediaCodecSelector;->getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;

    move-result-object v0

    return-object v0
.end method

.method protected getDequeueOutputBufferTimeoutUs()J
    .registers 3

    .prologue
    .line 874
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected final getSourceState()I
    .registers 2

    .prologue
    .line 861
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
    .line 293
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handlesTrack(Lcom/google/android/exoplayer/MediaCodecSelector;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v0

    return v0
.end method

.method protected final haveFormat()Z
    .registers 2

    .prologue
    .line 426
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
    .line 845
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .registers 2

    .prologue
    .line 850
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
    .line 335
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldInitCodec()Z

    move-result v0

    if-nez v0, :cond_7

    .line 409
    :cond_6
    :goto_6
    return-void

    .line 339
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v12, v0, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 340
    .local v12, "mimeType":Ljava/lang/String;
    const/4 v11, 0x0

    .line 341
    .local v11, "mediaCrypto":Landroid/media/MediaCrypto;
    const/4 v13, 0x0

    .line 342
    .local v13, "requiresSecureDecoder":Z
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    if-eqz v0, :cond_51

    .line 343
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    if-nez v0, :cond_1d

    .line 344
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    const-string v4, "Media requires a DrmSessionManager"

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_1d
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v0, :cond_2b

    .line 347
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    invoke-interface {v0, v4}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->open(Lcom/google/android/exoplayer/drm/DrmInitData;)V

    .line 348
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    .line 350
    :cond_2b
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v9

    .line 351
    .local v9, "drmSessionState":I
    if-nez v9, :cond_3f

    .line 352
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v4}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 353
    :cond_3f
    const/4 v0, 0x3

    if-eq v9, v0, :cond_45

    const/4 v0, 0x4

    if-ne v9, v0, :cond_6

    .line 355
    :cond_45
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getMediaCrypto()Landroid/media/MediaCrypto;

    move-result-object v11

    .line 356
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0, v12}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->requiresSecureDecoderComponent(Ljava/lang/String;)Z

    move-result v13

    .line 363
    .end local v9    # "drmSessionState":I
    :cond_51
    const/4 v8, 0x0

    .line 365
    .local v8, "decoderInfo":Lcom/google/android/exoplayer/DecoderInfo;
    :try_start_52
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->mediaCodecSelector:Lcom/google/android/exoplayer/MediaCodecSelector;

    invoke-virtual {p0, v0, v12, v13}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDecoderInfo(Lcom/google/android/exoplayer/MediaCodecSelector;Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;
    :try_end_57
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_52 .. :try_end_57} :catch_115

    move-result-object v8

    .line 371
    :goto_58
    if-nez v8, :cond_68

    .line 372
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const/4 v5, 0x0

    const v14, -0xc34f

    invoke-direct {v0, v4, v5, v13, v14}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZI)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 376
    :cond_68
    iget-object v1, v8, Lcom/google/android/exoplayer/DecoderInfo;->name:Ljava/lang/String;

    .line 377
    .local v1, "codecName":Ljava/lang/String;
    iget-boolean v0, v8, Lcom/google/android/exoplayer/DecoderInfo;->adaptive:Z

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 378
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-static {v1, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsDiscardToSpsWorkaround(Ljava/lang/String;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsDiscardToSpsWorkaround:Z

    .line 379
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    .line 380
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    .line 381
    invoke-static {v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    .line 382
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-static {v1, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsMonoChannelCountWorkaround(Ljava/lang/String;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsMonoChannelCountWorkaround:Z

    .line 384
    :try_start_90
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 385
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

    .line 386
    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 387
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 388
    const-string v0, "configureCodec"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 389
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-boolean v4, v8, Lcom/google/android/exoplayer/DecoderInfo;->adaptive:Z

    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {p0, v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getFrameworkMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)Landroid/media/MediaFormat;

    move-result-object v5

    invoke-virtual {p0, v0, v4, v5, v11}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->configureCodec(Landroid/media/MediaCodec;ZLandroid/media/MediaFormat;Landroid/media/MediaCrypto;)V

    .line 390
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 391
    const-string v0, "codec.start()"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 392
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 393
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 394
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 395
    .local v2, "codecInitializedTimestamp":J
    sub-long v4, v2, v6

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyDecoderInitialized(Ljava/lang/String;JJ)V

    .line 397
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 398
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_f5
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_f5} :catch_125

    .line 403
    .end local v2    # "codecInitializedTimestamp":J
    .end local v6    # "codecInitializingTimestamp":J
    :goto_f5
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getState()I

    move-result v0

    const/4 v4, 0x3

    if-ne v0, v4, :cond_131

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    :goto_100
    iput-wide v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 405
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 406
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 407
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 408
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v4, v0, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v0, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    goto/16 :goto_6

    .line 366
    .end local v1    # "codecName":Ljava/lang/String;
    :catch_115
    move-exception v10

    .line 367
    .local v10, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const v5, -0xc34e

    invoke-direct {v0, v4, v10, v13, v5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZI)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto/16 :goto_58

    .line 399
    .end local v10    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    .restart local v1    # "codecName":Ljava/lang/String;
    :catch_125
    move-exception v10

    .line 400
    .local v10, "e":Ljava/lang/Exception;
    new-instance v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {v0, v4, v10, v13, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;ZLjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto :goto_f5

    .line 403
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_131
    const-wide/16 v4, -0x1

    goto :goto_100
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

    .line 431
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 432
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 434
    :try_start_5
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_1d

    .line 437
    :try_start_8
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v0, :cond_14

    .line 438
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 439
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_14
    .catchall {:try_start_8 .. :try_end_14} :catchall_18

    .line 442
    :cond_14
    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    .line 445
    return-void

    .line 442
    :catchall_18
    move-exception v0

    invoke-super {p0}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDisabled()V

    throw v0

    .line 436
    :catchall_1d
    move-exception v0

    .line 437
    :try_start_1e
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v1, :cond_2a

    .line 438
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v1}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 439
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_2a
    .catchall {:try_start_1e .. :try_end_2a} :catchall_2e

    .line 442
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

    .line 482
    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 483
    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 484
    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 485
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_e

    .line 486
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->flushCodec()V

    .line 488
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

    .line 755
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 756
    .local v0, "oldFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 757
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Lcom/google/android/exoplayer/drm/DrmInitData;

    .line 758
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v1, :cond_20

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {p0, v1, v2, v0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 759
    iput-boolean v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 760
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 771
    :goto_1f
    return-void

    .line 762
    :cond_20
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedBuffers:Z

    if-eqz v1, :cond_27

    .line 764
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    goto :goto_1f

    .line 767
    :cond_27
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 768
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
    .line 784
    return-void
.end method

.method protected onOutputStreamEnded()V
    .registers 1

    .prologue
    .line 795
    return-void
.end method

.method protected onProcessedOutputBuffer(J)V
    .registers 3
    .param p1, "presentationTimeUs"    # J

    .prologue
    .line 821
    return-void
.end method

.method protected onQueuedInputBuffer(JLjava/nio/ByteBuffer;IZ)V
    .registers 6
    .param p1, "presentationTimeUs"    # J
    .param p3, "buffer"    # Ljava/nio/ByteBuffer;
    .param p4, "bufferSize"    # I
    .param p5, "sampleEncrypted"    # Z

    .prologue
    .line 810
    return-void
.end method

.method protected onStarted()V
    .registers 1

    .prologue
    .line 493
    return-void
.end method

.method protected onStopped()V
    .registers 1

    .prologue
    .line 498
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

    .line 448
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_44

    .line 449
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 450
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 451
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 452
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 453
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 454
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 455
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 456
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 457
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedBuffers:Z

    .line 458
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 459
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsDiscardToSpsWorkaround:Z

    .line 460
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsFlushWorkaround:Z

    .line 461
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosPropagationWorkaround:Z

    .line 462
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsEosFlushWorkaround:Z

    .line 463
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecNeedsMonoChannelCountWorkaround:Z

    .line 464
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReceivedEos:Z

    .line 465
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 466
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReinitializationState:I

    .line 467
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    .line 469
    :try_start_38
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_3d
    .catchall {:try_start_38 .. :try_end_3d} :catchall_49

    .line 472
    :try_start_3d
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_42
    .catchall {:try_start_3d .. :try_end_42} :catchall_45

    .line 474
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 478
    :cond_44
    return-void

    .line 474
    :catchall_45
    move-exception v0

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    .line 471
    :catchall_49
    move-exception v0

    .line 472
    :try_start_4a
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_4f
    .catchall {:try_start_4a .. :try_end_4f} :catchall_52

    .line 474
    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    :catchall_52
    move-exception v0

    iput-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0
.end method

.method protected shouldInitCodec()Z
    .registers 2

    .prologue
    .line 418
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
