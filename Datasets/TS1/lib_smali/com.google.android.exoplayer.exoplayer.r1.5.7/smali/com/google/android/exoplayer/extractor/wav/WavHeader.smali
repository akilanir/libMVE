.class final Lcom/google/android/exoplayer/extractor/wav/WavHeader;
.super Ljava/lang/Object;
.source "WavHeader.java"


# instance fields
.field private final averageBytesPerSecond:I

.field private final bitsPerSample:I

.field private final blockAlignment:I

.field private dataSize:J

.field private dataStartPosition:J

.field private final numChannels:I

.field private final sampleRateHz:I


# direct methods
.method public constructor <init>(IIIII)V
    .registers 6
    .param p1, "numChannels"    # I
    .param p2, "sampleRateHz"    # I
    .param p3, "averageBytesPerSecond"    # I
    .param p4, "blockAlignment"    # I
    .param p5, "bitsPerSample"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p1, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    .line 45
    iput p2, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->sampleRateHz:I

    .line 46
    iput p3, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->averageBytesPerSecond:I

    .line 47
    iput p4, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->blockAlignment:I

    .line 48
    iput p5, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->bitsPerSample:I

    .line 49
    return-void
.end method


# virtual methods
.method public getBitrate()I
    .registers 3

    .prologue
    .line 78
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->sampleRateHz:I

    iget v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->bitsPerSample:I

    mul-int/2addr v0, v1

    iget v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public getBytesPerFrame()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->blockAlignment:I

    return v0
.end method

.method public getBytesPerSample()I
    .registers 3

    .prologue
    .line 68
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->blockAlignment:I

    iget v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getDurationUs()J
    .registers 5

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getNumFrames()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    mul-long/2addr v0, v2

    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->sampleRateHz:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getNumChannels()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    return v0
.end method

.method public getNumFrames()J
    .registers 5

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getNumSamples()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getNumChannels()I

    move-result v2

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getNumSamples()J
    .registers 5

    .prologue
    .line 58
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataSize:J

    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getBytesPerSample()I

    move-result v2

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getPosition(J)J
    .registers 9
    .param p1, "timeUs"    # J

    .prologue
    .line 93
    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->averageBytesPerSecond:I

    int-to-long v2, v2

    mul-long/2addr v2, p1

    const-wide/32 v4, 0xf4240

    div-long v0, v2, v4

    .line 95
    .local v0, "unroundedPosition":J
    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    int-to-long v2, v2

    div-long v2, v0, v2

    iget v4, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->numChannels:I

    int-to-long v4, v4

    mul-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataStartPosition:J

    add-long/2addr v2, v4

    return-wide v2
.end method

.method public getSampleRateHz()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->sampleRateHz:I

    return v0
.end method

.method public getTimeUs(J)J
    .registers 7
    .param p1, "position"    # J

    .prologue
    .line 100
    const-wide/32 v0, 0xf4240

    mul-long/2addr v0, p1

    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->averageBytesPerSecond:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public hasDataBounds()Z
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    .line 105
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataStartPosition:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_10

    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataSize:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public setDataBounds(JJ)V
    .registers 5
    .param p1, "dataStartPosition"    # J
    .param p3, "dataSize"    # J

    .prologue
    .line 110
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataStartPosition:J

    .line 111
    iput-wide p3, p0, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->dataSize:J

    .line 112
    return-void
.end method
