.class public Lorg/tukaani/xz/SeekableXZInputStream;
.super Lorg/tukaani/xz/SeekableInputStream;


# static fields
.field static final $assertionsDisabled:Z

.field static class$org$tukaani$xz$SeekableXZInputStream:Ljava/lang/Class;


# instance fields
.field private blockCount:I

.field private blockDecoder:Lorg/tukaani/xz/BlockInputStream;

.field private check:Lorg/tukaani/xz/check/Check;

.field private checkTypes:I

.field private final curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

.field private curPos:J

.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private in:Lorg/tukaani/xz/SeekableInputStream;

.field private indexMemoryUsage:I

.field private largestBlockSize:J

.field private final memoryLimit:I

.field private final queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

.field private seekNeeded:Z

.field private seekPos:J

.field private final streams:Ljava/util/ArrayList;

.field private final tempBuf:[B

.field private uncompressedSize:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/SeekableXZInputStream;->class$org$tukaani$xz$SeekableXZInputStream:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.SeekableXZInputStream"

    invoke-static {v0}, Lorg/tukaani/xz/SeekableXZInputStream;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/SeekableXZInputStream;->class$org$tukaani$xz$SeekableXZInputStream:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/SeekableXZInputStream;->class$org$tukaani$xz$SeekableXZInputStream:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public constructor <init>(Lorg/tukaani/xz/SeekableInputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/tukaani/xz/SeekableXZInputStream;-><init>(Lorg/tukaani/xz/SeekableInputStream;I)V

    return-void
.end method

.method public constructor <init>(Lorg/tukaani/xz/SeekableInputStream;I)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lorg/tukaani/xz/SeekableInputStream;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->checkTypes:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->largestBlockSize:J

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->tempBuf:[B

    iput-object p1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    new-instance v8, Ljava/io/DataInputStream;

    invoke-direct {v8, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/tukaani/xz/SeekableInputStream;->seek(J)V

    sget-object v0, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v0, v0

    new-array v0, v0, [B

    invoke-virtual {v8, v0}, Ljava/io/DataInputStream;->readFully([B)V

    sget-object v1, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_52

    new-instance v0, Lorg/tukaani/xz/XZFormatException;

    invoke-direct {v0}, Lorg/tukaani/xz/XZFormatException;-><init>()V

    throw v0

    :cond_52
    invoke-virtual {p1}, Lorg/tukaani/xz/SeekableInputStream;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x3

    and-long/2addr v2, v0

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_67

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ file size is not a multiple of 4 bytes"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_67
    const/16 v2, 0xc

    new-array v9, v2, [B

    const-wide/16 v3, 0x0

    move v5, p2

    :goto_6e
    const-wide/16 v6, 0x0

    cmp-long v2, v0, v6

    if-lez v2, :cond_18a

    const-wide/16 v6, 0xc

    cmp-long v2, v0, v6

    if-gez v2, :cond_80

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_80
    const-wide/16 v6, 0xc

    sub-long v6, v0, v6

    invoke-virtual {p1, v6, v7}, Lorg/tukaani/xz/SeekableInputStream;->seek(J)V

    invoke-virtual {v8, v9}, Ljava/io/DataInputStream;->readFully([B)V

    const/16 v2, 0x8

    aget-byte v2, v9, v2

    if-nez v2, :cond_a9

    const/16 v2, 0x9

    aget-byte v2, v9, v2

    if-nez v2, :cond_a9

    const/16 v2, 0xa

    aget-byte v2, v9, v2

    if-nez v2, :cond_a9

    const/16 v2, 0xb

    aget-byte v2, v9, v2

    if-nez v2, :cond_a9

    const-wide/16 v6, 0x4

    add-long/2addr v3, v6

    const-wide/16 v6, 0x4

    sub-long/2addr v0, v6

    goto :goto_6e

    :cond_a9
    const-wide/16 v6, 0xc

    sub-long v6, v0, v6

    invoke-static {v9}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamFooter([B)Lorg/tukaani/xz/common/StreamFlags;

    move-result-object v2

    iget-wide v0, v2, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    cmp-long v0, v0, v6

    if-ltz v0, :cond_bf

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "Backward Size in XZ Stream Footer is too big"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_bf
    iget v0, v2, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    invoke-static {v0}, Lorg/tukaani/xz/check/Check;->getInstance(I)Lorg/tukaani/xz/check/Check;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->checkTypes:I

    const/4 v1, 0x1

    iget v10, v2, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    shl-int/2addr v1, v10

    or-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->checkTypes:I

    iget-wide v0, v2, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    sub-long v0, v6, v0

    invoke-virtual {p1, v0, v1}, Lorg/tukaani/xz/SeekableInputStream;->seek(J)V

    :try_start_d7
    new-instance v0, Lorg/tukaani/xz/index/IndexDecoder;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/tukaani/xz/index/IndexDecoder;-><init>(Lorg/tukaani/xz/SeekableInputStream;Lorg/tukaani/xz/common/StreamFlags;JI)V
    :try_end_dd
    .catch Lorg/tukaani/xz/MemoryLimitException; {:try_start_d7 .. :try_end_dd} :catch_f9

    iget v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getMemoryUsage()I

    move-result v3

    add-int/2addr v1, v3

    iput v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    if-ltz v5, :cond_116

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getMemoryUsage()I

    move-result v1

    sub-int/2addr v5, v1

    sget-boolean v1, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v1, :cond_116

    if-gez v5, :cond_116

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :catch_f9
    move-exception v0

    sget-boolean v1, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v1, :cond_106

    if-gez v5, :cond_106

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_106
    new-instance v1, Lorg/tukaani/xz/MemoryLimitException;

    invoke-virtual {v0}, Lorg/tukaani/xz/MemoryLimitException;->getMemoryNeeded()I

    move-result v0

    iget v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    add-int/2addr v0, v2

    iget v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    add-int/2addr v2, v5

    invoke-direct {v1, v0, v2}, Lorg/tukaani/xz/MemoryLimitException;-><init>(II)V

    throw v1

    :cond_116
    iget-wide v3, p0, Lorg/tukaani/xz/SeekableXZInputStream;->largestBlockSize:J

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getLargestBlockSize()J

    move-result-wide v10

    cmp-long v1, v3, v10

    if-gez v1, :cond_126

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getLargestBlockSize()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/tukaani/xz/SeekableXZInputStream;->largestBlockSize:J

    :cond_126
    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getStreamSize()J

    move-result-wide v3

    const-wide/16 v10, 0xc

    sub-long/2addr v3, v10

    cmp-long v1, v6, v3

    if-gez v1, :cond_139

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Index indicates too big compressed size for the XZ Stream"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_139
    sub-long/2addr v6, v3

    invoke-virtual {p1, v6, v7}, Lorg/tukaani/xz/SeekableInputStream;->seek(J)V

    invoke-virtual {v8, v9}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-static {v9}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamHeader([B)Lorg/tukaani/xz/common/StreamFlags;

    move-result-object v1

    invoke-static {v1, v2}, Lorg/tukaani/xz/common/DecoderUtil;->areStreamFlagsEqual(Lorg/tukaani/xz/common/StreamFlags;Lorg/tukaani/xz/common/StreamFlags;)Z

    move-result v1

    if-nez v1, :cond_152

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Stream Footer does not match Stream Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_152
    iget-wide v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getUncompressedSize()J

    move-result-wide v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    iget-wide v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gez v1, :cond_16b

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "XZ file is too big"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16b
    iget v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    invoke-virtual {v0}, Lorg/tukaani/xz/index/IndexDecoder;->getRecordCount()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    iget v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    if-gez v1, :cond_180

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "XZ file has over 2147483647 Blocks"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_180
    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-wide/16 v3, 0x0

    move-wide v0, v6

    goto/16 :goto_6e

    :cond_18a
    sget-boolean v2, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_19a

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_19a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_19a
    iput v5, p0, Lorg/tukaani/xz/SeekableXZInputStream;->memoryLimit:I

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexDecoder;

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    move-object v2, v0

    :goto_1b5
    if-ltz v1, :cond_1c6

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexDecoder;

    invoke-virtual {v0, v2}, Lorg/tukaani/xz/index/IndexDecoder;->setOffsets(Lorg/tukaani/xz/index/IndexDecoder;)V

    add-int/lit8 v1, v1, -0x1

    move-object v2, v0

    goto :goto_1b5

    :cond_1c6
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexDecoder;

    new-instance v1, Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {v1, v0}, Lorg/tukaani/xz/index/BlockInfo;-><init>(Lorg/tukaani/xz/index/IndexDecoder;)V

    iput-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    new-instance v1, Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {v1, v0}, Lorg/tukaani/xz/index/BlockInfo;-><init>(Lorg/tukaani/xz/index/IndexDecoder;)V

    iput-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

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

.method private initBlockDecoder()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    new-instance v0, Lorg/tukaani/xz/BlockInputStream;

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    iget-object v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    iget v3, p0, Lorg/tukaani/xz/SeekableXZInputStream;->memoryLimit:I

    iget-object v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v4, v4, Lorg/tukaani/xz/index/BlockInfo;->unpaddedSize:J

    iget-object v6, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v6, v6, Lorg/tukaani/xz/index/BlockInfo;->uncompressedSize:J

    invoke-direct/range {v0 .. v7}, Lorg/tukaani/xz/BlockInputStream;-><init>(Ljava/io/InputStream;Lorg/tukaani/xz/check/Check;IJJ)V

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;
    :try_end_18
    .catch Lorg/tukaani/xz/MemoryLimitException; {:try_start_1 .. :try_end_18} :catch_19
    .catch Lorg/tukaani/xz/IndexIndicatorException; {:try_start_1 .. :try_end_18} :catch_3a

    return-void

    :catch_19
    move-exception v0

    sget-boolean v1, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v1, :cond_28

    iget v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->memoryLimit:I

    if-gez v1, :cond_28

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_28
    new-instance v1, Lorg/tukaani/xz/MemoryLimitException;

    invoke-virtual {v0}, Lorg/tukaani/xz/MemoryLimitException;->getMemoryNeeded()I

    move-result v0

    iget v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    add-int/2addr v0, v2

    iget v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->memoryLimit:I

    iget v3, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    add-int/2addr v2, v3

    invoke-direct {v1, v0, v2}, Lorg/tukaani/xz/MemoryLimitException;-><init>(II)V

    throw v1

    :catch_3a
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
.end method

.method private locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V
    .registers 6

    if-ltz p2, :cond_6

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    if-lt p2, v0, :cond_1f

    :cond_6
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid XZ Block number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f
    iget v0, p1, Lorg/tukaani/xz/index/BlockInfo;->blockNumber:I

    if-ne v0, p2, :cond_24

    :goto_23
    return-void

    :cond_24
    const/4 v0, 0x0

    move v1, v0

    :goto_26
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexDecoder;

    invoke-virtual {v0, p2}, Lorg/tukaani/xz/index/IndexDecoder;->hasRecord(I)Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-virtual {v0, p1, p2}, Lorg/tukaani/xz/index/IndexDecoder;->setBlockInfo(Lorg/tukaani/xz/index/BlockInfo;I)V

    goto :goto_23

    :cond_38
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_26
.end method

.method private locateBlockByPos(Lorg/tukaani/xz/index/BlockInfo;J)V
    .registers 10

    const-wide/16 v4, 0x0

    cmp-long v0, p2, v4

    if-ltz v0, :cond_c

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    cmp-long v0, p2, v0

    if-ltz v0, :cond_25

    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid uncompressed position: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_25
    const/4 v0, 0x0

    move v1, v0

    :goto_27
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/index/IndexDecoder;

    invoke-virtual {v0, p2, p3}, Lorg/tukaani/xz/index/IndexDecoder;->hasUncompressedOffset(J)Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/index/IndexDecoder;->locateBlock(Lorg/tukaani/xz/index/BlockInfo;J)V

    sget-boolean v0, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_4f

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    const-wide/16 v2, 0x3

    and-long/2addr v0, v2

    cmp-long v0, v0, v4

    if-eqz v0, :cond_4f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_4b
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_27

    :cond_4f
    sget-boolean v0, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_5f

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedSize:J

    cmp-long v0, v0, v4

    if-gtz v0, :cond_5f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_5f
    sget-boolean v0, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_6f

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    cmp-long v0, p2, v0

    if-gez v0, :cond_6f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_6f
    sget-boolean v0, Lorg/tukaani/xz/SeekableXZInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_82

    iget-wide v0, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    iget-wide v2, p1, Lorg/tukaani/xz/index/BlockInfo;->uncompressedSize:J

    add-long/2addr v0, v2

    cmp-long v0, p2, v0

    if-ltz v0, :cond_82

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_82
    return-void
.end method

.method private seek()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x0

    iget-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    if-nez v0, :cond_1a

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-virtual {v0}, Lorg/tukaani/xz/index/BlockInfo;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-virtual {v0}, Lorg/tukaani/xz/index/BlockInfo;->setNext()V

    invoke-direct {p0}, Lorg/tukaani/xz/SeekableXZInputStream;->initBlockDecoder()V

    :cond_15
    :goto_15
    return-void

    :cond_16
    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    :cond_1a
    iput-boolean v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    iget-wide v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2f

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    goto :goto_15

    :cond_2f
    iput-boolean v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    invoke-direct {p0, v0, v1, v2}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByPos(Lorg/tukaani/xz/index/BlockInfo;J)V

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    iget-object v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v2, v2, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_4a

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    iget-wide v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_68

    :cond_4a
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v1, v1, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    invoke-virtual {v0, v1, v2}, Lorg/tukaani/xz/SeekableInputStream;->seek(J)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-virtual {v0}, Lorg/tukaani/xz/index/BlockInfo;->getCheckType()I

    move-result v0

    invoke-static {v0}, Lorg/tukaani/xz/check/Check;->getInstance(I)Lorg/tukaani/xz/check/Check;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-direct {p0}, Lorg/tukaani/xz/SeekableXZInputStream;->initBlockDecoder()V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v0, v0, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    :cond_68
    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    iget-wide v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_15

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    iget-wide v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    sub-long/2addr v0, v2

    iget-object v2, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v2, v0, v1}, Lorg/tukaani/xz/BlockInputStream;->skip(J)J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-eqz v0, :cond_85

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_85
    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    goto :goto_15
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    if-nez v0, :cond_1f

    iget-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    if-nez v0, :cond_1f

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    if-nez v0, :cond_21

    :cond_1f
    const/4 v0, 0x0

    :goto_20
    return v0

    :cond_21
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/BlockInputStream;->available()I

    move-result v0

    goto :goto_20
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/SeekableInputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    throw v0
.end method

.method public getBlockCheckType(I)I
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-virtual {v0}, Lorg/tukaani/xz/index/BlockInfo;->getCheckType()I

    move-result v0

    return v0
.end method

.method public getBlockCompPos(I)J
    .registers 4

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v0, v0, Lorg/tukaani/xz/index/BlockInfo;->compressedOffset:J

    return-wide v0
.end method

.method public getBlockCompSize(I)J
    .registers 6

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v0, v0, Lorg/tukaani/xz/index/BlockInfo;->unpaddedSize:J

    const-wide/16 v2, 0x3

    add-long/2addr v0, v2

    const-wide/16 v2, -0x4

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public getBlockCount()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    return v0
.end method

.method public getBlockNumber(J)I
    .registers 4

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1, p2}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByPos(Lorg/tukaani/xz/index/BlockInfo;J)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget v0, v0, Lorg/tukaani/xz/index/BlockInfo;->blockNumber:I

    return v0
.end method

.method public getBlockPos(I)J
    .registers 4

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v0, v0, Lorg/tukaani/xz/index/BlockInfo;->uncompressedOffset:J

    return-wide v0
.end method

.method public getBlockSize(I)J
    .registers 4

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    invoke-direct {p0, v0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->locateBlockByNumber(Lorg/tukaani/xz/index/BlockInfo;I)V

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->queriedBlockInfo:Lorg/tukaani/xz/index/BlockInfo;

    iget-wide v0, v0, Lorg/tukaani/xz/index/BlockInfo;->uncompressedSize:J

    return-wide v0
.end method

.method public getCheckTypes()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->checkTypes:I

    return v0
.end method

.method public getIndexMemoryUsage()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->indexMemoryUsage:I

    return v0
.end method

.method public getLargestBlockSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->largestBlockSize:J

    return-wide v0
.end method

.method public getStreamCount()I
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->streams:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public length()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->uncompressedSize:J

    return-wide v0
.end method

.method public position()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    if-eqz v0, :cond_13

    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    :goto_12
    return-wide v0

    :cond_13
    iget-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    goto :goto_12
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v0, -0x1

    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/SeekableXZInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v3, -0x1

    if-ltz p2, :cond_f

    if-ltz p3, :cond_f

    add-int v1, p2, p3

    if-ltz v1, :cond_f

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_15

    :cond_f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_15
    if-nez p3, :cond_18

    :cond_17
    :goto_17
    return v0

    :cond_18
    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-nez v1, :cond_24

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_24
    iget-object v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    if-eqz v1, :cond_2b

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2b
    :try_start_2b
    iget-boolean v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    if-eqz v1, :cond_32

    invoke-direct {p0}, Lorg/tukaani/xz/SeekableXZInputStream;->seek()V

    :cond_32
    iget-boolean v1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    if-eqz v1, :cond_71

    move v0, v3

    goto :goto_17

    :cond_38
    iget-object v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    invoke-virtual {v4, p1, v2, v1}, Lorg/tukaani/xz/BlockInputStream;->read([BII)I

    move-result v4

    if-lez v4, :cond_57

    iget-wide v5, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    int-to-long v7, v4

    add-long/2addr v5, v7

    iput-wide v5, p0, Lorg/tukaani/xz/SeekableXZInputStream;->curPos:J

    add-int/2addr v0, v4

    add-int/2addr v2, v4

    sub-int/2addr v1, v4

    :cond_49
    :goto_49
    if-lez v1, :cond_17

    iget-object v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;

    if-nez v4, :cond_38

    invoke-direct {p0}, Lorg/tukaani/xz/SeekableXZInputStream;->seek()V

    iget-boolean v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->endReached:Z

    if-eqz v4, :cond_38

    goto :goto_17

    :cond_57
    if-ne v4, v3, :cond_49

    const/4 v4, 0x0

    iput-object v4, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockDecoder:Lorg/tukaani/xz/BlockInputStream;
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_5c} :catch_5d

    goto :goto_49

    :catch_5d
    move-exception v1

    move-object v9, v1

    move v1, v0

    move-object v0, v9

    instance-of v2, v0, Ljava/io/EOFException;

    if-eqz v2, :cond_6a

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    :cond_6a
    iput-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_6f

    throw v0

    :cond_6f
    move v0, v1

    goto :goto_17

    :cond_71
    move v1, p3

    move v2, p2

    goto :goto_49
.end method

.method public seek(J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_2b

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Negative seek position: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2b
    iput-wide p1, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    return-void
.end method

.method public seekToBlock(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->in:Lorg/tukaani/xz/SeekableInputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    if-ltz p1, :cond_12

    iget v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->blockCount:I

    if-lt p1, v0, :cond_2b

    :cond_12
    new-instance v0, Lorg/tukaani/xz/XZIOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid XZ Block number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2b
    invoke-virtual {p0, p1}, Lorg/tukaani/xz/SeekableXZInputStream;->getBlockPos(I)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekPos:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/SeekableXZInputStream;->seekNeeded:Z

    return-void
.end method
