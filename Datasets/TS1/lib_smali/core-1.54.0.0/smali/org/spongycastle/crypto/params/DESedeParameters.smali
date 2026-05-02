.class public Lorg/spongycastle/crypto/params/DESedeParameters;
.super Lorg/spongycastle/crypto/params/DESParameters;
.source "DESedeParameters.java"


# static fields
.field public static final DES_EDE_KEY_LENGTH:I = 0x18


# direct methods
.method public constructor <init>([B)V
    .registers 4
    .param p1, "key"    # [B

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/params/DESParameters;-><init>([B)V

    .line 16
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p1, v0, v1}, Lorg/spongycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 18
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "attempt to create weak DESede key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_13
    return-void
.end method

.method public static isReal2Key([BI)Z
    .registers 6
    .param p0, "key"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 77
    const/4 v1, 0x0

    .line 78
    .local v1, "isValid":Z
    move v0, p1

    .local v0, "i":I
    :goto_2
    add-int/lit8 v2, p1, 0x8

    if-eq v0, v2, :cond_12

    .line 80
    aget-byte v2, p0, v0

    add-int/lit8 v3, v0, 0x8

    aget-byte v3, p0, v3

    if-eq v2, v3, :cond_f

    .line 82
    const/4 v1, 0x1

    .line 78
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 86
    :cond_12
    return v1
.end method

.method public static isReal3Key([BI)Z
    .registers 10
    .param p0, "key"    # [B
    .param p1, "offset"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 97
    const/4 v0, 0x0

    .local v0, "diff12":Z
    const/4 v1, 0x0

    .local v1, "diff13":Z
    const/4 v2, 0x0

    .line 98
    .local v2, "diff23":Z
    move v3, p1

    .local v3, "i":I
    :goto_6
    add-int/lit8 v4, p1, 0x8

    if-eq v3, v4, :cond_33

    .line 100
    aget-byte v4, p0, v3

    add-int/lit8 v7, v3, 0x8

    aget-byte v7, p0, v7

    if-eq v4, v7, :cond_2d

    move v4, v5

    :goto_13
    or-int/2addr v0, v4

    .line 101
    aget-byte v4, p0, v3

    add-int/lit8 v7, v3, 0x10

    aget-byte v7, p0, v7

    if-eq v4, v7, :cond_2f

    move v4, v5

    :goto_1d
    or-int/2addr v1, v4

    .line 102
    add-int/lit8 v4, v3, 0x8

    aget-byte v4, p0, v4

    add-int/lit8 v7, v3, 0x10

    aget-byte v7, p0, v7

    if-eq v4, v7, :cond_31

    move v4, v5

    :goto_29
    or-int/2addr v2, v4

    .line 98
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_2d
    move v4, v6

    .line 100
    goto :goto_13

    :cond_2f
    move v4, v6

    .line 101
    goto :goto_1d

    :cond_31
    move v4, v6

    .line 102
    goto :goto_29

    .line 104
    :cond_33
    if-eqz v0, :cond_3a

    if-eqz v1, :cond_3a

    if-eqz v2, :cond_3a

    :goto_39
    return v5

    :cond_3a
    move v5, v6

    goto :goto_39
.end method

.method public static isRealEDEKey([BI)Z
    .registers 4
    .param p0, "key"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 66
    array-length v0, p0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_a

    invoke-static {p0, p1}, Lorg/spongycastle/crypto/params/DESedeParameters;->isReal2Key([BI)Z

    move-result v0

    :goto_9
    return v0

    :cond_a
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/params/DESedeParameters;->isReal3Key([BI)Z

    move-result v0

    goto :goto_9
.end method

.method public static isWeakKey([BI)Z
    .registers 3
    .param p0, "key"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 55
    array-length v0, p0

    sub-int/2addr v0, p1

    invoke-static {p0, p1, v0}, Lorg/spongycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    move-result v0

    return v0
.end method

.method public static isWeakKey([BII)Z
    .registers 5
    .param p0, "key"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 34
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_e

    .line 36
    invoke-static {p0, v0}, Lorg/spongycastle/crypto/params/DESParameters;->isWeakKey([BI)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 38
    const/4 v1, 0x1

    .line 42
    :goto_a
    return v1

    .line 34
    :cond_b
    add-int/lit8 v0, v0, 0x8

    goto :goto_1

    .line 42
    :cond_e
    const/4 v1, 0x0

    goto :goto_a
.end method
