.class public Lorg/apache/james/mime4j/codec/EncoderUtil;
.super Ljava/lang/Object;
.source "EncoderUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;,
        Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;
    }
.end annotation


# static fields
.field private static final ATEXT_CHARS:Ljava/util/BitSet;

.field private static final BASE64_PAD:C = '='

.field private static final BASE64_TABLE:[B

.field private static final ENCODED_WORD_MAX_LENGTH:I = 0x4b

.field private static final ENC_WORD_PREFIX:Ljava/lang/String; = "=?"

.field private static final ENC_WORD_SUFFIX:Ljava/lang/String; = "?="

.field private static final MAX_USED_CHARACTERS:I = 0x32

.field private static final Q_REGULAR_CHARS:Ljava/util/BitSet;

.field private static final Q_RESTRICTED_CHARS:Ljava/util/BitSet;

.field private static final TOKEN_CHARS:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lorg/apache/james/mime4j/codec/Base64OutputStream;->BASE64_TABLE:[B

    sput-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    .line 38
    const-string v0, "=_?"

    invoke-static {v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->initChars(Ljava/lang/String;)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_REGULAR_CHARS:Ljava/util/BitSet;

    .line 40
    const-string v0, "=_?\"#$%&\'(),.:;<>@[\\]^`{|}~"

    invoke-static {v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->initChars(Ljava/lang/String;)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_RESTRICTED_CHARS:Ljava/util/BitSet;

    .line 49
    const-string v0, "()<>@,;:\\\"/[]?="

    invoke-static {v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->initChars(Ljava/lang/String;)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil;->TOKEN_CHARS:Ljava/util/BitSet;

    .line 51
    const-string v0, "()<>@.,;:\\\"[]"

    invoke-static {v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->initChars(Ljava/lang/String;)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil;->ATEXT_CHARS:Ljava/util/BitSet;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    return-void
.end method

.method private static bEncodedLength([B)I
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 512
    array-length v0, p0

    add-int/lit8 v0, v0, 0x2

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v0, v0, 0x4

    return v0
.end method

.method private static determineCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 567
    const/4 v0, 0x1

    .line 568
    .local v0, "ascii":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 569
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_6
    if-ge v2, v3, :cond_1b

    .line 570
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 571
    .local v1, "ch":C
    const/16 v4, 0xff

    if-le v1, v4, :cond_13

    .line 572
    sget-object v4, Lorg/apache/james/mime4j/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    .line 578
    .end local v1    # "ch":C
    :goto_12
    return-object v4

    .line 574
    .restart local v1    # "ch":C
    :cond_13
    const/16 v4, 0x7f

    if-le v1, v4, :cond_18

    .line 575
    const/4 v0, 0x0

    .line 569
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 578
    .end local v1    # "ch":C
    :cond_1b
    if-eqz v0, :cond_20

    sget-object v4, Lorg/apache/james/mime4j/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    goto :goto_12

    :cond_20
    sget-object v4, Lorg/apache/james/mime4j/util/CharsetUtil;->ISO_8859_1:Ljava/nio/charset/Charset;

    goto :goto_12
.end method

.method private static determineEncoding([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;
    .registers 9
    .param p0, "bytes"    # [B
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    .prologue
    .line 582
    array-length v5, p0

    if-nez v5, :cond_6

    .line 583
    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;->Q:Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    .line 597
    :goto_5
    return-object v5

    .line 585
    :cond_6
    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;->TEXT_TOKEN:Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    if-ne p1, v5, :cond_24

    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_REGULAR_CHARS:Ljava/util/BitSet;

    .line 588
    .local v2, "qChars":Ljava/util/BitSet;
    :goto_c
    const/4 v3, 0x0

    .line 589
    .local v3, "qEncoded":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v5, p0

    if-ge v0, v5, :cond_27

    .line 590
    aget-byte v5, p0, v0

    and-int/lit16 v4, v5, 0xff

    .line 591
    .local v4, "v":I
    const/16 v5, 0x20

    if-eq v4, v5, :cond_21

    invoke-virtual {v2, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_21

    .line 592
    add-int/lit8 v3, v3, 0x1

    .line 589
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 585
    .end local v0    # "i":I
    .end local v2    # "qChars":Ljava/util/BitSet;
    .end local v3    # "qEncoded":I
    .end local v4    # "v":I
    :cond_24
    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_RESTRICTED_CHARS:Ljava/util/BitSet;

    goto :goto_c

    .line 596
    .restart local v0    # "i":I
    .restart local v2    # "qChars":Ljava/util/BitSet;
    .restart local v3    # "qEncoded":I
    :cond_27
    mul-int/lit8 v5, v3, 0x64

    array-length v6, p0

    div-int v1, v5, v6

    .line 597
    .local v1, "percentage":I
    const/16 v5, 0x1e

    if-le v1, v5, :cond_33

    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;->B:Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    goto :goto_5

    :cond_33
    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;->Q:Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    goto :goto_5
.end method

.method private static encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B
    .registers 5
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 558
    invoke-virtual {p1, p0}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 559
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    new-array v1, v2, [B

    .line 560
    .local v1, "bytes":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 561
    return-object v1
.end method

.method public static encodeAddressDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "displayName"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->isAtomPhrase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 115
    .end local p0    # "displayName":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 112
    .restart local p0    # "displayName":Ljava/lang/String;
    :cond_7
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->hasToBeEncoded(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 113
    sget-object v0, Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;->WORD_ENTITY:Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    invoke-static {p0, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Ljava/lang/String;

    move-result-object p0

    goto :goto_6

    .line 115
    :cond_15
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static encodeAddressLocalPart(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "localPart"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->isDotAtomText(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 137
    .end local p0    # "localPart":Ljava/lang/String;
    :goto_6
    return-object p0

    .restart local p0    # "localPart":Ljava/lang/String;
    :cond_7
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method private static encodeB(Ljava/lang/String;Ljava/lang/String;ILjava/nio/charset/Charset;[B)Ljava/lang/String;
    .registers 16
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "usedCharacters"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "bytes"    # [B

    .prologue
    const/4 v10, 0x0

    .line 491
    invoke-static {p4}, Lorg/apache/james/mime4j/codec/EncoderUtil;->bEncodedLength([B)I

    move-result v2

    .line 493
    .local v2, "encodedLength":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v2

    const-string v9, "?="

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int v5, v8, v9

    .line 495
    .local v5, "totalLength":I
    rsub-int/lit8 v8, p2, 0x4b

    if-gt v5, v8, :cond_32

    .line 496
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {p4}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeB([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "?="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 507
    :goto_31
    return-object v8

    .line 498
    :cond_32
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {p1, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 499
    .local v3, "part1":Ljava/lang/String;
    invoke-static {v3, p3}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 500
    .local v0, "bytes1":[B
    invoke-static {p0, v3, p2, p3, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeB(Ljava/lang/String;Ljava/lang/String;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v6

    .line 503
    .local v6, "word1":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 504
    .local v4, "part2":Ljava/lang/String;
    invoke-static {v4, p3}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 505
    .local v1, "bytes2":[B
    invoke-static {p0, v4, v10, p3, v1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeB(Ljava/lang/String;Ljava/lang/String;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v7

    .line 507
    .local v7, "word2":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_31
.end method

.method public static encodeB([B)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B

    .prologue
    const/16 v6, 0x3d

    .line 336
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 338
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 339
    .local v2, "idx":I
    array-length v1, p0

    .line 340
    .local v1, "end":I
    :goto_9
    add-int/lit8 v4, v1, -0x2

    if-ge v2, v4, :cond_55

    .line 341
    aget-byte v4, p0, v2

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v2, 0x1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int/2addr v4, v5

    add-int/lit8 v5, v2, 0x2

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    or-int v0, v4, v5

    .line 343
    .local v0, "data":I
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0x12

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 344
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0xc

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0x6

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    and-int/lit8 v5, v0, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 340
    add-int/lit8 v2, v2, 0x3

    goto :goto_9

    .line 349
    .end local v0    # "data":I
    :cond_55
    add-int/lit8 v4, v1, -0x2

    if-ne v2, v4, :cond_95

    .line 350
    aget-byte v4, p0, v2

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v5, v2, 0x1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    or-int v0, v4, v5

    .line 351
    .restart local v0    # "data":I
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0x12

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 352
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0xc

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0x6

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 354
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 364
    .end local v0    # "data":I
    :cond_90
    :goto_90
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 356
    :cond_95
    add-int/lit8 v4, v1, -0x1

    if-ne v2, v4, :cond_90

    .line 357
    aget-byte v4, p0, v2

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v0, v4, 0x10

    .line 358
    .restart local v0    # "data":I
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0x12

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 359
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->BASE64_TABLE:[B

    shr-int/lit8 v5, v0, 0xc

    and-int/lit8 v5, v5, 0x3f

    aget-byte v4, v4, v5

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 360
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 361
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_90
.end method

.method public static encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    .prologue
    const/4 v1, 0x0

    .line 252
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v1, v1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;I)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;
    .param p2, "usedCharacters"    # I

    .prologue
    const/4 v0, 0x0

    .line 276
    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;)Ljava/lang/String;
    .registers 11
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;
    .param p2, "usedCharacters"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "encoding"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    .prologue
    .line 305
    if-nez p0, :cond_8

    .line 306
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 307
    :cond_8
    if-ltz p2, :cond_e

    const/16 v1, 0x32

    if-le p2, v1, :cond_14

    .line 308
    :cond_e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 310
    :cond_14
    if-nez p3, :cond_1a

    .line 311
    invoke-static {p0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->determineCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p3

    .line 313
    :cond_1a
    invoke-static {p0, p3}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object v5

    .line 315
    .local v5, "bytes":[B
    if-nez p4, :cond_24

    .line 316
    invoke-static {v5, p1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->determineEncoding([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    move-result-object p4

    .line 318
    :cond_24
    sget-object v1, Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;->B:Lorg/apache/james/mime4j/codec/EncoderUtil$Encoding;

    if-ne p4, v1, :cond_4a

    .line 319
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?B?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "prefix":Ljava/lang/String;
    invoke-static {v0, p0, p2, p3, v5}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeB(Ljava/lang/String;Ljava/lang/String;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v1

    .line 323
    :goto_49
    return-object v1

    .line 322
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_4a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "=?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?Q?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "prefix":Ljava/lang/String;
    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    .line 323
    invoke-static/range {v0 .. v5}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v1

    goto :goto_49
.end method

.method public static encodeHeaderParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 153
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 156
    invoke-static {p1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->isToken(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 159
    :goto_23
    return-object v0

    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method

.method public static encodeIfNecessary(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;I)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;
    .param p2, "usedCharacters"    # I

    .prologue
    .line 179
    invoke-static {p0, p2}, Lorg/apache/james/mime4j/codec/EncoderUtil;->hasToBeEncoded(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 180
    invoke-static {p0, p1, p2}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeEncodedWord(Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;I)Ljava/lang/String;

    move-result-object p0

    .line 182
    .end local p0    # "text":Ljava/lang/String;
    :cond_a
    return-object p0
.end method

.method private static encodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;[B)Ljava/lang/String;
    .registers 24
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;
    .param p3, "usedCharacters"    # I
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "bytes"    # [B

    .prologue
    .line 517
    move-object/from16 v0, p5

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->qEncodedLength([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)I

    move-result v14

    .line 519
    .local v14, "encodedLength":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v14

    const-string v4, "?="

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int v15, v2, v4

    .line 521
    .local v15, "totalLength":I
    rsub-int/lit8 v2, p3, 0x4b

    if-gt v15, v2, :cond_3b

    .line 522
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeQ([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "?="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 533
    :goto_3a
    return-object v2

    .line 524
    :cond_3b
    const/4 v2, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 525
    .local v3, "part1":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-static {v3, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object v7

    .local v7, "bytes1":[B
    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    .line 526
    invoke-static/range {v2 .. v7}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v16

    .line 529
    .local v16, "word1":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 530
    .local v9, "part2":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-static {v9, v0}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)[B

    move-result-object v13

    .line 531
    .local v13, "bytes2":[B
    const/4 v11, 0x0

    move-object/from16 v8, p0

    move-object/from16 v10, p2

    move-object/from16 v12, p4

    invoke-static/range {v8 .. v13}, Lorg/apache/james/mime4j/codec/EncoderUtil;->encodeQ(Ljava/lang/String;Ljava/lang/String;Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;ILjava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v17

    .line 533
    .local v17, "word2":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3a
.end method

.method public static encodeQ([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    .prologue
    .line 379
    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;->TEXT_TOKEN:Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    if-ne p1, v5, :cond_1f

    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_REGULAR_CHARS:Ljava/util/BitSet;

    .line 382
    .local v2, "qChars":Ljava/util/BitSet;
    :goto_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 384
    .local v3, "sb":Ljava/lang/StringBuilder;
    array-length v0, p0

    .line 385
    .local v0, "end":I
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_d
    if-ge v1, v0, :cond_45

    .line 386
    aget-byte v5, p0, v1

    and-int/lit16 v4, v5, 0xff

    .line 387
    .local v4, "v":I
    const/16 v5, 0x20

    if-ne v4, v5, :cond_22

    .line 388
    const/16 v5, 0x5f

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 379
    .end local v0    # "end":I
    .end local v1    # "idx":I
    .end local v2    # "qChars":Ljava/util/BitSet;
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    .end local v4    # "v":I
    :cond_1f
    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_RESTRICTED_CHARS:Ljava/util/BitSet;

    goto :goto_6

    .line 389
    .restart local v0    # "end":I
    .restart local v1    # "idx":I
    .restart local v2    # "qChars":Ljava/util/BitSet;
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    .restart local v4    # "v":I
    :cond_22
    invoke-virtual {v2, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_40

    .line 390
    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 391
    ushr-int/lit8 v5, v4, 0x4

    invoke-static {v5}, Lorg/apache/james/mime4j/codec/EncoderUtil;->hexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 392
    and-int/lit8 v5, v4, 0xf

    invoke-static {v5}, Lorg/apache/james/mime4j/codec/EncoderUtil;->hexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 394
    :cond_40
    int-to-char v5, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 398
    .end local v4    # "v":I
    :cond_45
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static hasToBeEncoded(Ljava/lang/String;I)Z
    .registers 8
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "usedCharacters"    # I

    .prologue
    const/16 v5, 0x20

    const/4 v3, 0x1

    .line 200
    if-nez p0, :cond_b

    .line 201
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 202
    :cond_b
    if-ltz p1, :cond_11

    const/16 v4, 0x32

    if-le p1, v4, :cond_17

    .line 203
    :cond_11
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 205
    :cond_17
    move v2, p1

    .line 207
    .local v2, "nonWhiteSpaceCount":I
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_19
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_3b

    .line 208
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 209
    .local v0, "ch":C
    const/16 v4, 0x9

    if-eq v0, v4, :cond_29

    if-ne v0, v5, :cond_2d

    .line 210
    :cond_29
    const/4 v2, 0x0

    .line 207
    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 212
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    .line 213
    const/16 v4, 0x4d

    if-le v2, v4, :cond_34

    .line 228
    .end local v0    # "ch":C
    :cond_33
    :goto_33
    return v3

    .line 221
    .restart local v0    # "ch":C
    :cond_34
    if-lt v0, v5, :cond_33

    const/16 v4, 0x7f

    if-lt v0, v4, :cond_2a

    goto :goto_33

    .line 228
    .end local v0    # "ch":C
    :cond_3b
    const/4 v3, 0x0

    goto :goto_33
.end method

.method private static hexDigit(I)C
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 601
    const/16 v0, 0xa

    if-ge p0, v0, :cond_8

    add-int/lit8 v0, p0, 0x30

    int-to-char v0, v0

    :goto_7
    return v0

    :cond_8
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    int-to-char v0, v0

    goto :goto_7
.end method

.method private static initChars(Ljava/lang/String;)Ljava/util/BitSet;
    .registers 5
    .param p0, "specials"    # Ljava/lang/String;

    .prologue
    .line 54
    new-instance v0, Ljava/util/BitSet;

    const/16 v2, 0x80

    invoke-direct {v0, v2}, Ljava/util/BitSet;-><init>(I)V

    .line 55
    .local v0, "bs":Ljava/util/BitSet;
    const/16 v1, 0x21

    .local v1, "ch":C
    :goto_9
    const/16 v2, 0x7f

    if-ge v1, v2, :cond_1b

    .line 56
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_17

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 55
    :cond_17
    add-int/lit8 v2, v1, 0x1

    int-to-char v1, v2

    goto :goto_9

    .line 60
    :cond_1b
    return-object v0
.end method

.method private static isAtomPhrase(Ljava/lang/String;)Z
    .registers 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 432
    const/4 v1, 0x0

    .line 434
    .local v1, "containsAText":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 435
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "idx":I
    :goto_6
    if-ge v2, v3, :cond_1f

    .line 436
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 437
    .local v0, "ch":C
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->ATEXT_CHARS:Ljava/util/BitSet;

    invoke-virtual {v4, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 438
    const/4 v1, 0x1

    .line 435
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 439
    :cond_18
    invoke-static {v0}, Lorg/apache/james/mime4j/util/CharsetUtil;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_15

    .line 440
    const/4 v1, 0x0

    .line 444
    .end local v0    # "ch":C
    .end local v1    # "containsAText":Z
    :cond_1f
    return v1
.end method

.method private static isDotAtomText(Ljava/lang/String;)Z
    .registers 8
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x2e

    const/4 v4, 0x0

    .line 453
    const/16 v3, 0x2e

    .line 455
    .local v3, "prev":C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 456
    .local v2, "length":I
    if-nez v2, :cond_c

    .line 473
    :cond_b
    :goto_b
    return v4

    .line 459
    :cond_c
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_d
    if-ge v1, v2, :cond_28

    .line 460
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 462
    .local v0, "ch":C
    if-ne v0, v6, :cond_1f

    .line 463
    if-eq v3, v6, :cond_b

    add-int/lit8 v5, v2, -0x1

    if-eq v1, v5, :cond_b

    .line 470
    :cond_1b
    move v3, v0

    .line 459
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 466
    :cond_1f
    sget-object v5, Lorg/apache/james/mime4j/codec/EncoderUtil;->ATEXT_CHARS:Ljava/util/BitSet;

    invoke-virtual {v5, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_1b

    goto :goto_b

    .line 473
    .end local v0    # "ch":C
    :cond_28
    const/4 v4, 0x1

    goto :goto_b
.end method

.method public static isToken(Ljava/lang/String;)Z
    .registers 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 416
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 417
    .local v2, "length":I
    if-nez v2, :cond_8

    .line 426
    :cond_7
    :goto_7
    return v3

    .line 420
    :cond_8
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_9
    if-ge v1, v2, :cond_1a

    .line 421
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 422
    .local v0, "ch":C
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil;->TOKEN_CHARS:Ljava/util/BitSet;

    invoke-virtual {v4, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 420
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 426
    .end local v0    # "ch":C
    :cond_1a
    const/4 v3, 0x1

    goto :goto_7
.end method

.method private static qEncodedLength([BLorg/apache/james/mime4j/codec/EncoderUtil$Usage;)I
    .registers 7
    .param p0, "bytes"    # [B
    .param p1, "usage"    # Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    .prologue
    .line 538
    sget-object v4, Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;->TEXT_TOKEN:Lorg/apache/james/mime4j/codec/EncoderUtil$Usage;

    if-ne p1, v4, :cond_18

    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_REGULAR_CHARS:Ljava/util/BitSet;

    .line 541
    .local v2, "qChars":Ljava/util/BitSet;
    :goto_6
    const/4 v0, 0x0

    .line 543
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_8
    array-length v4, p0

    if-ge v1, v4, :cond_27

    .line 544
    aget-byte v4, p0, v1

    and-int/lit16 v3, v4, 0xff

    .line 545
    .local v3, "v":I
    const/16 v4, 0x20

    if-ne v3, v4, :cond_1b

    .line 546
    add-int/lit8 v0, v0, 0x1

    .line 543
    :goto_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 538
    .end local v0    # "count":I
    .end local v1    # "idx":I
    .end local v2    # "qChars":Ljava/util/BitSet;
    .end local v3    # "v":I
    :cond_18
    sget-object v2, Lorg/apache/james/mime4j/codec/EncoderUtil;->Q_RESTRICTED_CHARS:Ljava/util/BitSet;

    goto :goto_6

    .line 547
    .restart local v0    # "count":I
    .restart local v1    # "idx":I
    .restart local v2    # "qChars":Ljava/util/BitSet;
    .restart local v3    # "v":I
    :cond_1b
    invoke-virtual {v2, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_24

    .line 548
    add-int/lit8 v0, v0, 0x3

    goto :goto_15

    .line 550
    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 554
    .end local v3    # "v":I
    :cond_27
    return v0
.end method

.method private static quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 485
    const-string v1, "[\\\\\"]"

    const-string v2, "\\\\$0"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 486
    .local v0, "escaped":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
