.class public abstract Lorg/spongycastle/math/ec/AbstractECMultiplier;
.super Ljava/lang/Object;
.source "AbstractECMultiplier.java"

# interfaces
.implements Lorg/spongycastle/math/ec/ECMultiplier;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public multiply(Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;
    .registers 7
    .param p1, "p"    # Lorg/spongycastle/math/ec/ECPoint;
    .param p2, "k"    # Ljava/math/BigInteger;

    .prologue
    .line 9
    invoke-virtual {p2}, Ljava/math/BigInteger;->signum()I

    move-result v2

    .line 10
    .local v2, "sign":I
    if-eqz v2, :cond_c

    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 12
    :cond_c
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    .line 22
    :goto_14
    return-object v3

    .line 15
    :cond_15
    invoke-virtual {p2}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lorg/spongycastle/math/ec/AbstractECMultiplier;->multiplyPositive(Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    .line 16
    .local v0, "positive":Lorg/spongycastle/math/ec/ECPoint;
    if-lez v2, :cond_25

    move-object v1, v0

    .line 22
    .local v1, "result":Lorg/spongycastle/math/ec/ECPoint;
    :goto_20
    invoke-static {v1}, Lorg/spongycastle/math/ec/ECAlgorithms;->validatePoint(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    goto :goto_14

    .line 16
    .end local v1    # "result":Lorg/spongycastle/math/ec/ECPoint;
    :cond_25
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECPoint;->negate()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v1

    goto :goto_20
.end method

.method protected abstract multiplyPositive(Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;
.end method
