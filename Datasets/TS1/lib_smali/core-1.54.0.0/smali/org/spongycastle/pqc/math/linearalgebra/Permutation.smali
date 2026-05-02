.class public Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
.super Ljava/lang/Object;
.source "Permutation.java"


# instance fields
.field private perm:[I


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .param p1, "n"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    if-gtz p1, :cond_d

    .line 29
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "invalid length"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 32
    :cond_d
    new-array v1, p1, [I

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    .line 33
    add-int/lit8 v0, p1, -0x1

    .local v0, "i":I
    :goto_13
    if-ltz v0, :cond_1c

    .line 35
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aput v0, v1, v0

    .line 33
    add-int/lit8 v0, v0, -0x1

    goto :goto_13

    .line 37
    :cond_1c
    return-void
.end method

.method public constructor <init>(ILjava/security/SecureRandom;)V
    .registers 9
    .param p1, "n"    # I
    .param p2, "sr"    # Ljava/security/SecureRandom;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    if-gtz p1, :cond_d

    .line 98
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "invalid length"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 101
    :cond_d
    new-array v4, p1, [I

    iput-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    .line 103
    new-array v0, p1, [I

    .line 104
    .local v0, "help":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    if-ge v1, p1, :cond_1b

    .line 106
    aput v1, v0, v1

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 109
    :cond_1b
    move v3, p1

    .line 110
    .local v3, "k":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1d
    if-ge v2, p1, :cond_32

    .line 112
    invoke-static {p2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/RandUtils;->nextInt(Ljava/security/SecureRandom;I)I

    move-result v1

    .line 113
    add-int/lit8 v3, v3, -0x1

    .line 114
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aget v5, v0, v1

    aput v5, v4, v2

    .line 115
    aget v4, v0, v3

    aput v4, v0, v1

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 117
    :cond_32
    return-void
.end method

.method public constructor <init>([B)V
    .registers 7
    .param p1, "enc"    # [B

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    array-length v3, p1

    const/4 v4, 0x4

    if-gt v3, v4, :cond_f

    .line 64
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "invalid encoding"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 67
    :cond_f
    const/4 v3, 0x0

    invoke-static {p1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    move-result v1

    .line 68
    .local v1, "n":I
    add-int/lit8 v3, v1, -0x1

    invoke-static {v3}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ceilLog256(I)I

    move-result v2

    .line 70
    .local v2, "size":I
    array-length v3, p1

    mul-int v4, v1, v2

    add-int/lit8 v4, v4, 0x4

    if-eq v3, v4, :cond_29

    .line 72
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "invalid encoding"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 75
    :cond_29
    new-array v3, v1, [I

    iput-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    .line 76
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    if-ge v0, v1, :cond_3f

    .line 78
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    mul-int v4, v0, v2

    add-int/lit8 v4, v4, 0x4

    invoke-static {p1, v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BII)I

    move-result v4

    aput v4, v3, v0

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 81
    :cond_3f
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    invoke-direct {p0, v3}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->isPermutation([I)Z

    move-result v3

    if-nez v3, :cond_4f

    .line 83
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "invalid encoding"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 86
    :cond_4f
    return-void
.end method

.method public constructor <init>([I)V
    .registers 4
    .param p1, "perm"    # [I

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->isPermutation([I)Z

    move-result v0

    if-nez v0, :cond_11

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "array is not a permutation vector"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_11
    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    .line 53
    return-void
.end method

.method private isPermutation([I)Z
    .registers 7
    .param p1, "perm"    # [I

    .prologue
    const/4 v3, 0x1

    .line 232
    array-length v1, p1

    .line 233
    .local v1, "n":I
    new-array v2, v1, [Z

    .line 235
    .local v2, "onlyOnce":[Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_16

    .line 237
    aget v4, p1, v0

    if-ltz v4, :cond_15

    aget v4, p1, v0

    if-ge v4, v1, :cond_15

    aget v4, p1, v0

    aget-boolean v4, v2, v4

    if-eqz v4, :cond_17

    .line 239
    :cond_15
    const/4 v3, 0x0

    .line 244
    :cond_16
    return v3

    .line 241
    :cond_17
    aget v4, p1, v0

    aput-boolean v3, v2, v4

    .line 235
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method


# virtual methods
.method public computeInverse()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 5

    .prologue
    .line 152
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    invoke-direct {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(I)V

    .line 153
    .local v1, "result":Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_d
    if-ltz v0, :cond_1a

    .line 155
    iget-object v2, v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aget v3, v3, v0

    aput v0, v2, v3

    .line 153
    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    .line 157
    :cond_1a
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 192
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    if-nez v1, :cond_6

    .line 194
    const/4 v1, 0x0

    .line 198
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 196
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 198
    .local v0, "otherPerm":Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    invoke-static {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->equals([I[I)Z

    move-result v1

    goto :goto_5
.end method

.method public getEncoded()[B
    .registers 7

    .prologue
    .line 126
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v1, v4

    .line 127
    .local v1, "n":I
    add-int/lit8 v4, v1, -0x1

    invoke-static {v4}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ceilLog256(I)I

    move-result v3

    .line 128
    .local v3, "size":I
    mul-int v4, v1, v3

    add-int/lit8 v4, v4, 0x4

    new-array v2, v4, [B

    .line 129
    .local v2, "result":[B
    const/4 v4, 0x0

    invoke-static {v1, v2, v4}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, v1, :cond_24

    .line 132
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aget v4, v4, v0

    mul-int v5, v0, v3

    add-int/lit8 v5, v5, 0x4

    invoke-static {v4, v2, v5, v3}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BII)V

    .line 130
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 134
    :cond_24
    return-object v2
.end method

.method public getVector()[I
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    invoke-static {v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 7
    .param p1, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .prologue
    .line 168
    iget-object v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v3, v3

    if-eq v2, v3, :cond_10

    .line 170
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "length mismatch"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 172
    :cond_10
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    invoke-direct {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(I)V

    .line 173
    .local v1, "result":Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_1d
    if-ltz v0, :cond_2e

    .line 175
    iget-object v2, v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    iget-object v4, p1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aget v4, v4, v0

    aget v3, v3, v4

    aput v3, v2, v0

    .line 173
    add-int/lit8 v0, v0, -0x1

    goto :goto_1d

    .line 177
    :cond_2e
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "result":Ljava/lang/String;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_19
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    array-length v2, v2

    if-ge v0, v2, :cond_3c

    .line 209
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->perm:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 211
    :cond_3c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 212
    return-object v1
.end method
