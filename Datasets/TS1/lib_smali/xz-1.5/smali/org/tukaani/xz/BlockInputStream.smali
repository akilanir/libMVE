.class Lorg/tukaani/xz/BlockInputStream;
.super Ljava/io/InputStream;


# instance fields
.field private final check:Lorg/tukaani/xz/check/Check;

.field private compressedSizeInHeader:J

.field private compressedSizeLimit:J

.field private endReached:Z

.field private filterChain:Ljava/io/InputStream;

.field private final headerSize:I

.field private final inCounted:Lorg/tukaani/xz/CountingInputStream;

.field private final inData:Ljava/io/DataInputStream;

.field private final tempBuf:[B

.field private uncompressedSize:J

.field private uncompressedSizeInHeader:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/tukaani/xz/check/Check;IJJ)V
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/tukaani/xz/IndexIndicatorException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/BlockInputStream;->endReached:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->tempBuf:[B

    iput-object p2, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->inData:Ljava/io/DataInputStream;

    const/16 v0, 0x400

    new-array v0, v0, [B

    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->inData:Ljava/io/DataInputStream;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    const/4 v1, 0x0

    aget-byte v1, v0, v1

    if-nez v1, :cond_36

    new-instance v0, Lorg/tukaani/xz/IndexIndicatorException;

    invoke-direct {v0}, Lorg/tukaani/xz/IndexIndicatorException;-><init>()V

    throw v0

    :cond_36
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v1, v1, 0x1

    mul-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->inData:Ljava/io/DataInputStream;

    const/4 v2, 0x1

    iget v3, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v0, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    const/4 v1, 0x0

    iget v2, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    add-int/lit8 v2, v2, -0x4

    iget v3, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    add-int/lit8 v3, v3, -0x4

    invoke-static {v0, v1, v2, v3}, Lorg/tukaani/xz/common/DecoderUtil;->isCRC32Valid([BIII)Z

    move-result v1

    if-nez v1, :cond_62

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Block Header is corrupt"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_62
    const/4 v1, 0x1

    aget-byte v1, v0, v1

    and-int/lit8 v1, v1, 0x3c

    if-eqz v1, :cond_71

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported options in XZ Block Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_71
    const/4 v1, 0x1

    aget-byte v1, v0, v1

    and-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, 0x1

    new-array v2, v1, [J

    new-array v3, v1, [[B

    new-instance v4, Ljava/io/ByteArrayInputStream;

    const/4 v5, 0x2

    iget v6, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    add-int/lit8 v6, v6, -0x6

    invoke-direct {v4, v0, v5, v6}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    const-wide v5, 0x7ffffffffffffffcL

    :try_start_8b
    iget v7, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    int-to-long v7, v7

    sub-long/2addr v5, v7

    invoke-virtual {p2}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v7

    int-to-long v7, v7

    sub-long/2addr v5, v7

    iput-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    const/4 v5, 0x1

    aget-byte v5, v0, v5

    and-int/lit8 v5, v5, 0x40

    if-eqz v5, :cond_c7

    invoke-static {v4}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v5

    iput-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    iget-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_b4

    iget-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    iget-wide v7, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    cmp-long v5, v5, v7

    if-lez v5, :cond_c3

    :cond_b4
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
    :try_end_ba
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_ba} :catch_ba

    :catch_ba
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Block Header is corrupt"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c3
    :try_start_c3
    iget-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    iput-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    :cond_c7
    const/4 v5, 0x1

    aget-byte v0, v0, v5

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_d4

    invoke-static {v4}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v5

    iput-wide v5, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    :cond_d4
    const/4 v0, 0x0

    :goto_d5
    if-ge v0, v1, :cond_fd

    invoke-static {v4}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v5

    aput-wide v5, v2, v0

    invoke-static {v4}, Lorg/tukaani/xz/common/DecoderUtil;->decodeVLI(Ljava/io/InputStream;)J

    move-result-wide v5

    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v7

    int-to-long v7, v7

    cmp-long v7, v5, v7

    if-lez v7, :cond_f0

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_f0
    long-to-int v5, v5

    new-array v5, v5, [B

    aput-object v5, v3, v0

    aget-object v5, v3, v0

    invoke-virtual {v4, v5}, Ljava/io/ByteArrayInputStream;->read([B)I
    :try_end_fa
    .catch Ljava/io/IOException; {:try_start_c3 .. :try_end_fa} :catch_ba

    add-int/lit8 v0, v0, 0x1

    goto :goto_d5

    :cond_fd
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v0

    :goto_101
    if-lez v0, :cond_114

    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    if-eqz v1, :cond_111

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported options in XZ Block Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_111
    add-int/lit8 v0, v0, -0x1

    goto :goto_101

    :cond_114
    const-wide/16 v0, -0x1

    cmp-long v0, p4, v0

    if-eqz v0, :cond_169

    iget v0, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    invoke-virtual {p2}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v1

    add-int/2addr v0, v1

    int-to-long v4, v0

    cmp-long v1, v4, p4

    if-ltz v1, :cond_12e

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Index does not match a Block Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12e
    int-to-long v0, v0

    sub-long v0, p4, v0

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    cmp-long v4, v0, v4

    if-gtz v4, :cond_145

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_14d

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    cmp-long v4, v4, v0

    if-eqz v4, :cond_14d

    :cond_145
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Index does not match a Block Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14d
    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_163

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    cmp-long v4, v4, p6

    if-eqz v4, :cond_163

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Index does not match a Block Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_163
    iput-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    iput-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    iput-wide p6, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    :cond_169
    array-length v0, v2

    new-array v4, v0, [Lorg/tukaani/xz/FilterDecoder;

    const/4 v0, 0x0

    :goto_16d
    array-length v1, v4

    if-ge v0, v1, :cond_1c5

    aget-wide v5, v2, v0

    const-wide/16 v7, 0x21

    cmp-long v1, v5, v7

    if-nez v1, :cond_184

    new-instance v1, Lorg/tukaani/xz/LZMA2Decoder;

    aget-object v5, v3, v0

    invoke-direct {v1, v5}, Lorg/tukaani/xz/LZMA2Decoder;-><init>([B)V

    aput-object v1, v4, v0

    :goto_181
    add-int/lit8 v0, v0, 0x1

    goto :goto_16d

    :cond_184
    aget-wide v5, v2, v0

    const-wide/16 v7, 0x3

    cmp-long v1, v5, v7

    if-nez v1, :cond_196

    new-instance v1, Lorg/tukaani/xz/DeltaDecoder;

    aget-object v5, v3, v0

    invoke-direct {v1, v5}, Lorg/tukaani/xz/DeltaDecoder;-><init>([B)V

    aput-object v1, v4, v0

    goto :goto_181

    :cond_196
    aget-wide v5, v2, v0

    invoke-static {v5, v6}, Lorg/tukaani/xz/BCJDecoder;->isBCJFilterID(J)Z

    move-result v1

    if-eqz v1, :cond_1aa

    new-instance v1, Lorg/tukaani/xz/BCJDecoder;

    aget-wide v5, v2, v0

    aget-object v7, v3, v0

    invoke-direct {v1, v5, v6, v7}, Lorg/tukaani/xz/BCJDecoder;-><init>(J[B)V

    aput-object v1, v4, v0

    goto :goto_181

    :cond_1aa
    new-instance v1, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Unknown Filter ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-wide v4, v2, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1c5
    invoke-static {v4}, Lorg/tukaani/xz/RawCoder;->validate([Lorg/tukaani/xz/FilterCoder;)V

    if-ltz p3, :cond_1e1

    const/4 v1, 0x0

    const/4 v0, 0x0

    :goto_1cc
    array-length v2, v4

    if-ge v0, v2, :cond_1d9

    aget-object v2, v4, v0

    invoke-interface {v2}, Lorg/tukaani/xz/FilterDecoder;->getMemoryUsage()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1cc

    :cond_1d9
    if-le v1, p3, :cond_1e1

    new-instance v0, Lorg/tukaani/xz/MemoryLimitException;

    invoke-direct {v0, v1, p3}, Lorg/tukaani/xz/MemoryLimitException;-><init>(II)V

    throw v0

    :cond_1e1
    new-instance v0, Lorg/tukaani/xz/CountingInputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/CountingInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->inCounted:Lorg/tukaani/xz/CountingInputStream;

    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->inCounted:Lorg/tukaani/xz/CountingInputStream;

    iput-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    array-length v0, v4

    add-int/lit8 v0, v0, -0x1

    :goto_1ef
    if-ltz v0, :cond_1fe

    aget-object v1, v4, v0

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    invoke-interface {v1, v2}, Lorg/tukaani/xz/FilterDecoder;->getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    add-int/lit8 v0, v0, -0x1

    goto :goto_1ef

    :cond_1fe
    return-void
.end method

.method private validate()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v4, -0x1

    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->inCounted:Lorg/tukaani/xz/CountingInputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/CountingInputStream;->getSize()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_14

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeInHeader:J

    cmp-long v2, v2, v0

    if-nez v2, :cond_22

    :cond_14
    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_29

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_29

    :cond_22
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_28
    move-wide v0, v2

    :cond_29
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    const-wide/16 v4, 0x3

    and-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-eqz v0, :cond_43

    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->inData:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-eqz v0, :cond_28

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_43
    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v0}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v0

    new-array v0, v0, [B

    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->inData:Ljava/io/DataInputStream;

    invoke-virtual {v1, v0}, Ljava/io/DataInputStream;->readFully([B)V

    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v1}, Lorg/tukaani/xz/check/Check;->finish()[B

    move-result-object v1

    invoke-static {v1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_81

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Integrity check ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v2}, Lorg/tukaani/xz/check/Check;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ") does not match"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_81
    return-void
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public getUncompressedSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    return-wide v0
.end method

.method public getUnpaddedSize()J
    .registers 5

    iget v0, p0, Lorg/tukaani/xz/BlockInputStream;->headerSize:I

    int-to-long v0, v0

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->inCounted:Lorg/tukaani/xz/CountingInputStream;

    invoke-virtual {v2}, Lorg/tukaani/xz/CountingInputStream;->getSize()J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v2}, Lorg/tukaani/xz/check/Check;->getSize()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
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

    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/BlockInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/BlockInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v7, 0x0

    const/4 v6, 0x1

    const/4 v0, -0x1

    iget-boolean v1, p0, Lorg/tukaani/xz/BlockInputStream;->endReached:Z

    if-eqz v1, :cond_9

    :goto_8
    return v0

    :cond_9
    iget-object v1, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    if-lez v1, :cond_67

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->check:Lorg/tukaani/xz/check/Check;

    invoke-virtual {v2, p1, p2, v1}, Lorg/tukaani/xz/check/Check;->update([BII)V

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    int-to-long v4, v1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->inCounted:Lorg/tukaani/xz/CountingInputStream;

    invoke-virtual {v2}, Lorg/tukaani/xz/CountingInputStream;->getSize()J

    move-result-wide v2

    cmp-long v4, v2, v7

    if-ltz v4, :cond_42

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->compressedSizeLimit:J

    cmp-long v2, v2, v4

    if-gtz v2, :cond_42

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    cmp-long v2, v2, v7

    if-ltz v2, :cond_42

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_48

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_48

    :cond_42
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_48
    if-lt v1, p3, :cond_52

    iget-wide v2, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSize:J

    iget-wide v4, p0, Lorg/tukaani/xz/BlockInputStream;->uncompressedSizeInHeader:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_65

    :cond_52
    iget-object v2, p0, Lorg/tukaani/xz/BlockInputStream;->filterChain:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    if-eq v2, v0, :cond_60

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_60
    invoke-direct {p0}, Lorg/tukaani/xz/BlockInputStream;->validate()V

    iput-boolean v6, p0, Lorg/tukaani/xz/BlockInputStream;->endReached:Z

    :cond_65
    :goto_65
    move v0, v1

    goto :goto_8

    :cond_67
    if-ne v1, v0, :cond_65

    invoke-direct {p0}, Lorg/tukaani/xz/BlockInputStream;->validate()V

    iput-boolean v6, p0, Lorg/tukaani/xz/BlockInputStream;->endReached:Z

    goto :goto_65
.end method
