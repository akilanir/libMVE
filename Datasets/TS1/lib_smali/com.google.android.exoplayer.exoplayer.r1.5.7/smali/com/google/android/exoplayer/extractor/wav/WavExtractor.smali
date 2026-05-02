.class public final Lcom/google/android/exoplayer/extractor/wav/WavExtractor;
.super Ljava/lang/Object;
.source "WavExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/Extractor;
.implements Lcom/google/android/exoplayer/extractor/SeekMap;


# static fields
.field private static final MAX_INPUT_SIZE:I = 0x8000


# instance fields
.field private bytesPerFrame:I

.field private extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

.field private pendingBytes:I

.field private trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPosition(J)J
    .registers 5
    .param p1, "timeUs"    # J

    .prologue
    .line 132
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getPosition(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public init(Lcom/google/android/exoplayer/extractor/ExtractorOutput;)V
    .registers 3
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    .line 51
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    .line 53
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->endTracks()V

    .line 54
    return-void
.end method

.method public isSeekable()Z
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method public read(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/PositionHolder;)I
    .registers 17
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    if-nez v0, :cond_1e

    .line 71
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    .line 72
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    if-nez v0, :cond_16

    .line 74
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    const-string v1, "Error initializing WavHeader. Did you sniff first?"

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_16
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getBytesPerFrame()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->bytesPerFrame:I

    .line 80
    :cond_1e
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->hasDataBounds()Z

    move-result v0

    if-nez v0, :cond_59

    .line 81
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-static {p1, v0}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader;->skipToData(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/wav/WavHeader;)V

    .line 83
    iget-object v13, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    const/4 v0, 0x0

    const-string v1, "audio/raw"

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getBitrate()I

    move-result v2

    const v3, 0x8000

    iget-object v5, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v5}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getDurationUs()J

    move-result-wide v4

    iget-object v6, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getNumChannels()I

    move-result v6

    iget-object v7, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getSampleRateHz()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-interface {v13, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 94
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->extractorOutput:Lcom/google/android/exoplayer/extractor/ExtractorOutput;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer/extractor/SeekMap;)V

    .line 97
    :cond_59
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    const v1, 0x8000

    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    sub-int/2addr v1, v2

    const/4 v2, 0x1

    invoke-interface {v0, p1, v1, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)I

    move-result v10

    .line 99
    .local v10, "bytesAppended":I
    const/4 v0, -0x1

    if-eq v10, v0, :cond_6e

    .line 100
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    add-int/2addr v0, v10

    iput v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    .line 104
    :cond_6e
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    iget v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->bytesPerFrame:I

    div-int/2addr v0, v1

    iget v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->bytesPerFrame:I

    mul-int v4, v0, v1

    .line 105
    .local v4, "frameBytes":I
    if-lez v4, :cond_96

    .line 106
    invoke-interface {p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    iget v2, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    int-to-long v2, v2

    sub-long v11, v0, v2

    .line 107
    .local v11, "sampleStartPosition":J
    iget v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    sub-int/2addr v0, v4

    iput v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    .line 108
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->trackOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->wavHeader:Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-virtual {v1, v11, v12}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->getTimeUs(J)J

    move-result-wide v1

    const/4 v3, 0x1

    iget v5, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    const/4 v6, 0x0

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 116
    .end local v11    # "sampleStartPosition":J
    :cond_96
    const/4 v0, -0x1

    if-ne v10, v0, :cond_9b

    .line 117
    const/4 v0, -0x1

    .line 120
    :goto_9a
    return v0

    :cond_9b
    const/4 v0, 0x0

    goto :goto_9a
.end method

.method public release()V
    .registers 1

    .prologue
    .line 64
    return-void
.end method

.method public seek()V
    .registers 2

    .prologue
    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/wav/WavExtractor;->pendingBytes:I

    .line 59
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 3
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-static {p1}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
