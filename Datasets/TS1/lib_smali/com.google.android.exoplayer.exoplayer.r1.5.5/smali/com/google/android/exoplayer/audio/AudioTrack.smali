.class public final Lcom/google/android/exoplayer/audio/AudioTrack;
.super Ljava/lang/Object;
.source "AudioTrack.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;,
        Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;,
        Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;,
        Lcom/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException;,
        Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;,
        Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
    }
.end annotation


# static fields
.field private static final BUFFER_MULTIPLICATION_FACTOR:I = 0x4

.field public static final CURRENT_POSITION_NOT_SET:J = -0x8000000000000000L

.field private static final MAX_AUDIO_TIMESTAMP_OFFSET_US:J = 0x4c4b40L

.field private static final MAX_BUFFER_DURATION_US:J = 0xb71b0L

.field private static final MAX_LATENCY_US:J = 0x4c4b40L

.field private static final MAX_PLAYHEAD_OFFSET_COUNT:I = 0xa

.field private static final MIN_BUFFER_DURATION_US:J = 0x3d090L

.field private static final MIN_PLAYHEAD_OFFSET_SAMPLE_INTERVAL_US:I = 0x7530

.field private static final MIN_TIMESTAMP_SAMPLE_INTERVAL_US:I = 0x7a120

.field private static final PASSTHROUGH_BUFFER_DURATION_US:J = 0x3d090L

.field public static final RESULT_BUFFER_CONSUMED:I = 0x2

.field public static final RESULT_POSITION_DISCONTINUITY:I = 0x1

.field public static final SESSION_ID_NOT_SET:I = 0x0

.field private static final START_IN_SYNC:I = 0x1

.field private static final START_NEED_SYNC:I = 0x2

.field private static final START_NOT_SET:I = 0x0

.field private static final TAG:Ljava/lang/String; = "AudioTrack"

.field public static enablePreV21AudioSessionWorkaround:Z

.field public static failOnSpuriousAudioTimestamp:Z


# instance fields
.field private final audioCapabilities:Lcom/google/android/exoplayer/audio/AudioCapabilities;

.field private audioTimestampSet:Z

.field private audioTrack:Landroid/media/AudioTrack;

.field private final audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

.field private bufferBytesRemaining:I

.field private bufferSize:I

.field private bufferSizeUs:J

.field private channelConfig:I

.field private encoding:I

.field private framesPerEncodedSample:I

.field private getLatencyMethod:Ljava/lang/reflect/Method;

.field private keepSessionIdAudioTrack:Landroid/media/AudioTrack;

.field private lastPlayheadSampleTimeUs:J

.field private lastTimestampSampleTimeUs:J

.field private latencyUs:J

.field private nextPlayheadOffsetIndex:I

.field private passthrough:Z

.field private pcmFrameSize:I

.field private playheadOffsetCount:I

.field private final playheadOffsets:[J

.field private final releasingConditionVariable:Landroid/os/ConditionVariable;

.field private resumeSystemTimeUs:J

.field private sampleRate:I

.field private smoothedPlayheadOffsetUs:J

.field private startMediaTimeState:I

.field private startMediaTimeUs:J

.field private final streamType:I

.field private submittedEncodedFrames:J

.field private submittedPcmBytes:J

.field private temporaryBuffer:[B

.field private temporaryBufferOffset:I

.field private volume:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 179
    sput-boolean v0, Lcom/google/android/exoplayer/audio/AudioTrack;->enablePreV21AudioSessionWorkaround:Z

    .line 188
    sput-boolean v0, Lcom/google/android/exoplayer/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 235
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;-><init>(Lcom/google/android/exoplayer/audio/AudioCapabilities;I)V

    .line 236
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/audio/AudioCapabilities;I)V
    .registers 7
    .param p1, "audioCapabilities"    # Lcom/google/android/exoplayer/audio/AudioCapabilities;
    .param p2, "streamType"    # I

    .prologue
    const/4 v3, 0x0

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 245
    iput-object p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer/audio/AudioCapabilities;

    .line 246
    iput p2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->streamType:I

    .line 247
    new-instance v0, Landroid/os/ConditionVariable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    .line 248
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_23

    .line 250
    :try_start_16
    const-class v1, Landroid/media/AudioTrack;

    const-string v2, "getLatency"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;
    :try_end_23
    .catch Ljava/lang/NoSuchMethodException; {:try_start_16 .. :try_end_23} :catch_54

    .line 256
    :cond_23
    :goto_23
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_3e

    .line 257
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;

    invoke-direct {v0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    .line 263
    :goto_30
    const/16 v0, 0xa

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    .line 264
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    .line 265
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 266
    return-void

    .line 258
    :cond_3e
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_4c

    .line 259
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;

    invoke-direct {v0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    goto :goto_30

    .line 261
    :cond_4c
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;-><init>(Lcom/google/android/exoplayer/audio/AudioTrack$1;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    goto :goto_30

    .line 252
    :catch_54
    move-exception v0

    goto :goto_23
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/audio/AudioTrack;)Landroid/os/ConditionVariable;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/audio/AudioTrack;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method private checkAudioTrackInitialized()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 890
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    .line 891
    .local v0, "state":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 892
    return-void

    .line 896
    :cond_b
    :try_start_b
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_10} :catch_1e
    .catchall {:try_start_b .. :try_end_10} :catchall_22

    .line 901
    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 904
    :goto_12
    new-instance v1, Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;-><init>(IIII)V

    throw v1

    .line 897
    :catch_1e
    move-exception v1

    .line 901
    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_12

    :catchall_22
    move-exception v1

    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    throw v1
.end method

.method private durationUsToFrames(J)J
    .registers 7
    .param p1, "durationUs"    # J

    .prologue
    .line 916
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    int-to-long v0, v0

    mul-long/2addr v0, p1

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private framesToDurationUs(J)J
    .registers 7
    .param p1, "frameCount"    # J

    .prologue
    .line 912
    const-wide/32 v0, 0xf4240

    mul-long/2addr v0, p1

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private static getEncodingForMimeType(Ljava/lang/String;)I
    .registers 4
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 953
    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_3e

    :cond_9
    :goto_9
    packed-switch v1, :pswitch_data_50

    .line 963
    :goto_c
    return v0

    .line 953
    :sswitch_d
    const-string v2, "audio/ac3"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move v1, v0

    goto :goto_9

    :sswitch_17
    const-string v2, "audio/eac3"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x1

    goto :goto_9

    :sswitch_21
    const-string v2, "audio/vnd.dts"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x2

    goto :goto_9

    :sswitch_2b
    const-string v2, "audio/vnd.dts.hd"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/4 v1, 0x3

    goto :goto_9

    .line 955
    :pswitch_35
    const/4 v0, 0x5

    goto :goto_c

    .line 957
    :pswitch_37
    const/4 v0, 0x6

    goto :goto_c

    .line 959
    :pswitch_39
    const/4 v0, 0x7

    goto :goto_c

    .line 961
    :pswitch_3b
    const/16 v0, 0x8

    goto :goto_c

    .line 953
    :sswitch_data_3e
    .sparse-switch
        -0x41455b98 -> :sswitch_21
        0xb269698 -> :sswitch_d
        0x59ae0c65 -> :sswitch_17
        0x59c2dc42 -> :sswitch_2b
    .end sparse-switch

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_35
        :pswitch_37
        :pswitch_39
        :pswitch_3b
    .end packed-switch
.end method

.method private static getFramesPerEncodedSample(ILjava/nio/ByteBuffer;)I
    .registers 5
    .param p0, "encoding"    # I
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 968
    const/4 v0, 0x7

    if-eq p0, v0, :cond_7

    const/16 v0, 0x8

    if-ne p0, v0, :cond_c

    .line 969
    :cond_7
    invoke-static {p1}, Lcom/google/android/exoplayer/util/DtsUtil;->parseDtsAudioSampleCount(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 973
    :goto_b
    return v0

    .line 970
    :cond_c
    const/4 v0, 0x5

    if-ne p0, v0, :cond_14

    .line 971
    invoke-static {}, Lcom/google/android/exoplayer/util/Ac3Util;->getAc3SyncframeAudioSampleCount()I

    move-result v0

    goto :goto_b

    .line 972
    :cond_14
    const/4 v0, 0x6

    if-ne p0, v0, :cond_1c

    .line 973
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Ac3Util;->parseEAc3SyncframeAudioSampleCount(Ljava/nio/ByteBuffer;)I

    move-result v0

    goto :goto_b

    .line 975
    :cond_1c
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected audio encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getSubmittedFrames()J
    .registers 3

    .prologue
    .line 920
    iget-boolean v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-eqz v0, :cond_7

    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedEncodedFrames:J

    :goto_6
    return-wide v0

    :cond_7
    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedPcmBytes:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmBytesToFrames(J)J

    move-result-wide v0

    goto :goto_6
.end method

.method private hasCurrentPositionUs()Z
    .registers 2

    .prologue
    .line 795
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private maybeSampleSyncParams()V
    .registers 20

    .prologue
    .line 802
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v9

    .line 803
    .local v9, "playbackPositionUs":J
    const-wide/16 v13, 0x0

    cmp-long v13, v9, v13

    if-nez v13, :cond_f

    .line 880
    :cond_e
    :goto_e
    return-void

    .line 807
    :cond_f
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long v11, v13, v15

    .line 808
    .local v11, "systemClockUs":J
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    sub-long v13, v11, v13

    const-wide/16 v15, 0x7530

    cmp-long v13, v13, v15

    if-ltz v13, :cond_7d

    .line 810
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    sub-long v15, v9, v11

    aput-wide v15, v13, v14

    .line 811
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    add-int/lit8 v13, v13, 0x1

    rem-int/lit8 v13, v13, 0xa

    move-object/from16 v0, p0

    iput v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 812
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    const/16 v14, 0xa

    if-ge v13, v14, :cond_4d

    .line 813
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    .line 815
    :cond_4d
    move-object/from16 v0, p0

    iput-wide v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 816
    const-wide/16 v13, 0x0

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 817
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_58
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    if-ge v7, v13, :cond_7d

    .line 818
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    aget-wide v15, v15, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    div-long v15, v15, v17

    add-long/2addr v13, v15

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 817
    add-int/lit8 v7, v7, 0x1

    goto :goto_58

    .line 822
    .end local v7    # "i":I
    :cond_7d
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v13

    if-nez v13, :cond_e

    .line 828
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    sub-long v13, v11, v13

    const-wide/32 v15, 0x7a120

    cmp-long v13, v13, v15

    if-ltz v13, :cond_e

    .line 829
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->updateTimestamp()Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 830
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v13, :cond_c3

    .line 832
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long v4, v13, v15

    .line 833
    .local v4, "audioTimestampUs":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v2

    .line 834
    .local v2, "audioTimestampFramePosition":J
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->resumeSystemTimeUs:J

    cmp-long v13, v4, v13

    if-gez v13, :cond_132

    .line 836
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 860
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    :cond_c3
    :goto_c3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    if-eqz v13, :cond_12c

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-nez v13, :cond_12c

    .line 864
    :try_start_cf
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    const/4 v13, 0x0

    check-cast v13, [Ljava/lang/Object;

    invoke-virtual {v14, v15, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    const-wide/16 v15, 0x3e8

    mul-long/2addr v13, v15

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSizeUs:J

    sub-long/2addr v13, v15

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    .line 867
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    const-wide/16 v15, 0x0

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v13

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    .line 869
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    const-wide/32 v15, 0x4c4b40

    cmp-long v13, v13, v15

    if-lez v13, :cond_12c

    .line 870
    const-string v13, "AudioTrack"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Ignoring impossibly large audio latency: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 871
    const-wide/16 v13, 0x0

    move-object/from16 v0, p0

    iput-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_cf .. :try_end_12c} :catch_1df

    .line 878
    :cond_12c
    :goto_12c
    move-object/from16 v0, p0

    iput-wide v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    goto/16 :goto_e

    .line 837
    .restart local v2    # "audioTimestampFramePosition":J
    .restart local v4    # "audioTimestampUs":J
    :cond_132
    sub-long v13, v4, v11

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v13

    const-wide/32 v15, 0x4c4b40

    cmp-long v13, v13, v15

    if-lez v13, :cond_186

    .line 839
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Spurious audio timestamp (system clock mismatch): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 842
    .local v8, "message":Ljava/lang/String;
    sget-boolean v13, Lcom/google/android/exoplayer/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    if-eqz v13, :cond_17a

    .line 843
    new-instance v13, Lcom/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException;

    invoke-direct {v13, v8}, Lcom/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 845
    :cond_17a
    const-string v13, "AudioTrack"

    invoke-static {v13, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 846
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    goto/16 :goto_c3

    .line 847
    .end local v8    # "message":Ljava/lang/String;
    :cond_186
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v13

    sub-long/2addr v13, v9

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(J)J

    move-result-wide v13

    const-wide/32 v15, 0x4c4b40

    cmp-long v13, v13, v15

    if-lez v13, :cond_c3

    .line 850
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Spurious audio timestamp (frame position mismatch): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 853
    .restart local v8    # "message":Ljava/lang/String;
    sget-boolean v13, Lcom/google/android/exoplayer/audio/AudioTrack;->failOnSpuriousAudioTimestamp:Z

    if-eqz v13, :cond_1d3

    .line 854
    new-instance v13, Lcom/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException;

    invoke-direct {v13, v8}, Lcom/google/android/exoplayer/audio/AudioTrack$InvalidAudioTrackTimestampException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 856
    :cond_1d3
    const-string v13, "AudioTrack"

    invoke-static {v13, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 857
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    goto/16 :goto_c3

    .line 873
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    .end local v8    # "message":Ljava/lang/String;
    :catch_1df
    move-exception v6

    .line 875
    .local v6, "e":Ljava/lang/Exception;
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_12c
.end method

.method private needsPassthroughWorkarounds()Z
    .registers 3

    .prologue
    .line 937
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_12

    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_10

    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private overrideHasPendingData()Z
    .registers 3

    .prologue
    .line 947
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method private pcmBytesToFrames(J)J
    .registers 5
    .param p1, "byteCount"    # J

    .prologue
    .line 908
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmFrameSize:I

    int-to-long v0, v0

    div-long v0, p1, v0

    return-wide v0
.end method

.method private releaseKeepSessionIdAudioTrack()V
    .registers 3

    .prologue
    .line 776
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-nez v1, :cond_5

    .line 789
    :goto_4
    return-void

    .line 781
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 782
    .local v0, "toRelease":Landroid/media/AudioTrack;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 783
    new-instance v1, Lcom/google/android/exoplayer/audio/AudioTrack$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/exoplayer/audio/AudioTrack$2;-><init>(Lcom/google/android/exoplayer/audio/AudioTrack;Landroid/media/AudioTrack;)V

    invoke-virtual {v1}, Lcom/google/android/exoplayer/audio/AudioTrack$2;->start()V

    goto :goto_4
.end method

.method private resetSyncParams()V
    .registers 4

    .prologue
    const-wide/16 v1, 0x0

    const/4 v0, 0x0

    .line 924
    iput-wide v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 925
    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    .line 926
    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 927
    iput-wide v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 928
    iput-boolean v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 929
    iput-wide v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    .line 930
    return-void
.end method

.method private setAudioTrackVolume()V
    .registers 3

    .prologue
    .line 698
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_7

    .line 705
    :goto_6
    return-void

    .line 700
    :cond_7
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 701
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->setAudioTrackVolumeV21(Landroid/media/AudioTrack;F)V

    goto :goto_6

    .line 703
    :cond_15
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->setAudioTrackVolumeV3(Landroid/media/AudioTrack;F)V

    goto :goto_6
.end method

.method private static setAudioTrackVolumeV21(Landroid/media/AudioTrack;F)V
    .registers 2
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 709
    invoke-virtual {p0, p1}, Landroid/media/AudioTrack;->setVolume(F)I

    .line 710
    return-void
.end method

.method private static setAudioTrackVolumeV3(Landroid/media/AudioTrack;F)V
    .registers 2
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F

    .prologue
    .line 714
    invoke-virtual {p0, p1, p1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 715
    return-void
.end method

.method private static writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .registers 4
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 664
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result v0

    return v0
.end method


# virtual methods
.method public configure(Landroid/media/MediaFormat;Z)V
    .registers 4
    .param p1, "format"    # Landroid/media/MediaFormat;
    .param p2, "passthrough"    # Z

    .prologue
    .line 343
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->configure(Landroid/media/MediaFormat;ZI)V

    .line 344
    return-void
.end method

.method public configure(Landroid/media/MediaFormat;ZI)V
    .registers 21
    .param p1, "format"    # Landroid/media/MediaFormat;
    .param p2, "passthrough"    # Z
    .param p3, "specifiedBufferSize"    # I

    .prologue
    .line 355
    const-string v11, "channel-count"

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    .line 357
    .local v3, "channelCount":I
    packed-switch v3, :pswitch_data_102

    .line 383
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unsupported channel count: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 359
    :pswitch_24
    const/4 v2, 0x4

    .line 385
    .local v2, "channelConfig":I
    :goto_25
    const-string v11, "sample-rate"

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v10

    .line 386
    .local v10, "sampleRate":I
    const-string v11, "mime"

    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 387
    .local v6, "mimeType":Ljava/lang/String;
    if-eqz p2, :cond_69

    invoke-static {v6}, Lcom/google/android/exoplayer/audio/AudioTrack;->getEncodingForMimeType(Ljava/lang/String;)I

    move-result v4

    .line 388
    .local v4, "encoding":I
    :goto_3b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v11

    if-eqz v11, :cond_6b

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    if-ne v11, v10, :cond_6b

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    if-ne v11, v2, :cond_6b

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    if-ne v11, v4, :cond_6b

    .line 428
    :goto_53
    return-void

    .line 362
    .end local v2    # "channelConfig":I
    .end local v4    # "encoding":I
    .end local v6    # "mimeType":Ljava/lang/String;
    .end local v10    # "sampleRate":I
    :pswitch_54
    const/16 v2, 0xc

    .line 363
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 365
    .end local v2    # "channelConfig":I
    :pswitch_57
    const/16 v2, 0x1c

    .line 366
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 368
    .end local v2    # "channelConfig":I
    :pswitch_5a
    const/16 v2, 0xcc

    .line 369
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 371
    .end local v2    # "channelConfig":I
    :pswitch_5d
    const/16 v2, 0xdc

    .line 372
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 374
    .end local v2    # "channelConfig":I
    :pswitch_60
    const/16 v2, 0xfc

    .line 375
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 377
    .end local v2    # "channelConfig":I
    :pswitch_63
    const/16 v2, 0x4fc

    .line 378
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 380
    .end local v2    # "channelConfig":I
    :pswitch_66
    sget v2, Lcom/google/android/exoplayer/C;->CHANNEL_OUT_7POINT1_SURROUND:I

    .line 381
    .restart local v2    # "channelConfig":I
    goto :goto_25

    .line 387
    .restart local v6    # "mimeType":Ljava/lang/String;
    .restart local v10    # "sampleRate":I
    :cond_69
    const/4 v4, 0x2

    goto :goto_3b

    .line 394
    .restart local v4    # "encoding":I
    :cond_6b
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->reset()V

    .line 396
    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    .line 397
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    .line 398
    move-object/from16 v0, p0

    iput v10, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    .line 399
    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    .line 400
    mul-int/lit8 v11, v3, 0x2

    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmFrameSize:I

    .line 402
    if-eqz p3, :cond_97

    .line 403
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    .line 426
    :goto_8e
    if-eqz p2, :cond_ef

    const-wide/16 v11, -0x1

    :goto_92
    move-object/from16 v0, p0

    iput-wide v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSizeUs:J

    goto :goto_53

    .line 404
    :cond_97
    if-eqz p2, :cond_ae

    .line 407
    const/4 v11, 0x5

    if-eq v4, v11, :cond_9f

    const/4 v11, 0x6

    if-ne v4, v11, :cond_a6

    .line 409
    :cond_9f
    const/16 v11, 0x5000

    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    goto :goto_8e

    .line 412
    :cond_a6
    const v11, 0xc000

    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    goto :goto_8e

    .line 415
    :cond_ae
    invoke-static {v10, v2, v4}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v8

    .line 417
    .local v8, "minBufferSize":I
    const/4 v11, -0x2

    if-eq v8, v11, :cond_e7

    const/4 v11, 0x1

    :goto_b6
    invoke-static {v11}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 418
    mul-int/lit8 v9, v8, 0x4

    .line 419
    .local v9, "multipliedBufferSize":I
    const-wide/32 v11, 0x3d090

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v11

    long-to-int v11, v11

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmFrameSize:I

    mul-int v7, v11, v12

    .line 420
    .local v7, "minAppBufferSize":I
    int-to-long v11, v8

    const-wide/32 v13, 0xb71b0

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v13

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmFrameSize:I

    int-to-long v15, v15

    mul-long/2addr v13, v15

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    long-to-int v5, v11

    .line 422
    .local v5, "maxAppBufferSize":I
    if-ge v9, v7, :cond_e9

    .end local v7    # "minAppBufferSize":I
    :goto_e2
    move-object/from16 v0, p0

    iput v7, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    goto :goto_8e

    .line 417
    .end local v5    # "maxAppBufferSize":I
    .end local v9    # "multipliedBufferSize":I
    :cond_e7
    const/4 v11, 0x0

    goto :goto_b6

    .line 422
    .restart local v5    # "maxAppBufferSize":I
    .restart local v7    # "minAppBufferSize":I
    .restart local v9    # "multipliedBufferSize":I
    :cond_e9
    if-le v9, v5, :cond_ed

    move v7, v5

    goto :goto_e2

    :cond_ed
    move v7, v9

    goto :goto_e2

    .line 426
    .end local v5    # "maxAppBufferSize":I
    .end local v7    # "minAppBufferSize":I
    .end local v8    # "minBufferSize":I
    .end local v9    # "multipliedBufferSize":I
    :cond_ef
    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    int-to-long v11, v11

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmBytesToFrames(J)J

    move-result-wide v11

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v11

    goto :goto_92

    .line 357
    nop

    :pswitch_data_102
    .packed-switch 0x1
        :pswitch_24
        :pswitch_54
        :pswitch_57
        :pswitch_5a
        :pswitch_5d
        :pswitch_60
        :pswitch_63
        :pswitch_66
    .end packed-switch
.end method

.method public getBufferSize()I
    .registers 2

    .prologue
    .line 499
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    return v0
.end method

.method public getBufferSizeUs()J
    .registers 3

    .prologue
    .line 513
    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSizeUs:J

    return-wide v0
.end method

.method public getCurrentPositionUs(Z)J
    .registers 19
    .param p1, "sourceEnded"    # Z

    .prologue
    .line 297
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->hasCurrentPositionUs()Z

    move-result v13

    if-nez v13, :cond_9

    .line 298
    const-wide/high16 v5, -0x8000000000000000L

    .line 332
    :cond_8
    :goto_8
    return-wide v5

    .line 301
    :cond_9
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v13}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v13

    const/4 v14, 0x3

    if-ne v13, v14, :cond_17

    .line 302
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->maybeSampleSyncParams()V

    .line 305
    :cond_17
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long v11, v13, v15

    .line 307
    .local v11, "systemClockUs":J
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v13, :cond_5a

    .line 309
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long/2addr v13, v15

    sub-long v9, v11, v13

    .line 311
    .local v9, "presentationDiff":J
    long-to-float v13, v9

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v14}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackSpeed()F

    move-result v14

    mul-float/2addr v13, v14

    float-to-long v1, v13

    .line 313
    .local v1, "actualSpeedPresentationDiff":J
    move-object/from16 v0, p0

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v7

    .line 315
    .local v7, "framesDiff":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v13

    add-long v3, v13, v7

    .line 316
    .local v3, "currentFramePosition":J
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v13

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v5, v13, v15

    .line 317
    .local v5, "currentPositionUs":J
    goto :goto_8

    .line 318
    .end local v1    # "actualSpeedPresentationDiff":J
    .end local v3    # "currentFramePosition":J
    .end local v5    # "currentPositionUs":J
    .end local v7    # "framesDiff":J
    .end local v9    # "presentationDiff":J
    :cond_5a
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    if-nez v13, :cond_76

    .line 320
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v13}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v13

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v5, v13, v15

    .line 327
    .restart local v5    # "currentPositionUs":J
    :goto_6e
    if-nez p1, :cond_8

    .line 328
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    sub-long/2addr v5, v13

    goto :goto_8

    .line 325
    .end local v5    # "currentPositionUs":J
    :cond_76
    move-object/from16 v0, p0

    iget-wide v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    add-long/2addr v13, v11

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v5, v13, v15

    .restart local v5    # "currentPositionUs":J
    goto :goto_6e
.end method

.method public handleBuffer(Ljava/nio/ByteBuffer;IIJ)I
    .registers 27
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # I
    .param p3, "size"    # I
    .param p4, "presentationTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;
        }
    .end annotation

    .prologue
    .line 553
    if-nez p3, :cond_4

    .line 554
    const/4 v14, 0x2

    .line 648
    :cond_3
    :goto_3
    return v14

    .line 557
    :cond_4
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v15

    if-eqz v15, :cond_38

    .line 560
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v15}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v15

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v15, v0, :cond_1a

    .line 561
    const/4 v14, 0x0

    goto :goto_3

    .line 567
    :cond_1a
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v15}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_38

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v15}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v15

    const-wide/16 v17, 0x0

    cmp-long v15, v15, v17

    if-eqz v15, :cond_38

    .line 569
    const/4 v14, 0x0

    goto :goto_3

    .line 573
    :cond_38
    const/4 v14, 0x0

    .line 574
    .local v14, "result":I
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    if-nez v15, :cond_be

    .line 577
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    .line 578
    invoke-virtual/range {p1 .. p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 579
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-eqz v15, :cond_62

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->framesPerEncodedSample:I

    if-nez v15, :cond_62

    .line 581
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    move-object/from16 v0, p1

    invoke-static {v15, v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->getFramesPerEncodedSample(ILjava/nio/ByteBuffer;)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->framesPerEncodedSample:I

    .line 583
    :cond_62
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-eqz v15, :cond_120

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->framesPerEncodedSample:I

    int-to-long v12, v15

    .line 584
    .local v12, "frames":J
    :goto_6d
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v3

    .line 586
    .local v3, "bufferDurationUs":J
    sub-long v5, p4, v3

    .line 587
    .local v5, "bufferStartTime":J
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    if-nez v15, :cond_12c

    .line 588
    const-wide/16 v15, 0x0

    move-wide v0, v15

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v15

    move-object/from16 v0, p0

    iput-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    .line 589
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 607
    :cond_8b
    :goto_8b
    sget v15, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v16, 0x15

    move/from16 v0, v16

    if-ge v15, v0, :cond_be

    .line 609
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    if-eqz v15, :cond_a2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    array-length v15, v15

    move/from16 v0, p3

    if-ge v15, v0, :cond_aa

    .line 610
    :cond_a2
    move/from16 v0, p3

    new-array v15, v0, [B

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    .line 612
    :cond_aa
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    const/16 v16, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, p3

    invoke-virtual {v0, v15, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 613
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    .line 617
    .end local v3    # "bufferDurationUs":J
    .end local v5    # "bufferStartTime":J
    .end local v12    # "frames":J
    :cond_be
    const/4 v9, 0x0

    .line 618
    .local v9, "bytesWritten":I
    sget v15, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v16, 0x15

    move/from16 v0, v16

    if-ge v15, v0, :cond_1a5

    .line 620
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedPcmBytes:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmFrameSize:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    mul-long v17, v17, v19

    sub-long v15, v15, v17

    long-to-int v7, v15

    .line 622
    .local v7, "bytesPending":I
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    sub-int v8, v15, v7

    .line 623
    .local v8, "bytesToWrite":I
    if-lez v8, :cond_118

    .line 624
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    invoke-static {v15, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 625
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    move/from16 v17, v0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v15, v0, v1, v8}, Landroid/media/AudioTrack;->write([BII)I

    move-result v9

    .line 626
    if-ltz v9, :cond_118

    .line 627
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    add-int/2addr v15, v9

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    .line 634
    .end local v7    # "bytesPending":I
    .end local v8    # "bytesToWrite":I
    :cond_118
    :goto_118
    if-gez v9, :cond_1b9

    .line 635
    new-instance v15, Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;

    invoke-direct {v15, v9}, Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;-><init>(I)V

    throw v15

    .line 583
    .end local v9    # "bytesWritten":I
    :cond_120
    move/from16 v0, p3

    int-to-long v15, v0

    move-object/from16 v0, p0

    move-wide v1, v15

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->pcmBytesToFrames(J)J

    move-result-wide v12

    goto/16 :goto_6d

    .line 592
    .restart local v3    # "bufferDurationUs":J
    .restart local v5    # "bufferStartTime":J
    .restart local v12    # "frames":J
    :cond_12c
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v17

    move-object/from16 v0, p0

    move-wide/from16 v1, v17

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v17

    add-long v10, v15, v17

    .line 593
    .local v10, "expectedBufferStartTime":J
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_186

    sub-long v15, v10, v5

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(J)J

    move-result-wide v15

    const-wide/32 v17, 0x30d40

    cmp-long v15, v15, v17

    if-lez v15, :cond_186

    .line 595
    const-string v15, "AudioTrack"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Discontinuity detected [expected "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ", got "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "]"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    const/4 v15, 0x2

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 599
    :cond_186
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v15, v0, :cond_8b

    .line 602
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    sub-long v17, v5, v10

    add-long v15, v15, v17

    move-object/from16 v0, p0

    iput-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    .line 603
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 604
    or-int/lit8 v14, v14, 0x1

    goto/16 :goto_8b

    .line 631
    .end local v3    # "bufferDurationUs":J
    .end local v5    # "bufferStartTime":J
    .end local v10    # "expectedBufferStartTime":J
    .end local v12    # "frames":J
    .restart local v9    # "bytesWritten":I
    :cond_1a5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    move/from16 v16, v0

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-static {v15, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    move-result v9

    goto/16 :goto_118

    .line 638
    :cond_1b9
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    sub-int/2addr v15, v9

    move-object/from16 v0, p0

    iput v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    .line 639
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-nez v15, :cond_1d5

    .line 640
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedPcmBytes:J

    int-to-long v0, v9

    move-wide/from16 v17, v0

    add-long v15, v15, v17

    move-object/from16 v0, p0

    iput-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedPcmBytes:J

    .line 642
    :cond_1d5
    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    if-nez v15, :cond_3

    .line 643
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->passthrough:Z

    if-eqz v15, :cond_1f6

    .line 644
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedEncodedFrames:J

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->framesPerEncodedSample:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    add-long v15, v15, v17

    move-object/from16 v0, p0

    iput-wide v15, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedEncodedFrames:J

    .line 646
    :cond_1f6
    or-int/lit8 v14, v14, 0x2

    goto/16 :goto_3
.end method

.method public handleDiscontinuity()V
    .registers 3

    .prologue
    .line 531
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 532
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 534
    :cond_8
    return-void
.end method

.method public handleEndOfStream()V
    .registers 4

    .prologue
    .line 656
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 657
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->handleEndOfStream(J)V

    .line 659
    :cond_f
    return-void
.end method

.method public hasPendingData()Z
    .registers 5

    .prologue
    .line 671
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->getSubmittedFrames()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1a

    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->overrideHasPendingData()Z

    move-result v0

    if-eqz v0, :cond_1c

    :cond_1a
    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method public initialize()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    .line 436
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->initialize(I)I

    move-result v0

    return v0
.end method

.method public initialize(I)I
    .registers 10
    .param p1, "sessionId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 452
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 454
    if-nez p1, :cond_5e

    .line 455
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->streamType:I

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    iget v5, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 462
    :goto_19
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->checkAudioTrackInitialized()V

    .line 464
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    move-result p1

    .line 465
    sget-boolean v0, Lcom/google/android/exoplayer/audio/AudioTrack;->enablePreV21AudioSessionWorkaround:Z

    if-eqz v0, :cond_4f

    .line 466
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_4f

    .line 469
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    move-result v0

    if-eq p1, v0, :cond_3b

    .line 471
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->releaseKeepSessionIdAudioTrack()V

    .line 473
    :cond_3b
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    if-nez v0, :cond_4f

    .line 474
    const/16 v2, 0xfa0

    .line 475
    .local v2, "sampleRate":I
    const/4 v3, 0x4

    .line 476
    .local v3, "channelConfig":I
    const/4 v4, 0x2

    .line 477
    .local v4, "encoding":I
    const/4 v5, 0x2

    .line 478
    .local v5, "bufferSize":I
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->streamType:I

    const/4 v6, 0x0

    move v7, p1

    invoke-direct/range {v0 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->keepSessionIdAudioTrack:Landroid/media/AudioTrack;

    .line 484
    .end local v2    # "sampleRate":I
    .end local v3    # "channelConfig":I
    .end local v4    # "encoding":I
    .end local v5    # "bufferSize":I
    :cond_4f
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->needsPassthroughWorkarounds()Z

    move-result v6

    invoke-virtual {v0, v1, v6}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 485
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->setAudioTrackVolume()V

    .line 487
    return p1

    .line 459
    :cond_5e
    new-instance v0, Landroid/media/AudioTrack;

    iget v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->streamType:I

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    iget v5, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    move v7, p1

    invoke-direct/range {v0 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_19
.end method

.method public isInitialized()Z
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isPassthroughSupported(Ljava/lang/String;)Z
    .registers 4
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 273
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer/audio/AudioCapabilities;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioCapabilities:Lcom/google/android/exoplayer/audio/AudioCapabilities;

    invoke-static {p1}, Lcom/google/android/exoplayer/audio/AudioTrack;->getEncodingForMimeType(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/audio/AudioCapabilities;->supportsEncoding(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 721
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 722
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->resetSyncParams()V

    .line 723
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->pause()V

    .line 725
    :cond_e
    return-void
.end method

.method public play()V
    .registers 5

    .prologue
    .line 520
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 521
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->resumeSystemTimeUs:J

    .line 522
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 524
    :cond_14
    return-void
.end method

.method public release()V
    .registers 1

    .prologue
    .line 768
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->reset()V

    .line 769
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->releaseKeepSessionIdAudioTrack()V

    .line 770
    return-void
.end method

.method public reset()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 733
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 734
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedPcmBytes:J

    .line 735
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedEncodedFrames:J

    .line 736
    iput v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->framesPerEncodedSample:I

    .line 737
    iput v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferBytesRemaining:I

    .line 738
    iput v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 739
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    .line 740
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->resetSyncParams()V

    .line 741
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    .line 742
    .local v0, "playState":I
    const/4 v2, 0x3

    if-ne v0, v2, :cond_27

    .line 743
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->pause()V

    .line 746
    :cond_27
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 747
    .local v1, "toRelease":Landroid/media/AudioTrack;
    iput-object v6, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 748
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v2, v6, v3}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 749
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->close()V

    .line 750
    new-instance v2, Lcom/google/android/exoplayer/audio/AudioTrack$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack$1;-><init>(Lcom/google/android/exoplayer/audio/AudioTrack;Landroid/media/AudioTrack;)V

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack$1;->start()V

    .line 762
    .end local v0    # "playState":I
    .end local v1    # "toRelease":Landroid/media/AudioTrack;
    :cond_3d
    return-void
.end method

.method public setPlaybackParams(Landroid/media/PlaybackParams;)V
    .registers 3
    .param p1, "playbackParams"    # Landroid/media/PlaybackParams;

    .prologue
    .line 683
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->setPlaybackParameters(Landroid/media/PlaybackParams;)V

    .line 684
    return-void
.end method

.method public setVolume(F)V
    .registers 3
    .param p1, "volume"    # F

    .prologue
    .line 691
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 692
    iput p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    .line 693
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->setAudioTrackVolume()V

    .line 695
    :cond_b
    return-void
.end method
