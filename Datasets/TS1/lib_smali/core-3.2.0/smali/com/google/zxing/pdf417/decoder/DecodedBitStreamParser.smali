.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static final AL:I = 0x1c

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final EXP900:[Ljava/math/BigInteger;

.field private static final LL:I = 0x1b

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMBER_OF_SEQUENCE_CODEWORDS:I = 0x2

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT_CHARS:[C

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 67
    const/16 v2, 0x1d

    new-array v2, v2, [C

    fill-array-data v2, :array_4a

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    .line 72
    const/16 v2, 0x19

    new-array v2, v2, [C

    fill-array-data v2, :array_6c

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    .line 77
    const-string v2, "ISO-8859-1"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 85
    const/16 v2, 0x10

    new-array v2, v2, [Ljava/math/BigInteger;

    sput-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    .line 86
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v3, 0x0

    sget-object v4, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    aput-object v4, v2, v3

    .line 87
    const-wide/16 v2, 0x384

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 88
    .local v1, "nineHundred":Ljava/math/BigInteger;
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v3, 0x1

    aput-object v1, v2, v3

    .line 89
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_33
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    array-length v2, v2

    if-ge v0, v2, :cond_49

    .line 90
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    add-int/lit8 v4, v0, -0x1

    aget-object v3, v3, v4

    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    aput-object v3, v2, v0

    .line 89
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 92
    :cond_49
    return-void

    .line 67
    :array_4a
    .array-data 2
        0x3bs
        0x3cs
        0x3es
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5fs
        0x60s
        0x7es
        0x21s
        0xds
        0x9s
        0x2cs
        0x3as
        0xas
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x22s
        0x7cs
        0x2as
        0x28s
        0x29s
        0x3fs
        0x7bs
        0x7ds
        0x27s
    .end array-data

    .line 72
    nop

    :array_6c
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x26s
        0xds
        0x9s
        0x2cs
        0x3as
        0x23s
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x2bs
        0x25s
        0x2as
        0x3ds
        0x5es
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    return-void
.end method

.method private static byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I
    .registers 22
    .param p0, "mode"    # I
    .param p1, "codewords"    # [I
    .param p2, "encoding"    # Ljava/nio/charset/Charset;
    .param p3, "codeIndex"    # I
    .param p4, "result"    # Ljava/lang/StringBuilder;

    .prologue
    .line 448
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 449
    .local v6, "decodedBytes":Ljava/io/ByteArrayOutputStream;
    const/16 v13, 0x385

    move/from16 v0, p0

    if-ne v0, v13, :cond_8a

    .line 452
    const/4 v4, 0x0

    .line 453
    .local v4, "count":I
    const-wide/16 v11, 0x0

    .line 454
    .local v11, "value":J
    const/4 v13, 0x6

    new-array v1, v13, [I

    .line 455
    .local v1, "byteCompactedCodewords":[I
    const/4 v7, 0x0

    .line 456
    .local v7, "end":Z
    add-int/lit8 v3, p3, 0x1

    .end local p3    # "codeIndex":I
    .local v3, "codeIndex":I
    aget v10, p1, p3

    .local v10, "nextCode":I
    move/from16 p3, v3

    .line 457
    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    :goto_18
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p3

    if-ge v0, v13, :cond_6e

    if-nez v7, :cond_6e

    .line 458
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "count":I
    .local v5, "count":I
    aput v10, v1, v4

    .line 460
    const-wide/16 v13, 0x384

    mul-long/2addr v13, v11

    int-to-long v15, v10

    add-long v11, v13, v15

    .line 461
    add-int/lit8 v3, p3, 0x1

    .end local p3    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v10, p1, p3

    .line 463
    const/16 v13, 0x384

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x385

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x386

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x39c

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x3a0

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x39b

    if-eq v10, v13, :cond_4b

    const/16 v13, 0x39a

    if-ne v10, v13, :cond_50

    .line 470
    :cond_4b
    add-int/lit8 p3, v3, -0x1

    .line 471
    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    const/4 v7, 0x1

    move v4, v5

    .end local v5    # "count":I
    .restart local v4    # "count":I
    goto :goto_18

    .line 473
    .end local v4    # "count":I
    .end local p3    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "count":I
    :cond_50
    rem-int/lit8 v13, v5, 0x5

    if-nez v13, :cond_ff

    if-lez v5, :cond_ff

    .line 476
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_57
    const/4 v13, 0x6

    if-ge v9, v13, :cond_68

    .line 477
    rsub-int/lit8 v13, v9, 0x5

    mul-int/lit8 v13, v13, 0x8

    shr-long v13, v11, v13

    long-to-int v13, v13

    int-to-byte v13, v13

    invoke-virtual {v6, v13}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 476
    add-int/lit8 v9, v9, 0x1

    goto :goto_57

    .line 479
    :cond_68
    const-wide/16 v11, 0x0

    .line 480
    const/4 v4, 0x0

    .end local v5    # "count":I
    .restart local v4    # "count":I
    move/from16 p3, v3

    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    goto :goto_18

    .line 486
    .end local v9    # "j":I
    :cond_6e
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p3

    if-ne v0, v13, :cond_7e

    const/16 v13, 0x384

    if-ge v10, v13, :cond_7e

    .line 487
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "count":I
    .restart local v5    # "count":I
    aput v10, v1, v4

    move v4, v5

    .line 493
    .end local v5    # "count":I
    .restart local v4    # "count":I
    :cond_7e
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_7f
    if-ge v8, v4, :cond_eb

    .line 494
    aget v13, v1, v8

    int-to-byte v13, v13

    invoke-virtual {v6, v13}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 493
    add-int/lit8 v8, v8, 0x1

    goto :goto_7f

    .line 497
    .end local v1    # "byteCompactedCodewords":[I
    .end local v4    # "count":I
    .end local v7    # "end":Z
    .end local v8    # "i":I
    .end local v10    # "nextCode":I
    .end local v11    # "value":J
    :cond_8a
    const/16 v13, 0x39c

    move/from16 v0, p0

    if-ne v0, v13, :cond_eb

    .line 500
    const/4 v4, 0x0

    .line 501
    .restart local v4    # "count":I
    const-wide/16 v11, 0x0

    .line 502
    .restart local v11    # "value":J
    const/4 v7, 0x0

    .line 503
    .restart local v7    # "end":Z
    :cond_94
    :goto_94
    const/4 v13, 0x0

    aget v13, p1, v13

    move/from16 v0, p3

    if-ge v0, v13, :cond_eb

    if-nez v7, :cond_eb

    .line 504
    add-int/lit8 v3, p3, 0x1

    .end local p3    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v2, p1, p3

    .line 505
    .local v2, "code":I
    const/16 v13, 0x384

    if-ge v2, v13, :cond_c7

    .line 506
    add-int/lit8 v4, v4, 0x1

    .line 508
    const-wide/16 v13, 0x384

    mul-long/2addr v13, v11

    int-to-long v15, v2

    add-long v11, v13, v15

    move/from16 p3, v3

    .line 521
    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    :goto_af
    rem-int/lit8 v13, v4, 0x5

    if-nez v13, :cond_94

    if-lez v4, :cond_94

    .line 524
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_b6
    const/4 v13, 0x6

    if-ge v9, v13, :cond_e7

    .line 525
    rsub-int/lit8 v13, v9, 0x5

    mul-int/lit8 v13, v13, 0x8

    shr-long v13, v11, v13

    long-to-int v13, v13

    int-to-byte v13, v13

    invoke-virtual {v6, v13}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 524
    add-int/lit8 v9, v9, 0x1

    goto :goto_b6

    .line 510
    .end local v9    # "j":I
    .end local p3    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    :cond_c7
    const/16 v13, 0x384

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x385

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x386

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x39c

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x3a0

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x39b

    if-eq v2, v13, :cond_e3

    const/16 v13, 0x39a

    if-ne v2, v13, :cond_fc

    .line 517
    :cond_e3
    add-int/lit8 p3, v3, -0x1

    .line 518
    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    const/4 v7, 0x1

    goto :goto_af

    .line 527
    .restart local v9    # "j":I
    :cond_e7
    const-wide/16 v11, 0x0

    .line 528
    const/4 v4, 0x0

    goto :goto_94

    .line 532
    .end local v2    # "code":I
    .end local v4    # "count":I
    .end local v7    # "end":Z
    .end local v9    # "j":I
    .end local v11    # "value":J
    :cond_eb
    new-instance v13, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v13, v14, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    return p3

    .end local p3    # "codeIndex":I
    .restart local v2    # "code":I
    .restart local v3    # "codeIndex":I
    .restart local v4    # "count":I
    .restart local v7    # "end":Z
    .restart local v11    # "value":J
    :cond_fc
    move/from16 p3, v3

    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    goto :goto_af

    .end local v2    # "code":I
    .end local v4    # "count":I
    .end local p3    # "codeIndex":I
    .restart local v1    # "byteCompactedCodewords":[I
    .restart local v3    # "codeIndex":I
    .restart local v5    # "count":I
    .restart local v10    # "nextCode":I
    :cond_ff
    move v4, v5

    .end local v5    # "count":I
    .restart local v4    # "count":I
    move/from16 p3, v3

    .end local v3    # "codeIndex":I
    .restart local p3    # "codeIndex":I
    goto/16 :goto_18
.end method

.method static decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;
    .registers 12
    .param p0, "codewords"    # [I
    .param p1, "ecLevel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 100
    new-instance v6, Ljava/lang/StringBuilder;

    array-length v8, p0

    mul-int/lit8 v8, v8, 0x2

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 101
    .local v6, "result":Ljava/lang/StringBuilder;
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    .line 103
    .local v5, "encoding":Ljava/nio/charset/Charset;
    const/4 v2, 0x1

    .line 104
    .local v2, "codeIndex":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "codeIndex":I
    .local v3, "codeIndex":I
    aget v1, p0, v2

    .line 105
    .local v1, "code":I
    new-instance v7, Lcom/google/zxing/pdf417/PDF417ResultMetadata;

    invoke-direct {v7}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;-><init>()V

    .local v7, "resultMetadata":Lcom/google/zxing/pdf417/PDF417ResultMetadata;
    move v2, v3

    .line 106
    .end local v3    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :goto_16
    const/4 v8, 0x0

    aget v8, p0, v8

    if-ge v2, v8, :cond_6d

    .line 107
    sparse-switch v1, :sswitch_data_86

    .line 145
    add-int/lit8 v2, v2, -0x1

    .line 146
    invoke-static {p0, v2, v6}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    .line 149
    :goto_24
    array-length v8, p0

    if-ge v2, v8, :cond_68

    .line 150
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v1, p0, v2

    move v2, v3

    .end local v3    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    goto :goto_16

    .line 109
    :sswitch_2d
    invoke-static {p0, v2, v6}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    .line 110
    goto :goto_24

    .line 113
    :sswitch_32
    invoke-static {v1, p0, v5, v2, v6}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I

    move-result v2

    .line 114
    goto :goto_24

    .line 116
    :sswitch_37
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v8, p0, v2

    int-to-char v8, v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v3

    .line 117
    .end local v3    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    goto :goto_24

    .line 119
    :sswitch_41
    invoke-static {p0, v2, v6}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result v2

    .line 120
    goto :goto_24

    .line 122
    :sswitch_46
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local v3    # "codeIndex":I
    aget v8, p0, v2

    .line 123
    invoke-static {v8}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v0

    .line 124
    .local v0, "charsetECI":Lcom/google/zxing/common/CharacterSetECI;
    invoke-virtual {v0}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    move v2, v3

    .line 125
    .end local v3    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    goto :goto_24

    .line 128
    .end local v0    # "charsetECI":Lcom/google/zxing/common/CharacterSetECI;
    :sswitch_58
    add-int/lit8 v2, v2, 0x2

    .line 129
    goto :goto_24

    .line 132
    :sswitch_5b
    add-int/lit8 v2, v2, 0x1

    .line 133
    goto :goto_24

    .line 135
    :sswitch_5e
    invoke-static {p0, v2, v7}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I

    move-result v2

    .line 136
    goto :goto_24

    .line 140
    :sswitch_63
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v8

    throw v8

    .line 152
    :cond_68
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v8

    throw v8

    .line 155
    :cond_6d
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-nez v8, :cond_78

    .line 156
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v8

    throw v8

    .line 158
    :cond_78
    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v9, v8, v9, p1}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 159
    .local v4, "decoderResult":Lcom/google/zxing/common/DecoderResult;
    invoke-virtual {v4, v7}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V

    .line 160
    return-object v4

    .line 107
    nop

    :sswitch_data_86
    .sparse-switch
        0x384 -> :sswitch_2d
        0x385 -> :sswitch_32
        0x386 -> :sswitch_41
        0x391 -> :sswitch_37
        0x39a -> :sswitch_63
        0x39b -> :sswitch_63
        0x39c -> :sswitch_32
        0x39d -> :sswitch_5b
        0x39e -> :sswitch_58
        0x39f -> :sswitch_46
        0x3a0 -> :sswitch_5e
    .end sparse-switch
.end method

.method private static decodeBase900toBase10([II)Ljava/lang/String;
    .registers 8
    .param p0, "codewords"    # [I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 630
    sget-object v1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    .line 631
    .local v1, "result":Ljava/math/BigInteger;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p1, :cond_1f

    .line 632
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sub-int v4, p1, v0

    add-int/lit8 v4, v4, -0x1

    aget-object v3, v3, v4

    aget v4, p0, v0

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 631
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 634
    :cond_1f
    invoke-virtual {v1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v2

    .line 635
    .local v2, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    if-eq v3, v4, :cond_31

    .line 636
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    .line 638
    :cond_31
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I
    .registers 14
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "resultMetadata"    # Lcom/google/zxing/pdf417/PDF417ResultMetadata;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    .line 165
    add-int/lit8 v9, p1, 0x2

    const/4 v10, 0x0

    aget v10, p0, v10

    if-le v9, v10, :cond_c

    .line 167
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v9

    throw v9

    .line 169
    :cond_c
    const/4 v9, 0x2

    new-array v8, v9, [I

    .line 170
    .local v8, "segmentIndexArray":[I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_10
    const/4 v9, 0x2

    if-ge v7, v9, :cond_1c

    .line 171
    aget v9, p0, p1

    aput v9, v8, v7

    .line 170
    add-int/lit8 v7, v7, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_10

    .line 173
    :cond_1c
    const/4 v9, 0x2

    invoke-static {v8, v9}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p2, v9}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSegmentIndex(I)V

    .line 176
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v6, "fileId":Ljava/lang/StringBuilder;
    invoke-static {p0, p1, v6}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    .line 178
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v9}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileId(Ljava/lang/String;)V

    .line 180
    aget v9, p0, p1

    const/16 v10, 0x39b

    if-ne v9, v10, :cond_76

    .line 181
    add-int/lit8 p1, p1, 0x1

    .line 182
    const/4 v9, 0x0

    aget v9, p0, v9

    sub-int/2addr v9, p1

    new-array v0, v9, [I

    .line 183
    .local v0, "additionalOptionCodeWords":[I
    const/4 v1, 0x0

    .line 185
    .local v1, "additionalOptionCodeWordsIndex":I
    const/4 v5, 0x0

    .line 186
    .local v5, "end":Z
    :goto_48
    const/4 v9, 0x0

    aget v9, p0, v9

    if-ge p1, v9, :cond_6e

    if-nez v5, :cond_6e

    .line 187
    add-int/lit8 v4, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v4, "codeIndex":I
    aget v3, p0, p1

    .line 188
    .local v3, "code":I
    const/16 v9, 0x384

    if-ge v3, v9, :cond_5e

    .line 189
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "additionalOptionCodeWordsIndex":I
    .local v2, "additionalOptionCodeWordsIndex":I
    aput v3, v0, v1

    move v1, v2

    .end local v2    # "additionalOptionCodeWordsIndex":I
    .restart local v1    # "additionalOptionCodeWordsIndex":I
    move p1, v4

    .end local v4    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_48

    .line 191
    .end local p1    # "codeIndex":I
    .restart local v4    # "codeIndex":I
    :cond_5e
    packed-switch v3, :pswitch_data_84

    .line 198
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v9

    throw v9

    .line 193
    :pswitch_66
    const/4 v9, 0x1

    invoke-virtual {p2, v9}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    .line 194
    add-int/lit8 p1, v4, 0x1

    .line 195
    .end local v4    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v5, 0x1

    .line 196
    goto :goto_48

    .line 203
    .end local v3    # "code":I
    :cond_6e
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v9

    invoke-virtual {p2, v9}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setOptionalData([I)V

    .line 209
    .end local v0    # "additionalOptionCodeWords":[I
    .end local v1    # "additionalOptionCodeWordsIndex":I
    .end local v5    # "end":Z
    :cond_75
    :goto_75
    return p1

    .line 204
    :cond_76
    aget v9, p0, p1

    const/16 v10, 0x39a

    if-ne v9, v10, :cond_75

    .line 205
    const/4 v9, 0x1

    invoke-virtual {p2, v9}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    .line 206
    add-int/lit8 p1, p1, 0x1

    goto :goto_75

    .line 191
    nop

    :pswitch_data_84
    .packed-switch 0x39a
        :pswitch_66
    .end packed-switch
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuilder;)V
    .registers 16
    .param p0, "textCompactionData"    # [I
    .param p1, "byteCompactionData"    # [I
    .param p2, "length"    # I
    .param p3, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v11, 0x1b

    const/16 v10, 0x391

    const/16 v9, 0x384

    const/16 v8, 0x1d

    const/16 v7, 0x1a

    .line 294
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 295
    .local v3, "subMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    .line 296
    .local v2, "priorToShiftMode":Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    const/4 v1, 0x0

    .line 297
    .local v1, "i":I
    :goto_f
    if-ge v1, p2, :cond_107

    .line 298
    aget v4, p0, v1

    .line 299
    .local v4, "subModeCh":I
    const/4 v0, 0x0

    .line 300
    .local v0, "ch":C
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$1;->$SwitchMap$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_108

    .line 423
    :cond_1f
    :goto_1f
    if-eqz v0, :cond_24

    .line 425
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 427
    :cond_24
    add-int/lit8 v1, v1, 0x1

    .line 428
    goto :goto_f

    .line 303
    :pswitch_27
    if-ge v4, v7, :cond_2d

    .line 305
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    goto :goto_1f

    .line 307
    :cond_2d
    if-ne v4, v7, :cond_32

    .line 308
    const/16 v0, 0x20

    goto :goto_1f

    .line 309
    :cond_32
    if-ne v4, v11, :cond_37

    .line 310
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 311
    :cond_37
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_3e

    .line 312
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 313
    :cond_3e
    if-ne v4, v8, :cond_44

    .line 315
    move-object v2, v3

    .line 316
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 317
    :cond_44
    if-ne v4, v10, :cond_4d

    .line 318
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 319
    :cond_4d
    if-ne v4, v9, :cond_1f

    .line 320
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 327
    :pswitch_52
    if-ge v4, v7, :cond_58

    .line 328
    add-int/lit8 v5, v4, 0x61

    int-to-char v0, v5

    goto :goto_1f

    .line 330
    :cond_58
    if-ne v4, v7, :cond_5d

    .line 331
    const/16 v0, 0x20

    goto :goto_1f

    .line 332
    :cond_5d
    if-ne v4, v11, :cond_63

    .line 334
    move-object v2, v3

    .line 335
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 336
    :cond_63
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_6a

    .line 337
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 338
    :cond_6a
    if-ne v4, v8, :cond_70

    .line 340
    move-object v2, v3

    .line 341
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 342
    :cond_70
    if-ne v4, v10, :cond_79

    .line 344
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 345
    :cond_79
    if-ne v4, v9, :cond_1f

    .line 346
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 353
    :pswitch_7e
    const/16 v5, 0x19

    if-ge v4, v5, :cond_87

    .line 354
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v0, v5, v4

    goto :goto_1f

    .line 356
    :cond_87
    const/16 v5, 0x19

    if-ne v4, v5, :cond_8e

    .line 357
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 358
    :cond_8e
    if-ne v4, v7, :cond_93

    .line 359
    const/16 v0, 0x20

    goto :goto_1f

    .line 360
    :cond_93
    if-ne v4, v11, :cond_98

    .line 361
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 362
    :cond_98
    const/16 v5, 0x1c

    if-ne v4, v5, :cond_9f

    .line 363
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_1f

    .line 364
    :cond_9f
    if-ne v4, v8, :cond_a6

    .line 366
    move-object v2, v3

    .line 367
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 368
    :cond_a6
    if-ne v4, v10, :cond_b0

    .line 369
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1f

    .line 370
    :cond_b0
    if-ne v4, v9, :cond_1f

    .line 371
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 378
    :pswitch_b6
    if-ge v4, v8, :cond_be

    .line 379
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    goto/16 :goto_1f

    .line 381
    :cond_be
    if-ne v4, v8, :cond_c4

    .line 382
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 383
    :cond_c4
    if-ne v4, v10, :cond_ce

    .line 384
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1f

    .line 385
    :cond_ce
    if-ne v4, v9, :cond_1f

    .line 386
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 393
    :pswitch_d4
    move-object v3, v2

    .line 394
    if-ge v4, v7, :cond_dc

    .line 395
    add-int/lit8 v5, v4, 0x41

    int-to-char v0, v5

    goto/16 :goto_1f

    .line 397
    :cond_dc
    if-ne v4, v7, :cond_e2

    .line 398
    const/16 v0, 0x20

    goto/16 :goto_1f

    .line 399
    :cond_e2
    if-ne v4, v9, :cond_1f

    .line 400
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 407
    :pswitch_e8
    move-object v3, v2

    .line 408
    if-ge v4, v8, :cond_f1

    .line 409
    sget-object v5, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v0, v5, v4

    goto/16 :goto_1f

    .line 411
    :cond_f1
    if-ne v4, v8, :cond_f7

    .line 412
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 413
    :cond_f7
    if-ne v4, v10, :cond_101

    .line 416
    aget v5, p1, v1

    int-to-char v5, v5

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1f

    .line 417
    :cond_101
    if-ne v4, v9, :cond_1f

    .line 418
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_1f

    .line 429
    .end local v0    # "ch":C
    .end local v4    # "subModeCh":I
    :cond_107
    return-void

    .line 300
    :pswitch_data_108
    .packed-switch 0x1
        :pswitch_27
        :pswitch_52
        :pswitch_7e
        :pswitch_b6
        :pswitch_d4
        :pswitch_e8
    .end packed-switch
.end method

.method private static numericCompaction([IILjava/lang/StringBuilder;)I
    .registers 12
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x384

    const/4 v7, 0x0

    .line 545
    const/4 v2, 0x0

    .line 546
    .local v2, "count":I
    const/4 v3, 0x0

    .line 548
    .local v3, "end":Z
    const/16 v6, 0xf

    new-array v4, v6, [I

    .line 550
    .local v4, "numericCodewords":[I
    :cond_9
    :goto_9
    aget v6, p0, v7

    if-ge p1, v6, :cond_4e

    if-nez v3, :cond_4e

    .line 551
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v1, "codeIndex":I
    aget v0, p0, p1

    .line 552
    .local v0, "code":I
    aget v6, p0, v7

    if-ne v1, v6, :cond_18

    .line 553
    const/4 v3, 0x1

    .line 555
    :cond_18
    if-ge v0, v8, :cond_34

    .line 556
    aput v0, v4, v2

    .line 557
    add-int/lit8 v2, v2, 0x1

    move p1, v1

    .line 569
    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    :goto_1f
    rem-int/lit8 v6, v2, 0xf

    if-eqz v6, :cond_29

    const/16 v6, 0x386

    if-eq v0, v6, :cond_29

    if-eqz v3, :cond_9

    .line 576
    :cond_29
    if-lez v2, :cond_9

    .line 577
    invoke-static {v4, v2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v5

    .line 578
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    const/4 v2, 0x0

    goto :goto_9

    .line 559
    .end local v5    # "s":Ljava/lang/String;
    .end local p1    # "codeIndex":I
    .restart local v1    # "codeIndex":I
    :cond_34
    if-eq v0, v8, :cond_4a

    const/16 v6, 0x385

    if-eq v0, v6, :cond_4a

    const/16 v6, 0x39c

    if-eq v0, v6, :cond_4a

    const/16 v6, 0x3a0

    if-eq v0, v6, :cond_4a

    const/16 v6, 0x39b

    if-eq v0, v6, :cond_4a

    const/16 v6, 0x39a

    if-ne v0, v6, :cond_4f

    .line 565
    :cond_4a
    add-int/lit8 p1, v1, -0x1

    .line 566
    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    goto :goto_1f

    .line 583
    .end local v0    # "code":I
    :cond_4e
    return p1

    .end local p1    # "codeIndex":I
    .restart local v0    # "code":I
    .restart local v1    # "codeIndex":I
    :cond_4f
    move p1, v1

    .end local v1    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_1f
.end method

.method private static textCompaction([IILjava/lang/StringBuilder;)I
    .registers 14
    .param p0, "codewords"    # [I
    .param p1, "codeIndex"    # I
    .param p2, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v10, 0x384

    const/4 v9, 0x0

    .line 224
    aget v7, p0, v9

    sub-int/2addr v7, p1

    mul-int/lit8 v7, v7, 0x2

    new-array v6, v7, [I

    .line 226
    .local v6, "textCompactionData":[I
    aget v7, p0, v9

    sub-int/2addr v7, p1

    mul-int/lit8 v7, v7, 0x2

    new-array v0, v7, [I

    .line 228
    .local v0, "byteCompactionData":[I
    const/4 v4, 0x0

    .line 229
    .local v4, "index":I
    const/4 v3, 0x0

    .line 230
    .local v3, "end":Z
    :goto_13
    aget v7, p0, v9

    if-ge p1, v7, :cond_4a

    if-nez v3, :cond_4a

    .line 231
    add-int/lit8 v2, p1, 0x1

    .end local p1    # "codeIndex":I
    .local v2, "codeIndex":I
    aget v1, p0, p1

    .line 232
    .local v1, "code":I
    if-ge v1, v10, :cond_2d

    .line 233
    div-int/lit8 v7, v1, 0x1e

    aput v7, v6, v4

    .line 234
    add-int/lit8 v7, v4, 0x1

    rem-int/lit8 v8, v1, 0x1e

    aput v8, v6, v7

    .line 235
    add-int/lit8 v4, v4, 0x2

    move p1, v2

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_13

    .line 237
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :cond_2d
    sparse-switch v1, :sswitch_data_4e

    move p1, v2

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_13

    .line 240
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_32
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .local v5, "index":I
    aput v10, v6, v4

    move v4, v5

    .end local v5    # "index":I
    .restart local v4    # "index":I
    move p1, v2

    .line 241
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    goto :goto_13

    .line 248
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_39
    add-int/lit8 p1, v2, -0x1

    .line 249
    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    const/4 v3, 0x1

    .line 250
    goto :goto_13

    .line 258
    .end local p1    # "codeIndex":I
    .restart local v2    # "codeIndex":I
    :sswitch_3d
    const/16 v7, 0x391

    aput v7, v6, v4

    .line 259
    add-int/lit8 p1, v2, 0x1

    .end local v2    # "codeIndex":I
    .restart local p1    # "codeIndex":I
    aget v1, p0, v2

    .line 260
    aput v1, v0, v4

    .line 261
    add-int/lit8 v4, v4, 0x1

    goto :goto_13

    .line 266
    .end local v1    # "code":I
    :cond_4a
    invoke-static {v6, v0, v4, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuilder;)V

    .line 267
    return p1

    .line 237
    :sswitch_data_4e
    .sparse-switch
        0x384 -> :sswitch_32
        0x385 -> :sswitch_39
        0x386 -> :sswitch_39
        0x391 -> :sswitch_3d
        0x39a -> :sswitch_39
        0x39b -> :sswitch_39
        0x39c -> :sswitch_39
        0x3a0 -> :sswitch_39
    .end sparse-switch
.end method
