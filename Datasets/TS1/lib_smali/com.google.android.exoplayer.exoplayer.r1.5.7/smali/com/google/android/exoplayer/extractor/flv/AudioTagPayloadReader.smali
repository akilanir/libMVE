.class final Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;
.super Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader;
.source "AudioTagPayloadReader.java"


# static fields
.field private static final AAC_PACKET_TYPE_AAC_RAW:I = 0x1

.field private static final AAC_PACKET_TYPE_SEQUENCE_HEADER:I = 0x0

.field private static final AUDIO_FORMAT_AAC:I = 0xa

.field private static final AUDIO_SAMPLING_RATE_TABLE:[I


# instance fields
.field private hasOutputFormat:Z

.field private hasParsedAudioDataHeader:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->AUDIO_SAMPLING_RATE_TABLE:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x157c
        0x2af8
        0x55f0
        0xabe0
    .end array-data
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V
    .registers 2
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 52
    return-void
.end method


# virtual methods
.method protected parseHeader(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .registers 8
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 61
    iget-boolean v3, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->hasParsedAudioDataHeader:Z

    if-nez v3, :cond_51

    .line 62
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 63
    .local v1, "header":I
    shr-int/lit8 v3, v1, 0x4

    and-int/lit8 v0, v3, 0xf

    .line 64
    .local v0, "audioFormat":I
    shr-int/lit8 v3, v1, 0x2

    and-int/lit8 v2, v3, 0x3

    .line 65
    .local v2, "sampleRateIndex":I
    if-ltz v2, :cond_18

    sget-object v3, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->AUDIO_SAMPLING_RATE_TABLE:[I

    array-length v3, v3

    if-lt v2, v3, :cond_31

    .line 66
    :cond_18
    new-instance v3, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid sample rate index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    :cond_31
    const/16 v3, 0xa

    if-eq v0, v3, :cond_4e

    .line 70
    new-instance v3, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Audio format not supported: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/extractor/flv/TagPayloadReader$UnsupportedFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 72
    :cond_4e
    iput-boolean v4, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->hasParsedAudioDataHeader:Z

    .line 77
    .end local v0    # "audioFormat":I
    .end local v1    # "header":I
    .end local v2    # "sampleRateIndex":I
    :goto_50
    return v4

    .line 75
    :cond_51
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    goto :goto_50
.end method

.method protected parsePayload(Lcom/google/android/exoplayer/util/ParsableByteArray;J)V
    .registers 18
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "timeUs"    # J

    .prologue
    .line 82
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v13

    .line 84
    .local v13, "packetType":I
    if-nez v13, :cond_44

    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->hasOutputFormat:Z

    if-nez v0, :cond_44

    .line 85
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    new-array v11, v0, [B

    .line 86
    .local v11, "audioSpecifiConfig":[B
    const/4 v0, 0x0

    array-length v1, v11

    invoke-virtual {p1, v11, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 87
    invoke-static {v11}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAacAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v10

    .line 89
    .local v10, "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    const-string v1, "audio/mp4a-latm"

    const/4 v2, -0x1

    const/4 v3, -0x1

    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->getDurationUs()J

    move-result-wide v4

    iget-object v6, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v11}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static/range {v0 .. v9}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v12

    .line 92
    .local v12, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v0, v12}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 93
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->hasOutputFormat:Z

    .line 100
    .end local v10    # "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v11    # "audioSpecifiConfig":[B
    .end local v12    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    :cond_43
    :goto_43
    return-void

    .line 94
    :cond_44
    const/4 v0, 0x1

    if-ne v13, v0, :cond_43

    .line 96
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    .line 97
    .local v4, "bytesToWrite":I
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v0, p1, v4}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 98
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/flv/AudioTagPayloadReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    const/4 v3, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-wide/from16 v1, p2

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    goto :goto_43
.end method

.method public seek()V
    .registers 1

    .prologue
    .line 57
    return-void
.end method
