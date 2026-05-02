.class Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;
.super Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;
.source "AudioTrack.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/audio/AudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioTrackUtilV23"
.end annotation


# instance fields
.field private playbackParams:Landroid/media/PlaybackParams;

.field private playbackSpeed:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1207
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;-><init>()V

    .line 1208
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackSpeed:F

    .line 1209
    return-void
.end method

.method private maybeApplyPlaybackParams()V
    .registers 3

    .prologue
    .line 1233
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->audioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackParams:Landroid/media/PlaybackParams;

    if-eqz v0, :cond_f

    .line 1234
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->audioTrack:Landroid/media/AudioTrack;

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackParams:Landroid/media/PlaybackParams;

    invoke-virtual {v0, v1}, Landroid/media/AudioTrack;->setPlaybackParams(Landroid/media/PlaybackParams;)V

    .line 1236
    :cond_f
    return-void
.end method


# virtual methods
.method public getPlaybackSpeed()F
    .registers 2

    .prologue
    .line 1229
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackSpeed:F

    return v0
.end method

.method public reconfigure(Landroid/media/AudioTrack;Z)V
    .registers 3
    .param p1, "audioTrack"    # Landroid/media/AudioTrack;
    .param p2, "needsPassthroughWorkaround"    # Z

    .prologue
    .line 1214
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;->reconfigure(Landroid/media/AudioTrack;Z)V

    .line 1215
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->maybeApplyPlaybackParams()V

    .line 1216
    return-void
.end method

.method public setPlaybackParameters(Landroid/media/PlaybackParams;)V
    .registers 3
    .param p1, "playbackParams"    # Landroid/media/PlaybackParams;

    .prologue
    .line 1220
    if-eqz p1, :cond_12

    .end local p1    # "playbackParams":Landroid/media/PlaybackParams;
    :goto_2
    invoke-virtual {p1}, Landroid/media/PlaybackParams;->allowDefaults()Landroid/media/PlaybackParams;

    move-result-object p1

    .line 1222
    .restart local p1    # "playbackParams":Landroid/media/PlaybackParams;
    iput-object p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackParams:Landroid/media/PlaybackParams;

    .line 1223
    invoke-virtual {p1}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->playbackSpeed:F

    .line 1224
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV23;->maybeApplyPlaybackParams()V

    .line 1225
    return-void

    .line 1220
    :cond_12
    new-instance p1, Landroid/media/PlaybackParams;

    .end local p1    # "playbackParams":Landroid/media/PlaybackParams;
    invoke-direct {p1}, Landroid/media/PlaybackParams;-><init>()V

    goto :goto_2
.end method
