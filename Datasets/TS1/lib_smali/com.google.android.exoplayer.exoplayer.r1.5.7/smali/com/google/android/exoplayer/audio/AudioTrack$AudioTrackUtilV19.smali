.class Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;
.super Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;
.source "AudioTrack.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/audio/AudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioTrackUtilV19"
.end annotation


# instance fields
.field private final audioTimestamp:Landroid/media/AudioTimestamp;

.field private lastRawTimestampFramePosition:J

.field private lastTimestampFramePosition:J

.field private rawTimestampFramePositionWrapCount:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1161
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;-><init>(Lcom/google/android/exoplayer/audio/AudioTrack$1;)V

    .line 1162
    new-instance v0, Landroid/media/AudioTimestamp;

    invoke-direct {v0}, Landroid/media/AudioTimestamp;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->audioTimestamp:Landroid/media/AudioTimestamp;

    .line 1163
    return-void
.end method


# virtual methods
.method public getTimestampFramePosition()J
    .registers 3

    .prologue
    .line 1196
    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastTimestampFramePosition:J

    return-wide v0
.end method

.method public getTimestampNanoTime()J
    .registers 3

    .prologue
    .line 1191
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->audioTimestamp:Landroid/media/AudioTimestamp;

    iget-wide v0, v0, Landroid/media/AudioTimestamp;->nanoTime:J

    return-wide v0
.end method

.method public reconfigure(Landroid/media/AudioTrack;Z)V
    .registers 5
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;
    .param p2, "needsPassthroughWorkaround"    # Z

    .prologue
    const-wide/16 v0, 0x0

    .line 1168
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 1169
    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->rawTimestampFramePositionWrapCount:J

    .line 1170
    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastRawTimestampFramePosition:J

    .line 1171
    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastTimestampFramePosition:J

    .line 1172
    return-void
.end method

.method public updateTimestamp()Z
    .registers 8

    .prologue
    .line 1176
    iget-object v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->audioTrack:Landroid/media/AudioTrack;

    iget-object v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->audioTimestamp:Landroid/media/AudioTimestamp;

    invoke-virtual {v3, v4}, Landroid/media/AudioTrack;->getTimestamp(Landroid/media/AudioTimestamp;)Z

    move-result v2

    .line 1177
    .local v2, "updated":Z
    if-eqz v2, :cond_25

    .line 1178
    iget-object v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->audioTimestamp:Landroid/media/AudioTimestamp;

    iget-wide v0, v3, Landroid/media/AudioTimestamp;->framePosition:J

    .line 1179
    .local v0, "rawFramePosition":J
    iget-wide v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastRawTimestampFramePosition:J

    cmp-long v3, v3, v0

    if-lez v3, :cond_1b

    .line 1181
    iget-wide v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->rawTimestampFramePositionWrapCount:J

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->rawTimestampFramePositionWrapCount:J

    .line 1183
    :cond_1b
    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastRawTimestampFramePosition:J

    .line 1184
    iget-wide v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->rawTimestampFramePositionWrapCount:J

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    add-long/2addr v3, v0

    iput-wide v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->lastTimestampFramePosition:J

    .line 1186
    .end local v0    # "rawFramePosition":J
    :cond_25
    return v2
.end method
