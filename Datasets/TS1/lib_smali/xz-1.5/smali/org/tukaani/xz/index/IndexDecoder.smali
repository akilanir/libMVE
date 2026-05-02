.class public Lorg/tukaani/xz/index/IndexDecoder;
.super Lorg/tukaani/xz/index/IndexBase;


# static fields
.field static final $assertionsDisabled:Z

.field static class$org$tukaani$xz$index$IndexDecoder:Ljava/lang/Class;


# instance fields
.field private compressedOffset:J

.field private largestBlockSize:J

.field private final memoryUsage:I

.field private recordOffset:I

.field private final streamFlags:Lorg/tukaani/xz/common/StreamFlags;

.field private final streamPadding:J

.field private final uncompressed:[J

.field private uncompressedOffset:J

.field private final unpadded:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/index/IndexDecoder;->class$org$tukaani$xz$index$IndexDecoder:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.index.IndexDecoder"

    invoke-static {v0}, Lorg/tukaani/xz/index/IndexDecoder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/index/IndexDecoder;->class$org$tukaani$xz$index$IndexDecoder:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/index/IndexDecoder;->class$org$tukaani$xz$index$IndexDecoder:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public constructor <init>(Lorg/tukaani/xz/SeekableInputStream;Lorg/tukaani/xz/common/StreamFlags;JI)V
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lorg/tukaani/xz/index/IndexBase;-><init>(Lorg/tukaani/xz/XZIOException;)V

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->largestBlockSize:J

    const/4 v2, 0x0

    iput v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->compressedOffset:J

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    move-object/from16 v0, p2

    iput-object v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->streamFlags:Lorg/tukaani/xz/common/StreamFlags;

    move-wide/from16 v0, p3

    iput-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->streamPadding:J

    invoke-virtual/range {p1 .. p1}, Lorg/tukaani/xz/SeekableInputStream;->position()J

    move-result-wide v2

    move-object/from16 v0, p2

    iget-wide v4, v0, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    add-long/2addr v2, v4

    const-wide/16 v4, 0x4

    sub-long v4, v2, v4

    new-instance v6, Ljava/util/zip/CRC32;

    invoke-direct {v6}, Ljava/util/zip/CRC32;-><init>()V

    new-instance v7, Ljava/util/zip/CheckedInputStream;

    move-object/from16 v0, p1

    invoke-direct {v7, v0, v6}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V

    invoke-virtual {v7}, Ljava/util/zip/CheckedInputStream;->read()I

    move-result v2

    if-eqz v2, :cond_48

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_48
    :try_start_48
    invoke-static {v7}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v8

    move-object/from16 v0, p2

    iget-wide v2, v0, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    const-wide/16 v10, 0x2

    div-long/2addr v2, v10

    cmp-long v2, v8, v2

    if-ltz v2, :cond_68

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_5f
    .catch Ljava/io/EOFException; {:try_start_48 .. :try_end_5f} :catch_5f

    :catch_5f
    move-exception v2

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_68
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v8, v2

    if-lez v2, :cond_77

    :try_start_6f
    new-instance v2, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v3, "XZ Index has over 2147483647 Records"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_77
    const-wide/16 v2, 0x10

    mul-long/2addr v2, v8

    const-wide/16 v10, 0x3ff

    add-long/2addr v2, v10

    const-wide/16 v10, 0x400

    div-long/2addr v2, v10

    long-to-int v2, v2

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->memoryUsage:I

    if-ltz p5, :cond_97

    iget v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->memoryUsage:I

    move/from16 v0, p5

    if-le v2, v0, :cond_97

    new-instance v2, Lorg/tukaani/xz/MemoryLimitException;

    iget v3, p0, Lorg/tukaani/xz/index/IndexDecoder;->memoryUsage:I

    move/from16 v0, p5

    invoke-direct {v2, v3, v0}, Lorg/tukaani/xz/MemoryLimitException;-><init>(II)V

    throw v2

    :cond_97
    long-to-int v2, v8

    new-array v2, v2, [J

    iput-object v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->unpadded:[J

    long-to-int v2, v8

    new-array v2, v2, [J

    iput-object v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressed:[J

    const/4 v3, 0x0

    long-to-int v2, v8

    :goto_a3
    if-lez v2, :cond_ec

    invoke-static {v7}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v8

    invoke-static {v7}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lorg/tukaani/xz/SeekableInputStream;->position()J

    move-result-wide v12

    cmp-long v12, v12, v4

    if-lez v12, :cond_bd

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_bd
    iget-object v12, p0, Lorg/tukaani/xz/index/IndexDecoder;->unpadded:[J

    iget-wide v13, p0, Lorg/tukaani/xz/index/IndexDecoder;->blocksSum:J

    add-long/2addr v13, v8

    aput-wide v13, v12, v3

    iget-object v12, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressed:[J

    iget-wide v13, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedSum:J

    add-long/2addr v13, v10

    aput-wide v13, v12, v3

    add-int/lit8 v3, v3, 0x1

    invoke-super {p0, v8, v9, v10, v11}, Lorg/tukaani/xz/index/IndexBase;->add(JJ)V

    sget-boolean v8, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v8, :cond_e1

    int-to-long v8, v3

    iget-wide v12, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordCount:J

    cmp-long v8, v8, v12

    if-eqz v8, :cond_e1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    :cond_e1
    iget-wide v8, p0, Lorg/tukaani/xz/index/IndexDecoder;->largestBlockSize:J

    cmp-long v8, v8, v10

    if-gez v8, :cond_e9

    iput-wide v10, p0, Lorg/tukaani/xz/index/IndexDecoder;->largestBlockSize:J
    :try_end_e9
    .catch Ljava/io/EOFException; {:try_start_6f .. :try_end_e9} :catch_5f

    :cond_e9
    add-int/lit8 v2, v2, -0x1

    goto :goto_a3

    :cond_ec
    invoke-virtual {p0}, Lorg/tukaani/xz/index/IndexDecoder;->getIndexPaddingSize()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lorg/tukaani/xz/SeekableInputStream;->position()J

    move-result-wide v8

    int-to-long v10, v2

    add-long/2addr v8, v10

    cmp-long v3, v8, v4

    if-eqz v3, :cond_103

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_102
    move v2, v3

    :cond_103
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_115

    invoke-virtual {v7}, Ljava/util/zip/CheckedInputStream;->read()I

    move-result v2

    if-eqz v2, :cond_102

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_115
    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v3

    const/4 v2, 0x0

    :goto_11a
    const/4 v5, 0x4

    if-ge v2, v5, :cond_138

    mul-int/lit8 v5, v2, 0x8

    ushr-long v5, v3, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    invoke-virtual/range {p1 .. p1}, Lorg/tukaani/xz/SeekableInputStream;->read()I

    move-result v7

    int-to-long v7, v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_135

    new-instance v2, Lorg/tukaani/xz/CorruptedInputException;

    const-string v3, "XZ Index is corrupt"

    invoke-direct {v2, v3}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_135
    add-int/lit8 v2, v2, 0x1

    goto :goto_11a

    :cond_138
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public getLargestBlockSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->largestBlockSize:J

    return-wide v0
.end method

.method public getMemoryUsage()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->memoryUsage:I

    return v0
.end method

.method public getRecordCount()I
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordCount:J

    long-to-int v0, v0

    return v0
.end method

.method public getStreamFlags()Lorg/tukaani/xz/common/StreamFlags;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->streamFlags:Lorg/tukaani/xz/common/StreamFlags;

    return-object v0
.end method

.method public getUncompressedSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedSum:J

    return-wide v0
.end method

.method public hasRecord(I)Z
    .registers 8

    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    if-lt p1, v0, :cond_11

    int-to-long v0, p1

    iget v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    int-to-long v2, v2

    iget-wide v4, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordCount:J

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public hasUncompressedOffset(J)Z
    .registers 7

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_11

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    iget-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedSum:J

    add-long/2addr v0, v2

    cmp-long v0, p1, v0

    if-gez v0, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public locateBlock(Lorg/tukaani/xz/index/BlockInfo;J)V
    .registers 11

    sget-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    cmp-long v0, p2, v0

    if-gez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    sub-long v3, p2, v0

    sget-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_24

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedSum:J

    cmp-long v0, v3, v0

    if-ltz v0, :cond_24

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_24
    const/4 v2, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->unpadded:[J

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    :goto_2a
    if-ge v2, v0, :cond_40

    sub-int v1, v0, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v2

    iget-object v5, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressed:[J

    aget-wide v5, v5, v1

    cmp-long v5, v5, v3

    if-gtz v5, :cond_3d

    add-int/lit8 v1, v1, 0x1

    :goto_3b
    move v2, v1

    goto :goto_2a

    :cond_3d
    move v0, v1

    move v1, v2

    goto :goto_3b

    :cond_40
    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    add-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Lorg/tukaani/xz/index/IndexDecoder;->setBlockInfo(Lorg/tukaani/xz/index/BlockInfo;I)V

    return-void
.end method

.method public setBlockInfo(Lorg/tukaani/xz/index/BlockInfo;I)V
    .registers 9

    const-wide/16 v4, 0x0

    sget-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    if-ge p2, v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    sget-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_25

    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    sub-int v0, p2, v0

    int-to-long v0, v0

    iget-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordCount:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_25

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_25
    iput-object p0, p1, Lorg/tukaani/xz/index/BlockInfo;->index:Lorg/tukaani/xz/index/IndexDecoder;

    iput p2, p1, Lorg/tukaani/xz/index/BlockInfo;->blockNumber:I

    iget v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    sub-int v0, p2, v0

    if-nez v0, :cond_57

    iput-wide v4, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    iput-wide v4, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    :goto_33
    iget-object v1, p0, Lorg/tukaani/xz/index/IndexDecoder;->unpadded:[J

    aget-wide v1, v1, v0

    iget-wide v3, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    sub-long/2addr v1, v3

    iput-wide v1, p1, Lorg/tukaani/xz/index/BlockInfo;->unpaddedSize:J

    iget-object v1, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressed:[J

    aget-wide v0, v1, v0

    iget-wide v2, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    sub-long/2addr v0, v2

    iput-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedSize:J

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    iget-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->compressedOffset:J

    const-wide/16 v4, 0xc

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    iget-wide v2, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    add-long/2addr v0, v2

    iput-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    return-void

    :cond_57
    iget-object v1, p0, Lorg/tukaani/xz/index/IndexDecoder;->unpadded:[J

    add-int/lit8 v2, v0, -0x1

    aget-wide v1, v1, v2

    const-wide/16 v3, 0x3

    add-long/2addr v1, v3

    const-wide/16 v3, -0x4

    and-long/2addr v1, v3

    iput-wide v1, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    iget-object v1, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressed:[J

    add-int/lit8 v2, v0, -0x1

    aget-wide v1, v1, v2

    iput-wide v1, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    goto :goto_33
.end method

.method public setOffsets(Lorg/tukaani/xz/index/IndexDecoder;)V
    .registers 6

    iget v0, p1, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    iget-wide v1, p1, Lorg/tukaani/xz/index/IndexDecoder;->recordCount:J

    long-to-int v1, v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->recordOffset:I

    iget-wide v0, p1, Lorg/tukaani/xz/index/IndexDecoder;->compressedOffset:J

    invoke-virtual {p1}, Lorg/tukaani/xz/index/IndexDecoder;->getStreamSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-wide v2, p1, Lorg/tukaani/xz/index/IndexDecoder;->streamPadding:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->compressedOffset:J

    sget-boolean v0, Lorg/tukaani/xz/index/IndexDecoder;->$assertionsDisabled:Z

    if-nez v0, :cond_29

    iget-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->compressedOffset:J

    const-wide/16 v2, 0x3

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_29

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_29
    iget-wide v0, p1, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    iget-wide v2, p1, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedSum:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/tukaani/xz/index/IndexDecoder;->uncompressedOffset:J

    return-void
.end method
