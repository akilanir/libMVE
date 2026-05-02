.class final Lcom/google/android/exoplayer/extractor/ts/H264Reader;
.super Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;
.source "H264Reader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;
    }
.end annotation


# static fields
.field private static final FRAME_TYPE_ALL_I:I = 0x7

.field private static final FRAME_TYPE_I:I = 0x2

.field private static final NAL_UNIT_TYPE_AUD:I = 0x9

.field private static final NAL_UNIT_TYPE_IDR:I = 0x5

.field private static final NAL_UNIT_TYPE_IFR:I = 0x1

.field private static final NAL_UNIT_TYPE_PPS:I = 0x8

.field private static final NAL_UNIT_TYPE_SEI:I = 0x6

.field private static final NAL_UNIT_TYPE_SPS:I = 0x7


# instance fields
.field private foundFirstSample:Z

.field private hasOutputFormat:Z

.field private final ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

.field private isKeyframe:Z

.field private pesTimeUs:J

.field private final pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

.field private final prefixFlags:[Z

.field private samplePosition:J

.field private sampleTimeUs:J

.field private final sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

.field private final seiReader:Lcom/google/android/exoplayer/extractor/ts/SeiReader;

.field private final seiWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

.field private totalBytesWritten:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/extractor/TrackOutput;Lcom/google/android/exoplayer/extractor/ts/SeiReader;Z)V
    .registers 7
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/TrackOutput;
    .param p2, "seiReader"    # Lcom/google/android/exoplayer/extractor/ts/SeiReader;
    .param p3, "idrKeyframesOnly"    # Z

    .prologue
    const/16 v2, 0x80

    .line 72
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/extractor/ts/ElementaryStreamReader;-><init>(Lcom/google/android/exoplayer/extractor/TrackOutput;)V

    .line 73
    iput-object p2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiReader:Lcom/google/android/exoplayer/extractor/ts/SeiReader;

    .line 74
    const/4 v0, 0x3

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->prefixFlags:[Z

    .line 75
    if-eqz p3, :cond_32

    const/4 v0, 0x0

    :goto_f
    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    .line 76
    new-instance v0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    const/4 v1, 0x7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    .line 77
    new-instance v0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    const/16 v1, 0x8

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    .line 78
    new-instance v0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    const/4 v1, 0x6

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    .line 79
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 80
    return-void

    .line 75
    :cond_32
    new-instance v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-direct {v0}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;-><init>()V

    goto :goto_f
.end method

.method private feedNalUnitTargetBuffersData([BII)V
    .registers 5
    .param p1, "dataArray"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    .line 187
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    if-eqz v0, :cond_9

    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->appendToNalUnit([BII)V

    .line 190
    :cond_9
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-nez v0, :cond_17

    .line 191
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 192
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 194
    :cond_17
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 195
    return-void
.end method

.method private feedNalUnitTargetBuffersStart(I)V
    .registers 3
    .param p1, "nalUnitType"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    if-eqz v0, :cond_9

    .line 177
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->startNalUnit(I)V

    .line 179
    :cond_9
    iget-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-nez v0, :cond_17

    .line 180
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 181
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 183
    :cond_17
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 184
    return-void
.end method

.method private feedNalUnitTargetEnd(JI)V
    .registers 7
    .param p1, "pesTimeUs"    # J
    .param p3, "discardPadding"    # I

    .prologue
    .line 198
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v1, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 199
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v1, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 200
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v1, p3}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 201
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    iget-object v1, v1, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    iget v2, v2, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v1, v2}, Lcom/google/android/exoplayer/util/NalUnitUtil;->unescapeStream([BI)I

    move-result v0

    .line 202
    .local v0, "unescapedLength":I
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    iget-object v2, v2, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    invoke-virtual {v1, v2, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 203
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 204
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiReader:Lcom/google/android/exoplayer/extractor/ts/SeiReader;

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->seiWrapper:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1, p1, p2, v2}, Lcom/google/android/exoplayer/extractor/ts/SeiReader;->consume(JLcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 206
    .end local v0    # "unescapedLength":I
    :cond_34
    return-void
.end method

.method private static parseMediaFormat(Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;)Lcom/google/android/exoplayer/MediaFormat;
    .registers 15
    .param p0, "sps"    # Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;
    .param p1, "pps"    # Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    .prologue
    const/4 v2, -0x1

    .line 209
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .local v8, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    iget-object v0, p1, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget v1, p1, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/util/NalUnitUtil;->unescapeStream([BI)I

    .line 215
    new-instance v11, Lcom/google/android/exoplayer/util/ParsableBitArray;

    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    invoke-direct {v11, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    .line 216
    .local v11, "bitArray":Lcom/google/android/exoplayer/util/ParsableBitArray;
    const/16 v0, 0x20

    invoke-virtual {v11, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 217
    invoke-static {v11}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseSpsNalUnit(Lcom/google/android/exoplayer/util/ParsableBitArray;)Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;

    move-result-object v12

    .line 219
    .local v12, "parsedSpsData":Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;
    const/4 v0, 0x0

    const-string v1, "video/avc"

    const-wide/16 v4, -0x1

    iget v6, v12, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->width:I

    iget v7, v12, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->height:I

    iget v10, v12, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil$SpsData;->pixelWidthAspectRatio:F

    move v3, v2

    move v9, v2

    invoke-static/range {v0 .. v10}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;IF)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 19
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 102
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    if-lez v1, :cond_3c

    .line 103
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v13

    .line 104
    .local v13, "offset":I
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v10

    .line 105
    .local v10, "limit":I
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 108
    .local v8, "dataArray":[B
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->totalBytesWritten:J

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v3

    int-to-long v15, v3

    add-long/2addr v1, v15

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->totalBytesWritten:J

    .line 109
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 113
    :goto_2d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->prefixFlags:[Z

    invoke-static {v8, v13, v10, v1}, Lcom/google/android/exoplayer/util/NalUnitUtil;->findNalUnit([BII[Z)I

    move-result v11

    .line 115
    .local v11, "nalUnitOffset":I
    if-ne v11, v10, :cond_3d

    .line 117
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v13, v10}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->feedNalUnitTargetBuffersData([BII)V

    .line 168
    .end local v8    # "dataArray":[B
    .end local v10    # "limit":I
    .end local v11    # "nalUnitOffset":I
    .end local v13    # "offset":I
    :cond_3c
    return-void

    .line 122
    .restart local v8    # "dataArray":[B
    .restart local v10    # "limit":I
    .restart local v11    # "nalUnitOffset":I
    .restart local v13    # "offset":I
    :cond_3d
    invoke-static {v8, v11}, Lcom/google/android/exoplayer/util/NalUnitUtil;->getNalUnitType([BI)I

    move-result v12

    .line 126
    .local v12, "nalUnitType":I
    sub-int v9, v11, v13

    .line 127
    .local v9, "lengthToNalUnit":I
    if-lez v9, :cond_4a

    .line 128
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v13, v11}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->feedNalUnitTargetBuffersData([BII)V

    .line 131
    :cond_4a
    sparse-switch v12, :sswitch_data_11c

    .line 161
    :goto_4d
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pesTimeUs:J

    if-gez v9, :cond_118

    neg-int v1, v9

    :goto_54
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->feedNalUnitTargetEnd(JI)V

    .line 163
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->feedNalUnitTargetBuffersStart(I)V

    .line 165
    add-int/lit8 v13, v11, 0x3

    .line 166
    goto :goto_2d

    .line 133
    :sswitch_61
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    goto :goto_4d

    .line 136
    :sswitch_67
    sub-int v6, v10, v11

    .line 137
    .local v6, "bytesWrittenPastNalUnit":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->foundFirstSample:Z

    if-eqz v1, :cond_f5

    .line 138
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    if-eqz v1, :cond_9e

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_9e

    .line 139
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->getSliceType()I

    move-result v14

    .line 140
    .local v14, "sliceType":I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    const/4 v1, 0x2

    if-eq v14, v1, :cond_91

    const/4 v1, 0x7

    if-ne v14, v1, :cond_113

    :cond_91
    const/4 v1, 0x1

    :goto_92
    or-int/2addr v1, v2

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    .line 141
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->reset()V

    .line 143
    .end local v14    # "sliceType":I
    :cond_9e
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    if-eqz v1, :cond_d6

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-nez v1, :cond_d6

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_d6

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_d6

    .line 144
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->parseMediaFormat(Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 145
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->hasOutputFormat:Z

    .line 147
    :cond_d6
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    if-eqz v1, :cond_116

    const/4 v4, 0x1

    .line 148
    .local v4, "flags":I
    :goto_dd
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->totalBytesWritten:J

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->samplePosition:J

    sub-long/2addr v1, v15

    long-to-int v1, v1

    sub-int v5, v1, v6

    .line 149
    .local v5, "size":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sampleTimeUs:J

    const/4 v7, 0x0

    invoke-interface/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 151
    .end local v4    # "flags":I
    .end local v5    # "size":I
    :cond_f5
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->foundFirstSample:Z

    .line 152
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->totalBytesWritten:J

    int-to-long v15, v6

    sub-long/2addr v1, v15

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->samplePosition:J

    .line 153
    move-object/from16 v0, p0

    iget-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pesTimeUs:J

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sampleTimeUs:J

    .line 154
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->isKeyframe:Z

    goto/16 :goto_4d

    .line 140
    .restart local v14    # "sliceType":I
    :cond_113
    const/4 v1, 0x0

    goto/16 :goto_92

    .line 147
    .end local v14    # "sliceType":I
    :cond_116
    const/4 v4, 0x0

    goto :goto_dd

    .line 161
    .end local v6    # "bytesWrittenPastNalUnit":I
    :cond_118
    const/4 v1, 0x0

    goto/16 :goto_54

    .line 131
    nop

    :sswitch_data_11c
    .sparse-switch
        0x5 -> :sswitch_61
        0x9 -> :sswitch_67
    .end sparse-switch
.end method

.method public packetFinished()V
    .registers 1

    .prologue
    .line 173
    return-void
.end method

.method public packetStarted(JZ)V
    .registers 4
    .param p1, "pesTimeUs"    # J
    .param p3, "dataAlignmentIndicator"    # Z

    .prologue
    .line 97
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pesTimeUs:J

    .line 98
    return-void
.end method

.method public seek()V
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->prefixFlags:[Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 86
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->pps:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 87
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->sei:Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 88
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    if-eqz v0, :cond_1d

    .line 89
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->ifrParserBuffer:Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->reset()V

    .line 91
    :cond_1d
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->foundFirstSample:Z

    .line 92
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader;->totalBytesWritten:J

    .line 93
    return-void
.end method
