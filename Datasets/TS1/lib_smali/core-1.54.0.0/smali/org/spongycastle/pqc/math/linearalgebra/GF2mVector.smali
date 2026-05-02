.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;
.super Lorg/spongycastle/pqc/math/linearalgebra/Vector;
.source "GF2mVector.java"


# instance fields
.field private field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

.field private vector:[I


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V
    .registers 11
    .param p1, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p2, "v"    # [B

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 32
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v5, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;)V

    iput-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 35
    const/16 v2, 0x8

    .line 36
    .local v2, "d":I
    const/4 v0, 0x1

    .line 37
    .local v0, "count":I
    :goto_d
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getDegree()I

    move-result v5

    if-le v5, v2, :cond_18

    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    add-int/lit8 v2, v2, 0x8

    goto :goto_d

    .line 43
    :cond_18
    array-length v5, p2

    rem-int/2addr v5, v0

    if-eqz v5, :cond_24

    .line 45
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Byte array is not an encoded vector over the given finite field."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 49
    :cond_24
    array-length v5, p2

    div-int/2addr v5, v0

    iput v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    .line 50
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    new-array v5, v5, [I

    iput-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    .line 51
    const/4 v0, 0x0

    .line 52
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_30
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    array-length v5, v5

    if-ge v3, v5, :cond_61

    .line 54
    const/4 v4, 0x0

    .local v4, "j":I
    move v1, v0

    .end local v0    # "count":I
    .local v1, "count":I
    :goto_37
    if-ge v4, v2, :cond_4b

    .line 56
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v6, v5, v3

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    aget-byte v7, p2, v1

    and-int/lit16 v7, v7, 0xff

    shl-int/2addr v7, v4

    or-int/2addr v6, v7

    aput v6, v5, v3

    .line 54
    add-int/lit8 v4, v4, 0x8

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_37

    .line 58
    :cond_4b
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v5, v5, v3

    invoke-virtual {p1, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->isElementOfThisField(I)Z

    move-result v5

    if-nez v5, :cond_5d

    .line 60
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Byte array is not an encoded vector over the given finite field."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 52
    :cond_5d
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_30

    .line 64
    .end local v4    # "j":I
    :cond_61
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[I)V
    .registers 6
    .param p1, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p2, "vector"    # [I

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 76
    array-length v1, p2

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    .line 77
    array-length v1, p2

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_20

    .line 79
    aget v1, p2, v0

    invoke-virtual {p1, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->isElementOfThisField(I)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 81
    new-instance v1, Ljava/lang/ArithmeticException;

    const-string v2, "Element array is not specified over the given finite field."

    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 77
    :cond_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 85
    :cond_20
    invoke-static {p2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;)V
    .registers 4
    .param p1, "other"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 95
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;)V

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 96
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    .line 97
    iget-object v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    invoke-static {v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    .line 98
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 4
    .param p1, "addend"    # Lorg/spongycastle/pqc/math/linearalgebra/Vector;

    .prologue
    .line 169
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 205
    instance-of v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;

    if-nez v2, :cond_6

    .line 216
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 209
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;

    .line 211
    .local v0, "otherVec":Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 216
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    invoke-static {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->equals([I[I)Z

    move-result v1

    goto :goto_5
.end method

.method public getEncoded()[B
    .registers 8

    .prologue
    .line 121
    const/16 v2, 0x8

    .line 122
    .local v2, "d":I
    const/4 v0, 0x1

    .line 123
    .local v0, "count":I
    :goto_3
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getDegree()I

    move-result v6

    if-le v6, v2, :cond_10

    .line 125
    add-int/lit8 v0, v0, 0x1

    .line 126
    add-int/lit8 v2, v2, 0x8

    goto :goto_3

    .line 129
    :cond_10
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    array-length v6, v6

    mul-int/2addr v6, v0

    new-array v5, v6, [B

    .line 130
    .local v5, "res":[B
    const/4 v0, 0x0

    .line 131
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    array-length v6, v6

    if-ge v3, v6, :cond_33

    .line 133
    const/4 v4, 0x0

    .local v4, "j":I
    move v1, v0

    .end local v0    # "count":I
    .local v1, "count":I
    :goto_1f
    if-ge v4, v2, :cond_2f

    .line 135
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v6, v6, v3

    ushr-int/2addr v6, v4

    int-to-byte v6, v6

    aput-byte v6, v5, v1

    .line 133
    add-int/lit8 v4, v4, 0x8

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_1f

    .line 131
    :cond_2f
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_18

    .line 139
    .end local v4    # "j":I
    :cond_33
    return-object v5
.end method

.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    return-object v0
.end method

.method public getIntArrayForm()[I
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    invoke-static {v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 224
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->hashCode()I

    move-result v0

    .line 225
    .local v0, "hash":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 226
    return v0
.end method

.method public isZero()Z
    .registers 3

    .prologue
    .line 147
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_5
    if-ltz v0, :cond_12

    .line 149
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v1, v1, v0

    if-eqz v1, :cond_f

    .line 151
    const/4 v1, 0x0

    .line 154
    :goto_e
    return v1

    .line 147
    :cond_f
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 154
    :cond_12
    const/4 v1, 0x1

    goto :goto_e
.end method

.method public multiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 7
    .param p1, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .prologue
    .line 180
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object v1

    .line 181
    .local v1, "pVec":[I
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    array-length v4, v1

    if-eq v3, v4, :cond_11

    .line 183
    new-instance v3, Ljava/lang/ArithmeticException;

    const-string v4, "permutation size and vector size mismatch"

    invoke-direct {v3, v4}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 187
    :cond_11
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->length:I

    new-array v2, v3, [I

    .line 188
    .local v2, "result":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    array-length v3, v1

    if-ge v0, v3, :cond_24

    .line 190
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v4, v1, v0

    aget v3, v3, v4

    aput v3, v2, v0

    .line 188
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 193
    :cond_24
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v3, v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[I)V

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    .line 234
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 235
    .local v1, "buf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    array-length v6, v6

    if-ge v3, v6, :cond_37

    .line 237
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_c
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getDegree()I

    move-result v6

    if-ge v4, v6, :cond_2f

    .line 239
    and-int/lit8 v5, v4, 0x1f

    .line 240
    .local v5, "r":I
    const/4 v6, 0x1

    shl-int v0, v6, v5

    .line 241
    .local v0, "bitMask":I
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;->vector:[I

    aget v6, v6, v3

    and-int v2, v6, v0

    .line 242
    .local v2, "coeff":I
    if-eqz v2, :cond_29

    .line 244
    const/16 v6, 0x31

    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 237
    :goto_26
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 248
    :cond_29
    const/16 v6, 0x30

    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_26

    .line 251
    .end local v0    # "bitMask":I
    .end local v2    # "coeff":I
    .end local v5    # "r":I
    :cond_2f
    const/16 v6, 0x20

    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 235
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 253
    .end local v4    # "j":I
    :cond_37
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
