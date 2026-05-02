.class final Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;
.super Ljava/lang/Object;
.source "XingSeeker.java"

# interfaces
.implements Lcom/google/android/exoplayer/extractor/mp3/Mp3Extractor$Seeker;


# instance fields
.field private final durationUs:J

.field private final firstFramePosition:J

.field private final headerSize:I

.field private final inputLength:J

.field private final sizeBytes:J

.field private final tableOfContents:[J


# direct methods
.method private constructor <init>(JJJ)V
    .registers 18
    .param p1, "firstFramePosition"    # J
    .param p3, "durationUs"    # J
    .param p5, "inputLength"    # J

    .prologue
    .line 85
    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-wide/from16 v5, p5

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;-><init>(JJJ[JJI)V

    .line 86
    return-void
.end method

.method private constructor <init>(JJJ[JJI)V
    .registers 11
    .param p1, "firstFramePosition"    # J
    .param p3, "durationUs"    # J
    .param p5, "inputLength"    # J
    .param p7, "tableOfContents"    # [J
    .param p8, "sizeBytes"    # J
    .param p10, "headerSize"    # I

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-wide p1, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    .line 91
    iput-wide p3, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->durationUs:J

    .line 92
    iput-wide p5, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->inputLength:J

    .line 93
    iput-object p7, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    .line 94
    iput-wide p8, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->sizeBytes:J

    .line 95
    iput p10, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->headerSize:I

    .line 96
    return-void
.end method

.method public static create(Lcom/google/android/exoplayer/util/MpegAudioHeader;Lcom/google/android/exoplayer/util/ParsableByteArray;JJ)Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;
    .registers 27
    .param p0, "mpegAudioHeader"    # Lcom/google/android/exoplayer/util/MpegAudioHeader;
    .param p1, "frame"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "position"    # J
    .param p4, "inputLength"    # J

    .prologue
    .line 43
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/util/MpegAudioHeader;->samplesPerFrame:I

    move/from16 v18, v0

    .line 44
    .local v18, "samplesPerFrame":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/util/MpegAudioHeader;->sampleRate:I

    move/from16 v17, v0

    .line 45
    .local v17, "sampleRate":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/util/MpegAudioHeader;->frameSize:I

    int-to-long v1, v1

    add-long v12, p2, v1

    .line 47
    .local v12, "firstFramePosition":J
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v14

    .line 49
    .local v14, "flags":I
    and-int/lit8 v1, v14, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_22

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v15

    .local v15, "frameCount":I
    if-nez v15, :cond_24

    .line 51
    .end local v15    # "frameCount":I
    :cond_22
    const/4 v1, 0x0

    .line 70
    :goto_23
    return-object v1

    .line 53
    .restart local v15    # "frameCount":I
    :cond_24
    int-to-long v1, v15

    move/from16 v0, v18

    int-to-long v6, v0

    const-wide/32 v19, 0xf4240

    mul-long v3, v6, v19

    move/from16 v0, v17

    int-to-long v5, v0

    invoke-static/range {v1 .. v6}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v4

    .line 55
    .local v4, "durationUs":J
    and-int/lit8 v1, v14, 0x6

    const/4 v2, 0x6

    if-eq v1, v2, :cond_42

    .line 57
    new-instance v1, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;

    move-wide v2, v12

    move-wide/from16 v6, p4

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;-><init>(JJJ)V

    goto :goto_23

    .line 60
    :cond_42
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    int-to-long v9, v1

    .line 61
    .local v9, "sizeBytes":J
    const/4 v1, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 62
    const/16 v1, 0x63

    new-array v8, v1, [J

    .line 63
    .local v8, "tableOfContents":[J
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_53
    const/16 v1, 0x63

    move/from16 v0, v16

    if-ge v0, v1, :cond_63

    .line 64
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    int-to-long v1, v1

    aput-wide v1, v8, v16

    .line 63
    add-int/lit8 v16, v16, 0x1

    goto :goto_53

    .line 70
    :cond_63
    new-instance v1, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/util/MpegAudioHeader;->frameSize:I

    move-wide v2, v12

    move-wide/from16 v6, p4

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;-><init>(JJJ[JJI)V

    goto :goto_23
.end method

.method private getTimeUsForTocPosition(I)J
    .registers 6
    .param p1, "tocPosition"    # I

    .prologue
    .line 165
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->durationUs:J

    int-to-long v2, p1

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x64

    div-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public getDurationUs()J
    .registers 3

    .prologue
    .line 157
    iget-wide v0, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->durationUs:J

    return-wide v0
.end method

.method public getPosition(J)J
    .registers 16
    .param p1, "timeUs"    # J

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->isSeekable()Z

    move-result v9

    if-nez v9, :cond_9

    .line 106
    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    .line 133
    :goto_8
    return-wide v9

    .line 108
    :cond_9
    long-to-float v9, p1

    const/high16 v10, 0x42c80000    # 100.0f

    mul-float/2addr v9, v10

    iget-wide v10, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->durationUs:J

    long-to-float v10, v10

    div-float v6, v9, v10

    .line 110
    .local v6, "percent":F
    const/4 v9, 0x0

    cmpg-float v9, v6, v9

    if-gtz v9, :cond_3b

    .line 111
    const/4 v3, 0x0

    .line 130
    .local v3, "fx":F
    :goto_18
    const-wide/high16 v9, 0x3f70000000000000L    # 0.00390625

    float-to-double v11, v3

    mul-double/2addr v9, v11

    iget-wide v11, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->sizeBytes:J

    long-to-double v11, v11

    mul-double/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->round(D)J

    move-result-wide v9

    iget-wide v11, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    add-long v7, v9, v11

    .line 131
    .local v7, "position":J
    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->inputLength:J

    const-wide/16 v11, -0x1

    cmp-long v9, v9, v11

    if-eqz v9, :cond_65

    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->inputLength:J

    const-wide/16 v11, 0x1

    sub-long v4, v9, v11

    .line 133
    .local v4, "maximumPosition":J
    :goto_36
    invoke-static {v7, v8, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    goto :goto_8

    .line 112
    .end local v3    # "fx":F
    .end local v4    # "maximumPosition":J
    .end local v7    # "position":J
    :cond_3b
    const/high16 v9, 0x42c80000    # 100.0f

    cmpl-float v9, v6, v9

    if-ltz v9, :cond_44

    .line 113
    const/high16 v3, 0x43800000    # 256.0f

    .restart local v3    # "fx":F
    goto :goto_18

    .line 115
    .end local v3    # "fx":F
    :cond_44
    float-to-int v0, v6

    .line 117
    .local v0, "a":I
    if-nez v0, :cond_5a

    .line 118
    const/4 v1, 0x0

    .line 122
    .local v1, "fa":F
    :goto_48
    const/16 v9, 0x63

    if-ge v0, v9, :cond_62

    .line 123
    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    aget-wide v9, v9, v0

    long-to-float v2, v9

    .line 127
    .local v2, "fb":F
    :goto_51
    sub-float v9, v2, v1

    int-to-float v10, v0

    sub-float v10, v6, v10

    mul-float/2addr v9, v10

    add-float v3, v1, v9

    .restart local v3    # "fx":F
    goto :goto_18

    .line 120
    .end local v1    # "fa":F
    .end local v2    # "fb":F
    .end local v3    # "fx":F
    :cond_5a
    iget-object v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    add-int/lit8 v10, v0, -0x1

    aget-wide v9, v9, v10

    long-to-float v1, v9

    .restart local v1    # "fa":F
    goto :goto_48

    .line 125
    :cond_62
    const/high16 v2, 0x43800000    # 256.0f

    .restart local v2    # "fb":F
    goto :goto_51

    .line 131
    .end local v0    # "a":I
    .end local v1    # "fa":F
    .end local v2    # "fb":F
    .restart local v3    # "fx":F
    .restart local v7    # "position":J
    :cond_65
    iget-wide v9, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    iget v11, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->headerSize:I

    int-to-long v11, v11

    sub-long/2addr v9, v11

    iget-wide v11, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->sizeBytes:J

    add-long/2addr v9, v11

    const-wide/16 v11, 0x1

    sub-long v4, v9, v11

    goto :goto_36
.end method

.method public getTimeUs(J)J
    .registers 23
    .param p1, "position"    # J

    .prologue
    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->isSeekable()Z

    move-result v15

    if-eqz v15, :cond_e

    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    cmp-long v15, p1, v15

    if-gez v15, :cond_11

    .line 139
    :cond_e
    const-wide/16 v15, 0x0

    .line 152
    :goto_10
    return-wide v15

    .line 141
    :cond_11
    const-wide/high16 v15, 0x4070000000000000L    # 256.0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->firstFramePosition:J

    move-wide/from16 v17, v0

    sub-long v17, p1, v17

    move-wide/from16 v0, v17

    long-to-double v0, v0

    move-wide/from16 v17, v0

    mul-double v15, v15, v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->sizeBytes:J

    move-wide/from16 v17, v0

    move-wide/from16 v0, v17

    long-to-double v0, v0

    move-wide/from16 v17, v0

    div-double v6, v15, v17

    .line 142
    .local v6, "offsetByte":D
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    double-to-long v0, v6

    move-wide/from16 v16, v0

    const/16 v18, 0x1

    const/16 v19, 0x0

    invoke-static/range {v15 .. v19}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor([JJZZ)I

    move-result v15

    add-int/lit8 v12, v15, 0x1

    .line 144
    .local v12, "previousTocPosition":I
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->getTimeUsForTocPosition(I)J

    move-result-wide v10

    .line 147
    .local v10, "previousTime":J
    if-nez v12, :cond_61

    const-wide/16 v8, 0x0

    .line 148
    .local v8, "previousByte":J
    :goto_4a
    const/16 v15, 0x63

    if-ne v12, v15, :cond_6a

    const-wide/16 v2, 0x100

    .line 149
    .local v2, "nextByte":J
    :goto_50
    add-int/lit8 v15, v12, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->getTimeUsForTocPosition(I)J

    move-result-wide v4

    .line 150
    .local v4, "nextTime":J
    cmp-long v15, v2, v8

    if-nez v15, :cond_71

    const-wide/16 v13, 0x0

    .line 152
    .local v13, "timeOffset":J
    :goto_5e
    add-long v15, v10, v13

    goto :goto_10

    .line 147
    .end local v2    # "nextByte":J
    .end local v4    # "nextTime":J
    .end local v8    # "previousByte":J
    .end local v13    # "timeOffset":J
    :cond_61
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    add-int/lit8 v16, v12, -0x1

    aget-wide v8, v15, v16

    goto :goto_4a

    .line 148
    .restart local v8    # "previousByte":J
    :cond_6a
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    aget-wide v2, v15, v12

    goto :goto_50

    .line 150
    .restart local v2    # "nextByte":J
    .restart local v4    # "nextTime":J
    :cond_71
    sub-long v15, v4, v10

    long-to-double v15, v15

    long-to-double v0, v8

    move-wide/from16 v17, v0

    sub-double v17, v6, v17

    mul-double v15, v15, v17

    sub-long v17, v2, v8

    move-wide/from16 v0, v17

    long-to-double v0, v0

    move-wide/from16 v17, v0

    div-double v15, v15, v17

    double-to-long v13, v15

    goto :goto_5e
.end method

.method public isSeekable()Z
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/android/exoplayer/extractor/mp3/XingSeeker;->tableOfContents:[J

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
