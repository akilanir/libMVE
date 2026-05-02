.class final Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;
.super Ljava/lang/Object;
.source "PDF417HighLevelEncoder.java"


# static fields
.field private static final BYTE_COMPACTION:I = 0x1

.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final LATCH_TO_BYTE:I = 0x39c

.field private static final LATCH_TO_BYTE_PADDED:I = 0x385

.field private static final LATCH_TO_NUMERIC:I = 0x386

.field private static final LATCH_TO_TEXT:I = 0x384

.field private static final MIXED:[B

.field private static final NUMERIC_COMPACTION:I = 0x2

.field private static final PUNCTUATION:[B

.field private static final SHIFT_TO_BYTE:I = 0x391

.field private static final SUBMODE_ALPHA:I = 0x0

.field private static final SUBMODE_LOWER:I = 0x1

.field private static final SUBMODE_MIXED:I = 0x2

.field private static final SUBMODE_PUNCTUATION:I = 0x3

.field private static final TEXT_COMPACTION:I

.field private static final TEXT_MIXED_RAW:[B

.field private static final TEXT_PUNCTUATION_RAW:[B


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/16 v5, 0x80

    const/16 v4, 0x1e

    const/4 v3, -0x1

    .line 115
    new-array v2, v4, [B

    fill-array-data v2, :array_56

    sput-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    .line 122
    new-array v2, v4, [B

    fill-array-data v2, :array_6a

    sput-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    .line 126
    new-array v2, v5, [B

    sput-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    .line 127
    new-array v2, v5, [B

    sput-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    .line 129
    const-string v2, "ISO-8859-1"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    sput-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 136
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 137
    const/4 v1, 0x0

    .local v1, "i":B
    :goto_29
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    array-length v2, v2

    if-ge v1, v2, :cond_3c

    .line 138
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_MIXED_RAW:[B

    aget-byte v0, v2, v1

    .line 139
    .local v0, "b":B
    if-lez v0, :cond_38

    .line 140
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aput-byte v1, v2, v0

    .line 137
    :cond_38
    add-int/lit8 v2, v1, 0x1

    int-to-byte v1, v2

    goto :goto_29

    .line 143
    .end local v0    # "b":B
    :cond_3c
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 144
    const/4 v1, 0x0

    :goto_42
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    array-length v2, v2

    if-ge v1, v2, :cond_55

    .line 145
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->TEXT_PUNCTUATION_RAW:[B

    aget-byte v0, v2, v1

    .line 146
    .restart local v0    # "b":B
    if-lez v0, :cond_51

    .line 147
    sget-object v2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aput-byte v1, v2, v0

    .line 144
    :cond_51
    add-int/lit8 v2, v1, 0x1

    int-to-byte v1, v2

    goto :goto_42

    .line 150
    .end local v0    # "b":B
    :cond_55
    return-void

    .line 115
    :array_56
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x26t
        0xdt
        0x9t
        0x2ct
        0x3at
        0x23t
        0x2dt
        0x2et
        0x24t
        0x2ft
        0x2bt
        0x25t
        0x2at
        0x3dt
        0x5et
        0x0t
        0x20t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 122
    nop

    :array_6a
    .array-data 1
        0x3bt
        0x3ct
        0x3et
        0x40t
        0x5bt
        0x5ct
        0x5dt
        0x5ft
        0x60t
        0x7et
        0x21t
        0xdt
        0x9t
        0x2ct
        0x3at
        0xat
        0x2dt
        0x2et
        0x24t
        0x2ft
        0x22t
        0x7ct
        0x2at
        0x28t
        0x29t
        0x3ft
        0x7bt
        0x7dt
        0x27t
        0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    return-void
.end method

.method private static determineConsecutiveBinaryCount(Ljava/lang/String;ILjava/nio/charset/Charset;)I
    .registers 12
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "startpos"    # I
    .param p2, "encoding"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xd

    .line 537
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    .line 538
    .local v1, "encoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 539
    .local v4, "len":I
    move v3, p1

    .line 540
    .local v3, "idx":I
    :goto_b
    if-ge v3, v4, :cond_60

    .line 541
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 542
    .local v0, "ch":C
    const/4 v5, 0x0

    .line 544
    .local v5, "numericCount":I
    :goto_12
    if-ge v5, v7, :cond_20

    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_20

    .line 545
    add-int/lit8 v5, v5, 0x1

    .line 547
    add-int v2, v3, v5

    .line 548
    .local v2, "i":I
    if-lt v2, v4, :cond_25

    .line 553
    .end local v2    # "i":I
    :cond_20
    if-lt v5, v7, :cond_2a

    .line 554
    sub-int v6, v3, p1

    .line 563
    .end local v0    # "ch":C
    .end local v5    # "numericCount":I
    :goto_24
    return v6

    .line 551
    .restart local v0    # "ch":C
    .restart local v2    # "i":I
    .restart local v5    # "numericCount":I
    :cond_25
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 552
    goto :goto_12

    .line 556
    .end local v2    # "i":I
    :cond_2a
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 558
    invoke-virtual {v1, v0}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v6

    if-nez v6, :cond_5d

    .line 559
    new-instance v6, Lcom/google/zxing/WriterException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Non-encodable character detected: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " (Unicode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x29

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 561
    :cond_5d
    add-int/lit8 v3, v3, 0x1

    .line 562
    goto :goto_b

    .line 563
    .end local v0    # "ch":C
    .end local v5    # "numericCount":I
    :cond_60
    sub-int v6, v3, p1

    goto :goto_24
.end method

.method private static determineConsecutiveDigitCount(Ljava/lang/CharSequence;I)I
    .registers 7
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I

    .prologue
    .line 473
    const/4 v1, 0x0

    .line 474
    .local v1, "count":I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    .line 475
    .local v3, "len":I
    move v2, p1

    .line 476
    .local v2, "idx":I
    if-ge v2, v3, :cond_1f

    .line 477
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 478
    .local v0, "ch":C
    :cond_c
    :goto_c
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_1f

    if-ge v2, v3, :cond_1f

    .line 479
    add-int/lit8 v1, v1, 0x1

    .line 480
    add-int/lit8 v2, v2, 0x1

    .line 481
    if-ge v2, v3, :cond_c

    .line 482
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    goto :goto_c

    .line 486
    .end local v0    # "ch":C
    :cond_1f
    return v1
.end method

.method private static determineConsecutiveTextCount(Ljava/lang/CharSequence;I)I
    .registers 8
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I

    .prologue
    const/16 v5, 0xd

    .line 497
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 498
    .local v2, "len":I
    move v1, p1

    .line 499
    .local v1, "idx":I
    :cond_7
    :goto_7
    if-ge v1, v2, :cond_35

    .line 500
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 501
    .local v0, "ch":C
    const/4 v3, 0x0

    .line 502
    .local v3, "numericCount":I
    :cond_e
    :goto_e
    if-ge v3, v5, :cond_23

    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_23

    if-ge v1, v2, :cond_23

    .line 503
    add-int/lit8 v3, v3, 0x1

    .line 504
    add-int/lit8 v1, v1, 0x1

    .line 505
    if-ge v1, v2, :cond_e

    .line 506
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    goto :goto_e

    .line 509
    :cond_23
    if-lt v3, v5, :cond_29

    .line 510
    sub-int v4, v1, p1

    sub-int/2addr v4, v3

    .line 524
    .end local v0    # "ch":C
    .end local v3    # "numericCount":I
    :goto_28
    return v4

    .line 512
    .restart local v0    # "ch":C
    .restart local v3    # "numericCount":I
    :cond_29
    if-gtz v3, :cond_7

    .line 516
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 519
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isText(C)Z

    move-result v4

    if-nez v4, :cond_38

    .line 524
    .end local v0    # "ch":C
    .end local v3    # "numericCount":I
    :cond_35
    sub-int v4, v1, p1

    goto :goto_28

    .line 522
    .restart local v0    # "ch":C
    .restart local v3    # "numericCount":I
    :cond_38
    add-int/lit8 v1, v1, 0x1

    .line 523
    goto :goto_7
.end method

.method private static encodeBinary([BIIILjava/lang/StringBuilder;)V
    .registers 14
    .param p0, "bytes"    # [B
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "startmode"    # I
    .param p4, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 379
    const/4 v7, 0x1

    if-ne p2, v7, :cond_2b

    if-nez p3, :cond_2b

    .line 380
    const/16 v7, 0x391

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 390
    :goto_a
    move v3, p1

    .line 392
    .local v3, "idx":I
    const/4 v7, 0x6

    if-lt p2, v7, :cond_62

    .line 393
    const/4 v7, 0x5

    new-array v1, v7, [C

    .line 394
    .local v1, "chars":[C
    :goto_11
    add-int v7, p1, p2

    sub-int/2addr v7, v3

    const/4 v8, 0x6

    if-lt v7, v8, :cond_62

    .line 395
    const-wide/16 v5, 0x0

    .line 396
    .local v5, "t":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    const/4 v7, 0x6

    if-ge v2, v7, :cond_40

    .line 397
    const/16 v7, 0x8

    shl-long/2addr v5, v7

    .line 398
    add-int v7, v3, v2

    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 396
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 382
    .end local v1    # "chars":[C
    .end local v2    # "i":I
    .end local v3    # "idx":I
    .end local v5    # "t":J
    :cond_2b
    rem-int/lit8 v7, p2, 0x6

    if-nez v7, :cond_38

    const/4 v4, 0x1

    .line 383
    .local v4, "sixpack":Z
    :goto_30
    if-eqz v4, :cond_3a

    .line 384
    const/16 v7, 0x39c

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 382
    .end local v4    # "sixpack":Z
    :cond_38
    const/4 v4, 0x0

    goto :goto_30

    .line 386
    .restart local v4    # "sixpack":Z
    :cond_3a
    const/16 v7, 0x385

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 400
    .end local v4    # "sixpack":Z
    .restart local v1    # "chars":[C
    .restart local v2    # "i":I
    .restart local v3    # "idx":I
    .restart local v5    # "t":J
    :cond_40
    const/4 v2, 0x0

    :goto_41
    const/4 v7, 0x5

    if-ge v2, v7, :cond_52

    .line 401
    const-wide/16 v7, 0x384

    rem-long v7, v5, v7

    long-to-int v7, v7

    int-to-char v7, v7

    aput-char v7, v1, v2

    .line 402
    const-wide/16 v7, 0x384

    div-long/2addr v5, v7

    .line 400
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 404
    :cond_52
    array-length v7, v1

    add-int/lit8 v2, v7, -0x1

    :goto_55
    if-ltz v2, :cond_5f

    .line 405
    aget-char v7, v1, v2

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 404
    add-int/lit8 v2, v2, -0x1

    goto :goto_55

    .line 407
    :cond_5f
    add-int/lit8 v3, v3, 0x6

    .line 408
    goto :goto_11

    .line 411
    .end local v1    # "chars":[C
    .end local v2    # "i":I
    .end local v5    # "t":J
    :cond_62
    move v2, v3

    .restart local v2    # "i":I
    :goto_63
    add-int v7, p1, p2

    if-ge v2, v7, :cond_72

    .line 412
    aget-byte v7, p0, v2

    and-int/lit16 v0, v7, 0xff

    .line 413
    .local v0, "ch":I
    int-to-char v7, v0

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 411
    add-int/lit8 v2, v2, 0x1

    goto :goto_63

    .line 415
    .end local v0    # "ch":I
    :cond_72
    return-void
.end method

.method static encodeHighLevel(Ljava/lang/String;Lcom/google/zxing/pdf417/encoder/Compaction;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 16
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "compaction"    # Lcom/google/zxing/pdf417/encoder/Compaction;
    .param p2, "encoding"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    .line 166
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 168
    .local v7, "sb":Ljava/lang/StringBuilder;
    if-nez p2, :cond_1f

    .line 169
    sget-object p2, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 177
    :cond_d
    :goto_d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 178
    .local v4, "len":I
    const/4 v6, 0x0

    .line 179
    .local v6, "p":I
    const/4 v9, 0x0

    .line 182
    .local v9, "textSubMode":I
    sget-object v10, Lcom/google/zxing/pdf417/encoder/Compaction;->TEXT:Lcom/google/zxing/pdf417/encoder/Compaction;

    if-ne p1, v10, :cond_39

    .line 183
    invoke-static {p0, v6, v4, v7, v9}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    .line 234
    :cond_1a
    :goto_1a
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10

    .line 170
    .end local v4    # "len":I
    .end local v6    # "p":I
    .end local v9    # "textSubMode":I
    :cond_1f
    sget-object v10, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    invoke-virtual {v10, p2}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d

    .line 171
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByName(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v2

    .line 172
    .local v2, "eci":Lcom/google/zxing/common/CharacterSetECI;
    if-eqz v2, :cond_d

    .line 173
    invoke-virtual {v2}, Lcom/google/zxing/common/CharacterSetECI;->getValue()I

    move-result v10

    invoke-static {v10, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodingECI(ILjava/lang/StringBuilder;)V

    goto :goto_d

    .line 185
    .end local v2    # "eci":Lcom/google/zxing/common/CharacterSetECI;
    .restart local v4    # "len":I
    .restart local v6    # "p":I
    .restart local v9    # "textSubMode":I
    :cond_39
    sget-object v10, Lcom/google/zxing/pdf417/encoder/Compaction;->BYTE:Lcom/google/zxing/pdf417/encoder/Compaction;

    if-ne p1, v10, :cond_47

    .line 186
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 187
    .local v1, "bytes":[B
    array-length v10, v1

    const/4 v11, 0x1

    invoke-static {v1, v6, v10, v11, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    goto :goto_1a

    .line 189
    .end local v1    # "bytes":[B
    :cond_47
    sget-object v10, Lcom/google/zxing/pdf417/encoder/Compaction;->NUMERIC:Lcom/google/zxing/pdf417/encoder/Compaction;

    if-ne p1, v10, :cond_54

    .line 190
    const/16 v10, 0x386

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    invoke-static {p0, v6, v4, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    goto :goto_1a

    .line 194
    :cond_54
    const/4 v3, 0x0

    .line 195
    .local v3, "encodingMode":I
    :goto_55
    if-ge v6, v4, :cond_1a

    .line 196
    invoke-static {p0, v6}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveDigitCount(Ljava/lang/CharSequence;I)I

    move-result v5

    .line 197
    .local v5, "n":I
    const/16 v10, 0xd

    if-lt v5, v10, :cond_6b

    .line 198
    const/16 v10, 0x386

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 199
    const/4 v3, 0x2

    .line 200
    const/4 v9, 0x0

    .line 201
    invoke-static {p0, v6, v5, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V

    .line 202
    add-int/2addr v6, v5

    goto :goto_55

    .line 204
    :cond_6b
    invoke-static {p0, v6}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveTextCount(Ljava/lang/CharSequence;I)I

    move-result v8

    .line 205
    .local v8, "t":I
    const/4 v10, 0x5

    if-ge v8, v10, :cond_74

    if-ne v5, v4, :cond_83

    .line 206
    :cond_74
    if-eqz v3, :cond_7d

    .line 207
    const/16 v10, 0x384

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    const/4 v3, 0x0

    .line 209
    const/4 v9, 0x0

    .line 211
    :cond_7d
    invoke-static {p0, v6, v8, v7, v9}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I

    move-result v9

    .line 212
    add-int/2addr v6, v8

    goto :goto_55

    .line 214
    :cond_83
    invoke-static {p0, v6, p2}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->determineConsecutiveBinaryCount(Ljava/lang/String;ILjava/nio/charset/Charset;)I

    move-result v0

    .line 215
    .local v0, "b":I
    if-nez v0, :cond_8a

    .line 216
    const/4 v0, 0x1

    .line 218
    :cond_8a
    add-int v10, v6, v0

    invoke-virtual {p0, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    .line 219
    .restart local v1    # "bytes":[B
    array-length v10, v1

    const/4 v11, 0x1

    if-ne v10, v11, :cond_a2

    if-nez v3, :cond_a2

    .line 221
    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v1, v10, v11, v12, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    .line 228
    :goto_a0
    add-int/2addr v6, v0

    goto :goto_55

    .line 224
    :cond_a2
    const/4 v10, 0x0

    array-length v11, v1

    invoke-static {v1, v10, v11, v3, v7}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->encodeBinary([BIIILjava/lang/StringBuilder;)V

    .line 225
    const/4 v3, 0x1

    .line 226
    const/4 v9, 0x0

    goto :goto_a0
.end method

.method private static encodeNumeric(Ljava/lang/String;IILjava/lang/StringBuilder;)V
    .registers 15
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 418
    const/4 v2, 0x0

    .line 419
    .local v2, "idx":I
    new-instance v7, Ljava/lang/StringBuilder;

    div-int/lit8 v8, p2, 0x3

    add-int/lit8 v8, v8, 0x1

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 420
    .local v7, "tmp":Ljava/lang/StringBuilder;
    const-wide/16 v8, 0x384

    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    .line 421
    .local v5, "num900":Ljava/math/BigInteger;
    const-wide/16 v8, 0x0

    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    .line 422
    .local v4, "num0":Ljava/math/BigInteger;
    :goto_16
    if-ge v2, p2, :cond_6f

    .line 423
    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 424
    const/16 v8, 0x2c

    sub-int v9, p2, v2

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 425
    .local v3, "len":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v9, 0x31

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int v9, p1, v2

    add-int v10, p1, v2

    add-int/2addr v10, v3

    invoke-virtual {p0, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 426
    .local v6, "part":Ljava/lang/String;
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 428
    .local v0, "bigint":Ljava/math/BigInteger;
    :cond_45
    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigInteger;->intValue()I

    move-result v8

    int-to-char v8, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 429
    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 430
    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_45

    .line 433
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .local v1, "i":I
    :goto_61
    if-ltz v1, :cond_6d

    .line 434
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 433
    add-int/lit8 v1, v1, -0x1

    goto :goto_61

    .line 436
    :cond_6d
    add-int/2addr v2, v3

    .line 437
    goto :goto_16

    .line 438
    .end local v0    # "bigint":Ljava/math/BigInteger;
    .end local v1    # "i":I
    .end local v3    # "len":I
    .end local v6    # "part":Ljava/lang/String;
    :cond_6f
    return-void
.end method

.method private static encodeText(Ljava/lang/CharSequence;IILjava/lang/StringBuilder;I)I
    .registers 16
    .param p0, "msg"    # Ljava/lang/CharSequence;
    .param p1, "startpos"    # I
    .param p2, "count"    # I
    .param p3, "sb"    # Ljava/lang/StringBuilder;
    .param p4, "initialSubmode"    # I

    .prologue
    .line 253
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 254
    .local v8, "tmp":Ljava/lang/StringBuilder;
    move v7, p4

    .line 255
    .local v7, "submode":I
    const/4 v3, 0x0

    .line 257
    .local v3, "idx":I
    :cond_7
    :goto_7
    add-int v9, p1, v3

    invoke-interface {p0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 258
    .local v0, "ch":C
    packed-switch v7, :pswitch_data_13a

    .line 333
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isPunctuation(C)Z

    move-result v9

    if-eqz v9, :cond_11c

    .line 334
    sget-object v9, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v9, v9, v0

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 341
    :goto_1e
    add-int/lit8 v3, v3, 0x1

    .line 342
    if-lt v3, p2, :cond_7

    .line 346
    const/4 v1, 0x0

    .line 347
    .local v1, "h":C
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    .line 348
    .local v4, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_28
    if-ge v2, v4, :cond_12d

    .line 349
    rem-int/lit8 v9, v2, 0x2

    if-eqz v9, :cond_124

    const/4 v6, 0x1

    .line 350
    .local v6, "odd":Z
    :goto_2f
    if-eqz v6, :cond_127

    .line 351
    mul-int/lit8 v9, v1, 0x1e

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v10

    add-int/2addr v9, v10

    int-to-char v1, v9

    .line 352
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 348
    :goto_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    .line 260
    .end local v1    # "h":C
    .end local v2    # "i":I
    .end local v4    # "len":I
    .end local v6    # "odd":Z
    :pswitch_3f
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v9

    if-eqz v9, :cond_56

    .line 261
    const/16 v9, 0x20

    if-ne v0, v9, :cond_4f

    .line 262
    const/16 v9, 0x1a

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 264
    :cond_4f
    add-int/lit8 v9, v0, -0x41

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 267
    :cond_56
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v9

    if-eqz v9, :cond_63

    .line 268
    const/4 v7, 0x1

    .line 269
    const/16 v9, 0x1b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 271
    :cond_63
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v9

    if-eqz v9, :cond_70

    .line 272
    const/4 v7, 0x2

    .line 273
    const/16 v9, 0x1c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 276
    :cond_70
    const/16 v9, 0x1d

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 277
    sget-object v9, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v9, v9, v0

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 283
    :pswitch_7e
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v9

    if-eqz v9, :cond_95

    .line 284
    const/16 v9, 0x20

    if-ne v0, v9, :cond_8e

    .line 285
    const/16 v9, 0x1a

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 287
    :cond_8e
    add-int/lit8 v9, v0, -0x61

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 290
    :cond_95
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v9

    if-eqz v9, :cond_a8

    .line 291
    const/16 v9, 0x1b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 292
    add-int/lit8 v9, v0, -0x41

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1e

    .line 295
    :cond_a8
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v9

    if-eqz v9, :cond_b6

    .line 296
    const/4 v7, 0x2

    .line 297
    const/16 v9, 0x1c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    .line 300
    :cond_b6
    const/16 v9, 0x1d

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 301
    sget-object v9, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v9, v9, v0

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1e

    .line 307
    :pswitch_c5
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isMixed(C)Z

    move-result v9

    if-eqz v9, :cond_d5

    .line 308
    sget-object v9, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aget-byte v9, v9, v0

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1e

    .line 310
    :cond_d5
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaUpper(C)Z

    move-result v9

    if-eqz v9, :cond_e3

    .line 311
    const/4 v7, 0x0

    .line 312
    const/16 v9, 0x1c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    .line 314
    :cond_e3
    invoke-static {v0}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isAlphaLower(C)Z

    move-result v9

    if-eqz v9, :cond_f1

    .line 315
    const/4 v7, 0x1

    .line 316
    const/16 v9, 0x1b

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    .line 319
    :cond_f1
    add-int v9, p1, v3

    add-int/lit8 v9, v9, 0x1

    if-ge v9, p2, :cond_10d

    .line 320
    add-int v9, p1, v3

    add-int/lit8 v9, v9, 0x1

    invoke-interface {p0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    .line 321
    .local v5, "next":C
    invoke-static {v5}, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->isPunctuation(C)Z

    move-result v9

    if-eqz v9, :cond_10d

    .line 322
    const/4 v7, 0x3

    .line 323
    const/16 v9, 0x19

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    .line 327
    .end local v5    # "next":C
    :cond_10d
    const/16 v9, 0x1d

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 328
    sget-object v9, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v9, v9, v0

    int-to-char v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1e

    .line 336
    :cond_11c
    const/4 v7, 0x0

    .line 337
    const/16 v9, 0x1d

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    .line 349
    .restart local v1    # "h":C
    .restart local v2    # "i":I
    .restart local v4    # "len":I
    :cond_124
    const/4 v6, 0x0

    goto/16 :goto_2f

    .line 354
    .restart local v6    # "odd":Z
    :cond_127
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    goto/16 :goto_3c

    .line 357
    .end local v6    # "odd":Z
    :cond_12d
    rem-int/lit8 v9, v4, 0x2

    if-eqz v9, :cond_139

    .line 358
    mul-int/lit8 v9, v1, 0x1e

    add-int/lit8 v9, v9, 0x1d

    int-to-char v9, v9

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 360
    :cond_139
    return v7

    .line 258
    :pswitch_data_13a
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_7e
        :pswitch_c5
    .end packed-switch
.end method

.method private static encodingECI(ILjava/lang/StringBuilder;)V
    .registers 5
    .param p0, "eci"    # I
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .prologue
    const v1, 0xc5f94

    .line 567
    if-ltz p0, :cond_13

    const/16 v0, 0x384

    if-ge p0, v0, :cond_13

    .line 568
    const/16 v0, 0x39f

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 569
    int-to-char v0, p0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 580
    :goto_12
    return-void

    .line 570
    :cond_13
    if-ge p0, v1, :cond_29

    .line 571
    const/16 v0, 0x39e

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 572
    div-int/lit16 v0, p0, 0x384

    add-int/lit8 v0, v0, -0x1

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 573
    rem-int/lit16 v0, p0, 0x384

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 574
    :cond_29
    const v0, 0xc6318

    if-ge p0, v0, :cond_3a

    .line 575
    const/16 v0, 0x39d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 576
    sub-int v0, v1, p0

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_12

    .line 578
    :cond_3a
    new-instance v0, Lcom/google/zxing/WriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ECI number not in valid range from 0..811799, but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isAlphaLower(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 450
    const/16 v0, 0x20

    if-eq p0, v0, :cond_c

    const/16 v0, 0x61

    if-lt p0, v0, :cond_e

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static isAlphaUpper(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 446
    const/16 v0, 0x20

    if-eq p0, v0, :cond_c

    const/16 v0, 0x41

    if-lt p0, v0, :cond_e

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static isDigit(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 442
    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static isMixed(C)Z
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 454
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->MIXED:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private static isPunctuation(C)Z
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 458
    sget-object v0, Lcom/google/zxing/pdf417/encoder/PDF417HighLevelEncoder;->PUNCTUATION:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private static isText(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 462
    const/16 v0, 0x9

    if-eq p0, v0, :cond_14

    const/16 v0, 0xa

    if-eq p0, v0, :cond_14

    const/16 v0, 0xd

    if-eq p0, v0, :cond_14

    const/16 v0, 0x20

    if-lt p0, v0, :cond_16

    const/16 v0, 0x7e

    if-gt p0, v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
