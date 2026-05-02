.class public abstract Lcom/google/android/exoplayer/SampleSourceTrackRenderer;
.super Lcom/google/android/exoplayer/TrackRenderer;
.source "SampleSourceTrackRenderer.java"


# instance fields
.field private durationUs:J

.field private enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

.field private enabledSourceTrackIndex:I

.field private handledSourceIndices:[I

.field private handledSourceTrackIndices:[I

.field private final sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;


# direct methods
.method public varargs constructor <init>([Lcom/google/android/exoplayer/SampleSource;)V
    .registers 5
    .param p1, "sources"    # [Lcom/google/android/exoplayer/SampleSource;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/google/android/exoplayer/TrackRenderer;-><init>()V

    .line 44
    array-length v1, p1

    new-array v1, v1, [Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iput-object v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p1

    if-ge v0, v1, :cond_19

    .line 46
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    aget-object v2, p1, v0

    invoke-interface {v2}, Lcom/google/android/exoplayer/SampleSource;->register()Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-result-object v2

    aput-object v2, v1, v0

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 48
    :cond_19
    return-void
.end method

.method private checkForDiscontinuity(J)J
    .registers 7
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 251
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget v3, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    invoke-interface {v2, v3}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->readDiscontinuity(I)J

    move-result-wide v0

    .line 252
    .local v0, "discontinuityPositionUs":J
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-eqz v2, :cond_12

    .line 253
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDiscontinuity(J)V

    .line 256
    .end local v0    # "discontinuityPositionUs":J
    :goto_11
    return-wide v0

    .restart local v0    # "discontinuityPositionUs":J
    :cond_12
    move-wide v0, p1

    goto :goto_11
.end method

.method private maybeThrowError(Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;)V
    .registers 4
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 261
    :try_start_0
    invoke-interface {p1}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->maybeThrowError()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 265
    return-void

    .line 262
    :catch_4
    move-exception v0

    .line 263
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method protected final doPrepare(J)Z
    .registers 26
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v3, 0x1

    .line 53
    .local v3, "allSourcesPrepared":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v12, v0, :cond_26

    .line 54
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    aget-object v21, v21, v12

    move-object/from16 v0, v21

    move-wide/from16 v1, p1

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->prepare(J)Z

    move-result v21

    and-int v3, v3, v21

    .line 53
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 56
    :cond_26
    if-nez v3, :cond_2b

    .line 57
    const/16 v21, 0x0

    .line 103
    :goto_2a
    return v21

    .line 60
    :cond_2b
    const/16 v17, 0x0

    .line 61
    .local v17, "totalSourceTrackCount":I
    const/4 v12, 0x0

    :goto_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v12, v0, :cond_4e

    .line 62
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    aget-object v21, v21, v12

    invoke-interface/range {v21 .. v21}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->getTrackCount()I

    move-result v21

    add-int v17, v17, v21

    .line 61
    add-int/lit8 v12, v12, 0x1

    goto :goto_2e

    .line 64
    :cond_4e
    const-wide/16 v4, 0x0

    .line 65
    .local v4, "durationUs":J
    const/4 v9, 0x0

    .line 66
    .local v9, "handledTrackCount":I
    move/from16 v0, v17

    new-array v8, v0, [I

    .line 67
    .local v8, "handledSourceIndices":[I
    move/from16 v0, v17

    new-array v10, v0, [I

    .line 68
    .local v10, "handledTrackIndices":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v14, v0

    .line 69
    .local v14, "sourceCount":I
    const/4 v15, 0x0

    .local v15, "sourceIndex":I
    :goto_63
    if-ge v15, v14, :cond_bc

    .line 70
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    move-object/from16 v21, v0

    aget-object v13, v21, v15

    .line 71
    .local v13, "source":Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    invoke-interface {v13}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->getTrackCount()I

    move-result v16

    .line 72
    .local v16, "sourceTrackCount":I
    const/16 v20, 0x0

    .local v20, "trackIndex":I
    :goto_73
    move/from16 v0, v20

    move/from16 v1, v16

    if-ge v0, v1, :cond_b9

    .line 73
    move/from16 v0, v20

    invoke-interface {v13, v0}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->getFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v7

    .line 76
    .local v7, "format":Lcom/google/android/exoplayer/MediaFormat;
    :try_start_7f
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handlesTrack(Lcom/google/android/exoplayer/MediaFormat;)Z
    :try_end_84
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_7f .. :try_end_84} :catch_96

    move-result v11

    .line 80
    .local v11, "handlesTrack":Z
    if-eqz v11, :cond_93

    .line 81
    aput v15, v8, v9

    .line 82
    aput v20, v10, v9

    .line 83
    add-int/lit8 v9, v9, 0x1

    .line 84
    const-wide/16 v21, -0x1

    cmp-long v21, v4, v21

    if-nez v21, :cond_9f

    .line 72
    :cond_93
    :goto_93
    add-int/lit8 v20, v20, 0x1

    goto :goto_73

    .line 77
    .end local v11    # "handlesTrack":Z
    :catch_96
    move-exception v6

    .line 78
    .local v6, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    new-instance v21, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v21

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v21

    .line 88
    .end local v6    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    .restart local v11    # "handlesTrack":Z
    :cond_9f
    iget-wide v0, v7, Lcom/google/android/exoplayer/MediaFormat;->durationUs:J

    move-wide/from16 v18, v0

    .line 89
    .local v18, "trackDurationUs":J
    const-wide/16 v21, -0x1

    cmp-long v21, v18, v21

    if-nez v21, :cond_ac

    .line 90
    const-wide/16 v4, -0x1

    goto :goto_93

    .line 91
    :cond_ac
    const-wide/16 v21, -0x2

    cmp-long v21, v18, v21

    if-eqz v21, :cond_93

    .line 94
    move-wide/from16 v0, v18

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    goto :goto_93

    .line 69
    .end local v7    # "format":Lcom/google/android/exoplayer/MediaFormat;
    .end local v11    # "handlesTrack":Z
    .end local v18    # "trackDurationUs":J
    :cond_b9
    add-int/lit8 v15, v15, 0x1

    goto :goto_63

    .line 100
    .end local v13    # "source":Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    .end local v16    # "sourceTrackCount":I
    .end local v20    # "trackIndex":I
    :cond_bc
    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->durationUs:J

    .line 101
    invoke-static {v8, v9}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceIndices:[I

    .line 102
    invoke-static {v10, v9}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceTrackIndices:[I

    .line 103
    const/16 v21, 0x1

    goto/16 :goto_2a
.end method

.method protected final doSomeWork(JJ)V
    .registers 11
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->shiftInputPosition(J)J

    move-result-wide p1

    .line 127
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    invoke-interface {v0, v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->continueBuffering(IJ)Z

    move-result v5

    .line 128
    .local v5, "sourceIsReady":Z
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->checkForDiscontinuity(J)J

    move-result-wide p1

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    .line 129
    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->doSomeWork(JJZ)V

    .line 130
    return-void
.end method

.method protected abstract doSomeWork(JJZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method protected getBufferedPositionUs()J
    .registers 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    invoke-interface {v0}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->getBufferedPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getDurationUs()J
    .registers 3

    .prologue
    .line 139
    iget-wide v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->durationUs:J

    return-wide v0
.end method

.method protected final getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .registers 5
    .param p1, "track"    # I

    .prologue
    .line 175
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceIndices:[I

    aget v2, v2, p1

    aget-object v0, v1, v2

    .line 176
    .local v0, "source":Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceTrackIndices:[I

    aget v1, v1, p1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->getFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    return-object v1
.end method

.method protected final getTrackCount()I
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceTrackIndices:[I

    array-length v0, v0

    return v0
.end method

.method protected abstract handlesTrack(Lcom/google/android/exoplayer/MediaFormat;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation
.end method

.method protected maybeThrowError()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    if-eqz v2, :cond_a

    .line 145
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->maybeThrowError(Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;)V

    .line 152
    :cond_9
    return-void

    .line 147
    :cond_a
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    array-length v1, v2

    .line 148
    .local v1, "sourceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-ge v0, v1, :cond_9

    .line 149
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    aget-object v2, v2, v0

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->maybeThrowError(Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;)V

    .line 148
    add-int/lit8 v0, v0, 0x1

    goto :goto_e
.end method

.method protected onDisabled()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->disable(I)V

    .line 157
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    .line 158
    return-void
.end method

.method protected abstract onDiscontinuity(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method protected onEnabled(IJZ)V
    .registers 7
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 109
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->shiftInputPosition(J)J

    move-result-wide p2

    .line 110
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget-object v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceIndices:[I

    aget v1, v1, p1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    .line 111
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->handledSourceTrackIndices:[I

    aget v0, v0, p1

    iput v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    .line 112
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    invoke-interface {v0, v1, p2, p3}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->enable(IJ)V

    .line 113
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->onDiscontinuity(J)V

    .line 114
    return-void
.end method

.method protected onReleased()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    array-length v1, v2

    .line 163
    .local v1, "sourceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_10

    .line 164
    iget-object v2, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->sources:[Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    aget-object v2, v2, v0

    invoke-interface {v2}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->release()V

    .line 163
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 166
    :cond_10
    return-void
.end method

.method protected final readSource(JLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I
    .registers 11
    .param p1, "positionUs"    # J
    .param p3, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p4, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    iget v1, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSourceTrackIndex:I

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v0

    return v0
.end method

.method protected final seekTo(J)V
    .registers 4
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->shiftInputPosition(J)J

    move-result-wide p1

    .line 119
    iget-object v0, p0, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->enabledSource:Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource$SampleSourceReader;->seekToUs(J)V

    .line 120
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/SampleSourceTrackRenderer;->checkForDiscontinuity(J)J

    .line 121
    return-void
.end method

.method protected shiftInputPosition(J)J
    .registers 3
    .param p1, "positionUs"    # J

    .prologue
    .line 190
    return-wide p1
.end method
