.class final Lcom/google/android/exoplayer/extractor/ts/AdtsReader;
.super Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
.source "AdtsReader.java"


# static fields
.field private static final CRC_SIZE:I = 0x2

.field private static final HEADER_SIZE:I = 0x5

.field private static final ID3_HEADER_SIZE:I = 0xa

.field private static final ID3_IDENTIFIER:[B

.field private static final ID3_SIZE_OFFSET:I = 0x6

.field private static final MATCH_STATE_FF:I = 0x200

.field private static final MATCH_STATE_I:I = 0x300

.field private static final MATCH_STATE_ID:I = 0x400

.field private static final MATCH_STATE_START:I = 0x100

.field private static final MATCH_STATE_VALUE_SHIFT:I = 0x8

.field private static final STATE_FINDING_SAMPLE:I = 0x0

.field private static final STATE_READING_ADTS_HEADER:I = 0x2

.field private static final STATE_READING_ID3_HEADER:I = 0x1

.field private static final STATE_READING_SAMPLE:I = 0x3


# instance fields
.field private final adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private bytesRead:I

.field private currentOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private currentSampleDuration:J

.field private hasCrc:Z

.field private hasOutputFormat:Z

.field private final id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final id3Output:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field private matchState:I

.field private sampleDurationUs:J

.field private sampleSize:I

.field private state:I

.field private timeUs:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    const/4 v0, 0x3

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->ID3_IDENTIFIER:[B

    return-void

    nop

    :array_a
    .array-data 1
        0x49t
        0x44t
        0x33t
    .end array-data
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Lcom/google/android/exoplayer/extractor/TrackOutput;)V
    .registers 6
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;
    .param p2, "id3Output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;

    .prologue
    .line 82
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 83
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3Output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 84
    invoke-static {}, Lcom/google/android/exoplayer/MediaFormat;->createId3Format()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 85
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x7

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 86
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    sget-object v1, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->ID3_IDENTIFIER:[B

    const/16 v2, 0xa

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 87
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setFindingSampleState()V

    .line 88
    return-void
.end method

.method private continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z
    .registers 7
    .param p1, "source"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "target"    # [B
    .param p3, "targetLength"    # I

    .prologue
    .line 140
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    sub-int v2, p3, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 141
    .local v0, "bytesToRead":I
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    invoke-virtual {p1, p2, v1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 142
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 143
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    if-ne v1, p3, :cond_1c

    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method private findNextSample(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 10
    .param p1, "pesBuffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v7, 0x200

    const/16 v6, 0x100

    .line 198
    iget-object v0, p1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 199
    .local v0, "adtsData":[B
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 200
    .local v3, "position":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    .local v2, "endOffset":I
    move v4, v3

    .line 201
    .end local v3    # "position":I
    .local v4, "position":I
    :goto_f
    if-ge v4, v2, :cond_57

    .line 202
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "position":I
    .restart local v3    # "position":I
    aget-byte v5, v0, v4

    and-int/lit16 v1, v5, 0xff

    .line 203
    .local v1, "data":I
    iget v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    if-ne v5, v7, :cond_33

    const/16 v5, 0xf0

    if-lt v1, v5, :cond_33

    const/16 v5, 0xff

    if-eq v1, v5, :cond_33

    .line 204
    and-int/lit8 v5, v1, 0x1

    if-nez v5, :cond_31

    const/4 v5, 0x1

    :goto_28
    iput-boolean v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->hasCrc:Z

    .line 205
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setReadingAdtsHeaderState()V

    .line 206
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 234
    .end local v1    # "data":I
    :goto_30
    return-void

    .line 204
    .restart local v1    # "data":I
    :cond_31
    const/4 v5, 0x0

    goto :goto_28

    .line 209
    :cond_33
    iget v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    or-int/2addr v5, v1

    sparse-switch v5, :sswitch_data_5c

    .line 224
    iget v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    if-eq v5, v6, :cond_41

    .line 227
    iput v6, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    .line 228
    add-int/lit8 v3, v3, -0x1

    :cond_41
    :goto_41
    move v4, v3

    .line 232
    .end local v3    # "position":I
    .restart local v4    # "position":I
    goto :goto_f

    .line 211
    .end local v4    # "position":I
    .restart local v3    # "position":I
    :sswitch_43
    iput v7, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    goto :goto_41

    .line 214
    :sswitch_46
    const/16 v5, 0x300

    iput v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    goto :goto_41

    .line 217
    :sswitch_4b
    const/16 v5, 0x400

    iput v5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    goto :goto_41

    .line 220
    :sswitch_50
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setReadingId3HeaderState()V

    .line 221
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    goto :goto_30

    .line 233
    .end local v1    # "data":I
    .end local v3    # "position":I
    .restart local v4    # "position":I
    :cond_57
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    move v3, v4

    .line 234
    .end local v4    # "position":I
    .restart local v3    # "position":I
    goto :goto_30

    .line 209
    :sswitch_data_5c
    .sparse-switch
        0x149 -> :sswitch_46
        0x1ff -> :sswitch_43
        0x344 -> :sswitch_4b
        0x433 -> :sswitch_50
    .end sparse-switch
.end method

.method private parseAdtsHeader()V
    .registers 18

    .prologue
    .line 250
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 252
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->hasOutputFormat:Z

    if-nez v1, :cond_a1

    .line 253
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    add-int/lit8 v11, v1, 0x1

    .line 254
    .local v11, "audioObjectType":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v16

    .line 255
    .local v16, "sampleRateIndex":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 256
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v14

    .line 258
    .local v14, "channelConfig":I
    move/from16 v0, v16

    invoke-static {v11, v0, v14}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->buildAacAudioSpecificConfig(III)[B

    move-result-object v13

    .line 260
    .local v13, "audioSpecificConfig":[B
    invoke-static {v13}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAacAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v12

    .line 263
    .local v12, "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    const-string v2, "audio/mp4a-latm"

    const/4 v3, -0x1

    const/4 v4, -0x1

    const-wide/16 v5, -0x1

    iget-object v7, v12, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v8, v12, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v13}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static/range {v1 .. v10}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v15

    .line 268
    .local v15, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    const-wide/32 v1, 0x3d090000

    iget v3, v15, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    int-to-long v3, v3

    div-long/2addr v1, v3

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleDurationUs:J

    .line 269
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v1, v15}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 270
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->hasOutputFormat:Z

    .line 275
    .end local v11    # "audioObjectType":I
    .end local v12    # "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v13    # "audioSpecificConfig":[B
    .end local v14    # "channelConfig":I
    .end local v15    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v16    # "sampleRateIndex":I
    :goto_74
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 276
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    add-int/lit8 v6, v1, -0x5

    .line 277
    .local v6, "sampleSize":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->hasCrc:Z

    if-eqz v1, :cond_92

    .line 278
    add-int/lit8 v6, v6, -0x2

    .line 281
    :cond_92
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-wide v3, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleDurationUs:J

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setReadingSampleState(Lcom/google/android/exoplayer/extractor/TrackOutput;JII)V

    .line 282
    return-void

    .line 272
    .end local v6    # "sampleSize":I
    :cond_a1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    goto :goto_74
.end method

.method private parseId3Header()V
    .registers 7

    .prologue
    const/16 v4, 0xa

    .line 240
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3Output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-interface {v0, v1, v4}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 241
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 242
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3Output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    const-wide/16 v2, 0x0

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readSynchSafeInt()I

    move-result v0

    add-int/lit8 v5, v0, 0xa

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setReadingSampleState(Lcom/google/android/exoplayer/extractor/TrackOutput;JII)V

    .line 244
    return-void
.end method

.method private readSample(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 10
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 288
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleSize:I

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 289
    .local v7, "bytesToRead":I
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->currentOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-interface {v0, p1, v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 290
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    add-int/2addr v0, v7

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 291
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleSize:I

    if-ne v0, v1, :cond_33

    .line 292
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->currentOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    iget-wide v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->timeUs:J

    const/4 v3, 0x1

    iget v4, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleSize:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 293
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->timeUs:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->currentSampleDuration:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->timeUs:J

    .line 294
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setFindingSampleState()V

    .line 296
    :cond_33
    return-void
.end method

.method private setFindingSampleState()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 150
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->state:I

    .line 151
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 152
    const/16 v0, 0x100

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->matchState:I

    .line 153
    return-void
.end method

.method private setReadingAdtsHeaderState()V
    .registers 2

    .prologue
    .line 187
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->state:I

    .line 188
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 189
    return-void
.end method

.method private setReadingId3HeaderState()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 160
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->state:I

    .line 161
    sget-object v0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->ID3_IDENTIFIER:[B

    array-length v0, v0

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 162
    iput v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleSize:I

    .line 163
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 164
    return-void
.end method

.method private setReadingSampleState(Lcom/google/android/exoplayer/extractor/TrackOutput;JII)V
    .registers 7
    .param p1, "outputToUse"    # Lcom/google/android/exoplayer/extractor/TrackOutput;
    .param p2, "currentSampleDuration"    # J
    .param p4, "priorReadBytes"    # I
    .param p5, "sampleSize"    # I

    .prologue
    .line 176
    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->state:I

    .line 177
    iput p4, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->bytesRead:I

    .line 178
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->currentOutput:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 179
    iput-wide p2, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->currentSampleDuration:J

    .line 180
    iput p5, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->sampleSize:I

    .line 181
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 5
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 102
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-lez v1, :cond_39

    .line 103
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->state:I

    packed-switch v1, :pswitch_data_3a

    goto :goto_0

    .line 105
    :pswitch_c
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->findNextSample(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    goto :goto_0

    .line 108
    :pswitch_10
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->id3HeaderBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v2, 0xa

    invoke-direct {p0, p1, v1, v2}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->parseId3Header()V

    goto :goto_0

    .line 113
    :pswitch_20
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->hasCrc:Z

    if-eqz v1, :cond_33

    const/4 v0, 0x7

    .line 114
    .local v0, "targetLength":I
    :goto_25
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    iget-object v1, v1, Lcom/google/android/exoplayer/util/ParsableBitArray;->data:[B

    invoke-direct {p0, p1, v1, v0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->parseAdtsHeader()V

    goto :goto_0

    .line 113
    .end local v0    # "targetLength":I
    :cond_33
    const/4 v0, 0x5

    goto :goto_25

    .line 119
    :pswitch_35
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->readSample(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    goto :goto_0

    .line 123
    :cond_39
    return-void

    .line 103
    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_c
        :pswitch_10
        :pswitch_20
        :pswitch_35
    .end packed-switch
.end method

.method public packetFinished()V
    .registers 1

    .prologue
    .line 128
    return-void
.end method

.method public packetStarted(JZ)V
    .registers 4
    .param p1, "pesTimeUs"    # J
    .param p3, "dataAlignmentIndicator"    # Z

    .prologue
    .line 97
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->timeUs:J

    .line 98
    return-void
.end method

.method public seek()V
    .registers 1

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/ts/AdtsReader;->setFindingSampleState()V

    .line 93
    return-void
.end method
