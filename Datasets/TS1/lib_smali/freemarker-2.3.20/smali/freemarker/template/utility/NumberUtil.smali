.class public Lfreemarker/template/utility/NumberUtil;
.super Ljava/lang/Object;
.source "NumberUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSignum(Ljava/lang/Number;)I
    .registers 10
    .param p0, "num"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArithmeticException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const-wide/16 v6, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 44
    instance-of v5, p0, Ljava/lang/Integer;

    if-eqz v5, :cond_19

    .line 45
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 46
    .local v0, "n":I
    if-lez v0, :cond_13

    .line 73
    .end local v0    # "n":I
    :cond_12
    :goto_12
    return v2

    .line 46
    .restart local v0    # "n":I
    :cond_13
    if-nez v0, :cond_17

    move v2, v3

    goto :goto_12

    :cond_17
    move v2, v4

    goto :goto_12

    .line 47
    .end local v0    # "n":I
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_19
    instance-of v5, p0, Ljava/math/BigDecimal;

    if-eqz v5, :cond_25

    move-object v0, p0

    .line 48
    check-cast v0, Ljava/math/BigDecimal;

    .line 49
    .local v0, "n":Ljava/math/BigDecimal;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->signum()I

    move-result v2

    goto :goto_12

    .line 50
    .end local v0    # "n":Ljava/math/BigDecimal;
    :cond_25
    instance-of v5, p0, Ljava/lang/Double;

    if-eqz v5, :cond_5e

    .line 51
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 52
    .local v0, "n":D
    cmpl-double v5, v0, v6

    if-gtz v5, :cond_12

    .line 53
    cmpl-double v2, v0, v6

    if-nez v2, :cond_39

    move v2, v3

    goto :goto_12

    .line 54
    :cond_39
    cmpg-double v2, v0, v6

    if-gez v2, :cond_3f

    move v2, v4

    goto :goto_12

    .line 55
    :cond_3f
    new-instance v2, Ljava/lang/ArithmeticException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "The signum of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not defined."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    .end local v0    # "n":D
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_5e
    instance-of v5, p0, Ljava/lang/Float;

    if-eqz v5, :cond_97

    .line 57
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 58
    .local v0, "n":F
    cmpl-float v5, v0, v8

    if-gtz v5, :cond_12

    .line 59
    cmpl-float v2, v0, v8

    if-nez v2, :cond_72

    move v2, v3

    goto :goto_12

    .line 60
    :cond_72
    cmpg-float v2, v0, v8

    if-gez v2, :cond_78

    move v2, v4

    goto :goto_12

    .line 61
    :cond_78
    new-instance v2, Ljava/lang/ArithmeticException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "The signum of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not defined."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 62
    .end local v0    # "n":F
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_97
    instance-of v5, p0, Ljava/lang/Long;

    if-eqz v5, :cond_b3

    .line 63
    check-cast p0, Ljava/lang/Long;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 64
    .local v0, "n":J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-gtz v5, :cond_12

    const-wide/16 v5, 0x0

    cmp-long v2, v0, v5

    if-nez v2, :cond_b0

    move v2, v3

    goto/16 :goto_12

    :cond_b0
    move v2, v4

    goto/16 :goto_12

    .line 65
    .end local v0    # "n":J
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_b3
    instance-of v5, p0, Ljava/lang/Short;

    if-eqz v5, :cond_c7

    .line 66
    check-cast p0, Ljava/lang/Short;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Short;->shortValue()S

    move-result v0

    .line 67
    .local v0, "n":S
    if-gtz v0, :cond_12

    if-nez v0, :cond_c4

    move v2, v3

    goto/16 :goto_12

    :cond_c4
    move v2, v4

    goto/16 :goto_12

    .line 68
    .end local v0    # "n":S
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_c7
    instance-of v5, p0, Ljava/lang/Byte;

    if-eqz v5, :cond_db

    .line 69
    check-cast p0, Ljava/lang/Byte;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    .line 70
    .local v0, "n":B
    if-gtz v0, :cond_12

    if-nez v0, :cond_d8

    move v2, v3

    goto/16 :goto_12

    :cond_d8
    move v2, v4

    goto/16 :goto_12

    .line 71
    .end local v0    # "n":B
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_db
    instance-of v2, p0, Ljava/math/BigInteger;

    if-eqz v2, :cond_e8

    move-object v0, p0

    .line 72
    check-cast v0, Ljava/math/BigInteger;

    .line 73
    .local v0, "n":Ljava/math/BigInteger;
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v2

    goto/16 :goto_12

    .line 75
    .end local v0    # "n":Ljava/math/BigInteger;
    :cond_e8
    new-instance v2, Lfreemarker/template/utility/UnsupportedNumberClassException;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/utility/UnsupportedNumberClassException;-><init>(Ljava/lang/Class;)V

    throw v2
.end method

.method public static isInfinite(Ljava/lang/Number;)Z
    .registers 3
    .param p0, "num"    # Ljava/lang/Number;

    .prologue
    .line 16
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_b

    .line 17
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    .line 21
    .restart local p0    # "num":Ljava/lang/Number;
    :goto_a
    return v0

    .line 18
    :cond_b
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_16

    .line 19
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Float;->isInfinite()Z

    move-result v0

    goto :goto_a

    .line 20
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_16
    invoke-static {p0}, Lfreemarker/template/utility/NumberUtil;->isNonFPNumberOfSupportedClass(Ljava/lang/Number;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 21
    const/4 v0, 0x0

    goto :goto_a

    .line 23
    :cond_1e
    new-instance v0, Lfreemarker/template/utility/UnsupportedNumberClassException;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/utility/UnsupportedNumberClassException;-><init>(Ljava/lang/Class;)V

    throw v0
.end method

.method public static isNaN(Ljava/lang/Number;)Z
    .registers 3
    .param p0, "num"    # Ljava/lang/Number;

    .prologue
    .line 28
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_b

    .line 29
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    .line 33
    .restart local p0    # "num":Ljava/lang/Number;
    :goto_a
    return v0

    .line 30
    :cond_b
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_16

    .line 31
    check-cast p0, Ljava/lang/Float;

    .end local p0    # "num":Ljava/lang/Number;
    invoke-virtual {p0}, Ljava/lang/Float;->isNaN()Z

    move-result v0

    goto :goto_a

    .line 32
    .restart local p0    # "num":Ljava/lang/Number;
    :cond_16
    invoke-static {p0}, Lfreemarker/template/utility/NumberUtil;->isNonFPNumberOfSupportedClass(Ljava/lang/Number;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 33
    const/4 v0, 0x0

    goto :goto_a

    .line 35
    :cond_1e
    new-instance v0, Lfreemarker/template/utility/UnsupportedNumberClassException;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/utility/UnsupportedNumberClassException;-><init>(Ljava/lang/Class;)V

    throw v0
.end method

.method private static isNonFPNumberOfSupportedClass(Ljava/lang/Number;)Z
    .registers 2
    .param p0, "num"    # Ljava/lang/Number;

    .prologue
    .line 80
    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_18

    instance-of v0, p0, Ljava/math/BigDecimal;

    if-nez v0, :cond_18

    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_18

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_18

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_18

    instance-of v0, p0, Ljava/math/BigInteger;

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method
