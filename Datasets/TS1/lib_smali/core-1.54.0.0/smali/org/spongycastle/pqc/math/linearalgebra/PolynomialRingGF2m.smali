.class public Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;
.super Ljava/lang/Object;
.source "PolynomialRingGF2m.java"


# instance fields
.field private field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

.field private p:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field protected sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field protected sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    .registers 3
    .param p1, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p2, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 43
    iput-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->p:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 44
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->computeSquaringMatrix()V

    .line 45
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->computeSquareRootMatrix()V

    .line 46
    return-void
.end method

.method private computeSquareRootMatrix()V
    .registers 13

    .prologue
    .line 94
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->p:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v9}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getDegree()I

    move-result v5

    .line 97
    .local v5, "numColumns":I
    new-array v7, v5, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 98
    .local v7, "tmpMatrix":[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    add-int/lit8 v2, v5, -0x1

    .local v2, "i":I
    :goto_a
    if-ltz v2, :cond_1a

    .line 100
    new-instance v9, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    aget-object v10, v10, v2

    invoke-direct {v9, v10}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    aput-object v9, v7, v2

    .line 98
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 104
    :cond_1a
    new-array v9, v5, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iput-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 105
    add-int/lit8 v2, v5, -0x1

    :goto_20
    if-ltz v2, :cond_30

    .line 107
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    new-instance v10, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v10, v11, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;I)V

    aput-object v10, v9, v2

    .line 105
    add-int/lit8 v2, v2, -0x1

    goto :goto_20

    .line 112
    :cond_30
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v5, :cond_a4

    .line 115
    aget-object v9, v7, v2

    invoke-virtual {v9, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getCoefficient(I)I

    move-result v9

    if-nez v9, :cond_5f

    .line 117
    const/4 v1, 0x0

    .line 119
    .local v1, "foundNonZero":Z
    add-int/lit8 v4, v2, 0x1

    .local v4, "j":I
    :goto_3e
    if-ge v4, v5, :cond_55

    .line 121
    aget-object v9, v7, v4

    invoke-virtual {v9, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getCoefficient(I)I

    move-result v9

    if-eqz v9, :cond_52

    .line 124
    const/4 v1, 0x1

    .line 125
    invoke-static {v7, v2, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->swapColumns([Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;II)V

    .line 126
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-static {v9, v2, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->swapColumns([Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;II)V

    .line 128
    move v4, v5

    .line 119
    :cond_52
    add-int/lit8 v4, v4, 0x1

    goto :goto_3e

    .line 133
    :cond_55
    if-nez v1, :cond_5f

    .line 136
    new-instance v9, Ljava/lang/ArithmeticException;

    const-string v10, "Squaring matrix is not invertible."

    invoke-direct {v9, v10}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 142
    .end local v1    # "foundNonZero":Z
    .end local v4    # "j":I
    :cond_5f
    aget-object v9, v7, v2

    invoke-virtual {v9, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getCoefficient(I)I

    move-result v0

    .line 143
    .local v0, "coef":I
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v9, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->inverse(I)I

    move-result v3

    .line 144
    .local v3, "invCoef":I
    aget-object v9, v7, v2

    invoke-virtual {v9, v3}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->multThisWithElement(I)V

    .line 145
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    aget-object v9, v9, v2

    invoke-virtual {v9, v3}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->multThisWithElement(I)V

    .line 148
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_78
    if-ge v4, v5, :cond_a1

    .line 150
    if-eq v4, v2, :cond_9e

    .line 152
    aget-object v9, v7, v4

    invoke-virtual {v9, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getCoefficient(I)I

    move-result v0

    .line 153
    if-eqz v0, :cond_9e

    .line 155
    aget-object v9, v7, v2

    .line 156
    invoke-virtual {v9, v0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->multWithElement(I)Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v8

    .line 157
    .local v8, "tmpSqColumn":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    aget-object v9, v9, v2

    .line 158
    invoke-virtual {v9, v0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->multWithElement(I)Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v6

    .line 159
    .local v6, "tmpInvColumn":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    aget-object v9, v7, v4

    invoke-virtual {v9, v8}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    .line 160
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    aget-object v9, v9, v4

    invoke-virtual {v9, v6}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    .line 148
    .end local v6    # "tmpInvColumn":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .end local v8    # "tmpSqColumn":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    :cond_9e
    add-int/lit8 v4, v4, 0x1

    goto :goto_78

    .line 112
    :cond_a1
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 165
    .end local v0    # "coef":I
    .end local v3    # "invCoef":I
    .end local v4    # "j":I
    :cond_a4
    return-void
.end method

.method private computeSquaringMatrix()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    .line 70
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->p:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getDegree()I

    move-result v3

    .line 71
    .local v3, "numColumns":I
    new-array v4, v3, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iput-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    shr-int/lit8 v4, v3, 0x1

    if-ge v0, v4, :cond_28

    .line 74
    shl-int/lit8 v4, v0, 0x1

    add-int/lit8 v4, v4, 0x1

    new-array v1, v4, [I

    .line 75
    .local v1, "monomCoeffs":[I
    shl-int/lit8 v4, v0, 0x1

    aput v7, v1, v4

    .line 76
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v5, v6, v1}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[I)V

    aput-object v5, v4, v0

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 78
    .end local v1    # "monomCoeffs":[I
    :cond_28
    shr-int/lit8 v0, v3, 0x1

    :goto_2a
    if-ge v0, v3, :cond_4a

    .line 80
    shl-int/lit8 v4, v0, 0x1

    add-int/lit8 v4, v4, 0x1

    new-array v1, v4, [I

    .line 81
    .restart local v1    # "monomCoeffs":[I
    shl-int/lit8 v4, v0, 0x1

    aput v7, v1, v4

    .line 82
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v2, v4, v1}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[I)V

    .line 84
    .local v2, "monomial":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->p:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v2, v5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->mod(Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v5

    aput-object v5, v4, v0

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 86
    .end local v1    # "monomCoeffs":[I
    .end local v2    # "monomial":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    :cond_4a
    return-void
.end method

.method private static swapColumns([Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;II)V
    .registers 5
    .param p0, "matrix"    # [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p1, "first"    # I
    .param p2, "second"    # I

    .prologue
    .line 170
    aget-object v0, p0, p1

    .line 171
    .local v0, "tmp":Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    aget-object v1, p0, p2

    aput-object v1, p0, p1

    .line 172
    aput-object v0, p0, p2

    .line 173
    return-void
.end method


# virtual methods
.method public getSquareRootMatrix()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqRootMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getSquaringMatrix()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2m;->sqMatrix:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method
