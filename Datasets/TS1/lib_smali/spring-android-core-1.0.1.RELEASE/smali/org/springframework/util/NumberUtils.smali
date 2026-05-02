.class public abstract Lorg/springframework/util/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertNumberToTargetClass(Ljava/lang/Number;Ljava/lang/Class;)Ljava/lang/Number;
    .registers 7
    .param p0, "number"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Number;",
            ">(",
            "Ljava/lang/Number;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v2, "Number must not be null"

    invoke-static {p0, v2}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    const-string v2, "Target class must not be null"

    invoke-static {p1, v2}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 105
    .end local p0    # "number":Ljava/lang/Number;
    :goto_10
    return-object p0

    .line 62
    .restart local p0    # "number":Ljava/lang/Number;
    :cond_11
    const-class v2, Ljava/lang/Byte;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 63
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 64
    .local v0, "value":J
    const-wide/16 v2, -0x80

    cmp-long v2, v0, v2

    if-ltz v2, :cond_29

    const-wide/16 v2, 0x7f

    cmp-long v2, v0, v2

    if-lez v2, :cond_2c

    .line 65
    :cond_29
    invoke-static {p0, p1}, Lorg/springframework/util/NumberUtils;->raiseOverflowException(Ljava/lang/Number;Ljava/lang/Class;)V

    .line 67
    :cond_2c
    new-instance v2, Ljava/lang/Byte;

    invoke-virtual {p0}, Ljava/lang/Number;->byteValue()B

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Byte;-><init>(B)V

    move-object p0, v2

    goto :goto_10

    .line 69
    .end local v0    # "value":J
    :cond_37
    const-class v2, Ljava/lang/Short;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 70
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 71
    .restart local v0    # "value":J
    const-wide/16 v2, -0x8000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_4f

    const-wide/16 v2, 0x7fff

    cmp-long v2, v0, v2

    if-lez v2, :cond_52

    .line 72
    :cond_4f
    invoke-static {p0, p1}, Lorg/springframework/util/NumberUtils;->raiseOverflowException(Ljava/lang/Number;Ljava/lang/Class;)V

    .line 74
    :cond_52
    new-instance v2, Ljava/lang/Short;

    invoke-virtual {p0}, Ljava/lang/Number;->shortValue()S

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Short;-><init>(S)V

    move-object p0, v2

    goto :goto_10

    .line 76
    .end local v0    # "value":J
    :cond_5d
    const-class v2, Ljava/lang/Integer;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 77
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 78
    .restart local v0    # "value":J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_77

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_7a

    .line 79
    :cond_77
    invoke-static {p0, p1}, Lorg/springframework/util/NumberUtils;->raiseOverflowException(Ljava/lang/Number;Ljava/lang/Class;)V

    .line 81
    :cond_7a
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    move-object p0, v2

    goto :goto_10

    .line 83
    .end local v0    # "value":J
    :cond_85
    const-class v2, Ljava/lang/Long;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_99

    .line 84
    new-instance v2, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/lang/Long;-><init>(J)V

    move-object p0, v2

    goto/16 :goto_10

    .line 86
    :cond_99
    const-class v2, Ljava/math/BigInteger;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b7

    .line 87
    instance-of v2, p0, Ljava/math/BigDecimal;

    if-eqz v2, :cond_ad

    .line 89
    check-cast p0, Ljava/math/BigDecimal;

    .end local p0    # "number":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p0

    goto/16 :goto_10

    .line 93
    .restart local p0    # "number":Ljava/lang/Number;
    :cond_ad
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p0

    goto/16 :goto_10

    .line 96
    :cond_b7
    const-class v2, Ljava/lang/Float;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cb

    .line 97
    new-instance v2, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(F)V

    move-object p0, v2

    goto/16 :goto_10

    .line 99
    :cond_cb
    const-class v2, Ljava/lang/Double;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_df

    .line 100
    new-instance v2, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/lang/Double;-><init>(D)V

    move-object p0, v2

    goto/16 :goto_10

    .line 102
    :cond_df
    const-class v2, Ljava/math/BigDecimal;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f3

    .line 105
    new-instance v2, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    move-object p0, v2

    goto/16 :goto_10

    .line 108
    :cond_f3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not convert number ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] of type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] to unknown target class ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static decodeBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .registers 7
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 239
    const/16 v2, 0xa

    .line 240
    .local v2, "radix":I
    const/4 v0, 0x0

    .line 241
    .local v0, "index":I
    const/4 v1, 0x0

    .line 244
    .local v1, "negative":Z
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 245
    const/4 v1, 0x1

    .line 246
    add-int/lit8 v0, v0, 0x1

    .line 250
    :cond_f
    const-string v4, "0x"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_1f

    const-string v4, "0X"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 251
    :cond_1f
    add-int/lit8 v0, v0, 0x2

    .line 252
    const/16 v2, 0x10

    .line 263
    :cond_23
    :goto_23
    new-instance v3, Ljava/math/BigInteger;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 264
    .local v3, "result":Ljava/math/BigInteger;
    if-eqz v1, :cond_32

    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v3

    .end local v3    # "result":Ljava/math/BigInteger;
    :cond_32
    return-object v3

    .line 254
    :cond_33
    const-string v4, "#"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 255
    add-int/lit8 v0, v0, 0x1

    .line 256
    const/16 v2, 0x10

    goto :goto_23

    .line 258
    :cond_40
    const-string v4, "0"

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v0, 0x1

    if-le v4, v5, :cond_23

    .line 259
    add-int/lit8 v0, v0, 0x1

    .line 260
    const/16 v2, 0x8

    goto :goto_23
.end method

.method private static isHexNumber(Ljava/lang/String;)Z
    .registers 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 229
    const-string v3, "-"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_25

    move v0, v1

    .line 230
    .local v0, "index":I
    :goto_b
    const-string v3, "0x"

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_23

    const-string v3, "0X"

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v3

    if-nez v3, :cond_23

    const-string v3, "#"

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_24

    :cond_23
    move v2, v1

    :cond_24
    return v2

    .end local v0    # "index":I
    :cond_25
    move v0, v2

    .line 229
    goto :goto_b
.end method

.method public static parseNumber(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Number;
    .registers 6
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Number;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v1, "Text must not be null"

    invoke-static {p0, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    const-string v1, "Target class must not be null"

    invoke-static {p1, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 146
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->trimAllWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "trimmed":Ljava/lang/String;
    const-class v1, Ljava/lang/Byte;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 149
    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->isHexNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-static {v0}, Ljava/lang/Byte;->decode(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v1

    .line 170
    :goto_20
    return-object v1

    .line 149
    :cond_21
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v1

    goto :goto_20

    .line 151
    :cond_26
    const-class v1, Ljava/lang/Short;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 152
    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->isHexNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-static {v0}, Ljava/lang/Short;->decode(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v1

    goto :goto_20

    :cond_39
    invoke-static {v0}, Ljava/lang/Short;->valueOf(Ljava/lang/String;)Ljava/lang/Short;

    move-result-object v1

    goto :goto_20

    .line 154
    :cond_3e
    const-class v1, Ljava/lang/Integer;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    .line 155
    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->isHexNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-static {v0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_20

    :cond_51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_20

    .line 157
    :cond_56
    const-class v1, Ljava/lang/Long;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6e

    .line 158
    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->isHexNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_69

    invoke-static {v0}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    goto :goto_20

    :cond_69
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    goto :goto_20

    .line 160
    :cond_6e
    const-class v1, Ljava/math/BigInteger;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 161
    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->isHexNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_81

    invoke-static {v0}, Lorg/springframework/util/NumberUtils;->decodeBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_20

    :cond_81
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto :goto_20

    .line 163
    :cond_87
    const-class v1, Ljava/lang/Float;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_94

    .line 164
    invoke-static {v0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    goto :goto_20

    .line 166
    :cond_94
    const-class v1, Ljava/lang/Double;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 167
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    goto :goto_20

    .line 169
    :cond_a1
    const-class v1, Ljava/math/BigDecimal;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b1

    const-class v1, Ljava/lang/Number;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b8

    .line 170
    :cond_b1
    new-instance v1, Ljava/math/BigDecimal;

    invoke-direct {v1, v0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto/16 :goto_20

    .line 173
    :cond_b8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot convert String ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] to target class ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static parseNumber(Ljava/lang/String;Ljava/lang/Class;Ljava/text/NumberFormat;)Ljava/lang/Number;
    .registers 11
    .param p0, "text"    # Ljava/lang/String;
    .param p2, "numberFormat"    # Ljava/text/NumberFormat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Number;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/text/NumberFormat;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v7, 0x0

    .line 194
    if-eqz p2, :cond_60

    .line 195
    const-string v4, "Text must not be null"

    invoke-static {p0, v4}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 196
    const-string v4, "Target class must not be null"

    invoke-static {p1, v4}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 197
    const/4 v0, 0x0

    .line 198
    .local v0, "decimalFormat":Ljava/text/DecimalFormat;
    const/4 v3, 0x0

    .line 199
    .local v3, "resetBigDecimal":Z
    instance-of v4, p2, Ljava/text/DecimalFormat;

    if-eqz v4, :cond_29

    move-object v0, p2

    .line 200
    check-cast v0, Ljava/text/DecimalFormat;

    .line 201
    const-class v4, Ljava/math/BigDecimal;

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->isParseBigDecimal()Z

    move-result v4

    if-nez v4, :cond_29

    .line 202
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/text/DecimalFormat;->setParseBigDecimal(Z)V

    .line 203
    const/4 v3, 0x1

    .line 207
    :cond_29
    :try_start_29
    invoke-static {p0}, Lorg/springframework/util/StringUtils;->trimAllWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v2

    .line 208
    .local v2, "number":Ljava/lang/Number;
    invoke-static {v2, p1}, Lorg/springframework/util/NumberUtils;->convertNumberToTargetClass(Ljava/lang/Number;Ljava/lang/Class;)Ljava/lang/Number;
    :try_end_34
    .catch Ljava/text/ParseException; {:try_start_29 .. :try_end_34} :catch_3b
    .catchall {:try_start_29 .. :try_end_34} :catchall_59

    move-result-object v4

    .line 214
    if-eqz v3, :cond_3a

    .line 215
    invoke-virtual {v0, v7}, Ljava/text/DecimalFormat;->setParseBigDecimal(Z)V

    .line 220
    .end local v0    # "decimalFormat":Ljava/text/DecimalFormat;
    .end local v2    # "number":Ljava/lang/Number;
    .end local v3    # "resetBigDecimal":Z
    :cond_3a
    :goto_3a
    return-object v4

    .line 210
    .restart local v0    # "decimalFormat":Ljava/text/DecimalFormat;
    .restart local v3    # "resetBigDecimal":Z
    :catch_3b
    move-exception v1

    .line 211
    .local v1, "ex":Ljava/text/ParseException;
    :try_start_3c
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not parse number: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_59
    .catchall {:try_start_3c .. :try_end_59} :catchall_59

    .line 214
    .end local v1    # "ex":Ljava/text/ParseException;
    :catchall_59
    move-exception v4

    if-eqz v3, :cond_5f

    .line 215
    invoke-virtual {v0, v7}, Ljava/text/DecimalFormat;->setParseBigDecimal(Z)V

    :cond_5f
    throw v4

    .line 220
    .end local v0    # "decimalFormat":Ljava/text/DecimalFormat;
    .end local v3    # "resetBigDecimal":Z
    :cond_60
    invoke-static {p0, p1}, Lorg/springframework/util/NumberUtils;->parseNumber(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Number;

    move-result-object v4

    goto :goto_3a
.end method

.method private static raiseOverflowException(Ljava/lang/Number;Ljava/lang/Class;)V
    .registers 5
    .param p0, "number"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Number;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not convert number ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] of type ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] to target class ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]: overflow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
