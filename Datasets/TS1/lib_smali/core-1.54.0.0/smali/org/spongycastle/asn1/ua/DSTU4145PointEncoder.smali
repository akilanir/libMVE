.class public abstract Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;
.super Ljava/lang/Object;
.source "DSTU4145PointEncoder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decodePoint(Lorg/spongycastle/math/ec/ECCurve;[B)Lorg/spongycastle/math/ec/ECPoint;
    .registers 9
    .param p0, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p1, "bytes"    # [B

    .prologue
    .line 120
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    aget-byte v5, p1, v5

    and-int/lit8 v5, v5, 0x1

    int-to-long v5, v5

    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/spongycastle/math/ec/ECCurve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v1

    .line 122
    .local v1, "k":Lorg/spongycastle/math/ec/ECFieldElement;
    new-instance v5, Ljava/math/BigInteger;

    const/4 v6, 0x1

    invoke-direct {v5, v6, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    invoke-virtual {p0, v5}, Lorg/spongycastle/math/ec/ECCurve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    .line 123
    .local v2, "xp":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-static {v2}, Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;->trace(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2c

    .line 125
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->addOne()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    .line 128
    :cond_2c
    const/4 v3, 0x0

    .line 129
    .local v3, "yp":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 131
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->sqrt()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    .line 147
    :cond_3b
    :goto_3b
    if-nez v3, :cond_7a

    .line 149
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Invalid point compression"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 135
    :cond_45
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->invert()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    .line 136
    .local v0, "beta":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-static {p0, v0}, Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;->solveQuadraticEquation(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 137
    .local v4, "z":Lorg/spongycastle/math/ec/ECFieldElement;
    if-eqz v4, :cond_3b

    .line 139
    invoke-static {v4}, Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;->trace(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_75

    .line 141
    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->addOne()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 143
    :cond_75
    invoke-virtual {v2, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    goto :goto_3b

    .line 152
    .end local v0    # "beta":Lorg/spongycastle/math/ec/ECFieldElement;
    .end local v4    # "z":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_7a
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    return-object v5
.end method

.method public static encodePoint(Lorg/spongycastle/math/ec/ECPoint;)[B
    .registers 6
    .param p0, "Q"    # Lorg/spongycastle/math/ec/ECPoint;

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->normalize()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object p0

    .line 87
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v1

    .line 89
    .local v1, "x":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->getEncoded()[B

    move-result-object v0

    .line 91
    .local v0, "bytes":[B
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 93
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/spongycastle/math/ec/ECFieldElement;->divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    .line 94
    .local v2, "z":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-static {v2}, Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;->trace(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->isOne()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 96
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-byte v4, v0, v3

    or-int/lit8 v4, v4, 0x1

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 104
    .end local v2    # "z":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_2e
    :goto_2e
    return-object v0

    .line 100
    .restart local v2    # "z":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_2f
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xfe

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    goto :goto_2e
.end method

.method private static solveQuadraticEquation(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 13
    .param p0, "curve"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p1, "beta"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 37
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 68
    .end local p1    # "beta":Lorg/spongycastle/math/ec/ECFieldElement;
    :goto_6
    return-object p1

    .line 42
    .restart local p1    # "beta":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_7
    sget-object v9, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {p0, v9}, Lorg/spongycastle/math/ec/ECCurve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v8

    .line 44
    .local v8, "zeroElement":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v7, 0x0

    .line 45
    .local v7, "z":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v0, 0x0

    .line 47
    .local v0, "gamma":Lorg/spongycastle/math/ec/ECFieldElement;
    new-instance v3, Ljava/util/Random;

    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 48
    .local v3, "rand":Ljava/util/Random;
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->getFieldSize()I

    move-result v2

    .line 51
    .local v2, "m":I
    :cond_18
    new-instance v9, Ljava/math/BigInteger;

    invoke-direct {v9, v2, v3}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    invoke-virtual {p0, v9}, Lorg/spongycastle/math/ec/ECCurve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    .line 52
    .local v4, "t":Lorg/spongycastle/math/ec/ECFieldElement;
    move-object v7, v8

    .line 53
    move-object v5, p1

    .line 54
    .local v5, "w":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_24
    add-int/lit8 v9, v2, -0x1

    if-gt v1, v9, :cond_3f

    .line 56
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    .line 57
    .local v6, "w2":Lorg/spongycastle/math/ec/ECFieldElement;
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v9

    invoke-virtual {v6, v4}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v7

    .line 58
    invoke-virtual {v6, p1}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 60
    .end local v6    # "w2":Lorg/spongycastle/math/ec/ECFieldElement;
    :cond_3f
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v9

    if-nez v9, :cond_47

    .line 62
    const/4 p1, 0x0

    goto :goto_6

    .line 64
    :cond_47
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v9

    invoke-virtual {v9, v7}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v9

    if-nez v9, :cond_18

    move-object p1, v7

    .line 68
    goto :goto_6
.end method

.method private static trace(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 4
    .param p0, "fe"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 19
    move-object v1, p0

    .line 20
    .local v1, "t":Lorg/spongycastle/math/ec/ECFieldElement;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_2
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECFieldElement;->getFieldSize()I

    move-result v2

    if-ge v0, v2, :cond_13

    .line 22
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2, p0}, Lorg/spongycastle/math/ec/ECFieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v1

    .line 20
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 24
    :cond_13
    return-object v1
.end method
