.class public Lorg/apache/commons/lang3/math/IEEE754rUtils;
.super Ljava/lang/Object;
.source "IEEE754rUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static max(DD)D
    .registers 5
    .param p0, "a"    # D
    .param p2, "b"    # D

    .prologue
    .line 224
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 230
    .end local p2    # "b":D
    :goto_6
    return-wide p2

    .line 227
    .restart local p2    # "b":D
    :cond_7
    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_f

    move-wide p2, p0

    .line 228
    goto :goto_6

    .line 230
    :cond_f
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide p2

    goto :goto_6
.end method

.method public static max(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 211
    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static varargs max([D)D
    .registers 8
    .param p0, "array"    # [D

    .prologue
    const/4 v4, 0x0

    .line 161
    if-nez p0, :cond_b

    .line 162
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 164
    :cond_b
    array-length v3, p0

    if-eqz v3, :cond_25

    const/4 v3, 0x1

    :goto_f
    const-string v5, "Array cannot be empty."

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v3, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 167
    aget-wide v1, p0, v4

    .line 168
    .local v1, "max":D
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_19
    array-length v3, p0

    if-ge v0, v3, :cond_27

    .line 169
    aget-wide v3, p0, v0

    invoke-static {v3, v4, v1, v2}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(DD)D

    move-result-wide v1

    .line 168
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .end local v0    # "j":I
    .end local v1    # "max":D
    :cond_25
    move v3, v4

    .line 164
    goto :goto_f

    .line 172
    .restart local v0    # "j":I
    .restart local v1    # "max":D
    :cond_27
    return-wide v1
.end method

.method public static max(FF)F
    .registers 3
    .param p0, "a"    # F
    .param p1, "b"    # F

    .prologue
    .line 258
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 264
    .end local p1    # "b":F
    :goto_6
    return p1

    .line 261
    .restart local p1    # "b":F
    :cond_7
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_f

    move p1, p0

    .line 262
    goto :goto_6

    .line 264
    :cond_f
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    goto :goto_6
.end method

.method public static max(FFF)F
    .registers 4
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 245
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(FF)F

    move-result v0

    return v0
.end method

.method public static varargs max([F)F
    .registers 7
    .param p0, "array"    # [F

    .prologue
    const/4 v3, 0x0

    .line 186
    if-nez p0, :cond_b

    .line 187
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 189
    :cond_b
    array-length v2, p0

    if-eqz v2, :cond_25

    const/4 v2, 0x1

    :goto_f
    const-string v4, "Array cannot be empty."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v2, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 192
    aget v1, p0, v3

    .line 193
    .local v1, "max":F
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_19
    array-length v2, p0

    if-ge v0, v2, :cond_27

    .line 194
    aget v2, p0, v0

    invoke-static {v2, v1}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->max(FF)F

    move-result v1

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .end local v0    # "j":I
    .end local v1    # "max":F
    :cond_25
    move v2, v3

    .line 189
    goto :goto_f

    .line 197
    .restart local v0    # "j":I
    .restart local v1    # "max":F
    :cond_27
    return v1
.end method

.method public static min(DD)D
    .registers 5
    .param p0, "a"    # D
    .param p2, "b"    # D

    .prologue
    .line 106
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 112
    .end local p2    # "b":D
    :goto_6
    return-wide p2

    .line 109
    .restart local p2    # "b":D
    :cond_7
    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_f

    move-wide p2, p0

    .line 110
    goto :goto_6

    .line 112
    :cond_f
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide p2

    goto :goto_6
.end method

.method public static min(DDD)D
    .registers 8
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 93
    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static varargs min([D)D
    .registers 8
    .param p0, "array"    # [D

    .prologue
    const/4 v4, 0x0

    .line 42
    if-nez p0, :cond_b

    .line 43
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 45
    :cond_b
    array-length v3, p0

    if-eqz v3, :cond_25

    const/4 v3, 0x1

    :goto_f
    const-string v5, "Array cannot be empty."

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {v3, v5, v6}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 49
    aget-wide v1, p0, v4

    .line 50
    .local v1, "min":D
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_19
    array-length v3, p0

    if-ge v0, v3, :cond_27

    .line 51
    aget-wide v3, p0, v0

    invoke-static {v3, v4, v1, v2}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(DD)D

    move-result-wide v1

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .end local v0    # "i":I
    .end local v1    # "min":D
    :cond_25
    move v3, v4

    .line 45
    goto :goto_f

    .line 54
    .restart local v0    # "i":I
    .restart local v1    # "min":D
    :cond_27
    return-wide v1
.end method

.method public static min(FF)F
    .registers 3
    .param p0, "a"    # F
    .param p1, "b"    # F

    .prologue
    .line 140
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 146
    .end local p1    # "b":F
    :goto_6
    return p1

    .line 143
    .restart local p1    # "b":F
    :cond_7
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_f

    move p1, p0

    .line 144
    goto :goto_6

    .line 146
    :cond_f
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    goto :goto_6
.end method

.method public static min(FFF)F
    .registers 4
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 127
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(FF)F

    move-result v0

    return v0
.end method

.method public static varargs min([F)F
    .registers 7
    .param p0, "array"    # [F

    .prologue
    const/4 v3, 0x0

    .line 68
    if-nez p0, :cond_b

    .line 69
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 71
    :cond_b
    array-length v2, p0

    if-eqz v2, :cond_25

    const/4 v2, 0x1

    :goto_f
    const-string v4, "Array cannot be empty."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v2, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 74
    aget v1, p0, v3

    .line 75
    .local v1, "min":F
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_19
    array-length v2, p0

    if-ge v0, v2, :cond_27

    .line 76
    aget v2, p0, v0

    invoke-static {v2, v1}, Lorg/apache/commons/lang3/math/IEEE754rUtils;->min(FF)F

    move-result v1

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .end local v0    # "i":I
    .end local v1    # "min":F
    :cond_25
    move v2, v3

    .line 71
    goto :goto_f

    .line 79
    .restart local v0    # "i":I
    .restart local v1    # "min":F
    :cond_27
    return v1
.end method
