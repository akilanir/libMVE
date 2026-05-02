.class public final Lorg/spongycastle/pqc/math/linearalgebra/CharUtils;
.super Ljava/lang/Object;
.source "CharUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public static clone([C)[C
    .registers 4
    .param p0, "array"    # [C

    .prologue
    const/4 v2, 0x0

    .line 22
    array-length v1, p0

    new-array v0, v1, [C

    .line 23
    .local v0, "result":[C
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    return-object v0
.end method

.method public static equals([C[C)Z
    .registers 7
    .param p0, "left"    # [C
    .param p1, "right"    # [C

    .prologue
    const/4 v3, 0x0

    .line 86
    array-length v2, p0

    array-length v4, p1

    if-eq v2, v4, :cond_6

    .line 95
    :goto_5
    return v3

    .line 90
    :cond_6
    const/4 v1, 0x1

    .line 91
    .local v1, "result":Z
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_19

    .line 93
    aget-char v2, p0, v0

    aget-char v4, p1, v0

    if-ne v2, v4, :cond_17

    const/4 v2, 0x1

    :goto_13
    and-int/2addr v1, v2

    .line 91
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    :cond_17
    move v2, v3

    .line 93
    goto :goto_13

    :cond_19
    move v3, v1

    .line 95
    goto :goto_5
.end method

.method public static toByteArray([C)[B
    .registers 4
    .param p0, "chars"    # [C

    .prologue
    .line 35
    array-length v2, p0

    new-array v1, v2, [B

    .line 36
    .local v1, "result":[B
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_10

    .line 38
    aget-char v2, p0, v0

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 36
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 40
    :cond_10
    return-object v1
.end method

.method public static toByteArrayForPBE([C)[B
    .registers 9
    .param p0, "chars"    # [C

    .prologue
    const/4 v7, 0x0

    .line 53
    array-length v5, p0

    new-array v3, v5, [B

    .line 55
    .local v3, "out":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v5, p0

    if-ge v0, v5, :cond_10

    .line 57
    aget-char v5, p0, v0

    int-to-byte v5, v5

    aput-byte v5, v3, v0

    .line 55
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 60
    :cond_10
    array-length v5, v3

    mul-int/lit8 v2, v5, 0x2

    .line 61
    .local v2, "length":I
    add-int/lit8 v5, v2, 0x2

    new-array v4, v5, [B

    .line 63
    .local v4, "ret":[B
    const/4 v1, 0x0

    .line 64
    .local v1, "j":I
    const/4 v0, 0x0

    :goto_19
    array-length v5, v3

    if-ge v0, v5, :cond_29

    .line 66
    mul-int/lit8 v1, v0, 0x2

    .line 67
    aput-byte v7, v4, v1

    .line 68
    add-int/lit8 v5, v1, 0x1

    aget-byte v6, v3, v0

    aput-byte v6, v4, v5

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 71
    :cond_29
    aput-byte v7, v4, v2

    .line 72
    add-int/lit8 v5, v2, 0x1

    aput-byte v7, v4, v5

    .line 74
    return-object v4
.end method
