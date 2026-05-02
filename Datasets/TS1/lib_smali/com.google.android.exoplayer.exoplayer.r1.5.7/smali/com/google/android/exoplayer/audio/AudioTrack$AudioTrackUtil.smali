.class Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;
.super Ljava/lang/Object;
.source "AudioTrack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/audio/AudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioTrackUtil"
.end annotation


# instance fields
.field protected audioTrack:Landroid/media/AudioTrack;

.field private endPlaybackHeadPosition:J

.field private lastRawPlaybackHeadPosition:J

.field private needsPassthroughWorkaround:Z

.field private passthroughWorkaroundPauseOffset:J

.field private rawPlaybackHeadWrapCount:J

.field private sampleRate:I

.field private stopPlaybackHeadPosition:J

.field private stopTimestampUs:J


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 982
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/audio/AudioTrack$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/android/exoplayer/audio/AudioTrack$1;

    .prologue
    .line 982
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;-><init>()V

    return-void
.end method


# virtual methods
.method public getPlaybackHeadPosition()J
    .registers 14

    .prologue
    const-wide/16 v7, 0x0

    .line 1051
    iget-wide v9, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopTimestampUs:J

    const-wide/16 v11, -0x1

    cmp-long v9, v9, v11

    if-eqz v9, :cond_28

    .line 1053
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    iget-wide v9, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopTimestampUs:J

    sub-long v0, v7, v9

    .line 1054
    .local v0, "elapsedTimeSinceStopUs":J
    iget v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->sampleRate:I

    int-to-long v7, v7

    mul-long/2addr v7, v0

    const-wide/32 v9, 0xf4240

    div-long v2, v7, v9

    .line 1055
    .local v2, "framesSinceStop":J
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->endPlaybackHeadPosition:J

    iget-wide v9, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopPlaybackHeadPosition:J

    add-long/2addr v9, v2

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v7

    .line 1079
    .end local v0    # "elapsedTimeSinceStopUs":J
    .end local v2    # "framesSinceStop":J
    :cond_27
    :goto_27
    return-wide v7

    .line 1058
    :cond_28
    iget-object v9, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v9}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v6

    .line 1059
    .local v6, "state":I
    const/4 v9, 0x1

    if-eq v6, v9, :cond_27

    .line 1064
    const-wide v9, 0xffffffffL

    iget-object v11, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v11}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    move-result v11

    int-to-long v11, v11

    and-long v4, v9, v11

    .line 1065
    .local v4, "rawPlaybackHeadPosition":J
    iget-boolean v9, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->needsPassthroughWorkaround:Z

    if-eqz v9, :cond_51

    .line 1069
    const/4 v9, 0x2

    if-ne v6, v9, :cond_4e

    cmp-long v7, v4, v7

    if-nez v7, :cond_4e

    .line 1070
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->lastRawPlaybackHeadPosition:J

    iput-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->passthroughWorkaroundPauseOffset:J

    .line 1072
    :cond_4e
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->passthroughWorkaroundPauseOffset:J

    add-long/2addr v4, v7

    .line 1074
    :cond_51
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->lastRawPlaybackHeadPosition:J

    cmp-long v7, v7, v4

    if-lez v7, :cond_5e

    .line 1076
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->rawPlaybackHeadWrapCount:J

    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    iput-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->rawPlaybackHeadWrapCount:J

    .line 1078
    :cond_5e
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->lastRawPlaybackHeadPosition:J

    .line 1079
    iget-wide v7, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->rawPlaybackHeadWrapCount:J

    const/16 v9, 0x20

    shl-long/2addr v7, v9

    add-long/2addr v7, v4

    goto :goto_27
.end method

.method public getPlaybackHeadPositionUs()J
    .registers 5

    .prologue
    .line 1086
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    mul-long/2addr v0, v2

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->sampleRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getPlaybackSpeed()F
    .registers 2

    .prologue
    .line 1147
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public getTimestampFramePosition()J
    .registers 2

    .prologue
    .line 1126
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getTimestampNanoTime()J
    .registers 2

    .prologue
    .line 1110
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public handleEndOfStream(J)V
    .registers 7
    .param p1, "submittedFrames"    # J

    .prologue
    .line 1023
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopPlaybackHeadPosition:J

    .line 1024
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopTimestampUs:J

    .line 1025
    iput-wide p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->endPlaybackHeadPosition:J

    .line 1026
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 1027
    return-void
.end method

.method public pause()V
    .registers 5

    .prologue
    .line 1034
    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopTimestampUs:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_9

    .line 1039
    :goto_8
    return-void

    .line 1038
    :cond_9
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    goto :goto_8
.end method

.method public reconfigure(Landroid/media/AudioTrack;Z)V
    .registers 7
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;
    .param p2, "needsPassthroughWorkaround"    # Z

    .prologue
    const-wide/16 v2, 0x0

    .line 1004
    iput-object p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->audioTrack:Landroid/media/AudioTrack;

    .line 1005
    iput-boolean p2, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->needsPassthroughWorkaround:Z

    .line 1006
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->stopTimestampUs:J

    .line 1007
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->lastRawPlaybackHeadPosition:J

    .line 1008
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->rawPlaybackHeadWrapCount:J

    .line 1009
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->passthroughWorkaroundPauseOffset:J

    .line 1010
    if-eqz p1, :cond_18

    .line 1011
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->sampleRate:I

    .line 1013
    :cond_18
    return-void
.end method

.method public setPlaybackParameters(Landroid/media/PlaybackParams;)V
    .registers 3
    .param p1, "playbackParams"    # Landroid/media/PlaybackParams;

    .prologue
    .line 1137
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public updateTimestamp()Z
    .registers 2

    .prologue
    .line 1096
    const/4 v0, 0x0

    return v0
.end method
