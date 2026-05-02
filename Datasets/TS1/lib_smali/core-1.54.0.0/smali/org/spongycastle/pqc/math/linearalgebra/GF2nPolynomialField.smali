.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;
.super Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
.source "GF2nPolynomialField.java"


# instance fields
.field private isPentanomial:Z

.field private isTrinomial:Z

.field private pc:[I

.field squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

.field private tc:I


# direct methods
.method public constructor <init>(ILjava/security/SecureRandom;)V
    .registers 5
    .param p1, "deg"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v1, 0x3

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;-><init>(Ljava/security/SecureRandom;)V

    .line 27
    iput-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    .line 30
    iput-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    .line 36
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    .line 49
    if-ge p1, v1, :cond_17

    .line 51
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "k must be at least 3"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_17
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    .line 54
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeFieldPolynomial()V

    .line 55
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeSquaringMatrix()V

    .line 56
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fields:Ljava/util/Vector;

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->matrices:Ljava/util/Vector;

    .line 58
    return-void
.end method

.method public constructor <init>(ILjava/security/SecureRandom;Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V
    .registers 11
    .param p1, "deg"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;
    .param p3, "polynomial"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x3

    .line 104
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;-><init>(Ljava/security/SecureRandom;)V

    .line 27
    iput-boolean v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    .line 30
    iput-boolean v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    .line 36
    new-array v2, v4, [I

    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    .line 106
    if-ge p1, v4, :cond_19

    .line 108
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "degree must be at least 3"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 110
    :cond_19
    invoke-virtual {p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->getLength()I

    move-result v2

    add-int/lit8 v3, p1, 0x1

    if-eq v2, v3, :cond_27

    .line 112
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    throw v2

    .line 114
    :cond_27
    invoke-virtual {p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isIrreducible()Z

    move-result v2

    if-nez v2, :cond_33

    .line 116
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    throw v2

    .line 118
    :cond_33
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    .line 120
    iput-object p3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 121
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeSquaringMatrix()V

    .line 122
    const/4 v1, 0x2

    .line 123
    .local v1, "k":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_3c
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->getLength()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_5f

    .line 125
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v2, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 127
    add-int/lit8 v1, v1, 0x1

    .line 128
    if-ne v1, v4, :cond_54

    .line 130
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->tc:I

    .line 132
    :cond_54
    if-gt v1, v6, :cond_5c

    .line 134
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    add-int/lit8 v3, v1, -0x3

    aput v0, v2, v3

    .line 123
    :cond_5c
    add-int/lit8 v0, v0, 0x1

    goto :goto_3c

    .line 138
    :cond_5f
    if-ne v1, v4, :cond_63

    .line 140
    iput-boolean v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    .line 142
    :cond_63
    if-ne v1, v6, :cond_67

    .line 144
    iput-boolean v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    .line 146
    :cond_67
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fields:Ljava/util/Vector;

    .line 147
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->matrices:Ljava/util/Vector;

    .line 148
    return-void
.end method

.method public constructor <init>(ILjava/security/SecureRandom;Z)V
    .registers 6
    .param p1, "deg"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;
    .param p3, "file"    # Z

    .prologue
    const/4 v1, 0x3

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;-><init>(Ljava/security/SecureRandom;)V

    .line 27
    iput-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    .line 30
    iput-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    .line 36
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    .line 74
    if-ge p1, v1, :cond_17

    .line 76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "k must be at least 3"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_17
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    .line 79
    if-eqz p3, :cond_30

    .line 81
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeFieldPolynomial()V

    .line 87
    :goto_1e
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeSquaringMatrix()V

    .line 88
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fields:Ljava/util/Vector;

    .line 89
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->matrices:Ljava/util/Vector;

    .line 90
    return-void

    .line 85
    :cond_30
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->computeFieldPolynomial2()V

    goto :goto_1e
.end method

.method private computeSquaringMatrix()V
    .registers 8

    .prologue
    .line 382
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v3, v3, -0x1

    new-array v0, v3, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 384
    .local v0, "d":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    new-array v3, v3, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iput-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 385
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    array-length v3, v3

    if-ge v1, v3, :cond_22

    .line 387
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    const-string v6, "ZERO"

    invoke-direct {v4, v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    aput-object v4, v3, v1

    .line 385
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 390
    :cond_22
    const/4 v1, 0x0

    :goto_23
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_43

    .line 392
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    const/4 v4, 0x1

    const-string v5, "ONE"

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 393
    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->remainder(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-result-object v3

    aput-object v3, v0, v1

    .line 390
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 395
    :cond_43
    const/4 v1, 0x1

    :goto_44
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    shr-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-gt v1, v3, :cond_75

    .line 397
    const/4 v2, 0x1

    .local v2, "j":I
    :goto_4f
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-gt v2, v3, :cond_72

    .line 399
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    shl-int/lit8 v4, v1, 0x1

    sub-int/2addr v3, v4

    aget-object v3, v0, v3

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v4, v2

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 401
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    add-int/lit8 v4, v2, -0x1

    aget-object v3, v3, v4

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 397
    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_4f

    .line 395
    :cond_72
    add-int/lit8 v1, v1, 0x1

    goto :goto_44

    .line 405
    .end local v2    # "j":I
    :cond_75
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    shr-int/lit8 v3, v3, 0x1

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/lit8 v1, v3, 0x1

    :goto_7f
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-gt v1, v3, :cond_97

    .line 407
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    shl-int/lit8 v4, v1, 0x1

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    aget-object v3, v3, v4

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 405
    add-int/lit8 v1, v1, 0x1

    goto :goto_7f

    .line 410
    :cond_97
    return-void
.end method

.method private testPentanomials()Z
    .registers 11

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 490
    const/4 v0, 0x0

    .line 491
    .local v0, "done":Z
    const/4 v5, 0x0

    .line 493
    .local v5, "l":I
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v9, v9, 0x1

    invoke-direct {v6, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    iput-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 494
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 495
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    invoke-virtual {v6, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 496
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1c
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v6, v6, -0x3

    if-gt v2, v6, :cond_9d

    if-nez v0, :cond_9d

    .line 498
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 499
    add-int/lit8 v3, v2, 0x1

    .local v3, "j":I
    :goto_2b
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v6, v6, -0x2

    if-gt v3, v6, :cond_95

    if-nez v0, :cond_95

    .line 501
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 502
    add-int/lit8 v4, v3, 0x1

    .local v4, "k":I
    :goto_3a
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v6, v6, -0x1

    if-gt v4, v6, :cond_8d

    if-nez v0, :cond_8d

    .line 504
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 505
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_7d

    move v9, v7

    :goto_4e
    and-int/lit8 v6, v2, 0x1

    if-eqz v6, :cond_7f

    move v6, v7

    :goto_53
    or-int/2addr v9, v6

    and-int/lit8 v6, v3, 0x1

    if-eqz v6, :cond_81

    move v6, v7

    :goto_59
    or-int/2addr v9, v6

    and-int/lit8 v6, v4, 0x1

    if-eqz v6, :cond_83

    move v6, v7

    :goto_5f
    or-int/2addr v6, v9

    if-eqz v6, :cond_85

    .line 508
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isIrreducible()Z

    move-result v0

    .line 509
    add-int/lit8 v5, v5, 0x1

    .line 510
    if-eqz v0, :cond_85

    .line 512
    iput-boolean v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    .line 513
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    aput v2, v6, v8

    .line 514
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    aput v3, v6, v7

    .line 515
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    const/4 v7, 0x2

    aput v4, v6, v7

    move v1, v0

    .line 526
    .end local v0    # "done":Z
    .end local v3    # "j":I
    .end local v4    # "k":I
    .local v1, "done":Z
    :goto_7c
    return v1

    .end local v1    # "done":Z
    .restart local v0    # "done":Z
    .restart local v3    # "j":I
    .restart local v4    # "k":I
    :cond_7d
    move v9, v8

    .line 505
    goto :goto_4e

    :cond_7f
    move v6, v8

    goto :goto_53

    :cond_81
    move v6, v8

    goto :goto_59

    :cond_83
    move v6, v8

    goto :goto_5f

    .line 519
    :cond_85
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->resetBit(I)V

    .line 502
    add-int/lit8 v4, v4, 0x1

    goto :goto_3a

    .line 521
    :cond_8d
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->resetBit(I)V

    .line 499
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    .line 523
    .end local v4    # "k":I
    :cond_95
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v6, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->resetBit(I)V

    .line 496
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .end local v3    # "j":I
    :cond_9d
    move v1, v0

    .line 526
    .end local v0    # "done":Z
    .restart local v1    # "done":Z
    goto :goto_7c
.end method

.method private testRandom()Z
    .registers 6

    .prologue
    .line 539
    const/4 v0, 0x0

    .line 541
    .local v0, "done":Z
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    iput-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 542
    const/4 v2, 0x0

    .line 543
    .local v2, "l":I
    :cond_d
    if-nez v0, :cond_2e

    .line 545
    add-int/lit8 v2, v2, 0x1

    .line 546
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->randomize()V

    .line 547
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 548
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 549
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isIrreducible()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 551
    const/4 v0, 0x1

    move v1, v0

    .line 556
    .end local v0    # "done":Z
    .local v1, "done":I
    :goto_2d
    return v1

    .end local v1    # "done":I
    .restart local v0    # "done":Z
    :cond_2e
    move v1, v0

    .restart local v1    # "done":I
    goto :goto_2d
.end method

.method private testTrinomials()Z
    .registers 7

    .prologue
    .line 455
    const/4 v0, 0x0

    .line 456
    .local v0, "done":Z
    const/4 v3, 0x0

    .line 458
    .local v3, "l":I
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v5, v5, 0x1

    invoke-direct {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    iput-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 459
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 460
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    invoke-virtual {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 461
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1b
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v2, v4, :cond_45

    if-nez v0, :cond_45

    .line 463
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 464
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isIrreducible()Z

    move-result v0

    .line 465
    add-int/lit8 v3, v3, 0x1

    .line 466
    if-eqz v0, :cond_37

    .line 468
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    .line 469
    iput v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->tc:I

    move v1, v0

    .line 476
    .end local v0    # "done":Z
    .local v1, "done":Z
    :goto_36
    return v1

    .line 472
    .end local v1    # "done":Z
    .restart local v0    # "done":Z
    :cond_37
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->resetBit(I)V

    .line 473
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isIrreducible()Z

    move-result v0

    .line 461
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_45
    move v1, v0

    .line 476
    .end local v0    # "done":Z
    .restart local v1    # "done":Z
    goto :goto_36
.end method


# virtual methods
.method protected computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V
    .registers 9
    .param p1, "B1"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .prologue
    .line 290
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    iget v6, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-eq v5, v6, :cond_e

    .line 292
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "GF2nPolynomialField.computeCOBMatrix: B1 has a different degree and thus cannot be coverted to!"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 296
    :cond_e
    instance-of v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    if-eqz v5, :cond_16

    .line 300
    invoke-virtual {p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V

    .line 373
    :goto_15
    return-void

    .line 306
    :cond_16
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    new-array v0, v5, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 307
    .local v0, "COBMatrix":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v2, v5, :cond_2b

    .line 309
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    invoke-direct {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    aput-object v5, v0, v2

    .line 307
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 316
    :cond_2b
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {p1, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    move-result-object v4

    .line 318
    .local v4, "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->isZero()Z

    move-result v5

    if-nez v5, :cond_2b

    .line 321
    instance-of v5, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    if-eqz v5, :cond_67

    .line 323
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    new-array v1, v5, [Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .line 324
    .local v1, "gamma":[Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v6, v5, -0x1

    move-object v5, p1

    check-cast v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    invoke-static {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->ONE(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-result-object v5

    aput-object v5, v1, v6

    .line 332
    :goto_4c
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v5, v5, -0x2

    aput-object v4, v1, v5

    .line 333
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v2, v5, -0x3

    :goto_56
    if-ltz v2, :cond_79

    .line 335
    add-int/lit8 v5, v2, 0x1

    aget-object v5, v1, v5

    invoke-virtual {v5, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->multiply(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)Lorg/spongycastle/pqc/math/linearalgebra/GFElement;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    aput-object v5, v1, v2

    .line 333
    add-int/lit8 v2, v2, -0x1

    goto :goto_56

    .line 328
    .end local v1    # "gamma":[Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    :cond_67
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    new-array v1, v5, [Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    .line 329
    .restart local v1    # "gamma":[Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v6, v5, -0x1

    move-object v5, p1

    check-cast v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .line 330
    invoke-static {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;->ONE(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    move-result-object v5

    aput-object v5, v1, v6

    goto :goto_4c

    .line 337
    :cond_79
    instance-of v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    if-eqz v5, :cond_a9

    .line 340
    const/4 v2, 0x0

    :goto_7e
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v2, v5, :cond_d0

    .line 342
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_83
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v3, v5, :cond_a6

    .line 345
    aget-object v5, v1, v2

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v6, v3

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->testBit(I)Z

    move-result v5

    if-eqz v5, :cond_a3

    .line 347
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v0, v5

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v6, v2

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 342
    :cond_a3
    add-int/lit8 v3, v3, 0x1

    goto :goto_83

    .line 340
    :cond_a6
    add-int/lit8 v2, v2, 0x1

    goto :goto_7e

    .line 355
    .end local v3    # "j":I
    :cond_a9
    const/4 v2, 0x0

    :goto_aa
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v2, v5, :cond_d0

    .line 357
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_af
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    if-ge v3, v5, :cond_cd

    .line 359
    aget-object v5, v1, v2

    invoke-virtual {v5, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->testBit(I)Z

    move-result v5

    if-eqz v5, :cond_ca

    .line 361
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v0, v5

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    sub-int/2addr v6, v2

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 357
    :cond_ca
    add-int/lit8 v3, v3, 0x1

    goto :goto_af

    .line 355
    :cond_cd
    add-int/lit8 v2, v2, 0x1

    goto :goto_aa

    .line 368
    .end local v3    # "j":I
    :cond_d0
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->fields:Ljava/util/Vector;

    invoke-virtual {v5, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 369
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->matrices:Ljava/util/Vector;

    invoke-virtual {v5, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 371
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    invoke-virtual {v5, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 372
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->matrices:Ljava/util/Vector;

    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->invertMatrix([Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_15
.end method

.method protected computeFieldPolynomial()V
    .registers 2

    .prologue
    .line 417
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testTrinomials()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 426
    :cond_6
    :goto_6
    return-void

    .line 421
    :cond_7
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testPentanomials()Z

    move-result v0

    if-nez v0, :cond_6

    .line 425
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testRandom()Z

    goto :goto_6
.end method

.method protected computeFieldPolynomial2()V
    .registers 2

    .prologue
    .line 433
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testTrinomials()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 442
    :cond_6
    :goto_6
    return-void

    .line 437
    :cond_7
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testPentanomials()Z

    move-result v0

    if-nez v0, :cond_6

    .line 441
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->testRandom()Z

    goto :goto_6
.end method

.method public getPc()[I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 197
    iget-boolean v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    if-nez v1, :cond_c

    .line 199
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1

    .line 201
    :cond_c
    new-array v0, v3, [I

    .line 202
    .local v0, "result":[I
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->pc:[I

    invoke-static {v1, v2, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 203
    return-object v0
.end method

.method protected getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 13
    .param p1, "polynomial"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .prologue
    const/4 v10, 0x1

    .line 233
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    invoke-direct {v1, p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V

    .line 234
    .local v1, "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    .line 238
    .local v2, "gDegree":I
    :goto_a
    if-le v2, v10, :cond_5a

    .line 243
    :cond_c
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->random:Ljava/security/SecureRandom;

    invoke-direct {v6, p0, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;Ljava/util/Random;)V

    .line 244
    .local v6, "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    new-instance v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    const/4 v8, 0x2

    invoke-static {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;->ZERO(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(ILorg/spongycastle/pqc/math/linearalgebra/GF2nElement;)V

    .line 246
    .local v7, "ut":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v7, v10, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->set(ILorg/spongycastle/pqc/math/linearalgebra/GF2nElement;)V

    .line 247
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    invoke-direct {v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)V

    .line 249
    .local v0, "c":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_26
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->mDegree:I

    add-int/lit8 v8, v8, -0x1

    if-gt v5, v8, :cond_37

    .line 252
    invoke-virtual {v0, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->multiplyAndReduce(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v0

    .line 253
    invoke-virtual {v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->add(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v0

    .line 249
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 256
    :cond_37
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->gcd(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v3

    .line 259
    .local v3, "h":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v4

    .line 260
    .local v4, "hDegree":I
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    .line 262
    if-eqz v4, :cond_c

    if-eq v4, v2, :cond_c

    .line 264
    shl-int/lit8 v8, v4, 0x1

    if-le v8, v2, :cond_54

    .line 266
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->quotient(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v1

    .line 273
    :goto_4f
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    goto :goto_a

    .line 271
    :cond_54
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    .end local v1    # "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-direct {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)V

    .restart local v1    # "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    goto :goto_4f

    .line 276
    .end local v0    # "c":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    .end local v3    # "h":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    .end local v4    # "hDegree":I
    .end local v5    # "i":I
    .end local v6    # "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .end local v7    # "ut":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    :cond_5a
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->at(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    move-result-object v8

    return-object v8
.end method

.method public getSquaringVector(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 215
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->squaringMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    aget-object v1, v1, p1

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    return-object v0
.end method

.method public getTc()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 181
    iget-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    if-nez v0, :cond_a

    .line 183
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 185
    :cond_a
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->tc:I

    return v0
.end method

.method public isPentanomial()Z
    .registers 2

    .prologue
    .line 169
    iget-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isPentanomial:Z

    return v0
.end method

.method public isTrinomial()Z
    .registers 2

    .prologue
    .line 158
    iget-boolean v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;->isTrinomial:Z

    return v0
.end method
