.class final Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;
.super Ljava/lang/Object;
.source "WebmExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/webm/WebmExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Track"
.end annotation


# instance fields
.field public channelCount:I

.field public codecDelayNs:J

.field public codecId:Ljava/lang/String;

.field public codecPrivate:[B

.field public defaultSampleDurationNs:I

.field public encryptionKeyId:[B

.field public hasContentEncryption:Z

.field public height:I

.field private language:Ljava/lang/String;

.field public nalUnitLengthFieldLength:I

.field public number:I

.field public output:Lcom/google/android/exoplayer/extractor/TrackOutput;

.field public sampleRate:I

.field public sampleStrippedBytes:[B

.field public seekPreRollNs:J

.field public type:I

.field public width:I


# direct methods
.method private constructor <init>()V
    .registers 4

    .prologue
    const-wide/16 v1, 0x0

    const/4 v0, -0x1

    .line 1121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1134
    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->width:I

    .line 1135
    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->height:I

    .line 1138
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->channelCount:I

    .line 1139
    const/16 v0, 0x1f40

    iput v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleRate:I

    .line 1140
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecDelayNs:J

    .line 1141
    iput-wide v1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->seekPreRollNs:J

    .line 1144
    const-string v0, "eng"

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->language:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$1;

    .prologue
    .line 1121
    invoke-direct {p0}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;-><init>()V

    return-void
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 1121
    iput-object p1, p0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->language:Ljava/lang/String;

    return-object p1
.end method

.method private static parseAvcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .registers 10
    .param p0, "buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 1266
    const/4 v7, 0x4

    :try_start_1
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 1267
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v7, v7, 0x3

    add-int/lit8 v4, v7, 0x1

    .line 1268
    .local v4, "nalUnitLengthFieldLength":I
    const/4 v7, 0x3

    if-ne v4, v7, :cond_1e

    .line 1269
    new-instance v7, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v7}, Lcom/google/android/exoplayer/ParserException;-><init>()V

    throw v7
    :try_end_15
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_15} :catch_15

    .line 1281
    .end local v4    # "nalUnitLengthFieldLength":I
    :catch_15
    move-exception v0

    .line 1282
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v7, Lcom/google/android/exoplayer/ParserException;

    const-string v8, "Error parsing AVC codec private"

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1271
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v4    # "nalUnitLengthFieldLength":I
    :cond_1e
    :try_start_1e
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1272
    .local v2, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v6, v7, 0x1f

    .line 1273
    .local v6, "numSequenceParameterSets":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2a
    if-ge v1, v6, :cond_36

    .line 1274
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1273
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 1276
    :cond_36
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    .line 1277
    .local v5, "numPictureParameterSets":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3b
    if-ge v3, v5, :cond_47

    .line 1278
    invoke-static {p0}, Lcom/google/android/exoplayer/util/NalUnitUtil;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1277
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 1280
    :cond_47
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v2, v7}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
    :try_end_4e
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1e .. :try_end_4e} :catch_15

    move-result-object v7

    return-object v7
.end method

.method private static parseHevcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .registers 16
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 1296
    const/16 v12, 0x15

    :try_start_2
    invoke-virtual {p0, v12}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 1297
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v12

    and-int/lit8 v8, v12, 0x3

    .line 1300
    .local v8, "lengthSizeMinusOne":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v10

    .line 1301
    .local v10, "numberOfArrays":I
    const/4 v2, 0x0

    .line 1302
    .local v2, "csdLength":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 1303
    .local v3, "csdStartPosition":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_15
    if-ge v5, v10, :cond_32

    .line 1304
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 1305
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v11

    .line 1306
    .local v11, "numberOfNalUnits":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_20
    if-ge v7, v11, :cond_2f

    .line 1307
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v9

    .line 1308
    .local v9, "nalUnitLength":I
    add-int/lit8 v12, v9, 0x4

    add-int/2addr v2, v12

    .line 1309
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 1306
    add-int/lit8 v7, v7, 0x1

    goto :goto_20

    .line 1303
    .end local v9    # "nalUnitLength":I
    :cond_2f
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    .line 1314
    .end local v7    # "j":I
    .end local v11    # "numberOfNalUnits":I
    :cond_32
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 1315
    new-array v0, v2, [B

    .line 1316
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 1317
    .local v1, "bufferPosition":I
    const/4 v5, 0x0

    :goto_39
    if-ge v5, v10, :cond_6a

    .line 1318
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 1319
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v11

    .line 1320
    .restart local v11    # "numberOfNalUnits":I
    const/4 v7, 0x0

    .restart local v7    # "j":I
    :goto_44
    if-ge v7, v11, :cond_67

    .line 1321
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v9

    .line 1322
    .restart local v9    # "nalUnitLength":I
    sget-object v12, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    const/4 v13, 0x0

    sget-object v14, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v14, v14

    invoke-static {v12, v13, v0, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1324
    sget-object v12, Lcom/google/android/exoplayer/util/NalUnitUtil;->NAL_START_CODE:[B

    array-length v12, v12

    add-int/2addr v1, v12

    .line 1325
    iget-object v12, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v13

    invoke-static {v12, v13, v0, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1327
    add-int/2addr v1, v9

    .line 1328
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 1320
    add-int/lit8 v7, v7, 0x1

    goto :goto_44

    .line 1317
    .end local v9    # "nalUnitLength":I
    :cond_67
    add-int/lit8 v5, v5, 0x1

    goto :goto_39

    .line 1332
    .end local v7    # "j":I
    .end local v11    # "numberOfNalUnits":I
    :cond_6a
    if-nez v2, :cond_78

    const/4 v6, 0x0

    .line 1333
    .local v6, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_6d
    add-int/lit8 v12, v8, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v6, v12}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v12

    return-object v12

    .line 1332
    .end local v6    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_78
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
    :try_end_7b
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_7b} :catch_7d

    move-result-object v6

    goto :goto_6d

    .line 1334
    .end local v0    # "buffer":[B
    .end local v1    # "bufferPosition":I
    .end local v2    # "csdLength":I
    .end local v3    # "csdStartPosition":I
    .end local v5    # "i":I
    .end local v8    # "lengthSizeMinusOne":I
    .end local v10    # "numberOfArrays":I
    :catch_7d
    move-exception v4

    .line 1335
    .local v4, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v12, Lcom/google/android/exoplayer/ParserException;

    const-string v13, "Error parsing HEVC codec private"

    invoke-direct {v12, v13}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method private static parseVorbisCodecPrivate([B)Ljava/util/List;
    .registers 12
    .param p0, "codecPrivate"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v9, -0x1

    .line 1348
    const/4 v8, 0x0

    :try_start_3
    aget-byte v8, p0, v8

    if-eq v8, v10, :cond_18

    .line 1349
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Error parsing vorbis codec private"

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_f} :catch_f

    .line 1385
    :catch_f
    move-exception v0

    .line 1386
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Error parsing vorbis codec private"

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1351
    .end local v0    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_18
    const/4 v2, 0x1

    .line 1352
    .local v2, "offset":I
    const/4 v6, 0x0

    .local v6, "vorbisInfoLength":I
    move v3, v2

    .line 1353
    .end local v2    # "offset":I
    .local v3, "offset":I
    :goto_1b
    :try_start_1b
    aget-byte v8, p0, v3

    if-ne v8, v9, :cond_25

    .line 1354
    add-int/lit16 v6, v6, 0xff

    .line 1355
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v3, v2

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_1b

    .line 1357
    :cond_25
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    aget-byte v8, p0, v3

    add-int/2addr v6, v8

    .line 1359
    const/4 v7, 0x0

    .local v7, "vorbisSkipLength":I
    move v3, v2

    .line 1360
    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    :goto_2c
    aget-byte v8, p0, v3

    if-ne v8, v9, :cond_36

    .line 1361
    add-int/lit16 v7, v7, 0xff

    .line 1362
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    move v3, v2

    .end local v2    # "offset":I
    .restart local v3    # "offset":I
    goto :goto_2c

    .line 1364
    :cond_36
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "offset":I
    .restart local v2    # "offset":I
    aget-byte v8, p0, v3

    add-int/2addr v7, v8

    .line 1366
    aget-byte v8, p0, v2

    const/4 v9, 0x1

    if-eq v8, v9, :cond_48

    .line 1367
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Error parsing vorbis codec private"

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1369
    :cond_48
    new-array v5, v6, [B

    .line 1370
    .local v5, "vorbisInfo":[B
    const/4 v8, 0x0

    invoke-static {p0, v2, v5, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1371
    add-int/2addr v2, v6

    .line 1372
    aget-byte v8, p0, v2

    const/4 v9, 0x3

    if-eq v8, v9, :cond_5c

    .line 1373
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Error parsing vorbis codec private"

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1375
    :cond_5c
    add-int/2addr v2, v7

    .line 1376
    aget-byte v8, p0, v2

    const/4 v9, 0x5

    if-eq v8, v9, :cond_6a

    .line 1377
    new-instance v8, Lcom/google/android/exoplayer/ParserException;

    const-string v9, "Error parsing vorbis codec private"

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1379
    :cond_6a
    array-length v8, p0

    sub-int/2addr v8, v2

    new-array v4, v8, [B

    .line 1380
    .local v4, "vorbisBooks":[B
    const/4 v8, 0x0

    array-length v9, p0

    sub-int/2addr v9, v2

    invoke-static {p0, v2, v4, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1381
    new-instance v1, Ljava/util/ArrayList;

    const/4 v8, 0x2

    invoke-direct {v1, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 1382
    .local v1, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1383
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_80
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1b .. :try_end_80} :catch_f

    .line 1384
    return-object v1
.end method


# virtual methods
.method public initializeOutput(Lcom/google/android/exoplayer/extractor/ExtractorOutput;IJ)V
    .registers 24
    .param p1, "output"    # Lcom/google/android/exoplayer/extractor/ExtractorOutput;
    .param p2, "trackId"    # I
    .param p3, "durationUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 1156
    const/4 v4, -0x1

    .line 1157
    .local v4, "maxInputSize":I
    const/4 v9, 0x0

    .line 1158
    .local v9, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecId:Ljava/lang/String;

    const/4 v1, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_242

    :cond_e
    :goto_e
    packed-switch v1, :pswitch_data_290

    .line 1232
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    const-string v3, "Unrecognized codec identifier."

    invoke-direct {v1, v3}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1158
    :sswitch_19
    const-string v5, "V_VP8"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x0

    goto :goto_e

    :sswitch_23
    const-string v5, "V_VP9"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x1

    goto :goto_e

    :sswitch_2d
    const-string v5, "V_MPEG2"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x2

    goto :goto_e

    :sswitch_37
    const-string v5, "V_MPEG4/ISO/SP"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x3

    goto :goto_e

    :sswitch_41
    const-string v5, "V_MPEG4/ISO/ASP"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x4

    goto :goto_e

    :sswitch_4b
    const-string v5, "V_MPEG4/ISO/AP"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x5

    goto :goto_e

    :sswitch_55
    const-string v5, "V_MPEG4/ISO/AVC"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x6

    goto :goto_e

    :sswitch_5f
    const-string v5, "V_MPEGH/ISO/HEVC"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v1, 0x7

    goto :goto_e

    :sswitch_69
    const-string v5, "A_VORBIS"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0x8

    goto :goto_e

    :sswitch_74
    const-string v5, "A_OPUS"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0x9

    goto :goto_e

    :sswitch_7f
    const-string v5, "A_AAC"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xa

    goto :goto_e

    :sswitch_8a
    const-string v5, "A_MPEG/L3"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xb

    goto/16 :goto_e

    :sswitch_96
    const-string v5, "A_AC3"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xc

    goto/16 :goto_e

    :sswitch_a2
    const-string v5, "A_EAC3"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xd

    goto/16 :goto_e

    :sswitch_ae
    const-string v5, "A_TRUEHD"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xe

    goto/16 :goto_e

    :sswitch_ba
    const-string v5, "A_DTS"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0xf

    goto/16 :goto_e

    :sswitch_c6
    const-string v5, "A_DTS/EXPRESS"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0x10

    goto/16 :goto_e

    :sswitch_d2
    const-string v5, "A_DTS/LOSSLESS"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0x11

    goto/16 :goto_e

    :sswitch_de
    const-string v5, "S_TEXT/UTF8"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/16 v1, 0x12

    goto/16 :goto_e

    .line 1160
    :pswitch_ea
    const-string v2, "video/x-vnd.on2.vp8"

    .line 1238
    .local v2, "mimeType":Ljava/lang/String;
    :goto_ec
    invoke-static {v2}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_204

    .line 1239
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->channelCount:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->sampleRate:I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->language:Ljava/lang/String;

    move-wide/from16 v5, p3

    invoke-static/range {v1 .. v10}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v16

    .line 1252
    .local v16, "format":Lcom/google/android/exoplayer/MediaFormat;
    :goto_109
    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->number:I

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    .line 1253
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->output:Lcom/google/android/exoplayer/extractor/TrackOutput;

    move-object/from16 v0, v16

    invoke-interface {v1, v0}, Lcom/google/android/exoplayer/extractor/TrackOutput;->format(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 1254
    return-void

    .line 1163
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v16    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :pswitch_121
    const-string v2, "video/x-vnd.on2.vp9"

    .line 1164
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_ec

    .line 1166
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_124
    const-string v2, "video/mpeg2"

    .line 1167
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto :goto_ec

    .line 1171
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_127
    const-string v2, "video/mp4v-es"

    .line 1172
    .restart local v2    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    if-nez v1, :cond_131

    const/4 v9, 0x0

    .line 1174
    :goto_130
    goto :goto_ec

    .line 1172
    :cond_131
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    goto :goto_130

    .line 1176
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_13a
    const-string v2, "video/avc"

    .line 1177
    .restart local v2    # "mimeType":Ljava/lang/String;
    new-instance v1, Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-direct {v1, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->parseAvcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v17

    .line 1179
    .local v17, "h264Data":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    move-object/from16 v0, v17

    iget-object v9, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    check-cast v9, Ljava/util/List;

    .line 1180
    .restart local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, v17

    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->nalUnitLengthFieldLength:I

    goto :goto_ec

    .line 1183
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v17    # "h264Data":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    :pswitch_15e
    const-string v2, "video/hevc"

    .line 1184
    .restart local v2    # "mimeType":Ljava/lang/String;
    new-instance v1, Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-direct {v1, v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->parseHevcCodecPrivate(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v18

    .line 1186
    .local v18, "hevcData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    move-object/from16 v0, v18

    iget-object v9, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    check-cast v9, Ljava/util/List;

    .line 1187
    .restart local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->nalUnitLengthFieldLength:I

    goto/16 :goto_ec

    .line 1190
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v18    # "hevcData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<[B>;Ljava/lang/Integer;>;"
    :pswitch_183
    const-string v2, "audio/vorbis"

    .line 1191
    .restart local v2    # "mimeType":Ljava/lang/String;
    const/16 v4, 0x2000

    .line 1192
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-static {v1}, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->parseVorbisCodecPrivate([B)Ljava/util/List;

    move-result-object v9

    .line 1193
    goto/16 :goto_ec

    .line 1195
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_191
    const-string v2, "audio/opus"

    .line 1196
    .restart local v2    # "mimeType":Ljava/lang/String;
    const/16 v4, 0x1680

    .line 1197
    new-instance v9, Ljava/util/ArrayList;

    .end local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v1, 0x3

    invoke-direct {v9, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1198
    .restart local v9    # "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1199
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecDelayNs:J

    invoke-virtual {v1, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1201
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->seekPreRollNs:J

    invoke-virtual {v1, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_ec

    .line 1205
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1da
    const-string v2, "audio/mp4a-latm"

    .line 1206
    .restart local v2    # "mimeType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->codecPrivate:[B

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 1207
    goto/16 :goto_ec

    .line 1209
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1e6
    const-string v2, "audio/mpeg"

    .line 1210
    .restart local v2    # "mimeType":Ljava/lang/String;
    const/16 v4, 0x1000

    .line 1211
    goto/16 :goto_ec

    .line 1213
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1ec
    const-string v2, "audio/ac3"

    .line 1214
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1216
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1f0
    const-string v2, "audio/eac3"

    .line 1217
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1219
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1f4
    const-string v2, "audio/true-hd"

    .line 1220
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1223
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1f8
    const-string v2, "audio/vnd.dts"

    .line 1224
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1226
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_1fc
    const-string v2, "audio/vnd.dts.hd"

    .line 1227
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1229
    .end local v2    # "mimeType":Ljava/lang/String;
    :pswitch_200
    const-string v2, "application/x-subrip"

    .line 1230
    .restart local v2    # "mimeType":Ljava/lang/String;
    goto/16 :goto_ec

    .line 1242
    :cond_204
    invoke-static {v2}, Lcom/google/android/exoplayer/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21f

    .line 1243
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v3, -0x1

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->width:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->height:I

    move-wide/from16 v5, p3

    invoke-static/range {v1 .. v9}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;Ljava/lang/String;IIJIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v16

    .restart local v16    # "format":Lcom/google/android/exoplayer/MediaFormat;
    goto/16 :goto_109

    .line 1245
    .end local v16    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_21f
    const-string v1, "application/x-subrip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_239

    .line 1246
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v12, -0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/extractor/webm/WebmExtractor$Track;->language:Ljava/lang/String;

    move-object v11, v2

    move-wide/from16 v13, p3

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer/MediaFormat;->createTextFormat(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v16

    .restart local v16    # "format":Lcom/google/android/exoplayer/MediaFormat;
    goto/16 :goto_109

    .line 1249
    .end local v16    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_239
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    const-string v3, "Unexpected MIME type."

    invoke-direct {v1, v3}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1158
    nop

    :sswitch_data_242
    .sparse-switch
        -0x7ce7f5de -> :sswitch_4b
        -0x7ce7f3b0 -> :sswitch_37
        -0x6a615338 -> :sswitch_ae
        -0x672350af -> :sswitch_69
        -0x585f4fcd -> :sswitch_8a
        -0x2016c535 -> :sswitch_41
        -0x2016c4e5 -> :sswitch_55
        -0x1538b2ba -> :sswitch_d2
        0x3c02325 -> :sswitch_7f
        0x3c02353 -> :sswitch_96
        0x3c030c5 -> :sswitch_ba
        0x4e86155 -> :sswitch_19
        0x4e86156 -> :sswitch_23
        0x2056f406 -> :sswitch_c6
        0x32fdf009 -> :sswitch_5f
        0x54c61e47 -> :sswitch_de
        0x6bd6c624 -> :sswitch_2d
        0x7446132a -> :sswitch_a2
        0x744ad97d -> :sswitch_74
    .end sparse-switch

    :pswitch_data_290
    .packed-switch 0x0
        :pswitch_ea
        :pswitch_121
        :pswitch_124
        :pswitch_127
        :pswitch_127
        :pswitch_127
        :pswitch_13a
        :pswitch_15e
        :pswitch_183
        :pswitch_191
        :pswitch_1da
        :pswitch_1e6
        :pswitch_1ec
        :pswitch_1f0
        :pswitch_1f4
        :pswitch_1f8
        :pswitch_1f8
        :pswitch_1fc
        :pswitch_200
    .end packed-switch
.end method
