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

    .line 34
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ZERO:Ljava/lang/Long;

    .line 36
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ONE:Ljava/lang/Long;

    .line 38
    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_MINUS_ONE:Ljava/lang/Long;

    .line 40
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    .line 42
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_MINUS_ONE:Ljava/lang/Integer;

    .line 46
    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ZERO:Ljava/lang/Short;

    .line 48
    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ONE:Ljava/lang/Short;

    .line 50
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_MINUS_ONE:Ljava/lang/Short;

    .line 52
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ZERO:Ljava/lang/Byte;

    .line 54
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ONE:Ljava/lang/Byte;

    .line 56
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_MINUS_ONE:Ljava/lang/Byte;

    .line 58
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ZERO:Ljava/lang/Double;

    .line 60
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ONE:Ljava/lang/Double;

    .line 62
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_MINUS_ONE:Ljava/lang/Double;

    .line 64
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ZERO:Ljava/lang/Float;

    .line 66
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ONE:Ljava/lang/Float;

    .line 68
    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_MINUS_ONE:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 761
    if-nez p0, :cond_4

    .line 762
    const/4 v0, 0x0

    .line 775
    :goto_3
    return-object v0

    .line 765
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 766
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "A blank string is not a valid number"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 768
    :cond_12
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 773
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

    .line 775
    :cond_37
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_3
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 726
    if-nez p0, :cond_4

    .line 727
    const/4 v3, 0x0

    .line 748
    :cond_3
    :goto_3
    return-object v3

    .line 729
    :cond_4
    const/4 v1, 0x0

    .line 730
    .local v1, "pos":I
    const/16 v2, 0xa

    .line 731
    .local v2, "radix":I
    const/4 v0, 0x0

    .line 732
    .local v0, "negate":Z
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 733
    const/4 v0, 0x1

    .line 734
    const/4 v1, 0x1

    .line 736
    :cond_12
    const-string v4, "0x"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_22

    const-string v4, "0x"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 737
    :cond_22
    const/16 v2, 0x10

    .line 738
    add-int/lit8 v1, v1, 0x2

    .line 747
    :cond_26
    :goto_26
    new-instance v3, Ljava/math/BigInteger;

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 748
    .local v3, "value":Ljava/math/BigInteger;
    if-eqz v0, :cond_3

    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v3

    goto :goto_3

    .line 739
    .end local v3    # "value":Ljava/math/BigInteger;
    :cond_36
    const-string v4, "#"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 740
    const/16 v2, 0x10

    .line 741
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 742
    :cond_43
    const-string v4, "0"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_26

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v1, 0x1

    if-le v4, v5, :cond_26

    .line 743
    const/16 v2, 0x8

    .line 744
    add-int/lit8 v1, v1, 0x1

    goto :goto_26
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 672
    if-nez p0, :cond_4

    .line 673
    const/4 v0, 0x0

    .line 675
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
    .line 656
    if-nez p0, :cond_4

    .line 657
    const/4 v0, 0x0

    .line 659
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
    .line 690
    if-nez p0, :cond_4

    .line 691
    const/4 v0, 0x0

    .line 694
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
    .line 709
    if-nez p0, :cond_4

    .line 710
    const/4 v0, 0x0

    .line 712
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
    .line 451
    if-nez p0, :cond_4

    .line 452
    const/4 v10, 0x0

    .line 622
    :cond_3
    :goto_3
    return-object v10

    .line 454
    :cond_4
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v23

    if-eqz v23, :cond_12

    .line 455
    new-instance v23, Ljava/lang/NumberFormatException;

    const-string v24, "A blank string is not a valid number"

    invoke-direct/range {v23 .. v24}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 458
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

    .line 459
    .local v13, "hex_prefixes":[Ljava/lang/String;
    const/16 v22, 0x0

    .line 460
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

    .line 461
    .local v21, "pfx":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_77

    .line 462
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v23

    add-int v22, v22, v23

    .line 466
    .end local v21    # "pfx":Ljava/lang/String;
    :cond_59
    if-lez v22, :cond_b6

    .line 467
    const/4 v11, 0x0

    .line 468
    .local v11, "firstSigDigit":C
    move/from16 v14, v22

    .local v14, "i":I
    :goto_5e
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-ge v14, v0, :cond_7a

    .line 469
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 470
    const/16 v23, 0x30

    move/from16 v0, v23

    if-ne v11, v0, :cond_7a

    .line 471
    add-int/lit8 v22, v22, 0x1

    .line 468
    add-int/lit8 v14, v14, 0x1

    goto :goto_5e

    .line 460
    .end local v11    # "firstSigDigit":C
    .end local v14    # "i":I
    .restart local v21    # "pfx":Ljava/lang/String;
    :cond_77
    add-int/lit8 v15, v15, 0x1

    goto :goto_43

    .line 476
    .end local v21    # "pfx":Ljava/lang/String;
    .restart local v11    # "firstSigDigit":C
    .restart local v14    # "i":I
    :cond_7a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    sub-int v12, v23, v22

    .line 477
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

    .line 478
    :cond_92
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 480
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

    .line 481
    :cond_aa
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    goto/16 :goto_3

    .line 483
    :cond_b0
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    goto/16 :goto_3

    .line 485
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

    .line 489
    .local v16, "lastChar":C
    const/16 v23, 0x2e

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 490
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

    .line 494
    .local v9, "expPos":I
    const/16 v19, 0x0

    .line 495
    .local v19, "numDecimals":I
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v7, v0, :cond_1ae

    .line 497
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_1a2

    .line 498
    if-lt v9, v7, :cond_fe

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-le v9, v0, :cond_11b

    .line 499
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

    .line 501
    :cond_11b
    add-int/lit8 v23, v7, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 505
    .local v6, "dec":Ljava/lang/String;
    :goto_125
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    .line 506
    .local v18, "mant":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    .line 518
    :goto_133
    invoke-static/range {v16 .. v16}, Ljava/lang/Character;->isDigit(C)Z

    move-result v23

    if-nez v23, :cond_27f

    const/16 v23, 0x2e

    move/from16 v0, v16

    move/from16 v1, v23

    if-eq v0, v1, :cond_27f

    .line 519
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_1e9

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v9, v0, :cond_1e9

    .line 520
    add-int/lit8 v23, v9, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 525
    .local v8, "exp":Ljava/lang/String;
    :goto_163
    const/16 v23, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 526
    .local v20, "numeric":Ljava/lang/String;
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_1ec

    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_1ec

    const/4 v3, 0x1

    .line 527
    .local v3, "allZeros":Z
    :goto_182
    sparse-switch v16, :sswitch_data_316

    .line 573
    :goto_185
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

    .line 503
    .end local v3    # "allZeros":Z
    .end local v6    # "dec":Ljava/lang/String;
    .end local v8    # "exp":Ljava/lang/String;
    .end local v18    # "mant":Ljava/lang/String;
    .end local v20    # "numeric":Ljava/lang/String;
    :cond_1a2
    add-int/lit8 v23, v7, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "dec":Ljava/lang/String;
    goto/16 :goto_125

    .line 508
    .end local v6    # "dec":Ljava/lang/String;
    :cond_1ae
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_1e6

    .line 509
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    move/from16 v0, v23

    if-le v9, v0, :cond_1d9

    .line 510
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

    .line 512
    :cond_1d9
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    .line 516
    .restart local v18    # "mant":Ljava/lang/String;
    :goto_1e3
    const/4 v6, 0x0

    .restart local v6    # "dec":Ljava/lang/String;
    goto/16 :goto_133

    .line 514
    .end local v6    # "dec":Ljava/lang/String;
    .end local v18    # "mant":Ljava/lang/String;
    :cond_1e6
    move-object/from16 v18, p0

    .restart local v18    # "mant":Ljava/lang/String;
    goto :goto_1e3

    .line 522
    .restart local v6    # "dec":Ljava/lang/String;
    :cond_1e9
    const/4 v8, 0x0

    .restart local v8    # "exp":Ljava/lang/String;
    goto/16 :goto_163

    .line 526
    .restart local v20    # "numeric":Ljava/lang/String;
    :cond_1ec
    const/4 v3, 0x0

    goto :goto_182

    .line 530
    .restart local v3    # "allZeros":Z
    :sswitch_1ee
    if-nez v6, :cond_227

    if-nez v8, :cond_227

    const/16 v23, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v23

    const/16 v24, 0x2d

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_214

    const/16 v23, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v23

    if-nez v23, :cond_21a

    :cond_214
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_227

    .line 534
    :cond_21a
    :try_start_21a
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_21d
    .catch Ljava/lang/NumberFormatException; {:try_start_21a .. :try_end_21d} :catch_220

    move-result-object v10

    goto/16 :goto_3

    .line 535
    :catch_220
    move-exception v23

    .line 538
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 541
    :cond_227
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

    .line 545
    :sswitch_244
    :try_start_244
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v10

    .line 546
    .local v10, "f":Ljava/lang/Float;
    invoke-virtual {v10}, Ljava/lang/Float;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_25a

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F
    :try_end_251
    .catch Ljava/lang/NumberFormatException; {:try_start_244 .. :try_end_251} :catch_313

    move-result v23

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-nez v23, :cond_3

    if-nez v3, :cond_3

    .line 559
    .end local v10    # "f":Ljava/lang/Float;
    :cond_25a
    :goto_25a
    :sswitch_25a
    :try_start_25a
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    .line 560
    .local v5, "d":Ljava/lang/Double;
    invoke-virtual {v5}, Ljava/lang/Double;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_279

    invoke-virtual {v5}, Ljava/lang/Double;->floatValue()F
    :try_end_267
    .catch Ljava/lang/NumberFormatException; {:try_start_25a .. :try_end_267} :catch_278

    move-result v23

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x0

    cmpl-double v23, v23, v25

    if-nez v23, :cond_275

    if-eqz v3, :cond_279

    :cond_275
    move-object v10, v5

    .line 561
    goto/16 :goto_3

    .line 563
    .end local v5    # "d":Ljava/lang/Double;
    :catch_278
    move-exception v23

    .line 567
    :cond_279
    :try_start_279
    invoke-static/range {v20 .. v20}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    :try_end_27c
    .catch Ljava/lang/NumberFormatException; {:try_start_279 .. :try_end_27c} :catch_30e

    move-result-object v10

    goto/16 :goto_3

    .line 579
    .end local v3    # "allZeros":Z
    .end local v8    # "exp":Ljava/lang/String;
    .end local v20    # "numeric":Ljava/lang/String;
    :cond_27f
    const/16 v23, -0x1

    move/from16 v0, v23

    if-le v9, v0, :cond_2a9

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    if-ge v9, v0, :cond_2a9

    .line 580
    add-int/lit8 v23, v9, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 584
    .restart local v8    # "exp":Ljava/lang/String;
    :goto_29f
    if-nez v6, :cond_2b9

    if-nez v8, :cond_2b9

    .line 587
    :try_start_2a3
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_2a6
    .catch Ljava/lang/NumberFormatException; {:try_start_2a3 .. :try_end_2a6} :catch_2ab

    move-result-object v10

    goto/16 :goto_3

    .line 582
    .end local v8    # "exp":Ljava/lang/String;
    :cond_2a9
    const/4 v8, 0x0

    .restart local v8    # "exp":Ljava/lang/String;
    goto :goto_29f

    .line 588
    :catch_2ab
    move-exception v23

    .line 592
    :try_start_2ac
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_2af
    .catch Ljava/lang/NumberFormatException; {:try_start_2ac .. :try_end_2af} :catch_2b2

    move-result-object v10

    goto/16 :goto_3

    .line 593
    :catch_2b2
    move-exception v23

    .line 596
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v10

    goto/16 :goto_3

    .line 600
    :cond_2b9
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_305

    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_305

    const/4 v3, 0x1

    .line 602
    .restart local v3    # "allZeros":Z
    :goto_2c6
    const/16 v23, 0x7

    move/from16 v0, v19

    move/from16 v1, v23

    if-gt v0, v1, :cond_2e4

    .line 603
    :try_start_2ce
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v10

    .line 604
    .restart local v10    # "f":Ljava/lang/Float;
    invoke-virtual {v10}, Ljava/lang/Float;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_2e4

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F
    :try_end_2db
    .catch Ljava/lang/NumberFormatException; {:try_start_2ce .. :try_end_2db} :catch_311

    move-result v23

    const/16 v24, 0x0

    cmpl-float v23, v23, v24

    if-nez v23, :cond_3

    if-nez v3, :cond_3

    .line 612
    .end local v10    # "f":Ljava/lang/Float;
    :cond_2e4
    :goto_2e4
    const/16 v23, 0x10

    move/from16 v0, v19

    move/from16 v1, v23

    if-gt v0, v1, :cond_308

    .line 613
    :try_start_2ec
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    .line 614
    .restart local v5    # "d":Ljava/lang/Double;
    invoke-virtual {v5}, Ljava/lang/Double;->isInfinite()Z

    move-result v23

    if-nez v23, :cond_308

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D
    :try_end_2f9
    .catch Ljava/lang/NumberFormatException; {:try_start_2ec .. :try_end_2f9} :catch_307

    move-result-wide v23

    const-wide/16 v25, 0x0

    cmpl-double v23, v23, v25

    if-nez v23, :cond_302

    if-eqz v3, :cond_308

    :cond_302
    move-object v10, v5

    .line 615
    goto/16 :goto_3

    .line 600
    .end local v3    # "allZeros":Z
    .end local v5    # "d":Ljava/lang/Double;
    :cond_305
    const/4 v3, 0x0

    goto :goto_2c6

    .line 618
    .restart local v3    # "allZeros":Z
    :catch_307
    move-exception v23

    .line 622
    :cond_308
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v10

    goto/16 :goto_3

    .line 568
    .restart local v20    # "numeric":Ljava/lang/String;
    :catch_30e
    move-exception v23

    goto/16 :goto_185

    .line 608
    .end local v20    # "numeric":Ljava/lang/String;
    :catch_311
    move-exception v23

    goto :goto_2e4

    .line 552
    .restart local v20    # "numeric":Ljava/lang/String;
    :catch_313
    move-exception v23

    goto/16 :goto_25a

    .line 527
    :sswitch_data_316
    .sparse-switch
        0x44 -> :sswitch_25a
        0x46 -> :sswitch_244
        0x4c -> :sswitch_1ee
        0x64 -> :sswitch_25a
        0x66 -> :sswitch_244
        0x6c -> :sswitch_1ee
    .end sparse-switch
.end method

.method private static isAllZeros(Ljava/lang/String;)Z
    .registers 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 634
    if-nez p0, :cond_5

    .line 642
    :cond_4
    :goto_4
    return v1

    .line 637
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1a

    .line 638
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_17

    move v1, v2

    .line 639
    goto :goto_4

    .line 637
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 642
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

    .line 1312
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1320
    :cond_7
    :goto_7
    return v1

    .line 1315
    :cond_8
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 1316
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1315
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 1320
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

    .line 1338
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 1450
    :cond_e
    :goto_e
    return v9

    .line 1341
    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 1342
    .local v1, "chars":[C
    array-length v7, v1

    .line 1343
    .local v7, "sz":I
    const/4 v4, 0x0

    .line 1344
    .local v4, "hasExp":Z
    const/4 v3, 0x0

    .line 1345
    .local v3, "hasDecPoint":Z
    const/4 v0, 0x0

    .line 1346
    .local v0, "allowSigns":Z
    const/4 v2, 0x0

    .line 1348
    .local v2, "foundDigit":Z
    aget-char v10, v1, v9

    if-ne v10, v14, :cond_5f

    move v6, v8

    .line 1349
    .local v6, "start":I
    :goto_1d
    add-int/lit8 v10, v6, 0x1

    if-le v7, v10, :cond_81

    aget-char v10, v1, v6

    if-ne v10, v12, :cond_81

    .line 1350
    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x78

    if-eq v10, v11, :cond_35

    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x58

    if-ne v10, v11, :cond_63

    .line 1354
    :cond_35
    add-int/lit8 v5, v6, 0x2

    .line 1355
    .local v5, "i":I
    if-eq v5, v7, :cond_e

    .line 1359
    :goto_39
    array-length v10, v1

    if-ge v5, v10, :cond_61

    .line 1360
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

    .line 1359
    :cond_5c
    add-int/lit8 v5, v5, 0x1

    goto :goto_39

    .end local v5    # "i":I
    .end local v6    # "start":I
    :cond_5f
    move v6, v9

    .line 1348
    goto :goto_1d

    .restart local v5    # "i":I
    .restart local v6    # "start":I
    :cond_61
    move v9, v8

    .line 1366
    goto :goto_e

    .line 1367
    .end local v5    # "i":I
    :cond_63
    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    invoke-static {v10}, Ljava/lang/Character;->isDigit(C)Z

    move-result v10

    if-eqz v10, :cond_81

    .line 1369
    add-int/lit8 v5, v6, 0x1

    .line 1370
    .restart local v5    # "i":I
    :goto_6f
    array-length v10, v1

    if-ge v5, v10, :cond_7f

    .line 1371
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_e

    aget-char v10, v1, v5

    const/16 v11, 0x37

    if-gt v10, v11, :cond_e

    .line 1370
    add-int/lit8 v5, v5, 0x1

    goto :goto_6f

    :cond_7f
    move v9, v8

    .line 1375
    goto :goto_e

    .line 1378
    .end local v5    # "i":I
    :cond_81
    add-int/lit8 v7, v7, -0x1

    .line 1380
    move v5, v6

    .line 1383
    .restart local v5    # "i":I
    :goto_84
    if-lt v5, v7, :cond_8e

    add-int/lit8 v10, v7, 0x1

    if-ge v5, v10, :cond_c9

    if-eqz v0, :cond_c9

    if-nez v2, :cond_c9

    .line 1384
    :cond_8e
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_9b

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_9b

    .line 1385
    const/4 v2, 0x1

    .line 1386
    const/4 v0, 0x0

    .line 1414
    :goto_98
    add-int/lit8 v5, v5, 0x1

    goto :goto_84

    .line 1388
    :cond_9b
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_a7

    .line 1389
    if-nez v3, :cond_e

    if-nez v4, :cond_e

    .line 1393
    const/4 v3, 0x1

    goto :goto_98

    .line 1394
    :cond_a7
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_b3

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-ne v10, v11, :cond_ba

    .line 1396
    :cond_b3
    if-nez v4, :cond_e

    .line 1400
    if-eqz v2, :cond_e

    .line 1403
    const/4 v4, 0x1

    .line 1404
    const/4 v0, 0x1

    goto :goto_98

    .line 1405
    :cond_ba
    aget-char v10, v1, v5

    const/16 v11, 0x2b

    if-eq v10, v11, :cond_c4

    aget-char v10, v1, v5

    if-ne v10, v14, :cond_e

    .line 1406
    :cond_c4
    if-eqz v0, :cond_e

    .line 1409
    const/4 v0, 0x0

    .line 1410
    const/4 v2, 0x0

    goto :goto_98

    .line 1416
    :cond_c9
    array-length v10, v1

    if-ge v5, v10, :cond_124

    .line 1417
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_d7

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_d7

    move v9, v8

    .line 1419
    goto/16 :goto_e

    .line 1421
    :cond_d7
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_e

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-eq v10, v11, :cond_e

    .line 1425
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_f0

    .line 1426
    if-nez v3, :cond_e

    if-nez v4, :cond_e

    move v9, v2

    .line 1431
    goto/16 :goto_e

    .line 1433
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

    .line 1438
    goto/16 :goto_e

    .line 1440
    :cond_10d
    aget-char v10, v1, v5

    const/16 v11, 0x6c

    if-eq v10, v11, :cond_119

    aget-char v10, v1, v5

    const/16 v11, 0x4c

    if-ne v10, v11, :cond_e

    .line 1443
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

    .line 1450
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

.method public static max(BBB)B
    .registers 3
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1259
    if-le p1, p0, :cond_3

    .line 1260
    move p0, p1

    .line 1262
    :cond_3
    if-le p2, p0, :cond_6

    .line 1263
    move p0, p2

    .line 1265
    :cond_6
    return p0
.end method

.method public static max([B)B
    .registers 4
    .param p0, "array"    # [B

    .prologue
    .line 1007
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1010
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 1011
    .local v1, "max":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 1012
    aget-byte v2, p0, v0

    if-le v2, v1, :cond_10

    .line 1013
    aget-byte v1, p0, v0

    .line 1011
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 1017
    :cond_13
    return v1
.end method

.method public static max(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1281
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static max([D)D
    .registers 6
    .param p0, "array"    # [D

    .prologue
    .line 1031
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1034
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 1035
    .local v1, "max":D
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_14

    .line 1036
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 1037
    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    .line 1044
    .end local v1    # "max":D
    :cond_14
    return-wide v1

    .line 1039
    .restart local v1    # "max":D
    :cond_15
    aget-wide v3, p0, v0

    cmpl-double v3, v3, v1

    if-lez v3, :cond_1d

    .line 1040
    aget-wide v1, p0, v0

    .line 1035
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
    .line 1297
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static max([F)F
    .registers 4
    .param p0, "array"    # [F

    .prologue
    .line 1058
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1061
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 1062
    .local v1, "max":F
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_14

    .line 1063
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1064
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 1071
    .end local v1    # "max":F
    :cond_14
    return v1

    .line 1066
    .restart local v1    # "max":F
    :cond_15
    aget v2, p0, v0

    cmpl-float v2, v2, v1

    if-lez v2, :cond_1d

    .line 1067
    aget v1, p0, v0

    .line 1062
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
    .line 1223
    if-le p1, p0, :cond_3

    .line 1224
    move p0, p1

    .line 1226
    :cond_3
    if-le p2, p0, :cond_6

    .line 1227
    move p0, p2

    .line 1229
    :cond_6
    return p0
.end method

.method public static max([I)I
    .registers 4
    .param p0, "array"    # [I

    .prologue
    .line 961
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 964
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 965
    .local v1, "max":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 966
    aget v2, p0, v0

    if-le v2, v1, :cond_10

    .line 967
    aget v1, p0, v0

    .line 965
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 971
    :cond_13
    return v1
.end method

.method public static max(JJJ)J
    .registers 7
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1205
    cmp-long v0, p2, p0

    if-lez v0, :cond_5

    .line 1206
    move-wide p0, p2

    .line 1208
    :cond_5
    cmp-long v0, p4, p0

    if-lez v0, :cond_a

    .line 1209
    move-wide p0, p4

    .line 1211
    :cond_a
    return-wide p0
.end method

.method public static max([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    .line 938
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 941
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 942
    .local v1, "max":J
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_15

    .line 943
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-lez v3, :cond_12

    .line 944
    aget-wide v1, p0, v0

    .line 942
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 948
    :cond_15
    return-wide v1
.end method

.method public static max(SSS)S
    .registers 3
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1241
    if-le p1, p0, :cond_3

    .line 1242
    move p0, p1

    .line 1244
    :cond_3
    if-le p2, p0, :cond_6

    .line 1245
    move p0, p2

    .line 1247
    :cond_6
    return p0
.end method

.method public static max([S)S
    .registers 4
    .param p0, "array"    # [S

    .prologue
    .line 984
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 987
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 988
    .local v1, "max":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 989
    aget-short v2, p0, v0

    if-le v2, v1, :cond_10

    .line 990
    aget-short v1, p0, v0

    .line 988
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 994
    :cond_13
    return v1
.end method

.method public static min(BBB)B
    .registers 3
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1153
    if-ge p1, p0, :cond_3

    .line 1154
    move p0, p1

    .line 1156
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1157
    move p0, p2

    .line 1159
    :cond_6
    return p0
.end method

.method public static min([B)B
    .registers 4
    .param p0, "array"    # [B

    .prologue
    .line 859
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 862
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 863
    .local v1, "min":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 864
    aget-byte v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 865
    aget-byte v1, p0, v0

    .line 863
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 869
    :cond_13
    return v1
.end method

.method public static min(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1175
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static min([D)D
    .registers 6
    .param p0, "array"    # [D

    .prologue
    .line 883
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 886
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 887
    .local v1, "min":D
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_14

    .line 888
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 889
    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    .line 896
    .end local v1    # "min":D
    :cond_14
    return-wide v1

    .line 891
    .restart local v1    # "min":D
    :cond_15
    aget-wide v3, p0, v0

    cmpg-double v3, v3, v1

    if-gez v3, :cond_1d

    .line 892
    aget-wide v1, p0, v0

    .line 887
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
    .line 1191
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static min([F)F
    .registers 4
    .param p0, "array"    # [F

    .prologue
    .line 910
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 913
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 914
    .local v1, "min":F
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_14

    .line 915
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 916
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 923
    .end local v1    # "min":F
    :cond_14
    return v1

    .line 918
    .restart local v1    # "min":F
    :cond_15
    aget v2, p0, v0

    cmpg-float v2, v2, v1

    if-gez v2, :cond_1d

    .line 919
    aget v1, p0, v0

    .line 914
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
    .line 1117
    if-ge p1, p0, :cond_3

    .line 1118
    move p0, p1

    .line 1120
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1121
    move p0, p2

    .line 1123
    :cond_6
    return p0
.end method

.method public static min([I)I
    .registers 4
    .param p0, "array"    # [I

    .prologue
    .line 813
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 816
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 817
    .local v1, "min":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 818
    aget v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 819
    aget v1, p0, v0

    .line 817
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 823
    :cond_13
    return v1
.end method

.method public static min(JJJ)J
    .registers 7
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1099
    cmp-long v0, p2, p0

    if-gez v0, :cond_5

    .line 1100
    move-wide p0, p2

    .line 1102
    :cond_5
    cmp-long v0, p4, p0

    if-gez v0, :cond_a

    .line 1103
    move-wide p0, p4

    .line 1105
    :cond_a
    return-wide p0
.end method

.method public static min([J)J
    .registers 6
    .param p0, "array"    # [J

    .prologue
    .line 790
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 793
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 794
    .local v1, "min":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v3, p0

    if-ge v0, v3, :cond_15

    .line 795
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-gez v3, :cond_12

    .line 796
    aget-wide v1, p0, v0

    .line 794
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 800
    :cond_15
    return-wide v1
.end method

.method public static min(SSS)S
    .registers 3
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1135
    if-ge p1, p0, :cond_3

    .line 1136
    move p0, p1

    .line 1138
    :cond_3
    if-ge p2, p0, :cond_6

    .line 1139
    move p0, p2

    .line 1141
    :cond_6
    return p0
.end method

.method public static min([S)S
    .registers 4
    .param p0, "array"    # [S

    .prologue
    .line 836
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 839
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 840
    .local v1, "min":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    array-length v2, p0

    if-ge v0, v2, :cond_13

    .line 841
    aget-short v2, p0, v0

    if-ge v2, v1, :cond_10

    .line 842
    aget-short v1, p0, v0

    .line 840
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 846
    :cond_13
    return v1
.end method

.method public static toByte(Ljava/lang/String;)B
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 303
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
    .line 324
    if-nez p0, :cond_3

    .line 330
    .end local p1    # "defaultValue":B
    :goto_2
    return p1

    .line 328
    .restart local p1    # "defaultValue":B
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 329
    :catch_8
    move-exception v0

    .line 330
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toDouble(Ljava/lang/String;)D
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 251
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
    .line 274
    if-nez p0, :cond_3

    .line 280
    .end local p1    # "defaultValue":D
    :goto_2
    return-wide p1

    .line 278
    .restart local p1    # "defaultValue":D
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result-wide p1

    goto :goto_2

    .line 279
    :catch_8
    move-exception v0

    .line 280
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toFloat(Ljava/lang/String;)F
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 199
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
    .line 222
    if-nez p0, :cond_3

    .line 228
    .end local p1    # "defaultValue":F
    :goto_2
    return p1

    .line 226
    .restart local p1    # "defaultValue":F
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 227
    :catch_8
    move-exception v0

    .line 228
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toInt(Ljava/lang/String;)I
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 100
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
    .line 121
    if-nez p0, :cond_3

    .line 127
    .end local p1    # "defaultValue":I
    :goto_2
    return p1

    .line 125
    .restart local p1    # "defaultValue":I
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 126
    :catch_8
    move-exception v0

    .line 127
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toLong(Ljava/lang/String;)J
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 149
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
    .line 170
    if-nez p0, :cond_3

    .line 176
    .end local p1    # "defaultValue":J
    :goto_2
    return-wide p1

    .line 174
    .restart local p1    # "defaultValue":J
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result-wide p1

    goto :goto_2

    .line 175
    :catch_8
    move-exception v0

    .line 176
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method public static toShort(Ljava/lang/String;)S
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 352
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
    .line 373
    if-nez p0, :cond_3

    .line 379
    .end local p1    # "defaultValue":S
    :goto_2
    return p1

    .line 377
    .restart local p1    # "defaultValue":S
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_8

    move-result p1

    goto :goto_2

    .line 378
    :catch_8
    move-exception v0

    .line 379
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_2
.end method

.method private static validateArray(Ljava/lang/Object;)V
    .registers 3
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    .line 1081
    if-nez p0, :cond_a

    .line 1082
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1083
    :cond_a
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_18

    .line 1084
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1086
    :cond_18
    return-void
.end method
