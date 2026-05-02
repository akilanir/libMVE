.class public Lorg/apache/commons/compress/archivers/tar/TarUtils;
.super Ljava/lang/Object;
.source "TarUtils.java"


# static fields
.field private static final BYTE_MASK:I = 0xff

.field static final DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

.field static final FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->getZipEncoding(Ljava/lang/String;)Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    .line 47
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarUtils$1;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils$1;-><init>()V

    sput-object v0, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method

.method public static computeCheckSum([B)J
    .registers 9
    .param p0, "buf"    # [B

    .prologue
    .line 559
    const-wide/16 v4, 0x0

    .line 561
    .local v4, "sum":J
    move-object v0, p0

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_5
    if-ge v2, v3, :cond_10

    aget-byte v1, v0, v2

    .line 562
    .local v1, "element":B
    and-int/lit16 v6, v1, 0xff

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 561
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 565
    .end local v1    # "element":B
    :cond_10
    return-wide v4
.end method

.method private static exceptionMessage([BIIIB)Ljava/lang/String;
    .registers 9
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "current"    # I
    .param p4, "currentByte"    # B

    .prologue
    .line 242
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    .line 244
    .local v1, "string":Ljava/lang/String;
    const-string v2, "\u0000"

    const-string v3, "{NUL}"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 245
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid byte "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at offset "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sub-int v3, p3, p1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    .local v0, "s":Ljava/lang/String;
    return-object v0
.end method

.method private static formatBigIntegerBinary(J[BIIZ)V
    .registers 14
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "negative"    # Z

    .prologue
    const/4 v6, 0x0

    .line 516
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    .line 517
    .local v5, "val":Ljava/math/BigInteger;
    invoke-virtual {v5}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 518
    .local v0, "b":[B
    array-length v3, v0

    .line 519
    .local v3, "len":I
    add-int v7, p3, p4

    sub-int v4, v7, v3

    .line 520
    .local v4, "off":I
    invoke-static {v0, v6, p2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 521
    if-eqz p5, :cond_15

    const/16 v6, 0xff

    :cond_15
    int-to-byte v1, v6

    .line 522
    .local v1, "fill":B
    add-int/lit8 v2, p3, 0x1

    .local v2, "i":I
    :goto_18
    if-ge v2, v4, :cond_1f

    .line 523
    aput-byte v1, p2, v2

    .line 522
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 525
    :cond_1f
    return-void
.end method

.method public static formatCheckSumOctalBytes(J[BII)I
    .registers 9
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 543
    add-int/lit8 v0, p4, -0x2

    .line 544
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 546
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "idx":I
    .local v1, "idx":I
    add-int v2, p3, v0

    const/4 v3, 0x0

    aput-byte v3, p2, v2

    .line 547
    add-int v2, p3, v1

    const/16 v3, 0x20

    aput-byte v3, p2, v2

    .line 549
    add-int v2, p3, p4

    return v2
.end method

.method private static formatLongBinary(J[BIIZ)V
    .registers 16
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "negative"    # Z

    .prologue
    const-wide/16 v8, 0x1

    .line 494
    add-int/lit8 v6, p4, -0x1

    mul-int/lit8 v0, v6, 0x8

    .line 495
    .local v0, "bits":I
    shl-long v2, v8, v0

    .line 496
    .local v2, "max":J
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    .line 497
    .local v4, "val":J
    cmp-long v6, v4, v2

    if-ltz v6, :cond_39

    .line 498
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Value "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is too large for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " byte field."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 501
    :cond_39
    if-eqz p5, :cond_44

    .line 502
    sub-long v6, v2, v8

    xor-long/2addr v4, v6

    .line 503
    const/16 v6, 0xff

    shl-int/2addr v6, v0

    int-to-long v6, v6

    or-long/2addr v4, v6

    .line 504
    add-long/2addr v4, v8

    .line 506
    :cond_44
    add-int v6, p3, p4

    add-int/lit8 v1, v6, -0x1

    .local v1, "i":I
    :goto_48
    if-lt v1, p3, :cond_54

    .line 507
    long-to-int v6, v4

    int-to-byte v6, v6

    aput-byte v6, p2, v1

    .line 508
    const/16 v6, 0x8

    shr-long/2addr v4, v6

    .line 506
    add-int/lit8 v1, v1, -0x1

    goto :goto_48

    .line 510
    :cond_54
    return-void
.end method

.method public static formatLongOctalBytes(J[BII)I
    .registers 8
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 446
    add-int/lit8 v0, p4, -0x1

    .line 448
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 449
    add-int v1, p3, v0

    const/16 v2, 0x20

    aput-byte v2, p2, v1

    .line 451
    add-int v1, p3, p4

    return v1
.end method

.method public static formatLongOctalOrBinaryBytes(J[BII)I
    .registers 13
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 475
    const/16 v0, 0x8

    if-ne p4, v0, :cond_19

    const-wide/32 v6, 0x1fffff

    .line 477
    .local v6, "maxAsOctalChar":J
    :goto_7
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_1f

    const/4 v5, 0x1

    .line 478
    .local v5, "negative":Z
    :goto_e
    if-nez v5, :cond_21

    cmp-long v0, p0, v6

    if-gtz v0, :cond_21

    .line 479
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongOctalBytes(J[BII)I

    move-result v0

    .line 488
    :goto_18
    return v0

    .line 475
    .end local v5    # "negative":Z
    .end local v6    # "maxAsOctalChar":J
    :cond_19
    const-wide v6, 0x1ffffffffL

    goto :goto_7

    .line 477
    .restart local v6    # "maxAsOctalChar":J
    :cond_1f
    const/4 v5, 0x0

    goto :goto_e

    .line 482
    .restart local v5    # "negative":Z
    :cond_21
    const/16 v0, 0x9

    if-ge p4, v0, :cond_2c

    move-wide v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 483
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatLongBinary(J[BIIZ)V

    :cond_2c
    move-wide v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    .line 485
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatBigIntegerBinary(J[BIIZ)V

    .line 487
    if-eqz v5, :cond_3d

    const/16 v0, 0xff

    :goto_37
    int-to-byte v0, v0

    aput-byte v0, p2, p3

    .line 488
    add-int v0, p3, p4

    goto :goto_18

    .line 487
    :cond_3d
    const/16 v0, 0x80

    goto :goto_37
.end method

.method public static formatNameBytes(Ljava/lang/String;[BII)I
    .registers 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 321
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, p3, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v2

    .line 324
    :goto_6
    return v2

    .line 322
    :catch_7
    move-exception v0

    .line 324
    .local v0, "ex":Ljava/io/IOException;
    :try_start_8
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, p3, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_f

    move-result v2

    goto :goto_6

    .line 326
    :catch_f
    move-exception v1

    .line 328
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static formatNameBytes(Ljava/lang/String;[BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)I
    .registers 12
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 355
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 356
    .local v2, "len":I
    invoke-interface {p4, p0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 357
    .local v0, "b":Ljava/nio/ByteBuffer;
    :goto_9
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    if-le v4, p3, :cond_1c

    if-lez v2, :cond_1c

    .line 358
    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p4, v4}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_9

    .line 360
    :cond_1c
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    sub-int v3, v4, v5

    .line 361
    .local v3, "limit":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v5

    invoke-static {v4, v5, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 364
    move v1, v3

    .local v1, "i":I
    :goto_32
    if-ge v1, p3, :cond_3b

    .line 365
    add-int v4, p2, v1

    aput-byte v6, p1, v4

    .line 364
    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    .line 368
    :cond_3b
    add-int v4, p2, p3

    return v4
.end method

.method public static formatOctalBytes(J[BII)I
    .registers 9
    .param p0, "value"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 421
    add-int/lit8 v0, p4, -0x2

    .line 422
    .local v0, "idx":I
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->formatUnsignedOctalString(J[BII)V

    .line 424
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "idx":I
    .local v1, "idx":I
    add-int v2, p3, v0

    const/16 v3, 0x20

    aput-byte v3, p2, v2

    .line 425
    add-int v2, p3, v1

    const/4 v3, 0x0

    aput-byte v3, p2, v2

    .line 427
    add-int v2, p3, p4

    return v2
.end method

.method public static formatUnsignedOctalString(J[BII)V
    .registers 15
    .param p0, "value"    # J
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    const/16 v9, 0x30

    const-wide/16 v7, 0x0

    .line 382
    move v0, p4

    .line 383
    .local v0, "remaining":I
    add-int/lit8 v0, v0, -0x1

    .line 384
    cmp-long v4, p0, v7

    if-nez v4, :cond_1b

    .line 385
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "remaining":I
    .local v1, "remaining":I
    add-int v4, p3, v0

    aput-byte v9, p2, v4

    move v0, v1

    .line 400
    .end local v1    # "remaining":I
    .restart local v0    # "remaining":I
    :cond_12
    :goto_12
    if-ltz v0, :cond_62

    .line 401
    add-int v4, p3, v0

    aput-byte v9, p2, v4

    .line 400
    add-int/lit8 v0, v0, -0x1

    goto :goto_12

    .line 387
    :cond_1b
    move-wide v2, p0

    .line 388
    .local v2, "val":J
    :goto_1c
    if-ltz v0, :cond_33

    cmp-long v4, v2, v7

    if-eqz v4, :cond_33

    .line 390
    add-int v4, p3, v0

    const-wide/16 v5, 0x7

    and-long/2addr v5, v2

    long-to-int v5, v5

    int-to-byte v5, v5

    add-int/lit8 v5, v5, 0x30

    int-to-byte v5, v5

    aput-byte v5, p2, v4

    .line 391
    const/4 v4, 0x3

    ushr-long/2addr v2, v4

    .line 388
    add-int/lit8 v0, v0, -0x1

    goto :goto_1c

    .line 394
    :cond_33
    cmp-long v4, v2, v7

    if-eqz v4, :cond_12

    .line 395
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p0, p1}, Ljava/lang/Long;->toOctalString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " will not fit in octal number buffer of length "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 403
    .end local v2    # "val":J
    :cond_62
    return-void
.end method

.method private static parseBinaryBigInteger([BIIZ)J
    .registers 9
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "negative"    # Z

    .prologue
    .line 202
    add-int/lit8 v2, p2, -0x1

    new-array v0, v2, [B

    .line 203
    .local v0, "remainder":[B
    add-int/lit8 v2, p1, 0x1

    const/4 v3, 0x0

    add-int/lit8 v4, p2, -0x1

    invoke-static {p0, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>([B)V

    .line 205
    .local v1, "val":Ljava/math/BigInteger;
    if-eqz p3, :cond_21

    .line 207
    const-wide/16 v2, -0x1

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->not()Ljava/math/BigInteger;

    move-result-object v1

    .line 209
    :cond_21
    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    const/16 v3, 0x3f

    if-le v2, v3, :cond_5e

    .line 210
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "At offset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " byte binary number"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " exceeds maximum signed long"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 215
    :cond_5e
    if-eqz p3, :cond_66

    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    neg-long v2, v2

    :goto_65
    return-wide v2

    :cond_66
    invoke-virtual {v1}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v2

    goto :goto_65
.end method

.method private static parseBinaryLong([BIIZ)J
    .registers 13
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "negative"    # Z

    .prologue
    const-wide/16 v7, 0x1

    .line 180
    const/16 v3, 0x9

    if-lt p2, v3, :cond_3b

    .line 181
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "At offset "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " byte binary number"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " exceeds maximum signed long"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " value"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 186
    :cond_3b
    const-wide/16 v1, 0x0

    .line 187
    .local v1, "val":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_3e
    if-ge v0, p2, :cond_50

    .line 188
    const/16 v3, 0x8

    shl-long v3, v1, v3

    add-int v5, p1, v0

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    add-long v1, v3, v5

    .line 187
    add-int/lit8 v0, v0, 0x1

    goto :goto_3e

    .line 190
    :cond_50
    if-eqz p3, :cond_61

    .line 192
    sub-long/2addr v1, v7

    .line 193
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    add-int/lit8 v5, p2, -0x1

    mul-int/lit8 v5, v5, 0x8

    int-to-double v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-long v3, v3

    sub-long/2addr v3, v7

    xor-long/2addr v1, v3

    .line 195
    :cond_61
    if-eqz p3, :cond_64

    neg-long v1, v1

    .end local v1    # "val":J
    :cond_64
    return-wide v1
.end method

.method public static parseBoolean([BI)Z
    .registers 4
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I

    .prologue
    const/4 v0, 0x1

    .line 229
    aget-byte v1, p0, p1

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static parseName([BII)Ljava/lang/String;
    .registers 6
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 261
    :try_start_0
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->DEFAULT_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v2

    .line 264
    :goto_6
    return-object v2

    .line 262
    :catch_7
    move-exception v0

    .line 264
    .local v0, "ex":Ljava/io/IOException;
    :try_start_8
    sget-object v2, Lorg/apache/commons/compress/archivers/tar/TarUtils;->FALLBACK_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-static {p0, p1, p2, v2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_f

    move-result-object v2

    goto :goto_6

    .line 265
    :catch_f
    move-exception v1

    .line 267
    .local v1, "ex2":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static parseName([BIILorg/apache/commons/compress/archivers/zip/ZipEncoding;)Ljava/lang/String;
    .registers 7
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    move v1, p2

    .line 291
    .local v1, "len":I
    :goto_1
    if-lez v1, :cond_b

    .line 292
    add-int v2, p1, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    if-eqz v2, :cond_18

    .line 296
    :cond_b
    if-lez v1, :cond_1b

    .line 297
    new-array v0, v1, [B

    .line 298
    .local v0, "b":[B
    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    invoke-interface {p3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    move-result-object v2

    .line 301
    .end local v0    # "b":[B
    :goto_17
    return-object v2

    .line 291
    :cond_18
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 301
    :cond_1b
    const-string v2, ""

    goto :goto_17
.end method

.method public static parseOctal([BII)J
    .registers 13
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/16 v7, 0x20

    .line 102
    const-wide/16 v2, 0x0

    .line 103
    .local v2, "result":J
    add-int v1, p1, p2

    .line 104
    .local v1, "end":I
    move v4, p1

    .line 106
    .local v4, "start":I
    const/4 v6, 0x2

    if-ge p2, v6, :cond_29

    .line 107
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Length "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " must be at least 2"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 110
    :cond_29
    aget-byte v6, p0, v4

    if-nez v6, :cond_30

    .line 111
    const-wide/16 v6, 0x0

    .line 144
    :goto_2f
    return-wide v6

    .line 115
    :cond_30
    :goto_30
    if-ge v4, v1, :cond_39

    .line 116
    aget-byte v6, p0, v4

    if-ne v6, v7, :cond_39

    .line 117
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    .line 127
    :cond_39
    add-int/lit8 v6, v1, -0x1

    aget-byte v5, p0, v6

    .line 128
    .local v5, "trailer":B
    :goto_3d
    if-ge v4, v1, :cond_54

    if-eqz v5, :cond_43

    if-ne v5, v7, :cond_54

    .line 129
    :cond_43
    add-int/lit8 v1, v1, -0x1

    .line 130
    add-int/lit8 v6, v1, -0x1

    aget-byte v5, p0, v6

    goto :goto_3d

    .line 140
    .local v0, "currentByte":B
    :cond_4a
    const/4 v6, 0x3

    shl-long v6, v2, v6

    add-int/lit8 v8, v0, -0x30

    int-to-long v8, v8

    add-long v2, v6, v8

    .line 133
    add-int/lit8 v4, v4, 0x1

    .end local v0    # "currentByte":B
    :cond_54
    if-ge v4, v1, :cond_6a

    .line 134
    aget-byte v0, p0, v4

    .line 136
    .restart local v0    # "currentByte":B
    const/16 v6, 0x30

    if-lt v0, v6, :cond_60

    const/16 v6, 0x37

    if-le v0, v6, :cond_4a

    .line 137
    :cond_60
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-static {p0, p1, p2, v4, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->exceptionMessage([BIIIB)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v0    # "currentByte":B
    :cond_6a
    move-wide v6, v2

    .line 144
    goto :goto_2f
.end method

.method public static parseOctalOrBinary([BII)J
    .registers 6
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 167
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_b

    .line 168
    invoke-static {p0, p1, p2}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v1

    .line 174
    :goto_a
    return-wide v1

    .line 170
    :cond_b
    aget-byte v1, p0, p1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1a

    const/4 v0, 0x1

    .line 171
    .local v0, "negative":Z
    :goto_11
    const/16 v1, 0x9

    if-ge p2, v1, :cond_1c

    .line 172
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBinaryLong([BIIZ)J

    move-result-wide v1

    goto :goto_a

    .line 170
    .end local v0    # "negative":Z
    :cond_1a
    const/4 v0, 0x0

    goto :goto_11

    .line 174
    .restart local v0    # "negative":Z
    :cond_1c
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/compress/archivers/tar/TarUtils;->parseBinaryBigInteger([BIIZ)J

    move-result-wide v1

    goto :goto_a
.end method

.method public static verifyCheckSum([B)Z
    .registers 15
    .param p0, "header"    # [B

    .prologue
    .line 604
    const-wide/16 v6, 0x0

    .line 605
    .local v6, "storedSum":J
    const-wide/16 v8, 0x0

    .line 606
    .local v8, "unsignedSum":J
    const-wide/16 v4, 0x0

    .line 608
    .local v4, "signedSum":J
    const/4 v1, 0x0

    .line 609
    .local v1, "digits":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    array-length v10, p0

    if-ge v3, v10, :cond_3c

    .line 610
    aget-byte v0, p0, v3

    .line 611
    .local v0, "b":B
    const/16 v10, 0x94

    if-gt v10, v3, :cond_2e

    const/16 v10, 0x9c

    if-ge v3, v10, :cond_2e

    .line 612
    const/16 v10, 0x30

    if-gt v10, v0, :cond_38

    const/16 v10, 0x37

    if-gt v0, v10, :cond_38

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "digits":I
    .local v2, "digits":I
    const/4 v10, 0x6

    if-ge v1, v10, :cond_37

    .line 613
    const-wide/16 v10, 0x8

    mul-long/2addr v10, v6

    int-to-long v12, v0

    add-long/2addr v10, v12

    const-wide/16 v12, 0x30

    sub-long v6, v10, v12

    move v1, v2

    .line 617
    .end local v2    # "digits":I
    .restart local v1    # "digits":I
    :cond_2c
    :goto_2c
    const/16 v0, 0x20

    .line 619
    :cond_2e
    and-int/lit16 v10, v0, 0xff

    int-to-long v10, v10

    add-long/2addr v8, v10

    .line 620
    int-to-long v10, v0

    add-long/2addr v4, v10

    .line 609
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .end local v1    # "digits":I
    .restart local v2    # "digits":I
    :cond_37
    move v1, v2

    .line 614
    .end local v2    # "digits":I
    .restart local v1    # "digits":I
    :cond_38
    if-lez v1, :cond_2c

    .line 615
    const/4 v1, 0x6

    goto :goto_2c

    .line 623
    .end local v0    # "b":B
    :cond_3c
    cmp-long v10, v6, v8

    if-eqz v10, :cond_48

    cmp-long v10, v6, v4

    if-eqz v10, :cond_48

    cmp-long v10, v6, v8

    if-lez v10, :cond_4a

    :cond_48
    const/4 v10, 0x1

    :goto_49
    return v10

    :cond_4a
    const/4 v10, 0x0

    goto :goto_49
.end method
