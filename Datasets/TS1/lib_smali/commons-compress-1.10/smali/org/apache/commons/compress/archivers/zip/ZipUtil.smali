.class public abstract Lorg/apache/commons/compress/archivers/zip/ZipUtil;
.super Ljava/lang/Object;
.source "ZipUtil.java"


# static fields
.field private static final DOS_TIME_MIN:[B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 35
    const-wide/16 v0, 0x2100

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes(J)[B

    move-result-object v0

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static adjustToLong(I)J
    .registers 5
    .param p0, "i"    # I

    .prologue
    .line 100
    if-gez p0, :cond_a

    .line 101
    const-wide v0, 0x100000000L

    int-to-long v2, p0

    add-long/2addr v0, v2

    .line 103
    :goto_9
    return-wide v0

    :cond_a
    int-to-long v0, p0

    goto :goto_9
.end method

.method static bigToLong(Ljava/math/BigInteger;)J
    .registers 4
    .param p0, "big"    # Ljava/math/BigInteger;

    .prologue
    .line 136
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    const/16 v1, 0x3f

    if-gt v0, v1, :cond_d

    .line 137
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 139
    :cond_d
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The BigInteger cannot fit inside a 64 bit java long: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static canHandleEntryData(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 2
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 313
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method static checkRequestedFeatures(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 4
    .param p0, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;
        }
    .end annotation

    .prologue
    .line 345
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 346
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->ENCRYPTION:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    invoke-direct {v1, v2, p0}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v1

    .line 350
    :cond_e
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z

    move-result v1

    if-nez v1, :cond_2c

    .line 351
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    move-result-object v0

    .line 352
    .local v0, "m":Lorg/apache/commons/compress/archivers/zip/ZipMethod;
    if-nez v0, :cond_26

    .line 353
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;->METHOD:Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;

    invoke-direct {v1, v2, p0}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v1

    .line 357
    :cond_26
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;

    invoke-direct {v1, v0, p0}, Lorg/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipMethod;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    throw v1

    .line 360
    .end local v0    # "m":Lorg/apache/commons/compress/archivers/zip/ZipMethod;
    :cond_2c
    return-void
.end method

.method static copy([B[BI)V
    .registers 5
    .param p0, "from"    # [B
    .param p1, "to"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 303
    if-eqz p0, :cond_7

    .line 304
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 306
    :cond_7
    return-void
.end method

.method static copy([B)[B
    .registers 4
    .param p0, "from"    # [B

    .prologue
    const/4 v2, 0x0

    .line 295
    if-eqz p0, :cond_b

    .line 296
    array-length v1, p0

    new-array v0, v1, [B

    .line 297
    .local v0, "to":[B
    array-length v1, v0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    .end local v0    # "to":[B
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static dosToJavaTime(J)J
    .registers 11
    .param p0, "dosTime"    # J

    .prologue
    const/16 v8, 0xb

    const/4 v7, 0x5

    const/4 v6, 0x1

    .line 218
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 220
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0x19

    shr-long v1, p0, v1

    const-wide/16 v3, 0x7f

    and-long/2addr v1, v3

    long-to-int v1, v1

    add-int/lit16 v1, v1, 0x7bc

    invoke-virtual {v0, v6, v1}, Ljava/util/Calendar;->set(II)V

    .line 221
    const/4 v1, 0x2

    const/16 v2, 0x15

    shr-long v2, p0, v2

    const-wide/16 v4, 0xf

    and-long/2addr v2, v4

    long-to-int v2, v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 222
    const/16 v1, 0x10

    shr-long v1, p0, v1

    long-to-int v1, v1

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v7, v1}, Ljava/util/Calendar;->set(II)V

    .line 223
    shr-long v1, p0, v8

    long-to-int v1, v1

    and-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0, v8, v1}, Ljava/util/Calendar;->set(II)V

    .line 224
    const/16 v1, 0xc

    shr-long v2, p0, v7

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3f

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 225
    const/16 v1, 0xd

    shl-long v2, p0, v6

    long-to-int v2, v2

    and-int/lit8 v2, v2, 0x3e

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 226
    const/16 v1, 0xe

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 228
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    return-wide v1
.end method

.method public static fromDosTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)Ljava/util/Date;
    .registers 6
    .param p0, "zipDosTime"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 207
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v0

    .line 208
    .local v0, "dosTime":J
    new-instance v2, Ljava/util/Date;

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    return-object v2
.end method

.method private static getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;
    .registers 9
    .param p0, "f"    # Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;
    .param p1, "orig"    # [B

    .prologue
    const/4 v4, 0x0

    .line 269
    if-eqz p0, :cond_21

    .line 270
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 271
    .local v0, "crc32":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p1}, Ljava/util/zip/CRC32;->update([B)V

    .line 272
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    .line 274
    .local v2, "origCRC32":J
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;->getNameCRC32()J

    move-result-wide v5

    cmp-long v5, v2, v5

    if-nez v5, :cond_21

    .line 276
    :try_start_17
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/compress/archivers/zip/ZipEncoding;

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;->getUnicodeName()[B

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/compress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_20} :catch_22

    move-result-object v4

    .line 287
    .end local v0    # "crc32":Ljava/util/zip/CRC32;
    .end local v2    # "origCRC32":J
    :cond_21
    :goto_21
    return-object v4

    .line 278
    .restart local v0    # "crc32":Ljava/util/zip/CRC32;
    .restart local v2    # "origCRC32":J
    :catch_22
    move-exception v1

    .line 283
    .local v1, "ex":Ljava/io/IOException;
    goto :goto_21
.end method

.method static longToBig(J)Ljava/math/BigInteger;
    .registers 6
    .param p0, "l"    # J

    .prologue
    const-wide/32 v2, -0x80000000

    .line 155
    cmp-long v0, p0, v2

    if-gez v0, :cond_26

    .line 156
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative longs < -2^31 not permitted: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_26
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_35

    cmp-long v0, p0, v2

    if-ltz v0, :cond_35

    .line 160
    long-to-int v0, p0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->adjustToLong(I)J

    move-result-wide p0

    .line 162
    :cond_35
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static reverse([B)[B
    .registers 5
    .param p0, "array"    # [B

    .prologue
    .line 119
    array-length v3, p0

    add-int/lit8 v2, v3, -0x1

    .line 120
    .local v2, "z":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v3, p0

    div-int/lit8 v3, v3, 0x2

    if-ge v0, v3, :cond_18

    .line 121
    aget-byte v1, p0, v0

    .line 122
    .local v1, "x":B
    sub-int v3, v2, v0

    aget-byte v3, p0, v3

    aput-byte v3, p0, v0

    .line 123
    sub-int v3, v2, v0

    aput-byte v1, p0, v3

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 125
    .end local v1    # "x":B
    :cond_18
    return-object p0
.end method

.method static setNameAndCommentFromExtraFields(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;[B[B)V
    .registers 9
    .param p0, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p1, "originalNameBytes"    # [B
    .param p2, "commentBytes"    # [B

    .prologue
    .line 239
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;

    .line 241
    .local v1, "name":Lorg/apache/commons/compress/archivers/zip/UnicodePathExtraField;
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 242
    .local v4, "originalName":Ljava/lang/String;
    invoke-static {v1, p1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "newName":Ljava/lang/String;
    if-eqz v3, :cond_1b

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1b

    .line 245
    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 248
    :cond_1b
    if-eqz p2, :cond_31

    array-length v5, p2

    if-lez v5, :cond_31

    .line 249
    sget-object v5, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;->UCOM_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    invoke-virtual {p0, v5}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;

    .line 251
    .local v0, "cmt":Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;
    invoke-static {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "newComment":Ljava/lang/String;
    if-eqz v2, :cond_31

    .line 254
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setComment(Ljava/lang/String;)V

    .line 257
    .end local v0    # "cmt":Lorg/apache/commons/compress/archivers/zip/UnicodeCommentExtraField;
    .end local v2    # "newComment":Ljava/lang/String;
    :cond_31
    return-void
.end method

.method public static signedByteToUnsignedInt(B)I
    .registers 1
    .param p0, "b"    # B

    .prologue
    .line 174
    if-ltz p0, :cond_3

    .line 177
    .end local p0    # "b":B
    :goto_2
    return p0

    .restart local p0    # "b":B
    :cond_3
    add-int/lit16 p0, p0, 0x100

    goto :goto_2
.end method

.method private static supportsEncryptionOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 2
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 323
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->usesEncryption()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static supportsMethodOf(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)Z
    .registers 3
    .param p0, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 333
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v1

    if-eq v0, v1, :cond_26

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    sget-object v1, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/compress/archivers/zip/ZipMethod;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipMethod;->getCode()I

    move-result v1

    if-eq v0, v1, :cond_26

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_28

    :cond_26
    const/4 v0, 0x1

    :goto_27
    return v0

    :cond_28
    const/4 v0, 0x0

    goto :goto_27
.end method

.method public static toDosTime(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .registers 4
    .param p0, "time"    # Ljava/util/Date;

    .prologue
    .line 43
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([B)V

    return-object v0
.end method

.method public static toDosTime(J[BI)V
    .registers 5
    .param p0, "t"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    .line 70
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-static {v0, p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    .line 71
    return-void
.end method

.method static toDosTime(Ljava/util/Calendar;J[BI)V
    .registers 12
    .param p0, "c"    # Ljava/util/Calendar;
    .param p1, "t"    # J
    .param p3, "buf"    # [B
    .param p4, "offset"    # I

    .prologue
    .line 74
    invoke-virtual {p0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 76
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 77
    .local v3, "year":I
    const/16 v4, 0x7bc

    if-ge v3, v4, :cond_16

    .line 78
    sget-object v4, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    array-length v6, v6

    invoke-static {v4, v5, p3, p4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    :goto_15
    return-void

    .line 81
    :cond_16
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v0, v4, 0x1

    .line 82
    .local v0, "month":I
    add-int/lit16 v4, v3, -0x7bc

    shl-int/lit8 v4, v4, 0x19

    shl-int/lit8 v5, v0, 0x15

    or-int/2addr v4, v5

    const/4 v5, 0x5

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    shl-int/lit8 v5, v5, 0x10

    or-int/2addr v4, v5

    const/16 v5, 0xb

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    shl-int/lit8 v5, v5, 0xb

    or-int/2addr v4, v5

    const/16 v5, 0xc

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    shl-int/lit8 v5, v5, 0x5

    or-int/2addr v4, v5

    const/16 v5, 0xd

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    or-int/2addr v4, v5

    int-to-long v1, v4

    .line 88
    .local v1, "value":J
    invoke-static {v1, v2, p3, p4}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->putLong(J[BI)V

    goto :goto_15
.end method

.method public static toDosTime(J)[B
    .registers 4
    .param p0, "t"    # J

    .prologue
    .line 54
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 55
    .local v0, "result":[B
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->toDosTime(J[BI)V

    .line 56
    return-object v0
.end method

.method public static unsignedIntToSignedByte(I)B
    .registers 4
    .param p0, "i"    # I

    .prologue
    .line 190
    const/16 v0, 0xff

    if-gt p0, v0, :cond_6

    if-gez p0, :cond_25

    .line 191
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can only convert non-negative integers between [0,255] to byte: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_25
    const/16 v0, 0x80

    if-ge p0, v0, :cond_2b

    .line 194
    int-to-byte v0, p0

    .line 196
    :goto_2a
    return v0

    :cond_2b
    add-int/lit16 v0, p0, -0x100

    int-to-byte v0, v0

    goto :goto_2a
.end method
