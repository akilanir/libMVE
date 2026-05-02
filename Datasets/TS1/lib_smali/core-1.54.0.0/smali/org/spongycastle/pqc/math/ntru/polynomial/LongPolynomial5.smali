.class public Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;
.super Ljava/lang/Object;
.source "LongPolynomial5.java"


# instance fields
.field private coeffs:[J

.field private numCoeffs:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V
    .registers 10
    .param p1, "p"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iget-object v3, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    array-length v3, v3

    iput v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    .line 24
    iget v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    add-int/lit8 v3, v3, 0x4

    div-int/lit8 v3, v3, 0x5

    new-array v3, v3, [J

    iput-object v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    .line 25
    const/4 v0, 0x0

    .line 26
    .local v0, "cIdx":I
    const/4 v2, 0x0

    .line 27
    .local v2, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_15
    iget v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    if-ge v1, v3, :cond_32

    .line 29
    iget-object v3, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    aget-wide v4, v3, v0

    iget-object v6, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v6, v6, v1

    int-to-long v6, v6

    shl-long/2addr v6, v2

    or-long/2addr v4, v6

    aput-wide v4, v3, v0

    .line 30
    add-int/lit8 v2, v2, 0xc

    .line 31
    const/16 v3, 0x3c

    if-lt v2, v3, :cond_2f

    .line 33
    const/4 v2, 0x0

    .line 34
    add-int/lit8 v0, v0, 0x1

    .line 27
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 37
    :cond_32
    return-void
.end method

.method private constructor <init>([JI)V
    .registers 3
    .param p1, "coeffs"    # [J
    .param p2, "numCoeffs"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    .line 42
    iput p2, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    .line 43
    return-void
.end method


# virtual methods
.method public mult(Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;
    .registers 33
    .param p1, "poly2"    # Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;

    .prologue
    .line 50
    const/16 v26, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    invoke-interface/range {p1 .. p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;->size()I

    move-result v28

    add-int/lit8 v28, v28, 0x4

    div-int/lit8 v28, v28, 0x5

    add-int v27, v27, v28

    add-int/lit8 v27, v27, -0x1

    filled-new-array/range {v26 .. v27}, [I

    move-result-object v26

    sget-object v27, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [[J

    .line 53
    .local v21, "prod":[[J
    invoke-interface/range {p1 .. p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;->getOnes()[I

    move-result-object v18

    .line 54
    .local v18, "ones":[I
    const/4 v9, 0x0

    .local v9, "idx":I
    :goto_2e
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-eq v9, v0, :cond_70

    .line 56
    aget v19, v18, v9

    .line 57
    .local v19, "pIdx":I
    div-int/lit8 v5, v19, 0x5

    .line 58
    .local v5, "cIdx":I
    mul-int/lit8 v26, v5, 0x5

    sub-int v12, v19, v26

    .line 59
    .local v12, "m":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_6d

    .line 61
    aget-object v26, v21, v12

    aget-object v27, v21, v12

    aget-wide v27, v27, v5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v29, v0

    aget-wide v29, v29, v6

    add-long v27, v27, v29

    const-wide v29, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v27, v27, v29

    aput-wide v27, v26, v5

    .line 62
    add-int/lit8 v5, v5, 0x1

    .line 59
    add-int/lit8 v6, v6, 0x1

    goto :goto_40

    .line 54
    :cond_6d
    add-int/lit8 v9, v9, 0x1

    goto :goto_2e

    .line 67
    .end local v5    # "cIdx":I
    .end local v6    # "i":I
    .end local v12    # "m":I
    .end local v19    # "pIdx":I
    :cond_70
    invoke-interface/range {p1 .. p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial;->getNegOnes()[I

    move-result-object v15

    .line 68
    .local v15, "negOnes":[I
    const/4 v9, 0x0

    :goto_75
    array-length v0, v15

    move/from16 v26, v0

    move/from16 v0, v26

    if-eq v9, v0, :cond_bc

    .line 70
    aget v19, v15, v9

    .line 71
    .restart local v19    # "pIdx":I
    div-int/lit8 v5, v19, 0x5

    .line 72
    .restart local v5    # "cIdx":I
    mul-int/lit8 v26, v5, 0x5

    sub-int v12, v19, v26

    .line 73
    .restart local v12    # "m":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_85
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v6, v0, :cond_b9

    .line 75
    aget-object v26, v21, v12

    const-wide v27, 0x800800800800800L

    aget-object v29, v21, v12

    aget-wide v29, v29, v5

    add-long v27, v27, v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v29, v0

    aget-wide v29, v29, v6

    sub-long v27, v27, v29

    const-wide v29, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v27, v27, v29

    aput-wide v27, v26, v5

    .line 76
    add-int/lit8 v5, v5, 0x1

    .line 73
    add-int/lit8 v6, v6, 0x1

    goto :goto_85

    .line 68
    :cond_b9
    add-int/lit8 v9, v9, 0x1

    goto :goto_75

    .line 81
    .end local v5    # "cIdx":I
    .end local v6    # "i":I
    .end local v12    # "m":I
    .end local v19    # "pIdx":I
    :cond_bc
    const/16 v26, 0x0

    aget-object v26, v21, v26

    const/16 v27, 0x0

    aget-object v27, v21, v27

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    invoke-static/range {v26 .. v27}, Lorg/spongycastle/util/Arrays;->copyOf([JI)[J

    move-result-object v4

    .line 82
    .local v4, "cCoeffs":[J
    const/4 v12, 0x1

    .restart local v12    # "m":I
    :goto_d0
    const/16 v26, 0x4

    move/from16 v0, v26

    if-gt v12, v0, :cond_11e

    .line 84
    mul-int/lit8 v22, v12, 0xc

    .line 85
    .local v22, "shift":I
    rsub-int/lit8 v23, v22, 0x3c

    .line 86
    .local v23, "shift60":I
    const-wide/16 v26, 0x1

    shl-long v26, v26, v23

    const-wide/16 v28, 0x1

    sub-long v13, v26, v28

    .line 87
    .local v13, "mask":J
    aget-object v26, v21, v12

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v20, v0

    .line 88
    .local v20, "pLen":I
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_ea
    move/from16 v0, v20

    if-ge v6, v0, :cond_11b

    .line 91
    aget-object v26, v21, v12

    aget-wide v26, v26, v6

    shr-long v24, v26, v23

    .line 92
    .local v24, "upper":J
    aget-object v26, v21, v12

    aget-wide v26, v26, v6

    and-long v10, v26, v13

    .line 94
    .local v10, "lower":J
    aget-wide v26, v4, v6

    shl-long v28, v10, v22

    add-long v26, v26, v28

    const-wide v28, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v26, v26, v28

    aput-wide v26, v4, v6

    .line 95
    add-int/lit8 v17, v6, 0x1

    .line 96
    .local v17, "nextIdx":I
    aget-wide v26, v4, v17

    add-long v26, v26, v24

    const-wide v28, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v26, v26, v28

    aput-wide v26, v4, v17

    .line 88
    add-int/lit8 v6, v6, 0x1

    goto :goto_ea

    .line 82
    .end local v10    # "lower":J
    .end local v17    # "nextIdx":I
    .end local v24    # "upper":J
    :cond_11b
    add-int/lit8 v12, v12, 0x1

    goto :goto_d0

    .line 101
    .end local v6    # "i":I
    .end local v13    # "mask":J
    .end local v20    # "pLen":I
    .end local v22    # "shift":I
    .end local v23    # "shift60":I
    :cond_11e
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    move/from16 v26, v0

    rem-int/lit8 v26, v26, 0x5

    mul-int/lit8 v22, v26, 0xc

    .line 102
    .restart local v22    # "shift":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    add-int/lit8 v5, v26, -0x1

    .restart local v5    # "cIdx":I
    :goto_135
    array-length v0, v4

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v5, v0, :cond_1af

    .line 106
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    add-int/lit8 v26, v26, -0x1

    move/from16 v0, v26

    if-ne v5, v0, :cond_1a2

    .line 108
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    move/from16 v26, v0

    const/16 v27, 0x5

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_19d

    const-wide/16 v7, 0x0

    .line 109
    .local v7, "iCoeff":J
    :goto_15d
    const/16 v16, 0x0

    .line 117
    .local v16, "newIdx":I
    :goto_15f
    div-int/lit8 v2, v16, 0x5

    .line 118
    .local v2, "base":I
    mul-int/lit8 v26, v2, 0x5

    sub-int v12, v16, v26

    .line 119
    mul-int/lit8 v26, v12, 0xc

    shl-long v10, v7, v26

    .line 120
    .restart local v10    # "lower":J
    rsub-int/lit8 v26, v12, 0x5

    mul-int/lit8 v26, v26, 0xc

    shr-long v24, v7, v26

    .line 121
    .restart local v24    # "upper":J
    aget-wide v26, v4, v2

    add-long v26, v26, v10

    const-wide v28, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v26, v26, v28

    aput-wide v26, v4, v2

    .line 122
    add-int/lit8 v3, v2, 0x1

    .line 123
    .local v3, "base1":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v3, v0, :cond_19a

    .line 125
    aget-wide v26, v4, v3

    add-long v26, v26, v24

    const-wide v28, 0x7ff7ff7ff7ff7ffL    # 3.726599941343702E-270

    and-long v26, v26, v28

    aput-wide v26, v4, v3

    .line 102
    :cond_19a
    add-int/lit8 v5, v5, 0x1

    goto :goto_135

    .line 108
    .end local v2    # "base":I
    .end local v3    # "base1":I
    .end local v7    # "iCoeff":J
    .end local v10    # "lower":J
    .end local v16    # "newIdx":I
    .end local v24    # "upper":J
    :cond_19d
    aget-wide v26, v4, v5

    shr-long v7, v26, v22

    goto :goto_15d

    .line 113
    :cond_1a2
    aget-wide v7, v4, v5

    .line 114
    .restart local v7    # "iCoeff":J
    mul-int/lit8 v26, v5, 0x5

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    move/from16 v27, v0

    sub-int v16, v26, v27

    .restart local v16    # "newIdx":I
    goto :goto_15f

    .line 129
    .end local v7    # "iCoeff":J
    .end local v16    # "newIdx":I
    :cond_1af
    new-instance v26, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    move/from16 v27, v0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v0, v4, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;-><init>([JI)V

    return-object v26
.end method

.method public toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .registers 9

    .prologue
    .line 134
    iget v4, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    new-array v2, v4, [I

    .line 135
    .local v2, "intCoeffs":[I
    const/4 v0, 0x0

    .line 136
    .local v0, "cIdx":I
    const/4 v3, 0x0

    .line 137
    .local v3, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    iget v4, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->numCoeffs:I

    if-ge v1, v4, :cond_22

    .line 139
    iget-object v4, p0, Lorg/spongycastle/pqc/math/ntru/polynomial/LongPolynomial5;->coeffs:[J

    aget-wide v4, v4, v0

    shr-long/2addr v4, v3

    const-wide/16 v6, 0x7ff

    and-long/2addr v4, v6

    long-to-int v4, v4

    aput v4, v2, v1

    .line 140
    add-int/lit8 v3, v3, 0xc

    .line 141
    const/16 v4, 0x3c

    if-lt v3, v4, :cond_1f

    .line 143
    const/4 v3, 0x0

    .line 144
    add-int/lit8 v0, v0, 0x1

    .line 137
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 147
    :cond_22
    new-instance v4, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-direct {v4, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>([I)V

    return-object v4
.end method
