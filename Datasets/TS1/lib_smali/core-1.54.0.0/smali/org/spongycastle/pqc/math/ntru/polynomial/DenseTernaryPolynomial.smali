.class public Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;
.super Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
.source "DenseTernaryPolynomial.java"

# interfaces
.implements Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "N"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>(I)V

    .line 24
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->checkTernarity()V

    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V
    .registers 3
    .param p1, "intPoly"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .prologue
    .line 35
    iget-object v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    invoke-direct {p0, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;-><init>([I)V

    .line 36
    return-void
.end method

.method public constructor <init>([I)V
    .registers 2
    .param p1, "coeffs"    # [I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>([I)V

    .line 46
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->checkTernarity()V

    .line 47
    return-void
.end method

.method private checkTernarity()V
    .registers 6

    .prologue
    .line 51
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    array-length v2, v2

    if-eq v1, v2, :cond_32

    .line 53
    iget-object v2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    aget v0, v2, v1

    .line 54
    .local v0, "c":I
    const/4 v2, -0x1

    if-lt v0, v2, :cond_10

    const/4 v2, 0x1

    if-le v0, v2, :cond_2f

    .line 56
    :cond_10
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Illegal value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", must be one of {-1, 0, 1}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 51
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 59
    .end local v0    # "c":I
    :cond_32
    return-void
.end method

.method public static generateRandom(IIILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;
    .registers 6
    .param p0, "N"    # I
    .param p1, "numOnes"    # I
    .param p2, "numNegOnes"    # I
    .param p3, "random"    # Ljava/security/SecureRandom;

    .prologue
    .line 71
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/pqc/math/ntru/util/Util;->generateRandomTernary(IIILjava/security/SecureRandom;)[I

    move-result-object v0

    .line 72
    .local v0, "coeffs":[I
    new-instance v1, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;-><init>([I)V

    return-object v1
.end method

.method public static generateRandom(ILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;
    .registers 6
    .param p0, "N"    # I
    .param p1, "random"    # Ljava/security/SecureRandom;

    .prologue
    .line 82
    new-instance v1, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    invoke-direct {v1, p0}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;-><init>(I)V

    .line 83
    .local v1, "poly":Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    if-ge v0, p0, :cond_16

    .line 85
    iget-object v2, v1, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    aput v3, v2, v0

    .line 83
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 87
    :cond_16
    return-object v1
.end method


# virtual methods
.method public getNegOnes()[I
    .registers 8

    .prologue
    .line 124
    iget-object v6, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    array-length v0, v6

    .line 125
    .local v0, "N":I
    new-array v3, v0, [I

    .line 126
    .local v3, "negOnes":[I
    const/4 v4, 0x0

    .line 127
    .local v4, "negOnesIdx":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v5, v4

    .end local v4    # "negOnesIdx":I
    .local v5, "negOnesIdx":I
    :goto_8
    if-ge v2, v0, :cond_19

    .line 129
    iget-object v6, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    aget v1, v6, v2

    .line 130
    .local v1, "c":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_1e

    .line 132
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "negOnesIdx":I
    .restart local v4    # "negOnesIdx":I
    aput v2, v3, v5

    .line 127
    :goto_15
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "negOnesIdx":I
    .restart local v5    # "negOnesIdx":I
    goto :goto_8

    .line 135
    .end local v1    # "c":I
    :cond_19
    invoke-static {v3, v5}, Lorg/spongycastle/util/Arrays;->copyOf([II)[I

    move-result-object v6

    return-object v6

    .restart local v1    # "c":I
    :cond_1e
    move v4, v5

    .end local v5    # "negOnesIdx":I
    .restart local v4    # "negOnesIdx":I
    goto :goto_15
.end method

.method public getOnes()[I
    .registers 8

    .prologue
    .line 108
    iget-object v6, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    array-length v0, v6

    .line 109
    .local v0, "N":I
    new-array v3, v0, [I

    .line 110
    .local v3, "ones":[I
    const/4 v4, 0x0

    .line 111
    .local v4, "onesIdx":I
    const/4 v2, 0x0

    .local v2, "i":I
    move v5, v4

    .end local v4    # "onesIdx":I
    .local v5, "onesIdx":I
    :goto_8
    if-ge v2, v0, :cond_19

    .line 113
    iget-object v6, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    aget v1, v6, v2

    .line 114
    .local v1, "c":I
    const/4 v6, 0x1

    if-ne v1, v6, :cond_1e

    .line 116
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "onesIdx":I
    .restart local v4    # "onesIdx":I
    aput v2, v3, v5

    .line 111
    :goto_15
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "onesIdx":I
    .restart local v5    # "onesIdx":I
    goto :goto_8

    .line 119
    .end local v1    # "c":I
    :cond_19
    invoke-static {v3, v5}, Lorg/spongycastle/util/Arrays;->copyOf([II)[I

    move-result-object v6

    return-object v6

    .restart local v1    # "c":I
    :cond_1e
    move v4, v5

    .end local v5    # "onesIdx":I
    .restart local v4    # "onesIdx":I
    goto :goto_15
.end method

.method public mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .registers 6
    .param p1, "poly2"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p2, "modulus"    # I

    .prologue
    const/16 v2, 0x800

    .line 93
    if-ne p2, v2, :cond_1b

    .line 95
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 96
    .local v0, "poly2Pos":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->modPositive(I)V

    .line 97
    new-instance v1, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;

    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 98
    .local v1, "poly5":Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;
    invoke-virtual {v1, p0}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v2

    .line 102
    .end local v0    # "poly2Pos":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v1    # "poly5":Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;
    :goto_1a
    return-object v2

    :cond_1b
    invoke-super {p0, p1, p2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v2

    goto :goto_1a
.end method

.method public size()I
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->coeffs:[I

    array-length v0, v0

    return v0
.end method
