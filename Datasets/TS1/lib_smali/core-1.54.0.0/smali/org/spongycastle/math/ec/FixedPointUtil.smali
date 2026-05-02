.class public Lorg/spongycastle/math/ec/FixedPointUtil;
.super Ljava/lang/Object;
.source "FixedPointUtil.java"


# static fields
.field public static final PRECOMP_NAME:Ljava/lang/String; = "bc_fixed_point"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCombSize(Lorg/spongycastle/math/ec/ECCurve;)I
    .registers 3
    .param p0, "c"    # Lorg/spongycastle/math/ec/ECCurve;

    .prologue
    .line 11
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getOrder()Ljava/math/BigInteger;

    move-result-object v0

    .line 12
    .local v0, "order":Ljava/math/BigInteger;
    if-nez v0, :cond_d

    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    :goto_c
    return v1

    :cond_d
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    goto :goto_c
.end method

.method public static getFixedPointPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/FixedPointPreCompInfo;
    .registers 2
    .param p0, "preCompInfo"    # Lorg/spongycastle/math/ec/PreCompInfo;

    .prologue
    .line 17
    if-eqz p0, :cond_9

    instance-of v0, p0, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;

    if-eqz v0, :cond_9

    .line 19
    check-cast p0, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;

    .line 22
    .end local p0    # "preCompInfo":Lorg/spongycastle/math/ec/PreCompInfo;
    :goto_8
    return-object p0

    .restart local p0    # "preCompInfo":Lorg/spongycastle/math/ec/PreCompInfo;
    :cond_9
    new-instance p0, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;

    .end local p0    # "preCompInfo":Lorg/spongycastle/math/ec/PreCompInfo;
    invoke-direct {p0}, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;-><init>()V

    goto :goto_8
.end method

.method public static precompute(Lorg/spongycastle/math/ec/ECPoint;I)Lorg/spongycastle/math/ec/FixedPointPreCompInfo;
    .registers 16
    .param p0, "p"    # Lorg/spongycastle/math/ec/ECPoint;
    .param p1, "minWidth"    # I

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 27
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    .line 29
    .local v2, "c":Lorg/spongycastle/math/ec/ECCurve;
    shl-int v7, v13, p1

    .line 30
    .local v7, "n":I
    const-string v11, "bc_fixed_point"

    invoke-virtual {v2, p0, v11}, Lorg/spongycastle/math/ec/ECCurve;->getPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;)Lorg/spongycastle/math/ec/PreCompInfo;

    move-result-object v11

    invoke-static {v11}, Lorg/spongycastle/math/ec/FixedPointUtil;->getFixedPointPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/FixedPointPreCompInfo;

    move-result-object v5

    .line 31
    .local v5, "info":Lorg/spongycastle/math/ec/FixedPointPreCompInfo;
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;->getPreComp()[Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v6

    .line 33
    .local v6, "lookupTable":[Lorg/spongycastle/math/ec/ECPoint;
    if-eqz v6, :cond_1b

    array-length v11, v6

    if-ge v11, v7, :cond_6e

    .line 35
    :cond_1b
    invoke-static {v2}, Lorg/spongycastle/math/ec/FixedPointUtil;->getCombSize(Lorg/spongycastle/math/ec/ECCurve;)I

    move-result v1

    .line 36
    .local v1, "bits":I
    add-int v11, v1, p1

    add-int/lit8 v11, v11, -0x1

    div-int v3, v11, p1

    .line 38
    .local v3, "d":I
    new-array v9, p1, [Lorg/spongycastle/math/ec/ECPoint;

    .line 39
    .local v9, "pow2Table":[Lorg/spongycastle/math/ec/ECPoint;
    aput-object p0, v9, v12

    .line 40
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_2a
    if-ge v4, p1, :cond_39

    .line 42
    add-int/lit8 v11, v4, -0x1

    aget-object v11, v9, v11

    invoke-virtual {v11, v3}, Lorg/spongycastle/math/ec/ECPoint;->timesPow2(I)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v11

    aput-object v11, v9, v4

    .line 40
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 45
    :cond_39
    invoke-virtual {v2, v9}, Lorg/spongycastle/math/ec/ECCurve;->normalizeAll([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 47
    new-array v6, v7, [Lorg/spongycastle/math/ec/ECPoint;

    .line 48
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v11

    aput-object v11, v6, v12

    .line 50
    add-int/lit8 v0, p1, -0x1

    .local v0, "bit":I
    :goto_46
    if-ltz v0, :cond_60

    .line 52
    aget-object v8, v9, v0

    .line 54
    .local v8, "pow2":Lorg/spongycastle/math/ec/ECPoint;
    shl-int v10, v13, v0

    .line 55
    .local v10, "step":I
    move v4, v10

    :goto_4d
    if-ge v4, v7, :cond_5d

    .line 57
    sub-int v11, v4, v10

    aget-object v11, v6, v11

    invoke-virtual {v11, v8}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v11

    aput-object v11, v6, v4

    .line 55
    shl-int/lit8 v11, v10, 0x1

    add-int/2addr v4, v11

    goto :goto_4d

    .line 50
    :cond_5d
    add-int/lit8 v0, v0, -0x1

    goto :goto_46

    .line 61
    .end local v8    # "pow2":Lorg/spongycastle/math/ec/ECPoint;
    .end local v10    # "step":I
    :cond_60
    invoke-virtual {v2, v6}, Lorg/spongycastle/math/ec/ECCurve;->normalizeAll([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 63
    invoke-virtual {v5, v6}, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;->setPreComp([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 64
    invoke-virtual {v5, p1}, Lorg/spongycastle/math/ec/FixedPointPreCompInfo;->setWidth(I)V

    .line 66
    const-string v11, "bc_fixed_point"

    invoke-virtual {v2, p0, v11, v5}, Lorg/spongycastle/math/ec/ECCurve;->setPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;Lorg/spongycastle/math/ec/PreCompInfo;)V

    .line 69
    .end local v0    # "bit":I
    .end local v1    # "bits":I
    .end local v3    # "d":I
    .end local v4    # "i":I
    .end local v9    # "pow2Table":[Lorg/spongycastle/math/ec/ECPoint;
    :cond_6e
    return-object v5
.end method
