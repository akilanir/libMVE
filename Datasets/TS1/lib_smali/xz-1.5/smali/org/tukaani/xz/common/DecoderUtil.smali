.class public Lorg/tukaani/xz/common/DecoderUtil;
.super Lorg/tukaani/xz/common/Util;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/tukaani/xz/common/Util;-><init>()V

    return-void
.end method

.method public static areStreamFlagsEqual(Lorg/tukaani/xz/common/StreamFlags;Lorg/tukaani/xz/common/StreamFlags;)Z
    .registers 4

    iget v0, p0, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    iget v1, p1, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static decodeStreamFlags([BI)Lorg/tukaani/xz/common/StreamFlags;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    aget-byte v0, p0, p1

    if-nez v0, :cond_e

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0x10

    if-lt v0, v1, :cond_14

    :cond_e
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    invoke-direct {v0}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>()V

    throw v0

    :cond_14
    new-instance v0, Lorg/tukaani/xz/common/StreamFlags;

    invoke-direct {v0}, Lorg/tukaani/xz/common/StreamFlags;-><init>()V

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    iput v1, v0, Lorg/tukaani/xz/common/StreamFlags;->checkType:I

    return-object v0
.end method

.method public static decodeStreamFooter([B)Lorg/tukaani/xz/common/StreamFlags;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x4

    const/4 v0, 0x0

    const/16 v1, 0xa

    aget-byte v1, p0, v1

    sget-object v2, Lorg/tukaani/xz/XZ;->FOOTER_MAGIC:[B

    aget-byte v2, v2, v0

    if-ne v1, v2, :cond_17

    const/16 v1, 0xb

    aget-byte v1, p0, v1

    sget-object v2, Lorg/tukaani/xz/XZ;->FOOTER_MAGIC:[B

    const/4 v3, 0x1

    aget-byte v2, v2, v3

    if-eq v1, v2, :cond_1f

    :cond_17
    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Stream Footer is corrupt"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f
    const/4 v1, 0x6

    invoke-static {p0, v6, v1, v0}, Lorg/tukaani/xz/common/DecoderUtil;->isCRC32Valid([BIII)Z

    move-result v1

    if-nez v1, :cond_2e

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Stream Footer is corrupt"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2e
    const/16 v1, 0x8

    :try_start_30
    invoke-static {p0, v1}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamFlags([BI)Lorg/tukaani/xz/common/StreamFlags;
    :try_end_33
    .catch Lorg/tukaani/xz/UnsupportedOptionsException; {:try_start_30 .. :try_end_33} :catch_4c

    move-result-object v1

    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    :goto_38
    if-ge v0, v6, :cond_55

    iget-wide v2, v1, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    add-int/lit8 v4, v0, 0x4

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    mul-int/lit8 v5, v0, 0x8

    shl-int/2addr v4, v5

    int-to-long v4, v4

    or-long/2addr v2, v4

    iput-wide v2, v1, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    add-int/lit8 v0, v0, 0x1

    goto :goto_38

    :catch_4c
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported options in XZ Stream Footer"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_55
    iget-wide v2, v1, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    const-wide/16 v4, 0x4

    mul-long/2addr v2, v4

    iput-wide v2, v1, Lorg/tukaani/xz/common/StreamFlags;->backwardSize:J

    return-object v1
.end method

.method public static decodeStreamHeader([B)Lorg/tukaani/xz/common/StreamFlags;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v1, v1

    if-ge v0, v1, :cond_17

    aget-byte v1, p0, v0

    sget-object v2, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    aget-byte v2, v2, v0

    if-eq v1, v2, :cond_14

    new-instance v0, Lorg/tukaani/xz/XZFormatException;

    invoke-direct {v0}, Lorg/tukaani/xz/XZFormatException;-><init>()V

    throw v0

    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    sget-object v0, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v0, v0

    const/4 v1, 0x2

    sget-object v2, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v2, v2

    add-int/lit8 v2, v2, 0x2

    invoke-static {p0, v0, v1, v2}, Lorg/tukaani/xz/common/DecoderUtil;->isCRC32Valid([BIII)Z

    move-result v0

    if-nez v0, :cond_2e

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "XZ Stream Header is corrupt"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2e
    :try_start_2e
    sget-object v0, Lorg/tukaani/xz/XZ;->HEADER_MAGIC:[B

    array-length v0, v0

    invoke-static {p0, v0}, Lorg/tukaani/xz/common/DecoderUtil;->decodeStreamFlags([BI)Lorg/tukaani/xz/common/StreamFlags;
    :try_end_34
    .catch Lorg/tukaani/xz/UnsupportedOptionsException; {:try_start_2e .. :try_end_34} :catch_36

    move-result-object v0

    return-object v0

    :catch_36
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported options in XZ Stream Header"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static decodeVLI(Ljava/io/InputStream;)J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v7, -0x1

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3

    if-ne v3, v7, :cond_d

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_d
    and-int/lit8 v0, v3, 0x7f

    int-to-long v1, v0

    const/4 v0, 0x0

    :goto_11
    and-int/lit16 v3, v3, 0x80

    if-eqz v3, :cond_3d

    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x9

    if-lt v0, v3, :cond_21

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_21
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3

    if-ne v3, v7, :cond_2d

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_2d
    if-nez v3, :cond_35

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_35
    and-int/lit8 v4, v3, 0x7f

    int-to-long v4, v4

    mul-int/lit8 v6, v0, 0x7

    shl-long/2addr v4, v6

    or-long/2addr v1, v4

    goto :goto_11

    :cond_3d
    return-wide v1
.end method

.method public static isCRC32Valid([BIII)Z
    .registers 10

    const/4 v0, 0x0

    new-instance v1, Ljava/util/zip/CRC32;

    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    invoke-virtual {v1, p0, p1, p2}, Ljava/util/zip/CRC32;->update([BII)V

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    move v1, v0

    :goto_e
    const/4 v4, 0x4

    if-ge v1, v4, :cond_21

    mul-int/lit8 v4, v1, 0x8

    ushr-long v4, v2, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    add-int v5, p3, v1

    aget-byte v5, p0, v5

    if-eq v4, v5, :cond_1e

    :goto_1d
    return v0

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_21
    const/4 v0, 0x1

    goto :goto_1d
.end method
