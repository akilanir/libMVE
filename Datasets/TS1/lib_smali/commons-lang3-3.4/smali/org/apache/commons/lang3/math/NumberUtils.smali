.class public Lorg/apache/commons/lang3/math/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# static fields
.field public static final BYTE_MINUS_ONE:Ljava/lang/Byte;

.field public static final BYTE_ONE:Ljava/lang/Byte;

.field public static final BYTE_ZERO:Ljava/lang/Byte;

.field public static final DOUBLE_MINUS_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ZERO:Ljava/lang/Double;

.field public static final FLOAT_MINUS_ONE:Ljava/lang/Float;

.field public static final FLOAT_ONE:Ljava/lang/Float;

.field public static final FLOAT_ZERO:Ljava/lang/Float;

.field public static final INTEGER_MINUS_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ZERO:Ljava/lang/Integer;

.field public static final LONG_MINUS_ONE:Ljava/lang/Long;

.field public static final LONG_ONE:Ljava/lang/Long;

.field public static final LONG_ZERO:Ljava/lang/Long;

.field public static final SHORT_MINUS_ONE:Ljava/lang/Short;

.field public static final SHORT_ONE:Ljava/lang/Short;

.field public static final SHORT_ZERO:Ljava/lang/Short;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 35
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ZERO:Ljava/lang/Long;

    .line 37
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ONE:Ljava/lang/Long;

    .line 39
    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_MINUS_ONE:Ljava/lang/Long;

    .line 41
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    .line 43
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    .line 45
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_MINUS_ONE:Ljava/lang/Integer;

    .line 47
    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ZERO:Ljava/lang/Short;

    .line 49
    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ONE:Ljava/lang/Short;

    .line 51
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_MINUS_ONE:Ljava/lang/Short;

    .line 53
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ZERO:Ljava/lang/Byte;

    .line 55
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ONE:Ljava/lang/Byte;

    .line 57
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_MINUS_ONE:Ljava/lang/Byte;

    .line 59
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ZERO:Ljava/lang/Double;

    .line 61
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ONE:Ljava/lang/Double;

    .line 63
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_MINUS_ONE:Ljava/lang/Double;

    .line 65
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ZERO:Ljava/lang/Float;

    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ONE:Ljava/lang/Float;

    .line 69
    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_MINUS_ONE:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    return-void
.end method

.method public static compare(BB)I
    .registers 3
    .param p0, "x"    # B
    .param p1, "y"    # B

    .prologue
    .line 1600
    sub-int v0, p0, p1

    return v0
.end method

.method public static compare(II)I
    .registers 3
    .param p0, "x"    # I
    .param p1, "y"    # I

    .prologue
    .line 1537
    if-ne p0, p1, :cond_4

    .line 1538
    const/4 v0, 0x0

    .line 1543
    :goto_3
    return v0

    .line 1540
    :cond_4
    if-ge p0, p1, :cond_8

    .line 1541
    const/4 v0, -0x1

    goto :goto_3

    .line 1543
    :cond_8
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static compare(JJ)I
    .registers 5
    .param p0, "x"    # J
    .param p2, "y"    # J

    .prologue
    .line 1558
    cmp-long v0, p0, p2

    if-nez v0, :cond_6

    .line 1559
    const/4 v0, 0x0

    .line 1564
    :goto_5
    return v0

    .line 1561
    :cond_6
    cmp-long v0, p0, p2

    if-gez v0, :cond_c

    .line 1562
    const/4 v0, -0x1

    goto :goto_5

    .line 1564
    :cond_c
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public static compare(SS)I
    .registers 3
    .param p0, "x"    # S
    .param p1, "y"    # S

    .prologue
    .line 1579
    if-ne p0, p1, :cond_4

    .line 1580
    const/4 v0, 0x0

    .line 1585
    :goto_3
    return v0

    .line 1582
    :cond_4
    if-ge p0, p1, :cond_8

    .line 1583
    const/4 v0, -0x1

    goto :goto_3

    .line 1585
    :cond_8
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 790
    if-nez p0, :cond_4

    .line 791
    const/4 v0, 0x0

    .line 804
    :goto_3
    return-object v0

    .line 794
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 795
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "A blank string is not a valid number"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 797
    :cond_12
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 802
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid number."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 804
    :cond_37
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_3
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 755
    if-nez p0, :cond_4

    .line 756
    const/4 v3, 0x0

    .line 777
    :cond_3
    :goto_3
    return-object v3

    .line 758
    :cond_4
    const/4 v1, 0x0

    .line 759
    .local v1, "pos":I
    const/16 v2, 0xa

    .line 760
    .local v2, "radix":I
    const/4 v0, 0x0

    .line 761
    .local v0, "negate":Z
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 762
    const/4 v0, 0x1

    .line 763
    const/4 v1, 0x1

    .line 765
    :cond_12
    const-string v4, "0x"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_22

    const-string v4, "0X"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 766
    :cond_22
    const/16 v2, 0x10

    .line 767
    add-int/lit8 v1, v1, 0x2

    .line 776
    :cond_26
    :goto_26
    new-instance v3, Ljava/math/BigInteger;

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 777
    .local v3, "value":Ljava/math/BigInteger;
    if-eqz v0, :cond_3

    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v3

    goto :goto_3

    .line 768
    .end local v3    # "value":Ljava/math/BigInteger;
    :cond_36
    const-string v4, "#"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 769
    const/16 v2, 0x10

    .line 770
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 771
    :cond_43
    const-string v4, "0"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v1, 0x1

    if-le v4, v5, :cond_26

    .line 772
    const/16 v2, 0x8

    .line 773
    add-int/lit8 v1, v1, 0x1

    goto :goto_26
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 701
    if-nez p0, :cond_4

    .line 702
    const/4 v0, 0x0

    .line 704
    :goto_3
    return-object v0

    :cond_4
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    goto :goto_3
.end method

.method public static createFloat(Ljava/lang/String;)Ljava/lang/Float;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 685
    if-nez p0, :cond_4

    .line 686
    const/4 v0, 0x0

    .line 688
    :goto_3
    return-object v0

    :cond_4
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    goto :goto_3
.end method

.method public static createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 719
    if-nez p0, :cond_4

    .line 720
    const/4 v0, 0x0

    .line 723
    :goto_3
    return-object v0

    :cond_4
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_3
.end method

.method public static createLong(Ljava/lang/String;)Ljava/lang/Long;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 738
    if-nez p0, :cond_4

    .line 739
    const/4 v0, 0x0

    .line 741
    :goto_3
    return-object v0

    :cond_4
    invoke-static {p0}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    goto :goto_3
.end method

.method public static createNumber(Ljava/lang/String;)Ljava/lang/Number;
    .registers 28
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 452
    if-nez p0, :cond_4

    .line 453
    const/4 v10, 0x0

    .line 623
    :cond_3
    :goto_3
    return-object v10

    .line 455
    :cond_4
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_12

    .line 456
    new-instance v23, Ljava/lang/NumberFormatException;

    const-string v24, "A blank string is not a valid number"

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 459
    :cond_12
    const/16 v23, 0x6

    move/from16 v0, v23

    new-array v13, v0, [Ljava/lang/String;

    const/16 v23, 0x0

    const-string v24, "0x"

    aput-object v24, v13, v23

    const/16 v23, 0x1

    const-string v24, "0X"

    aput-object v24, v13, v23

    const/16 v23, 0x2

    const-string v24, "-0x"

    aput-object v24, v13, v23

    const/16 v23, 0x3

    const-string v24, "-0X"

    aput-object v24, v13, v23

    const/16 v23, 0x4

    const-string v24, "#"

    aput-object v24, v13, v23

    const/16 v23, 0x5

    const-string v24, "-#"

    aput-object v24, v13, v23

    .line 460
    .local v13, "hex_prefixes":[Ljava/lang/String;
    const/16 v22, 0x0

    .line 461
    .local v22, "pfxLen":I
    move-object v4, v13

    .local v4, "arr$":[Ljava/lang/String;
    array-length v0, v4

    move/from16 v17, v0

    .local v17, "len$":I
    const/4 v15, 0x0

    .local v15, "i$":I
    :goto_43
    move/from16 v0, v17

    if-ge v15, v0, :cond_59

    aget-object v21, v4, v15

    .line 462
    .local v21, "pfx":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_77

    .line 463
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v23

    add-int v22, v22, v23

    .line 467
    .end local v21    # "pfx":Ljava/lang/String;
    :cond_59
    if-lez v22, :cond_b6

    .line 468
    const/4 v11, 0x0

    .line 469
    .local v11, "firstSigDigit":C
    move/from16 v14, v22

    .local v14, "i":I
    :goto_5e
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-ge v14, v0, :cond_7a

    .line 470
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 471
    const/16 v23, 0x30

    move/from16 v0, v23

    if-ne v11, v0, :cond_7a

    .line 472
    add-int/lit8 v22, v22, 0x1

    .line 469
    add-int/lit8 v14, v14, 0x1

    goto :goto_5e

    .line 461
    .end local v11    # "firstSigDigit":C
    .end local v14    # "i":I
    .restart local v21    # "pfx":Ljava/lang/String;
    :cond_77
    add-int/lit8 v15, v15, 0x1

    goto :goto_43

    .line 477
    .end local v21    # "pfx":Ljava/lang/String;
    .restart local v11    # "firstSigDigit":C
    .restart local v14    # "i":I
    :cond_7a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    sub-int v12, v23, v22

    .line 478
    .local v12, "hexDigits":I
    const/16 v23, 0x10

    move/from16 v0, v23

    if-gt v12, v0, :cond_92

    const/16 v23, 0x10

    move/from16 v0, v23

    if-ne v12, v0, :cond_98

    const/16 v23, 0x37

    move/from16 v0, v23

    if-le v11, v0, :cond_98

    .line 479
    :cond_92
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 481
    :cond_98
    const/16 v23, 0x8

    move/from16 v0, v23

    if-gt v12, v0, :cond_aa

    const/16 v23, 0x8

    move/from16 v0, v23

    if-ne v12, v0, :cond_b0

    const/16 v23, 0x37

    move/from16 v0, v23

    if-le v11, v0, :cond_b0

    .line 482
    :cond_aa
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    goto/16 :goto_3

    .line 484
    :cond_b0
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    goto/16 :goto_3

    .line 486
    .end local v11    # "firstSigDigit":C
    .end local v12    # "hexDigits":I
    .end local v14    # "i":I
    :cond_b6
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v16

    .line 490
    .local v16, "lastChar":C
    const/16 v23, 0x2e

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 491
    .local v7, "decPos":I
    const/16 v23, 0x65

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v23

    const/16 v24, 0x45

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v24

    add-int v23, v23, v24

    add-int/lit8 v9, v23, 0x1

    .line 495
    .local v9, "expPos":I
    const/16 v19, 0x0

    .line 496
    .local v19, "numDecimals":I
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v7, v0, :cond_1aa

    .line 498
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_19e

    .line 499
    if-lt v9, v7, :cond_fe

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-le v9, v0, :cond_11b

    .line 500
    :cond_fe
    new-instance v23, Ljava/lang/NumberFormatException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " is not a valid number."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 502
    :cond_11b
    add-int/lit8 v23, v7, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 506
    .local v6, "dec":Ljava/lang/String;
    :goto_125
    move-object/from16 v0, p0

    invoke-static {v0, v7}, Lorg/apache/commons/lang3/math/NumberUtils;->getMantissa(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    .line 507
    .local v18, "mant":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    .line 519
    :goto_12f
    invoke-static/range {v16 .. v16}, Ljava/lang/Character;->isDigit(C)Z

    move-result v23

    if-nez v23, :cond_279

    const/16 v23, 0x2e

    move/from16 v0, v16

    move/from16 v1, v23

    if-eq v0, v1, :cond_279

    .line 520
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_1e3

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v9, v0, :cond_1e3

    .line 521
    add-int/lit8 v23, v9, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 526
    .local v8, "exp":Ljava/lang/String;
    :goto_15f
    const/16 v23, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 527
    .local v20, "numeric":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_1e6

    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_1e6

    const/4 v3, 0x1

    .line 528
    .local v3, "allZeros":Z
    :goto_17e
    sparse-switch v16, :sswitch_data_310

    .line 574
    :goto_181
    new-instance v23, Ljava/lang/NumberFormatException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " is not a valid number."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 504
    .end local v3    # "allZeros":Z
    .end local v6    # "dec":Ljava/lang/String;
    .end local v8    # "exp":Ljava/lang/String;
    .end local v18    # "mant":Ljava/lang/String;
    .end local v20    # "numeric":Ljava/lang/String;
    :cond_19e
    add-int/lit8 v23, v7, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "dec":Ljava/lang/String;
    goto/16 :goto_125

    .line 509
    .end local v6    # "dec":Ljava/lang/String;
    :cond_1aa
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_1de

    .line 510
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-le v9, v0, :cond_1d5

    .line 511
    new-instance v23, Ljava/lang/NumberFormatException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " is not a valid number."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 513
    :cond_1d5
    move-object/from16 v0, p0

    invoke-static {v0, v9}, Lorg/apache/commons/lang3/math/NumberUtils;->getMantissa(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    .line 517
    .restart local v18    # "mant":Ljava/lang/String;
    :goto_1db
    const/4 v6, 0x0

    .restart local v6    # "dec":Ljava/lang/String;
    goto/16 :goto_12f

    .line 515
    .end local v6    # "dec":Ljava/lang/String;
    .end local v18    # "mant":Ljava/lang/String;
    :cond_1de
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->getMantissa(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .restart local v18    # "mant":Ljava/lang/String;
    goto :goto_1db

    .line 523
    .restart local v6    # "dec":Ljava/lang/String;
    :cond_1e3
    const/4 v8, 0x0

    .restart local v8    # "exp":Ljava/lang/String;
    goto/16 :goto_15f

    .line 527
    .restart local v20    # "numeric":Ljava/lang/String;
    :cond_1e6
    const/4 v3, 0x0

    goto :goto_17e

    .line 531
    .restart local v3    # "allZeros":Z
    :sswitch_1e8
    if-nez v6, :cond_221

    if-nez v8, :cond_221

    const/16 v23, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v23

    const/16 v24, 0x2d

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_20e

    const/16 v23, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v23

    if-nez v23, :cond_214

    :cond_20e
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_221

    .line 535
    :cond_214
    :try_start_214
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_217
    .catch Ljava/lang/NumberFormatException; {:try_start_214 .. :try_end_217} :catch_21a

    move-result-object v10

    goto/16 :goto_3

    .line 536
    :catch_21a
    move-exception v23

    .line 539
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 542
    :cond_221
    new-instance v23, Ljava/lang/NumberFormatException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " is not a valid number."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 546
    :sswitch_23e
    :try_start_23e
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v10

    .line 547
    .local v10, "f":Ljava/lang/Float;
    invoke-virtual {v10}, Ljava/lang/Float;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_254

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F
    :try_end_24b
    .catch Ljava/lang/NumberFormatException; {:try_start_23e .. :try_end_24b} :catch_30d

    move-result v23

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-nez v23, :cond_3

    if-nez v3, :cond_3

    .line 560
    .end local v10    # "f":Ljava/lang/Float;
    :cond_254
    :goto_254
    :sswitch_254
    :try_start_254
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    .line 561
    .local v5, "d":Ljava/lang/Double;
    invoke-virtual {v5}, Ljava/lang/Double;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_273

    invoke-virtual {v5}, Ljava/lang/Double;->floatValue()F
    :try_end_261
    .catch Ljava/lang/NumberFormatException; {:try_start_254 .. :try_end_261} :catch_272

    move-result v23

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x0

    cmpl-double v23, v23, v25

    if-nez v23, :cond_26f

    if-eqz v3, :cond_273

    :cond_26f
    move-object v10, v5

    .line 562
    goto/16 :goto_3

    .line 564
    .end local v5    # "d":Ljava/lang/Double;
    :catch_272
    move-exception v23

    .line 568
    :cond_273
    :try_start_273
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    :try_end_276
    .catch Ljava/lang/NumberFormatException; {:try_start_273 .. :try_end_276} :catch_308

    move-result-object v10

    goto/16 :goto_3

    .line 580
    .end local v3    # "allZeros":Z
    .end local v8    # "exp":Ljava/lang/String;
    .end local v20    # "numeric":Ljava/lang/String;
    :cond_279
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_2a3

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v9, v0, :cond_2a3

    .line 581
    add-int/lit8 v23, v9, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 585
    .restart local v8    # "exp":Ljava/lang/String;
    :goto_299
    if-nez v6, :cond_2b3

    if-nez v8, :cond_2b3

    .line 588
    :try_start_29d
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_2a0
    .catch Ljava/lang/NumberFormatException; {:try_start_29d .. :try_end_2a0} :catch_2a5

    move-result-object v10

    goto/16 :goto_3

    .line 583
    .end local v8    # "exp":Ljava/lang/String;
    :cond_2a3
    const/4 v8, 0x0

    .restart local v8    # "exp":Ljava/lang/String;
    goto :goto_299

    .line 589
    :catch_2a5
    move-exception v23

    .line 593
    :try_start_2a6
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_2a9
    .catch Ljava/lang/NumberFormatException; {:try_start_2a6 .. :try_end_2a9} :catch_2ac

    move-result-object v10

    goto/16 :goto_3

    .line 594
    :catch_2ac
    move-exception v23

    .line 597
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 601
    :cond_2b3
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_2ff

    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_2ff

    const/4 v3, 0x1

    .line 603
    .restart local v3    # "allZeros":Z
    :goto_2c0
    const/16 v23, 0x7

    move/from16 v0, v19

    move/from16 v1, v23

    if-gt v0, v1, :cond_2de

    .line 604
    :try_start_2c8
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v10

    .line 605
    .restart local v10    # "f":Ljava/lang/Float;
    invoke-virtual {v10}, Ljava/lang/Float;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_2de

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F
    :try_end_2d5
    .catch Ljava/lang/NumberFormatException; {:try_start_2c8 .. :try_end_2d5} :catch_30b

    move-result v23

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-nez v23, :cond_3

    if-nez v3, :cond_3

    .line 613
    .end local v10    # "f":Ljava/lang/Float;
    :cond_2de
    :goto_2de
    const/16 v23, 0x10

    move/from16 v0, v19

    move/from16 v1, v23

    if-gt v0, v1, :cond_302

    .line 614
    :try_start_2e6
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    .line 615
    .restart local v5    # "d":Ljava/lang/Double;
    invoke-virtual {v5}, Ljava/lang/Double;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_302

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D
    :try_end_2f3
    .catch Ljava/lang/NumberFormatException; {:try_start_2e6 .. :try_end_2f3} :catch_301

    move-result-wide v23

    const-wide/16 v25, 0x0

    cmpl-double v23, v23, v25

    if-nez v23, :cond_2fc

    if-eqz v3, :cond_302

    :cond_2fc
    move-object v10, v5

    .line 616
    goto/16 :goto_3

    .line 601
    .end local v3    # "allZeros":Z
    .end local v5    # "d":Ljava/lang/Double;
    :cond_2ff
    const/4 v3, 0x0

    goto :goto_2c0

    .line 619
    .restart local v3    # "allZeros":Z
    :catch_301
    move-exception v23

    .line 623
    :cond_302
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v10

    goto/16 :goto_3

    .line 569
    .restart local v20    # "numeric":Ljava/lang/String;
    :catch_308
    move-exception v23

    goto/16 :goto_181

    .line 609
    .end local v20    # "numeric":Ljava/lang/String;
    :catch_30b
    move-exception v23

    goto :goto_2de

    .line 553
    .restart local v20    # "numeric":Ljava/lang/String;
    :catch_30d
    move-exception v23

    goto/16 :goto_254

    .line 528
    :sswitch_data_310
    .sparse-switch
        0x44 -> :sswitch_254
        0x46 -> :sswitch_23e
        0x4c -> :sswitch_1e8
        0x64 -> :sswitch_254
        0x66 -> :sswitch_23e
        0x6c -> :sswitch_1e8
    .end sparse-switch
.end method

.method private static getMantissa(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 635
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->getMantissa(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getMantissa(Ljava/lang/String;I)Ljava/lang/String;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "stopPos"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 648
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 649
    .local v0, "firstChar":C
    const/16 v4, 0x2d

    if-eq v0, v4, :cond_e

    const/16 v4, 0x2b

    if-ne v0, v4, :cond_16

    :cond_e
    move v1, v3

    .line 651
    .local v1, "hasSign":Z
    :goto_f
    if-eqz v1, :cond_18

    invoke-virtual {p0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :goto_15
    return-object v2

    .end local v1    # "hasSign":Z
    :cond_16
    move v1, v2

    .line 649
    goto :goto_f

    .line 651
    .restart local v1    # "hasSign":Z
    :cond_18
    invoke-virtual {p0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_15
.end method

.method private static isAllZeros(Ljava/lang/String;)Z
    .registers 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 663
    if-nez p0, :cond_5

    .line 671
    :cond_4
    :goto_4
    return v1

    .line 666
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1a

    .line 667
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_17

    move v1, v2

    .line 668
    goto :goto_4

    .line 666
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 671
    :cond_1a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public static isDigits(Ljava/lang/String;)Z
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 1352
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1360
    :cond_7
    :goto_7
    return v1

    .line 1355
    :cond_8
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 1356
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1355
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 1360
    :cond_1c
    const/4 v1, 0x1

    goto :goto_7
.end method

.method public static isNumber(Ljava/lang/String;)Z
    .registers 16
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v14, 0x2d

    const/16 v13, 0x39

    const/16 v12, 0x30

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1383
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 1495
    :cond_e
    :goto_e
    return v9

    .line 1386
    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 1387
    .local v1, "chars":[C
    array-length v7, v1

    .line 1388
    .local v7, "sz":I
    const/4 v4, 0x0

    .line 1389
    .local v4, "hasExp":Z
    const/4 v3, 0x0

    .line 1390
    .local v3, "hasDecPoint":Z
    const/4 v0, 0x0

    .line 1391
    .local v0, "allowSigns":Z
    const/4 v2, 0x0

    .line 1393
    .local v2, "foundDigit":Z
    aget-char v10, v1, v9

    if-ne v10, v14, :cond_5f

    move v6, v8

    .line 1394
    .local v6, "start":I
    :goto_1d
    add-int/lit8 v10, v6, 0x1

    if-le v7, v10, :cond_81

    aget-char v10, v1, v6

    if-ne v10, v12, :cond_81

    .line 1395
    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x78

    if-eq v10, v11, :cond_35

    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x58

    if-ne v10, v11, :cond_63

    .line 1399
    :cond_35
    add-int/lit8 v5, v6, 0x2

    .line 1400
    .local v5, "i":I
    if-eq v5, v7, :cond_e

    .line 1404
    :goto_39
    array-length v10, v1

    if-ge v5, v10, :cond_61

    .line 1405
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_44

    aget-char v10, v1, v5

    if-le v10, v13, :cond_5c

    :cond_44
    aget-char v10, v1, v5

    const/16 v11, 0x61

    if-lt v10, v11, :cond_50

    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-le v10, v11, :cond_5c

    :cond_50
    aget-char v10, v1, v5

    const/16 v11, 0x41

    if-lt v10, v11, :cond_e

    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-gt v10, v11, :cond_e

    .line 1404
    :cond_5c
    add-int/lit8 v5, v5, 0x1

    goto :goto_39

    .end local v5    # "i":I
    .end local v6    # "start":I
    :cond_5f
    move v6, v9

    .line 1393
    goto :goto_1d

    .restart local v5    # "i":I
    .restart local v6    # "start":I
    :cond_61
    move v9, v8

    .line 1411
    goto :goto_e

    .line 1412
    .end local v5    # "i":I
    :cond_63
    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    invoke-static {v10}, Ljava/lang/Character;->isDigit(C)Z

    move-result v10

    if-eqz v10, :cond_81

    .line 1414
    add-int/lit8 v5, v6, 0x1

    .line 1415
    .restart local v5    # "i":I
    :goto_6f
    array-length v10, v1

    if-ge v5, v10, :cond_7f

    .line 1416
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_e

    aget-char v10, v1, v5

    const/16 v11, 0x37

    if-gt v10, v11, :cond_e

    .line 1415
    add-int/lit8 v5, v5, 0x1

    goto :goto_6f

    :cond_7f
    move v9, v8

    .line 1420
    goto :goto_e

    .line 1423
    .end local v5    # "i":I
    :cond_81
    add-int/lit8 v7, v7, -0x1

    .line 1425
    move v5, v6

    .line 1428
    .restart local v5    # "i":I
    :goto_84
    if-lt v5, v7, :cond_8e

    add-int/lit8 v10, v7, 0x1

    if-ge v5, v10, :cond_c9

    if-eqz v0, :cond_c9

    if-nez v2, :cond_c9

    .line 1429
    :cond_8e
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_9b

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_9b

    .line 1430
    const/4 v2, 0x1

    .line 1431
    const/4 v0, 0x0

    .line 1459
    :goto_98
    add-int/lit8 v5, v5, 0x1

    goto :goto_84

    .line 1433
    :cond_9b
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_a7

    .line 1434
    if-nez v3, :cond_e

    if-nez v4, :cond_e

    .line 1438
    const/4 v3, 0x1

    goto :goto_98

    .line 1439
    :cond_a7
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_b3

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-ne v10, v11, :cond_ba

    .line 1441
    :cond_b3
    if-nez v4, :cond_e

    .line 1445
    if-eqz v2, :cond_e

    .line 1448
    const/4 v4, 0x1

    .line 1449
    const/4 v0, 0x1

    goto :goto_98

    .line 1450
    :cond_ba
    aget-char v10, v1, v5

    const/16 v11, 0x2b

    if-eq v10, v11, :cond_c4

    aget-char v10, v1, v5

    if-ne v10, v14, :cond_e

    .line 1451
    :cond_c4
    if-eqz v0, :cond_e

    .line 1454
    const/4 v0, 0x0

    .line 1455
    const/4 v2, 0x0

    goto :goto_98

    .line 1461
    :cond_c9
    array-length v10, v1

    if-ge v5, v10, :cond_124

    .line 1462
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_d7

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_d7

    move v9, v8

    .line 1464
    goto/16 :goto_e

    .line 1466
    :cond_d7
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_e

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-eq v10, v11, :cond_e

    .line 1470
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_f0

    .line 1471
    if-nez v3, :cond_e

    if-nez v4, :cond_e

    move v9, v2

    .line 1476
    goto/16 :goto_e

    .line 1478
    :cond_f0
    if-nez v0, :cond_10d

    aget-char v10, v1, v5

    const/16 v11, 0x64

    if-eq v10, v11, :cond_10a

    aget-char v10, v1, v5

    const/16 v11, 0x44

    if-eq v10, v11, :cond_10a

    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-eq v10, v11, :cond_10a

    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-ne v10, v11, :cond_10d

    :cond_10a
    move v9, v2

    .line 1483
    goto/16 :goto_e

    .line 1485
    :cond_10d
    aget-char v10, v1, v5

    const/16 v11, 0x6c

    if-eq v10, v11, :cond_119

    aget-char v10, v1, v5

    const/16 v11, 0x4c

    if-ne v10, v11, :cond_e

    .line 1488
    :cond_119
    if-eqz v2, :cond_122

    if-nez v4, :cond_122

    if-nez v3, :cond_122

    :goto_11f
    move v9, v8

    goto/16 :goto_e

    :cond_122
    move v8, v9

    goto :goto_11f

    .line 1495
    :cond_124
    if-nez v0, :cond_12b

    if-eqz v2, :cond_12b

    :goto_128
    move v9, v8

    goto/16 :goto_e

    :cond_12b
    move v8, v9

    goto :goto_128
.end method

.method public static isParsable(Ljava/lang/String;)Z
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 1516
    const-string v0, "."

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->endsWith(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1517
    const/4 v0, 0x0

    .line 1522
    :goto_9
    return v0

    .line 1519
    :cond_a
    const-string v0, "-"

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->startsWith(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 1520
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "."

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    goto :goto_9

    .line 1522
    :cond_24
    const-string v0, "."

    const-string v1, ""

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v0

    goto :goto_9
.end method

.method public static max(BBB)B
    .registers 3
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1299
    if-le p1, p0, :cond_3

    .line 1300
    move p0, p1

    .line 1302
    :cond_3
    if-le p2, p0, :cond_6

    .line 1303
    move p0, p2

    .line 1305
    :cond_6
    return p0
.end method

.method public static varargs max([B)B
    .registers 4
    .param p0, "array"    # [B

    .prologue
    .line 1046
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1049
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 1050
    .local v1, "max":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 1051
    aget-byte v2, p0, v0

    if-le v2, v1, :cond_10

    .line 1052
    aget-byte v1, p0, v0

    .line 1050
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1056
    :cond_13
    return v1
.end method

.method public static max(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1321
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static varargs max([D)D
    .registers 6
    .param p0, "array"    # [D

    .prologue
    .line 1071
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1074
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 1075
    .local v1, "max":D
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_14

    .line 1076
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 1077
    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    .line 1084
    .end local v1    # "max":D
    :cond_14
    return-wide v1

    .line 1079
    .restart local v1    # "max":D
    :cond_15
    aget-wide v3, p0, v0

    cmpl-double v3, v3, v1

    if-lez v3, :cond_1d

    .line 1080
    aget-wide v1, p0, v0

    .line 1075
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public static max(FFF)F
    .registers 4
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 1337
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static varargs max([F)F
    .registers 4
    .param p0, "array"    # [F

    .prologue
    .line 1099
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1102
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 1103
    .local v1, "max":F
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_14

    .line 1104
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1105
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 1112
    .end local v1    # "max":F
    :cond_14
    return v1

    .line 1107
    .restart local v1    # "max":F
    :cond_15
    aget v2, p0, v0

    cmpl-float v2, v2, v1

    if-lez v2, :cond_1d

    .line 1108
    aget v1, p0, v0

    .line 1103
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public static max(III)I
    .registers 3
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .prologue
    .line 1263
    if-le p1, p0, :cond_3

    .line 1264
    move p0, p1

    .line 1266
    :cond_3
    if-le p2, p0, :cond_6

    .line 1267
    move p0, p2

    .line 1269
    :cond_6
    return p0
.end method

.method public static varargs max([I)I
    .registers 4
    .param p0, "array"    # [I

    .prologue
    .line 998
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1001
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 1002
    .local v1, "max":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 1003
    aget v2, p0, v0

    if-le v2, v1, :cond_10

    .line 1004
    aget v1, p0, v0

    .line 1002
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1008
    :cond_13
    return v1
.end method

.method public static max(JJJ)J
    .registers 7
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1245
    cmp-long v0, p2, p0

    if-lez v0, :cond_5

    .line 1246
    move-wide p0, p2

    .line 1248
    :cond_5
    cmp-long v0, p4, p0

    if-lez v0, :cond_a

    .line 1249
    move-wide p0, p4

    .line 1251
    :cond_a
    return-wide p0
.end method

.method public static varargs max([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    .line 974
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 977
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 978
    .local v1, "max":J
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_15

    .line 979
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-lez v3, :cond_12

    .line 980
    aget-wide v1, p0, v0

    .line 978
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 984
    :cond_15
    return-wide v1
.end method

.method public static max(SSS)S
    .registers 3
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1281
    if-le p1, p0, :cond_3

    .line 1282
    move p0, p1

    .line 1284
    :cond_3
    if-le p2, p0, :cond_6

    .line 1285
    move p0, p2

    .line 1287
    :cond_6
    return p0
.end method

.method public static varargs max([S)S
    .registers 4
    .param p0, "array"    # [S

    .prologue
    .line 1022
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1025
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 1026
    .local v1, "max":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 1027
    aget-short v2, p0, v0

    if-le v2, v1, :cond_10

    .line 1028
    aget-short v1, p0, v0

    .line 1026
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1032
    :cond_13
    return v1
.end method

.method public static min(BBB)B
    .registers 3
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1193
    if-ge p1, p0, :cond_3

    .line 1194
    move p0, p1

    .line 1196
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1197
    move p0, p2

    .line 1199
    :cond_6
    return p0
.end method

.method public static varargs min([B)B
    .registers 4
    .param p0, "array"    # [B

    .prologue
    .line 892
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 895
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 896
    .local v1, "min":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 897
    aget-byte v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 898
    aget-byte v1, p0, v0

    .line 896
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 902
    :cond_13
    return v1
.end method

.method public static min(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1215
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static varargs min([D)D
    .registers 6
    .param p0, "array"    # [D

    .prologue
    .line 917
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 920
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 921
    .local v1, "min":D
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_14

    .line 922
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 923
    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    .line 930
    .end local v1    # "min":D
    :cond_14
    return-wide v1

    .line 925
    .restart local v1    # "min":D
    :cond_15
    aget-wide v3, p0, v0

    cmpg-double v3, v3, v1

    if-gez v3, :cond_1d

    .line 926
    aget-wide v1, p0, v0

    .line 921
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public static min(FFF)F
    .registers 4
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 1231
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static varargs min([F)F
    .registers 4
    .param p0, "array"    # [F

    .prologue
    .line 945
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 948
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 949
    .local v1, "min":F
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_14

    .line 950
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 951
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 958
    .end local v1    # "min":F
    :cond_14
    return v1

    .line 953
    .restart local v1    # "min":F
    :cond_15
    aget v2, p0, v0

    cmpg-float v2, v2, v1

    if-gez v2, :cond_1d

    .line 954
    aget v1, p0, v0

    .line 949
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method public static min(III)I
    .registers 3
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .prologue
    .line 1157
    if-ge p1, p0, :cond_3

    .line 1158
    move p0, p1

    .line 1160
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1161
    move p0, p2

    .line 1163
    :cond_6
    return p0
.end method

.method public static varargs min([I)I
    .registers 4
    .param p0, "array"    # [I

    .prologue
    .line 844
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 847
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 848
    .local v1, "min":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 849
    aget v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 850
    aget v1, p0, v0

    .line 848
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 854
    :cond_13
    return v1
.end method

.method public static min(JJJ)J
    .registers 7
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1139
    cmp-long v0, p2, p0

    if-gez v0, :cond_5

    .line 1140
    move-wide p0, p2

    .line 1142
    :cond_5
    cmp-long v0, p4, p0

    if-gez v0, :cond_a

    .line 1143
    move-wide p0, p4

    .line 1145
    :cond_a
    return-wide p0
.end method

.method public static varargs min([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    .line 820
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 823
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 824
    .local v1, "min":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_15

    .line 825
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-gez v3, :cond_12

    .line 826
    aget-wide v1, p0, v0

    .line 824
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 830
    :cond_15
    return-wide v1
.end method

.method public static min(SSS)S
    .registers 3
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1175
    if-ge p1, p0, :cond_3

    .line 1176
    move p0, p1

    .line 1178
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1179
    move p0, p2

    .line 1181
    :cond_6
    return p0
.end method

.method public static varargs min([S)S
    .registers 4
    .param p0, "array"    # [S

    .prologue
    .line 868
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 871
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 872
    .local v1, "min":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 873
    aget-short v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 874
    aget-short v1, p0, v0

    .line 872
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 878
    :cond_13
    return v1
.end method

.method public static toByte(Ljava/lang/String;)B
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 304
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toByte(Ljava/lang/String;B)B

    move-result v0

    return v0
.end method

.method public static toByte(Ljava/lang/String;B)B
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # B

    .prologue
    .line 325
    if-nez p0, :cond_3

    .line 331
    .end local p1    # "defaultValue":B
    :goto_2
    return p1

    .line 329
    .restart local p1    # "defaultValue":B
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 330
    :catch_8
    move-exception v0

    .line 331
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toDouble(Ljava/lang/String;)D
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 252
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toDouble(Ljava/lang/String;D)D
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # D

    .prologue
    .line 275
    if-nez p0, :cond_3

    .line 281
    .end local p1    # "defaultValue":D
    :goto_2
    return-wide p1

    .line 279
    .restart local p1    # "defaultValue":D
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result-wide p1

    goto :goto_2

    .line 280
    :catch_8
    move-exception v0

    .line 281
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toFloat(Ljava/lang/String;)F
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 200
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public static toFloat(Ljava/lang/String;F)F
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F

    .prologue
    .line 223
    if-nez p0, :cond_3

    .line 229
    .end local p1    # "defaultValue":F
    :goto_2
    return p1

    .line 227
    .restart local p1    # "defaultValue":F
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 228
    :catch_8
    move-exception v0

    .line 229
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toInt(Ljava/lang/String;)I
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static toInt(Ljava/lang/String;I)I
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 122
    if-nez p0, :cond_3

    .line 128
    .end local p1    # "defaultValue":I
    :goto_2
    return p1

    .line 126
    .restart local p1    # "defaultValue":I
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 127
    :catch_8
    move-exception v0

    .line 128
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toLong(Ljava/lang/String;)J
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 150
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toLong(Ljava/lang/String;J)J
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # J

    .prologue
    .line 171
    if-nez p0, :cond_3

    .line 177
    .end local p1    # "defaultValue":J
    :goto_2
    return-wide p1

    .line 175
    .restart local p1    # "defaultValue":J
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result-wide p1

    goto :goto_2

    .line 176
    :catch_8
    move-exception v0

    .line 177
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toShort(Ljava/lang/String;)S
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 353
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toShort(Ljava/lang/String;S)S

    move-result v0

    return v0
.end method

.method public static toShort(Ljava/lang/String;S)S
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # S

    .prologue
    .line 374
    if-nez p0, :cond_3

    .line 380
    .end local p1    # "defaultValue":S
    :goto_2
    return p1

    .line 378
    .restart local p1    # "defaultValue":S
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 379
    :catch_8
    move-exception v0

    .line 380
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method private static validateArray(Ljava/lang/Object;)V
    .registers 4
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1122
    if-nez p0, :cond_b

    .line 1123
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1125
    :cond_b
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_12
    const-string v2, "Array cannot be empty."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v1}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 1126
    return-void

    :cond_1a
    move v0, v1

    .line 1125
    goto :goto_12
.end method
