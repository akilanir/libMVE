.class Lorg/spongycastle/math/ec/Tnaf;
.super Ljava/lang/Object;
.source "Tnaf.java"


# static fields
.field private static final MINUS_ONE:Ljava/math/BigInteger;

.field private static final MINUS_THREE:Ljava/math/BigInteger;

.field private static final MINUS_TWO:Ljava/math/BigInteger;

.field public static final POW_2_WIDTH:B = 0x10t

.field public static final WIDTH:B = 0x4t

.field public static final alpha0:[Lorg/spongycastle/math/ec/ZTauElement;

.field public static final alpha0Tnaf:[[B

.field public static final alpha1:[Lorg/spongycastle/math/ec/ZTauElement;

.field public static final alpha1Tnaf:[[B


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x0

    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 14
    sget-object v0, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    .line 15
    sget-object v0, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->MINUS_TWO:Ljava/math/BigInteger;

    .line 16
    sget-object v0, Lorg/spongycastle/math/ec/ECConstants;->THREE:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->MINUS_THREE:Ljava/math/BigInteger;

    .line 39
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/spongycastle/math/ec/ZTauElement;

    aput-object v5, v0, v8

    new-instance v1, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v2, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v1, v0, v6

    const/4 v1, 0x2

    aput-object v5, v0, v1

    new-instance v1, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v2, Lorg/spongycastle/math/ec/Tnaf;->MINUS_THREE:Ljava/math/BigInteger;

    sget-object v3, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v1, v0, v7

    aput-object v5, v0, v9

    const/4 v1, 0x5

    new-instance v2, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v3, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    sget-object v4, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    aput-object v5, v0, v1

    const/4 v1, 0x7

    new-instance v2, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    sget-object v4, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v2, v0, v1

    const/16 v1, 0x8

    aput-object v5, v0, v1

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha0:[Lorg/spongycastle/math/ec/ZTauElement;

    .line 51
    const/16 v0, 0x8

    new-array v0, v0, [[B

    aput-object v5, v0, v8

    new-array v1, v6, [B

    aput-byte v6, v1, v8

    aput-object v1, v0, v6

    const/4 v1, 0x2

    aput-object v5, v0, v1

    new-array v1, v7, [B

    fill-array-data v1, :array_fc

    aput-object v1, v0, v7

    aput-object v5, v0, v9

    const/4 v1, 0x5

    new-array v2, v7, [B

    fill-array-data v2, :array_102

    aput-object v2, v0, v1

    const/4 v1, 0x6

    aput-object v5, v0, v1

    const/4 v1, 0x7

    new-array v2, v9, [B

    fill-array-data v2, :array_108

    aput-object v2, v0, v1

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha0Tnaf:[[B

    .line 59
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/spongycastle/math/ec/ZTauElement;

    aput-object v5, v0, v8

    new-instance v1, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v2, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v1, v0, v6

    const/4 v1, 0x2

    aput-object v5, v0, v1

    new-instance v1, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v2, Lorg/spongycastle/math/ec/Tnaf;->MINUS_THREE:Ljava/math/BigInteger;

    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v1, v0, v7

    aput-object v5, v0, v9

    const/4 v1, 0x5

    new-instance v2, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v3, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    sget-object v4, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    aput-object v5, v0, v1

    const/4 v1, 0x7

    new-instance v2, Lorg/spongycastle/math/ec/ZTauElement;

    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    sget-object v4, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    aput-object v2, v0, v1

    const/16 v1, 0x8

    aput-object v5, v0, v1

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha1:[Lorg/spongycastle/math/ec/ZTauElement;

    .line 70
    const/16 v0, 0x8

    new-array v0, v0, [[B

    aput-object v5, v0, v8

    new-array v1, v6, [B

    aput-byte v6, v1, v8

    aput-object v1, v0, v6

    const/4 v1, 0x2

    aput-object v5, v0, v1

    new-array v1, v7, [B

    fill-array-data v1, :array_10e

    aput-object v1, v0, v7

    aput-object v5, v0, v9

    const/4 v1, 0x5

    new-array v2, v7, [B

    fill-array-data v2, :array_114

    aput-object v2, v0, v1

    const/4 v1, 0x6

    aput-object v5, v0, v1

    const/4 v1, 0x7

    new-array v2, v9, [B

    fill-array-data v2, :array_11a

    aput-object v2, v0, v1

    sput-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha1Tnaf:[[B

    return-void

    .line 51
    :array_fc
    .array-data 1
        -0x1t
        0x0t
        0x1t
    .end array-data

    :array_102
    .array-data 1
        0x1t
        0x0t
        0x1t
    .end array-data

    :array_108
    .array-data 1
        -0x1t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 70
    :array_10e
    .array-data 1
        -0x1t
        0x0t
        0x1t
    .end array-data

    :array_114
    .array-data 1
        0x1t
        0x0t
        0x1t
    .end array-data

    :array_11a
    .array-data 1
        -0x1t
        0x0t
        0x0t
        -0x1t
    .end array-data
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static approximateDivisionByN(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;BII)Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .registers 14
    .param p0, "k"    # Ljava/math/BigInteger;
    .param p1, "s"    # Ljava/math/BigInteger;
    .param p2, "vm"    # Ljava/math/BigInteger;
    .param p3, "a"    # B
    .param p4, "m"    # I
    .param p5, "c"    # I

    .prologue
    .line 286
    add-int/lit8 v7, p4, 0x5

    div-int/lit8 v7, v7, 0x2

    add-int v0, v7, p5

    .line 287
    .local v0, "_k":I
    sub-int v7, p4, v0

    add-int/lit8 v7, v7, -0x2

    add-int/2addr v7, p3

    invoke-virtual {p0, v7}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v6

    .line 289
    .local v6, "ns":Ljava/math/BigInteger;
    invoke-virtual {p1, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 291
    .local v1, "gs":Ljava/math/BigInteger;
    invoke-virtual {v1, p4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 293
    .local v3, "hs":Ljava/math/BigInteger;
    invoke-virtual {p2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 295
    .local v4, "js":Ljava/math/BigInteger;
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 296
    .local v2, "gsPlusJs":Ljava/math/BigInteger;
    sub-int v7, v0, p5

    invoke-virtual {v2, v7}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v5

    .line 297
    .local v5, "ls":Ljava/math/BigInteger;
    sub-int v7, v0, p5

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v2, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 300
    sget-object v7, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v5, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 303
    :cond_35
    new-instance v7, Lorg/spongycastle/math/ec/SimpleBigDecimal;

    invoke-direct {v7, v5, p5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;-><init>(Ljava/math/BigInteger;I)V

    return-object v7
.end method

.method public static getLucas(BIZ)[Ljava/math/BigInteger;
    .registers 12
    .param p0, "mu"    # B
    .param p1, "k"    # I
    .param p2, "doV"    # Z

    .prologue
    const/4 v8, 0x1

    .line 449
    if-eq p0, v8, :cond_e

    const/4 v6, -0x1

    if-eq p0, v6, :cond_e

    .line 451
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "mu must be 1 or -1"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 458
    :cond_e
    if-eqz p2, :cond_2b

    .line 460
    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    .line 461
    .local v3, "u0":Ljava/math/BigInteger;
    int-to-long v6, p0

    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    .line 469
    .local v4, "u1":Ljava/math/BigInteger;
    :goto_17
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_18
    if-ge v0, p1, :cond_35

    .line 472
    const/4 v2, 0x0

    .line 473
    .local v2, "s":Ljava/math/BigInteger;
    if-ne p0, v8, :cond_30

    .line 475
    move-object v2, v4

    .line 483
    :goto_1e
    invoke-virtual {v3, v8}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 484
    .local v5, "u2":Ljava/math/BigInteger;
    move-object v3, v4

    .line 485
    move-object v4, v5

    .line 469
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 465
    .end local v0    # "i":I
    .end local v2    # "s":Ljava/math/BigInteger;
    .end local v3    # "u0":Ljava/math/BigInteger;
    .end local v4    # "u1":Ljava/math/BigInteger;
    .end local v5    # "u2":Ljava/math/BigInteger;
    :cond_2b
    sget-object v3, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    .line 466
    .restart local v3    # "u0":Ljava/math/BigInteger;
    sget-object v4, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    .restart local v4    # "u1":Ljava/math/BigInteger;
    goto :goto_17

    .line 480
    .restart local v0    # "i":I
    .restart local v2    # "s":Ljava/math/BigInteger;
    :cond_30
    invoke-virtual {v4}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v2

    goto :goto_1e

    .line 490
    .end local v2    # "s":Ljava/math/BigInteger;
    :cond_35
    const/4 v6, 0x2

    new-array v1, v6, [Ljava/math/BigInteger;

    const/4 v6, 0x0

    aput-object v3, v1, v6

    aput-object v4, v1, v8

    .line 491
    .local v1, "retVal":[Ljava/math/BigInteger;
    return-object v1
.end method

.method public static getMu(I)B
    .registers 2
    .param p0, "curveA"    # I

    .prologue
    .line 430
    if-nez p0, :cond_5

    const/4 v0, -0x1

    :goto_3
    int-to-byte v0, v0

    return v0

    :cond_5
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static getMu(Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;)B
    .registers 3
    .param p0, "curve"    # Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .prologue
    .line 410
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->isKoblitz()Z

    move-result v0

    if-nez v0, :cond_e

    .line 412
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No Koblitz curve (ABC), TNAF multiplication not possible"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 415
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 417
    const/4 v0, -0x1

    .line 420
    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x1

    goto :goto_19
.end method

.method public static getMu(Lorg/spongycastle/math/ec/ECFieldElement;)B
    .registers 2
    .param p0, "curveA"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 425
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, -0x1

    :goto_7
    int-to-byte v0, v0

    return v0

    :cond_9
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public static getPreComp(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;B)[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .registers 8
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .param p1, "a"    # B

    .prologue
    .line 834
    if-nez p1, :cond_1f

    sget-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha0Tnaf:[[B

    .line 836
    .local v0, "alphaTnaf":[[B
    :goto_4
    array-length v4, v0

    add-int/lit8 v4, v4, 0x1

    ushr-int/lit8 v4, v4, 0x1

    new-array v3, v4, [Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 837
    .local v3, "pu":[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    const/4 v4, 0x0

    aput-object p0, v3, v4

    .line 839
    array-length v2, v0

    .line 840
    .local v2, "precompLen":I
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_10
    if-ge v1, v2, :cond_22

    .line 842
    ushr-int/lit8 v4, v1, 0x1

    aget-object v5, v0, v1

    invoke-static {p0, v5}, Lorg/spongycastle/math/ec/Tnaf;->multiplyFromTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;[B)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v5

    aput-object v5, v3, v4

    .line 840
    add-int/lit8 v1, v1, 0x2

    goto :goto_10

    .line 834
    .end local v0    # "alphaTnaf":[[B
    .end local v1    # "i":I
    .end local v2    # "precompLen":I
    .end local v3    # "pu":[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    :cond_1f
    sget-object v0, Lorg/spongycastle/math/ec/Tnaf;->alpha1Tnaf:[[B

    goto :goto_4

    .line 845
    .restart local v0    # "alphaTnaf":[[B
    .restart local v1    # "i":I
    .restart local v2    # "precompLen":I
    .restart local v3    # "pu":[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    :cond_22
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/spongycastle/math/ec/ECCurve;->normalizeAll([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 847
    return-object v3
.end method

.method protected static getShiftsForCofactor(Ljava/math/BigInteger;)I
    .registers 3
    .param p0, "h"    # Ljava/math/BigInteger;

    .prologue
    .line 583
    if-eqz p0, :cond_16

    .line 585
    sget-object v0, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 587
    const/4 v0, 0x1

    .line 591
    :goto_b
    return v0

    .line 589
    :cond_c
    sget-object v0, Lorg/spongycastle/math/ec/ECConstants;->FOUR:Ljava/math/BigInteger;

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 591
    const/4 v0, 0x2

    goto :goto_b

    .line 595
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "h (Cofactor) must be 2 or 4"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getSi(IILjava/math/BigInteger;)[Ljava/math/BigInteger;
    .registers 13
    .param p0, "fieldSize"    # I
    .param p1, "curveA"    # I
    .param p2, "cofactor"    # Ljava/math/BigInteger;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 565
    invoke-static {p1}, Lorg/spongycastle/math/ec/Tnaf;->getMu(I)B

    move-result v3

    .line 566
    .local v3, "mu":B
    invoke-static {p2}, Lorg/spongycastle/math/ec/Tnaf;->getShiftsForCofactor(Ljava/math/BigInteger;)I

    move-result v4

    .line 567
    .local v4, "shifts":I
    add-int/lit8 v6, p0, 0x3

    sub-int v2, v6, p1

    .line 568
    .local v2, "index":I
    invoke-static {v3, v2, v8}, Lorg/spongycastle/math/ec/Tnaf;->getLucas(BIZ)[Ljava/math/BigInteger;

    move-result-object v5

    .line 569
    .local v5, "ui":[Ljava/math/BigInteger;
    if-ne v3, v9, :cond_24

    .line 571
    aget-object v6, v5, v8

    invoke-virtual {v6}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v6

    aput-object v6, v5, v8

    .line 572
    aget-object v6, v5, v9

    invoke-virtual {v6}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v6

    aput-object v6, v5, v9

    .line 575
    :cond_24
    sget-object v6, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    aget-object v7, v5, v9

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 576
    .local v0, "dividend0":Ljava/math/BigInteger;
    sget-object v6, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    aget-object v7, v5, v8

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v1

    .line 578
    .local v1, "dividend1":Ljava/math/BigInteger;
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/math/BigInteger;

    aput-object v0, v6, v8

    aput-object v1, v6, v9

    return-object v6
.end method

.method public static getSi(Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;)[Ljava/math/BigInteger;
    .registers 13
    .param p0, "curve"    # Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 540
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->isKoblitz()Z

    move-result v8

    if-nez v8, :cond_10

    .line 542
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "si is defined for Koblitz curves only"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 545
    :cond_10
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getFieldSize()I

    move-result v4

    .line 546
    .local v4, "m":I
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v8

    invoke-virtual {v8}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    .line 547
    .local v0, "a":I
    invoke-static {v0}, Lorg/spongycastle/math/ec/Tnaf;->getMu(I)B

    move-result v5

    .line 548
    .local v5, "mu":B
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getCofactor()Ljava/math/BigInteger;

    move-result-object v8

    invoke-static {v8}, Lorg/spongycastle/math/ec/Tnaf;->getShiftsForCofactor(Ljava/math/BigInteger;)I

    move-result v6

    .line 549
    .local v6, "shifts":I
    add-int/lit8 v8, v4, 0x3

    sub-int v3, v8, v0

    .line 550
    .local v3, "index":I
    invoke-static {v5, v3, v10}, Lorg/spongycastle/math/ec/Tnaf;->getLucas(BIZ)[Ljava/math/BigInteger;

    move-result-object v7

    .line 551
    .local v7, "ui":[Ljava/math/BigInteger;
    if-ne v5, v11, :cond_46

    .line 553
    aget-object v8, v7, v10

    invoke-virtual {v8}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v8

    aput-object v8, v7, v10

    .line 554
    aget-object v8, v7, v11

    invoke-virtual {v8}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v8

    aput-object v8, v7, v11

    .line 557
    :cond_46
    sget-object v8, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    aget-object v9, v7, v11

    invoke-virtual {v8, v9}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v1

    .line 558
    .local v1, "dividend0":Ljava/math/BigInteger;
    sget-object v8, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    aget-object v9, v7, v10

    invoke-virtual {v8, v9}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v2

    .line 560
    .local v2, "dividend1":Ljava/math/BigInteger;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/math/BigInteger;

    aput-object v1, v8, v10

    aput-object v2, v8, v11

    return-object v8
.end method

.method public static getTw(BI)Ljava/math/BigInteger;
    .registers 9
    .param p0, "mu"    # B
    .param p1, "w"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 504
    const/4 v4, 0x4

    if-ne p1, v4, :cond_15

    .line 506
    if-ne p0, v6, :cond_e

    .line 508
    const-wide/16 v4, 0x6

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 526
    :goto_d
    return-object v0

    .line 513
    :cond_e
    const-wide/16 v4, 0xa

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_d

    .line 519
    :cond_15
    invoke-static {p0, p1, v5}, Lorg/spongycastle/math/ec/Tnaf;->getLucas(BIZ)[Ljava/math/BigInteger;

    move-result-object v3

    .line 520
    .local v3, "us":[Ljava/math/BigInteger;
    sget-object v4, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v4, p1}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v1

    .line 521
    .local v1, "twoToW":Ljava/math/BigInteger;
    aget-object v4, v3, v6

    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 523
    .local v2, "u1invert":Ljava/math/BigInteger;
    sget-object v4, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    aget-object v5, v3, v5

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 526
    .local v0, "tw":Ljava/math/BigInteger;
    goto :goto_d
.end method

.method public static multiplyFromTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;[B)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .registers 10
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .param p1, "u"    # [B

    .prologue
    .line 697
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    .line 698
    .local v0, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 699
    .local v3, "q":Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->negate()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 700
    .local v2, "pNeg":Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    const/4 v4, 0x0

    .line 701
    .local v4, "tauCount":I
    array-length v7, p1

    add-int/lit8 v1, v7, -0x1

    .local v1, "i":I
    :goto_14
    if-ltz v1, :cond_2f

    .line 703
    add-int/lit8 v4, v4, 0x1

    .line 704
    aget-byte v5, p1, v1

    .line 705
    .local v5, "ui":B
    if-eqz v5, :cond_2a

    .line 707
    invoke-virtual {v3, v4}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->tauPow(I)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v3

    .line 708
    const/4 v4, 0x0

    .line 710
    if-lez v5, :cond_2d

    move-object v6, p0

    .line 711
    .local v6, "x":Lorg/spongycastle/math/ec/ECPoint;
    :goto_24
    invoke-virtual {v3, v6}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    .end local v3    # "q":Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    check-cast v3, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 701
    .end local v6    # "x":Lorg/spongycastle/math/ec/ECPoint;
    .restart local v3    # "q":Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    :cond_2a
    add-int/lit8 v1, v1, -0x1

    goto :goto_14

    :cond_2d
    move-object v6, v2

    .line 710
    goto :goto_24

    .line 714
    .end local v5    # "ui":B
    :cond_2f
    if-lez v4, :cond_35

    .line 716
    invoke-virtual {v3, v4}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->tauPow(I)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v3

    .line 718
    :cond_35
    return-object v3
.end method

.method public static multiplyRTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .registers 11
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .param p1, "k"    # Ljava/math/BigInteger;

    .prologue
    .line 656
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .line 657
    .local v7, "curve":Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getFieldSize()I

    move-result v1

    .line 658
    .local v1, "m":I
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    .line 659
    .local v6, "a":I
    invoke-static {v6}, Lorg/spongycastle/math/ec/Tnaf;->getMu(I)B

    move-result v4

    .line 660
    .local v4, "mu":B
    invoke-virtual {v7}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getSi()[Ljava/math/BigInteger;

    move-result-object v3

    .line 661
    .local v3, "s":[Ljava/math/BigInteger;
    int-to-byte v2, v6

    const/16 v5, 0xa

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/Tnaf;->partModReduction(Ljava/math/BigInteger;IB[Ljava/math/BigInteger;BB)Lorg/spongycastle/math/ec/ZTauElement;

    move-result-object v8

    .line 663
    .local v8, "rho":Lorg/spongycastle/math/ec/ZTauElement;
    invoke-static {p0, v8}, Lorg/spongycastle/math/ec/Tnaf;->multiplyTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;Lorg/spongycastle/math/ec/ZTauElement;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v0

    return-object v0
.end method

.method public static multiplyTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;Lorg/spongycastle/math/ec/ZTauElement;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .registers 7
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .param p1, "lambda"    # Lorg/spongycastle/math/ec/ZTauElement;

    .prologue
    .line 677
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .line 678
    .local v0, "curve":Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/math/ec/Tnaf;->getMu(Lorg/spongycastle/math/ec/ECFieldElement;)B

    move-result v1

    .line 679
    .local v1, "mu":B
    invoke-static {v1, p1}, Lorg/spongycastle/math/ec/Tnaf;->tauAdicNaf(BLorg/spongycastle/math/ec/ZTauElement;)[B

    move-result-object v3

    .line 681
    .local v3, "u":[B
    invoke-static {p0, v3}, Lorg/spongycastle/math/ec/Tnaf;->multiplyFromTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;[B)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v2

    .line 683
    .local v2, "q":Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    return-object v2
.end method

.method public static norm(BLorg/spongycastle/math/ec/ZTauElement;)Ljava/math/BigInteger;
    .registers 9
    .param p0, "mu"    # B
    .param p1, "lambda"    # Lorg/spongycastle/math/ec/ZTauElement;

    .prologue
    const/4 v6, 0x1

    .line 87
    iget-object v4, p1, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    iget-object v5, p1, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 90
    .local v1, "s1":Ljava/math/BigInteger;
    iget-object v4, p1, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    iget-object v5, p1, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 93
    .local v2, "s2":Ljava/math/BigInteger;
    iget-object v4, p1, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    iget-object v5, p1, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 95
    .local v3, "s3":Ljava/math/BigInteger;
    if-ne p0, v6, :cond_28

    .line 97
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 108
    .local v0, "norm":Ljava/math/BigInteger;
    :goto_27
    return-object v0

    .line 99
    .end local v0    # "norm":Ljava/math/BigInteger;
    :cond_28
    const/4 v4, -0x1

    if-ne p0, v4, :cond_34

    .line 101
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .restart local v0    # "norm":Ljava/math/BigInteger;
    goto :goto_27

    .line 105
    .end local v0    # "norm":Ljava/math/BigInteger;
    :cond_34
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "mu must be 1 or -1"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static norm(BLorg/spongycastle/math/ec/SimpleBigDecimal;Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .registers 9
    .param p0, "mu"    # B
    .param p1, "u"    # Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .param p2, "v"    # Lorg/spongycastle/math/ec/SimpleBigDecimal;

    .prologue
    const/4 v5, 0x1

    .line 129
    invoke-virtual {p1, p1}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->multiply(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v1

    .line 132
    .local v1, "s1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {p1, p2}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->multiply(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v2

    .line 135
    .local v2, "s2":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {p2, p2}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->multiply(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v4

    invoke-virtual {v4, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->shiftLeft(I)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v3

    .line 137
    .local v3, "s3":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    if-ne p0, v5, :cond_1c

    .line 139
    invoke-virtual {v1, v2}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v0

    .line 150
    .local v0, "norm":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :goto_1b
    return-object v0

    .line 141
    .end local v0    # "norm":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :cond_1c
    const/4 v4, -0x1

    if-ne p0, v4, :cond_28

    .line 143
    invoke-virtual {v1, v2}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v0

    .restart local v0    # "norm":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    goto :goto_1b

    .line 147
    .end local v0    # "norm":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :cond_28
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "mu must be 1 or -1"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static partModReduction(Ljava/math/BigInteger;IB[Ljava/math/BigInteger;BB)Lorg/spongycastle/math/ec/ZTauElement;
    .registers 20
    .param p0, "k"    # Ljava/math/BigInteger;
    .param p1, "m"    # I
    .param p2, "a"    # B
    .param p3, "s"    # [Ljava/math/BigInteger;
    .param p4, "mu"    # B
    .param p5, "c"    # B

    .prologue
    .line 616
    const/4 v1, 0x1

    move/from16 v0, p4

    if-ne v0, v1, :cond_76

    .line 618
    const/4 v1, 0x0

    aget-object v1, p3, v1

    const/4 v2, 0x1

    aget-object v2, p3, v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 625
    .local v7, "d0":Ljava/math/BigInteger;
    :goto_f
    const/4 v1, 0x1

    move/from16 v0, p4

    invoke-static {v0, p1, v1}, Lorg/spongycastle/math/ec/Tnaf;->getLucas(BIZ)[Ljava/math/BigInteger;

    move-result-object v13

    .line 626
    .local v13, "v":[Ljava/math/BigInteger;
    const/4 v1, 0x1

    aget-object v3, v13, v1

    .line 628
    .local v3, "vm":Ljava/math/BigInteger;
    const/4 v1, 0x0

    aget-object v2, p3, v1

    move-object v1, p0

    move/from16 v4, p2

    move v5, p1

    move/from16 v6, p5

    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/ec/Tnaf;->approximateDivisionByN(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;BII)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v8

    .line 631
    .local v8, "lambda0":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    const/4 v1, 0x1

    aget-object v2, p3, v1

    move-object v1, p0

    move/from16 v4, p2

    move v5, p1

    move/from16 v6, p5

    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/ec/Tnaf;->approximateDivisionByN(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;BII)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v9

    .line 634
    .local v9, "lambda1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    move/from16 v0, p4

    invoke-static {v8, v9, v0}, Lorg/spongycastle/math/ec/Tnaf;->round(Lorg/spongycastle/math/ec/SimpleBigDecimal;Lorg/spongycastle/math/ec/SimpleBigDecimal;B)Lorg/spongycastle/math/ec/ZTauElement;

    move-result-object v10

    .line 637
    .local v10, "q":Lorg/spongycastle/math/ec/ZTauElement;
    iget-object v1, v10, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    invoke-virtual {v7, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    const-wide/16 v4, 0x2

    .line 638
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    const/4 v4, 0x1

    aget-object v4, p3, v4

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iget-object v4, v10, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 637
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    .line 641
    .local v11, "r0":Ljava/math/BigInteger;
    const/4 v1, 0x1

    aget-object v1, p3, v1

    iget-object v2, v10, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p3, v2

    iget-object v4, v10, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 643
    .local v12, "r1":Ljava/math/BigInteger;
    new-instance v1, Lorg/spongycastle/math/ec/ZTauElement;

    invoke-direct {v1, v11, v12}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v1

    .line 622
    .end local v3    # "vm":Ljava/math/BigInteger;
    .end local v7    # "d0":Ljava/math/BigInteger;
    .end local v8    # "lambda0":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .end local v9    # "lambda1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .end local v10    # "q":Lorg/spongycastle/math/ec/ZTauElement;
    .end local v11    # "r0":Ljava/math/BigInteger;
    .end local v12    # "r1":Ljava/math/BigInteger;
    .end local v13    # "v":[Ljava/math/BigInteger;
    :cond_76
    const/4 v1, 0x0

    aget-object v1, p3, v1

    const/4 v2, 0x1

    aget-object v2, p3, v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .restart local v7    # "d0":Ljava/math/BigInteger;
    goto :goto_f
.end method

.method public static round(Lorg/spongycastle/math/ec/SimpleBigDecimal;Lorg/spongycastle/math/ec/SimpleBigDecimal;B)Lorg/spongycastle/math/ec/ZTauElement;
    .registers 20
    .param p0, "lambda0"    # Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .param p1, "lambda1"    # Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .param p2, "mu"    # B

    .prologue
    .line 169
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->getScale()I

    move-result v13

    .line 170
    .local v13, "scale":I
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->getScale()I

    move-result v15

    if-eq v15, v13, :cond_12

    .line 172
    new-instance v15, Ljava/lang/IllegalArgumentException;

    const-string v16, "lambda0 and lambda1 do not have same scale"

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 176
    :cond_12
    const/4 v15, 0x1

    move/from16 v0, p2

    if-eq v0, v15, :cond_24

    const/4 v15, -0x1

    move/from16 v0, p2

    if-eq v0, v15, :cond_24

    .line 178
    new-instance v15, Ljava/lang/IllegalArgumentException;

    const-string v16, "mu must be 1 or -1"

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 181
    :cond_24
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->round()Ljava/math/BigInteger;

    move-result-object v6

    .line 182
    .local v6, "f0":Ljava/math/BigInteger;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->round()Ljava/math/BigInteger;

    move-result-object v7

    .line 184
    .local v7, "f1":Ljava/math/BigInteger;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v4

    .line 185
    .local v4, "eta0":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v5

    .line 188
    .local v5, "eta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {v4, v4}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v3

    .line 189
    .local v3, "eta":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    const/4 v15, 0x1

    move/from16 v0, p2

    if-ne v0, v15, :cond_9e

    .line 191
    invoke-virtual {v3, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v3

    .line 201
    :goto_45
    invoke-virtual {v5, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v15

    invoke-virtual {v15, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v14

    .line 202
    .local v14, "threeEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {v14, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v8

    .line 205
    .local v8, "fourEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    const/4 v15, 0x1

    move/from16 v0, p2

    if-ne v0, v15, :cond_a3

    .line 207
    invoke-virtual {v4, v14}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v1

    .line 208
    .local v1, "check1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {v4, v8}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v2

    .line 217
    .local v2, "check2":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :goto_5e
    const/4 v9, 0x0

    .line 218
    .local v9, "h0":B
    const/4 v10, 0x0

    .line 221
    .local v10, "h1":B
    sget-object v15, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v3, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-ltz v15, :cond_ae

    .line 223
    sget-object v15, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-gez v15, :cond_ac

    .line 225
    move/from16 v10, p2

    .line 242
    :cond_72
    :goto_72
    sget-object v15, Lorg/spongycastle/math/ec/Tnaf;->MINUS_ONE:Ljava/math/BigInteger;

    invoke-virtual {v3, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-gez v15, :cond_bb

    .line 244
    sget-object v15, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-ltz v15, :cond_b9

    .line 246
    move/from16 v0, p2

    neg-int v15, v0

    int-to-byte v10, v15

    .line 262
    :cond_86
    :goto_86
    int-to-long v15, v9

    invoke-static/range {v15 .. v16}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    .line 263
    .local v11, "q0":Ljava/math/BigInteger;
    int-to-long v15, v10

    invoke-static/range {v15 .. v16}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v15

    invoke-virtual {v7, v15}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 264
    .local v12, "q1":Ljava/math/BigInteger;
    new-instance v15, Lorg/spongycastle/math/ec/ZTauElement;

    invoke-direct {v15, v11, v12}, Lorg/spongycastle/math/ec/ZTauElement;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v15

    .line 196
    .end local v1    # "check1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .end local v2    # "check2":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .end local v8    # "fourEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .end local v9    # "h0":B
    .end local v10    # "h1":B
    .end local v11    # "q0":Ljava/math/BigInteger;
    .end local v12    # "q1":Ljava/math/BigInteger;
    .end local v14    # "threeEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :cond_9e
    invoke-virtual {v3, v5}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v3

    goto :goto_45

    .line 213
    .restart local v8    # "fourEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    .restart local v14    # "threeEta1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    :cond_a3
    invoke-virtual {v4, v14}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->add(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v1

    .line 214
    .restart local v1    # "check1":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    invoke-virtual {v4, v8}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->subtract(Lorg/spongycastle/math/ec/SimpleBigDecimal;)Lorg/spongycastle/math/ec/SimpleBigDecimal;

    move-result-object v2

    .restart local v2    # "check2":Lorg/spongycastle/math/ec/SimpleBigDecimal;
    goto :goto_5e

    .line 229
    .restart local v9    # "h0":B
    .restart local v10    # "h1":B
    :cond_ac
    const/4 v9, 0x1

    goto :goto_72

    .line 235
    :cond_ae
    sget-object v15, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v2, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-ltz v15, :cond_72

    .line 237
    move/from16 v10, p2

    goto :goto_72

    .line 250
    :cond_b9
    const/4 v9, -0x1

    goto :goto_86

    .line 256
    :cond_bb
    sget-object v15, Lorg/spongycastle/math/ec/Tnaf;->MINUS_TWO:Ljava/math/BigInteger;

    invoke-virtual {v2, v15}, Lorg/spongycastle/math/ec/SimpleBigDecimal;->compareTo(Ljava/math/BigInteger;)I

    move-result v15

    if-gez v15, :cond_86

    .line 258
    move/from16 v0, p2

    neg-int v15, v0

    int-to-byte v10, v15

    goto :goto_86
.end method

.method public static tau(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .registers 2
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .prologue
    .line 395
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->tau()Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    move-result-object v0

    return-object v0
.end method

.method public static tauAdicNaf(BLorg/spongycastle/math/ec/ZTauElement;)[B
    .registers 16
    .param p0, "mu"    # B
    .param p1, "lambda"    # Lorg/spongycastle/math/ec/ZTauElement;

    .prologue
    .line 316
    const/4 v11, 0x1

    if-eq p0, v11, :cond_e

    const/4 v11, -0x1

    if-eq p0, v11, :cond_e

    .line 318
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "mu must be 1 or -1"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 321
    :cond_e
    invoke-static {p0, p1}, Lorg/spongycastle/math/ec/Tnaf;->norm(BLorg/spongycastle/math/ec/ZTauElement;)Ljava/math/BigInteger;

    move-result-object v4

    .line 324
    .local v4, "norm":Ljava/math/BigInteger;
    invoke-virtual {v4}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    .line 327
    .local v2, "log2Norm":I
    const/16 v11, 0x1e

    if-le v2, v11, :cond_7b

    add-int/lit8 v3, v2, 0x4

    .line 330
    .local v3, "maxLength":I
    :goto_1c
    new-array v10, v3, [B

    .line 331
    .local v10, "u":[B
    const/4 v0, 0x0

    .line 334
    .local v0, "i":I
    const/4 v1, 0x0

    .line 336
    .local v1, "length":I
    iget-object v5, p1, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    .line 337
    .local v5, "r0":Ljava/math/BigInteger;
    iget-object v6, p1, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    .line 339
    .local v6, "r1":Ljava/math/BigInteger;
    :goto_24
    sget-object v11, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_34

    sget-object v11, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v6, v11}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_8e

    .line 342
    :cond_34
    const/4 v11, 0x0

    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v11

    if-eqz v11, :cond_85

    .line 344
    sget-object v11, Lorg/spongycastle/math/ec/ECConstants;->TWO:Ljava/math/BigInteger;

    const/4 v12, 0x1

    invoke-virtual {v6, v12}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    sget-object v13, Lorg/spongycastle/math/ec/ECConstants;->FOUR:Ljava/math/BigInteger;

    invoke-virtual {v12, v13}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    invoke-virtual {v11}, Ljava/math/BigInteger;->intValue()I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v10, v0

    .line 347
    aget-byte v11, v10, v0

    const/4 v12, 0x1

    if-ne v11, v12, :cond_7e

    .line 349
    const/4 v11, 0x0

    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->clearBit(I)Ljava/math/BigInteger;

    move-result-object v5

    .line 356
    :goto_61
    move v1, v0

    .line 363
    :goto_62
    move-object v8, v5

    .line 364
    .local v8, "t":Ljava/math/BigInteger;
    const/4 v11, 0x1

    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v7

    .line 365
    .local v7, "s":Ljava/math/BigInteger;
    const/4 v11, 0x1

    if-ne p0, v11, :cond_89

    .line 367
    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 375
    :goto_6f
    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v11

    invoke-virtual {v11}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v6

    .line 376
    add-int/lit8 v0, v0, 0x1

    .line 377
    goto :goto_24

    .line 327
    .end local v0    # "i":I
    .end local v1    # "length":I
    .end local v3    # "maxLength":I
    .end local v5    # "r0":Ljava/math/BigInteger;
    .end local v6    # "r1":Ljava/math/BigInteger;
    .end local v7    # "s":Ljava/math/BigInteger;
    .end local v8    # "t":Ljava/math/BigInteger;
    .end local v10    # "u":[B
    :cond_7b
    const/16 v3, 0x22

    goto :goto_1c

    .line 354
    .restart local v0    # "i":I
    .restart local v1    # "length":I
    .restart local v3    # "maxLength":I
    .restart local v5    # "r0":Ljava/math/BigInteger;
    .restart local v6    # "r1":Ljava/math/BigInteger;
    .restart local v10    # "u":[B
    :cond_7e
    sget-object v11, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v5, v11}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    goto :goto_61

    .line 360
    :cond_85
    const/4 v11, 0x0

    aput-byte v11, v10, v0

    goto :goto_62

    .line 372
    .restart local v7    # "s":Ljava/math/BigInteger;
    .restart local v8    # "t":Ljava/math/BigInteger;
    :cond_89
    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    goto :goto_6f

    .line 379
    .end local v7    # "s":Ljava/math/BigInteger;
    .end local v8    # "t":Ljava/math/BigInteger;
    :cond_8e
    add-int/lit8 v1, v1, 0x1

    .line 382
    new-array v9, v1, [B

    .line 383
    .local v9, "tnaf":[B
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v10, v11, v9, v12, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 384
    return-object v9
.end method

.method public static tauAdicWNaf(BLorg/spongycastle/math/ec/ZTauElement;BLjava/math/BigInteger;Ljava/math/BigInteger;[Lorg/spongycastle/math/ec/ZTauElement;)[B
    .registers 21
    .param p0, "mu"    # B
    .param p1, "lambda"    # Lorg/spongycastle/math/ec/ZTauElement;
    .param p2, "width"    # B
    .param p3, "pow2w"    # Ljava/math/BigInteger;
    .param p4, "tw"    # Ljava/math/BigInteger;
    .param p5, "alpha"    # [Lorg/spongycastle/math/ec/ZTauElement;

    .prologue
    .line 738
    const/4 v13, 0x1

    if-eq p0, v13, :cond_e

    const/4 v13, -0x1

    if-eq p0, v13, :cond_e

    .line 740
    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "mu must be 1 or -1"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 743
    :cond_e
    invoke-static/range {p0 .. p1}, Lorg/spongycastle/math/ec/Tnaf;->norm(BLorg/spongycastle/math/ec/ZTauElement;)Ljava/math/BigInteger;

    move-result-object v4

    .line 746
    .local v4, "norm":Ljava/math/BigInteger;
    invoke-virtual {v4}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    .line 749
    .local v2, "log2Norm":I
    const/16 v13, 0x1e

    if-le v2, v13, :cond_9b

    add-int/lit8 v13, v2, 0x4

    add-int v3, v13, p2

    .line 752
    .local v3, "maxLength":I
    :goto_1e
    new-array v10, v3, [B

    .line 755
    .local v10, "u":[B
    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v5

    .line 758
    .local v5, "pow2wMin1":Ljava/math/BigInteger;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    .line 759
    .local v6, "r0":Ljava/math/BigInteger;
    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    .line 760
    .local v7, "r1":Ljava/math/BigInteger;
    const/4 v1, 0x0

    .line 763
    .local v1, "i":I
    :goto_30
    sget-object v13, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_40

    sget-object v13, Lorg/spongycastle/math/ec/ECConstants;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v7, v13}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_c3

    .line 766
    :cond_40
    const/4 v13, 0x0

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v13

    if-eqz v13, :cond_b5

    .line 770
    move-object/from16 v0, p4

    invoke-virtual {v7, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 774
    .local v12, "uUnMod":Ljava/math/BigInteger;
    invoke-virtual {v12, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v13

    if-ltz v13, :cond_9e

    .line 776
    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v13}, Ljava/math/BigInteger;->intValue()I

    move-result v13

    int-to-byte v11, v13

    .line 784
    .local v11, "uLocal":B
    :goto_68
    aput-byte v11, v10, v1

    .line 785
    const/4 v8, 0x1

    .line 786
    .local v8, "s":Z
    if-gez v11, :cond_70

    .line 788
    const/4 v8, 0x0

    .line 789
    neg-int v13, v11

    int-to-byte v11, v13

    .line 793
    :cond_70
    if-eqz v8, :cond_a4

    .line 795
    aget-object v13, p5, v11

    iget-object v13, v13, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 796
    aget-object v13, p5, v11

    iget-object v13, v13, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v7, v13}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 809
    .end local v8    # "s":Z
    .end local v11    # "uLocal":B
    .end local v12    # "uUnMod":Ljava/math/BigInteger;
    :goto_82
    move-object v9, v6

    .line 811
    .local v9, "t":Ljava/math/BigInteger;
    const/4 v13, 0x1

    if-ne p0, v13, :cond_b9

    .line 813
    const/4 v13, 0x1

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 820
    :goto_8f
    const/4 v13, 0x1

    invoke-virtual {v9, v13}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v13}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v7

    .line 821
    add-int/lit8 v1, v1, 0x1

    .line 822
    goto :goto_30

    .line 749
    .end local v1    # "i":I
    .end local v3    # "maxLength":I
    .end local v5    # "pow2wMin1":Ljava/math/BigInteger;
    .end local v6    # "r0":Ljava/math/BigInteger;
    .end local v7    # "r1":Ljava/math/BigInteger;
    .end local v9    # "t":Ljava/math/BigInteger;
    .end local v10    # "u":[B
    :cond_9b
    add-int/lit8 v3, p2, 0x22

    goto :goto_1e

    .line 780
    .restart local v1    # "i":I
    .restart local v3    # "maxLength":I
    .restart local v5    # "pow2wMin1":Ljava/math/BigInteger;
    .restart local v6    # "r0":Ljava/math/BigInteger;
    .restart local v7    # "r1":Ljava/math/BigInteger;
    .restart local v10    # "u":[B
    .restart local v12    # "uUnMod":Ljava/math/BigInteger;
    :cond_9e
    invoke-virtual {v12}, Ljava/math/BigInteger;->intValue()I

    move-result v13

    int-to-byte v11, v13

    .restart local v11    # "uLocal":B
    goto :goto_68

    .line 800
    .restart local v8    # "s":Z
    :cond_a4
    aget-object v13, p5, v11

    iget-object v13, v13, Lorg/spongycastle/math/ec/ZTauElement;->u:Ljava/math/BigInteger;

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 801
    aget-object v13, p5, v11

    iget-object v13, v13, Lorg/spongycastle/math/ec/ZTauElement;->v:Ljava/math/BigInteger;

    invoke-virtual {v7, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_82

    .line 806
    .end local v8    # "s":Z
    .end local v11    # "uLocal":B
    .end local v12    # "uUnMod":Ljava/math/BigInteger;
    :cond_b5
    const/4 v13, 0x0

    aput-byte v13, v10, v1

    goto :goto_82

    .line 818
    .restart local v9    # "t":Ljava/math/BigInteger;
    :cond_b9
    const/4 v13, 0x1

    invoke-virtual {v6, v13}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto :goto_8f

    .line 823
    .end local v9    # "t":Ljava/math/BigInteger;
    :cond_c3
    return-object v10
.end method
