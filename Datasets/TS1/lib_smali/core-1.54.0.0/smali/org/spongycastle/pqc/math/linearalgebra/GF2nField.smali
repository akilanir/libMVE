.class public abstract Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
.super Ljava/lang/Object;
.source "GF2nField.java"


# instance fields
.field protected fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

.field protected fields:Ljava/util/Vector;

.field protected mDegree:I

.field protected matrices:Ljava/util/Vector;

.field protected final random:Ljava/security/SecureRandom;


# direct methods
.method protected constructor <init>(Ljava/security/SecureRandom;)V
    .registers 2
    .param p1, "random"    # Ljava/security/SecureRandom;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->random:Ljava/security/SecureRandom;

    .line 46
    return-void
.end method


# virtual methods
.method protected abstract computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V
.end method

.method protected abstract computeFieldPolynomial()V
.end method

.method public final convert(Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 11
    .param p1, "elem"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .param p2, "basis"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 238
    if-ne p2, p0, :cond_9

    .line 240
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 289
    .end local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    :goto_8
    return-object v6

    .line 242
    .restart local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    :cond_9
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget-object v7, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 244
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    goto :goto_8

    .line 246
    :cond_1a
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    iget v7, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-eq v6, v7, :cond_28

    .line 248
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "GF2nField.convert: B1 has a different degree and thus cannot be coverted to!"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 254
    :cond_28
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    invoke-virtual {v6, p2}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 255
    .local v3, "i":I
    const/4 v6, -0x1

    if-ne v3, v6, :cond_3a

    .line 257
    invoke-virtual {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V

    .line 258
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    invoke-virtual {v6, p2}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 260
    :cond_3a
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->matrices:Ljava/util/Vector;

    invoke-virtual {v6, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-object v0, v6

    check-cast v0, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 262
    .local v0, "COBMatrix":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 263
    .local v2, "elemCopy":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    instance-of v6, v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    if-eqz v6, :cond_55

    move-object v6, v2

    .line 266
    check-cast v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->reverseOrder()V

    .line 268
    :cond_55
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->toFlexiBigInt()Ljava/math/BigInteger;

    move-result-object v7

    invoke-direct {v1, v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/math/BigInteger;)V

    .line 269
    .local v1, "bs":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    invoke-virtual {v1, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 270
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    invoke-direct {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 271
    .local v5, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    const/4 v3, 0x0

    :goto_6d
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-ge v3, v6, :cond_84

    .line 273
    aget-object v6, v0, v3

    invoke-virtual {v1, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->vectorMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Z

    move-result v6

    if-eqz v6, :cond_81

    .line 275
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v6, v6, -0x1

    sub-int/2addr v6, v3

    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 271
    :cond_81
    add-int/lit8 v3, v3, 0x1

    goto :goto_6d

    .line 278
    :cond_84
    instance-of v6, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    if-eqz v6, :cond_91

    .line 280
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    check-cast p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .end local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    invoke-direct {v6, p2, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    goto/16 :goto_8

    .line 283
    .restart local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    :cond_91
    instance-of v6, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    if-eqz v6, :cond_a6

    .line 285
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    check-cast p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .line 286
    .end local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->toFlexiBigInt()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct {v4, p2, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;Ljava/math/BigInteger;)V

    .line 288
    .local v4, "res":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->reverseOrder()V

    move-object v6, v4

    .line 289
    goto/16 :goto_8

    .line 293
    .end local v4    # "res":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    .restart local p2    # "basis":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    :cond_a6
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "GF2nField.convert: B1 must be an instance of GF2nPolynomialField or GF2nONBField!"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 81
    if-eqz p1, :cond_7

    instance-of v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    if-nez v2, :cond_8

    .line 106
    :cond_7
    :goto_7
    return v1

    :cond_8
    move-object v0, p1

    .line 86
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 88
    .local v0, "otherField":Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
    iget v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-ne v2, v3, :cond_7

    .line 92
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 96
    instance-of v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    if-eqz v2, :cond_23

    instance-of v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    if-eqz v2, :cond_7

    .line 101
    :cond_23
    instance-of v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    if-eqz v2, :cond_2b

    instance-of v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    if-eqz v2, :cond_7

    .line 106
    :cond_2b
    const/4 v1, 0x1

    goto :goto_7
.end method

.method public final getDegree()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    return v0
.end method

.method public final getFieldPolynomial()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .registers 3

    .prologue
    .line 65
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    if-nez v0, :cond_7

    .line 67
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->computeFieldPolynomial()V

    .line 69
    :cond_7
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    return-object v0
.end method

.method protected abstract getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 114
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected final invertMatrix([Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .registers 10
    .param p1, "matrix"    # [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .prologue
    .line 151
    array-length v6, p1

    new-array v1, v6, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 152
    .local v1, "a":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    array-length v6, p1

    new-array v4, v6, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 156
    .local v4, "inv":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-ge v3, v6, :cond_2f

    .line 160
    :try_start_b
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    aget-object v7, p1, v3

    invoke-direct {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    aput-object v6, v1, v3

    .line 161
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    invoke-direct {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    aput-object v6, v4, v3

    .line 162
    aget-object v6, v4, v3

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V
    :try_end_27
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_27} :catch_2a

    .line 156
    :goto_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 164
    :catch_2a
    move-exception v0

    .line 166
    .local v0, "BDNEExc":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_27

    .line 171
    .end local v0    # "BDNEExc":Ljava/lang/RuntimeException;
    :cond_2f
    const/4 v3, 0x0

    :goto_30
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v6, v6, -0x1

    if-ge v3, v6, :cond_90

    .line 174
    move v5, v3

    .line 175
    .local v5, "j":I
    :goto_37
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-ge v5, v6, :cond_4b

    aget-object v6, v1, v5

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    move-result v6

    if-nez v6, :cond_4b

    .line 177
    add-int/lit8 v5, v5, 0x1

    goto :goto_37

    .line 179
    :cond_4b
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-lt v5, v6, :cond_57

    .line 181
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "GF2nField.invertMatrix: Matrix cannot be inverted!"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 184
    :cond_57
    if-eq v3, v5, :cond_69

    .line 186
    aget-object v2, v1, v3

    .line 187
    .local v2, "dummy":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    aget-object v6, v1, v5

    aput-object v6, v1, v3

    .line 188
    aput-object v2, v1, v5

    .line 189
    aget-object v2, v4, v3

    .line 190
    aget-object v6, v4, v5

    aput-object v6, v4, v3

    .line 191
    aput-object v2, v4, v5

    .line 193
    .end local v2    # "dummy":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    :cond_69
    add-int/lit8 v5, v3, 0x1

    :goto_6b
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-ge v5, v6, :cond_8d

    .line 196
    aget-object v6, v1, v5

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    move-result v6

    if-eqz v6, :cond_8a

    .line 198
    aget-object v6, v1, v5

    aget-object v7, v1, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 199
    aget-object v6, v4, v5

    aget-object v7, v4, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 193
    :cond_8a
    add-int/lit8 v5, v5, 0x1

    goto :goto_6b

    .line 171
    :cond_8d
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 204
    .end local v5    # "j":I
    :cond_90
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v3, v6, -0x1

    :goto_94
    if-lez v3, :cond_bb

    .line 206
    add-int/lit8 v5, v3, -0x1

    .restart local v5    # "j":I
    :goto_98
    if-ltz v5, :cond_b8

    .line 209
    aget-object v6, v1, v5

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    move-result v6

    if-eqz v6, :cond_b5

    .line 211
    aget-object v6, v1, v5

    aget-object v7, v1, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 212
    aget-object v6, v4, v5

    aget-object v7, v4, v3

    invoke-virtual {v6, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 206
    :cond_b5
    add-int/lit8 v5, v5, -0x1

    goto :goto_98

    .line 204
    :cond_b8
    add-int/lit8 v3, v3, -0x1

    goto :goto_94

    .line 216
    .end local v5    # "j":I
    :cond_bb
    return-object v4
.end method
