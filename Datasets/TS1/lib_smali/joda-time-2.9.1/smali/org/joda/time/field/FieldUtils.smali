.class public Lorg/joda/time/field/FieldUtils;
.super Ljava/lang/Object;
.source "FieldUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 337
    if-ne p0, p1, :cond_4

    .line 338
    const/4 v0, 0x1

    .line 343
    :goto_3
    return v0

    .line 340
    :cond_4
    if-eqz p0, :cond_8

    if-nez p1, :cond_a

    .line 341
    :cond_8
    const/4 v0, 0x0

    goto :goto_3

    .line 343
    :cond_a
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public static getWrappedValue(III)I
    .registers 5

    .prologue
    .line 308
    if-lt p1, p2, :cond_a

    .line 309
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MIN > MAX"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 312
    :cond_a
    sub-int v0, p2, p1

    add-int/lit8 v0, v0, 0x1

    .line 313
    sub-int v1, p0, p1

    .line 315
    if-ltz v1, :cond_16

    .line 316
    rem-int v0, v1, v0

    add-int/2addr v0, p1

    .line 324
    :goto_15
    return v0

    .line 319
    :cond_16
    neg-int v1, v1

    rem-int/2addr v1, v0

    .line 321
    if-nez v1, :cond_1d

    .line 322
    add-int/lit8 v0, p1, 0x0

    goto :goto_15

    .line 324
    :cond_1d
    sub-int/2addr v0, v1

    add-int/2addr v0, p1

    goto :goto_15
.end method

.method public static getWrappedValue(IIII)I
    .registers 5

    .prologue
    .line 292
    add-int v0, p0, p1

    invoke-static {v0, p2, p3}, Lorg/joda/time/field/FieldUtils;->getWrappedValue(III)I

    move-result v0

    return v0
.end method

.method public static safeAdd(II)I
    .registers 5

    .prologue
    .line 64
    add-int v0, p0, p1

    .line 66
    xor-int v1, p0, v0

    if-gez v1, :cond_2d

    xor-int v1, p0, p1

    if-ltz v1, :cond_2d

    .line 67
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The calculation caused an overflow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_2d
    return v0
.end method

.method public static safeAdd(JJ)J
    .registers 10

    .prologue
    const-wide/16 v4, 0x0

    .line 82
    add-long v0, p0, p2

    .line 84
    xor-long v2, p0, v0

    cmp-long v2, v2, v4

    if-gez v2, :cond_33

    xor-long v2, p0, p2

    cmp-long v2, v2, v4

    if-ltz v2, :cond_33

    .line 85
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The calculation caused an overflow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_33
    return-wide v0
.end method

.method public static safeDivide(JJ)J
    .registers 7

    .prologue
    .line 189
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p0, v0

    if-nez v0, :cond_2f

    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-nez v0, :cond_2f

    .line 190
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Multiplication overflows a long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_2f
    div-long v0, p0, p2

    return-wide v0
.end method

.method public static safeMultiply(II)I
    .registers 6

    .prologue
    .line 119
    int-to-long v0, p0

    int-to-long v2, p1

    mul-long/2addr v0, v2

    .line 120
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_11

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_34

    .line 121
    :cond_11
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Multiplication overflows an int: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " * "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_34
    long-to-int v0, v0

    return v0
.end method

.method public static safeMultiply(JI)J
    .registers 7

    .prologue
    .line 136
    packed-switch p2, :pswitch_data_60

    .line 147
    int-to-long v0, p2

    mul-long/2addr v0, p0

    .line 148
    int-to-long v2, p2

    div-long v2, v0, v2

    cmp-long v2, v2, p0

    if-eqz v2, :cond_5d

    .line 149
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Multiplication overflows a long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " * "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :pswitch_2f
    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p0, v0

    if-nez v0, :cond_58

    .line 139
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Multiplication overflows a long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " * "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_58
    neg-long p0, p0

    .line 151
    :goto_59
    :pswitch_59
    return-wide p0

    .line 143
    :pswitch_5a
    const-wide/16 p0, 0x0

    goto :goto_59

    :cond_5d
    move-wide p0, v0

    .line 151
    goto :goto_59

    .line 136
    nop

    :pswitch_data_60
    .packed-switch -0x1
        :pswitch_2f
        :pswitch_5a
        :pswitch_59
    .end packed-switch
.end method

.method public static safeMultiply(JJ)J
    .registers 14

    .prologue
    const-wide/16 v8, 0x1

    const-wide/16 v6, -0x1

    const-wide/high16 v4, -0x8000000000000000L

    const-wide/16 v0, 0x0

    .line 163
    cmp-long v2, p2, v8

    if-nez v2, :cond_d

    .line 176
    :goto_c
    return-wide p0

    .line 166
    :cond_d
    cmp-long v2, p0, v8

    if-nez v2, :cond_13

    move-wide p0, p2

    .line 167
    goto :goto_c

    .line 169
    :cond_13
    cmp-long v2, p0, v0

    if-eqz v2, :cond_1b

    cmp-long v2, p2, v0

    if-nez v2, :cond_1d

    :cond_1b
    move-wide p0, v0

    .line 170
    goto :goto_c

    .line 172
    :cond_1d
    mul-long v0, p0, p2

    .line 173
    div-long v2, v0, p2

    cmp-long v2, v2, p0

    if-nez v2, :cond_35

    cmp-long v2, p0, v4

    if-nez v2, :cond_2d

    cmp-long v2, p2, v6

    if-eqz v2, :cond_35

    :cond_2d
    cmp-long v2, p2, v4

    if-nez v2, :cond_58

    cmp-long v2, p0, v6

    if-nez v2, :cond_58

    .line 174
    :cond_35
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Multiplication overflows a long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " * "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_58
    move-wide p0, v0

    .line 176
    goto :goto_c
.end method

.method public static safeMultiplyToInt(JJ)I
    .registers 6

    .prologue
    .line 218
    invoke-static {p0, p1, p2, p3}, Lorg/joda/time/field/FieldUtils;->safeMultiply(JJ)J

    move-result-wide v0

    .line 219
    invoke-static {v0, v1}, Lorg/joda/time/field/FieldUtils;->safeToInt(J)I

    move-result v0

    return v0
.end method

.method public static safeNegate(I)I
    .registers 3

    .prologue
    .line 49
    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_c

    .line 50
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Integer.MIN_VALUE cannot be negated"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_c
    neg-int v0, p0

    return v0
.end method

.method public static safeSubtract(JJ)J
    .registers 10

    .prologue
    const-wide/16 v4, 0x0

    .line 100
    sub-long v0, p0, p2

    .line 102
    xor-long v2, p0, v0

    cmp-long v2, v2, v4

    if-gez v2, :cond_33

    xor-long v2, p0, p2

    cmp-long v2, v2, v4

    if-gez v2, :cond_33

    .line 103
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The calculation caused an overflow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_33
    return-wide v0
.end method

.method public static safeToInt(J)I
    .registers 5

    .prologue
    .line 203
    const-wide/32 v0, -0x80000000

    cmp-long v0, v0, p0

    if-gtz v0, :cond_10

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-gtz v0, :cond_10

    .line 204
    long-to-int v0, p0

    return v0

    .line 206
    :cond_10
    new-instance v0, Ljava/lang/ArithmeticException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Value cannot fit in an int: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static verifyValueBounds(Ljava/lang/String;III)V
    .registers 8

    .prologue
    .line 268
    if-lt p1, p2, :cond_4

    if-le p1, p3, :cond_16

    .line 269
    :cond_4
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lorg/joda/time/IllegalFieldValueException;-><init>(Ljava/lang/String;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 273
    :cond_16
    return-void
.end method

.method public static verifyValueBounds(Lorg/joda/time/DateTimeField;III)V
    .registers 9

    .prologue
    .line 233
    if-lt p1, p2, :cond_4

    if-le p1, p3, :cond_1a

    .line 234
    :cond_4
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-virtual {p0}, Lorg/joda/time/DateTimeField;->getType()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 238
    :cond_1a
    return-void
.end method

.method public static verifyValueBounds(Lorg/joda/time/DateTimeFieldType;III)V
    .registers 8

    .prologue
    .line 251
    if-lt p1, p2, :cond_4

    if-le p1, p3, :cond_16

    .line 252
    :cond_4
    new-instance v0, Lorg/joda/time/IllegalFieldValueException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lorg/joda/time/IllegalFieldValueException;-><init>(Lorg/joda/time/DateTimeFieldType;Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    throw v0

    .line 256
    :cond_16
    return-void
.end method
