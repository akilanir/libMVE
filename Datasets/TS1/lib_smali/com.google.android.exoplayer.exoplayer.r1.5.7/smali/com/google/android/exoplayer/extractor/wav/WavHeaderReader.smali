.class final Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader;
.super Ljava/lang/Object;
.source "WavHeaderReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WavHeaderReader"

.field private static final TYPE_PCM:I = 0x1

.field private static final TYPE_WAVE_FORMAT_EXTENSIBLE:I = 0xfffe


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    return-void
.end method

.method public static peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Lcom/google/android/exoplayer/extractor/wav/WavHeader;
    .registers 18
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-static/range {p0 .. p0}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    new-instance v11, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0x10

    invoke-direct {v11, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    .line 56
    .local v11, "scratch":Lcom/google/android/exoplayer/util/ParsableByteArray;
    move-object/from16 v0, p0

    invoke-static {v0, v11}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;

    move-result-object v9

    .line 57
    .local v9, "riffChunkHeader":Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;
    iget v1, v9, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    const-string v13, "RIFF"

    invoke-static {v13}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v13

    if-eq v1, v13, :cond_1c

    .line 58
    const/4 v1, 0x0

    .line 107
    :goto_1b
    return-object v1

    .line 61
    :cond_1c
    iget-object v1, v11, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v13, 0x0

    const/4 v14, 0x4

    move-object/from16 v0, p0

    invoke-interface {v0, v1, v13, v14}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 62
    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 63
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v10

    .line 64
    .local v10, "riffFormat":I
    const-string v1, "WAVE"

    invoke-static {v1}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v1

    if-eq v10, v1, :cond_4f

    .line 65
    const-string v1, "WavHeaderReader"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Unsupported RIFF format: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const/4 v1, 0x0

    goto :goto_1b

    .line 70
    :cond_4f
    move-object/from16 v0, p0

    invoke-static {v0, v11}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;

    move-result-object v8

    .line 71
    .local v8, "formatChunkHeader":Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;
    iget v1, v8, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    const-string v13, "fmt "

    invoke-static {v13}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v13

    if-eq v1, v13, :cond_7a

    .line 72
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Second chunk in RIFF WAV should be format; got: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v8, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v1, v13}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_7a
    iget-wide v13, v8, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->size:J

    const-wide/16 v15, 0x10

    cmp-long v1, v13, v15

    if-ltz v1, :cond_d5

    const/4 v1, 0x1

    :goto_83
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 77
    iget-object v1, v11, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/4 v13, 0x0

    const/16 v14, 0x10

    move-object/from16 v0, p0

    invoke-interface {v0, v1, v13, v14}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 78
    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 79
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedShort()I

    move-result v12

    .line 80
    .local v12, "type":I
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedShort()I

    move-result v2

    .line 81
    .local v2, "numChannels":I
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedIntToInt()I

    move-result v3

    .line 82
    .local v3, "sampleRateHz":I
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedIntToInt()I

    move-result v4

    .line 83
    .local v4, "averageBytesPerSecond":I
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedShort()I

    move-result v5

    .line 84
    .local v5, "blockAlignment":I
    invoke-virtual {v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLittleEndianUnsignedShort()I

    move-result v6

    .line 86
    .local v6, "bitsPerSample":I
    mul-int v1, v2, v6

    div-int/lit8 v7, v1, 0x8

    .line 87
    .local v7, "expectedBlockAlignment":I
    if-eq v5, v7, :cond_d7

    .line 88
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Expected WAV block alignment of: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; got: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v1, v13}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    .end local v2    # "numChannels":I
    .end local v3    # "sampleRateHz":I
    .end local v4    # "averageBytesPerSecond":I
    .end local v5    # "blockAlignment":I
    .end local v6    # "bitsPerSample":I
    .end local v7    # "expectedBlockAlignment":I
    .end local v12    # "type":I
    :cond_d5
    const/4 v1, 0x0

    goto :goto_83

    .line 94
    .restart local v2    # "numChannels":I
    .restart local v3    # "sampleRateHz":I
    .restart local v4    # "averageBytesPerSecond":I
    .restart local v5    # "blockAlignment":I
    .restart local v6    # "bitsPerSample":I
    .restart local v7    # "expectedBlockAlignment":I
    .restart local v12    # "type":I
    :cond_d7
    const/16 v1, 0x10

    if-eq v6, v1, :cond_f6

    .line 95
    const-string v1, "WavHeaderReader"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Only 16-bit WAVs are supported; got: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    const/4 v1, 0x0

    goto/16 :goto_1b

    .line 99
    :cond_f6
    const/4 v1, 0x1

    if-eq v12, v1, :cond_119

    const v1, 0xfffe

    if-eq v12, v1, :cond_119

    .line 100
    const-string v1, "WavHeaderReader"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Unsupported WAV format type: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v1, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const/4 v1, 0x0

    goto/16 :goto_1b

    .line 105
    :cond_119
    iget-wide v13, v8, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->size:J

    long-to-int v1, v13

    add-int/lit8 v1, v1, -0x10

    move-object/from16 v0, p0

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->advancePeekPosition(I)V

    .line 107
    new-instance v1, Lcom/google/android/exoplayer/extractor/wav/WavHeader;

    invoke-direct/range {v1 .. v6}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;-><init>(IIIII)V

    goto/16 :goto_1b
.end method

.method public static skipToData(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/extractor/wav/WavHeader;)V
    .registers 11
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p1, "wavHeader"    # Lcom/google/android/exoplayer/extractor/wav/WavHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x8

    .line 126
    invoke-static {p0}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    new-instance v3, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v3, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    .line 131
    .local v3, "scratch":Lcom/google/android/exoplayer/util/ParsableByteArray;
    invoke-static {p0, v3}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;

    move-result-object v2

    .line 132
    .local v2, "chunkHeader":Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;
    :goto_11
    iget v4, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    const-string v5, "data"

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v5

    if-eq v4, v5, :cond_72

    .line 133
    const-string v4, "WavHeaderReader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Ignoring unknown WAV chunk: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    const-wide/16 v4, 0x8

    iget-wide v6, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->size:J

    add-long v0, v4, v6

    .line 136
    .local v0, "bytesToSkip":J
    iget v4, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    const-string v5, "RIFF"

    invoke-static {v5}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v5

    if-ne v4, v5, :cond_47

    .line 137
    const-wide/16 v0, 0xc

    .line 139
    :cond_47
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v0, v4

    if-lez v4, :cond_69

    .line 140
    new-instance v4, Lcom/google/android/exoplayer/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Chunk is too large (~2GB+) to skip; id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->id:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 142
    :cond_69
    long-to-int v4, v0

    invoke-interface {p0, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 143
    invoke-static {p0, v3}, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->peek(Lcom/google/android/exoplayer/extractor/ExtractorInput;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;

    move-result-object v2

    .line 144
    goto :goto_11

    .line 146
    .end local v0    # "bytesToSkip":J
    :cond_72
    invoke-interface {p0, v8}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->skipFully(I)V

    .line 148
    invoke-interface {p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getPosition()J

    move-result-wide v4

    iget-wide v6, v2, Lcom/google/android/exoplayer/extractor/wav/WavHeaderReader$ChunkHeader;->size:J

    invoke-virtual {p1, v4, v5, v6, v7}, Lcom/google/android/exoplayer/extractor/wav/WavHeader;->setDataBounds(JJ)V

    .line 149
    return-void
.end method
