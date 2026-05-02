.class public Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;
.super Lorg/spongycastle/crypto/params/ElGamalKeyParameters;
.source "ElGamalPublicKeyParameters.java"


# instance fields
.field private y:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/ElGamalParameters;)V
    .registers 4
    .param p1, "y"    # Ljava/math/BigInteger;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ElGamalParameters;

    .prologue
    .line 14
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/crypto/params/ElGamalKeyParameters;-><init>(ZLorg/spongycastle/crypto/params/ElGamalParameters;)V

    .line 16
    iput-object p1, p0, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;->y:Ljava/math/BigInteger;

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 32
    instance-of v2, p1, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;

    if-nez v2, :cond_6

    .line 39
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 37
    check-cast v0, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;

    .line 39
    .local v0, "other":Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;->getY()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;->y:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-super {p0, p1}, Lorg/spongycastle/crypto/params/ElGamalKeyParameters;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getY()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;->y:Ljava/math/BigInteger;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 26
    iget-object v0, p0, Lorg/spongycastle/crypto/params/ElGamalPublicKeyParameters;->y:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    invoke-super {p0}, Lorg/spongycastle/crypto/params/ElGamalKeyParameters;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
