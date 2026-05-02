.class public Lcom/drew/lang/Rational;
.super Ljava/lang/Number;
.source "Rational.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x71654dfd870ea02L


# instance fields
.field private final _denominator:J

.field private final _numerator:J


# direct methods
.method public constructor <init>(JJ)V
    .registers 5
    .param p1, "numerator"    # J
    .param p3, "denominator"    # J

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 55
    iput-wide p1, p0, Lcom/drew/lang/Rational;->_numerator:J

    .line 56
    iput-wide p3, p0, Lcom/drew/lang/Rational;->_denominator:J

    .line 57
    return-void
.end method

.method private tooComplexForSimplification()Z
    .registers 8

    .prologue
    .line 221
    iget-wide v3, p0, Lcom/drew/lang/Rational;->_denominator:J

    iget-wide v5, p0, Lcom/drew/lang/Rational;->_numerator:J

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    const-wide/16 v5, 0x1

    sub-long/2addr v3, v5

    long-to-double v3, v3

    const-wide/high16 v5, 0x4014000000000000L    # 5.0

    div-double/2addr v3, v5

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    add-double v0, v3, v5

    .line 222
    .local v0, "maxPossibleCalculations":D
    const/16 v2, 0x3e8

    .line 223
    .local v2, "maxSimplificationCalculations":I
    const-wide v3, 0x408f400000000000L    # 1000.0

    cmpl-double v3, v0, v3

    if-lez v3, :cond_20

    const/4 v3, 0x1

    :goto_1f
    return v3

    :cond_20
    const/4 v3, 0x0

    goto :goto_1f
.end method


# virtual methods
.method public final byteValue()B
    .registers 3

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v0

    double-to-int v0, v0

    int-to-byte v0, v0

    return v0
.end method

.method public doubleValue()D
    .registers 5

    .prologue
    .line 69
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const-wide/16 v0, 0x0

    :goto_a
    return-wide v0

    :cond_b
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    long-to-double v0, v0

    iget-wide v2, p0, Lcom/drew/lang/Rational;->_denominator:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    goto :goto_a
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 237
    if-eqz p1, :cond_7

    instance-of v2, p1, Lcom/drew/lang/Rational;

    if-nez v2, :cond_8

    .line 240
    :cond_7
    :goto_7
    return v1

    :cond_8
    move-object v0, p1

    .line 239
    check-cast v0, Lcom/drew/lang/Rational;

    .line 240
    .local v0, "that":Lcom/drew/lang/Rational;
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    cmpl-double v2, v2, v4

    if-nez v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public floatValue()F
    .registers 5

    .prologue
    .line 84
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return v0

    :cond_a
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    long-to-float v0, v0

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_denominator:J

    long-to-float v1, v1

    div-float/2addr v0, v1

    goto :goto_9
.end method

.method public final getDenominator()J
    .registers 3

    .prologue
    .line 149
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_denominator:J

    return-wide v0
.end method

.method public final getNumerator()J
    .registers 3

    .prologue
    .line 155
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    return-wide v0
.end method

.method public getReciprocal()Lcom/drew/lang/Rational;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 166
    new-instance v0, Lcom/drew/lang/Rational;

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_denominator:J

    iget-wide v3, p0, Lcom/drew/lang/Rational;->_numerator:J

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/drew/lang/Rational;-><init>(JJ)V

    return-object v0
.end method

.method public getSimplifiedInstance()Lcom/drew/lang/Rational;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 282
    invoke-direct {p0}, Lcom/drew/lang/Rational;->tooComplexForSimplification()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 294
    .end local p0    # "this":Lcom/drew/lang/Rational;
    :cond_8
    :goto_8
    return-object p0

    .line 285
    .restart local p0    # "this":Lcom/drew/lang/Rational;
    :cond_9
    const/4 v0, 0x2

    .local v0, "factor":I
    :goto_a
    int-to-long v1, v0

    iget-wide v3, p0, Lcom/drew/lang/Rational;->_denominator:J

    iget-wide v5, p0, Lcom/drew/lang/Rational;->_numerator:J

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gtz v1, :cond_8

    .line 286
    rem-int/lit8 v1, v0, 0x2

    if-nez v1, :cond_1e

    const/4 v1, 0x2

    if-gt v0, v1, :cond_25

    :cond_1e
    rem-int/lit8 v1, v0, 0x5

    if-nez v1, :cond_28

    const/4 v1, 0x5

    if-le v0, v1, :cond_28

    .line 285
    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 289
    :cond_28
    iget-wide v1, p0, Lcom/drew/lang/Rational;->_denominator:J

    int-to-long v3, v0

    rem-long/2addr v1, v3

    cmp-long v1, v1, v7

    if-nez v1, :cond_25

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_numerator:J

    int-to-long v3, v0

    rem-long/2addr v1, v3

    cmp-long v1, v1, v7

    if-nez v1, :cond_25

    .line 291
    new-instance v1, Lcom/drew/lang/Rational;

    iget-wide v2, p0, Lcom/drew/lang/Rational;->_numerator:J

    int-to-long v4, v0

    div-long/2addr v2, v4

    iget-wide v4, p0, Lcom/drew/lang/Rational;->_denominator:J

    int-to-long v6, v0

    div-long/2addr v4, v6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/drew/lang/Rational;-><init>(JJ)V

    move-object p0, v1

    goto :goto_8
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 246
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_denominator:J

    long-to-int v0, v0

    mul-int/lit8 v0, v0, 0x17

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_numerator:J

    long-to-int v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final intValue()I
    .registers 3

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method

.method public isInteger()Z
    .registers 7

    .prologue
    const-wide/16 v4, 0x0

    .line 172
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_denominator:J

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_25

    iget-wide v0, p0, Lcom/drew/lang/Rational;->_denominator:J

    cmp-long v0, v0, v4

    if-eqz v0, :cond_19

    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    iget-wide v2, p0, Lcom/drew/lang/Rational;->_denominator:J

    rem-long/2addr v0, v2

    cmp-long v0, v0, v4

    if-eqz v0, :cond_25

    :cond_19
    iget-wide v0, p0, Lcom/drew/lang/Rational;->_denominator:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_27

    iget-wide v0, p0, Lcom/drew/lang/Rational;->_numerator:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_27

    :cond_25
    const/4 v0, 0x1

    :goto_26
    return v0

    :cond_27
    const/4 v0, 0x0

    goto :goto_26
.end method

.method public final longValue()J
    .registers 3

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v0

    double-to-long v0, v0

    return-wide v0
.end method

.method public final shortValue()S
    .registers 3

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v0

    double-to-int v0, v0

    int-to-short v0, v0

    return v0
.end method

.method public toSimpleString(Z)Ljava/lang/String;
    .registers 14
    .param p1, "allowDecimal"    # Z
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    const-wide/16 v10, 0x1

    const-wide/16 v8, 0x0

    .line 193
    iget-wide v4, p0, Lcom/drew/lang/Rational;->_denominator:J

    cmp-long v4, v4, v8

    if-nez v4, :cond_15

    iget-wide v4, p0, Lcom/drew/lang/Rational;->_numerator:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_15

    .line 194
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->toString()Ljava/lang/String;

    move-result-object v0

    .line 209
    :cond_14
    :goto_14
    return-object v0

    .line 195
    :cond_15
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->isInteger()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 196
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    .line 197
    :cond_24
    iget-wide v4, p0, Lcom/drew/lang/Rational;->_numerator:J

    cmp-long v4, v4, v10

    if-eqz v4, :cond_43

    iget-wide v4, p0, Lcom/drew/lang/Rational;->_denominator:J

    iget-wide v6, p0, Lcom/drew/lang/Rational;->_numerator:J

    rem-long/2addr v4, v6

    cmp-long v4, v4, v8

    if-nez v4, :cond_43

    .line 199
    iget-wide v4, p0, Lcom/drew/lang/Rational;->_denominator:J

    iget-wide v6, p0, Lcom/drew/lang/Rational;->_numerator:J

    div-long v1, v4, v6

    .line 200
    .local v1, "newDenominator":J
    new-instance v4, Lcom/drew/lang/Rational;

    invoke-direct {v4, v10, v11, v1, v2}, Lcom/drew/lang/Rational;-><init>(JJ)V

    invoke-virtual {v4, p1}, Lcom/drew/lang/Rational;->toSimpleString(Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    .line 202
    .end local v1    # "newDenominator":J
    :cond_43
    invoke-virtual {p0}, Lcom/drew/lang/Rational;->getSimplifiedInstance()Lcom/drew/lang/Rational;

    move-result-object v3

    .line 203
    .local v3, "simplifiedInstance":Lcom/drew/lang/Rational;
    if-eqz p1, :cond_58

    .line 204
    invoke-virtual {v3}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "doubleString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x5

    if-lt v4, v5, :cond_14

    .line 209
    .end local v0    # "doubleString":Ljava/lang/String;
    :cond_58
    invoke-virtual {v3}, Lcom/drew/lang/Rational;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method public toString()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_numerator:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/drew/lang/Rational;->_denominator:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
